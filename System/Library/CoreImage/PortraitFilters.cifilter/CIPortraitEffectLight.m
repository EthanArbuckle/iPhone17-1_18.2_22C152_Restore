@interface CIPortraitEffectLight
- (id)_enrich;
- (id)_eyeBrightenSoftlight;
- (id)_mixKernel;
- (id)_textureAdd;
- (id)_textureDiff;
- (id)_whitenTeeth;
- (id)enrichImage:(id)a3;
- (id)eyeBlurForLandmarks:(id)a3;
- (id)faceMaskForLandmarks:(id)a3;
- (id)imageForLandmarks:(id)a3;
- (id)maskForLandmarks:(id)a3 withFilterNamed:(id)a4;
- (id)outputImage;
- (id)processEyesIn:(id)a3 withEyeBlur:(id)a4 landmarks:(id)a5;
- (id)processSkinIn:(id)a3 withFaceMask:(id)a4;
- (id)processSkinIn:(id)a3 withSkinMask:(id)a4;
- (id)processTeethIn:(id)a3 withFaceMask:(id)a4;
- (id)processTeethIn:(id)a3 withTeethMask:(id)a4;
- (id)skinMaskForLandmarks:(id)a3;
- (id)teethMaskForLandmarks:(id)a3;
@end

@implementation CIPortraitEffectLight

- (id)_whitenTeeth
{
  if (qword_8CFC8 != -1) {
    dispatch_once(&qword_8CFC8, &stru_758B8);
  }
  return (id)qword_8CFC0;
}

- (id)_enrich
{
  if (qword_8CFD8 != -1) {
    dispatch_once(&qword_8CFD8, &stru_758D8);
  }
  return (id)qword_8CFD0;
}

- (id)_eyeBrightenSoftlight
{
  if (qword_8CFE8 != -1) {
    dispatch_once(&qword_8CFE8, &stru_758F8);
  }
  return (id)qword_8CFE0;
}

- (id)_mixKernel
{
  if (qword_8CFF8 != -1) {
    dispatch_once(&qword_8CFF8, &stru_75918);
  }
  return (id)qword_8CFF0;
}

- (id)_textureDiff
{
  if (qword_8D008 != -1) {
    dispatch_once(&qword_8D008, &stru_75938);
  }
  return (id)qword_8D000;
}

- (id)_textureAdd
{
  if (qword_8D018 != -1) {
    dispatch_once(&qword_8D018, &stru_75958);
  }
  return (id)qword_8D010;
}

- (id)maskForLandmarks:(id)a3 withFilterNamed:(id)a4
{
  inputImage = self->super.inputImage;
  CGAffineTransformMakeScale(&v11, 0.25, 0.25);
  v7 = [(CIImage *)inputImage imageByApplyingTransform:&v11];
  CFStringRef v12 = @"inputFaceLandmarks";
  id v13 = a3;
  id result = [(CIImage *)v7 imageByApplyingFilter:a4 withInputParameters:+[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]];
  if (result)
  {
    id v9 = result;
    CGAffineTransformMakeScale(&v10, 0.25, 0.25);
    return objc_msgSend(objc_msgSend(v9, "imageByApplyingTransform:", &v10), "imageByApplyingFilter:withInputParameters:", @"CISoftCubicUpsample", &off_7DDD8);
  }
  return result;
}

