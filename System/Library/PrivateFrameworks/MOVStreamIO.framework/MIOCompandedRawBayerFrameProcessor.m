@interface MIOCompandedRawBayerFrameProcessor
- (MIOCompandedRawBayerFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
@end

@implementation MIOCompandedRawBayerFrameProcessor

- (MIOCompandedRawBayerFrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIOCompandedRawBayerFrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4) {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL008FormatDescriptionFromCompandedRawBayerFormatDescription:a3];
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
  v4.super_class = (Class)MIOCompandedRawBayerFrameProcessor;
  [(MIOFrameProcessor *)&v4 dealloc];
}

- (unsigned)encodedPixelFormat
{
  return 1278226488;
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
    || (+[MIOPixelBufferPool createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:a3 minBufferCount:10 bufferCacheMode:[(MIOFrameProcessor *)self bufferCacheMode]], v10 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v11 = self->_pool, self->_pool = v10, v11, (pool = self->_pool) != 0))
  {
    v12 = [(MIOPixelBufferPool *)pool getPixelBuffer];
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:a3 intoCompandedWarholPixelBuffer:v12];
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