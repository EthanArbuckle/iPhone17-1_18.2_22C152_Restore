@interface DeskCamSessionOptions
- (BOOL)imageBlurringEnabled;
- (BOOL)imageSharpeningEnabled;
- (BOOL)imageToneMappingEnabled;
- (DeskCamSessionOptions)initWithDeviceType:(int)a3;
- (DeskCamSessionOptions)initWithPlist:(id)a3 deviceType:(int)a4;
- (DeskCamSessionOptions)initWithPlistPath:(id)a3 deviceType:(int)a4;
- (float)framingSpaceExtendPercentage;
- (float)framingSpaceScalingFactor;
- (float)gravityVectorSmoothingAlpha;
- (float)imageBlendingPercentage;
- (float)imageBlendingRadiusUpscaler;
- (float)imageBlurringSigma;
- (float)imageSharpeningAmount;
- (float)imageSharpeningSigma;
- (float)imageToneMappingExponent;
- (float)imageToneMappingScaler;
- (float)pitchDefaultAngleValue;
- (float)pitchRefinementValue;
- (float)pitchValueLowerThreshold;
- (float)pitchValueUpperThreshold;
- (float)viewportScaleMultiplierLandscape;
- (float)viewportScaleMultiplierMin;
- (float)viewportScaleMultiplierPortrait;
- (id)asDictionary;
- (int)imageBlurringKernelSize;
- (int)imageSharpeningKernelSize;
- (void)setFramingSpaceExtendPercentage:(float)a3;
- (void)setFramingSpaceScalingFactor:(float)a3;
- (void)setGravityVectorSmoothingAlpha:(float)a3;
- (void)setImageBlendingPercentage:(float)a3;
- (void)setImageBlendingRadiusUpscaler:(float)a3;
- (void)setImageBlurringEnabled:(BOOL)a3;
- (void)setImageBlurringKernelSize:(int)a3;
- (void)setImageBlurringSigma:(float)a3;
- (void)setImageSharpeningAmount:(float)a3;
- (void)setImageSharpeningEnabled:(BOOL)a3;
- (void)setImageSharpeningKernelSize:(int)a3;
- (void)setImageSharpeningSigma:(float)a3;
- (void)setImageToneMappingEnabled:(BOOL)a3;
- (void)setImageToneMappingExponent:(float)a3;
- (void)setImageToneMappingScaler:(float)a3;
- (void)setPitchDefaultAngleValue:(float)a3;
- (void)setPitchRefinementValue:(float)a3;
- (void)setPitchValueLowerThreshold:(float)a3;
- (void)setPitchValueUpperThreshold:(float)a3;
- (void)setViewportScaleMultiplierLandscape:(float)a3;
- (void)setViewportScaleMultiplierMin:(float)a3;
- (void)setViewportScaleMultiplierPortrait:(float)a3;
@end

@implementation DeskCamSessionOptions

- (DeskCamSessionOptions)initWithDeviceType:(int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DeskCamSessionOptions;
  v4 = [(DeskCamSessionOptions *)&v14 init];
  v5 = (DeskCamSessionOptions *)v4;
  if (v4)
  {
    if (a3 == 1)
    {
      long long v6 = xmmword_1DD5AD0F0;
      uint64_t v7 = 0x3F8000003F000000;
      int v9 = 0;
      float v10 = 1.0;
      int v11 = 1062836634;
      float v8 = 1.0;
    }
    else
    {
      if (a3 == 2)
      {
        long long v6 = xmmword_1DD5AD100;
        uint64_t v7 = 0x3F8666663F266666;
        float v8 = 0.95;
        int v9 = 1061997773;
      }
      else
      {
        long long v6 = xmmword_1DD5AD110;
        uint64_t v7 = 0x3F99999A3F266666;
        float v8 = 0.95;
        int v9 = 1051931443;
      }
      float v10 = 1.085;
      int v11 = 1059481190;
    }
    *((_DWORD *)v4 + 3) = v11;
    *((_DWORD *)v4 + 4) = 1059481190;
    *(void *)(v4 + 20) = v7;
    *((float *)v4 + 7) = v10;
    *((void *)v4 + 4) = 0xC2DC0000C0000000;
    *(_OWORD *)(v4 + 40) = v6;
    *((float *)v4 + 14) = v8;
    v4[8] = 1;
    *(void *)(v4 + 60) = 0x40C0000000000007;
    *(_WORD *)(v4 + 9) = 257;
    *(void *)(v4 + 68) = 0x40A0000000000005;
    *((_DWORD *)v4 + 19) = v9;
    *((void *)v4 + 10) = 0x3F8CCCCD3FA66666;
    v12 = v4;
  }

  return v5;
}

