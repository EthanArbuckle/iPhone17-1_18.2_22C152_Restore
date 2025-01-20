@interface MIOHEVCAlphaStreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOHEVCAlphaStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 10;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v42[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v36 = (id)*MEMORY[0x263EFA378];
  v12 = [v11 objectForKey:@"StreamEncoderType"];
  int v13 = [v12 intValue];

  if (v13 == 10) {
    +[MIOMastery masteryLossless];
  }
  else {
  v14 = +[MIOMastery masteryFromConfig:v11 formatDescription:a4 frameRate:a5];
  }
  if (v8)
  {
    uint64_t v15 = *MEMORY[0x263F1E650];
    v42[0] = MEMORY[0x263EFFA88];
    uint64_t v16 = *MEMORY[0x263F1E548];
    v41[0] = v15;
    v41[1] = v16;
    v17 = [NSNumber numberWithDouble:a5];
    v41[2] = *MEMORY[0x263F1E5C8];
    v42[1] = v17;
    v42[2] = &unk_26CB7D480;
    v18 = [v14 propertyKey];
    v41[3] = v18;
    v19 = [v14 propertyValue];
    v42[3] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
    v21 = (void *)[v20 mutableCopy];

    if (v7) {
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:v21];
    }
    v22 = +[MIOHEVCStreamOutputSettings encoderSpecification];
    v23 = [[MOVStreamEncoderConfig alloc] initWithCodecType:1836415073 encoderSpecification:v22 sessionProperties:v21];
    v24 = [[MOVStreamOutputSettings alloc] initWithConfig:v23];
  }
  else
  {
    v39[0] = *MEMORY[0x263EFA3B8];
    v25 = [NSNumber numberWithDouble:a5];
    v40[0] = v25;
    v39[1] = *MEMORY[0x263EFA3F0];
    v26 = [NSNumber numberWithDouble:round(a5)];
    v40[1] = v26;
    v27 = [v14 propertyKey];
    v39[2] = v27;
    v28 = [v14 propertyValue];
    v40[2] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
    v21 = (void *)[v29 mutableCopy];

    if (v7) {
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:v21];
    }
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    uint64_t v31 = *MEMORY[0x263EFA338];
    v38[0] = v36;
    uint64_t v32 = *MEMORY[0x263EFA458];
    v37[0] = v31;
    v37[1] = v32;
    v33 = [NSNumber numberWithInt:Dimensions];
    v38[1] = v33;
    v37[2] = *MEMORY[0x263EFA3E8];
    v34 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
    v37[3] = *MEMORY[0x263EFA3A0];
    v38[2] = v34;
    v38[3] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

    v24 = [[MOVStreamOutputSettings alloc] initWithSettings:v22];
  }

  [(MOVStreamOutputSettings *)v24 applyAdditionalCompressionPropertiesFromRecordingConfig:v11];

  return v24;
}

@end