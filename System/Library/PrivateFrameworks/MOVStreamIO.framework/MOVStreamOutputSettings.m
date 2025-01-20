@interface MOVStreamOutputSettings
+ (BOOL)isBitDepth10Encoding:(int)a3;
+ (BOOL)isLosslessColorEncoding:(int)a3;
+ (BOOL)supportsEncoderType:(int)a3;
+ (double)getQualitySetting:(StreamRecordingData *)a3;
+ (id)addAdditionalCompressionProperties:(id)a3 recordingConfig:(id)a4;
+ (id)audioSettings:(StreamRecordingData *)a3;
+ (id)customEncoderSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)generalHEVCColorSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)h264Settings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevc10bitMonochromeLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevc10bitMonochromeSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevc8bitMonochromeLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevc8bitMonochromeSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevc8bitWithAlphaLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevc8bitWithAlphaSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevcColorLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevcColorSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)hevcColorSettingsLossless:(BOOL)a3 quality:(double)a4 bitsPerSecond:(unint64_t)a5 bitDepth10:(BOOL)a6 chromaSampling:(int64_t)a7 frameRate:(double)a8 dimensions:(id)a9 enableAVEHighPerformanceProfile:(BOOL)a10;
+ (id)jpegSettings:(StreamRecordingData *)a3 frameRate:(double)a4;
+ (id)outputSettingsForStream:(StreamRecordingData *)a3 defaultFrameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)prores422Settings:(StreamRecordingData *)a3 frameRate:(double)a4;
+ (id)prores4444Settings:(StreamRecordingData *)a3 frameRate:(double)a4;
+ (id)proresRAWHQSettings:(StreamRecordingData *)a3 frameRate:(double)a4;
+ (id)proresRAWSettings:(StreamRecordingData *)a3 frameRate:(double)a4;
+ (id)slimSettings:(StreamRecordingData *)a3 frameRate:(double)a4;
+ (int)encoderTypeFromStreamData:(StreamRecordingData *)a3;
+ (int)matchDeprecatedType:(int)a3;
+ (int64_t)chromaSamplingEncoding:(int)a3;
+ (unint64_t)applyBitrateModifiersTo:(unint64_t)a3;
+ (unint64_t)getBitsPerSecondForColorStream:(StreamRecordingData *)a3 frameRate:(double)a4;
- (BOOL)useCustomEncoderConfig;
- (MOVStreamEncoderConfig)config;
- (MOVStreamOutputSettings)init;
- (MOVStreamOutputSettings)initWithConfig:(id)a3;
- (MOVStreamOutputSettings)initWithFrameRate:(double)a3;
- (MOVStreamOutputSettings)initWithFrameRate:(double)a3 useCustomEncoderConfig:(BOOL)a4;
- (MOVStreamOutputSettings)initWithSettings:(id)a3;
- (NSDictionary)settings;
- (double)expectedFrameRate;
- (void)applyAdditionalCompressionPropertiesFromRecordingConfig:(id)a3;
- (void)setConfig:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation MOVStreamOutputSettings

- (MOVStreamOutputSettings)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOVStreamOutputSettings;
  v2 = [(MOVStreamOutputSettings *)&v7 init];
  v3 = v2;
  if (v2)
  {
    settings = v2->_settings;
    v2->_settings = 0;

    config = v3->_config;
    v3->_config = 0;

    v3->_useCustomEncoderConfig = 0;
    v3->_expectedFrameRate = 0.0;
  }
  return v3;
}