- (DeskCamSessionOptions)initWithPlistPath:(id)a3 deviceType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DeskCamSessionOptions;
  uint64_t v7 = [(DeskCamSessionOptions *)&v12 init];
  if (v7)
  {
    float v8 = v7;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    float v10 = [(DeskCamSessionOptions *)v8 initWithPlist:v9 deviceType:v4];
  }
  else
  {
    float v10 = 0;
  }

  return v10;
}

- (DeskCamSessionOptions)initWithPlist:(id)a3 deviceType:(int)a4
{
  id v6 = a3;
  v81.receiver = self;
  v81.super_class = (Class)DeskCamSessionOptions;
  uint64_t v7 = [(DeskCamSessionOptions *)&v81 init];
  if (v7)
  {
    float v8 = 2.0;
    float v9 = 1.0;
    if (a4 == 1)
    {
      int v80 = 0;
      float v14 = 0.5;
      int v10 = 1059481190;
      int v11 = -1028653056;
      int v15 = 1062836634;
      float v13 = 1.0;
      float v12 = 1.0;
      float v79 = 1.0;
    }
    else
    {
      if (a4 == 2)
      {
        float v8 = 0.0;
        float v79 = 0.95;
        int v80 = 1061997773;
        int v10 = 1063675494;
        int v11 = -1028653056;
        float v12 = 1.085;
        float v13 = 1.05;
      }
      else
      {
        float v79 = 0.95;
        float v9 = 1.035;
        int v80 = 1051931443;
        int v10 = 1063675494;
        int v11 = -1029046272;
        float v12 = 1.085;
        float v13 = 1.2;
      }
      int v15 = 1059481190;
      float v14 = 0.65;
    }
    v16 = [v6 objectForKeyedSubscript:@"viewportScaleMultiplierLandscape"];
    if (v16)
    {
      v17 = [v6 objectForKeyedSubscript:@"viewportScaleMultiplierLandscape"];
      [v17 floatValue];
      v7->_viewportScaleMultiplierLandscape = v18;
    }
    else
    {
      LODWORD(v7->_viewportScaleMultiplierLandscape) = v15;
    }

    v19 = [v6 objectForKeyedSubscript:@"viewportScaleMultiplierPortrait"];
    if (v19)
    {
      v20 = [v6 objectForKeyedSubscript:@"viewportScaleMultiplierPortrait"];
      [v20 floatValue];
      v7->_viewportScaleMultiplierPortrait = v21;
    }
    else
    {
      v7->_viewportScaleMultiplierPortrait = 0.65;
    }

    v22 = [v6 objectForKeyedSubscript:@"viewportScaleMultiplierMin"];
    if (v22)
    {
      v23 = [v6 objectForKeyedSubscript:@"viewportScaleMultiplierMin"];
      [v23 floatValue];
      v7->_viewportScaleMultiplierMin = v24;
    }
    else
    {
      v7->_viewportScaleMultiplierMin = v14;
    }

    v25 = [v6 objectForKeyedSubscript:@"framingSpaceScalingFactor"];
    if (v25)
    {
      v26 = [v6 objectForKeyedSubscript:@"framingSpaceScalingFactor"];
      [v26 floatValue];
      v7->_framingSpaceScalingFactor = v27;
    }
    else
    {
      v7->_framingSpaceScalingFactor = v13;
    }

    v28 = [v6 objectForKeyedSubscript:@"framingSpaceExtendPercentage"];
    if (v28)
    {
      v29 = [v6 objectForKeyedSubscript:@"framingSpaceExtendPercentage"];
      [v29 floatValue];
      v7->_framingSpaceExtendPercentage = v30;
    }
    else
    {
      v7->_framingSpaceExtendPercentage = v12;
    }

    v31 = [v6 objectForKeyedSubscript:@"pitchDefaultAngleValue"];
    if (v31)
    {
      v32 = [v6 objectForKeyedSubscript:@"pitchDefaultAngleValue"];
      [v32 floatValue];
      v7->_pitchDefaultAngleValue = v33;
    }
    else
    {
      LODWORD(v7->_pitchDefaultAngleValue) = v11;
    }

    v34 = [v6 objectForKeyedSubscript:@"pitchRefinementValue"];
    if (v34)
    {
      v35 = [v6 objectForKeyedSubscript:@"pitchRefinementValue"];
      [v35 floatValue];
      v7->_pitchRefinementValue = v36;
    }
    else
    {
      v7->_pitchRefinementValue = v8;
    }

    v37 = [v6 objectForKeyedSubscript:@"gravityVectorSmoothingAlpha"];
    if (v37)
    {
      v38 = [v6 objectForKeyedSubscript:@"gravityVectorSmoothingAlpha"];
      [v38 floatValue];
      v7->_gravityVectorSmoothingAlpha = v39;
    }
    else
    {
      LODWORD(v7->_gravityVectorSmoothingAlpha) = v10;
    }

    v40 = [v6 objectForKeyedSubscript:@"pitchValueUpperThreshold"];
    if (v40)
    {
      v41 = [v6 objectForKeyedSubscript:@"pitchValueUpperThreshold"];
      [v41 floatValue];
      v7->_pitchValueUpperThreshold = v42;
    }
    else
    {
      v7->_pitchValueUpperThreshold = -2.0;
    }

    v43 = [v6 objectForKeyedSubscript:@"pitchValueLowerThreshold"];
    if (v43)
    {
      v44 = [v6 objectForKeyedSubscript:@"pitchValueLowerThreshold"];
      [v44 floatValue];
      v7->_pitchValueLowerThreshold = v45;
    }
    else
    {
      v7->_pitchValueLowerThreshold = -110.0;
    }

    v46 = [v6 objectForKeyedSubscript:@"imageBlendingRadiusUpscaler"];
    if (v46)
    {
      v47 = [v6 objectForKeyedSubscript:@"imageBlendingRadiusUpscaler"];
      [v47 floatValue];
      v7->_imageBlendingRadiusUpscaler = v48;
    }
    else
    {
      v7->_imageBlendingRadiusUpscaler = v9;
    }

    v49 = [v6 objectForKeyedSubscript:@"imageBlendingPercentage"];
    if (v49)
    {
      v50 = [v6 objectForKeyedSubscript:@"imageBlendingPercentage"];
      [v50 floatValue];
      v7->_imageBlendingPercentage = v51;
    }
    else
    {
      v7->_imageBlendingPercentage = v79;
    }

    v52 = [v6 objectForKeyedSubscript:@"imageBlurringEnabled"];
    if (v52)
    {
      v53 = [v6 objectForKeyedSubscript:@"imageBlurringEnabled"];
      v7->_imageBlurringEnabled = [v53 BOOLValue];
    }
    else
    {
      v7->_imageBlurringEnabled = 1;
    }

    v54 = [v6 objectForKeyedSubscript:@"imageBlurringKernelSize"];
    if (v54)
    {
      v55 = [v6 objectForKeyedSubscript:@"imageBlurringKernelSize"];
      v7->_imageBlurringKernelSize = [v55 intValue];
    }
    else
    {
      v7->_imageBlurringKernelSize = 7;
    }

    v56 = [v6 objectForKeyedSubscript:@"imageBlurringSigma"];
    if (v56)
    {
      v57 = [v6 objectForKeyedSubscript:@"imageBlurringSigma"];
      [v57 floatValue];
      v7->_imageBlurringSigma = v58;
    }
    else
    {
      v7->_imageBlurringSigma = 6.0;
    }

    v59 = [v6 objectForKeyedSubscript:@"imageSharpeningEnabled"];
    if (v59)
    {
      v60 = [v6 objectForKeyedSubscript:@"imageSharpeningEnabled"];
      v7->_imageSharpeningEnabled = [v60 BOOLValue];
    }
    else
    {
      v7->_imageSharpeningEnabled = 1;
    }

    v61 = [v6 objectForKeyedSubscript:@"imageSharpeningKernelSize"];
    if (v61)
    {
      v62 = [v6 objectForKeyedSubscript:@"imageSharpeningKernelSize"];
      v7->_imageSharpeningKernelSize = [v62 intValue];
    }
    else
    {
      v7->_imageSharpeningKernelSize = 5;
    }

    v63 = [v6 objectForKeyedSubscript:@"imageSharpeningSigma"];
    if (v63)
    {
      v64 = [v6 objectForKeyedSubscript:@"imageSharpeningSigma"];
      [v64 floatValue];
      v7->_imageSharpeningSigma = v65;
    }
    else
    {
      v7->_imageSharpeningSigma = 5.0;
    }

    v66 = [v6 objectForKeyedSubscript:@"imageSharpeningAmount"];
    if (v66)
    {
      v67 = [v6 objectForKeyedSubscript:@"imageSharpeningAmount"];
      [v67 floatValue];
      v7->_imageSharpeningAmount = v68;
    }
    else
    {
      LODWORD(v7->_imageSharpeningAmount) = v80;
    }

    v69 = [v6 objectForKeyedSubscript:@"imageToneMappingEnabled"];
    if (v69)
    {
      v70 = [v6 objectForKeyedSubscript:@"imageToneMappingEnabled"];
      v7->_imageToneMappingEnabled = [v70 BOOLValue];
    }
    else
    {
      v7->_imageToneMappingEnabled = 1;
    }

    v71 = [v6 objectForKeyedSubscript:@"imageToneMappingExponent"];
    if (v71)
    {
      v72 = [v6 objectForKeyedSubscript:@"imageToneMappingExponent"];
      [v72 floatValue];
      v7->_imageToneMappingExponent = v73;
    }
    else
    {
      v7->_imageToneMappingExponent = 1.3;
    }

    v74 = [v6 objectForKeyedSubscript:@"imageToneMappingScaler"];
    if (v74)
    {
      v75 = [v6 objectForKeyedSubscript:@"imageToneMappingScaler"];
      [v75 floatValue];
      v7->_imageToneMappingScaler = v76;
    }
    else
    {
      v7->_imageToneMappingScaler = 1.1;
    }

    v77 = v7;
  }

  return v7;
}

