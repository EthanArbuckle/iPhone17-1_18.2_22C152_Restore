@interface MKTileOverlay
- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect;
- (BOOL)canReplaceMapContent;
- (BOOL)isGeometryFlipped;
- (CGSize)tileSize;
- (CLLocationCoordinate2D)coordinate;
- (MKTileOverlay)init;
- (MKTileOverlay)initWithURLTemplate:(NSString *)URLTemplate;
- (NSInteger)maximumZ;
- (NSInteger)minimumZ;
- (NSString)URLTemplate;
- (NSURL)URLForTilePath:(MKTileOverlayPath *)path;
- (id)_tilesInMapRect:(id)a3 zoomScale:(double)a4 contentScale:(double)a5;
- (int)_zoomLevelForScale:(double)a3;
- (uint64_t)_keyForPath:(uint64_t)a3;
- (unsigned)_providerID;
- (void)_assignProviderID;
- (void)_flushCaches;
- (void)_loadTile:(uint64_t)a3 result:(void *)a4;
- (void)_minLifetimeCacheCleanupFired;
- (void)_receivedMemoryNotification;
- (void)_scheduleMinLifetimeCacheCleanupIfNecessary;
- (void)dealloc;
- (void)loadTileAtPath:(MKTileOverlayPath *)path result:(void *)result;
- (void)setCanReplaceMapContent:(BOOL)canReplaceMapContent;
- (void)setGeometryFlipped:(BOOL)geometryFlipped;
- (void)setMaximumZ:(NSInteger)maximumZ;
- (void)setMinimumZ:(NSInteger)minimumZ;
- (void)setTileSize:(CGSize)tileSize;
@end

@implementation MKTileOverlay

- (void)_assignProviderID
{
  self->_providerID = +[_MKOverlayTileRequester registerDataSource:self];
}

- (MKTileOverlay)init
{
  return [(MKTileOverlay *)self initWithURLTemplate:0];
}

- (MKTileOverlay)initWithURLTemplate:(NSString *)URLTemplate
{
  v4 = URLTemplate;
  v21.receiver = self;
  v21.super_class = (Class)MKTileOverlay;
  v5 = [(MKTileOverlay *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    [v5 _assignProviderID];
    *((int64x2_t *)v5 + 1) = vdupq_n_s64(0x4070000000000000uLL);
    v5[32] = 0;
    *(_OWORD *)(v5 + 40) = xmmword_18BD1B900;
    id v8 = objc_alloc_init(MEMORY[0x1E4F64AB0]);
    v9 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v8;

    [*((id *)v5 + 8) setMaxCapacity:512];
    [*((id *)v5 + 8) setMaxCost:0x400000];
    id v10 = objc_alloc_init(MEMORY[0x1E4F64AB0]);
    v11 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v10;

    [*((id *)v5 + 9) setMaxCapacity:-1];
    [*((id *)v5 + 9) setMaxCost:-1];
    uint64_t v12 = geo_isolater_create();
    v13 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v12;

    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, MEMORY[0x1E4F14428]);
    v15 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v14;

    objc_initWeak(&location, v5);
    v16 = *((void *)v5 + 12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__MKTileOverlay_initWithURLTemplate___block_invoke;
    v18[3] = &unk_1E54BEF78;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, v18);
    dispatch_activate(*((dispatch_object_t *)v5 + 12));
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (MKTileOverlay *)v5;
}

void __37__MKTileOverlay_initWithURLTemplate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _receivedMemoryNotification];
}

