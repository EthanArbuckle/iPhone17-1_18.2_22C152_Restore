@interface _GEOSimpleTileRequesterOperation
- (BOOL)finished;
- (BOOL)isExistingCachedDataCurrent;
- (BOOL)responseIsCacheable;
- (BOOL)shouldDownloadToDisk;
- (GEODataRequest)request;
- (GEODataURLSession)dataSession;
- (GEODataURLSessionTask)task;
- (GEOSimpleTileRequesterOperationDelegate)delegate;
- (NSData)data;
- (NSString)description;
- (NSString)requestingBundleId;
- (NSString)requestingBundleVersion;
- (NSString)responseEtag;
- (NSURL)URL;
- (NSURL)downloadedFileURL;
- (OS_dispatch_queue)delegateQueue;
- (OS_os_activity)activity;
- (OS_os_activity)parentTileActivity;
- (_GEOSimpleTileRequesterOperation)baseTile;
- (_GEOSimpleTileRequesterOperation)init;
- (_GEOSimpleTileRequesterOperation)initWithRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (_GEOSimpleTileRequesterOperation)localizationTile;
- (double)elapsed;
- (double)startTime;
- (double)tileLoaderCreateTime;
- (double)timeout;
- (int)httpResponseStatusCode;
- (uint64_t)key;
- (uint64_t)setKey:(uint64_t)a3;
- (unint64_t)contentLength;
- (unint64_t)responseMaxAge;
- (unint64_t)signpostID;
- (unsigned)priority;
- (void)_recordAnalyticsWithError:(uint64_t)a1;
- (void)cancel;
- (void)clearAllRelatedOperations;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
- (void)dataURLSession:(id)a3 shouldConvertDataTask:(id)a4 toDownloadTaskForEstimatedResponseSize:(unint64_t)a5 completionHandler:(id)a6;
- (void)setActivity:(id)a3;
- (void)setBaseTile:(id)a3;
- (void)setData:(id)a3;
- (void)setDataSession:(id)a3;
- (void)setLocalizationTile:(id)a3;
- (void)setParentTileActivity:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setRequestingBundleId:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setResponseEtag:(id)a3;
- (void)setShouldDownloadToDisk:(BOOL)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setTask:(id)a3;
- (void)setTileLoaderCreateTime:(double)a3;
- (void)setTimeout:(double)a3;
- (void)start;
- (void)taskFailed:(void *)a3 withError:;
@end

@implementation _GEOSimpleTileRequesterOperation

- (_GEOSimpleTileRequesterOperation)init
{
  return 0;
}

- (_GEOSimpleTileRequesterOperation)initWithRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_GEOSimpleTileRequesterOperation;
  v12 = [(_GEOSimpleTileRequesterOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_delegateQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_signpostID = -1;
  }

  return v13;
}

- (void)setPriority:(unsigned int)a3
{
  atomic_store(a3, &self->_priority);
  float v3 = fmaxf(fminf((float)((float)((float)a3 * 2.3283e-10) * 0.78456) + 0.21544, 1.0), 0.21544);
  float v4 = v3 * (float)(v3 * v3);
  id v6 = [(_GEOSimpleTileRequesterOperation *)self task];
  *(float *)&double v5 = v4;
  [v6 setPriority:v5];
}

- (unsigned)priority
{
  return atomic_load(&self->_priority);
}

- (NSURL)URL
{
  v2 = [(_GEOSimpleTileRequesterOperation *)self request];
  float v3 = [v2 URL];

  return (NSURL *)v3;
}

