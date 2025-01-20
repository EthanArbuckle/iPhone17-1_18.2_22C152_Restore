@interface MIOL010ToL010Stride16FrameProcessor
- (BOOL)buffer:(__CVBuffer *)a3 needsAlignmentTo:(unint64_t)a4;
- (MIOL010ToL010Stride16FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (int)bufferCacheMode;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
- (void)setBufferCacheMode:(int)a3;
@end

@implementation MIOL010ToL010Stride16FrameProcessor

- (MIOL010ToL010Stride16FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MIOL010ToL010Stride16FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v7, sel_initWithInputFormatDescription_);
  v5 = v4;
  if (v4)
  {
    v4->_formatDescForEncoding = a3;
    CFRetain(a3);
    [(MIOFrameProcessor *)v5 setFormatDescriptionNeedsUpdate:1];
    v5->_needAlignment = 0;
    v5->_firstBufferProcessed = 0;
  }
  return v5;
}

- (void)dealloc
{
  formatDescForEncoding = self->_formatDescForEncoding;
  if (formatDescForEncoding) {
    CFRelease(formatDescForEncoding);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOL010ToL010Stride16FrameProcessor;
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

- (BOOL)buffer:(__CVBuffer *)a3 needsAlignmentTo:(unint64_t)a4
{
  size_t v9 = 0;
  size_t extraColumnsOnRight = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, &extraColumnsOnRight, 0, &v9);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  return (extraColumnsOnRight + Width) % a4 || (v9 + Height) % a4 != 0;
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5
{
  v36[6] = *MEMORY[0x263EF8340];
  id v30 = a4;
  if (!self->_firstBufferProcessed)
  {
    self->_firstBufferProcessed = 1;
    BOOL v8 = [(MIOL010ToL010Stride16FrameProcessor *)self buffer:a3 needsAlignmentTo:16];
    self->_needAlignment = v8;
    if (!v8) {
      [(MIOFrameProcessor *)self setFormatDescriptionNeedsUpdate:0];
    }
  }
  if (!self->_needAlignment)
  {
    v22 = +[MIOPixelBufferUtility newPixelBufferRefCopy:a3 attachmentKeysToCopy:v30];
    goto LABEL_19;
  }
  pool = self->_pool;
  if (!pool)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    v35[0] = *MEMORY[0x263F040F8];
    v29 = [NSNumber numberWithUnsignedLong:(unint64_t)-((double)Width - ceil((double)Width * 0.0625) * 16.0)];
    v36[0] = v29;
    v35[1] = *MEMORY[0x263F04118];
    v28 = [NSNumber numberWithUnsignedLong:Height];
    v36[1] = v28;
    v35[2] = *MEMORY[0x263F04130];
    uint64_t v33 = *MEMORY[0x263F0ED58];
    v12 = objc_msgSend(NSNumber, "numberWithInt:", -[MIOL010ToL010Stride16FrameProcessor bufferCacheMode](self, "bufferCacheMode"));
    v34 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v14 = *MEMORY[0x263F04180];
    v36[2] = v13;
    v36[3] = &unk_26CB7D3B0;
    uint64_t v15 = *MEMORY[0x263F04240];
    v35[3] = v14;
    v35[4] = v15;
    v16 = [NSNumber numberWithUnsignedLong:Width];
    v36[4] = v16;
    v35[5] = *MEMORY[0x263F040D8];
    v17 = [NSNumber numberWithUnsignedLong:(unint64_t)-((double)Height - ceil((double)Height * 0.0625) * 16.0)];
    v36[5] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];

    uint64_t v31 = *MEMORY[0x263F041C0];
    v32 = &unk_26CB7D3C8;
    v19 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v20 = [[MIOPixelBufferPool alloc] initWithPixelBuffer:0 bufferAttributes:v18 poolAttributes:v19 error:0];
    v21 = self->_pool;
    self->_pool = v20;

    if (!self->_pool)
    {
      v25 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for L010 stream." code:19];
      v26 = v25;
      if (a5) {
        *a5 = v25;
      }

      goto LABEL_18;
    }

    pool = self->_pool;
  }
  v22 = [(MIOPixelBufferPool *)pool getPixelBuffer];
  if (!v22)
  {
    NSLog(&cfstr_RunningOutOfBu.isa);
    __assert_rtn("-[MIOL010ToL010Stride16FrameProcessor processPixelBuffer:preserveAttachments:error:]", "MIOL010ToL010Stride16FrameProcessor.mm", 141, "0");
  }
  if (!+[MIOPixelBufferUtility copyPixelBuffer:a3 toPixelBuffer:v22])
  {
    CVPixelBufferRelease(v22);
    CVPixelBufferRelease(a3);
    v23 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot copy L010 to L010 (stride) buffer." code:20];
    v24 = v23;
    if (a5) {
      *a5 = v23;
    }

LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  self->_formatDescForEncoding = [(MIOFrameProcessor *)self updatedFormatDescriptionIfNeededWithBuffer:v22 currentFormatDescription:self->_formatDescForEncoding];
LABEL_19:

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