- (void)dealloc
{
  +[_MKOverlayTileRequester unregisterDataSource:self->_providerID];
  dispatch_source_cancel((dispatch_source_t)self->_memoryNotificationEventSource);
  minimumLifetimeTileCacheEvictionTimer = self->_minimumLifetimeTileCacheEvictionTimer;
  if (minimumLifetimeTileCacheEvictionTimer) {
    dispatch_source_cancel(minimumLifetimeTileCacheEvictionTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)MKTileOverlay;
  [(MKTileOverlay *)&v4 dealloc];
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double v2 = 268435456.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 268435456.0;
  result.var1.var1 = v5;
  result.var1.var0 = v2;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(0.0, 0.0);
  double longitude = v4.longitude;
  double latitude = v4.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSURL)URLForTilePath:(MKTileOverlayPath *)path
{
  CLLocationCoordinate2D v4 = (NSMutableString *)[(NSString *)self->_URLTemplate mutableCopy];
  fillTemplate(v4, &cfstr_X.isa, path->x);
  fillTemplate(v4, &cfstr_Y.isa, path->y);
  fillTemplate(v4, &cfstr_Z.isa, path->z);
  CGFloat contentScaleFactor = path->contentScaleFactor;
  uint64_t v6 = v4;
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", *(void *)&contentScaleFactor);
  [(NSMutableString *)v6 replaceOccurrencesOfString:@"{scale}", v7, 0, 0, [(NSMutableString *)v6 length] withString options range];

  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  return (NSURL *)v8;
}

- (void)loadTileAtPath:(MKTileOverlayPath *)path result:(void *)result
{
  uint64_t v6 = result;
  long long v7 = *(_OWORD *)&path->z;
  v17[0] = *(_OWORD *)&path->x;
  v17[1] = v7;
  id v8 = [(MKTileOverlay *)self URLForTilePath:v17];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v8 cachePolicy:1 timeoutInterval:120.0];
  id v10 = [MEMORY[0x1E4F290E0] sharedSession];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__MKTileOverlay_loadTileAtPath_result___block_invoke;
  v14[3] = &unk_1E54BEFA0;
  v14[4] = self;
  id v11 = v8;
  id v15 = v11;
  id v12 = v6;
  id v16 = v12;
  v13 = [v10 dataTaskWithRequest:v9 completionHandler:v14];
  [v13 resume];
}

void __39__MKTileOverlay_loadTileAtPath_result___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8) {
    NSLog(&cfstr_ErrorLoadingUr.isa, a1[4], a1[5], v8);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (uint64_t)_keyForPath:(uint64_t)a3
{
  double v5 = *(double *)(a3 + 24);
  +[_MKOverlayTileRequester tileProviderIdentifier];
  *(_WORD *)id v10 = GEOTileKeyMakeEmpty();
  int v6 = v10[1] & 0x3F | (*(_DWORD *)a3 << 6);
  if ([a1 isGeometryFlipped])
  {
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v8 = ~*(void *)(a3 + 8) + (1 << v7);
    if (v8 < 0) {
      uint64_t v8 = -v8;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a3 + 8);
    uint64_t v7 = *(void *)(a3 + 16);
  }
  *(void *)&v10[1] = v7 & 0x3F | ((unint64_t)v5 << 58) | v6 & 0xFFFFFFC0 | ((unint64_t)(v8 & 0x3FFFFFF) << 32) & 0x3FFFFFFFFFFFFC0;
  return *(void *)v10;
}

- (void)_loadTile:(uint64_t)a3 result:(void *)a4
{
  id v6 = a4;
  uint64_t v7 = _MKOverlayTileLoader();
  uint64_t v8 = GEOTileLoaderClientIdentifier();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__MKTileOverlay__loadTile_result___block_invoke;
  v10[3] = &unk_1E54BEFC8;
  v10[4] = a1;
  id v9 = v6;
  id v11 = v9;
  [v7 loadKey:a3 priority:2147483646 forClient:v8 options:3 reason:1 callbackQ:MEMORY[0x1E4F14428] beginNetwork:0 callback:v10];
}

void __34__MKTileOverlay__loadTile_result___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v12 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v12)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setTile:forKey:cost:", v12, a2, objc_msgSend(v12, "length"));
    [*(id *)(*(void *)(a1 + 32) + 72) setTile:v12 forKey:a2 cost:0];
    [*(id *)(a1 + 32) _scheduleMinLifetimeCacheCleanupIfNecessary];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_receivedMemoryNotification
{
}

- (void)_scheduleMinLifetimeCacheCleanupIfNecessary
{
}

