@interface MOVStreamNonPlanarToL008Processor
- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5;
- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3;
- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4;
- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3;
- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3;
@end

@implementation MOVStreamNonPlanarToL008Processor

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
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  double BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(a3);
  if (v9) {
    goto LABEL_4;
  }
  v13 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:(unint64_t)(BytesPerPixel * (double)Width) height:Height pixelFormat:1278226488 extendedPixelsPerRow:0 minBufferCount:10 bufferCacheMode:a4->var22];
  if (v13)
  {
    objc_storeStrong(p_var12, v13);
    id v9 = v13;
LABEL_4:
    v14 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer", BytesPerPixel);
    +[MIOPixelBufferUtility copyPixelBuffer:a3 toPixelBuffer:v14];
    goto LABEL_5;
  }
  v16 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create L008 pixel buffer pool for Non-Planar stream." code:19];
  v17 = v16;
  if (a5) {
    *a5 = v16;
  }

  id v9 = 0;
  v14 = 0;
LABEL_5:

  return v14;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL008FormatDescriptionFromNonPlanarFormatDescription:a3->var0];
}

@end