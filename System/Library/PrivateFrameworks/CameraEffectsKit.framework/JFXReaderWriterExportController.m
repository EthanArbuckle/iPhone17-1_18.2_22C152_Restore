@interface JFXReaderWriterExportController
- (CGSize)applyCompositionAspectRatioToAVPresetSize:(CGSize)a3 compositionSize:(CGSize)a4;
- (PVVideoCompositing)customCompositor;
- (float)progress;
- (id)JFX_videoCompressionSettingsFromAssistant:(id)a3;
- (id)audioCompressionSettings;
- (id)fileTypeFromExtension;
- (id)videoCompressionSettings:(CGSize)a3;
- (id)videoDecompressionSettingsForVideoCompressionSettings:(id)a3;
- (int64_t)mapAssetReaderStatusToExportStatus:(int64_t)a3;
- (int64_t)mapAssetWriterStatusToExportStatus:(int64_t)a3;
- (void)JFX_continueExportForNextPreset;
- (void)cancelExportWithStatus:(int64_t)a3;
- (void)continueExportAfterDelay;
- (void)setCustomCompositor:(id)a3;
- (void)setProgress:(float)a3;
- (void)transferSampleBuffers:(id)a3 assetReader:(id)a4 assetWriterInput:(id)a5 assetWriter:(id)a6 timeRangeToExport:(id *)a7 queue:(id)a8 pass:(int64_t)a9 completionBlock:(id)a10;
- (void)updateSessionProgress:(id)a3;
- (void)updateStatusAndErrorFromReader:(id)a3 andWriter:(id)a4;
@end

@implementation JFXReaderWriterExportController

- (id)fileTypeFromExtension
{
  v2 = [(JFXExportController *)self exportPath];
  v3 = [v2 pathExtension];

  if (([v3 isEqualToString:@"mp4"] & 1) != 0
    || [v3 isEqualToString:@"MP4"])
  {
    v4 = (id *)MEMORY[0x263F1DBA8];
  }
  else
  {
    v4 = (id *)MEMORY[0x263F1DC58];
  }
  v5 = [*v4 identifier];

  return v5;
}

- (CGSize)applyCompositionAspectRatioToAVPresetSize:(CGSize)a3 compositionSize:(CGSize)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  double v6 = a4.width / a4.height;
  if (a4.width / a4.height == 1.0)
  {
    double v7 = a3.height;
  }
  else if (a4.width / a4.height >= 1.0)
  {
    if (v6 <= 1.0)
    {
      double v8 = a4.height;
      double v9 = a4.width;
      v10 = JFXLog_export();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(JFXReaderWriterExportController *)v10 applyCompositionAspectRatioToAVPresetSize:v8 compositionSize:v6];
      }
    }
    else
    {
      double height = a3.width * (1.0 / v6);
    }
    double v7 = width;
  }
  else
  {
    double v7 = a3.width * v6;
    double height = width;
  }
  double v11 = height;
  result.double height = v11;
  result.CGFloat width = v7;
  return result;
}

- (id)JFX_videoCompressionSettingsFromAssistant:(id)a3
{
  id v3 = a3;
  id v4 = (id)*MEMORY[0x263EF9FE8];
  if ([v3 isEqualToString:*MEMORY[0x263EF9550]])
  {
    v5 = (id *)MEMORY[0x263EF9FF8];
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EF9558]])
  {
    v5 = (id *)MEMORY[0x263EFA000];
  }
  else
  {
    if (![v3 isEqualToString:*MEMORY[0x263EF9538]]) {
      goto LABEL_8;
    }
    v5 = (id *)MEMORY[0x263EF9FF0];
  }
  id v6 = *v5;

  id v4 = v6;
LABEL_8:
  double v7 = [MEMORY[0x263EFA7D8] outputSettingsAssistantWithPreset:v4];
  double v8 = [v7 videoSettings];
  double v9 = (void *)[v8 copy];

  return v9;
}