- (unint64_t)contentLength
{
  v2 = [(_GEOSimpleTileRequesterOperation *)self data];
  float v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 length];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (NSString)description
{
  float v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL finished = self->_finished;
  task = self->_task;
  NSUInteger v7 = [(NSData *)self->_data length];
  unint64_t v8 = (unint64_t)[(GEODataRequest *)self->_request kind] >> 32;
  id v9 = @"RASTER_STANDARD";
  switch((int)v8)
  {
    case 0:
      break;
    case 1:
      id v9 = @"VECTOR_STANDARD";
      break;
    case 2:
      id v9 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      id v9 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      id v9 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      id v9 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      id v9 = @"RASTER_HYBRID";
      break;
    case 7:
      id v9 = @"RASTER_SATELLITE";
      break;
    case 8:
      id v9 = @"RASTER_TERRAIN";
      break;
    case 11:
      id v9 = @"VECTOR_BUILDINGS";
      break;
    case 12:
      id v9 = @"VECTOR_TRAFFIC";
      break;
    case 13:
      id v9 = @"VECTOR_POI";
      break;
    case 14:
      id v9 = @"SPUTNIK_METADATA";
      break;
    case 15:
      id v9 = @"SPUTNIK_C3M";
      break;
    case 16:
      id v9 = @"SPUTNIK_DSM";
      break;
    case 17:
      id v9 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 18:
      id v9 = @"VECTOR_REALISTIC";
      break;
    case 19:
      id v9 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 20:
      id v9 = @"VECTOR_ROADS";
      break;
    case 21:
      id v9 = @"RASTER_VEGETATION";
      break;
    case 22:
      id v9 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 23:
      id v9 = @"RASTER_COASTLINE_MASK";
      break;
    case 24:
      id v9 = @"RASTER_HILLSHADE";
      break;
    case 25:
      id v9 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 26:
      id v9 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 27:
      id v9 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 28:
      id v9 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 29:
      id v9 = @"VECTOR_SPEED_PROFILES";
      break;
    case 30:
      id v9 = @"VECTOR_VENUES";
      break;
    case 31:
      id v9 = @"RASTER_DOWN_SAMPLED";
      break;
    case 32:
      id v9 = @"RASTER_COLOR_BALANCED";
      break;
    case 33:
      id v9 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 34:
      id v9 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 35:
      id v9 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 36:
      id v9 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 37:
      id v9 = @"VECTOR_TRANSIT";
      break;
    case 38:
      id v9 = @"RASTER_STANDARD_BASE";
      break;
    case 39:
      id v9 = @"RASTER_STANDARD_LABELS";
      break;
    case 40:
      id v9 = @"RASTER_HYBRID_ROADS";
      break;
    case 41:
      id v9 = @"RASTER_HYBRID_LABELS";
      break;
    case 42:
      id v9 = @"FLYOVER_C3M_MESH";
      break;
    case 43:
      id v9 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 44:
      id v9 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 45:
      id v9 = @"RASTER_SATELLITE_ASTC";
      break;
    case 46:
      id v9 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 47:
      id v9 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 48:
      id v9 = @"VECTOR_COVERAGE";
      break;
    case 52:
      id v9 = @"FLYOVER_METADATA";
      break;
    case 53:
      id v9 = @"VECTOR_ROAD_NETWORK";
      break;
    case 54:
      id v9 = @"VECTOR_LAND_COVER";
      break;
    case 55:
      id v9 = @"VECTOR_DEBUG";
      break;
    case 56:
      id v9 = @"VECTOR_STREET_POI";
      break;
    case 57:
      id v9 = @"MUNIN_METADATA";
      break;
    case 58:
      id v9 = @"VECTOR_SPR_MERCATOR";
      break;
    case 59:
      id v9 = @"VECTOR_SPR_MODELS";
      break;
    case 60:
      id v9 = @"VECTOR_SPR_MATERIALS";
      break;
    case 61:
      id v9 = @"VECTOR_SPR_METADATA";
      break;
    case 62:
      id v9 = @"VECTOR_TRACKS";
      break;
    case 63:
      id v9 = @"VECTOR_RESERVED_2";
      break;
    case 64:
      id v9 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 65:
      id v9 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 66:
      id v9 = @"VECTOR_SPR_ROADS";
      break;
    case 67:
      id v9 = @"VECTOR_SPR_STANDARD";
      break;
    case 68:
      id v9 = @"VECTOR_POI_V2";
      break;
    case 69:
      id v9 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 70:
      id v9 = @"VL_METADATA";
      break;
    case 71:
      id v9 = @"VL_DATA";
      break;
    case 72:
      id v9 = @"PROACTIVE_APP_CLIP";
      break;
    case 73:
      id v9 = @"VECTOR_BUILDINGS_V2";
      break;
    case 74:
      id v9 = @"POI_BUSYNESS";
      break;
    case 75:
      id v9 = @"POI_DP_BUSYNESS";
      break;
    case 76:
      id v9 = @"SMART_INTERFACE_SELECTION";
      break;
    case 77:
      id v9 = @"VECTOR_ASSETS";
      break;
    case 78:
      id v9 = @"SPR_ASSET_METADATA";
      break;
    case 79:
      id v9 = @"VECTOR_SPR_POLAR";
      break;
    case 80:
      id v9 = @"SMART_DATA_MODE";
      break;
    case 81:
      id v9 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 82:
      id v9 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 83:
      id v9 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 84:
      id v9 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 85:
      id v9 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 86:
      id v9 = @"VECTOR_TRAFFIC_V2";
      break;
    case 87:
      id v9 = @"VECTOR_ROAD_SELECTION";
      break;
    case 88:
      id v9 = @"VECTOR_REGION_METADATA";
      break;
    case 89:
      id v9 = @"RAY_TRACING";
      break;
    case 90:
      id v9 = @"VECTOR_CONTOURS";
      break;
    case 91:
      id v9 = @"RASTER_SATELLITE_POLAR";
      break;
    case 92:
      id v9 = @"VMAP4_ELEVATION";
      break;
    case 93:
      id v9 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 94:
      id v9 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 95:
      id v9 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 96:
      id v9 = @"UNUSED_96";
      break;
    case 97:
      id v9 = @"UNUSED_97";
      break;
    case 98:
      id v9 = @"UNUSED_98";
      break;
    case 99:
      id v9 = @"UNUSED_99";
      break;
    case 100:
      id v9 = @"UNUSED_100";
      break;
    case 101:
      id v9 = @"UNUSED_101";
      break;
    case 102:
      id v9 = @"UNUSED_102";
      break;
    case 103:
      id v9 = @"UNUSED_103";
      break;
    case 104:
      id v9 = @"UNUSED_104";
      break;
    case 105:
      id v9 = @"UNUSED_105";
      break;
    case 106:
      id v9 = @"UNUSED_106";
      break;
    case 107:
      id v9 = @"UNUSED_107";
      break;
    case 108:
      id v9 = @"UNUSED_108";
      break;
    case 109:
      id v9 = @"UNUSED_109";
      break;
    case 110:
      id v9 = @"UNUSED_110";
      break;
    case 111:
      id v9 = @"UNUSED_111";
      break;
    case 112:
      id v9 = @"UNUSED_112";
      break;
    case 113:
      id v9 = @"UNUSED_113";
      break;
    case 114:
      id v9 = @"UNUSED_114";
      break;
    case 115:
      id v9 = @"UNUSED_115";
      break;
    case 116:
      id v9 = @"UNUSED_116";
      break;
    case 117:
      id v9 = @"UNUSED_117";
      break;
    case 118:
      id v9 = @"UNUSED_118";
      break;
    case 119:
      id v9 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  id v10 = [v3 stringWithFormat:@"<%@: %p> {_finished: %d, _task: %@, data:%zu bytes, kind: %@, other: %d%d}", v4, self, finished, task, v7, v9, self->_baseTile != 0, self->_localizationTile != 0];

  return (NSString *)v10;
}

- (void)start
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  unsigned int v3 = [(_GEOSimpleTileRequesterOperation *)self priority];
  uint64_t v4 = [(_GEOSimpleTileRequesterOperation *)self baseTile];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    id v10 = GEOGetTileLoadingLog();
    NSUInteger v7 = v10;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 134217984;
    double v40 = (double)v3 / 4294967290.0;
    id v9 = "RequestFromNetwork";
  }
  else
  {
    id v6 = GEOGetTileLoadingLog();
    NSUInteger v7 = v6;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 134217984;
    double v40 = (double)v3 / 4294967290.0;
    id v9 = "Loc.RequestFromNetwork";
  }
  _os_signpost_emit_with_name_impl(&dword_188D96000, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, v9, "Priority=%{signpost.description:attribute}f", buf, 0xCu);