void __60__MKTileOverlay__scheduleMinLifetimeCacheCleanupIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 88))
  {
    *(unsigned char *)(v1 + 104) = 1;
  }
  else
  {
    objc_initWeak(&location, (id)v1);
    objc_copyWeak(&v6, &location);
    uint64_t v3 = geo_dispatch_timer_create_on_qos();
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 88));
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __60__MKTileOverlay__scheduleMinLifetimeCacheCleanupIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _minLifetimeCacheCleanupFired];
}

- (void)_minLifetimeCacheCleanupFired
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  v5[6] = 3221225472;
  v5[7] = __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke;
  v5[8] = &unk_1E54BEFF0;
  v5[9] = self;
  v5[10] = &v6;
  geo_isolate_sync();
  GEOMachAbsoluteTimeGetCurrent();
  minimumLifetimeTileCache = self->_minimumLifetimeTileCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke_2;
  v5[3] = &__block_descriptor_40_e739_B32__0r___GEOTileKey_b7b1_____GEOStandardTileKey_b40b6b26b26b14b4b4___GEOGloriaQuadIDTileKey_b6b64b14b4______b10b10b12_I____GEORegionalResourceKey_b32b8b6b8b8b1b57___GEOSputnikMetadataKey_b32b24b14b8b42___GEOFlyoverKey_b6b26b26b8b24b14b8b8___GEOTransitLineSelectionKey_b6b25b25b64___GEOPolygonSelectionKey_b6b25b25b64___GEORoadSelectionKey_b6b25b25b64___GEOContourLinesKey_b6b26b26b4b8b50___GEOTileOverlayKey_b6b26b26b8b32b16b6___GEOIdentifiedResourceKey_QCCb1b39___GEOMuninMeshKey_b64b32b16b5b3___GEOVisualLocalizationTrackKey_SCb16b6b26b26b22___GEOVisualLocalizationMetadataKey_b6b9b25b6b26b26b22___GEOVisualLocalizationDataKey_QCb5b21b21b1___GEOS2TileKey_b6b26b26b3b14b4b4b37___GEOLiveTileKey_b6b26b26b14b4b4b4b36___8__GEOTileData_16d24l;
  v5[4] = v4;
  [(GEOTileCache *)minimumLifetimeTileCache removeTilesMatchingPredicate:v5];
  if (*((unsigned char *)v7 + 24)) {
    [(MKTileOverlay *)self _scheduleMinLifetimeCacheCleanupIfNecessary];
  }
  _Block_object_dispose(&v6, 8);
}

void __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 88);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v2 + 104);
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
}

BOOL __46__MKTileOverlay__minLifetimeCacheCleanupFired__block_invoke_2(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 32) - a2;
  if (v2 < 0.0) {
    double v2 = -v2;
  }
  return v2 > 10.0;
}

- (int)_zoomLevelForScale:(double)a3
{
  [(MKTileOverlay *)self tileSize];
  int v5 = (int)log2(268435456.0 / v4);
  int v6 = v5 + vcvtmd_s64_f64(log2(a3) + 0.5);
  return v6 & ~(v6 >> 31);
}

