@interface CAMTimelapseSettings
+ (id)sharedInstance;
- (CAMTimelapseSettings)init;
- (double)initialCaptureTimeInterval;
- (double)maxOutputFPS;
- (double)maxOutputLength;
- (double)waitTimeBeforeNextWriteForNumberOfPreviousAttempts:(int64_t)a3;
- (id)_outputSettingsPresetForWidth:(int64_t)a3 height:(int64_t)a4;
- (id)outputSettingsForWidth:(int64_t)a3 height:(int64_t)a4 videoFormatDescription:(opaqueCMFormatDescription *)a5 framesPerSecond:(int64_t)a6 frameCount:(int64_t)a7 useHEVC:(BOOL)a8;
- (int64_t)_averageMovieBitrateForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5;
- (int64_t)maxFailedStateReadAttempts;
- (int64_t)maxMovieFileLengthForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5;
- (int64_t)maxMovieWriteAttempts;
- (int64_t)maxOutputFrames;
- (int64_t)minAvailableBytesNeededForCaptureForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5;
@end

@implementation CAMTimelapseSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __38__CAMTimelapseSettings_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CAMTimelapseSettings);
  uint64_t v1 = sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (CAMTimelapseSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)CAMTimelapseSettings;
  result = [(CAMTimelapseSettings *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_initialCaptureTimeInterval = xmmword_209C7B670;
    result->_maxOutputLength = 40.0;
  }
  return result;
}

- (int64_t)maxOutputFrames
{
  [(CAMTimelapseSettings *)self maxOutputLength];
  double v4 = v3;
  [(CAMTimelapseSettings *)self maxOutputFPS];
  return (uint64_t)(v4 * v5);
}

- (int64_t)_averageMovieBitrateForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5
{
  if (a5) {
    return 15000000;
  }
  v6 = self;
  v7 = [(CAMTimelapseSettings *)self _outputSettingsPresetForWidth:a3 height:a4];
  v8 = [MEMORY[0x263EFA7D8] outputSettingsAssistantWithPreset:v7];
  LODWORD(v6) = (int)v6->_maxOutputFPS;
  CMTimeMake(&v14, 1, (int32_t)v6);
  [v8 setSourceVideoAverageFrameDuration:&v14];
  CMTimeMake(&v13, 1, (int32_t)v6);
  [v8 setSourceVideoMinFrameDuration:&v13];
  v9 = [v8 videoSettings];
  v10 = [v9 objectForKey:*MEMORY[0x263EFA3A0]];
  v11 = [v10 objectForKey:*MEMORY[0x263EFA318]];
  int64_t v5 = (uint64_t)((double)[v11 integerValue] * 1.25);

  return v5;
}

- (int64_t)maxMovieFileLengthForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5
{
  uint64_t v6 = [(CAMTimelapseSettings *)self _averageMovieBitrateForWidth:a3 height:a4 useHEVC:a5];
  [(CAMTimelapseSettings *)self maxOutputLength];
  return (uint64_t)(v7 * (double)v6 * 1.05 * 0.125);
}

- (int64_t)minAvailableBytesNeededForCaptureForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5
{
  return [(CAMTimelapseSettings *)self maxMovieFileLengthForWidth:a3 height:a4 useHEVC:a5]+ 60 * (972800 * a3 * a4 / 2073600);
}

- (id)_outputSettingsPresetForWidth:(int64_t)a3 height:(int64_t)a4
{
  uint64_t v6 = [MEMORY[0x263EFA7D8] availableOutputSettingsPresets];
  double v7 = v6;
  if (a3 >= a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = a3;
  }
  if (a3 <= a4) {
    int64_t v9 = a4;
  }
  else {
    int64_t v9 = a3;
  }
  if (v9 == 1920 && v8 == 1080)
  {
    v10 = (void *)MEMORY[0x263EF9FF0];
    goto LABEL_16;
  }
  if (v9 == 1280 && v8 == 720)
  {
    v10 = (void *)MEMORY[0x263EF9FE8];
    goto LABEL_16;
  }
  if (v9 == 960 && v8 == 540)
  {
    v10 = (void *)MEMORY[0x263EFA000];
LABEL_16:
    v11 = (void *)*v10;
    if ([v6 containsObject:*v10]) {
      goto LABEL_18;
    }
  }
  v11 = (void *)*MEMORY[0x263EF9FF8];
LABEL_18:
  id v12 = v11;

  return v12;
}