LABEL_9:

  GEOMachAbsoluteTimeGetCurrent();
  self->_startTime = v11;
  v12 = [(_GEOSimpleTileRequesterOperation *)self delegate];
  self->_checksumMethod = [v12 checksumMethodForIncomingTileDataWithKey:&self->_key];

  v13 = (void *)MEMORY[0x1E4F290D0];
  v14 = +[GEOPlatform sharedPlatform];
  if ([v14 isInternalInstall]) {
    uint64_t BOOL = GEOConfigGetBOOL(GeoServicesConfig_AllowNonEVCerts, (uint64_t)off_1E9113CB8);
  }
  else {
    uint64_t BOOL = 0;
  }

  v16 = [(_GEOSimpleTileRequesterOperation *)self URL];
  v17 = [v16 host];
  [v13 setAllowsAnyHTTPSCertificate:BOOL forHost:v17];

  dataSession = self->_dataSession;
  if (dataSession)
  {
    v19 = dataSession;
  }
  else
  {
    v19 = +[GEODataURLSession sharedDataURLSession];
  }
  v20 = v19;
  if (self->_shouldDownloadToDisk)
  {
    v21 = [(_GEOSimpleTileRequesterOperation *)self request];
    float v22 = fmaxf(fminf((float)((float)((float)v3 * 2.3283e-10) * 0.78456) + 0.21544, 1.0), 0.21544);
    *(float *)&double v23 = v22 * (float)(v22 * v22);
    [(GEODataURLSession *)v20 downloadTaskWithRequest:v21 priority:self delegate:self->_delegateQueue delegateQueue:v23];
  }
  else
  {
    v21 = [(_GEOSimpleTileRequesterOperation *)self request];
    float v25 = fmaxf(fminf((float)((float)((float)v3 * 2.3283e-10) * 0.78456) + 0.21544, 1.0), 0.21544);
    *(float *)&double v26 = v25 * (float)(v25 * v25);
    [(GEODataURLSession *)v20 taskWithRequest:v21 priority:self delegate:self->_delegateQueue delegateQueue:v26];
  uint64_t v24 = };
  [(_GEOSimpleTileRequesterOperation *)self setTask:v24];

  v27 = [(_GEOSimpleTileRequesterOperation *)self task];
  LOBYTE(v24) = v27 == 0;

  if (v24)
  {
    v29 = [(_GEOSimpleTileRequesterOperation *)self baseTile];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      v35 = GEOGetTileLoadingLog();
      v32 = v35;
      os_signpost_id_t v33 = self->_signpostID;
      if (v33 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v34 = "RequestFromNetwork";
    }
    else
    {
      v31 = GEOGetTileLoadingLog();
      v32 = v31;
      os_signpost_id_t v33 = self->_signpostID;
      if (v33 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v31)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v34 = "Loc.RequestFromNetwork";
    }
    _os_signpost_emit_with_name_impl(&dword_188D96000, v32, OS_SIGNPOST_INTERVAL_END, v33, v34, "Result=Error", buf, 2u);
LABEL_28:

    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___GEOSimpleTileRequesterOperation_start__block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_async(delegateQueue, block);
    goto LABEL_29;
  }
  self->_isRunning = 1;
  v28 = [(_GEOSimpleTileRequesterOperation *)self task];
  [v28 start];