- (id)videoCompressionSettings:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__JFXReaderWriterExportController_videoCompressionSettings___block_invoke_2;
  block[3] = &unk_264C0A3F0;
  id v54 = &__block_literal_global_62;
  if (videoCompressionSettings__onceToken != -1) {
    dispatch_once(&videoCompressionSettings__onceToken, block);
  }
  id v6 = [(JFXExportController *)self currentPreset];
  double v7 = [(id)videoCompressionSettings__presetToVideoSettingsLUT objectForKeyedSubscript:v6];
  if (!v7)
  {
    double v7 = [(id)videoCompressionSettings__presetToVideoSettingsLUT objectForKeyedSubscript:*MEMORY[0x263EF9530]];
  }
  if (([v6 isEqualToString:JFXAssetExportPresetHEVC1280x720HDR] & 1) != 0
    || ([v6 isEqualToString:JFXAssetExportPresetHEVC1920x1080HDR] & 1) != 0)
  {
    int v50 = 1;
LABEL_8:
    int v8 = 1;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:JFXAssetExportPresetHEVC1280x720])
  {
    int v50 = 0;
    goto LABEL_8;
  }
  int v8 = [v6 isEqualToString:JFXAssetExportPresetHEVC1920x1080];
  int v50 = 0;
LABEL_9:
  double v9 = [v7 objectForKeyedSubscript:@"kJFXVideoSettingsSize"];
  [v9 CGSizeValue];
  double v11 = v10;
  double v13 = v12;

  v14 = [v7 objectForKeyedSubscript:@"kJFXVideoSettingsFrameReordering"];
  unsigned int v15 = [v14 BOOLValue];

  uint64_t v16 = [v7 objectForKeyedSubscript:@"kJFXVideoSettingsProfileLevel"];
  uint64_t v17 = [v7 objectForKeyedSubscript:@"kJFXVideoSettingsEntropyMode"];
  v51 = v6;
  uint64_t v18 = objc_msgSend((id)objc_opt_class(), "videoDataRateForPreset:size:", v6, width, height);
  v19 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  -[JFXReaderWriterExportController applyCompositionAspectRatioToAVPresetSize:compositionSize:](self, "applyCompositionAspectRatioToAVPresetSize:compositionSize:", v11, v13, width, height);
  double v21 = v20;
  v23 = [NSNumber numberWithInteger:(uint64_t)v22];
  [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x263EFA458]];

  v24 = [NSNumber numberWithInteger:(uint64_t)v21];
  [v19 setObject:v24 forKeyedSubscript:*MEMORY[0x263EFA3E8]];

  v25 = (id *)MEMORY[0x263EFA370];
  if (!v8) {
    v25 = (id *)MEMORY[0x263EFA368];
  }
  id v26 = *v25;
  [v19 setObject:v26 forKeyedSubscript:*MEMORY[0x263EFA338]];
  uint64_t v27 = 3;
  if (v17) {
    uint64_t v27 = 4;
  }
  v28 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v27 + v15];
  v52 = (void *)v16;
  [v28 setObject:v16 forKey:*MEMORY[0x263EFA420]];
  if ((v8 & 1) == 0 && v17) {
    [v28 setObject:v17 forKey:*MEMORY[0x263EFA3E0]];
  }
  if (v50)
  {
    [v28 setObject:*MEMORY[0x263F1E970] forKeyedSubscript:*MEMORY[0x263F1E578]];
    [v28 setObject:*MEMORY[0x263EFFB38] forKeyedSubscript:*MEMORY[0x263F1E620]];
  }
  v29 = [NSNumber numberWithUnsignedInteger:v18];
  [v28 setObject:v29 forKey:*MEMORY[0x263EFA318]];

  if (v15)
  {
    v30 = [NSNumber numberWithBool:1];
    [v28 setObject:v30 forKey:*MEMORY[0x263EFA310]];
  }
  v31 = (void *)[v28 copy];
  [v19 setObject:v31 forKey:*MEMORY[0x263EFA3A0]];

  v32 = [MEMORY[0x263F61260] sharedInstance];
  v33 = [v32 preferredExportColorSpace];

  if ((v8 & 1) != 0 || ![v33 isHDRSpace])
  {
    v34 = (void *)v17;
  }
  else
  {
    v34 = (void *)v17;
    uint64_t v35 = [MEMORY[0x263F61230] rec709GammaColorSpace];

    v33 = (void *)v35;
  }
  v36 = objc_opt_new();
  v37 = [v33 nclcTriplet];
  uint64_t v38 = [v37 colorPrimary];
  [v36 setObject:v38 forKeyedSubscript:*MEMORY[0x263EFA388]];

  v39 = [v33 nclcTriplet];
  uint64_t v40 = [v39 transferFunction];
  [v36 setObject:v40 forKeyedSubscript:*MEMORY[0x263EFA448]];

  v41 = [v33 nclcTriplet];
  uint64_t v42 = [v41 ycbcrMatrix];
  [v36 setObject:v42 forKeyedSubscript:*MEMORY[0x263EFA460]];

  [v19 setObject:v36 forKeyedSubscript:*MEMORY[0x263EFA398]];
  v43 = JFXLog_DebugExport();
  BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);

  if (v44)
  {
    v45 = JFXLog_DebugExport();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      -[JFXReaderWriterExportController videoCompressionSettings:]();
    }

    v46 = JFXLog_DebugExport();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      -[JFXReaderWriterExportController videoCompressionSettings:](self);
    }

    v47 = JFXLog_DebugExport();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      -[JFXReaderWriterExportController videoCompressionSettings:]();
    }
  }
  v48 = (void *)[v19 copy];

  return v48;
}