- (id)asDictionary
{
  v45[22] = *MEMORY[0x1E4F143B8];
  v44[0] = @"viewportScaleMultiplierLandscape";
  *(float *)&double v2 = self->_viewportScaleMultiplierLandscape;
  v43 = [NSNumber numberWithFloat:v2];
  v45[0] = v43;
  v44[1] = @"viewportScaleMultiplierPortrait";
  *(float *)&double v4 = self->_viewportScaleMultiplierPortrait;
  float v42 = [NSNumber numberWithFloat:v4];
  v45[1] = v42;
  v44[2] = @"viewportScaleMultiplierMin";
  *(float *)&double v5 = self->_viewportScaleMultiplierMin;
  v41 = [NSNumber numberWithFloat:v5];
  v45[2] = v41;
  v44[3] = @"framingSpaceScalingFactor";
  *(float *)&double v6 = self->_framingSpaceScalingFactor;
  v40 = [NSNumber numberWithFloat:v6];
  v45[3] = v40;
  v44[4] = @"framingSpaceExtendPercentage";
  *(float *)&double v7 = self->_framingSpaceExtendPercentage;
  float v39 = [NSNumber numberWithFloat:v7];
  v45[4] = v39;
  v44[5] = @"pitchDefaultAngleValue";
  *(float *)&double v8 = self->_pitchDefaultAngleValue;
  v38 = [NSNumber numberWithFloat:v8];
  v45[5] = v38;
  v44[6] = @"pitchRefinementValue";
  *(float *)&double v9 = self->_pitchRefinementValue;
  v37 = [NSNumber numberWithFloat:v9];
  v45[6] = v37;
  v44[7] = @"gravityVectorSmoothingAlpha";
  *(float *)&double v10 = self->_gravityVectorSmoothingAlpha;
  float v36 = [NSNumber numberWithFloat:v10];
  v45[7] = v36;
  v44[8] = @"pitchValueUpperThreshold";
  *(float *)&double v11 = self->_pitchValueUpperThreshold;
  v35 = [NSNumber numberWithFloat:v11];
  v45[8] = v35;
  v44[9] = @"pitchValueLowerThreshold";
  *(float *)&double v12 = self->_pitchValueLowerThreshold;
  v34 = [NSNumber numberWithFloat:v12];
  v45[9] = v34;
  v44[10] = @"imageBlendingRadiusUpscaler";
  *(float *)&double v13 = self->_imageBlendingRadiusUpscaler;
  float v33 = [NSNumber numberWithFloat:v13];
  v45[10] = v33;
  v44[11] = @"imageBlendingPercentage";
  *(float *)&double v14 = self->_imageBlendingPercentage;
  v32 = [NSNumber numberWithFloat:v14];
  v45[11] = v32;
  v44[12] = @"imageBlurringEnabled";
  v31 = [NSNumber numberWithBool:self->_imageBlurringEnabled];
  v45[12] = v31;
  v44[13] = @"imageBlurringKernelSize";
  int v15 = [NSNumber numberWithInt:self->_imageBlurringKernelSize];
  v45[13] = v15;
  v44[14] = @"imageBlurringSigma";
  *(float *)&double v16 = self->_imageBlurringSigma;
  v17 = [NSNumber numberWithFloat:v16];
  v45[14] = v17;
  v44[15] = @"imageSharpeningEnabled";
  float v18 = [NSNumber numberWithBool:self->_imageSharpeningEnabled];
  v45[15] = v18;
  v44[16] = @"imageSharpeningKernelSize";
  v19 = [NSNumber numberWithInt:self->_imageSharpeningKernelSize];
  v45[16] = v19;
  v44[17] = @"imageSharpeningSigma";
  *(float *)&double v20 = self->_imageSharpeningSigma;
  float v21 = [NSNumber numberWithFloat:v20];
  v45[17] = v21;
  v44[18] = @"imageSharpeningAmount";
  *(float *)&double v22 = self->_imageSharpeningAmount;
  v23 = [NSNumber numberWithFloat:v22];
  v45[18] = v23;
  v44[19] = @"imageToneMappingEnabled";
  float v24 = [NSNumber numberWithBool:self->_imageToneMappingEnabled];
  v45[19] = v24;
  v44[20] = @"imageToneMappingExponent";
  *(float *)&double v25 = self->_imageToneMappingExponent;
  v26 = [NSNumber numberWithFloat:v25];
  v45[20] = v26;
  v44[21] = @"imageToneMappingScaler";
  *(float *)&double v27 = self->_imageToneMappingScaler;
  v28 = [NSNumber numberWithFloat:v27];
  v45[21] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:22];

  return v29;
}

