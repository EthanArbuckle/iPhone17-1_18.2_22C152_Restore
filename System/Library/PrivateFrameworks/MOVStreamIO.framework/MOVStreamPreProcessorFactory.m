@interface MOVStreamPreProcessorFactory
+ (id)defaultFactory;
- (id)preProcessorForFormat:(opaqueCMFormatDescription *)a3 recordingConfiguration:(id)a4;
@end

@implementation MOVStreamPreProcessorFactory

+ (id)defaultFactory
{
  if (+[MOVStreamPreProcessorFactory defaultFactory]::onceToken != -1) {
    dispatch_once(&+[MOVStreamPreProcessorFactory defaultFactory]::onceToken, &__block_literal_global_5);
  }
  v2 = (void *)+[MOVStreamPreProcessorFactory defaultFactory]::factory;

  return v2;
}

uint64_t __46__MOVStreamPreProcessorFactory_defaultFactory__block_invoke()
{
  +[MOVStreamPreProcessorFactory defaultFactory]::factory = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)preProcessorForFormat:(opaqueCMFormatDescription *)a3 recordingConfiguration:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKey:@"StreamEncoderType"];
  int v7 = [v6 intValue];

  uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  uint64_t v9 = MediaSubType;
  BOOL v10 = (v7 & 0xFFFFFFFE) != 6 || MediaSubType == 1278226488;
  if (v10
    || ([v5 objectForKey:@"StreamConvertNonPlanarBuffersTo8bitMonochrome"],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 BOOLValue],
        v11,
        (v12 & 1) == 0))
  {
    if (+[MIOPixelBufferUtility isPixelFormatRawBayer:v9])
    {
      v13 = [v5 objectForKey:@"RawBayerRearrangeTypeKey"];
      [v13 intValue];
    }
    else
    {
      +[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:v9];
    }
  }
  v14 = objc_opt_new();

  return v14;
}

@end