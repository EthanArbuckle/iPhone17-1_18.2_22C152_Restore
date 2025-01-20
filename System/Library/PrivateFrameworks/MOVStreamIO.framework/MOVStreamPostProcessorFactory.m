@interface MOVStreamPostProcessorFactory
+ (id)defaultFactory;
- (id)postProcessorFromReader:(id)a3 originalPixelFormat:(unsigned int)a4 encodedFormat:(unsigned int)a5 encoderType:(id)a6 streamId:(id)a7;
- (id)postProcessorFromReader:(id)a3 originalPixelFormat:(unsigned int)a4 encodedFormat:(unsigned int)a5 encoderType:(id)a6 streamId:(id)a7 bufferCacheMode:(int)a8;
@end

@implementation MOVStreamPostProcessorFactory

+ (id)defaultFactory
{
  if (+[MOVStreamPostProcessorFactory defaultFactory]::onceToken != -1) {
    dispatch_once(&+[MOVStreamPostProcessorFactory defaultFactory]::onceToken, &__block_literal_global_7);
  }
  v2 = (void *)+[MOVStreamPostProcessorFactory defaultFactory]::factory;

  return v2;
}

uint64_t __47__MOVStreamPostProcessorFactory_defaultFactory__block_invoke()
{
  +[MOVStreamPostProcessorFactory defaultFactory]::factory = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)postProcessorFromReader:(id)a3 originalPixelFormat:(unsigned int)a4 encodedFormat:(unsigned int)a5 encoderType:(id)a6 streamId:(id)a7 bufferCacheMode:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v11 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  if (([v13 isEqualToString:@"RawBayer"] & 1) != 0
    || +[MIOPixelBufferUtility isPixelFormatRawBayer:v11])
  {
    if (a5 != 2033463606)
    {
      if (a5 == 2019963442) {
        v14 = [MOVStreamRawBayerFromYUVPostProcessor alloc];
      }
      else {
        v14 = [MOVStreamRawBayerPostProcessor alloc];
      }
      v16 = -[MOVStreamRawBayerFromYUVPostProcessor initWithOriginalPixelFormat:bufferCacheMode:rawBayerMSBReplication:](v14, "initWithOriginalPixelFormat:bufferCacheMode:rawBayerMSBReplication:", v11, v8, [v12 rawBayerMSBReplication]);
      goto LABEL_14;
    }
    v15 = &off_2643AEF00;
    goto LABEL_7;
  }
  uint64_t v17 = 1278226738;
  if (v11 == 1278226738 && a5 == 2033463606)
  {
    v18 = [MOVStreamy416To2ByteMonochromePostProcessor alloc];
LABEL_13:
    v16 = [(MOVStreamDefaultPostProcessor *)v18 initWithOriginalPixelFormat:v17];
    goto LABEL_14;
  }
  if (+[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:v11])
  {
    v15 = off_2643AED90;
LABEL_7:
    v16 = (MOVStreamL016Raw14PostProcessor *)[objc_alloc(*v15) initWithOriginalPixelFormat:v11 bufferCacheMode:v8];
    goto LABEL_14;
  }
  if (v11 == 1899524402 && a5 == 1278226736)
  {
    v18 = [MOVStreamConvertL010Toq8q2PostProcessor alloc];
    uint64_t v17 = 1899524402;
    goto LABEL_13;
  }
  if (a5 == 1278226488)
  {
    if (v11 && v11 != 1278226488)
    {
      v15 = off_2643AEDE0;
      goto LABEL_7;
    }
LABEL_33:
    v16 = (MOVStreamL016Raw14PostProcessor *)objc_opt_new();
    goto LABEL_14;
  }
  if (a5 != 1278226736)
  {
    if (a5 == 1278226738)
    {
      v23 = [v12 delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        v25 = [v12 delegate];
        int v26 = [v25 reader:v12 shouldConvertStreamToRAW14:v13 pixelFormat:1278226738];

        if (v26)
        {
          v16 = [[MOVStreamL016Raw14PostProcessor alloc] initWithOriginalPixelFormat:v11 bufferCacheMode:v8 l010OutputFormatRAW14L016:1];
          goto LABEL_14;
        }
      }
    }
    goto LABEL_33;
  }
  if (v11 == 1278226742)
  {
    v21 = [MOVStreamL016Raw14PostProcessor alloc];
    uint64_t v22 = 1;
    uint64_t v11 = 1278226742;
  }
  else
  {
    if (([v12 l010OutputFormatRAW14L016] & 1) == 0)
    {
      v27 = [v12 delegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        v29 = [v12 delegate];
        uint64_t v30 = [v29 reader:v12 shouldConvertStreamToRAW14:v13 pixelFormat:1278226736];

        v16 = [[MOVStreamL016Raw14PostProcessor alloc] initWithOriginalPixelFormat:v11 bufferCacheMode:v8 l010OutputFormatRAW14L016:v30];
        goto LABEL_14;
      }
    }
    v21 = [MOVStreamL016Raw14PostProcessor alloc];
    uint64_t v22 = [v12 l010OutputFormatRAW14L016];
  }
  v16 = [(MOVStreamL016Raw14PostProcessor *)v21 initWithOriginalPixelFormat:v11 bufferCacheMode:v8 l010OutputFormatRAW14L016:v22];