- (float)viewportScaleMultiplierLandscape
{
  return self->_viewportScaleMultiplierLandscape;
}

- (void)setViewportScaleMultiplierLandscape:(float)a3
{
  self->_viewportScaleMultiplierLandscape = a3;
}

- (float)viewportScaleMultiplierPortrait
{
  return self->_viewportScaleMultiplierPortrait;
}

- (void)setViewportScaleMultiplierPortrait:(float)a3
{
  self->_viewportScaleMultiplierPortrait = a3;
}

- (float)viewportScaleMultiplierMin
{
  return self->_viewportScaleMultiplierMin;
}

- (void)setViewportScaleMultiplierMin:(float)a3
{
  self->_viewportScaleMultiplierMin = a3;
}

- (float)framingSpaceScalingFactor
{
  return self->_framingSpaceScalingFactor;
}

- (void)setFramingSpaceScalingFactor:(float)a3
{
  self->_framingSpaceScalingFactor = a3;
}

- (float)framingSpaceExtendPercentage
{
  return self->_framingSpaceExtendPercentage;
}

- (void)setFramingSpaceExtendPercentage:(float)a3
{
  self->_framingSpaceExtendPercentage = a3;
}

- (float)pitchValueUpperThreshold
{
  return self->_pitchValueUpperThreshold;
}

