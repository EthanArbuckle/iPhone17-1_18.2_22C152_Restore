@interface MIOSlimStreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOSlimStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 1;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a6;
  v32[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = v9;
  if (v7)
  {
    v11 = [v9 objectForKey:@"UseSlimXCompression"];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      v31 = @"InternalCodecType";
      v32[0] = &unk_26CB7D308;
      v13 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    }
    else
    {
      v13 = (void *)MEMORY[0x263EFFA78];
    }
    v24 = [MOVStreamEncoderConfig alloc];
    v25 = [(MOVStreamEncoderConfig *)v24 initWithCodecType:1936484717 encoderSpecification:MEMORY[0x263EFFA78] sessionProperties:v13];
    v23 = [[MOVStreamOutputSettings alloc] initWithConfig:v25];
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    uint64_t v15 = *MEMORY[0x263EFA338];
    v30[0] = @"slim";
    uint64_t v16 = *MEMORY[0x263EFA458];
    v29[0] = v15;
    v29[1] = v16;
    v17 = [NSNumber numberWithInt:Dimensions];
    v30[1] = v17;
    v29[2] = *MEMORY[0x263EFA3E8];
    v18 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
    v30[2] = v18;
    v13 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

    v19 = [v10 objectForKey:@"UseSlimXCompression"];
    LODWORD(v18) = [v19 BOOLValue];

    if (v18)
    {
      v20 = (void *)[v13 mutableCopy];
      v27 = @"InternalCodecType";
      v28 = &unk_26CB7D308;
      v21 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [v20 setObject:v21 forKey:*MEMORY[0x263EFA3A0]];
      uint64_t v22 = [v20 copy];

      v13 = (void *)v22;
    }
    v23 = [[MOVStreamOutputSettings alloc] initWithSettings:v13];
  }

  return v23;
}

@end