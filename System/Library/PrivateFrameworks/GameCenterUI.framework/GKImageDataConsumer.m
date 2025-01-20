@interface GKImageDataConsumer
- (BOOL)isLayeredImage;
- (CGSize)size;
- (GKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4 isLayeredImage:(BOOL)a5;
- (double)scale;
- (id)objectForData:(id)a3 error:(id *)a4;
@end

@implementation GKImageDataConsumer

- (GKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4 isLayeredImage:(BOOL)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)GKImageDataConsumer;
  result = [(GKImageDataConsumer *)&v10 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_scale = a4;
    result->_isLayeredImage = a5;
  }
  return result;
}

- (id)objectForData:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(GKImageDataConsumer *)self isLayeredImage];
  v8 = (void *)MEMORY[0x1E4FB1818];
  if (v7)
  {
    [(GKImageDataConsumer *)self scale];
    objc_msgSend(v8, "_gkImageWithCheckedData:scale:", v6);
  }
  else
  {
    [MEMORY[0x1E4FB1818] _gkImageWithCheckedData:v6];
  }
  v9 = (GKImageDataConsumer *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ([(GKImageDataConsumer *)self isLayeredImage])
    {
      objc_super v10 = v9;
    }
    else
    {
      [(GKImageDataConsumer *)self size];
      if (v14 == *MEMORY[0x1E4F1DB30] && v13 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
        v16 = v9;
      }
      else {
        v16 = self;
      }
      [(GKImageDataConsumer *)v16 size];
      double v18 = v17;
      double v20 = v19;
      id v21 = objc_alloc_init(MEMORY[0x1E4FB17E0]);
      [(GKImageDataConsumer *)self scale];
      objc_msgSend(v21, "setScale:");
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v21, v18, v20);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __43__GKImageDataConsumer_objectForData_error___block_invoke;
      v24[3] = &unk_1E5F63380;
      v25 = v9;
      double v26 = v18;
      double v27 = v20;
      objc_super v10 = [v22 imageWithActions:v24];
    }
  }
  else
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"Could not decode image";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      *a4 = [v11 errorWithDomain:@"GKImageDataConsumerErrorDomain" code:-99 userInfo:v12];
    }
    objc_super v10 = 0;
  }

  return v10;
}

uint64_t __43__GKImageDataConsumer_objectForData_error___block_invoke(uint64_t a1)
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

@end