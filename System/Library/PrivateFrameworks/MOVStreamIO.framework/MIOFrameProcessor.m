@interface MIOFrameProcessor
- (BOOL)formatDescriptionNeedsUpdate;
- (MIOFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (int)bufferCacheMode;
- (opaqueCMFormatDescription)formatDesc;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (opaqueCMFormatDescription)updatedFormatDescriptionIfNeededWithBuffer:(__CVBuffer *)a3 currentFormatDescription:(opaqueCMFormatDescription *)a4;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
- (void)setBufferCacheMode:(int)a3;
- (void)setFormatDescriptionNeedsUpdate:(BOOL)a3;
@end

@implementation MIOFrameProcessor

- (MIOFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIOFrameProcessor;
  v4 = [(MIOFrameProcessor *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_formatDesc = a3;
    [(MIOFrameProcessor *)v4 setBufferCacheMode:0];
  }
  return v4;
}

- (void)dealloc
{
  formatDesc = self->_formatDesc;
  if (formatDesc) {
    CFRelease(formatDesc);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOFrameProcessor;
  [(MIOFrameProcessor *)&v4 dealloc];
}

- (opaqueCMFormatDescription)formatDesc
{
  return self->_formatDesc;
}

- (opaqueCMFormatDescription)updatedFormatDescriptionIfNeededWithBuffer:(__CVBuffer *)a3 currentFormatDescription:(opaqueCMFormatDescription *)a4
{
  if (![(MIOFrameProcessor *)self formatDescriptionNeedsUpdate]) {
    return a4;
  }
  [(MIOFrameProcessor *)self setFormatDescriptionNeedsUpdate:0];
  if (a4) {
    CFRelease(a4);
  }

  return +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:a3];
}

- (unsigned)encodedPixelFormat
{
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  id v5 = a4;
  __assert_rtn("-[MIOFrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOFrameProcessor.m", 72, "0");
}

- (int)bufferCacheMode
{
  return self->bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->bufferCacheMode = a3;
}

- (BOOL)formatDescriptionNeedsUpdate
{
  return self->_formatDescriptionNeedsUpdate;
}

- (void)setFormatDescriptionNeedsUpdate:(BOOL)a3
{
  self->_formatDescriptionNeedsUpdate = a3;
}

@end