- (id)eyeBlurForLandmarks:(id)a3
{
  [(NSNumber *)self->super.inputEyes floatValue];
  if (a3)
  {
    if (fabsf(v5) >= 1.0e-10)
    {
      v6 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
      v7 = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
      v8 = [LightingFacePoints alloc];
      [(CIImage *)self->super.inputImage extent];
      id v9 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v8, "initWithFaceLandmarkDictionary:forImageRect:", a3);
      CGAffineTransform v10 = +[CIFilter filterWithName:@"CIGaussianGradient"];
      float v11 = 0.0;
      float v12 = 0.0;
      if ([a3 objectForKeyedSubscript:@"faceJunkinessIndex"])
      {
        objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
        float v12 = v13;
      }
      if ([a3 objectForKeyedSubscript:@"faceBoundingBox"])
      {
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
        float v11 = v14;
      }
      if ([a3 objectForKeyedSubscript:@"roll"])
      {
        objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"roll"), "floatValue");
        BOOL v16 = fabsf(v15) < 1.05;
      }
      else
      {
        BOOL v16 = 1;
      }
      a3 = 0;
      if (v12 < -0.2 && v11 > 0.15 && v16)
      {
        [(LightingFacePoints *)v9 leftEye];
        double v18 = v17;
        double v20 = v19;
        [(LightingFacePoints *)v9 rightEye];
        *(float *)&double v21 = sqrt((v20 - v22) * (v20 - v22) + (v18 - v21) * (v18 - v21));
        *(float *)&double v18 = *(float *)&v21 * 0.4035;
        [(LightingFacePoints *)v9 leftEye];
        [(CIFilter *)v10 setValue:+[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:") forKey:@"inputCenter"];
        LODWORD(v23) = LODWORD(v18);
        [(CIFilter *)v10 setValue:+[NSNumber numberWithFloat:v23] forKey:@"inputRadius"];
        [(CIFilter *)v10 setValue:v7 forKey:@"inputColor0"];
        [(CIFilter *)v10 setValue:v6 forKey:@"inputColor1"];
        v24 = [(CIFilter *)v10 outputImage];
        [(LightingFacePoints *)v9 rightEye];
        [(CIFilter *)v10 setValue:+[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:") forKey:@"inputCenter"];
        CFStringRef v26 = @"inputBackgroundImage";
        v27 = [(CIFilter *)v10 outputImage];
        a3 = [(CIImage *)v24 imageByApplyingFilter:@"CIAdditionCompositing" withInputParameters:+[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1]];
      }
    }
    else
    {
      return 0;
    }
  }
  return a3;
}

- (id)faceMaskForLandmarks:(id)a3
{
  return [(CIPortraitEffectLight *)self maskForLandmarks:a3 withFilterNamed:@"CIPortraitFaceMask"];
}

- (id)processSkinIn:(id)a3 withFaceMask:(id)a4
{
  [(NSNumber *)self->super.inputSmooth floatValue];
  float v8 = v7;
  [(NSNumber *)self->super.inputLocalContrast floatValue];
  double v10 = fabsf(v8);
  float v11 = fabsf(v9);
  if (v10 >= 1.0e-10 || v11 >= 1.0e-10)
  {
    float v31 = v9;
    float v32 = v11;
    [a3 extent];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(NSNumber *)self->super.inputScale floatValue];
    double v21 = v20;
    id v22 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", (float)(v20 * 1.5)), "imageByCroppingToRect:", v13, v15, v17, v19);
    v45[0] = a3;
    v45[1] = v22;
    id v23 = objc_msgSend(-[CIPortraitEffectLight _textureDiff](self, "_textureDiff"), "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2), v13, v15, v17, v19);
    if (v10 >= 1.0e-10)
    {
      id v24 = [v22 imageByClampingToExtent];
      v44[0] = &off_7A920;
      v43[0] = @"inputPointCount";
      v43[1] = @"inputRadius";
      v44[1] = +[NSNumber numberWithDouble:v21 * 4.0];
      id v22 = objc_msgSend(objc_msgSend(v24, "imageByApplyingFilter:withInputParameters:", @"CIRingBlur", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2)), "imageByCroppingToRect:", v13, v15, v17, v19);
      if (v8 < 1.0)
      {
        id v25 = [(CIPortraitEffectLight *)self _mixKernel];
        v42[0] = a3;
        v42[1] = v22;
        *(float *)&double v26 = v8;
        v42[2] = +[NSNumber numberWithFloat:v26];
        id v22 = objc_msgSend(v25, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 3), v13, v15, v17, v19);
      }
    }
    if (v32 >= 1.0e-10)
    {
      v40[0] = @"inputScale";
      v40[1] = @"inputStrength";
      v41[0] = +[CIVector vectorWithX:600.0 / v21 / v17 Y:600.0 / v21 / v19];
      *(float *)&double v29 = v31;
      v41[1] = +[NSNumber numberWithFloat:v29];
      id v22 = objc_msgSend(v22, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLocalContrast", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
      v38[0] = @"inputAmount";
      v38[1] = @"inputISO";
      v39[0] = +[NSNumber numberWithDouble:v21 * 0.5];
      v39[1] = &off_7A938;
      v27 = v39;
      v28 = v38;
    }
    else
    {
      v36[0] = @"inputAmount";
      v36[1] = @"inputISO";
      v37[0] = +[NSNumber numberWithDouble:v21 * 0.2];
      v37[1] = &off_7A938;
      v27 = v37;
      v28 = v36;
    }
    v35[0] = objc_msgSend(v22, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v28, 2));
    v35[1] = v23;
    v35[2] = &off_7A5A0;
    v33[0] = kCIInputBackgroundImageKey;
    v33[1] = kCIInputMaskImageKey;
    v34[0] = a3;
    v34[1] = a4;
    return objc_msgSend(objc_msgSend(-[CIPortraitEffectLight _textureAdd](self, "_textureAdd"), "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3), v13, v15, v17, v19), "imageByApplyingFilter:withInputParameters:", @"CIBlendWithBlueMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
  }
  return a3;
}

- (id)processTeethIn:(id)a3 withFaceMask:(id)a4
{
  [(NSNumber *)self->super.inputTeeth floatValue];
  float v8 = v7;
  [a3 extent];
  double v12 = v11;
  double v14 = v13;
  if (fabsf(v8) >= 1.0e-10)
  {
    double v15 = v9;
    double v16 = v10;
    id v17 = [(CIPortraitEffectLight *)self _whitenTeeth];
    v19[0] = a3;
    v19[1] = a4;
    v19[2] = self->super.inputTeeth;
    return objc_msgSend(v17, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3), v12, v14, v15, v16);
  }
  return a3;
}

