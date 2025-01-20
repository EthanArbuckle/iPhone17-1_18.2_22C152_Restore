@interface MIOProResStreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)outputSettingsProResEncoderType:(int)a3 quality:(int64_t)a4 formatDescription:(opaqueCMFormatDescription *)a5 preferEncoderConfig:(BOOL)a6;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
+ (unsigned)cmCodecTypeFromAVCodecType:(id)a3;
@end

@implementation MIOProResStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return (a3 < 0x1F) & (0x6000C000u >> a3);
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a6;
  id v9 = a3;
  v10 = [v9 objectForKey:@"StreamEncoderType"];
  uint64_t v11 = [v10 intValue];

  if (v9
    && ([v9 objectForKey:@"ProResEncodingQuality"],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    v13 = [v9 objectForKey:@"ProResEncodingQuality"];
    uint64_t v14 = (int)[v13 intValue];
  }
  else
  {
    uint64_t v14 = 1;
  }
  v15 = [(id)objc_opt_class() outputSettingsProResEncoderType:v11 quality:v14 formatDescription:a4 preferEncoderConfig:v7];

  return v15;
}

+ (id)outputSettingsProResEncoderType:(int)a3 quality:(int64_t)a4 formatDescription:(opaqueCMFormatDescription *)a5 preferEncoderConfig:(BOOL)a6
{
  BOOL v6 = a6;
  v26[3] = *MEMORY[0x263EF8340];
  if (a3 == 29)
  {
    v8 = @"aprn";
    goto LABEL_20;
  }
  if (a3 == 30)
  {
    v8 = @"aprh";
    goto LABEL_20;
  }
  if (a4 == 3)
  {
    v10 = (__CFString **)MEMORY[0x263EFA358];
LABEL_13:
    id v9 = *v10;
    if (a3 != 15) {
      id v9 = 0;
    }
    goto LABEL_19;
  }
  if (a4 == 2)
  {
    v10 = (__CFString **)MEMORY[0x263EFA350];
    goto LABEL_13;
  }
  if (a4)
  {
    uint64_t v11 = (__CFString **)MEMORY[0x263EFA340];
    if (a3 != 15) {
      uint64_t v11 = (__CFString **)MEMORY[0x263EFA360];
    }
    id v9 = *v11;
  }
  else
  {
    id v9 = (__CFString *)*MEMORY[0x263EFA348];
    if (a3 != 15) {
      id v9 = @"ap4x";
    }
  }
LABEL_19:
  v8 = v9;
  if (!v8)
  {
    id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08428] reason:@"ProRes4444 only supports high and medium quality setting." userInfo:0];
    objc_exception_throw(v24);
  }
LABEL_20:
  if (v6)
  {
    uint64_t v12 = [(id)objc_opt_class() cmCodecTypeFromAVCodecType:v8];
    if (!v12)
    {
      id v23 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263F08428] reason:@"Unknown Prores Codec." userInfo:0];
      objc_exception_throw(v23);
    }
    v13 = [MOVStreamEncoderConfig alloc];
    uint64_t v14 = [(MOVStreamEncoderConfig *)v13 initWithCodecType:v12 encoderSpecification:MEMORY[0x263EFFA78] sessionProperties:MEMORY[0x263EFFA78]];
    v15 = [[MOVStreamOutputSettings alloc] initWithConfig:v14];
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a5);
    uint64_t v17 = *MEMORY[0x263EFA338];
    v26[0] = v8;
    uint64_t v18 = *MEMORY[0x263EFA458];
    v25[0] = v17;
    v25[1] = v18;
    v19 = [NSNumber numberWithInt:Dimensions];
    v26[1] = v19;
    v25[2] = *MEMORY[0x263EFA3E8];
    v20 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
    v26[2] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

    v15 = [[MOVStreamOutputSettings alloc] initWithSettings:v21];
  }

  return v15;
}

+ (unsigned)cmCodecTypeFromAVCodecType:(id)a3
{
  id v3 = a3;
  unsigned int v4 = 1634755432;
  if (([v3 isEqualToString:*MEMORY[0x263EFA348]] & 1) == 0)
  {
    if ([v3 isEqualToString:*MEMORY[0x263EFA350]])
    {
      unsigned int v4 = 1634755443;
    }
    else if ([v3 isEqualToString:*MEMORY[0x263EFA358]])
    {
      unsigned int v4 = 1634755439;
    }
    else if ([v3 isEqualToString:*MEMORY[0x263EFA340]])
    {
      unsigned int v4 = 1634755438;
    }
    else
    {
      unsigned int v4 = 1634743400;
      if (([v3 isEqualToString:*MEMORY[0x263EFA360]] & 1) == 0)
      {
        if ([v3 isEqualToString:@"ap4x"])
        {
          unsigned int v4 = 1634743416;
        }
        else if ([v3 isEqualToString:@"aprn"])
        {
          unsigned int v4 = 1634759278;
        }
        else if ([v3 isEqualToString:@"aprh"])
        {
          unsigned int v4 = 1634759272;
        }
        else
        {
          unsigned int v4 = 0;
        }
      }
    }
  }

  return v4;
}

@end