@interface GEOMapFeatureTransitLinkFinder
- (id)findTransitLinksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
@end

@implementation GEOMapFeatureTransitLinkFinder

- (id)findTransitLinksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:37 scale:0];
  v14 = [GEOMapFeatureTileFinder alloc];
  v15 = [(GEOMapFeatureAccessFinder *)self requestParameters];
  v16 = [(GEOMapFeatureTileFinder *)v14 initWithZoomLevel:HIDWORD(*(unint64_t *)&v13) tileSize:v13 tileScale:0 tileSetStyle:37 requestParameters:v15];

  double v17 = GEOTilePointForCoordinate(var0, var1, 20.0);
  uint64_t v19 = v18;
  long double v20 = GEOMapPointsPerMeterAtLatitude(var0);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88__GEOMapFeatureTransitLinkFinder_findTransitLinksNear_radius_handler_completionHandler___block_invoke;
  v25[3] = &unk_1E53DA350;
  v25[4] = self;
  double v27 = v17;
  uint64_t v28 = v19;
  double v29 = v20 * a4;
  id v21 = v11;
  id v26 = v21;
  v22 = (void *)MEMORY[0x18C120660](v25);
  v23 = -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v22, v12, var0, var1, a4);

  return v23;
}

void __88__GEOMapFeatureTransitLinkFinder_findTransitLinksNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(unsigned __int8 *)(v4 + 10);
  uint64_t v6 = *(unsigned __int16 *)(v4 + 8);
  uint64_t v7 = *(void *)v4;
  uint64_t v8 = *(void *)v4 << 32;
  int8x8_t v9 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v6 & 0xFFFFFFFFFF00FFFFLL | (v5 << 16)) >> 2), (int32x2_t)(v5 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  unint64_t v10 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (v6 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v9.u32[0] << 34) | ((unint64_t)v9.u32[1] << 48) | (v5 << 48) & 0xF0000000000000;
  *(void *)&v20[1] = v8 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  v20[0] = v7;
  *((void *)&v11 + 1) = v10;
  *(void *)&long long v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_boundingCircleWithCenter:radius:inTile:", *(void *)v20, (unint64_t)(v11 >> 56), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  unint64_t v12 = 0;
  *(_DWORD *)long double v20 = v13;
  *(_DWORD *)&v20[4] = v14;
  *(_DWORD *)&v20[8] = v15;
  while (v12 < [v3 transitLinkCount])
  {
    v16 = [v3 transitLinks];
    double v17 = [v16 objectAtIndex:v12];

    if ([*(id *)(a1 + 32) _boundingCircle:v20 intersectsTransitLink:v17])
    {
      for (unint64_t i = 0; i < *(void *)([v17 transitIndexRange] + 8); ++i)
      {
        uint64_t v19 = [[GEOMapFeatureTransitLink alloc] initWithTransitLink:v17 lineIndex:i];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }

    ++v12;
  }
}

@end