LABEL_29:
  os_activity_scope_leave(&state);
}

- (void)cancel
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  if (self->_isRunning)
  {
    unsigned int v3 = [(_GEOSimpleTileRequesterOperation *)self baseTile];

    if (v3)
    {
      uint64_t v4 = GEOGetTileLoadingLog();
      BOOL v5 = v4;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v4)) {
        goto LABEL_10;
      }
      *(_WORD *)id v10 = 0;
      NSUInteger v7 = "Loc.RequestFromNetwork";
    }
    else
    {
      unint64_t v8 = GEOGetTileLoadingLog();
      BOOL v5 = v8;
      os_signpost_id_t signpostID = self->_signpostID;
      if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v8)) {
        goto LABEL_10;
      }
      *(_WORD *)id v10 = 0;
      NSUInteger v7 = "RequestFromNetwork";
    }
    _os_signpost_emit_with_name_impl(&dword_188D96000, v5, OS_SIGNPOST_INTERVAL_END, signpostID, v7, "Result=Canceled", v10, 2u);
LABEL_10:
  }
  self->_isRunning = 0;
  id v9 = [(_GEOSimpleTileRequesterOperation *)self task];
  [v9 cancel];

  [(_GEOSimpleTileRequesterOperation *)self setTask:0];
  os_activity_scope_leave(&state);
}

- (void)clearAllRelatedOperations
{
  [(_GEOSimpleTileRequesterOperation *)self setBaseTile:0];

  [(_GEOSimpleTileRequesterOperation *)self setLocalizationTile:0];
}

- (double)elapsed
{
  v2 = [(_GEOSimpleTileRequesterOperation *)self task];
  [v2 elapsedTime];
  double v4 = v3;

  return v4;
}

- (double)startTime
{
  return self->_startTime;
}

- (int)httpResponseStatusCode
{
  v2 = [(_GEOSimpleTileRequesterOperation *)self task];
  double v3 = [v2 clientMetrics];
  double v4 = [v3 networkMetrics];
  int v5 = [v4 httpResponseCode];

  return v5;
}

- (unint64_t)responseMaxAge
{
  v2 = [(_GEOSimpleTileRequesterOperation *)self task];
  double v3 = [v2 response];
  unint64_t v4 = GEOCacheControlMaxAgeFromResponse(v3);

  return v4;
}

- (BOOL)responseIsCacheable
{
  return 1;
}

- (NSURL)downloadedFileURL
{
  v2 = [(_GEOSimpleTileRequesterOperation *)self task];
  double v3 = [v2 downloadedFileURL];

  return (NSURL *)v3;
}

- (void)dataURLSession:(id)a3 shouldConvertDataTask:(id)a4 toDownloadTaskForEstimatedResponseSize:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void))a6;
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v20);
  v13 = [(_GEOSimpleTileRequesterOperation *)self baseTile];
  if (v13)
  {

LABEL_6:
    v12[2](v12, 0);
    goto LABEL_7;
  }
  v14 = [(_GEOSimpleTileRequesterOperation *)self localizationTile];

  if (v14) {
    goto LABEL_6;
  }
  objc_super v15 = [(_GEOSimpleTileRequesterOperation *)self delegate];
  p_key = &self->_key;
  char v17 = [v15 tileDataIsCacheableForTileKey:&self->_key];

  if ((v17 & 1) == 0) {
    goto LABEL_6;
  }
  v18 = [(_GEOSimpleTileRequesterOperation *)self delegate];
  uint64_t v19 = [v18 shouldDownloadToDiskForTileKey:p_key estimatedDataSize:a5];

  v12[2](v12, v19);