- (void)setPitchValueUpperThreshold:(float)a3
{
  self->_pitchValueUpperThreshold = a3;
}

- (float)pitchValueLowerThreshold
{
  return self->_pitchValueLowerThreshold;
}

- (void)setPitchValueLowerThreshold:(float)a3
{
  self->_pitchValueLowerThreshold = a3;
}

- (float)pitchDefaultAngleValue
{
  return self->_pitchDefaultAngleValue;
}

- (void)setPitchDefaultAngleValue:(float)a3
{
  self->_pitchDefaultAngleValue = a3;
}

- (float)pitchRefinementValue
{
  return self->_pitchRefinementValue;
}

- (void)setPitchRefinementValue:(float)a3
{
  self->_pitchRefinementValue = a3;
}

- (float)gravityVectorSmoothingAlpha
{
  return self->_gravityVectorSmoothingAlpha;
}

- (void)setGravityVectorSmoothingAlpha:(float)a3
{
  self->_gravityVectorSmoothingAlpha = a3;
}

- (float)imageBlendingRadiusUpscaler
{
  return self->_imageBlendingRadiusUpscaler;
}

- (void)setImageBlendingRadiusUpscaler:(float)a3
{
  self->_imageBlendingRadiusUpscaler = a3;
}

- (float)imageBlendingPercentage
{
  return self->_imageBlendingPercentage;
}

