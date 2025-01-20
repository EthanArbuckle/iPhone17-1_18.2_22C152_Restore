@interface MOVStreamCompandedRawBayerPreProcessor
- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5;
- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3;
- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4;
- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3;
- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3;
@end

@implementation MOVStreamCompandedRawBayerPreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 1278226488;
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
  if (!v9)
  {
    id v9 = +[MIOPixelBufferPool createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:a3 minBufferCount:10 bufferCacheMode:a4->var22];
    if (!v9)
    {
      [MEMORY[0x263F087E8] populateStreamError:a5 message:@"Cannot create pixel buffer pool for RawBayer stream." code:19];
      v10 = 0;
      goto LABEL_8;
    }
    objc_storeStrong(p_var12, v9);
  }
  v10 = (__CVBuffer *)[v9 getPixelBuffer];
  if (+[MIOPixelBufferUtility bufferHasPadding:a3])
  {
    v11 = +[MIOPixelBufferUtility stripBufferPadding:a3];
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:v11 intoCompandedWarholPixelBuffer:v10];
    CVPixelBufferRelease(v11);
  }
  else
  {
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:a3 intoCompandedWarholPixelBuffer:v10];
  }
LABEL_8:

  return v10;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL008FormatDescriptionFromCompandedRawBayerFormatDescription:a3->var0];
}

@end