- (id)outputSettingsForWidth:(int64_t)a3 height:(int64_t)a4 videoFormatDescription:(opaqueCMFormatDescription *)a5 framesPerSecond:(int64_t)a6 frameCount:(int64_t)a7 useHEVC:(BOOL)a8
{
  BOOL v28 = a8;
  double v13 = (double)a7 / (double)a6;
  v30 = -[CAMTimelapseSettings _outputSettingsPresetForWidth:height:](self, "_outputSettingsPresetForWidth:height:");
  CMTime v14 = objc_msgSend(MEMORY[0x263EFA7D8], "outputSettingsAssistantWithPreset:");
  CMTimeMake(&v32, 1, a6);
  [v14 setSourceVideoAverageFrameDuration:&v32];
  CMTimeMake(&v31, 1, a6);
  [v14 setSourceVideoMinFrameDuration:&v31];
  [v14 setSourceVideoFormat:a5];
  v15 = [v14 videoSettings];
  v16 = (void *)[v15 mutableCopy];

  [v16 setObject:*MEMORY[0x263EFA440] forKey:*MEMORY[0x263EFA438]];
  v17 = [NSNumber numberWithInteger:a3];
  [v16 setObject:v17 forKey:*MEMORY[0x263EFA458]];

  v18 = [NSNumber numberWithInteger:a4];
  [v16 setObject:v18 forKey:*MEMORY[0x263EFA3E8]];

  uint64_t v19 = *MEMORY[0x263EFA3A0];
  v20 = [v16 objectForKey:*MEMORY[0x263EFA3A0]];
  v21 = (void *)[v20 mutableCopy];

  if (!v21)
  {
    v21 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v22 = [NSNumber numberWithInteger:a7];
  [v21 setObject:v22 forKey:*MEMORY[0x263F1E658]];

  v23 = [NSNumber numberWithInteger:a6];
  [v21 setObject:v23 forKey:*MEMORY[0x263F1E548]];

  v24 = [NSNumber numberWithDouble:v13];
  [v21 setObject:v24 forKey:*MEMORY[0x263F1E540]];

  if (v28)
  {
    [v16 setObject:*MEMORY[0x263EFA370] forKey:*MEMORY[0x263EFA338]];
    [v21 setObject:*MEMORY[0x263F1EB70] forKey:*MEMORY[0x263EFA420]];
    [v21 removeObjectForKey:*MEMORY[0x263EFA3E0]];
    [v21 setObject:&unk_26BDDE940 forKey:*MEMORY[0x263F1E5B0]];
    [v21 setObject:&unk_26BDDE958 forKey:*MEMORY[0x263F1E5D8]];
  }
  int64_t v25 = [(CAMTimelapseSettings *)self _averageMovieBitrateForWidth:a3 height:a4 useHEVC:v28];
  v26 = [NSNumber numberWithInteger:v25];
  [v21 setObject:v26 forKey:*MEMORY[0x263EFA318]];

  [v16 setObject:v21 forKey:v19];
  return v16;
}

- (int64_t)maxMovieWriteAttempts
{
  return 5;
}

- (double)waitTimeBeforeNextWriteForNumberOfPreviousAttempts:(int64_t)a3
{
  if (a3 < 1) {
    return 0.0;
  }
  else {
    return (double)(10 * (1 << (a3 - 1)));
  }
}

- (int64_t)maxFailedStateReadAttempts
{
  return 10;
}

- (double)initialCaptureTimeInterval
{
  return self->_initialCaptureTimeInterval;
}

- (double)maxOutputFPS
{
  return self->_maxOutputFPS;
}

- (double)maxOutputLength
{
  return self->_maxOutputLength;
}

@end