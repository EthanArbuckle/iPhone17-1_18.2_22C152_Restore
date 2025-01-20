@interface MOVStreamDefaultPostProcessor
- (BOOL)removePadding;
- (BOOL)shouldChangeBytesPerRowOfPixelBuffer:(__CVBuffer *)a3;
- (BOOL)shouldRemovePaddingOfPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4;
- (MOVStreamDefaultPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3;
- (MOVStreamDefaultPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4;
- (__CVBuffer)pixelBufferWithExactBytesPerRow:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 error:(id *)a5;
- (__CVBuffer)pixelBufferWithoutPaddingFromPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5;
- (id)exactBytesPerRow;
- (int)bufferCacheMode;
- (unint64_t)minimumBytesPerRowForPixelBuffer:(__CVBuffer *)a3;
- (unsigned)originalPixelFormat;
- (void)dealloc;
- (void)setBufferCacheMode:(int)a3;
- (void)setExactBytesPerRow:(id)a3;
- (void)setOriginalPixelFormat:(unsigned int)a3;
- (void)setRemovePadding:(BOOL)a3;
@end

@implementation MOVStreamDefaultPostProcessor

- (MOVStreamDefaultPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)MOVStreamDefaultPostProcessor;
  v6 = [(MOVStreamDefaultPostProcessor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(MOVStreamDefaultPostProcessor *)v6 setOriginalPixelFormat:v5];
    [(MOVStreamDefaultPostProcessor *)v7 setBufferCacheMode:v4];
    v8 = v7;
  }

  return v7;
}

- (MOVStreamDefaultPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)MOVStreamDefaultPostProcessor;
  uint64_t v4 = [(MOVStreamDefaultPostProcessor *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(MOVStreamDefaultPostProcessor *)v4 setOriginalPixelFormat:v3];
    [(MOVStreamDefaultPostProcessor *)v5 setBufferCacheMode:0];
    v6 = v5;
  }

  return v5;
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(MOVStreamDefaultPostProcessor *)self shouldRemovePaddingOfPixelBuffer:a3 metadata:v8])
  {
    a3 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithoutPaddingFromPixelBuffer:a3 error:a5];
  }
  else if ([(MOVStreamDefaultPostProcessor *)self shouldChangeBytesPerRowOfPixelBuffer:a3])
  {
    v9 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
    a3 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithExactBytesPerRow:v9 fromPixelBuffer:a3 error:a5];
  }
  else
  {
    CVPixelBufferRetain(a3);
  }

  return a3;
}

- (void)dealloc
{
  converter = self->_converter;
  self->_converter = 0;

  v4.receiver = self;
  v4.super_class = (Class)MOVStreamDefaultPostProcessor;
  [(MOVStreamDefaultPostProcessor *)&v4 dealloc];
}

- (unint64_t)minimumBytesPerRowForPixelBuffer:(__CVBuffer *)a3
{
  double BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(a3);
  return (unint64_t)(BytesPerPixel * (double)CVPixelBufferGetWidth(a3));
}

- (BOOL)shouldChangeBytesPerRowOfPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v5 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];

  if (!v5) {
    goto LABEL_11;
  }
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = PlaneCount;
  }
  id v8 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
    unint64_t v10 = [v9 count];

    if (v10 < v7)
    {
      BOOL v11 = +[MIOLog debugEnabled];
      if (!v11) {
        return v11;
      }
      v12 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_DEBUG, "ExactBytesPerRow count doesn't match pixel buffers plane count!", buf, 2u);
      }

LABEL_11:
      LOBYTE(v11) = 0;
      return v11;
    }
  }
  else
  {
  }
  size_t v13 = 0;
  BOOL v14 = 1;
  while (1)
  {
    v15 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v17 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
    v18 = v17;
    if (isKindOfClass)
    {
      uint64_t v19 = [v17 unsignedIntegerValue];
      goto LABEL_18;
    }
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) == 0) {
      break;
    }
    v18 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
    v21 = [v18 objectAtIndex:v13];
    uint64_t v19 = [v21 unsignedIntegerValue];

