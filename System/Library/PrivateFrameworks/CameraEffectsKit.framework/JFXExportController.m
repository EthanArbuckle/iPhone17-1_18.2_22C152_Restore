@interface JFXExportController
+ (id)presetNameForCGSize:(CGSize)a3;
+ (unint64_t)audioDataRateForPreset:(id)a3;
+ (unint64_t)dataRateForPreset:(id)a3 size:(CGSize)a4;
+ (unint64_t)estimatedFileSizeForDuration:(int)a3 frameRate:(double)a4 preset:(id)a5 size:(CGSize)a6;
+ (unint64_t)videoDataRateForPreset:(id)a3 size:(CGSize)a4;
- (BOOL)cancel;
- (JFXComposition)composition;
- (JFXExportController)initWithWithComposition:(id)a3 presets:(id)a4 toFile:(id)a5 poster:(id)a6 delegate:(id)a7;
- (JFXExportDelegate)delegate;
- (NSArray)presets;
- (NSString)currentPreset;
- (NSString)exportPath;
- (NSTimer)progressTimer;
- (UIImage)poster;
- (float)progress;
- (id)metadataToAdd;
- (int64_t)status;
- (unint64_t)exportDuration;
- (unint64_t)exportStartTime;
- (unint64_t)exportingIndexPresets;
- (void)analyticsForSessionBegin;
- (void)analyticsForSessionCompleteWithStatus:(int64_t)a3;
- (void)beginAsynchronousExport;
- (void)closeSessionWithStatus:(int64_t)a3;
- (void)informDelegateOfCompletion;
- (void)nextPreset;
- (void)serviceProgressTimer:(id)a3;
- (void)setCancel:(BOOL)a3;
- (void)setComposition:(id)a3;
- (void)setCurrentPreset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExportPath:(id)a3;
- (void)setExportStartTime:(unint64_t)a3;
- (void)setExportingIndexPresets:(unint64_t)a3;
- (void)setPoster:(id)a3;
- (void)setPresets:(id)a3;
- (void)setProgressTimer:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)startProgressTimer;
- (void)stopProgressTimer;
- (void)updateProgressViewWithProgress:(float)a3 reduced:(BOOL)a4;
@end

@implementation JFXExportController

- (JFXExportController)initWithWithComposition:(id)a3 presets:(id)a4 toFile:(id)a5 poster:(id)a6 delegate:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)JFXExportController;
  v17 = [(JFXExportController *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_composition, a3);
    objc_storeStrong((id *)&v18->_presets, a4);
    v18->_exportingIndexPresets = 0;
    objc_storeStrong((id *)&v18->_exportPath, a5);
    currentPreset = v18->_currentPreset;
    v18->_currentPreset = 0;

    v18->_cancel = 0;
    v18->_status = 0;
    objc_storeStrong((id *)&v18->_poster, a6);
    objc_storeStrong((id *)&v18->_delegate, a7);
    if (![(NSArray *)v18->_presets count])
    {
      v20 = JFXLog_export();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[JFXExportController initWithWithComposition:presets:toFile:poster:delegate:](v20);
      }
    }
  }

  return v18;
}

+ (unint64_t)estimatedFileSizeForDuration:(int)a3 frameRate:(double)a4 preset:(id)a5 size:(CGSize)a6
{
  if (!a5) {
    return 0;
  }
  float v6 = a4;
  return a3
       / vcvtps_u32_f32(v6)
       * (unint64_t)((double)(unint64_t)objc_msgSend(a1, "dataRateForPreset:size:", a5, a6.width, a6.height)* 0.125* 1.05);
}

+ (unint64_t)dataRateForPreset:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(a1, "videoDataRateForPreset:size:", v7, width, height);
  uint64_t v9 = [a1 audioDataRateForPreset:v7];

  return v9 + v8;
}

+ (unint64_t)videoDataRateForPreset:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if (videoDataRateForPreset_size__onceToken != -1) {
    dispatch_once(&videoDataRateForPreset_size__onceToken, &__block_literal_global_40);
  }
  id v7 = [(id)videoDataRateForPreset_size__presetToDataRateLUT objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [(id)videoDataRateForPreset_size__presetToDataRateLUT objectForKeyedSubscript:v6];
    unint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    unint64_t v9 = 10500000;
  }
  char v10 = [v6 isEqualToString:JFXAssetExportPresetLowQuality];
  BOOL IsSquare = CGSizeIsSquare(width, height);
  char v12 = v10 ^ 1;
  if (!IsSquare) {
    char v12 = 0;
  }
  unint64_t v13 = v9 >> v12;

  return v13;
}