id __60__JFXReaderWriterExportController_videoCompressionSettings___block_invoke(double a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  v20[3] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v19[0] = @"kJFXVideoSettingsSize";
  *(double *)uint64_t v18 = a1;
  *(double *)&v18[1] = a2;
  double v12 = [MEMORY[0x263F08D40] valueWithBytes:v18 objCType:"{CGSize=dd}"];
  v20[0] = v12;
  v19[1] = @"kJFXVideoSettingsFrameReordering";
  double v13 = [NSNumber numberWithBool:a4];
  v19[2] = @"kJFXVideoSettingsProfileLevel";
  v20[1] = v13;
  v20[2] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  unsigned int v15 = (void *)[v14 mutableCopy];

  if (v11) {
    [v15 setObject:v11 forKeyedSubscript:@"kJFXVideoSettingsEntropyMode"];
  }
  uint64_t v16 = [NSDictionary dictionaryWithDictionary:v15];

  return v16;
}

void __60__JFXReaderWriterExportController_videoCompressionSettings___block_invoke_2(uint64_t a1)
{
  v15[10] = *MEMORY[0x263EF8340];
  v14[0] = JFXAssetExportPresetLowQuality;
  double v13 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(640.0, 360.0);
  v15[0] = v13;
  v14[1] = *MEMORY[0x263EF9550];
  double v12 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(640.0, 480.0);
  v15[1] = v12;
  v14[2] = *MEMORY[0x263EF9558];
  v2 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(960.0, 540.0);
  v15[2] = v2;
  v14[3] = *MEMORY[0x263EF9530];
  id v3 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(1280.0, 720.0);
  v15[3] = v3;
  v14[4] = JFXAssetExportPresetHEVC1280x720;
  id v4 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(1280.0, 720.0);
  v15[4] = v4;
  v14[5] = JFXAssetExportPresetHEVC1280x720HDR;
  v5 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(1280.0, 720.0);
  v15[5] = v5;
  v14[6] = *MEMORY[0x263EF9538];
  id v6 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(1920.0, 1080.0);
  v15[6] = v6;
  v14[7] = JFXAssetExportPresetHEVC1920x1080;
  double v7 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(1920.0, 1080.0);
  v15[7] = v7;
  v14[8] = JFXAssetExportPresetHEVC1920x1080HDR;
  int v8 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(1920.0, 1080.0);
  v15[8] = v8;
  v14[9] = *MEMORY[0x263EF9540];
  double v9 = (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(3840.0, 2160.0);
  v15[9] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:10];
  id v11 = (void *)videoCompressionSettings__presetToVideoSettingsLUT;
  videoCompressionSettings__presetToVideoSettingsLUT = v10;
}

