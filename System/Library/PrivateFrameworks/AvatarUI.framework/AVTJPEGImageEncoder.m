@interface AVTJPEGImageEncoder
- (AVTJPEGImageEncoder)init;
- (AVTJPEGImageEncoder)initWithCompressionQuality:(double)a3;
- (double)compressionQuality;
- (id)dataFromImage:(id)a3;
- (id)fileExtension;
- (id)imageFromData:(id)a3 error:(id *)a4;
- (id)imageFromURL:(id)a3 error:(id *)a4;
@end

@implementation AVTJPEGImageEncoder

- (AVTJPEGImageEncoder)init
{
  return [(AVTJPEGImageEncoder *)self initWithCompressionQuality:1.0];
}

- (AVTJPEGImageEncoder)initWithCompressionQuality:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTJPEGImageEncoder;
  result = [(AVTJPEGImageEncoder *)&v5 init];
  if (result) {
    result->_compressionQuality = a3;
  }
  return result;
}

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithContentsOfURL:v7 options:1 error:a4];

  if (v8)
  {
    v9 = [(AVTJPEGImageEncoder *)self imageFromData:v8 error:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  uint64_t v5 = [MEMORY[0x263F1C6B0] imageWithData:a3];
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    *a4 = [MEMORY[0x263F29748] errorWithCode:604 userInfo:0];
  }
  return v6;
}

- (id)dataFromImage:(id)a3
{
  v4 = (UIImage *)a3;
  [(AVTJPEGImageEncoder *)self compressionQuality];
  v6 = UIImageJPEGRepresentation(v4, v5);

  return v6;
}

- (id)fileExtension
{
  return @"jpeg";
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

@end