- (void)setImageBlendingPercentage:(float)a3
{
  self->_imageBlendingPercentage = a3;
}

- (int)imageBlurringKernelSize
{
  return self->_imageBlurringKernelSize;
}

- (void)setImageBlurringKernelSize:(int)a3
{
  self->_imageBlurringKernelSize = a3;
}

- (float)imageBlurringSigma
{
  return self->_imageBlurringSigma;
}

- (void)setImageBlurringSigma:(float)a3
{
  self->_imageBlurringSigma = a3;
}

- (int)imageSharpeningKernelSize
{
  return self->_imageSharpeningKernelSize;
}

- (void)setImageSharpeningKernelSize:(int)a3
{
  self->_imageSharpeningKernelSize = a3;
}

- (float)imageSharpeningSigma
{
  return self->_imageSharpeningSigma;
}

- (void)setImageSharpeningSigma:(float)a3
{
  self->_imageSharpeningSigma = a3;
}

- (float)imageSharpeningAmount
{
  return self->_imageSharpeningAmount;
}

- (void)setImageSharpeningAmount:(float)a3
{
  self->_imageSharpeningAmount = a3;
}

- (float)imageToneMappingExponent
{
  return self->_imageToneMappingExponent;
}

- (void)setImageToneMappingExponent:(float)a3
{
  self->_imageToneMappingExponent = a3;
}

- (float)imageToneMappingScaler
{
  return self->_imageToneMappingScaler;
}

- (void)setImageToneMappingScaler:(float)a3
{
  self->_imageToneMappingScaler = a3;
}

- (BOOL)imageBlurringEnabled
{
  return self->_imageBlurringEnabled;
}

- (void)setImageBlurringEnabled:(BOOL)a3
{
  self->_imageBlurringEnabled = a3;
}

- (BOOL)imageSharpeningEnabled
{
  return self->_imageSharpeningEnabled;
}

- (void)setImageSharpeningEnabled:(BOOL)a3
{
  self->_imageSharpeningEnabled = a3;
}

- (BOOL)imageToneMappingEnabled
{
  return self->_imageToneMappingEnabled;
}

- (void)setImageToneMappingEnabled:(BOOL)a3
{
  self->_imageToneMappingEnabled = a3;
}

@end