- (id)audioCompressionSettings
{
  id v3 = objc_opt_class();
  id v4 = [(JFXExportController *)self currentPreset];
  uint64_t v5 = [v3 audioDataRateForPreset:v4];

  id v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  double v7 = [NSNumber numberWithUnsignedInt:1633772320];
  [v6 setObject:v7 forKey:*MEMORY[0x263EF92C0]];

  int v8 = [NSNumber numberWithUnsignedInt:2];
  [v6 setObject:v8 forKey:*MEMORY[0x263EF92E0]];

  double v9 = [NSNumber numberWithUnsignedInt:44100];
  [v6 setObject:v9 forKey:*MEMORY[0x263EF92F8]];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v5];
  [v6 setObject:v10 forKey:*MEMORY[0x263EF92A8]];

  id v11 = [MEMORY[0x263EFF8F8] dataWithBytes:&v14 length:32];
  [v6 setObject:v11 forKey:*MEMORY[0x263EF92A0]];

  double v12 = (void *)[v6 copy];
  return v12;
}

- (id)videoDecompressionSettingsForVideoCompressionSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263EFA458]];
  unsigned int v6 = [v5 unsignedIntValue];

  if (!v6)
  {
    double v7 = JFXLog_export();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[JFXReaderWriterExportController videoDecompressionSettingsForVideoCompressionSettings:]();
    }
  }
  int v8 = [v4 objectForKey:*MEMORY[0x263EFA3E8]];
  unsigned int v9 = [v8 unsignedIntValue];

  if (!v9)
  {
    uint64_t v10 = JFXLog_export();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[JFXReaderWriterExportController videoDecompressionSettingsForVideoCompressionSettings:]();
    }
  }
  v30 = v4;
  uint64_t v11 = v9;
  uint64_t v12 = v6;
  double v13 = [(JFXExportController *)self composition];
  v31 = [v13 compositionOutputColorSpace];

  uint64_t v14 = objc_msgSend(v31, "jfx_getCVPixelFormatForExport");
  uint64_t v15 = ((v9 + 15) & 0x1FFFFFFF0) - v9;
  v29 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v16 = [NSNumber numberWithUnsignedInt:v14];
  uint64_t v28 = *MEMORY[0x263F04180];
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:v12];
  uint64_t v18 = *MEMORY[0x263F04240];
  v19 = [NSNumber numberWithUnsignedInteger:v11];
  uint64_t v20 = *MEMORY[0x263F04118];
  double v21 = [NSNumber numberWithUnsignedInt:4096];
  uint64_t v22 = *MEMORY[0x263F04198];
  v23 = [NSNumber numberWithUnsignedInteger:v15];
  uint64_t v24 = *MEMORY[0x263F040D8];
  v25 = [NSNumber numberWithUnsignedInt:128];
  id v26 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v16, v28, v17, v18, v19, v20, v21, v22, v23, v24, v25, *MEMORY[0x263F04078], 0);

  return v26;
}

