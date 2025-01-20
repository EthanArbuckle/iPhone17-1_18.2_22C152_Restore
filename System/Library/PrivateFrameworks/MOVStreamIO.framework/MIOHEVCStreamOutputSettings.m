@interface MIOHEVCStreamOutputSettings
+ (BOOL)requiresSWEncoder:(int)a3;
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)AVEEncoderTypeLosslessMasteringLookUp;
+ (id)AVEEncoderTypeProfileLevelLookUp;
+ (id)AVEEncoderTypeRequiresCustomEncodingLookUp;
+ (id)avfEncoderSpecForEncoderType:(int)a3;
+ (id)encoderSpecification;
+ (id)hevcAVFSettingsWithProfileLevel:(id)a3 encoderType:(int)a4 frameRate:(double)a5 dimensions:(id)a6 mastery:(id)a7 enableAVEHighPerformanceProfile:(BOOL)a8;
+ (id)hevcSettingsWithProfileLevel:(id)a3 encoderType:(int)a4 frameRate:(double)a5 mastery:(id)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
+ (id)masteryFromStreamData:(StreamRecordingData *)a3 withFrameRate:(double)a4;
+ (id)outputBitDepthIfRequiredForEncoderType:(int)a3;
+ (id)outputSettings:(int)a3 frameRate:(double)a4 dimensions:(id)a5 mastery:(id)a6 preferEncoderConfig:(BOOL)a7 enableAVEHighPerformanceProfile:(BOOL)a8;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
+ (void)applyHighPerfSettings:(id)a3;
@end

@implementation MIOHEVCStreamOutputSettings

+ (id)AVEEncoderTypeRequiresCustomEncodingLookUp
{
  if (+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::onceToken != -1) {
    dispatch_once(&+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::onceToken, &__block_literal_global_0);
  }
  v2 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::lookUp;

  return v2;
}

void __73__MIOHEVCStreamOutputSettings_AVEEncoderTypeRequiresCustomEncodingLookUp__block_invoke()
{
  v0 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::lookUp;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::lookUp = MEMORY[0x263EFFA78];
}

+ (id)AVEEncoderTypeLosslessMasteringLookUp
{
  if (+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::onceToken != -1) {
    dispatch_once(&+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::onceToken, &__block_literal_global_189);
  }
  v2 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::lookUp;

  return v2;
}

void __68__MIOHEVCStreamOutputSettings_AVEEncoderTypeLosslessMasteringLookUp__block_invoke()
{
  v3[8] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CB7CC48;
  v2[1] = &unk_26CB7CC60;
  v3[0] = MEMORY[0x263EFFA88];
  v3[1] = MEMORY[0x263EFFA88];
  v2[2] = &unk_26CB7CC78;
  v2[3] = &unk_26CB7CC90;
  v3[2] = MEMORY[0x263EFFA88];
  v3[3] = MEMORY[0x263EFFA88];
  v2[4] = &unk_26CB7CCA8;
  v2[5] = &unk_26CB7CCC0;
  v3[4] = MEMORY[0x263EFFA88];
  v3[5] = MEMORY[0x263EFFA88];
  v2[6] = &unk_26CB7CCD8;
  v2[7] = &unk_26CB7CCF0;
  v3[6] = MEMORY[0x263EFFA88];
  v3[7] = MEMORY[0x263EFFA88];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::lookUp;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::lookUp = v0;
}

+ (id)AVEEncoderTypeProfileLevelLookUp
{
  if (+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::onceToken != -1) {
    dispatch_once(&+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::onceToken, &__block_literal_global_206);
  }
  v2 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::lookUp;

  return v2;
}

