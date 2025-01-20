@interface MIOJPEGStreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOJPEGStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 33;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a6;
  v37[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = [v9 objectForKey:@"EncodingQuality"];
  v11 = v10;
  if (v10)
  {
    [v10 doubleValue];
    +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:");
    double v13 = v12;
    if (v7)
    {
LABEL_3:
      uint64_t v36 = *MEMORY[0x263F1ED50];
      uint64_t v14 = MEMORY[0x263EFFA88];
      v37[0] = MEMORY[0x263EFFA88];
      v15 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      uint64_t v34 = *MEMORY[0x263F1E650];
      uint64_t v35 = v14;
      v16 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v17 = (void *)[v16 mutableCopy];

      if (v13 >= 0.0)
      {
        v18 = [NSNumber numberWithDouble:v13];
        [v17 setObject:v18 forKey:*MEMORY[0x263F1E640]];
      }
      v19 = [[MOVStreamEncoderConfig alloc] initWithCodecType:1785750887 encoderSpecification:v15 sessionProperties:v17];
      v20 = [[MOVStreamOutputSettings alloc] initWithConfig:v19];

      goto LABEL_10;
    }
  }
  else
  {
    double v13 = -1.0;
    if (v7) {
      goto LABEL_3;
    }
  }
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
  uint64_t v22 = *MEMORY[0x263EFA338];
  v33[0] = *MEMORY[0x263EFA380];
  uint64_t v23 = *MEMORY[0x263EFA458];
  v32[0] = v22;
  v32[1] = v23;
  v24 = [NSNumber numberWithInt:Dimensions];
  v33[1] = v24;
  v32[2] = *MEMORY[0x263EFA3E8];
  v25 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
  v33[2] = v25;
  v26 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  v15 = (void *)[v26 mutableCopy];

  if (v13 >= 0.0)
  {
    uint64_t v30 = *MEMORY[0x263EFA428];
    v27 = [NSNumber numberWithDouble:v13];
    v31 = v27;
    v28 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];

    [v15 setObject:v28 forKey:*MEMORY[0x263EFA3A0]];
  }
  v20 = [[MOVStreamOutputSettings alloc] initWithSettings:v15];
LABEL_10:

  return v20;
}

@end