- (int64_t)mapAssetReaderStatusToExportStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (int64_t)mapAssetWriterStatusToExportStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)updateStatusAndErrorFromReader:(id)a3 andWriter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[JFXReaderWriterExportController mapAssetReaderStatusToExportStatus:](self, "mapAssetReaderStatusToExportStatus:", [v6 status]);
  int64_t v9 = -[JFXReaderWriterExportController mapAssetWriterStatusToExportStatus:](self, "mapAssetWriterStatusToExportStatus:", [v7 status]);
  int64_t v10 = v9;
  if (v8 <= v9) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = v8;
  }
  [(JFXExportController *)self setStatus:v11];
  uint64_t v12 = JFXLog_DebugExport();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[JFXReaderWriterExportController updateStatusAndErrorFromReader:andWriter:](v8, v10, v12);
  }

  if (v8 == 2 || v10 == 2) {
    [(JFXExportController *)self setStatus:2];
  }
  if (v8 == 4 || v10 == 4) {
    [(JFXExportController *)self setStatus:4];
  }
  if ([(JFXExportController *)self status] == 4)
  {
    double v13 = [v7 error];

    uint64_t v14 = JFXLog_export();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15) {
        -[JFXReaderWriterExportController updateStatusAndErrorFromReader:andWriter:](v7, v14);
      }
    }
    else if (v15)
    {
      -[JFXReaderWriterExportController updateStatusAndErrorFromReader:andWriter:](v6, v14);
    }
  }
}

- (void)updateSessionProgress:(id)a3
{
  id v4 = a3;
  [v4 floatValue];
  double v6 = v5;
  id v7 = [(JFXExportController *)self composition];
  int64_t v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double v9 = CMTimeGetSeconds(&time) * v6;

  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13, v9, 30);
  int64_t v10 = JFXLog_DebugExport();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(JFXReaderWriterExportController *)v4 updateSessionProgress:v9];
  }

  int64_t v11 = [(JFXReaderWriterExportController *)self customCompositor];
  CMTime v12 = v13;
  objc_msgSend(v11, "signalScheduling:playerRate:", &v12, COERCE_DOUBLE(__PAIR64__(HIDWORD(v13.value), 1.0)));
}

- (void)JFX_continueExportForNextPreset
{
}

- (void)transferSampleBuffers:(id)a3 assetReader:(id)a4 assetWriterInput:(id)a5 assetWriter:(id)a6 timeRangeToExport:(id *)a7 queue:(id)a8 pass:(int64_t)a9 completionBlock:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a10;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke;
  v28[3] = &unk_264C0CE48;
  uint64_t v35 = v40;
  id v22 = v18;
  id v29 = v22;
  id v23 = v16;
  id v30 = v23;
  v31 = self;
  long long v24 = *(_OWORD *)&a7->var0.var3;
  long long v37 = *(_OWORD *)&a7->var0.var0;
  long long v38 = v24;
  long long v39 = *(_OWORD *)&a7->var1.var1;
  id v25 = v17;
  id v32 = v25;
  id v26 = v19;
  id v33 = v26;
  int64_t v36 = a9;
  id v27 = v21;
  id v34 = v27;
  [v22 requestMediaDataWhenReadyOnQueue:v20 usingBlock:v28];

  _Block_object_dispose(v40, 8);
}

uint64_t __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke(uint64_t result)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(result + 80) + 8) + 24)) {
    return result;
  }
  uint64_t v1 = result;
  CGSize result = [*(id *)(result + 32) isReadyForMoreMediaData];
  if (!result) {
    return result;
  }
  uint64_t v34 = *MEMORY[0x263EF9D48];
  CFStringRef key = (const __CFString *)*MEMORY[0x263F03ED8];
  CFStringRef v32 = (const __CFString *)*MEMORY[0x263F03FC0];
  CFStringRef v31 = (const __CFString *)*MEMORY[0x263F04020];
  CFTypeRef value = (CFTypeRef)*MEMORY[0x263F03F08];
  CFTypeRef v29 = (CFTypeRef)*MEMORY[0x263F03FD8];
  CFTypeRef v28 = (CFTypeRef)*MEMORY[0x263F04050];
  *(void *)&long long v2 = 134218240;
  long long v27 = v2;
  while (1)
  {
    id v3 = objc_msgSend(*(id *)(v1 + 40), "mediaType", v27);
    int v4 = [v3 isEqualToString:v34];

    float v5 = (void *)MEMORY[0x237DD1350]();
    if ([*(id *)(v1 + 48) cancel])
    {
      long long v24 = JFXLog_DebugExport();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_1();
      }
      goto LABEL_38;
    }
    double v6 = (opaqueCMSampleBuffer *)[*(id *)(v1 + 40) copyNextSampleBuffer];
    id v7 = v6;
    if (!v6)
    {
      long long v24 = JFXLog_DebugExport();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_2(v4, v1, v24);
      }
