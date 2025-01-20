@interface MIONonPlanarToL008FrameProcessor
- (MIONonPlanarToL008FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 preserveAttachments:(id)a4 error:(id *)a5;
- (int)bufferCacheMode;
- (opaqueCMFormatDescription)formatDescriptionForEncoding;
- (unsigned)encodedPixelFormat;
- (void)dealloc;
- (void)setBufferCacheMode:(int)a3;
@end

@implementation MIONonPlanarToL008FrameProcessor

- (MIONonPlanarToL008FrameProcessor)initWithInputFormatDescription:(opaqueCMFormatDescription *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIONonPlanarToL008FrameProcessor;
  v4 = -[MIOFrameProcessor initWithInputFormatDescription:](&v6, sel_initWithInputFormatDescription_);
  if (v4)
  {
    v4->_formatDescForEncoding = +[MOVStreamIOUtility createL008FormatDescriptionFromNonPlanarFormatDescription:a3];
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
  v4.super_class = (Class)MIONonPlanarToL008FrameProcessor;
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
  if (pool) {
    goto LABEL_3;
  }
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  double BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(a3);
  self->_bytesPerPixel = BytesPerPixel;
  v13 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:(unint64_t)(BytesPerPixel * (double)Width) height:Height pixelFormat:1278226488 extendedPixelsPerRow:0 minBufferCount:10 bufferCacheMode:[(MIONonPlanarToL008FrameProcessor *)self bufferCacheMode]];
  v14 = self->_pool;
  self->_pool = v13;

  pool = self->_pool;
  if (pool)
  {
LABEL_3:
    v15 = [(MIOPixelBufferPool *)pool getPixelBuffer];
    +[MIOPixelBufferUtility copyPixelBuffer:a3 toPixelBuffer:v15];
    self->_formatDescForEncoding = [(MIOFrameProcessor *)self updatedFormatDescriptionIfNeededWithBuffer:v15 currentFormatDescription:self->_formatDescForEncoding];
  }
  else
  {
    v17 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create L008 pixel buffer pool for Non-Planar stream." code:19];
    v18 = v17;
    if (a5) {
      *a5 = v17;
    }

    v15 = 0;
  }

  return v15;
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