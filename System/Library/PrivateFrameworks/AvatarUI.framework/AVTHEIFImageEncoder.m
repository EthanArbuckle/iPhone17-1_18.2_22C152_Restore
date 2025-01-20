@interface AVTHEIFImageEncoder
+ (id)HEICSSequenceEncoder;
+ (id)defaultHEICEncoder;
- (BOOL)useHEICSSequence;
- (id)dataFromImage:(id)a3;
- (id)fileExtension;
- (id)imageFromData:(id)a3 error:(id *)a4;
- (id)imageFromURL:(id)a3 error:(id *)a4;
- (id)initUsingHeicsSequence:(BOOL)a3;
@end

@implementation AVTHEIFImageEncoder

+ (id)HEICSSequenceEncoder
{
  v2 = (void *)[objc_alloc((Class)a1) initUsingHeicsSequence:1];
  return v2;
}

+ (id)defaultHEICEncoder
{
  v2 = (void *)[objc_alloc((Class)a1) initUsingHeicsSequence:0];
  return v2;
}

- (id)initUsingHeicsSequence:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTHEIFImageEncoder;
  id result = [(AVTHEIFImageEncoder *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
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
    v9 = [(AVTHEIFImageEncoder *)self imageFromData:v8 error:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AVTHEIFImageEncoder *)self useHEICSSequence]) {
    [MEMORY[0x263F1C6B0] animatedImageWithHEICSRepresentation:v6];
  }
  else {
  id v7 = [MEMORY[0x263F1C6B0] animatedImageWithHEICRepresentation:v6];
  }

  if (a4 && !v7)
  {
    *a4 = [MEMORY[0x263F29748] errorWithCode:604 userInfo:0];
  }
  return v7;
}

- (id)dataFromImage:(id)a3
{
  id v4 = a3;
  if ([(AVTHEIFImageEncoder *)self useHEICSSequence]) {
    [v4 HEICSRepresentation];
  }
  else {
  objc_super v5 = [v4 HEICRepresentation];
  }

  return v5;
}

- (id)fileExtension
{
  if ([(AVTHEIFImageEncoder *)self useHEICSSequence]) {
    v2 = @"heics";
  }
  else {
    v2 = @"heic";
  }
  return v2;
}

- (BOOL)useHEICSSequence
{
  return self->_useHEICSSequence;
}

@end