@interface MOVStreamRawBayerPreProcessor
- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5;
- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3;
- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4;
- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3;
- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3;
@end

@implementation MOVStreamRawBayerPreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 1278226736;
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
  if (v9) {
    goto LABEL_4;
  }
  v10 = +[MIOPixelBufferPool createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:a3 minBufferCount:10 bufferCacheMode:a4->var22];
  if (v10)
  {
    id v9 = v10;
    objc_storeStrong(p_var12, v10);
LABEL_4:
    v11 = (__CVBuffer *)[v9 getPixelBuffer];
    if (+[MIOPixelBufferUtility bufferHasPadding:a3])
    {
      v12 = +[MIOPixelBufferUtility stripBufferPadding:a3];
      +[MIOPixelBufferUtility splitBayerBuffer:v12 intoWarholPixelBuffer:v11 shiftBitsLeftBy:2];
      CVPixelBufferRelease(v12);
    }
    else
    {
      +[MIOPixelBufferUtility splitBayerBuffer:a3 intoWarholPixelBuffer:v11 shiftBitsLeftBy:2];
    }
    goto LABEL_10;
  }
  v13 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for RawBayer stream." code:19];
  v14 = v13;
  if (a5) {
    *a5 = v13;
  }

  id v9 = 0;
  v11 = 0;
LABEL_10:

  return v11;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL010FormatDescriptionFromRawBayerFormatDescription:a3->var0];
}

@end