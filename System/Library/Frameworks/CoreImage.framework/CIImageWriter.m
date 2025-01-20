@interface CIImageWriter
+ (id)customAttributes;
- (CIFilter)inputOriginalFilter;
- (CIImage)inputImage;
- (NSNumber)inputShouldDumpInputValues;
- (NSString)inputFilename;
- (id)outputImage;
- (void)setInputFilename:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOriginalFilter:(id)a3;
- (void)setInputShouldDumpInputValues:(id)a3;
@end

@implementation CIImageWriter

+ (id)customAttributes
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"inputFilename";
  v6 = @"CIAttributeDefault";
  v7 = &stru_1EE465CC0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v8[1] = @"inputShouldDumpInputValues";
  v9[0] = v2;
  v4[0] = @"CIAttributeType";
  v4[1] = @"CIAttributeDefault";
  v5[0] = @"CIAttributeTypeBoolean";
  v5[1] = &unk_1EE4AAA48;
  v4[2] = @"CIAttributeIdentity";
  v5[2] = &unk_1EE4AAA48;
  v9[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
}

- (id)outputImage
{
  v19[1] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (self->inputFilename)
  {
    if (inputImage)
    {
      if (objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:"))
      {
        uint64_t v16 = 0;
        [(CIImage *)self->inputImage extent];
        double v5 = v4;
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        v19[0] = self->inputImage;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        inputFilename = self->inputFilename;
        v17 = @"filename";
        v18 = inputFilename;
        inputImage = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIFileSaverProcessor, "applyWithExtent:inputs:arguments:error:", v12, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1], &v16, v5, v7, v9, v11);
        if (self->inputOriginalFilter)
        {
          if ([(NSNumber *)[(CIImageWriter *)self inputShouldDumpInputValues] BOOLValue])
          {
            id v14 = [(CIFilter *)self->inputOriginalFilter description];
            objc_msgSend(v14, "writeToURL:atomically:encoding:error:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[NSString stringByAppendingString:](self->inputFilename, "stringByAppendingString:", @".txt")), 1, 1, &v16);
          }
        }
      }
    }
  }
  return inputImage;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSString)inputFilename
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputFilename:(id)a3
{
}

- (NSNumber)inputShouldDumpInputValues
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputShouldDumpInputValues:(id)a3
{
}

- (CIFilter)inputOriginalFilter
{
  return (CIFilter *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputOriginalFilter:(id)a3
{
}

@end