LABEL_7:
  os_activity_scope_leave(&v20);
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  GEOMachAbsoluteTimeGetCurrent();
  self->_endTime = v8;
  BOOL isRunning = self->_isRunning;
  self->_BOOL isRunning = 0;
  id v10 = v7;
  id v11 = [(_GEOSimpleTileRequesterOperation *)self task];
  if (v11)
  {
    char v12 = [v10 failedDueToCancel];
    char v13 = isRunning ? 0 : v12;

    if ((v13 & 1) == 0)
    {
      v14 = [v10 clientMetrics];
      objc_super v15 = [v14 networkMetrics];

      v16 = [v15 transactionMetrics];
      char v17 = v16;
      double v18 = 0.0;
      if (v15 && v16)
      {
        double v19 = 0.0;
        double v20 = 0.0;
        double v21 = 0.0;
        double v22 = 0.0;
        if ([v16 count])
        {
          double v23 = [v17 lastObject];
          [v23 connectEnd];
          double v90 = v24;
          [v23 connectStart];
          double v88 = v25;
          [v23 domainLookupEnd];
          double v27 = v26;
          [v23 domainLookupStart];
          double v29 = v28;
          [v23 requestEnd];
          double v31 = v30;
          [v23 requestStart];
          double v33 = v32;
          [v23 responseEnd];
          double v35 = v34;
          [v23 responseStart];
          double v37 = v36;
          [v23 secureConnectEnd];
          double v39 = v38;
          [v23 secureConnectStart];
          double v41 = v40;

          double v21 = v27 - v29;
          double v20 = v31 - v33;
          double v19 = v35 - v37;
          double v18 = v39 - v41;
          double v22 = v90 - v88;
        }
      }
      else
      {
        double v19 = 0.0;
        double v20 = 0.0;
        double v21 = 0.0;
        double v22 = 0.0;
      }
      unsigned int v91 = [(_GEOSimpleTileRequesterOperation *)self priority];
      id v94 = 0;
      id v95 = 0;
      int v42 = [v10 didValidateEntityTagForData:&v95 entityTag:&v94];
      id v43 = v95;
      id v44 = v94;
      v45 = v44;
      if (v43) {
        int v46 = v42;
      }
      else {
        int v46 = 0;
      }
      if (v46 == 1)
      {
        v47 = [(_GEOSimpleTileRequesterOperation *)self baseTile];
        BOOL v48 = v47 == 0;

        if (v48)
        {
          v61 = GEOGetTileLoadingLog();
          v50 = v61;
          os_signpost_id_t signpostID = self->_signpostID;
          if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v61)) {
            goto LABEL_27;
          }
          uint64_t v62 = [v10 receivedDataLength];
          int v63 = [v15 httpResponseCode];
          *(_DWORD *)buf = 134219776;
          double v98 = (double)v91 / 4294967290.0;
          __int16 v99 = 2048;
          uint64_t v100 = v62;
          __int16 v101 = 1024;
          int v102 = v63;
          __int16 v103 = 2048;
          double v104 = v22;
          __int16 v105 = 2048;
          double v106 = v21;
          __int16 v107 = 2048;
          double v108 = v20;
          __int16 v109 = 2048;
          double v110 = v19;
          __int16 v111 = 2048;
          double v112 = v18;
          v54 = "RequestFromNetwork";
        }
        else
        {
          v49 = GEOGetTileLoadingLog();
          v50 = v49;
          os_signpost_id_t signpostID = self->_signpostID;
          if (signpostID - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v49)) {
            goto LABEL_27;
          }
          uint64_t v52 = [v10 receivedDataLength];
          int v53 = [v15 httpResponseCode];
          *(_DWORD *)buf = 134219776;
          double v98 = (double)v91 / 4294967290.0;
          __int16 v99 = 2048;
          uint64_t v100 = v52;
          __int16 v101 = 1024;
          int v102 = v53;
          __int16 v103 = 2048;
          double v104 = v22;
          __int16 v105 = 2048;
          double v106 = v21;
          __int16 v107 = 2048;
          double v108 = v20;
          __int16 v109 = 2048;
          double v110 = v19;
          __int16 v111 = 2048;
          double v112 = v18;
          v54 = "Loc.RequestFromNetwork";
        }
        _os_signpost_emit_with_name_impl(&dword_188D96000, v50, OS_SIGNPOST_INTERVAL_END, signpostID, v54, "Result=Success Priority=%{signpost.description:attribute}f TileSize=%{signpost.description:attribute}lu HttpStatus=%{signpost.description:attribute}u ConnectTime=%{signpost.description:attribute}f DNSTime=%{signpost.description:attribute}f RequestTime=%{signpost.description:attribute}f ResponseTime=%{signpost.description:attribute}f SSLTime=%{signpost.description:attribute}f", buf, 0x4Eu);
LABEL_27:

        [(_GEOSimpleTileRequesterOperation *)self setData:v43];
        [(_GEOSimpleTileRequesterOperation *)self setResponseEtag:v45];
        *(_WORD *)&self->_BOOL finished = 257;
        v64 = [(_GEOSimpleTileRequesterOperation *)self delegate];
        int v65 = [v64 shouldReportSuccessNetworkEventForTileKey:&self->_key];

        if (v65) {
          -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:]((uint64_t)self, 0);
        }
        v66 = [(_GEOSimpleTileRequesterOperation *)self delegate];
        [v66 operationFinished:self];