LABEL_38:

      goto LABEL_39;
    }
    if (v4)
    {
      long long v8 = *(_OWORD *)(v1 + 112);
      *(_OWORD *)buf = *(_OWORD *)(v1 + 96);
      *(_OWORD *)&buf[16] = v8;
      *(_OWORD *)&buf[32] = *(_OWORD *)(v1 + 128);
      memset(&v37, 0, sizeof(v37));
      CMSampleBufferGetOutputPresentationTimeStamp(&v37, v6);
      memset(&v36, 0, sizeof(v36));
      CMTime lhs = v37;
      CMTime rhs = *(CMTime *)buf;
      CMTimeSubtract(&v36, &lhs, &rhs);
      CMTime lhs = v36;
      double Seconds = CMTimeGetSeconds(&lhs);
      CMTime lhs = *(CMTime *)&buf[24];
      double v10 = CMTimeGetSeconds(&lhs);
      int64_t v11 = JFXLog_DebugExport();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(lhs.value) = v27;
        *(CMTimeValue *)((char *)&lhs.value + 4) = v37.value;
        LOWORD(lhs.flags) = 1024;
        *(CMTimeFlags *)((char *)&lhs.flags + 2) = v37.timescale;
        _os_log_debug_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEBUG, "sampleTime=%lld scale=%d", (uint8_t *)&lhs, 0x12u);
      }

      if (v36.flags)
      {
        double v12 = Seconds / v10;
        *(float *)&double v12 = Seconds / v10;
        float v13 = fminf(fmaxf(*(float *)&v12, 0.0), 1.0);
        *(float *)&double v12 = v13;
        [*(id *)(v1 + 48) setProgress:v12];
        uint64_t v14 = *(void **)(v1 + 48);
        *(float *)&double v15 = v13;
        id v16 = [NSNumber numberWithFloat:v15];
        [v14 performSelectorOnMainThread:sel_updateSessionProgress_ withObject:v16 waitUntilDone:1];
      }
      CMTime lhs = v37;
      CMTime rhs = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      if (!CMTimeCompare(&lhs, &rhs))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v7);
        CFTypeRef v18 = CVBufferCopyAttachment(ImageBuffer, key, 0);
        CFTypeRef v19 = CVBufferCopyAttachment(ImageBuffer, v32, 0);
        CFTypeRef v20 = CVBufferCopyAttachment(ImageBuffer, v31, 0);
        id v21 = JFXLog_DebugExport();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(lhs.value) = 138412802;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v18;
          LOWORD(lhs.flags) = 2112;
          *(void *)((char *)&lhs.flags + 2) = v19;
          HIWORD(lhs.epoch) = 2112;
          CFTypeRef v39 = v20;
          _os_log_impl(&dword_234C41000, v21, OS_LOG_TYPE_DEFAULT, "originalColorPrimaries=%@ originalTransferFunction=%@ originalYCbCrMatrix=%@", (uint8_t *)&lhs, 0x20u);
        }

        if (v18 || v19 || v20)
        {
          if (v18) {
            CFRelease(v18);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v20) {
            CFRelease(v20);
          }
        }
        else
        {
          CVBufferSetAttachment(ImageBuffer, key, value, kCVAttachmentMode_ShouldPropagate);
          CVBufferSetAttachment(ImageBuffer, v32, v29, kCVAttachmentMode_ShouldPropagate);
          CVBufferSetAttachment(ImageBuffer, v31, v28, kCVAttachmentMode_ShouldPropagate);
        }
      }
    }
    memset(&lhs, 0, sizeof(lhs));
    CMSampleBufferGetOutputPresentationTimeStamp(&lhs, v7);
    id v22 = JFXLog_DebugExport();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = @"audio";
      if (v4) {
        id v23 = @"video";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = lhs.value;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = lhs.timescale;
      _os_log_impl(&dword_234C41000, v22, OS_LOG_TYPE_DEFAULT, "Export added %@ sample at time %lld scale=%i", buf, 0x1Cu);
    }

    if (([*(id *)(v1 + 32) appendSampleBuffer:v7] & 1) == 0) {
      break;
    }
    CFRelease(v7);
    CGSize result = [*(id *)(v1 + 32) isReadyForMoreMediaData];
    if ((result & 1) == 0) {
      return result;
    }
  }
  [*(id *)(v1 + 48) updateStatusAndErrorFromReader:*(void *)(v1 + 56) andWriter:*(void *)(v1 + 64)];
  id v25 = JFXLog_export();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v26 = [*(id *)(v1 + 48) status];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v26;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v7;
    _os_log_error_impl(&dword_234C41000, v25, OS_LOG_TYPE_ERROR, "appendSampleBuffer failed error=%d %@", buf, 0x12u);
  }

  CFRelease(v7);
