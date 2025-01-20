@interface MIOq8q2ToL010FrameProcessor
- (MIOq8q2ToL010FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (int)bufferCacheMode;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
- (void)setBufferCacheMode:(int)a3;
@end

@implementation MIOq8q2ToL010FrameProcessor

- (MIOq8q2ToL010FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)MIOq8q2ToL010FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v10, sel_initWithInputFormatDescription_);
  if (v4)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
    CVPixelBufferRef texture = 0;
    uint64_t v11 = *MEMORY[0x263F04130];
    v12[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Dimensions.width, *(uint64_t *)&Dimensions >> 32, 0x4C303130u, v6, &texture);
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
  v4.super_class = (Class)MIOq8q2ToL010FrameProcessor;
  [(MIOFrameProcessor *)&v4 dealloc];
}

- (unsigned)encodedPixelFormat
{
  return 1278226736;
}

- (opaqueCMFormatDescription)formatDescriptionForEncoding
{
  return self->_formatDescForEncoding;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  v36[6] = *MEMORY[0x263EF8340];
  id v8 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  pool = self->_pool;
  if (!pool)
  {
    v35[0] = *MEMORY[0x263F040F8];
    v28 = [NSNumber numberWithUnsignedLong:(unint64_t)-((double)Width - ceil((double)Width * 0.015625) * 64.0)];
    v36[0] = v28;
    v35[1] = *MEMORY[0x263F04118];
    [NSNumber numberWithUnsignedLong:Height];
    v29 = v30 = a5;
    v36[1] = v29;
    v35[2] = *MEMORY[0x263F04130];
    uint64_t v33 = *MEMORY[0x263F0ED58];
    v12 = objc_msgSend(NSNumber, "numberWithInt:", -[MIOq8q2ToL010FrameProcessor bufferCacheMode](self, "bufferCacheMode"));
    v34 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v14 = *MEMORY[0x263F04180];
    v36[2] = v13;
    v36[3] = &unk_26CB7D320;
    uint64_t v15 = *MEMORY[0x263F04240];
    v35[3] = v14;
    v35[4] = v15;
    v16 = [NSNumber numberWithUnsignedLong:Width];
    v36[4] = v16;
    v35[5] = *MEMORY[0x263F040D8];
    v17 = [NSNumber numberWithUnsignedLong:(unint64_t)-((double)Height - ceil((double)Height * 0.015625) * 64.0)];
    v36[5] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];

    uint64_t v31 = *MEMORY[0x263F041C0];
    v32 = &unk_26CB7D338;
    v19 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v20 = [[MIOPixelBufferPool alloc] initWithPixelBuffer:0 bufferAttributes:v18 poolAttributes:v19 error:0];
    v21 = self->_pool;
    self->_pool = v20;

    if (!self->_pool)
    {
      v25 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for q8q2 stream." code:19];
      v26 = v25;
      if (v30) {
        id *v30 = v25;
      }

      goto LABEL_13;
    }

    pool = self->_pool;
    a5 = v30;
  }
  [(MIOPixelBufferPool *)pool flush];
  v22 = [(MIOPixelBufferPool *)self->_pool getPixelBuffer];
  if (!v22)
  {
    NSLog(&cfstr_RunningOutOfBu.isa);
    __assert_rtn("-[MIOq8q2ToL010FrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOq8q2ToL010FrameProcessor.mm", 107, "0");
  }
  if (!+[MIOPixelBufferUtility transferq8q2PixelBuffer:a3 toL010PixelBuffer:v22])
  {
    CVPixelBufferRelease(v22);
    CVPixelBufferRelease(a3);
    v23 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot convert q8q2 to L010 buffer." code:20];
    v24 = v23;
    if (a5) {
      *a5 = v23;
    }

LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  self->_formatDescForEncoding = [(MIOFrameProcessor *)self updatedFormatDescriptionIfNeededWithBuffer:v22 currentFormatDescription:self->_formatDescForEncoding];
LABEL_14:

  return v22;
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