LABEL_30:
        id v56 = v43;
        goto LABEL_31;
      }

      id v93 = 0;
      char v55 = [v10 validateTransportWithError:&v93];
      id v56 = v93;
      if ((v55 & 1) == 0)
      {
        -[_GEOSimpleTileRequesterOperation taskFailed:withError:]((uint64_t)self, v10, v56);
LABEL_31:

        goto LABEL_32;
      }
      v57 = [v10 entityTag];
      [(_GEOSimpleTileRequesterOperation *)self setResponseEtag:v57];

      v58 = [v10 receivedData];
      [(_GEOSimpleTileRequesterOperation *)self setData:v58];

      v59 = [(_GEOSimpleTileRequesterOperation *)self delegate];
      BOOL v60 = ([v59 shouldAllowEmptyDataForTileKey:&self->_key] & 1) != 0 || self->_shouldDownloadToDisk;

      id v92 = v56;
      char v67 = [v10 validateTileResponse:v60 error:&v92];
      id v43 = v92;

      if ((v67 & 1) == 0)
      {
        -[_GEOSimpleTileRequesterOperation taskFailed:withError:]((uint64_t)self, v10, v43);
        id v56 = v43;
        goto LABEL_31;
      }
      id v89 = v10;
      v68 = [(_GEOSimpleTileRequesterOperation *)self data];
      BOOL v69 = [v68 length] == 0;

      if (v69)
      {
      }
      else
      {
        v70 = [(_GEOSimpleTileRequesterOperation *)self delegate];
        v71 = [(_GEOSimpleTileRequesterOperation *)self data];
        v72 = [v70 verifyDataIntegrity:v71 checksumMethod:self->_checksumMethod];
        [(_GEOSimpleTileRequesterOperation *)self setData:v72];

        v73 = [(_GEOSimpleTileRequesterOperation *)self data];
        LODWORD(v72) = v73 == 0;

        if (v72)
        {
          v74 = GEOGetTileLoadingLog();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v74, OS_LOG_TYPE_ERROR, "Tile data did not pass integrity check.", buf, 2u);
          }

          v45 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Tile data did not pass integrity check."];
          [(_GEOSimpleTileRequesterOperation *)self setData:0];
          -[_GEOSimpleTileRequesterOperation taskFailed:withError:]((uint64_t)self, v89, v45);
          goto LABEL_30;
        }
      }
      v75 = [(_GEOSimpleTileRequesterOperation *)self baseTile];
      BOOL v76 = v75 == 0;

      if (v76)
      {
        v83 = GEOGetTileLoadingLog();
        v78 = v83;
        os_signpost_id_t v79 = self->_signpostID;
        if (v79 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v83)) {
          goto LABEL_50;
        }
        uint64_t v84 = [v89 receivedDataLength];
        int v85 = [v15 httpResponseCode];
        *(_DWORD *)buf = 134219776;
        double v98 = (double)v91 / 4294967290.0;
        __int16 v99 = 2048;
        uint64_t v100 = v84;
        __int16 v101 = 1024;
        int v102 = v85;
        __int16 v103 = 2048;
        double v104 = v22;
        __int16 v105 = 2048;
        double v106 = v21;
        __int16 v107 = 2048;
        double v108 = v20;
        __int16 v109 = 2048;
        double v110 = v19;
        __int16 v111 = 2048;
        double v112 = v18;
        v82 = "RequestFromNetwork";
      }
      else
      {
        v77 = GEOGetTileLoadingLog();
        v78 = v77;
        os_signpost_id_t v79 = self->_signpostID;
        if (v79 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v77)) {
          goto LABEL_50;
        }
        uint64_t v80 = [v89 receivedDataLength];
        int v81 = [v15 httpResponseCode];
        *(_DWORD *)buf = 134219776;
        double v98 = (double)v91 / 4294967290.0;
        __int16 v99 = 2048;
        uint64_t v100 = v80;
        __int16 v101 = 1024;
        int v102 = v81;
        __int16 v103 = 2048;
        double v104 = v22;
        __int16 v105 = 2048;
        double v106 = v21;
        __int16 v107 = 2048;
        double v108 = v20;
        __int16 v109 = 2048;
        double v110 = v19;
        __int16 v111 = 2048;
        double v112 = v18;
        v82 = "Loc.RequestFromNetwork";
      }
      _os_signpost_emit_with_name_impl(&dword_188D96000, v78, OS_SIGNPOST_INTERVAL_END, v79, v82, "Result=Success Priority=%{signpost.description:attribute}f TileSize=%{signpost.description:attribute}lu HttpStatus=%{signpost.description:attribute}u ConnectTime=%{signpost.description:attribute}f DNSTime=%{signpost.description:attribute}f RequestTime=%{signpost.description:attribute}f ResponseTime=%{signpost.description:attribute}f SSLTime=%{signpost.description:attribute}f", buf, 0x4Eu);
LABEL_50:

      self->_BOOL finished = 1;
      v86 = [(_GEOSimpleTileRequesterOperation *)self delegate];
      int v87 = [v86 shouldReportSuccessNetworkEventForTileKey:&self->_key];

      if (v87) {
        -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:]((uint64_t)self, 0);
      }
      v45 = [(_GEOSimpleTileRequesterOperation *)self delegate];
      [v45 operationFinished:self];
      goto LABEL_30;
    }
  }