void __51__JFXExportController_videoDataRateForPreset_size___block_invoke()
{
  v6[10] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EF9550];
  v5[0] = JFXAssetExportPresetLowQuality;
  v5[1] = v0;
  v6[0] = &unk_26E801920;
  v6[1] = &unk_26E801938;
  uint64_t v1 = *MEMORY[0x263EF9530];
  v5[2] = *MEMORY[0x263EF9558];
  v5[3] = v1;
  v6[2] = &unk_26E801950;
  v6[3] = &unk_26E801968;
  v5[4] = JFXAssetExportPresetHEVC1280x720;
  v5[5] = JFXAssetExportPresetHEVC1280x720HDR;
  v6[4] = &unk_26E801968;
  v6[5] = &unk_26E801968;
  v5[6] = *MEMORY[0x263EF9538];
  v5[7] = JFXAssetExportPresetHEVC1920x1080;
  v6[6] = &unk_26E801980;
  v6[7] = &unk_26E801980;
  uint64_t v2 = *MEMORY[0x263EF9540];
  v5[8] = JFXAssetExportPresetHEVC1920x1080HDR;
  v5[9] = v2;
  v6[8] = &unk_26E801980;
  v6[9] = &unk_26E801998;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:10];
  v4 = (void *)videoDataRateForPreset_size__presetToDataRateLUT;
  videoDataRateForPreset_size__presetToDataRateLUT = v3;
}

+ (unint64_t)audioDataRateForPreset:(id)a3
{
  unint64_t v3 = 256000;
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x263EF9530]] & 1) == 0
    && ![v4 isEqualToString:*MEMORY[0x263EF9538]])
  {
    unint64_t v3 = 128000;
  }

  return v3;
}

+ (id)presetNameForCGSize:(CGSize)a3
{
  double v3 = a3.width * a3.height;
  if (v3 >= 8294400.0)
  {
    id v4 = (id *)MEMORY[0x263EF9540];
  }
  else if (v3 >= 2073600.0)
  {
    id v4 = (id *)MEMORY[0x263EF9538];
  }
  else if (v3 >= 921600.0)
  {
    id v4 = (id *)MEMORY[0x263EF9530];
  }
  else
  {
    id v4 = (id *)MEMORY[0x263EF9558];
    if (v3 < 518400.0) {
      id v4 = (id *)MEMORY[0x263EF9550];
    }
  }
  id v5 = *v4;
  return v5;
}

- (void)nextPreset
{
  unint64_t v3 = [(JFXExportController *)self exportingIndexPresets];
  id v4 = [(JFXExportController *)self presets];
  unint64_t v5 = [v4 count];

  if (v3 >= v5)
  {
    [(JFXExportController *)self setCurrentPreset:0];
  }
  else
  {
    id v6 = [(JFXExportController *)self presets];
    id v7 = [v6 objectAtIndex:self->_exportingIndexPresets];
    [(JFXExportController *)self setCurrentPreset:v7];

    unint64_t v8 = [(JFXExportController *)self exportingIndexPresets] + 1;
    [(JFXExportController *)self setExportingIndexPresets:v8];
  }
}

- (void)beginAsynchronousExport
{
  [(JFXExportController *)self nextPreset];
  [(JFXExportController *)self analyticsForSessionBegin];
  [(JFXExportController *)self updateProgressViewWithProgress:0 reduced:0.0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__JFXExportController_beginAsynchronousExport__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__JFXExportController_beginAsynchronousExport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueExportAfterDelay];
}

- (void)closeSessionWithStatus:(int64_t)a3
{
  [(JFXExportController *)self analyticsForSessionCompleteWithStatus:a3];
  +[JFXExportController cancelPreviousPerformRequestsWithTarget:self];
  [(JFXExportController *)self stopProgressTimer];
  [(JFXExportController *)self informDelegateOfCompletion];
}

- (void)informDelegateOfCompletion
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ([(JFXExportController *)self cancel]) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 2 * ([(JFXExportController *)self status] != 3);
    }
    delegate = self->_delegate;
    [(JFXExportDelegate *)delegate didFinishExport:v3];
  }
}

- (void)startProgressTimer
{
  [(JFXExportController *)self stopProgressTimer];
  uint64_t v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_serviceProgressTimer_ selector:0 userInfo:1 repeats:0.5];
  [(JFXExportController *)self setProgressTimer:v3];

  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v4 setIdleTimerDisabled:0];

  id v5 = [MEMORY[0x263F1C408] sharedApplication];
  [v5 setIdleTimerDisabled:1];
}

- (void)stopProgressTimer
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    [(NSTimer *)progressTimer invalidate];
    [(JFXExportController *)self setProgressTimer:0];
    id v4 = MEMORY[0x263EF83A0];
    dispatch_async(v4, &__block_literal_global_33_0);
  }
}

