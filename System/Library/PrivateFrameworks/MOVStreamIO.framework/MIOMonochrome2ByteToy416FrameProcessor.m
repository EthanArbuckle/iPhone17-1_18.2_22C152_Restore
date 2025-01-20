@interface MIOMonochrome2ByteToy416FrameProcessor
- (MIOMonochrome2ByteToy416FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (int)bufferCacheMode;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
- (void)setBufferCacheMode:(int)a3;
@end

@implementation MIOMonochrome2ByteToy416FrameProcessor

- (MIOMonochrome2ByteToy416FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)MIOMonochrome2ByteToy416FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v10, sel_initWithInputFormatDescription_);
  if (v4)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
    CVPixelBufferRef texture = 0;
    uint64_t v11 = *MEMORY[0x263F04130];
    v12[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Dimensions.width, *(uint64_t *)&Dimensions >> 32, 0x79343136u, v6, &texture);
    v7 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:texture];
    v4->_formatDescForEncoding = v7;
    CFRetain(v7);
    CVPixelBufferRelease(texture);
    [(MIOFrameProcessor *)v4 setFormatDescriptionNeedsUpdate:1];
  }
  return v4;
}

- (void)dealloc
{
  formatDescForEncoding = self->_formatDescForEncoding;
  if (formatDescForEncoding) {
    CFRelease(formatDescForEncoding);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOMonochrome2ByteToy416FrameProcessor;
  [(MIOFrameProcessor *)&v4 dealloc];
}

- (unsigned)encodedPixelFormat
{
  return 2033463606;
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  return self->_formatDescForEncoding;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  id v8 = a4;
  pool = self->_pool;
  if (pool
    || (size_t Width = CVPixelBufferGetWidth(a3),
        +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:Width height:CVPixelBufferGetHeight(a3) pixelFormat:2033463606 extendedPixelsPerRow:0 minBufferCount:2 bufferCacheMode:[(MIOMonochrome2ByteToy416FrameProcessor *)self bufferCacheMode]], uint64_t v11 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v12 = self->_pool, self->_pool = v11, v12, (pool = self->_pool) != 0))
  {
    [(MIOPixelBufferPool *)pool flush];
    v13 = [(MIOPixelBufferPool *)self->_pool getPixelBuffer];
    if (!v13)
    {
      NSLog(&cfstr_RunningOutOfBu.isa);
      __assert_rtn("-[MIOMonochrome2ByteToy416FrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOMonochrome2ByteToy416FrameProcessor.mm", 85, "0");
    }
    +[MIOPixelBufferUtility copyMonochromeBuffer:a3 toAlphaChannelOfBuffer:v13];
    self->_formatDescForEncoding = [(MIOFrameProcessor *)self updatedFormatDescriptionIfNeededWithBuffer:v13 currentFormatDescription:self->_formatDescForEncoding];
  }
  else
  {
    v15 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for RawBayer stream." code:19];
    v16 = v15;
    if (a5) {
      *a5 = v15;
    }

    v13 = 0;
  }

  return v13;
}

- (int)bufferCacheMode
{
  return self->bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->bufferCacheMode = a3;
}

- (void).cxx_destruct
{
}

@end