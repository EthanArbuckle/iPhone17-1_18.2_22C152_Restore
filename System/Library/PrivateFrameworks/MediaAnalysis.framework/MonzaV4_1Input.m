@interface MonzaV4_1Input
- (BOOL)setInputImageWithCGImage:(CGImage *)a3 error:(id *)a4;
- (BOOL)setInputImageWithURL:(id)a3 error:(id *)a4;
- (MonzaV4_1Input)initWithInputImage:(__CVBuffer *)a3;
- (MonzaV4_1Input)initWithInputImageAtURL:(id)a3 error:(id *)a4;
- (MonzaV4_1Input)initWithInputImageFromCGImage:(CGImage *)a3 error:(id *)a4;
- (NSSet)featureNames;
- (__CVBuffer)inputImage;
- (id)featureValueForName:(id)a3;
- (void)dealloc;
- (void)setInputImage:(__CVBuffer *)a3;
@end

@implementation MonzaV4_1Input

- (MonzaV4_1Input)initWithInputImage:(__CVBuffer *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MonzaV4_1Input;
  v4 = [(MonzaV4_1Input *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_inputImage = a3;
    CVPixelBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_inputImage);
  v3.receiver = self;
  v3.super_class = (Class)MonzaV4_1Input;
  [(MonzaV4_1Input *)&v3 dealloc];
}

- (MonzaV4_1Input)initWithInputImageFromCGImage:(CGImage *)a3 error:(id *)a4
{
  if (!self) {
    return 0;
  }
  v6 = self;
  objc_super v7 = (void *)MEMORY[0x1C186D320](self, a2);
  id v12 = 0;
  v8 = [MEMORY[0x1E4F1E950] featureValueWithCGImage:a3 pixelsWide:224 pixelsHigh:224 pixelFormatType:1111970369 options:0 error:&v12];
  id v9 = v12;
  if (v8)
  {
    v6 = -[MonzaV4_1Input initWithInputImage:](v6, "initWithInputImage:", [v8 imageBufferValue]);
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }

  if (a4) {
    *a4 = v9;
  }

  return v10;
}

- (MonzaV4_1Input)initWithInputImageAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self)
  {
    objc_super v7 = (void *)MEMORY[0x1C186D320]();
    id v12 = 0;
    v8 = [MEMORY[0x1E4F1E950] featureValueWithImageAtURL:v6 pixelsWide:224 pixelsHigh:224 pixelFormatType:1111970369 options:0 error:&v12];
    id v9 = v12;
    if (v8)
    {
      self = -[MonzaV4_1Input initWithInputImage:](self, "initWithInputImage:", [v8 imageBufferValue]);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)setInputImageWithCGImage:(CGImage *)a3 error:(id *)a4
{
  objc_super v7 = (void *)MEMORY[0x1C186D320](self, a2);
  id v11 = 0;
  v8 = [MEMORY[0x1E4F1E950] featureValueWithCGImage:a3 pixelsWide:224 pixelsHigh:224 pixelFormatType:1111970369 options:0 error:&v11];
  id v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease([(MonzaV4_1Input *)self inputImage]);
    -[MonzaV4_1Input setInputImage:](self, "setInputImage:", [v8 imageBufferValue]);
    CVPixelBufferRetain([(MonzaV4_1Input *)self inputImage]);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8 != 0;
}

- (BOOL)setInputImageWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = (void *)MEMORY[0x1C186D320]();
  id v11 = 0;
  v8 = [MEMORY[0x1E4F1E950] featureValueWithImageAtURL:v6 pixelsWide:224 pixelsHigh:224 pixelFormatType:1111970369 options:0 error:&v11];
  id v9 = v11;
  if (v8)
  {
    CVPixelBufferRelease([(MonzaV4_1Input *)self inputImage]);
    -[MonzaV4_1Input setInputImage:](self, "setInputImage:", [v8 imageBufferValue]);
    CVPixelBufferRetain([(MonzaV4_1Input *)self inputImage]);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8 != 0;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE808];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"inputImage"])
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1E950], "featureValueWithPixelBuffer:", -[MonzaV4_1Input inputImage](self, "inputImage"));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(__CVBuffer *)a3
{
  self->_inputImage = a3;
}

@end