LABEL_18:
    if (CVPixelBufferGetBytesPerRowOfPlane(a3, v13) == v19)
    {
      BOOL v14 = v7 > ++v13;
      if (v7 != v13) {
        continue;
      }
    }
    char v22 = 1;
    goto LABEL_24;
  }
  v23 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_ERROR, "Invalid ExactBytesPerRow value type!", v25, 2u);
  }

  char v22 = 0;
LABEL_24:
  LOBYTE(v11) = v14 & v22;
  return v11;
}

- (BOOL)shouldRemovePaddingOfPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4
{
  size_t v6 = -[MOVStreamDefaultPostProcessor minimumBytesPerRowForPixelBuffer:](self, "minimumBytesPerRowForPixelBuffer:", a3, a4);
  BOOL v7 = [(MOVStreamDefaultPostProcessor *)self removePadding];
  if (v7) {
    LOBYTE(v7) = v6 < CVPixelBufferGetBytesPerRow(a3);
  }
  return v7;
}

- (__CVBuffer)pixelBufferWithoutPaddingFromPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  converter = self->_converter;
  if (!converter)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    v9 = [[MOVStreamFrameConverter alloc] initWithTargetWidth:Width height:Height format:CVPixelBufferGetPixelFormatType(a3) bytesPerRow:[(MOVStreamDefaultPostProcessor *)self minimumBytesPerRowForPixelBuffer:a3] bufferCacheMode:self->bufferCacheMode];
    unint64_t v10 = self->_converter;
    self->_converter = v9;

    converter = self->_converter;
  }
  return -[MOVStreamFrameConverter convertPixelBuffer:](converter, "convertPixelBuffer:", a3, a4);
}

- (__CVBuffer)pixelBufferWithExactBytesPerRow:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!self->_converter)
  {
    size_t Width = CVPixelBufferGetWidth(a4);
    size_t Height = CVPixelBufferGetHeight(a4);
    BOOL v11 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      size_t v13 = [MOVStreamFrameConverter alloc];
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
      v15 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
      v28[0] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
      v17 = [(MOVStreamFrameConverter *)v13 initWithTargetWidth:Width height:Height format:PixelFormatType bytesPerRows:v16 bufferCacheMode:self->bufferCacheMode];
      converter = self->_converter;
      self->_converter = v17;
    }
    else
    {
      uint64_t v19 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        [MEMORY[0x263F087E8] populateStreamError:a5 message:@"Invalid ExactBytesPerRow value type!" code:19];
        v26 = 0;
        goto LABEL_7;
      }
      v21 = [MOVStreamFrameConverter alloc];
      uint64_t v22 = CVPixelBufferGetPixelFormatType(a4);
      v23 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
      v24 = [(MOVStreamFrameConverter *)v21 initWithTargetWidth:Width height:Height format:v22 bytesPerRows:v23 bufferCacheMode:self->bufferCacheMode];
      v25 = self->_converter;
      self->_converter = v24;
    }
  }
  v26 = [(MOVStreamFrameConverter *)self->_converter convertPixelBuffer:a4];
LABEL_7:

  return v26;
}

- (BOOL)removePadding
{
  return self->removePadding;
}

- (void)setRemovePadding:(BOOL)a3
{
  self->removePadding = a3;
}

- (id)exactBytesPerRow
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setExactBytesPerRow:(id)a3
{
}

- (unsigned)originalPixelFormat
{
  return self->originalPixelFormat;
}

- (void)setOriginalPixelFormat:(unsigned int)a3
{
  self->originalPixelFormat = a3;
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
  objc_storeStrong(&self->exactBytesPerRow, 0);

  objc_storeStrong((id *)&self->_converter, 0);
}

@end