LABEL_32:

  os_activity_scope_leave(&state);
}

- (void)_recordAnalyticsWithError:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    unint64_t v4 = [(id)a1 task];
    int v5 = [v4 clientMetrics];
    id v17 = (id)[v5 copy];

    if (GEOConfigGetBOOL(GeoServicesConfig_ReportTileNetworkEventDetails, (uint64_t)off_1E9113A38))
    {
      id v6 = [(id)a1 task];
      uint64_t v7 = [v6 outgoingPayloadSize];
      double v8 = [v17 networkMetrics];
      [v8 setRequestDataSize:v7];

      id v9 = [(id)a1 task];
      uint64_t v10 = [v9 incomingPayloadSize];
      id v11 = [v17 networkMetrics];
      [v11 setResponseDataSize:v10];

      char v12 = [(id)a1 task];
      uint64_t v13 = [v12 receivedRNFNotification];
      v14 = [v17 networkMetrics];
      [v14 setRnfTriggered:v13];
    }
    else
    {
      char v12 = [v17 networkMetrics];
      [v12 clearTransactionMetrics];
    }

    [v17 setQueuedTime:*(double *)(a1 + 120) - *(double *)(a1 + 176)];
    objc_super v15 = [(id)a1 delegate];
    v16 = [v15 additionalNetworkEventAnalyticsStatesForKey:a1 + 40];

    +[GEONetworkEventDataRecorder recordNetworkEventDataForTileKey:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:](GEONetworkEventDataRecorder, "recordNetworkEventDataForTileKey:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 160), *(void *)(a1 + 168), 0, v3, v17, v16);
  }
}

- (void)taskFailed:(void *)a3 withError:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unsigned int v7 = [(id)a1 priority];
    double v8 = [(id)a1 baseTile];

    id v9 = GEOGetTileLoadingLog();
    uint64_t v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 136);
    if (v8)
    {
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        double v12 = (double)v7 / 4294967290.0;
        uint64_t v13 = [v6 domain];
        *(_DWORD *)buf = 134218498;
        double v69 = v12;
        __int16 v70 = 2112;
        *(void *)v71 = v13;
        *(_WORD *)&v71[8] = 2048;
        *(void *)v72 = [v6 code];
        v14 = "Loc.RequestFromNetwork";
LABEL_9:
        _os_signpost_emit_with_name_impl(&dword_188D96000, v10, OS_SIGNPOST_INTERVAL_END, v11, v14, "Result=Error Priority=%f ErrorDomain=%@ ErrorCode=%li", buf, 0x20u);
      }
    }
    else if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      double v15 = (double)v7 / 4294967290.0;
      uint64_t v13 = [v6 domain];
      *(_DWORD *)buf = 134218498;
      double v69 = v15;
      __int16 v70 = 2112;
      *(void *)v71 = v13;
      *(_WORD *)&v71[8] = 2048;
      *(void *)v72 = [v6 code];
      v14 = "RequestFromNetwork";
      goto LABEL_9;
    }

    if ([v6 code] == -11
      && ([v6 domain],
          v16 = objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          id v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v16 isEqualToString:v17],
          v17,
          v16,
          (v18 & 1) != 0))
    {
      uint64_t v19 = -11;
    }
    else
    {
      if ([v6 code] != -1001
        || ([v6 domain],
            double v20 = objc_claimAutoreleasedReturnValue(),
            int v21 = [v20 isEqualToString:*MEMORY[0x1E4F18F50]],
            v20,
            !v21))
      {
        int v46 = v6;
        goto LABEL_25;
      }
      uint64_t v19 = -19;
    }
    [v5 elapsedTime];
    double v23 = v22;
    double v24 = GEOGetTileLoadingLog();
    id v67 = v5;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      double v25 = GEOStringForError((__CFString *)v19);
      int v26 = *(_DWORD *)(a1 + 144);
      [(id)a1 elapsed];
      uint64_t v28 = v27;
      [(id)a1 timeout];
      uint64_t v30 = v29;
      double v31 = [(id)a1 data];
      uint64_t v32 = [v31 length];
      double v33 = [v5 originalRequestURL];
      *(_DWORD *)buf = 138544898;
      double v69 = *(double *)&v25;
      __int16 v70 = 1024;
      *(_DWORD *)v71 = v26;
      *(_WORD *)&v71[4] = 1024;
      *(_DWORD *)&v71[6] = 3;
      *(_WORD *)v72 = 2048;
      *(void *)&v72[2] = v28;
      __int16 v73 = 2048;
      uint64_t v74 = v30;
      __int16 v75 = 2048;
      uint64_t v76 = v32;
      __int16 v77 = 2112;
      v78 = v33;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Task failed because of %{public}@, attempt %u/%u, taking %.3lf/%.3lf sec, size=%lu, URL=%@", buf, 0x40u);

      id v5 = v67;
    }

    double v34 = NSString;
    double v35 = NSStringFromSelector(sel_taskFailed_withError_);
    double v36 = GEOStringForError((__CFString *)v19);
    uint64_t v37 = *(unsigned int *)(a1 + 144);
    [(id)a1 elapsed];
    uint64_t v39 = v38;
    [(id)a1 timeout];
    uint64_t v41 = v40;
    int v42 = [(id)a1 data];
    uint64_t v43 = [v42 length];
    id v44 = [v5 originalRequestURL];
    v45 = [v34 stringWithFormat:@"%@ failed because of %@, attempt %u/%u, taking %.3lf/%.3lf sec, size=%lu, URL=%@", v35, v36, v37, 3, v39, v41, v43, v44];

    int v46 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:v19 reason:v45];

    [(id)a1 timeout];
    if (v23 < v47 && *(int *)(a1 + 144) <= 2)
    {
      BOOL v48 = [(id)a1 delegate];
      int v49 = [v48 shouldReportErrorNetworkEventWithRertryForTileKey:a1 + 40];

      if (v49) {
        -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:](a1, v46);
      }
      [(id)a1 timeout];
      [(id)a1 setTimeout:v50 - v23];
      ++*(_DWORD *)(a1 + 144);
      [(id)a1 start];
      id v5 = v67;
