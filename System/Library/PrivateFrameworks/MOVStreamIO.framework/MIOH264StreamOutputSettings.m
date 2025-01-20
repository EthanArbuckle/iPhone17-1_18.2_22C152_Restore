@interface MIOH264StreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)outputSettingsMastery:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOH264StreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 8;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v11 = +[MIOMastery masteryFromConfig:formatDescription:frameRate:](MIOMastery, "masteryFromConfig:formatDescription:frameRate:", a3);
  v12 = [(id)objc_opt_class() outputSettingsMastery:v11 formatDescription:a4 defaultFrameRate:v8 preferEncoderConfig:v7 enableAVEHighPerformanceProfile:a5];

  return v12;
}

+ (id)outputSettingsMastery:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v39[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (v8)
  {
    uint64_t v12 = *MEMORY[0x263F1E650];
    v39[0] = MEMORY[0x263EFFA88];
    uint64_t v13 = *MEMORY[0x263F1E548];
    v38[0] = v12;
    v38[1] = v13;
    v14 = [NSNumber numberWithDouble:a5];
    v38[2] = *MEMORY[0x263F1E5C8];
    v39[1] = v14;
    v39[2] = &unk_26CB7D4D0;
    v15 = [v11 propertyKey];
    v38[3] = v15;
    v16 = [v11 propertyValue];
    v39[3] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    v18 = (void *)[v17 mutableCopy];

    if (v7) {
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:v18];
    }
    v19 = [MOVStreamEncoderConfig alloc];
    v20 = +[MIOHEVCStreamOutputSettings encoderSpecification];
    v21 = [(MOVStreamEncoderConfig *)v19 initWithCodecType:1635148593 encoderSpecification:v20 sessionProperties:v18];

    v22 = [[MOVStreamOutputSettings alloc] initWithConfig:v21];
  }
  else
  {
    v36[0] = *MEMORY[0x263EFA3B8];
    v23 = [NSNumber numberWithDouble:a5];
    v37[0] = v23;
    v36[1] = *MEMORY[0x263EFA3F0];
    v24 = [NSNumber numberWithDouble:round(a5)];
    v37[1] = v24;
    v25 = [v11 propertyKey];
    v36[2] = v25;
    v26 = [v11 propertyValue];
    v37[2] = v26;
    v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    v18 = (void *)[v27 mutableCopy];

    if (v7) {
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:v18];
    }
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    uint64_t v29 = *MEMORY[0x263EFA338];
    v35[0] = *MEMORY[0x263EFA368];
    v30 = objc_msgSend(NSNumber, "numberWithInt:", Dimensions, v29, *MEMORY[0x263EFA458]);
    v35[1] = v30;
    v34[2] = *MEMORY[0x263EFA3E8];
    v31 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
    v34[3] = *MEMORY[0x263EFA3A0];
    v35[2] = v31;
    v35[3] = v18;
    v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

    v22 = [[MOVStreamOutputSettings alloc] initWithSettings:v21];
  }
  v32 = v22;

  return v32;
}

@end