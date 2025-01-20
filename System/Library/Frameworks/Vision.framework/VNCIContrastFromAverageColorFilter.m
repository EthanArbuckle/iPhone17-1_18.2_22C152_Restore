@interface VNCIContrastFromAverageColorFilter
- (NSNumber)inputContrast;
- (VNCIContrastFromAverageColorFilter)init;
- (VNCIContrastFromAverageColorFilter)initWithInputParameters:(id)a3;
- (id)outputImage;
- (void)setInputContrast:(id)a3;
@end

@implementation VNCIContrastFromAverageColorFilter

- (void).cxx_destruct
{
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->_inputContrast;
}

- (id)outputImage
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [(VNCIFilter *)self inputImage];
  v4 = [(VNCIContrastFromAverageColorFilter *)self inputContrast];
  [v4 floatValue];
  float v6 = v5;

  if (v6 == 1.0)
  {
    id v7 = v3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A6257080]();
    uint64_t v19 = *MEMORY[0x1E4F1E478];
    v9 = (void *)MEMORY[0x1E4F1E080];
    [v3 extent];
    v10 = objc_msgSend(v9, "vectorWithCGRect:");
    v20[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v12 = [v3 imageByApplyingFilter:@"CIAreaAverage" withInputParameters:v11];

    v13 = [v12 imageByClampingToExtent];

    v14 = [v13 imageByUnpremultiplyingAlpha];

    v18[0] = v14;
    v15 = [(VNCIContrastFromAverageColorFilter *)self inputContrast];
    v18[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    -[VNCIFilter applyWithArguments:]((id *)&self->super.super.super.isa, v16);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (VNCIContrastFromAverageColorFilter)initWithInputParameters:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCIContrastFromAverageColorFilter;
  result = [(VNCIFilter *)&v4 initWithKernelName:@"contrastFromAverage" inputParameters:a3];
  if (result)
  {
    if (!result->_inputContrast) {
      result->_inputContrast = (NSNumber *)&unk_1EF7A81B0;
    }
  }
  return result;
}

- (VNCIContrastFromAverageColorFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)VNCIContrastFromAverageColorFilter;
  result = [(VNCIFilter *)&v3 initWithKernelName:@"contrastFromAverage"];
  if (result)
  {
    if (!result->_inputContrast) {
      result->_inputContrast = (NSNumber *)&unk_1EF7A81B0;
    }
  }
  return result;
}

@end