- (MOVStreamOutputSettings)initWithSettings:(id)a3
{
  id v5 = a3;
  v6 = [(MOVStreamOutputSettings *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (MOVStreamOutputSettings)initWithConfig:(id)a3
{
  id v5 = a3;
  v6 = [(MOVStreamOutputSettings *)self init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_useCustomEncoderConfig = 1;
  }

  return v7;
}

- (MOVStreamOutputSettings)initWithFrameRate:(double)a3
{
  result = [(MOVStreamOutputSettings *)self init];
  if (result) {
    result->_expectedFrameRate = a3;
  }
  return result;
}

- (MOVStreamOutputSettings)initWithFrameRate:(double)a3 useCustomEncoderConfig:(BOOL)a4
{
  result = [(MOVStreamOutputSettings *)self init];
  if (result)
  {
    result->_useCustomEncoderConfig = a4;
    result->_expectedFrameRate = a3;
  }
  return result;
}

+ (BOOL)supportsEncoderType:(int)a3
{
  return 1;
}

+ (int)encoderTypeFromStreamData:(StreamRecordingData *)a3
{
  id v3 = a3->var5;
  v4 = v3;
  if (!v3) {
    __assert_rtn("+[MOVStreamOutputSettings encoderTypeFromStreamData:]", "MOVStreamOutputSettings.mm", 106, "configuration");
  }
  id v5 = [v3 objectForKey:@"StreamEncoderType"];
  uint64_t v6 = [v5 intValue];

  int v7 = [(id)objc_opt_class() matchDeprecatedType:v6];
  return v7;
}

+ (id)outputSettingsForStream:(StreamRecordingData *)a3 defaultFrameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3->var5;
  if (!v8) {
    __assert_rtn("+[MOVStreamOutputSettings outputSettingsForStream:defaultFrameRate:enableAVEHighPerformanceProfile:]", "MOVStreamOutputSettings.mm", 119, "configuration");
  }
  int v9 = [(id)objc_opt_class() encoderTypeFromStreamData:a3];
  v10 = [v8 objectForKey:@"ExpectedFrameRateForStream"];
  v11 = v10;
  if (v10)
  {
    [v10 doubleValue];
    a4 = v12;
  }
  int v13 = v9 - 1;
  v14 = 0;
  switch(v13)
  {
    case 0:
      uint64_t v16 = +[MOVStreamOutputSettings slimSettings:a3 frameRate:a4];
      goto LABEL_24;
    case 3:
      v15 = +[MOVStreamOutputSettings hevc10bitMonochromeLosslessSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 4:
      v15 = +[MOVStreamOutputSettings hevc10bitMonochromeSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 5:
      v15 = +[MOVStreamOutputSettings hevc8bitMonochromeLosslessSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 6:
      v15 = +[MOVStreamOutputSettings hevc8bitMonochromeSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 7:
      uint64_t v16 = +[MOVStreamOutputSettings h264Settings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_24;
    case 8:
      v15 = +[MOVStreamOutputSettings hevcColorSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 9:
      v15 = +[MOVStreamOutputSettings hevc8bitWithAlphaLosslessSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 10:
      v15 = +[MOVStreamOutputSettings hevc8bitWithAlphaSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 11:
      v15 = +[MOVStreamOutputSettings hevcColorLosslessSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_6;
    case 13:
      uint64_t v16 = +[MOVStreamOutputSettings prores4444Settings:a3 frameRate:a4];
      goto LABEL_24;
    case 14:
      uint64_t v16 = +[MOVStreamOutputSettings prores422Settings:a3 frameRate:a4];
      goto LABEL_24;
    case 15:
      uint64_t v16 = +[MOVStreamOutputSettings audioSettings:a3];
      goto LABEL_24;
    case 16:
      goto LABEL_25;
    case 17:
      uint64_t v16 = +[MOVStreamOutputSettings customEncoderSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
      goto LABEL_24;
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 26:
    case 27:
    case 33:
    case 34:
      v15 = +[MOVStreamOutputSettings generalHEVCColorSettings:a3 frameRate:v5 enableAVEHighPerformanceProfile:a4];
LABEL_6:
      v14 = v15;
      [v15 applyAdditionalCompressionPropertiesFromRecordingConfig:v8];
      goto LABEL_25;
    case 28:
      uint64_t v16 = +[MOVStreamOutputSettings proresRAWSettings:a3 frameRate:a4];
      goto LABEL_24;
    case 29:
      uint64_t v16 = +[MOVStreamOutputSettings proresRAWHQSettings:a3 frameRate:a4];
      goto LABEL_24;
    case 32:
      uint64_t v16 = +[MOVStreamOutputSettings jpegSettings:a3 frameRate:a4];
LABEL_24:
      v14 = (void *)v16;
LABEL_25:

      return v14;
    default:
      id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid encoder type." userInfo:0];
      objc_exception_throw(v18);
  }
}

- (void)applyAdditionalCompressionPropertiesFromRecordingConfig:(id)a3
{
  id v15 = a3;
  v4 = [(MOVStreamOutputSettings *)self settings];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(MOVStreamOutputSettings *)self settings];
    uint64_t v7 = *MEMORY[0x263EFA3A0];
    id v8 = [v6 objectForKey:*MEMORY[0x263EFA3A0]];

    int v9 = +[MOVStreamOutputSettings addAdditionalCompressionProperties:v8 recordingConfig:v15];
    if (v9)
    {
      v10 = [(MOVStreamOutputSettings *)self settings];
      v11 = (void *)[v10 mutableCopy];

      [v11 setObject:v9 forKey:v7];
      double v12 = (void *)[v11 copy];
      [(MOVStreamOutputSettings *)self setSettings:v12];

LABEL_7:
    }
  }
  else
  {
    int v13 = [(MOVStreamOutputSettings *)self config];

    if (!v13) {
      goto LABEL_9;
    }
    v14 = [(MOVStreamOutputSettings *)self config];
    id v8 = [v14 sessionProperties];

    int v9 = +[MOVStreamOutputSettings addAdditionalCompressionProperties:v8 recordingConfig:v15];
    if (v9)
    {
      v11 = [(MOVStreamOutputSettings *)self config];
      [v11 setSessionProperties:v9];
      goto LABEL_7;
    }
  }

LABEL_9:
}

+ (id)customEncoderSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(a3->var5, "objectForKey:", @"CustomEncoderConfig", a5);
  if (v6) {
    uint64_t v7 = [[MOVStreamOutputSettings alloc] initWithConfig:v6];
  }
  else {
    uint64_t v7 = [[MOVStreamOutputSettings alloc] initWithFrameRate:1 useCustomEncoderConfig:a4];
  }
  id v8 = v7;

  return v8;
}

+ (id)audioSettings:(StreamRecordingData *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = [a3->var5 objectForKey:@"AudioFormatObject"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 settings];
    [v4 addEntriesFromDictionary:v7];
  }
  id v8 = [a3->var5 objectForKey:@"AdditionalAudioSettings"];
  if ([v8 count]) {
    [v4 addEntriesFromDictionary:v8];
  }
  if ([v4 count])
  {
    int v9 = [MOVStreamOutputSettings alloc];
    v10 = (void *)[v4 copy];
    v11 = [(MOVStreamOutputSettings *)v9 initWithSettings:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)isLosslessColorEncoding:(int)a3
{
  return (a3 < 0x24) & (0x811501000uLL >> a3);
}

+ (BOOL)isBitDepth10Encoding:(int)a3
{
  return (a3 - 19) < 6;
}

+ (int64_t)chromaSamplingEncoding:(int)a3
{
  if ((a3 - 21) > 0xE) {
    return 0;
  }
  else {
    return qword_21B661520[a3 - 21];
  }
}

+ (id)generalHEVCColorSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v9 = [(id)objc_opt_class() getBitsPerSecondForColorStream:a3 frameRate:a4];
  [(id)objc_opt_class() getQualitySetting:a3];
  double v11 = v10;
  double v12 = [a3->var5 objectForKey:@"StreamEncoderType"];
  uint64_t v13 = [v12 intValue];

  BOOL v14 = +[MOVStreamOutputSettings isLosslessColorEncoding:v13];
  int64_t v15 = +[MOVStreamOutputSettings chromaSamplingEncoding:v13];
  BOOL v16 = +[MOVStreamOutputSettings isBitDepth10Encoding:v13];

  return +[MOVStreamOutputSettings hevcColorSettingsLossless:v14 quality:v9 bitsPerSecond:v16 bitDepth10:v15 chromaSampling:Dimensions frameRate:v5 dimensions:v11 enableAVEHighPerformanceProfile:a4];
}

+ (id)hevcColorSettingsLossless:(BOOL)a3 quality:(double)a4 bitsPerSecond:(unint64_t)a5 bitDepth10:(BOOL)a6 chromaSampling:(int64_t)a7 frameRate:(double)a8 dimensions:(id)a9 enableAVEHighPerformanceProfile:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v13 = a6;
  BOOL v17 = a3;
  v38[2] = *MEMORY[0x263EF8340];
  v37[0] = *MEMORY[0x263EFA3B8];
  id v18 = [NSNumber numberWithDouble:a8];
  v38[0] = v18;
  v37[1] = *MEMORY[0x263EFA3F0];
  v19 = [NSNumber numberWithDouble:round(a8)];
  v38[1] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v21 = (void *)[v20 mutableCopy];

  if (v17)
  {
    [v21 setObject:&unk_26CB7D4F0 forKey:*MEMORY[0x263EFA428]];
  }
  else
  {
    if (a4 >= 0.0)
    {
      v22 = [NSNumber numberWithDouble:a4];
      [v21 setObject:v22 forKey:*MEMORY[0x263EFA428]];
    }
    else
    {
      v22 = [NSNumber numberWithUnsignedLong:a5];
      [v21 setObject:v22 forKey:*MEMORY[0x263EFA318]];
    }
  }
  v23 = +[MOVStreamOptions sharedOptions];
  int v24 = [v23 disableFrameReordering];

  if (v24) {
    [v21 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (!v13)
  {
    switch(a7)
    {
      case 0:
        v25 = @"HEVC_Main_AutoLevel";
        goto LABEL_18;
      case 2:
        v25 = @"HEVC_Main444_AutoLevel";
        goto LABEL_18;
      case 1:
        [v21 setObject:&unk_26CB7D3E0 forKey:@"OutputBitDepth"];
        unint64_t v26 = 0x263F08000;
        v25 = @"HEVC_Main42210_AutoLevel";
        goto LABEL_19;
    }
    int v34 = 477;
LABEL_26:
    __assert_rtn("+[MOVStreamOutputSettings hevcColorSettingsLossless:quality:bitsPerSecond:bitDepth10:chromaSampling:frameRate:dimensions:enableAVEHighPerformanceProfile:]", "MOVStreamOutputSettings.mm", v34, "0");
  }
  if ((unint64_t)a7 >= 3)
  {
    int v34 = 460;
    goto LABEL_26;
  }
  v25 = off_2643AFA70[a7];
LABEL_18:
  unint64_t v26 = 0x263F08000uLL;
LABEL_19:
  [v21 setObject:v25 forKey:*MEMORY[0x263EFA420]];
  if (v10)
  {
    [v21 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v21 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v21 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  uint64_t v27 = *MEMORY[0x263EFA338];
  v36[0] = *MEMORY[0x263EFA370];
  uint64_t v28 = *MEMORY[0x263EFA458];
  v35[0] = v27;
  v35[1] = v28;
  v29 = [*(id *)(v26 + 2584) numberWithInt:a9];
  v36[1] = v29;
  v35[2] = *MEMORY[0x263EFA3E8];
  v30 = [*(id *)(v26 + 2584) numberWithInt:HIDWORD(*(unint64_t *)&a9)];
  v35[3] = *MEMORY[0x263EFA3A0];
  v36[2] = v30;
  v36[3] = v21;
  v31 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];

  v32 = [[MOVStreamOutputSettings alloc] initWithSettings:v31];

  return v32;
}

+ (id)proresRAWSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v5 = *MEMORY[0x263EFA338];
  v13[0] = @"aprn";
  uint64_t v6 = *MEMORY[0x263EFA458];
  v12[0] = v5;
  v12[1] = v6;
  uint64_t v7 = [NSNumber numberWithInt:Dimensions];
  v13[1] = v7;
  v12[2] = *MEMORY[0x263EFA3E8];
  id v8 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
  v13[2] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  BOOL v10 = [[MOVStreamOutputSettings alloc] initWithSettings:v9];

  return v10;
}

+ (id)proresRAWHQSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v5 = *MEMORY[0x263EFA338];
  v13[0] = @"aprh";
  uint64_t v6 = *MEMORY[0x263EFA458];
  v12[0] = v5;
  v12[1] = v6;
  uint64_t v7 = [NSNumber numberWithInt:Dimensions];
  v13[1] = v7;
  v12[2] = *MEMORY[0x263EFA3E8];
  id v8 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
  v13[2] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  BOOL v10 = [[MOVStreamOutputSettings alloc] initWithSettings:v9];

  return v10;
}

+ (id)prores4444Settings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  v21[3] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  id var5 = a3->var5;
  if (var5
    && ([var5 objectForKey:@"ProResEncodingQuality"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [a3->var5 objectForKey:@"ProResEncodingQuality"];
    uint64_t v9 = (int)[v8 intValue];

    BOOL v10 = (__CFString *)(id)*MEMORY[0x263EFA360];
    double v11 = v10;
    if (v9 != 1)
    {
      if (v9)
      {
        id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08428] reason:@"ProRes4444 only supports high and medium quality setting." userInfo:0];
        objc_exception_throw(v19);
      }

      double v11 = @"ap4x";
    }
  }
  else
  {
    double v11 = (__CFString *)(id)*MEMORY[0x263EFA360];
  }
  uint64_t v12 = *MEMORY[0x263EFA338];
  v21[0] = v11;
  uint64_t v13 = *MEMORY[0x263EFA458];
  v20[0] = v12;
  v20[1] = v13;
  BOOL v14 = [NSNumber numberWithInt:Dimensions];
  v21[1] = v14;
  v20[2] = *MEMORY[0x263EFA3E8];
  int64_t v15 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  v21[2] = v15;
  BOOL v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  BOOL v17 = [[MOVStreamOutputSettings alloc] initWithSettings:v16];

  return v17;
}

+ (id)prores422Settings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  v21[3] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  id var5 = a3->var5;
  if (var5
    && ([var5 objectForKey:@"ProResEncodingQuality"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [a3->var5 objectForKey:@"ProResEncodingQuality"];
    uint64_t v9 = (int)[v8 intValue];

    id v10 = (id)*MEMORY[0x263EFA340];
    if (v9 == 3)
    {
      double v11 = (id *)MEMORY[0x263EFA358];
    }
    else if (v9 == 2)
    {
      double v11 = (id *)MEMORY[0x263EFA350];
    }
    else
    {
      if (v9) {
        goto LABEL_11;
      }
      double v11 = (id *)MEMORY[0x263EFA348];
    }
    id v12 = *v11;

    id v10 = v12;
  }
  else
  {
    id v10 = (id)*MEMORY[0x263EFA340];
  }
LABEL_11:
  uint64_t v13 = *MEMORY[0x263EFA338];
  v21[0] = v10;
  uint64_t v14 = *MEMORY[0x263EFA458];
  v20[0] = v13;
  v20[1] = v14;
  int64_t v15 = [NSNumber numberWithInt:Dimensions];
  v21[1] = v15;
  v20[2] = *MEMORY[0x263EFA3E8];
  BOOL v16 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  v21[2] = v16;
  BOOL v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  id v18 = [[MOVStreamOutputSettings alloc] initWithSettings:v17];

  return v18;
}

+ (id)hevc10bitMonochromeLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  v29[2] = *MEMORY[0x263EF8340];
  id v8 = +[MOVStreamOptions sharedOptions];
  char v9 = [v8 force10bitMonoByVT];

  if (v9)
  {
    id v10 = [[MOVStreamOutputSettings alloc] initWithFrameRate:a4];
  }
  else
  {
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
    v28[0] = *MEMORY[0x263EFA3B8];
    id v12 = [NSNumber numberWithDouble:a4];
    v29[0] = v12;
    v28[1] = *MEMORY[0x263EFA3F0];
    uint64_t v13 = [NSNumber numberWithDouble:round(a4)];
    v29[1] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    int64_t v15 = (void *)[v14 mutableCopy];

    BOOL v16 = +[MOVStreamIOUtility AVEProfileLevel10BitMonochrome];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA420]];
    BOOL v17 = +[MOVStreamOptions sharedOptions];
    LODWORD(v14) = [v17 disableFrameReordering];

    if (v14) {
      [v15 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
    }
    if (+[MIOLog debugEnabled])
    {
      id v18 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_DEBUG, "MOVStreamWriter: Disable 'AllowFrameReordering' related to r50244907.", v25, 2u);
      }
    }
    [v15 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
    [v15 setObject:&unk_26CB7D4F0 forKey:*MEMORY[0x263EFA428]];
    if (v5)
    {
      [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
      [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
      [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
    }
    uint64_t v19 = *MEMORY[0x263EFA338];
    v27[0] = *MEMORY[0x263EFA370];
    uint64_t v20 = *MEMORY[0x263EFA458];
    v26[0] = v19;
    v26[1] = v20;
    v21 = [NSNumber numberWithInt:Dimensions];
    v27[1] = v21;
    v26[2] = *MEMORY[0x263EFA3E8];
    v22 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
    v26[3] = *MEMORY[0x263EFA3A0];
    v27[2] = v22;
    v27[3] = v15;
    v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

    id v10 = [[MOVStreamOutputSettings alloc] initWithSettings:v23];
  }

  return v10;
}

+ (id)hevc10bitMonochromeSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = [(id)objc_opt_class() getBitsPerSecondForColorStream:a3 frameRate:a4];
  [(id)objc_opt_class() getQualitySetting:a3];
  if (v8 >= 0.0) {
    +[MOVStreamEncoderConfig monochrome10BitEncoderConfigUsingAVEWithQuality:](MOVStreamEncoderConfig, "monochrome10BitEncoderConfigUsingAVEWithQuality:");
  }
  else {
  char v9 = +[MOVStreamEncoderConfig monochrome10BitEncoderConfigUsingAVEWithBitrate:v7];
  }
  id v10 = v9;
  if (v5) {
    [v9 enableAVEHighPerformanceProfile];
  }
  double v11 = [[MOVStreamOutputSettings alloc] initWithConfig:v10];

  return v11;
}

+ (id)hevcColorLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  v25[3] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v8 = *MEMORY[0x263EFA428];
  v25[0] = &unk_26CB7D4F0;
  uint64_t v9 = *MEMORY[0x263EFA3B8];
  v24[0] = v8;
  v24[1] = v9;
  id v10 = [NSNumber numberWithDouble:a4];
  v25[1] = v10;
  v24[2] = *MEMORY[0x263EFA3F0];
  double v11 = [NSNumber numberWithDouble:round(a4)];
  v25[2] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  uint64_t v13 = (void *)[v12 mutableCopy];

  uint64_t v14 = +[MOVStreamOptions sharedOptions];
  LODWORD(v11) = [v14 disableFrameReordering];

  if (v11) {
    [v13 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (v5)
  {
    [v13 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v13 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v13 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  uint64_t v15 = *MEMORY[0x263EFA338];
  v23[0] = *MEMORY[0x263EFA370];
  uint64_t v16 = *MEMORY[0x263EFA458];
  v22[0] = v15;
  v22[1] = v16;
  BOOL v17 = [NSNumber numberWithInt:Dimensions];
  v23[1] = v17;
  v22[2] = *MEMORY[0x263EFA3E8];
  id v18 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  v22[3] = *MEMORY[0x263EFA3A0];
  v23[2] = v18;
  v23[3] = v13;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  uint64_t v20 = [[MOVStreamOutputSettings alloc] initWithSettings:v19];

  return v20;
}

+ (id)hevc8bitMonochromeLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  v28[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = (const opaqueCMFormatDescription *)objc_msgSend(a3->var11, "createTrackFormatDescriptionFromStreamData:");
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v7);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v9 = +[MOVStreamOptions sharedOptions];
  int v10 = [v9 forceLossless8bitMonoByVT];

  if (v10)
  {
    double v11 = [[MOVStreamOutputSettings alloc] initWithFrameRate:a4];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x263EFA428];
    v28[0] = &unk_26CB7D4F0;
    uint64_t v13 = *MEMORY[0x263EFA3B8];
    v27[0] = v12;
    v27[1] = v13;
    uint64_t v14 = [NSNumber numberWithDouble:a4];
    v28[1] = v14;
    v27[2] = *MEMORY[0x263EFA3F0];
    uint64_t v15 = [NSNumber numberWithDouble:round(a4)];
    void v28[2] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    BOOL v17 = (void *)[v16 mutableCopy];

    id v18 = +[MOVStreamOptions sharedOptions];
    LODWORD(v15) = [v18 disableFrameReordering];

    if (v15) {
      [v17 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
    }
    [v17 setObject:*MEMORY[0x263F1EB80] forKey:*MEMORY[0x263EFA420]];
    if (v5)
    {
      [v17 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
      [v17 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
      [v17 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
    }
    uint64_t v19 = *MEMORY[0x263EFA338];
    v26[0] = *MEMORY[0x263EFA370];
    uint64_t v20 = *MEMORY[0x263EFA458];
    v25[0] = v19;
    v25[1] = v20;
    v21 = [NSNumber numberWithInt:Dimensions];
    v26[1] = v21;
    v25[2] = *MEMORY[0x263EFA3E8];
    v22 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
    v25[3] = *MEMORY[0x263EFA3A0];
    v26[2] = v22;
    v26[3] = v17;
    v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

    double v11 = [[MOVStreamOutputSettings alloc] initWithSettings:v23];
  }

  return v11;
}

+ (id)hevc8bitMonochromeSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  v30[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = (const opaqueCMFormatDescription *)objc_msgSend(a3->var11, "createTrackFormatDescriptionFromStreamData:");
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v8);
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v10 = [(id)objc_opt_class() getBitsPerSecondForColorStream:a3 frameRate:a4];
  [(id)objc_opt_class() getQualitySetting:a3];
  double v12 = v11;
  v29[0] = *MEMORY[0x263EFA3B8];
  uint64_t v13 = [NSNumber numberWithDouble:a4];
  v30[0] = v13;
  v29[1] = *MEMORY[0x263EFA3F0];
  uint64_t v14 = [NSNumber numberWithDouble:round(a4)];
  v30[1] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  uint64_t v16 = (void *)[v15 mutableCopy];

  if (v12 >= 0.0)
  {
    BOOL v17 = [NSNumber numberWithDouble:v12];
    [v16 setObject:v17 forKey:*MEMORY[0x263EFA428]];
  }
  else
  {
    BOOL v17 = [NSNumber numberWithUnsignedLong:v10];
    [v16 setObject:v17 forKey:*MEMORY[0x263EFA318]];
  }

  id v18 = +[MOVStreamOptions sharedOptions];
  int v19 = [v18 disableFrameReordering];

  if (v19) {
    [v16 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (v5)
  {
    [v16 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v16 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v16 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  [v16 setObject:*MEMORY[0x263F1EB80] forKey:*MEMORY[0x263EFA420]];
  uint64_t v20 = *MEMORY[0x263EFA338];
  v28[0] = *MEMORY[0x263EFA370];
  uint64_t v21 = *MEMORY[0x263EFA458];
  v27[0] = v20;
  v27[1] = v21;
  v22 = [NSNumber numberWithInt:Dimensions];
  v28[1] = v22;
  v27[2] = *MEMORY[0x263EFA3E8];
  v23 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  void v27[3] = *MEMORY[0x263EFA3A0];
  void v28[2] = v23;
  v28[3] = v16;
  int v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];

  v25 = [[MOVStreamOutputSettings alloc] initWithSettings:v24];

  return v25;
}

+ (id)hevcColorSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  void v29[2] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v9 = [(id)objc_opt_class() getBitsPerSecondForColorStream:a3 frameRate:a4];
  [(id)objc_opt_class() getQualitySetting:a3];
  double v11 = v10;
  v28[0] = *MEMORY[0x263EFA3B8];
  double v12 = [NSNumber numberWithDouble:a4];
  v29[0] = v12;
  v28[1] = *MEMORY[0x263EFA3F0];
  uint64_t v13 = [NSNumber numberWithDouble:round(a4)];
  v29[1] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if (v11 >= 0.0)
  {
    uint64_t v16 = [NSNumber numberWithDouble:v11];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA428]];
  }
  else
  {
    uint64_t v16 = [NSNumber numberWithUnsignedLong:v9];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA318]];
  }

  BOOL v17 = +[MOVStreamOptions sharedOptions];
  int v18 = [v17 disableFrameReordering];

  if (v18) {
    [v15 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (v5)
  {
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  uint64_t v19 = *MEMORY[0x263EFA338];
  v27[0] = *MEMORY[0x263EFA370];
  uint64_t v20 = *MEMORY[0x263EFA458];
  v26[0] = v19;
  v26[1] = v20;
  uint64_t v21 = [NSNumber numberWithInt:Dimensions];
  v27[1] = v21;
  v26[2] = *MEMORY[0x263EFA3E8];
  v22 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  v26[3] = *MEMORY[0x263EFA3A0];
  v27[2] = v22;
  void v27[3] = v15;
  v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  int v24 = [[MOVStreamOutputSettings alloc] initWithSettings:v23];

  return v24;
}

+ (id)hevc8bitWithAlphaLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  void v23[4] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  v22[0] = *MEMORY[0x263EFA3B8];
  uint64_t v8 = [NSNumber numberWithDouble:a4];
  v23[0] = v8;
  v22[1] = *MEMORY[0x263EFA3F0];
  uint64_t v9 = [NSNumber numberWithDouble:round(a4)];
  v23[1] = v9;
  v23[2] = &unk_26CB7D4F0;
  v22[2] = @"Quality";
  v22[3] = @"AllowFrameReordering";
  v23[3] = MEMORY[0x263EFFA80];
  double v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  double v11 = (void *)[v10 mutableCopy];

  double v12 = +[MOVStreamOptions sharedOptions];
  LODWORD(v9) = [v12 disableFrameReordering];

  if (v9) {
    [v11 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (v5)
  {
    [v11 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v11 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v11 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  uint64_t v13 = *MEMORY[0x263EFA338];
  v21[0] = *MEMORY[0x263EFA378];
  uint64_t v14 = *MEMORY[0x263EFA458];
  v20[0] = v13;
  v20[1] = v14;
  uint64_t v15 = [NSNumber numberWithInt:Dimensions];
  v21[1] = v15;
  v20[2] = *MEMORY[0x263EFA3E8];
  uint64_t v16 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  void v20[3] = *MEMORY[0x263EFA3A0];
  v21[2] = v16;
  v21[3] = v11;
  BOOL v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  int v18 = [[MOVStreamOutputSettings alloc] initWithSettings:v17];

  return v18;
}

+ (id)hevc8bitWithAlphaSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  void v29[3] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v9 = [(id)objc_opt_class() getBitsPerSecondForColorStream:a3 frameRate:a4];
  [(id)objc_opt_class() getQualitySetting:a3];
  double v11 = v10;
  v28[0] = *MEMORY[0x263EFA3B8];
  double v12 = [NSNumber numberWithDouble:a4];
  v29[0] = v12;
  v28[1] = *MEMORY[0x263EFA3F0];
  uint64_t v13 = [NSNumber numberWithDouble:round(a4)];
  void v28[2] = @"AllowFrameReordering";
  v29[1] = v13;
  void v29[2] = MEMORY[0x263EFFA80];
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if (v11 >= 0.0)
  {
    uint64_t v16 = [NSNumber numberWithDouble:v11];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA428]];
  }
  else
  {
    uint64_t v16 = [NSNumber numberWithUnsignedLong:v9];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA318]];
  }

  BOOL v17 = +[MOVStreamOptions sharedOptions];
  int v18 = [v17 disableFrameReordering];

  if (v18) {
    [v15 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (v5)
  {
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  uint64_t v19 = *MEMORY[0x263EFA338];
  v27[0] = *MEMORY[0x263EFA378];
  uint64_t v20 = *MEMORY[0x263EFA458];
  v26[0] = v19;
  v26[1] = v20;
  uint64_t v21 = [NSNumber numberWithInt:Dimensions];
  v27[1] = v21;
  v26[2] = *MEMORY[0x263EFA3E8];
  v22 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  v26[3] = *MEMORY[0x263EFA3A0];
  v27[2] = v22;
  void v27[3] = v15;
  v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  int v24 = [[MOVStreamOutputSettings alloc] initWithSettings:v23];

  return v24;
}

+ (id)h264Settings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  BOOL v5 = a5;
  void v29[2] = *MEMORY[0x263EF8340];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v9 = [(id)objc_opt_class() getBitsPerSecondForColorStream:a3 frameRate:a4];
  [(id)objc_opt_class() getQualitySetting:a3];
  double v11 = v10;
  v28[0] = *MEMORY[0x263EFA3B8];
  double v12 = [NSNumber numberWithDouble:a4];
  v29[0] = v12;
  v28[1] = *MEMORY[0x263EFA3F0];
  uint64_t v13 = [NSNumber numberWithDouble:round(a4)];
  v29[1] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if (v11 >= 0.0)
  {
    uint64_t v16 = [NSNumber numberWithDouble:v11];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA428]];
  }
  else
  {
    uint64_t v16 = [NSNumber numberWithUnsignedLong:v9];
    [v15 setObject:v16 forKey:*MEMORY[0x263EFA318]];
  }

  BOOL v17 = +[MOVStreamOptions sharedOptions];
  int v18 = [v17 disableFrameReordering];

  if (v18) {
    [v15 setObject:MEMORY[0x263EFFA80] forKey:@"AllowFrameReordering"];
  }
  if (v5)
  {
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
    [v15 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  }
  uint64_t v19 = *MEMORY[0x263EFA338];
  v27[0] = *MEMORY[0x263EFA368];
  uint64_t v20 = *MEMORY[0x263EFA458];
  v26[0] = v19;
  v26[1] = v20;
  uint64_t v21 = [NSNumber numberWithInt:Dimensions];
  v27[1] = v21;
  v26[2] = *MEMORY[0x263EFA3E8];
  v22 = [NSNumber numberWithInt:HIDWORD(Dimensions)];
  v26[3] = *MEMORY[0x263EFA3A0];
  v27[2] = v22;
  void v27[3] = v15;
  v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  int v24 = [[MOVStreamOutputSettings alloc] initWithSettings:v23];

  return v24;
}

+ (id)slimSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v6 = *MEMORY[0x263EFA338];
  v22[0] = @"slim";
  uint64_t v7 = *MEMORY[0x263EFA458];
  v21[0] = v6;
  v21[1] = v7;
  uint64_t v8 = [NSNumber numberWithInt:Dimensions];
  v22[1] = v8;
  v21[2] = *MEMORY[0x263EFA3E8];
  uint64_t v9 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
  v22[2] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  id var5 = a3->var5;
  if (var5)
  {
    double v12 = [var5 objectForKey:@"UseSlimXCompression"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      uint64_t v14 = (void *)[v10 mutableCopy];
      uint64_t v19 = @"InternalCodecType";
      uint64_t v20 = &unk_26CB7D3F8;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [v14 setObject:v15 forKey:*MEMORY[0x263EFA3A0]];
      uint64_t v16 = [v14 copy];

      double v10 = (void *)v16;
    }
  }
  BOOL v17 = [[MOVStreamOutputSettings alloc] initWithSettings:v10];

  return v17;
}

+ (id)jpegSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  uint64_t v6 = *MEMORY[0x263EFA338];
  v25[0] = *MEMORY[0x263EFA380];
  uint64_t v7 = *MEMORY[0x263EFA458];
  v24[0] = v6;
  v24[1] = v7;
  uint64_t v8 = [NSNumber numberWithInt:Dimensions];
  v25[1] = v8;
  v24[2] = *MEMORY[0x263EFA3E8];
  uint64_t v9 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
  v25[2] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

  id var5 = a3->var5;
  if (var5)
  {
    double v12 = [var5 objectForKey:@"EncodingQuality"];
    int v13 = v12;
    if (v12)
    {
      [v12 doubleValue];
      +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:");
      double v15 = v14;
      uint64_t v16 = (void *)[v10 mutableCopy];
      uint64_t v22 = *MEMORY[0x263EFA428];
      BOOL v17 = [NSNumber numberWithDouble:v15];
      v23 = v17;
      int v18 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

      [v16 setObject:v18 forKey:*MEMORY[0x263EFA3A0]];
      uint64_t v19 = (void *)[v16 copy];
    }
    else
    {
      uint64_t v19 = v10;
    }
  }
  else
  {
    uint64_t v19 = v10;
  }
  uint64_t v20 = [[MOVStreamOutputSettings alloc] initWithSettings:v19];

  return v20;
}

+ (unint64_t)getBitsPerSecondForColorStream:(StreamRecordingData *)a3 frameRate:(double)a4
{
  id v6 = a3->var5;
  uint64_t v7 = v6;
  if (v6
    && ([v6 objectForKey:@"ColorStreamBitrate"],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v9 = objc_msgSend((id)objc_opt_class(), "applyBitrateModifiersTo:", objc_msgSend(v8, "integerValue"));
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
    double v11 = [v7 objectForKey:@"StreamEncoderType"];
    uint64_t v12 = [v11 intValue];

    unint64_t v9 = objc_msgSend((id)objc_opt_class(), "applyBitrateModifiersTo:", +[MOVStreamIOUtility getDefaultBitrateForVideoDimension:atExpectedFramerate:forEncoderType:](MOVStreamIOUtility, "getDefaultBitrateForVideoDimension:atExpectedFramerate:forEncoderType:", Dimensions, v12, a4));
  }

  return v9;
}

+ (double)getQualitySetting:(StreamRecordingData *)a3
{
  id v3 = a3->var5;
  v4 = v3;
  double v5 = -1.0;
  if (v3)
  {
    id v6 = [v3 objectForKey:@"EncodingQuality"];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:");
      double v5 = v8;
    }
  }

  return v5;
}

+ (unint64_t)applyBitrateModifiersTo:(unint64_t)a3
{
  v4 = +[MOVStreamOptions sharedOptions];
  [v4 bitrateMultiplier];
  double v6 = v5;

  uint64_t v7 = +[MOVStreamOptions sharedOptions];
  unint64_t v8 = [v7 bitrateOverride];
  unint64_t v9 = vcvtad_u64_f64(v6 * (double)a3);
  if (v6 > 0.0) {
    a3 = v9;
  }

  if (v8) {
    return v8;
  }
  else {
    return a3;
  }
}

+ (int)matchDeprecatedType:(int)a3
{
  if (a3 == 3) {
    int v3 = 4;
  }
  else {
    int v3 = a3;
  }
  if (a3 == 13) {
    int v3 = 1;
  }
  if (a3 == 2) {
    return 1;
  }
  else {
    return v3;
  }
}

+ (id)addAdditionalCompressionProperties:(id)a3 recordingConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"AdditionalCompressionProperties"];
  if (v7) {
    unint64_t v8 = (void *)v7;
  }
  else {
    unint64_t v8 = (void *)MEMORY[0x263EFFA78];
  }
  unint64_t v9 = (void *)[v5 mutableCopy];
  [v9 addEntriesFromDictionary:MEMORY[0x263EFFA78]];
  [v9 addEntriesFromDictionary:v8];
  double v10 = [v6 objectForKey:@"AllowFrameReordering"];
  double v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "BOOLValue"));
    [v9 setObject:v12 forKey:*MEMORY[0x263F1E4C8]];
  }
  int v13 = (void *)[v9 copy];

  return v13;
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
}

- (MOVStreamEncoderConfig)config
{
  return (MOVStreamEncoderConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
}

- (BOOL)useCustomEncoderConfig
{
  return self->_useCustomEncoderConfig;
}

- (double)expectedFrameRate
{
  return self->_expectedFrameRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end