LABEL_32:

      id v6 = v46;
      goto LABEL_33;
    }

    id v5 = v67;
LABEL_25:
    v51 = [v46 userInfo];
    uint64_t v52 = *MEMORY[0x1E4F289C0];
    int v53 = [v51 objectForKeyedSubscript:*MEMORY[0x1E4F289C0]];

    if (!v53)
    {
      id v54 = objc_alloc(MEMORY[0x1E4F1CA60]);
      char v55 = [v46 userInfo];
      id v56 = (void *)[v54 initWithDictionary:v55];

      v57 = [v5 originalRequestURL];
      uint64_t v58 = [v57 absoluteString];
      v59 = (void *)v58;
      BOOL v60 = @"(nil)";
      if (v58) {
        BOOL v60 = (__CFString *)v58;
      }
      v61 = v60;

      [v56 setObject:v61 forKeyedSubscript:v52];
      uint64_t v62 = (void *)MEMORY[0x1E4F28C58];
      int v63 = [v46 domain];
      uint64_t v64 = objc_msgSend(v62, "errorWithDomain:code:userInfo:", v63, objc_msgSend(v46, "code"), v56);

      int v46 = (void *)v64;
    }
    int v65 = [(id)a1 delegate];
    int v66 = [v65 shouldReportErrorNetworkEventForTileKey:a1 + 40];

    if (v66) {
      -[_GEOSimpleTileRequesterOperation _recordAnalyticsWithError:](a1, v46);
    }
    v45 = [(id)a1 delegate];
    [v45 operationFailed:a1 error:v46];
    goto LABEL_32;
  }
LABEL_33:
}

- (GEODataURLSession)dataSession
{
  return self->_dataSession;
}

- (void)setDataSession:(id)a3
{
}

- (GEODataRequest)request
{
  return self->_request;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_os_signpost_id_t signpostID = a3;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (OS_os_activity)parentTileActivity
{
  return self->_parentTileActivity;
}

- (void)setParentTileActivity:(id)a3
{
}

- (uint64_t)key
{
  return *(void *)(a1 + 40);
}

- (uint64_t)setKey:(uint64_t)a3
{
  *(void *)(result + 40) = a3;
  *(void *)(result + 48) = a4;
  return result;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (GEODataURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (_GEOSimpleTileRequesterOperation)baseTile
{
  return self->_baseTile;
}

- (void)setBaseTile:(id)a3
{
}

- (_GEOSimpleTileRequesterOperation)localizationTile
{
  return self->_localizationTile;
}

- (void)setLocalizationTile:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (GEOSimpleTileRequesterOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOSimpleTileRequesterOperationDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)responseEtag
{
  return self->_responseEtag;
}

- (void)setResponseEtag:(id)a3
{
}

- (BOOL)isExistingCachedDataCurrent
{
  return self->_existingCachedDataCurrent;
}

- (BOOL)shouldDownloadToDisk
{
  return self->_shouldDownloadToDisk;
}

- (void)setShouldDownloadToDisk:(BOOL)a3
{
  self->_shouldDownloadToDisk = a3;
}

- (NSString)requestingBundleId
{
  return self->_requestingBundleId;
}

- (void)setRequestingBundleId:(id)a3
{
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (void)setRequestingBundleVersion:(id)a3
{
}

- (double)tileLoaderCreateTime
{
  return self->_tileLoaderCreateTime;
}

- (void)setTileLoaderCreateTime:(double)a3
{
  self->_tileLoaderCreateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleId, 0);
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_storeStrong((id *)&self->_parentTileActivity, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localizationTile, 0);
  objc_storeStrong((id *)&self->_baseTile, 0);
  objc_storeStrong((id *)&self->_responseEtag, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end