- (id)skinMaskForLandmarks:(id)a3
{
  return [(CIPortraitEffectLight *)self maskForLandmarks:a3 withFilterNamed:@"CIPortraitSkinMask"];
}

- (id)teethMaskForLandmarks:(id)a3
{
  return [(CIPortraitEffectLight *)self maskForLandmarks:a3 withFilterNamed:@"CIPortraitToothMask"];
}

- (id)processSkinIn:(id)a3 withSkinMask:(id)a4
{
  [(NSNumber *)self->super.inputSmooth floatValue];
  float v8 = v7;
  [(NSNumber *)self->super.inputLocalContrast floatValue];
  double v10 = fabsf(v8);
  float v11 = fabsf(v9);
  if (v10 >= 1.0e-10 || v11 >= 1.0e-10)
  {
    float v31 = v9;
    float v32 = v11;
    [a3 extent];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(NSNumber *)self->super.inputScale floatValue];
    double v21 = v20;
    id v22 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", (float)(v20 * 1.5)), "imageByCroppingToRect:", v13, v15, v17, v19);
    v45[0] = a3;
    v45[1] = v22;
    id v23 = objc_msgSend(-[CIPortraitEffectLight _textureDiff](self, "_textureDiff"), "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2), v13, v15, v17, v19);
    if (v10 >= 1.0e-10)
    {
      id v24 = [v22 imageByClampingToExtent];
      v44[0] = &off_7A920;
      v43[0] = @"inputPointCount";
      v43[1] = @"inputRadius";
      v44[1] = +[NSNumber numberWithDouble:v21 * 4.0];
      id v22 = objc_msgSend(objc_msgSend(v24, "imageByApplyingFilter:withInputParameters:", @"CIRingBlur", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2)), "imageByCroppingToRect:", v13, v15, v17, v19);
      if (v8 < 1.0)
      {
        id v25 = [(CIPortraitEffectLight *)self _mixKernel];
        v42[0] = a3;
        v42[1] = v22;
        *(float *)&double v26 = v8;
        v42[2] = +[NSNumber numberWithFloat:v26];
        id v22 = objc_msgSend(v25, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 3), v13, v15, v17, v19);
      }
    }
    if (v32 >= 1.0e-10)
    {
      v40[0] = @"inputScale";
      v40[1] = @"inputStrength";
      v41[0] = +[CIVector vectorWithX:600.0 / v21 / v17 Y:600.0 / v21 / v19];
      *(float *)&double v29 = v31;
      v41[1] = +[NSNumber numberWithFloat:v29];
      id v22 = objc_msgSend(v22, "imageByApplyingFilter:withInputParameters:", @"CIPortraitLocalContrast", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
      v38[0] = @"inputAmount";
      v38[1] = @"inputISO";
      v39[0] = +[NSNumber numberWithDouble:v21 * 0.5];
      v39[1] = &off_7A938;
      v27 = v39;
      v28 = v38;
    }
    else
    {
      v36[0] = @"inputAmount";
      v36[1] = @"inputISO";
      v37[0] = +[NSNumber numberWithDouble:v21 * 0.2];
      v37[1] = &off_7A938;
      v27 = v37;
      v28 = v36;
    }
    v35[0] = objc_msgSend(v22, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v28, 2));
    v35[1] = v23;
    v35[2] = &off_7A5A0;
    v33[0] = kCIInputBackgroundImageKey;
    v33[1] = kCIInputMaskImageKey;
    v34[0] = a3;
    v34[1] = a4;
    return objc_msgSend(objc_msgSend(-[CIPortraitEffectLight _textureAdd](self, "_textureAdd"), "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3), v13, v15, v17, v19), "imageByApplyingFilter:withInputParameters:", @"CIBlendWithRedMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
  }
  return a3;
}

