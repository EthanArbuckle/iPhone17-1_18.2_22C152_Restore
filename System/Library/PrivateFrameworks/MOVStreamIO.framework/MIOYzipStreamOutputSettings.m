@interface MIOYzipStreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOYzipStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 31;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a6;
  v21[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (v7)
  {
    v10 = [MOVStreamEncoderConfig alloc];
    v11 = [(MOVStreamEncoderConfig *)v10 initWithCodecType:2038065520 encoderSpecification:MEMORY[0x263EFFA78] sessionProperties:MEMORY[0x263EFFA78]];
    v12 = [[MOVStreamOutputSettings alloc] initWithConfig:v11];
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    uint64_t v14 = *MEMORY[0x263EFA338];
    v21[0] = @"yzip";
    uint64_t v15 = *MEMORY[0x263EFA458];
    v20[0] = v14;
    v20[1] = v15;
    v16 = [NSNumber numberWithInt:Dimensions];
    v21[1] = v16;
    v20[2] = *MEMORY[0x263EFA3E8];
    v17 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
    v21[2] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

    v12 = [[MOVStreamOutputSettings alloc] initWithSettings:v18];
  }

  return v12;
}

@end