void __63__MIOHEVCStreamOutputSettings_AVEEncoderTypeProfileLevelLookUp__block_invoke()
{
  v3[16] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CB7CC48;
  v2[1] = &unk_26CB7CD08;
  v3[0] = @"HEVC_Monochrome10_AutoLevel";
  v3[1] = @"HEVC_Monochrome10_AutoLevel";
  v2[2] = &unk_26CB7CC60;
  v2[3] = &unk_26CB7CD20;
  v3[2] = @"HEVC_Monochrome_AutoLevel";
  v3[3] = @"HEVC_Monochrome_AutoLevel";
  v2[4] = &unk_26CB7CC78;
  v2[5] = &unk_26CB7CD38;
  v3[4] = @"HEVC_Main_AutoLevel";
  v3[5] = @"HEVC_Main_AutoLevel";
  v2[6] = &unk_26CB7CC90;
  v2[7] = &unk_26CB7CD50;
  v3[6] = @"HEVC_Main444_AutoLevel";
  v3[7] = @"HEVC_Main444_AutoLevel";
  void v2[8] = &unk_26CB7CCA8;
  v2[9] = &unk_26CB7CD68;
  v3[8] = @"HEVC_Main10_AutoLevel";
  void v3[9] = @"HEVC_Main10_AutoLevel";
  v2[10] = &unk_26CB7CCC0;
  v2[11] = &unk_26CB7CD80;
  v3[10] = @"HEVC_Main44410_AutoLevel";
  v3[11] = @"HEVC_Main44410_AutoLevel";
  v2[12] = &unk_26CB7CCD8;
  v2[13] = &unk_26CB7CD98;
  v3[12] = @"HEVC_Main42210_AutoLevel";
  v3[13] = @"HEVC_Main42210_AutoLevel";
  v2[14] = &unk_26CB7CCF0;
  v2[15] = &unk_26CB7CDB0;
  v3[14] = @"HEVC_Main42210_AutoLevel";
  v3[15] = @"HEVC_Main42210_AutoLevel";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:16];
  v1 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::lookUp;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::lookUp = v0;
}

+ (id)outputBitDepthIfRequiredForEncoderType:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 0x22) {
    return &unk_26CB7CDC8;
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsEncoderType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp];
  v5 = [NSNumber numberWithUnsignedInt:v3];
  v6 = [v4 objectForKey:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  id v22 = a3;
  v11 = [v22 objectForKey:@"StreamEncoderType"];
  uint64_t v12 = [v11 intValue];

  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
  v14 = +[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp];
  BOOL v15 = v8;
  uint64_t v16 = v7;
  v17 = [NSNumber numberWithUnsignedInt:v12];
  v18 = [v14 objectForKey:v17];
  LODWORD(v7) = [v18 BOOLValue];

  if (v7) {
    +[MIOMastery masteryLossless];
  }
  else {
  v19 = +[MIOMastery masteryFromConfig:v22 formatDescription:a4 frameRate:a5];
  }
  v20 = [(id)objc_opt_class() outputSettings:v12 frameRate:Dimensions dimensions:v19 mastery:v15 preferEncoderConfig:v16 enableAVEHighPerformanceProfile:a5];
  [v20 applyAdditionalCompressionPropertiesFromRecordingConfig:v22];

  return v20;
}

+ (id)outputSettings:(int)a3 frameRate:(double)a4 dimensions:(id)a5 mastery:(id)a6 preferEncoderConfig:(BOOL)a7 enableAVEHighPerformanceProfile:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = *(void *)&a3;
  id v12 = a6;
  v13 = +[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp];
  v14 = [NSNumber numberWithUnsignedInt:v11];
  BOOL v15 = [v13 objectForKey:v14];

  if (!v15)
  {
    id v23 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08428] reason:@"HEVC config not available." userInfo:0];
    objc_exception_throw(v23);
  }
  if (a7) {
    goto LABEL_4;
  }
  uint64_t v16 = +[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp];
  v17 = [NSNumber numberWithUnsignedInt:v11];
  v18 = [v16 objectForKey:v17];
  char v19 = [v18 BOOLValue];

  if (v19)
  {
LABEL_4:
    uint64_t v20 = [(id)objc_opt_class() hevcSettingsWithProfileLevel:v15 encoderType:v11 frameRate:v12 mastery:v8 enableAVEHighPerformanceProfile:a4];
  }
  else
  {
    uint64_t v20 = [(id)objc_opt_class() hevcAVFSettingsWithProfileLevel:v15 encoderType:v11 frameRate:a5 dimensions:v12 mastery:v8 enableAVEHighPerformanceProfile:a4];
  }
  v21 = (void *)v20;
  if (!v20)
  {
    id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08428] reason:@"HEVC config not available." userInfo:0];
    objc_exception_throw(v24);
  }

  return v21;
}