- (id)_tilesInMapRect:(id)a3 zoomScale:(double)a4 contentScale:(double)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int v11 = [(MKTileOverlay *)self _zoomLevelForScale:a4];
  [(MKTileOverlay *)self boundingMapRect];
  double v47 = v13;
  double v48 = v12;
  double v15 = v14;
  double v17 = v16;
  if ([(MKTileOverlay *)self minimumZ] <= v11
    && (uint64_t v18 = v11, [(MKTileOverlay *)self maximumZ] >= v11))
  {
    double v42 = v8;
    double width = self->_tileSize.width;
    double height = self->_tileSize.height;
    id v45 = [MEMORY[0x1E4F1CA48] array];
    signed int v22 = vcvtmd_s64_f64(v9 * a4 / width);
    signed int v23 = vcvtmd_s64_f64((v9 + var0) * a4 / width);
    if (v22 <= v23)
    {
      signed int v44 = vcvtmd_s64_f64(v42 * a4 / height);
      uint64_t v24 = v22;
      int v41 = v23 + 1;
      signed int v43 = vcvtmd_s64_f64((v42 + var1) * a4 / height);
      int v25 = (-1 << v11) + 1;
      do
      {
        if (v44 <= v43)
        {
          int v26 = v44;
          do
          {
            BOOL v27 = [(MKTileOverlay *)self isGeometryFlipped];
            int v28 = v25 + v26;
            if (v25 + v26 < 0) {
              int v28 = -v28;
            }
            if (v27) {
              int v29 = v28;
            }
            else {
              int v29 = v26;
            }
            double v30 = self->_tileSize.width;
            double v31 = self->_tileSize.height;
            double v32 = v30 * (double)(int)v24 / a4;
            double v33 = v31 * (double)v26 / a4;
            double v34 = v30 / a4;
            double v35 = v31 / a4;
            v55.origin.x = v32;
            v55.origin.y = v33;
            v55.size.double width = v34;
            v55.size.double height = v35;
            v56.origin.y = v47;
            v56.origin.x = v48;
            v56.size.double width = v15;
            v56.size.double height = v17;
            if (MKMapRectIntersectsRect(v55, v56))
            {
              v36 = objc_alloc_init(MKTileOverlayTile);
              -[MKTileOverlayTile setFrame:](v36, "setFrame:", v32, v33, v34, v35);
              [(MKTileOverlayTile *)v36 setScale:a4];
              v50[0] = v24;
              v50[1] = v29;
              v50[2] = v18;
              *(double *)&v50[3] = a5;
              [(MKTileOverlayTile *)v36 setPath:v50];
              uint64_t v51 = 0;
              uint64_t v52 = 0;
              v49[0] = v24;
              v49[1] = v29;
              v49[2] = v18;
              *(double *)&v49[3] = a5;
              uint64_t v51 = (uint64_t)[(MKTileOverlay *)self _keyForPath:v49];
              uint64_t v52 = v37;
              v38 = _MKOverlayTileLoader();
              v39 = [v38 cachedTileForKey:&v51];
              v40 = [v39 data];
              [(MKTileOverlayTile *)v36 setImage:v40];

              [v45 addObject:v36];
            }
            ++v26;
          }
          while (v43 + 1 != v26);
        }
        ++v24;
      }
      while (v41 != v24);
    }
  }
  else
  {
    id v45 = 0;
  }

  return v45;
}

- (void)_flushCaches
{
  uint64_t v3 = _MKOverlayTileLoader();
  [v3 clearAllCaches];

  [(GEOTileCache *)self->_tileCache removeAllObjects];
  minimumLifetimeTileCache = self->_minimumLifetimeTileCache;

  [(GEOTileCache *)minimumLifetimeTileCache removeAllObjects];
}

- (CGSize)tileSize
{
  objc_copyStruct(v4, &self->_tileSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setTileSize:(CGSize)tileSize
{
  CGSize v3 = tileSize;
  objc_copyStruct(&self->_tileSize, &v3, 16, 1, 0);
}

- (NSString)URLTemplate
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isGeometryFlipped
{
  return self->_geometryFlipped;
}

- (void)setGeometryFlipped:(BOOL)geometryFlipped
{
  self->_geometryFlipped = geometryFlipped;
}

- (NSInteger)minimumZ
{
  return self->_minimumZ;
}

- (void)setMinimumZ:(NSInteger)minimumZ
{
  self->_minimumZ = minimumZ;
}

- (NSInteger)maximumZ
{
  return self->_maximumZ;
}

- (void)setMaximumZ:(NSInteger)maximumZ
{
  self->_maximumZ = maximumZ;
}

- (BOOL)canReplaceMapContent
{
  return self->_canReplaceMapContent;
}

- (void)setCanReplaceMapContent:(BOOL)canReplaceMapContent
{
  self->_canReplaceMapContent = canReplaceMapContent;
}

- (unsigned)_providerID
{
  return self->_providerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_minimumLifetimeTileCacheEvictionTimer, 0);
  objc_storeStrong((id *)&self->_minimumLifetimeTileCacheEvictionTimerIsolation, 0);
  objc_storeStrong((id *)&self->_minimumLifetimeTileCache, 0);
  objc_storeStrong((id *)&self->_tileCache, 0);

  objc_storeStrong((id *)&self->_URLTemplate, 0);
}

@end