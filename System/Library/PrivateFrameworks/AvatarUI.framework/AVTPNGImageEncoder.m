@interface AVTPNGImageEncoder
- (id)dataFromImage:(id)a3;
- (id)fileExtension;
- (id)imageFromData:(id)a3 error:(id *)a4;
- (id)imageFromURL:(id)a3 error:(id *)a4;
@end

@implementation AVTPNGImageEncoder

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithContentsOfURL:v7 options:1 error:a4];

  if (v8)
  {
    v9 = [(AVTPNGImageEncoder *)self imageFromData:v8 error:a4];
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
  return UIImagePNGRepresentation((UIImage *)a3);
}

- (id)fileExtension
{
  return @"png";
}

@end