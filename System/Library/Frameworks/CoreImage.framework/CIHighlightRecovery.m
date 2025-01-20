@interface CIHighlightRecovery
- (CIImage)inputImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputDraftMode;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIHighlightRecovery

- (id)outputImage
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(&unk_1EE4AB900, "count") + 1);
    id v4 = [(NSDictionary *)self->inputTuningParameters objectForKeyedSubscript:@"HighlightRecovery"];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v5 = [&unk_1EE4AB900 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(&unk_1EE4AB900);
          }
          v9 = *(NSString **)(*((void *)&v33 + 1) + 8 * i);
          if (![v4 valueForKey:v9])
          {
            NSLog(&cfstr_RequiredParame.isa, v9);
            return 0;
          }
          v10 = NSNumber;
          SDOFHighlightRecoveryValue(v9, self->inputTuningParameters);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v10, "numberWithFloat:"), v9);
        }
        uint64_t v6 = [&unk_1EE4AB900 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v11 = NSNumber;
    SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v11, "numberWithFloat:"), @"maxBlur");
    [v3 setObject:self->inputApertureScaling forKeyedSubscript:@"apertureScaling"];
    inputScale = self->inputScale;
    if (inputScale)
    {
      [(NSNumber *)inputScale floatValue];
      float v14 = v13;
    }
    else
    {
      float v14 = 1.0;
    }
    float v17 = roundf(v14* (float)(int)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"iterations"), "intValue"));
    NSInteger v18 = [(NSNumber *)[(CIHighlightRecovery *)self inputDraftMode] integerValue];
    if (v18 == 1)
    {
      float v17 = roundf(v17 / 3.0);
    }
    else if (v18 == 2)
    {
      float v17 = (float)(int)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"iterations"), "intValue");
    }
    *(float *)&double v19 = v17;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v19), @"iterations");
    inputImage = self->inputImage;
    if (v17 != 0.0)
    {
      v37[0] = @"inputIterations";
      *(float *)&double v20 = v17;
      v38[0] = [NSNumber numberWithFloat:v20];
      v37[1] = @"inputScale";
      *(float *)&double v21 = v14;
      uint64_t v22 = [NSNumber numberWithFloat:v21];
      inputApertureScaling = self->inputApertureScaling;
      v38[1] = v22;
      v38[2] = inputApertureScaling;
      v37[2] = @"inputApertureScaling";
      v37[3] = @"inputMaxBlur";
      v38[3] = [v3 objectForKeyedSubscript:@"maxBlur"];
      v37[4] = @"inputBlurRadius";
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"blurRadiusT0"), "floatValue");
      double v25 = v24;
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"blurRadiusT1"), "floatValue");
      v38[4] = +[CIVector vectorWithX:v25 Y:v26];
      v37[5] = @"inputMaxIntensity";
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"maxIntensityT0"), "floatValue");
      double v28 = v27;
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"maxIntensityT1"), "floatValue");
      v38[5] = +[CIVector vectorWithX:v28 Y:v29];
      v37[6] = @"inputMinIntensity";
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"minIntensityT0"), "floatValue");
      double v31 = v30;
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"minIntensityT1"), "floatValue");
      v38[6] = +[CIVector vectorWithX:v31 Y:v32];
      return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CISDOFHighlightRecovery", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:7]);
    }
    return inputImage;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

@end