LABEL_14:
  v19 = v16;

  return v19;
}

- (id)postProcessorFromReader:(id)a3 originalPixelFormat:(unsigned int)a4 encodedFormat:(unsigned int)a5 encoderType:(id)a6 streamId:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v10 = a3;
  id v11 = a7;
  if (([v11 isEqualToString:@"RawBayer"] & 1) != 0
    || +[MIOPixelBufferUtility isPixelFormatRawBayer:v9])
  {
    if (a5 != 2033463606)
    {
      if (a5 == 2019963442) {
        id v12 = [MOVStreamRawBayerFromYUVPostProcessor alloc];
      }
      else {
        id v12 = [MOVStreamRawBayerPostProcessor alloc];
      }
      uint64_t v15 = -[MOVStreamRawBayerFromYUVPostProcessor initWithOriginalPixelFormat:rawBayerMSBReplication:](v12, "initWithOriginalPixelFormat:rawBayerMSBReplication:", v9, [v10 rawBayerMSBReplication]);
      goto LABEL_16;
    }
    v14 = &off_2643AEF00;
    goto LABEL_14;
  }
  if (v9 == 1278226738 && a5 == 2033463606)
  {
    id v13 = [MOVStreamy416To2ByteMonochromePostProcessor alloc];
    uint64_t v9 = 1278226738;
LABEL_15:
    uint64_t v15 = [(MOVStreamDefaultPostProcessor *)v13 initWithOriginalPixelFormat:v9];
    goto LABEL_16;
  }
  if (+[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:v9])
  {
    v14 = off_2643AED90;
LABEL_14:
    id v13 = (MOVStreamy416To2ByteMonochromePostProcessor *)objc_alloc(*v14);
    goto LABEL_15;
  }
  if (a5 == 1278226736)
  {
    v18 = [MOVStreamL016Raw14PostProcessor alloc];
    if (v9 == 1278226742)
    {
      uint64_t v19 = 1;
      uint64_t v9 = 1278226742;
    }
    else
    {
      uint64_t v19 = [v10 l010OutputFormatRAW14L016];
    }
    uint64_t v15 = [(MOVStreamL016Raw14PostProcessor *)v18 initWithOriginalPixelFormat:v9 l010OutputFormatRAW14L016:v19];
    goto LABEL_16;
  }
  if (a5 == 1278226488 && v9 && v9 != 1278226488)
  {
    v14 = off_2643AEDE0;
    goto LABEL_14;
  }
  uint64_t v15 = objc_opt_new();
LABEL_16:
  v16 = (void *)v15;

  return v16;
}

@end