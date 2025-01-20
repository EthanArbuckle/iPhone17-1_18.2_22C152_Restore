@interface CILumaMap
+ (id)customAttributes;
- (CIImage)inputImage;
- (const)lumaTable;
- (id)_kernel;
- (id)outputImage;
- (void)dealloc;
- (void)setDefaults;
- (void)setInputImage:(id)a3;
@end

@implementation CILumaMap

- (void)dealloc
{
  tableImage = self->_tableImage;
  if (tableImage) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CILumaMap;
  [(CIFilter *)&v4 dealloc];
}

+ (id)customAttributes
{
  return 0;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_lumaMap];
}

- (void)setDefaults
{
  self->_tableImage = 0;
}

- (const)lumaTable
{
  return 0;
}

- (id)outputImage
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (!self->_tableImage)
    {
      v15[0] = @"CIImageColorSpace";
      v16[0] = [MEMORY[0x1E4F1CA98] null];
      v16[1] = MEMORY[0x1E4F1CC28];
      v15[1] = @"CIImageFlipped";
      v15[2] = @"CIImageClampToEdge";
      v16[2] = MEMORY[0x1E4F1CC38];
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
      v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", -[CILumaMap lumaTable](self, "lumaTable"), 1024, 0);
      self->_tableImage = +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", v5, [v5 length], 266, v4, 256.0, 1.0);
      id result = self->inputImage;
    }
    uint64_t v6 = [result imageByUnpremultiplyingAlpha];
    v7 = +[CIVector vectorWithX:0.99609375 Y:0.001953125];
    id v8 = [(CILumaMap *)self _kernel];
    [(CIImage *)self->inputImage extent];
    tableImage = self->_tableImage;
    v14[0] = v6;
    v14[1] = tableImage;
    v14[2] = v7;
    return (id)objc_msgSend((id)objc_msgSend(v8, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 3), v10, v11, v12, v13), "imageByPremultiplyingAlpha");
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end