+ (id)hevcAVFSettingsWithProfileLevel:(id)a3 encoderType:(int)a4 frameRate:(double)a5 dimensions:(id)a6 mastery:(id)a7 enableAVEHighPerformanceProfile:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v12 = *(void *)&a4;
  v34[4] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a7;
  uint64_t v15 = *MEMORY[0x263F1E638];
  v30 = v14;
  v34[0] = v13;
  uint64_t v16 = *MEMORY[0x263F1E548];
  v33[0] = v15;
  v33[1] = v16;
  v17 = [NSNumber numberWithDouble:a5];
  v33[2] = *MEMORY[0x263F1E5C8];
  v34[1] = v17;
  v34[2] = &unk_26CB7D470;
  v18 = [v14 propertyKey];
  v33[3] = v18;
  char v19 = [v14 propertyValue];
  v34[3] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
  v21 = (void *)[v20 mutableCopy];

  id v22 = [(id)objc_opt_class() outputBitDepthIfRequiredForEncoderType:v12];
  if (v22) {
    [v21 setObject:v22 forKey:@"OutputBitDepth"];
  }
  [(id)objc_opt_class() adjustAVFCompressionProperties:v21 encoderType:v12];
  if (v8) {
    [(id)objc_opt_class() applyHighPerfSettings:v21];
  }
  uint64_t v23 = *MEMORY[0x263EFA338];
  v32[0] = *MEMORY[0x263EFA370];
  uint64_t v24 = *MEMORY[0x263EFA458];
  v31[0] = v23;
  v31[1] = v24;
  v25 = [NSNumber numberWithInt:a6];
  v32[1] = v25;
  v31[2] = *MEMORY[0x263EFA3E8];
  v26 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&a6)];
  v31[3] = *MEMORY[0x263EFA3A0];
  v32[2] = v26;
  v32[3] = v21;
  v27 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

  v28 = [[MOVStreamOutputSettings alloc] initWithSettings:v27];

  return v28;
}

+ (id)hevcSettingsWithProfileLevel:(id)a3 encoderType:(int)a4 frameRate:(double)a5 mastery:(id)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a4;
  v26[5] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x263F1E650];
  v25[0] = *MEMORY[0x263F1E638];
  v25[1] = v13;
  v26[0] = v11;
  v26[1] = MEMORY[0x263EFFA88];
  v25[2] = *MEMORY[0x263F1E548];
  id v14 = [NSNumber numberWithDouble:a5];
  v25[3] = *MEMORY[0x263F1E5C8];
  v26[2] = v14;
  v26[3] = &unk_26CB7D470;
  uint64_t v15 = [v12 propertyKey];
  v25[4] = v15;
  uint64_t v16 = [v12 propertyValue];
  v26[4] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
  v18 = (void *)[v17 mutableCopy];

  char v19 = [(id)objc_opt_class() outputBitDepthIfRequiredForEncoderType:v10];
  if (v19) {
    [v18 setObject:v19 forKey:@"OutputBitDepth"];
  }
  if (v7) {
    [(id)objc_opt_class() applyHighPerfSettings:v18];
  }
  uint64_t v20 = [MOVStreamEncoderConfig alloc];
  v21 = [(id)objc_opt_class() encoderSpecification];
  id v22 = [(MOVStreamEncoderConfig *)v20 initWithCodecType:1752589105 encoderSpecification:v21 sessionProperties:v18];

  uint64_t v23 = [[MOVStreamOutputSettings alloc] initWithConfig:v22];

  return v23;
}

+ (id)encoderSpecification
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F1ED58];
  v5[0] = MEMORY[0x263EFFA88];
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

+ (void)applyHighPerfSettings:(id)a3
{
  id v3 = a3;
  [v3 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
  [v3 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
  [v3 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
}

+ (id)masteryFromStreamData:(StreamRecordingData *)a3 withFrameRate:(double)a4
{
  unint64_t v5 = +[MOVStreamOutputSettings getBitsPerSecondForColorStream:frameRate:](MOVStreamOutputSettings, "getBitsPerSecondForColorStream:frameRate:", a4);
  +[MOVStreamOutputSettings getQualitySetting:a3];
  if (v6 >= 0.0) {
    +[MIOMastery masteryWithQuality:](MIOMastery, "masteryWithQuality:");
  }
  else {
  BOOL v7 = +[MIOMastery masteryWithBitrate:(double)v5];
  }

  return v7;
}

+ (id)avfEncoderSpecForEncoderType:(int)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() requiresSWEncoder:*(void *)&a3])
  {
    uint64_t v5 = *MEMORY[0x263F1ED50];
    v6[0] = MEMORY[0x263EFFA80];
    id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA78];
  }

  return v3;
}

+ (BOOL)requiresSWEncoder:(int)a3
{
  return 0;
}

@end