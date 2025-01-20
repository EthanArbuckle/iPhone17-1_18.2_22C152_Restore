@interface MOVStreamRawBayerToy416PreProcessor
- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5;
- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3;
- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4;
- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3;
- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3;
@end

@implementation MOVStreamRawBayerToy416PreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 2033463606;
}

- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4
{
  result = a4->var0;
  if (!a4->var1)
  {
    if (result) {
      CFRelease(result);
    }
    result = +[MOVStreamIOUtility formatForPixelBuffer:a3];
    a4->var0 = result;
    a4->var1 = 1;
  }
  return result;
}

- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamWriter getPixelFormatFromStreamData:a3];
}

- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5
{
  p_var12 = &a4->var12;
  id v9 = a4->var12;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (v9) {
    goto LABEL_4;
  }
  v12 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:Width height:Height pixelFormat:2033463606 extendedPixelsPerRow:0 minBufferCount:10 bufferCacheMode:a4->var22];
  if (v12)
  {
    objc_storeStrong(p_var12, v12);
    id v9 = v12;
LABEL_4:
    v13 = (__CVBuffer *)[v9 getPixelBuffer];
    +[MIOPixelBufferUtility copyMonochromeBuffer:a3 toAlphaChannelOfBuffer:v13];
    goto LABEL_5;
  }
  v15 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for RawBayer stream." code:19];
  v16 = v15;
  if (a5) {
    *a5 = v15;
  }

  id v9 = 0;
  v13 = 0;
LABEL_5:

  return v13;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  CVPixelBufferRef texture = 0;
  uint64_t v8 = *MEMORY[0x263F04130];
  v9[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Dimensions.width, *(uint64_t *)&Dimensions >> 32, 0x79343136u, v4, &texture);
  v5 = +[MOVStreamIOUtility formatForPixelBuffer:texture];
  CVPixelBufferRelease(texture);

  return v5;
}

@end