LABEL_39:
  *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(v1 + 72) + 16))();
}

- (void)continueExportAfterDelay
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_3(&dword_234C41000, v0, v1, "Failed to create asset reader: %{public}@", v2);
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) markAsFinished];
  [*(id *)(a1 + 40) updateStatusAndErrorFromReader:*(void *)(a1 + 48) andWriter:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 40) status] == 4)
  {
    int v4 = JFXLog_export();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_2(a1);
    }
  }
  float v5 = JFXLog_DebugExport();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_1(a1, a2, v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_53(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if ([*(id *)(a1 + 40) cancel])
  {
    if ([*(id *)(a1 + 56) status] == 1) {
      [*(id *)(a1 + 56) cancelReading];
    }
    if ([*(id *)(a1 + 48) status] == 1) {
      [*(id *)(a1 + 48) cancelWriting];
    }
    id v4 = [MEMORY[0x263F08850] defaultManager];
    long long v2 = [*(id *)(a1 + 40) exportPath];
    [v4 removeItemAtPath:v2 error:0];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_2;
    v5[3] = &unk_264C0A888;
    uint64_t v3 = *(void **)(a1 + 48);
    v5[4] = *(void *)(a1 + 40);
    id v6 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 48);
    [v3 finishWritingWithCompletionHandler:v5];
  }
}

uint64_t __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStatusAndErrorFromReader:*(void *)(a1 + 40) andWriter:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) status] != 3)
  {
    long long v2 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v3 = [*(id *)(a1 + 32) exportPath];
    [v2 removeItemAtPath:v3 error:0];
  }
  [*(id *)(a1 + 32) nextPreset];
  id v4 = [*(id *)(a1 + 32) currentPreset];

  float v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 setProgress:0.0];
    id v6 = *(void **)(a1 + 32);
    return [v6 performSelectorOnMainThread:sel_JFX_continueExportForNextPreset withObject:0 waitUntilDone:0];
  }
  else
  {
    return [v5 closeSessionWithStatus:0];
  }
}

- (void)cancelExportWithStatus:(int64_t)a3
{
  float v5 = JFXLog_DebugExport();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[JFXReaderWriterExportController cancelExportWithStatus:]();
  }

  [(JFXExportController *)self setCancel:1];
  v6.receiver = self;
  v6.super_class = (Class)JFXReaderWriterExportController;
  [(JFXExportController *)&v6 cancelExportWithStatus:a3];
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (PVVideoCompositing)customCompositor
{
  return self->_customCompositor;
}

