@interface iconclassificationInput
- (BOOL)setImage_PlaceholderWithCGImage:(CGImage *)a3 error:(id *)a4;
- (BOOL)setImage_PlaceholderWithURL:(id)a3 error:(id *)a4;
- (NSSet)featureNames;
- (__CVBuffer)image_Placeholder;
- (iconclassificationInput)initWithImage_Placeholder:(__CVBuffer *)a3;
- (iconclassificationInput)initWithImage_PlaceholderAtURL:(id)a3 error:(id *)a4;
- (iconclassificationInput)initWithImage_PlaceholderFromCGImage:(CGImage *)a3 error:(id *)a4;
- (id)featureValueForName:(id)a3;
- (void)dealloc;
- (void)setImage_Placeholder:(__CVBuffer *)a3;
@end

@implementation iconclassificationInput

- (iconclassificationInput)initWithImage_Placeholder:(__CVBuffer *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)iconclassificationInput;
  v4 = [(iconclassificationInput *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_image_Placeholder = a3;
    CVPixelBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_image_Placeholder);
  v3.receiver = self;
  v3.super_class = (Class)iconclassificationInput;
  [(iconclassificationInput *)&v3 dealloc];
}

- (iconclassificationInput)initWithImage_PlaceholderFromCGImage:(CGImage *)a3 error:(id *)a4
{
  if (!self) {
    return 0;
  }
  v6 = self;
  objc_super v7 = (void *)MEMORY[0x1BA9A10B0](self, a2);
  id v12 = 0;
  v8 = [MEMORY[0x1E4F1E950] featureValueWithCGImage:a3 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v12];
  id v9 = v12;
  if (v8)
  {
    v6 = -[iconclassificationInput initWithImage_Placeholder:](v6, "initWithImage_Placeholder:", [v8 imageBufferValue]);
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

- (iconclassificationInput)initWithImage_PlaceholderAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self)
  {
    objc_super v7 = (void *)MEMORY[0x1BA9A10B0]();
    id v12 = 0;
    v8 = [MEMORY[0x1E4F1E950] featureValueWithImageAtURL:v6 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v12];
    id v9 = v12;
    if (v8)
    {
      self = -[iconclassificationInput initWithImage_Placeholder:](self, "initWithImage_Placeholder:", [v8 imageBufferValue]);
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

- (BOOL)setImage_PlaceholderWithCGImage:(CGImage *)a3 error:(id *)a4
{
  objc_super v7 = (void *)MEMORY[0x1BA9A10B0](self, a2);
  id v12 = 0;
  v8 = [MEMORY[0x1E4F1E950] featureValueWithCGImage:a3 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v12];
  id v9 = v12;
  if (v8)
  {
    CVPixelBufferRelease(self->_image_Placeholder);
    v10 = (__CVBuffer *)[v8 imageBufferValue];
    self->_image_Placeholder = v10;
    CVPixelBufferRetain(v10);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8 != 0;
}

- (BOOL)setImage_PlaceholderWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = (void *)MEMORY[0x1BA9A10B0]();
  id v12 = 0;
  v8 = [MEMORY[0x1E4F1E950] featureValueWithImageAtURL:v6 pixelsWide:256 pixelsHigh:256 pixelFormatType:32 options:0 error:&v12];
  id v9 = v12;
  if (v8)
  {
    CVPixelBufferRelease(self->_image_Placeholder);
    v10 = (__CVBuffer *)[v8 imageBufferValue];
    self->_image_Placeholder = v10;
    CVPixelBufferRetain(v10);
  }

  if (a4) {
    *a4 = v9;
  }

  return v8 != 0;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E941A0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"image/Placeholder"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:self->_image_Placeholder];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (__CVBuffer)image_Placeholder
{
  return self->_image_Placeholder;
}

- (void)setImage_Placeholder:(__CVBuffer *)a3
{
  self->_image_Placeholder = a3;
}

@end