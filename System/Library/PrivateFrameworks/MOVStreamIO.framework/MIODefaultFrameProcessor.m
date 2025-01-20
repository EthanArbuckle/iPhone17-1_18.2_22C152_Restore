@interface MIODefaultFrameProcessor
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (unsigned)encodedPixelFormat;
@end

@implementation MIODefaultFrameProcessor

- (unsigned)encodedPixelFormat
{
  v2 = [(MIOFrameProcessor *)self formatDesc];

  return CMFormatDescriptionGetMediaSubType(v2);
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  return +[MIOPixelBufferUtility newPixelBufferRefCopy:attachmentKeysToCopy:](PixelBufferUtility, "newPixelBufferRefCopy:attachmentKeysToCopy:", a3, a4, a5);
}

@end