- (void)setCustomCompositor:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)applyCompositionAspectRatioToAVPresetSize:(double)a3 compositionSize:(double)a4 .cold.1(NSObject *a1, double a2, double a3, double a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v6 = NSStringFromCGSize(*(CGSize *)&a2);
  int v7 = 134218242;
  double v8 = a4;
  __int16 v9 = 2112;
  double v10 = v6;
  _os_log_error_impl(&dword_234C41000, a1, OS_LOG_TYPE_ERROR, "unexpected aspectRatio=%f.3 for composition size=%@", (uint8_t *)&v7, 0x16u);
}

- (void)videoCompressionSettings:.cold.1()
{
  v0 = [MEMORY[0x263EFA7D8] availableOutputSettingsPresets];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "availableOutput: %@", v3, v4, v5, v6, v7);
}

- (void)videoCompressionSettings:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = [a1 currentPreset];
  uint64_t v3 = objc_msgSend(a1, "JFX_videoCompressionSettingsFromAssistant:", v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v4, v5, "compare with assistant videoSettings: %@", v6, v7, v8, v9, v10);
}

- (void)videoCompressionSettings:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_234C41000, v0, OS_LOG_TYPE_DEBUG, "videoSettings: %@", v1, 0xCu);
}

- (void)videoDecompressionSettingsForVideoCompressionSettings:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "export height 0...", v2, v3, v4, v5, v6);
}

- (void)videoDecompressionSettingsForVideoCompressionSettings:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "export width 0...", v2, v3, v4, v5, v6);
}

- (void)updateStatusAndErrorFromReader:(void *)a1 andWriter:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_3(&dword_234C41000, a2, v4, "assetReader.error=%{public}@", v5);
}

- (void)updateStatusAndErrorFromReader:(void *)a1 andWriter:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_3(&dword_234C41000, a2, v4, "assetWriter.error=%{public}@", v5);
}

- (void)updateStatusAndErrorFromReader:(os_log_t)log andWriter:.cold.3(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "updateStatusAndError: readerStatus=%d writerStatus=%d", (uint8_t *)v3, 0xEu);
}

- (void)updateSessionProgress:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [a1 floatValue];
  int v6 = 134218240;
  double v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "updateSessionProgress: progress=%f seconds=%f", (uint8_t *)&v6, 0x16u);
}

void __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "transferSampleBuffers: abortTransfer", v2, v3, v4, v5, v6);
}

void __143__JFXReaderWriterExportController_transferSampleBuffers_assetReader_assetWriterInput_assetWriter_timeRangeToExport_queue_pass_completionBlock___block_invoke_cold_2(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"audio";
  uint64_t v4 = *(void *)(a2 + 88);
  if (a1) {
    uint64_t v3 = @"video";
  }
  int v5 = 138412546;
  uint8_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "transferSampleBuffers: allDone for %@ pass=%ld", (uint8_t *)&v5, 0x16u);
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = [*(id *)(a1 + 72) mediaType];
  int v6 = [v5 isEqualToString:*MEMORY[0x263EF9D48]];
  __int16 v7 = @"audio";
  if (v6) {
    __int16 v7 = @"video";
  }
  int v8 = 138412546;
  uint64_t v9 = v7;
  __int16 v10 = 1024;
  int v11 = a2 & 1;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "single pass: transferSampleBuffers %@ done succeed=%d", (uint8_t *)&v8, 0x12u);
}

void __59__JFXReaderWriterExportController_continueExportAfterDelay__block_invoke_cold_2(uint64_t a1)
{
  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 64));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "read failed on queue:\n%s", v3, v4, v5, v6, v7);
}

- (void)cancelExportWithStatus:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "ReaderWriter -> cancelExport", v2, v3, v4, v5, v6);
}

@end