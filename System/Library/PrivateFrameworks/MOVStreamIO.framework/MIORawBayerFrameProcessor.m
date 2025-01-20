@interface MIORawBayerFrameProcessor
- (MIORawBayerFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
@end

@implementation MIORawBayerFrameProcessor

- (MIORawBayerFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIORawBayerFrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4)
  {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL010FormatDescriptionFromRawBayerFormatDescription:a3];
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
  v4.super_class = (Class)MIORawBayerFrameProcessor;
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
  id v8 = a4;
  pool = self->_pool;
  if (pool
    || (+[MIOPixelBufferPool createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:a3 minBufferCount:10 bufferCacheMode:[(MIOFrameProcessor *)self bufferCacheMode]], v10 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v11 = self->_pool, self->_pool = v10, v11, (pool = self->_pool) != 0))
  {
    v12 = [(MIOPixelBufferPool *)pool getPixelBuffer];
    +[MIOPixelBufferUtility splitBayerBuffer:a3 intoWarholPixelBuffer:v12 shiftBitsLeftBy:2];
    self->_formatDescForEncoding = [(MIOFrameProcessor *)self updatedFormatDescriptionIfNeededWithBuffer:v12 currentFormatDescription:self->_formatDescForEncoding];
  }
  else
  {
    v14 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for RawBayer stream." code:19];
    v15 = v14;
    if (a5) {
      *a5 = v14;
    }

    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end