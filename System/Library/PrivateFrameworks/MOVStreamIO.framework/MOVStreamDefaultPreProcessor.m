@interface MOVStreamDefaultPreProcessor
- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5;
- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3;
- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4;
- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3;
- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3;
@end

@implementation MOVStreamDefaultPreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamWriter getPixelFormatFromStreamData:a3];
}

- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4
{
  return a4->var0;
}

- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamWriter getPixelFormatFromStreamData:a3];
}

- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5
{
  return +[MIOPixelBufferUtility newPixelBufferRefCopy:attachmentKeysToCopy:](MIOPixelBufferUtility, "newPixelBufferRefCopy:attachmentKeysToCopy:", a3, a4->var15, a5);
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  var0 = a3->var0;
  if (a3->var0) {
    CFRetain(a3->var0);
  }
  return var0;
}

@end