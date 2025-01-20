@interface ISGreyscaleEffect
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
@end

@implementation ISGreyscaleEffect

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x1B3E70EF0]();
  v7 = objc_alloc_init(ISBiasedGrayscaleConversion);
  float v22 = 0.0;
  uint64_t v21 = 0;
  if (-[ISGrayscaleConversion computeGrayscaleConversionColorWithCGImage:grayscaleConversion:](v7, "computeGrayscaleConversionColorWithCGImage:grayscaleConversion:", [v5 CGImage], &v21))
  {
    double v8 = *(float *)&v21;
    double v9 = *((float *)&v21 + 1);
    double v10 = v22;
  }
  else
  {
    double v8 = 0.2126;
    double v9 = 0.7152;
    double v10 = 0.0722;
  }
  v11 = [MEMORY[0x1E4F1E080] vectorWithX:v8 Y:v9 Z:v10 W:0.0];
  v12 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
  v13 = [MEMORY[0x1E4F1E040] filterWithName:@"CILinearToSRGBToneCurve"];
  uint64_t v14 = *MEMORY[0x1E4F1E480];
  [v13 setValue:v5 forKey:*MEMORY[0x1E4F1E480]];
  v15 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorMatrix"];
  v16 = [v13 outputImage];
  [v15 setValue:v16 forKey:v14];

  [v15 setValue:v11 forKey:@"inputRVector"];
  [v15 setValue:v11 forKey:@"inputGVector"];
  [v15 setValue:v11 forKey:@"inputBVector"];
  [v15 setValue:v12 forKey:@"inputAVector"];

  v17 = [MEMORY[0x1E4F1E040] filterWithName:@"CISRGBToneCurveToLinear"];
  v18 = [v15 outputImage];
  [v17 setValue:v18 forKey:v14];

  return v17;
}

@end