void __40__JFXExportController_stopProgressTimer__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C408] sharedApplication];
  [v0 setIdleTimerDisabled:1];

  id v1 = [MEMORY[0x263F1C408] sharedApplication];
  [v1 setIdleTimerDisabled:0];
}

- (void)serviceProgressTimer:(id)a3
{
  [(JFXExportController *)self progress];
  -[JFXExportController updateProgressViewWithProgress:reduced:](self, "updateProgressViewWithProgress:reduced:", 1);
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v4 setIdleTimerDisabled:0];

  id v5 = [MEMORY[0x263F1C408] sharedApplication];
  [v5 setIdleTimerDisabled:1];
}

- (float)progress
{
  return 0.5;
}

- (void)updateProgressViewWithProgress:(float)a3 reduced:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(JFXExportController *)self presets];
  unint64_t v8 = [v7 count];

  if (v8 >= 2)
  {
    unint64_t v9 = [(JFXExportController *)self presets];
    float v10 = 1.0 / (double)(unint64_t)[v9 count];

    a3 = (float)(v10 * a3)
       + v10 * (float)([(JFXExportController *)self exportingIndexPresets] - 1);
  }
  v11 = [(JFXExportController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    if (v4)
    {
      float v13 = a3 * 0.95;
      a3 = v13;
    }
    id v15 = [(JFXExportController *)self delegate];
    *(float *)&double v14 = a3;
    [v15 exportProgressedTo:v14];
  }
}

- (id)metadataToAdd
{
  uint64_t v3 = [MEMORY[0x263EFF8C0] array];
  BOOL v4 = [(JFXExportController *)self poster];

  id v5 = (void *)MEMORY[0x263EF9E88];
  if (v4)
  {
    id v6 = [(JFXExportController *)self poster];
    id v7 = UIImageJPEGRepresentation(v6, 0.8);

    unint64_t v8 = [(JFXExportController *)self poster];
    [v8 size];
    double v10 = v9;

    if (v10 > 0.0 && v7)
    {
      v11 = [MEMORY[0x263EFA790] metadataItem];
      [v11 setKeySpace:*v5];
      [v11 setKey:*MEMORY[0x263EF9F70]];
      [v11 setValue:v7];
      uint64_t v12 = [v3 arrayByAddingObject:v11];

      uint64_t v3 = (void *)v12;
    }
    [(JFXExportController *)self setPoster:0];
  }
  float v13 = [MEMORY[0x263EFA790] metadataItem];
  [v13 setKeySpace:*v5];
  [v13 setKey:*MEMORY[0x263EF9F88]];
  double v14 = [MEMORY[0x263F086E0] mainBundle];
  id v15 = [v14 bundleIdentifier];
  id v16 = [v15 pathExtension];
  [v13 setValue:v16];

  v17 = [v3 arrayByAddingObject:v13];

  return v17;
}

- (unint64_t)exportDuration
{
  uint64_t v3 = mach_absolute_time();
  return v3 - [(JFXExportController *)self exportStartTime];
}

- (void)analyticsForSessionBegin
{
  uint64_t v3 = [(JFXExportController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(JFXExportController *)self delegate];
    [v5 exportAnalyticsForSessionBegin];
  }
  uint64_t v6 = mach_absolute_time();
  [(JFXExportController *)self setExportStartTime:v6];
}

- (void)analyticsForSessionCompleteWithStatus:(int64_t)a3
{
  id v5 = [(JFXExportController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(JFXExportController *)self delegate];
    objc_msgSend(v7, "exportAnalyticsForSessionCompleteWithStatus:exportMachDuration:", a3, -[JFXExportController exportDuration](self, "exportDuration"));
  }
}

- (unint64_t)exportStartTime
{
  return self->_exportStartTime;
}

- (void)setExportStartTime:(unint64_t)a3
{
  self->_exportStartTime = a3;
}

- (JFXComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (NSArray)presets
{
  return self->_presets;
}

- (void)setPresets:(id)a3
{
}

- (NSString)currentPreset
{
  return self->_currentPreset;
}

- (void)setCurrentPreset:(id)a3
{
}

- (UIImage)poster
{
  return self->_poster;
}

- (void)setPoster:(id)a3
{
}

- (JFXExportDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)exportPath
{
  return self->_exportPath;
}

- (void)setExportPath:(id)a3
{
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
}

- (unint64_t)exportingIndexPresets
{
  return self->_exportingIndexPresets;
}

- (void)setExportingIndexPresets:(unint64_t)a3
{
  self->_exportingIndexPresets = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_exportPath, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_poster, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_presets, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)initWithWithComposition:(os_log_t)log presets:toFile:poster:delegate:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "export created with NO presets", v1, 2u);
}

@end