- (id)processTeethIn:(id)a3 withTeethMask:(id)a4
{
  [(NSNumber *)self->super.inputTeeth floatValue];
  float v8 = v7;
  [a3 extent];
  double v12 = v11;
  double v14 = v13;
  if (fabsf(v8) >= 1.0e-10)
  {
    double v15 = v9;
    double v16 = v10;
    id v17 = [(CIPortraitEffectLight *)self _whitenTeeth];
    v19[0] = a3;
    v19[1] = a4;
    v19[2] = self->super.inputTeeth;
    return objc_msgSend(v17, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3), v12, v14, v15, v16);
  }
  return a3;
}

- (id)processEyesIn:(id)a3 withEyeBlur:(id)a4 landmarks:(id)a5
{
  if (!a4) {
    sub_4CA98();
  }
  [(NSNumber *)self->super.inputEyes floatValue];
  float v10 = v9;
  [a4 extent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = objc_msgSend(objc_msgSend(a3, "imageByCroppingToRect:"), "_imageByRenderingToIntermediate");
  id v20 = [(CIPortraitEffectLight *)self _eyeBrightenSoftlight];
  v31[0] = v19;
  v31[1] = a4;
  v31[2] = self->super.inputEyes;
  id v21 = objc_msgSend(v20, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3), v12, v14, v16, v18);
  double v22 = v10 * 1.2;
  *(float *)&double v22 = v22;
  float v23 = v10 * 2.19;
  v29[0] = @"inputSharpness";
  v29[1] = @"inputRadius";
  v30[0] = +[NSNumber numberWithFloat:v22];
  *(float *)&double v24 = v23;
  v30[1] = +[NSNumber numberWithFloat:v24];
  id v25 = objc_msgSend(v21, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v27[0] = kCIInputBackgroundImageKey;
  v27[1] = kCIInputMaskImageKey;
  v28[0] = v19;
  v28[1] = [(CIPortraitEffectLight *)self eyeBlurForLandmarks:a5];
  return objc_msgSend(objc_msgSend(v25, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithBlueMask", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2)), "imageByCompositingOverImage:", a3);
}

- (id)imageForLandmarks:(id)a3
{
  if (!self->super.inputImage) {
    return 0;
  }
  if (([a3 sanityCheckStatus] & 0x80000000) != 0) {
    return self->super.inputImage;
  }
  if (qword_8D020 != -1) {
    dispatch_once(&qword_8D020, &stru_75978);
  }
  id v5 = [(CIPortraitEffectLight *)self eyeBlurForLandmarks:a3];
  id v6 = v5;
  if (v5)
  {
    [v5 extent];
    CGFloat x = v7;
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }
  if (byte_8C8D0)
  {
    id v16 = [(CIPortraitEffectLight *)self faceMaskForLandmarks:a3];
    id v15 = v16;
    if (!v16) {
      return v15;
    }
    [v16 extent];
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGRect v42 = CGRectUnion(v41, v46);
    double v17 = v42.origin.x;
    double v18 = v42.origin.y;
    double v19 = v42.size.width;
    double v20 = v42.size.height;
    id v21 = (CIImage *)-[CIImage _imageByRenderingToIntermediate](-[CIImage imageByCroppingToRect:](self->super.inputImage, "imageByCroppingToRect:"), "_imageByRenderingToIntermediate");
    id v22 = [(CIPortraitEffectLight *)self processTeethIn:[(CIPortraitEffectLight *)self processSkinIn:v21 withFaceMask:v15] withFaceMask:v15];
  }
  else
  {
    id v23 = [(CIPortraitEffectLight *)self skinMaskForLandmarks:a3];
    id v24 = [(CIPortraitEffectLight *)self teethMaskForLandmarks:a3];
    [v23 extent];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [v24 extent];
    v47.origin.CGFloat x = v33;
    v47.origin.CGFloat y = v34;
    v47.size.CGFloat width = v35;
    v47.size.CGFloat height = v36;
    v43.origin.CGFloat x = v26;
    v43.origin.CGFloat y = v28;
    v43.size.CGFloat width = v30;
    v43.size.CGFloat height = v32;
    CGRect v44 = CGRectUnion(v43, v47);
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRect v45 = CGRectUnion(v44, v48);
    double v17 = v45.origin.x;
    double v18 = v45.origin.y;
    double v19 = v45.size.width;
    double v20 = v45.size.height;
    id v21 = -[CIImage imageByCroppingToRect:](self->super.inputImage, "imageByCroppingToRect:");
    id v22 = [(CIPortraitEffectLight *)self processTeethIn:[(CIPortraitEffectLight *)self processSkinIn:v21 withSkinMask:v23] withTeethMask:v24];
  }
  id v15 = v22;
  if (v22)
  {
    if (v6) {
      id v15 = [(CIPortraitEffectLight *)self processEyesIn:v22 withEyeBlur:v6 landmarks:a3];
    }
    [(NSNumber *)self->super.inputStrength floatValue];
    if (v37 < 1.0)
    {
      id v38 = [(CIPortraitEffectLight *)self _mixKernel];
      v40[0] = v21;
      v40[1] = v15;
      void v40[2] = self->super.inputStrength;
      return objc_msgSend(v38, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3), v17, v18, v19, v20);
    }
  }
  return v15;
}

- (id)enrichImage:(id)a3
{
  [(NSNumber *)self->super.inputEnrich floatValue];
  if (fabsf(v5) >= 1.0e-10)
  {
    id v6 = [(CIPortraitEffectLight *)self _enrich];
    double v7 = +[CIVector vectorWithX:0.0799999982 Y:0.400249988 Z:0.0 W:0.548565447];
    [a3 extent];
    inputEnrich = self->super.inputEnrich;
    v14[0] = a3;
    v14[1] = inputEnrich;
    v14[2] = v7;
    return objc_msgSend(v6, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3), v9, v10, v11, v12);
  }
  return a3;
}

- (id)outputImage
{
  if (!self->super.inputImage) {
    return 0;
  }
  inputImage = self->super.inputImage;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->super.inputFaceLandmarkArray;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v8 = objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"orientation", inputImage), "intValue");
        if (![v7 sanityCheckStatus])
        {
          [(CIImage *)self->super.inputImage extent];
          if (v8 > 4)
          {
            *(float *)&double v9 = v11;
            [v7 setImageWidthScale:v9];
            [(CIImage *)self->super.inputImage extent];
          }
          else
          {
            *(float *)&double v9 = v10;
            [v7 setImageWidthScale:v9];
            [(CIImage *)self->super.inputImage extent];
            double v14 = v13;
          }
          *(float *)&double v12 = v14;
          [v7 setImageHeightScale:v12];
        }
        +[CIPortraitEffect checkFeaturesDictionary:v7];
        if (([v7 sanityCheckStatus] & 0x80000000) == 0)
        {
          float v15 = 0.0;
          float v16 = 0.0;
          if ([v7 objectForKeyedSubscript:@"faceJunkinessIndex"])
          {
            objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
            float v16 = v17;
          }
          if ([v7 objectForKeyedSubscript:@"faceBoundingBox"])
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
            float v15 = v18;
          }
          if ([v7 objectForKeyedSubscript:@"roll"])
          {
            objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", @"roll"), "floatValue");
            float v20 = fabsf(v19);
          }
          else
          {
            float v20 = 0.0;
          }
          if (v16 < -0.2 && v15 > 0.15 && v20 < 1.05)
          {
            id v21 = [(CIPortraitEffectLight *)self imageForLandmarks:v7];
            if (v21) {
              inputImage = (CIImage *)[v21 imageByCompositingOverImage:inputImage];
            }
          }
        }
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }
  return -[CIPortraitEffectLight enrichImage:](self, "enrichImage:", inputImage, inputImage);
}

@end