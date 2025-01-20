@interface ASKImageDataConsumer
- (ASKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4 isLayeredImage:(BOOL)a5 renderIntent:(int64_t)a6;
- (BOOL)isLayeredImage;
- (CGSize)size;
- (double)scale;
- (id)objectForData:(id)a3 error:(id *)a4;
- (int64_t)renderIntent;
@end

@implementation ASKImageDataConsumer

- (ASKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4 isLayeredImage:(BOOL)a5 renderIntent:(int64_t)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)ASKImageDataConsumer;
  result = [(ASKImageDataConsumer *)&v12 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_scale = a4;
    result->_isLayeredImage = a5;
    result->_renderIntent = a6;
  }
  return result;
}

- (id)objectForData:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = ![(ASKImageDataConsumer *)self isLayeredImage]
    && [(ASKImageDataConsumer *)self renderIntent] != 1;
  id v8 = objc_alloc(MEMORY[0x1E4FB1818]);
  [(ASKImageDataConsumer *)self scale];
  v9 = (ASKImageDataConsumer *)objc_msgSend(v8, "initWithData:scale:", v6);

  if (v9)
  {
    if (v7)
    {
      [(ASKImageDataConsumer *)self size];
      if (v11 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
        v13 = v9;
      }
      else {
        v13 = self;
      }
      [(ASKImageDataConsumer *)v13 size];
      double v18 = v17;
      double v20 = v19;
      v21 = [(ASKImageDataConsumer *)v9 imageRendererFormat];
      [(ASKImageDataConsumer *)self scale];
      objc_msgSend(v21, "setScale:");
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v21, v18, v20);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __44__ASKImageDataConsumer_objectForData_error___block_invoke;
      v24[3] = &unk_1E6DA8BF0;
      v25 = v9;
      double v26 = v18;
      double v27 = v20;
      v16 = [v22 imageWithActions:v24];
    }
    else
    {
      v16 = v9;
    }
  }
  else
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"Could not decode image";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      *a4 = [v14 errorWithDomain:@"ASKImageDataConsumerErrorDomain" code:-99 userInfo:v15];
    }
    v16 = 0;
  }

  return v16;
}

uint64_t __44__ASKImageDataConsumer_objectForData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)isLayeredImage
{
  return self->_isLayeredImage;
}

- (int64_t)renderIntent
{
  return self->_renderIntent;
}

@end