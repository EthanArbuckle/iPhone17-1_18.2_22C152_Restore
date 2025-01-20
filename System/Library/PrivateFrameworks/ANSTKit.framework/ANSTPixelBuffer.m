@interface ANSTPixelBuffer
+ (id)new;
- (ANSTPixelBuffer)init;
- (ANSTPixelBuffer)initWithDescriptor:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6;
- (ANSTPixelBufferDescriptor)pixelBufferDescriptor;
- (__CVBuffer)pixelBuffer;
- (unsigned)orientation;
- (void)dealloc;
@end

@implementation ANSTPixelBuffer

- (ANSTPixelBuffer)init
{
  result = (ANSTPixelBuffer *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTPixelBuffer)initWithDescriptor:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ANSTPixelBuffer;
  v13 = [(ANSTPixelBuffer *)&v28 init];
  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = objc_msgSend_copy(v10, v11, v12);
  pixelBufferDescriptor = v13->_pixelBufferDescriptor;
  v13->_pixelBufferDescriptor = (ANSTPixelBufferDescriptor *)v14;

  v13->_pixelBuffer = CVPixelBufferRetain(a4);
  v13->_orientation = a5;
  uint64_t v18 = objc_msgSend_width(v13->_pixelBufferDescriptor, v16, v17);
  if (v18 != CVPixelBufferGetWidth(v13->_pixelBuffer)) {
    goto LABEL_6;
  }
  uint64_t v21 = objc_msgSend_height(v13->_pixelBufferDescriptor, v19, v20);
  if (v21 == CVPixelBufferGetHeight(v13->_pixelBuffer)
    && (int v23 = objc_msgSend_pixelFormatType(v13->_pixelBufferDescriptor, v19, v22),
        v23 == CVPixelBufferGetPixelFormatType(v13->_pixelBuffer)))
  {
LABEL_5:
    a6 = v13;
  }
  else
  {
LABEL_6:
    if (a6)
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F07F80];
      v30[0] = @"Pixel buffer's width, height, and pixel format type must match its designated descriptor.";
      v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v30, &v29, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, @"ANSTErrorDomain", 13, v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return (ANSTPixelBuffer *)a6;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ANSTPixelBuffer;
  [(ANSTPixelBuffer *)&v3 dealloc];
}

- (ANSTPixelBufferDescriptor)pixelBufferDescriptor
{
  return self->_pixelBufferDescriptor;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
}

@end