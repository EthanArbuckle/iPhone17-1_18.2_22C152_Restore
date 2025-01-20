@interface CIPortraitPrepareStage
+ (id)customAttributes;
- (CIImage)inputDisparityImage;
- (CIImage)inputImage;
- (CIImage)inputThresholdImage;
- (CIVector)inputBandRange;
- (NSNumber)inputAdaptiveThresholdRange;
- (NSNumber)inputFeatherBandRange;
- (NSNumber)inputFilterCut;
- (NSNumber)inputLambda;
- (NSNumber)inputMaxNumIterations;
- (NSNumber)inputMaxNumVertices;
- (NSNumber)inputSigmaFallout;
- (NSNumber)inputSigmaRChroma;
- (NSNumber)inputSigmaRLuma;
- (NSNumber)inputSigmaS;
- (NSNumber)inputThresholdOffset;
- (id)boxBlur3Mono;
- (id)computeBand;
- (id)convertToHalfFloat;
- (id)denormalize;
- (id)filterCut;
- (id)foreground;
- (id)invertImage;
- (id)normalizeToPhysicalDepth;
- (id)outputImage;
- (id)protectInterior;
- (id)renormalize01;
- (id)renormalizeThreshold;
- (void)setInputAdaptiveThresholdRange:(id)a3;
- (void)setInputBandRange:(id)a3;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputFeatherBandRange:(id)a3;
- (void)setInputFilterCut:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLambda:(id)a3;
- (void)setInputMaxNumIterations:(id)a3;
- (void)setInputMaxNumVertices:(id)a3;
- (void)setInputSigmaFallout:(id)a3;
- (void)setInputSigmaRChroma:(id)a3;
- (void)setInputSigmaRLuma:(id)a3;
- (void)setInputSigmaS:(id)a3;
- (void)setInputThresholdImage:(id)a3;
- (void)setInputThresholdOffset:(id)a3;
@end

@implementation CIPortraitPrepareStage

+ (id)customAttributes
{
  v28[0] = kCIAttributeFilterCategories;
  v27[0] = kCICategoryColorAdjustment;
  v27[1] = kCICategoryVideo;
  v27[2] = kCICategoryStillImage;
  v27[3] = kCICategoryBuiltIn;
  v27[4] = kCICategoryApplePrivate;
  v29[0] = +[NSArray arrayWithObjects:v27 count:5];
  v29[1] = @"11";
  v28[1] = kCIAttributeFilterAvailable_iOS;
  v28[2] = kCIAttributeFilterAvailable_Mac;
  v29[2] = @"10.13";
  v28[3] = @"inputMaxNumVertices";
  v25[0] = kCIAttributeDefault;
  v25[1] = kCIAttributeType;
  v26[0] = &off_7A7A0;
  v26[1] = kCIAttributeTypeInteger;
  v29[3] = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[4] = @"inputSigmaS";
  v23[0] = kCIAttributeDefault;
  v23[1] = kCIAttributeMin;
  v24[0] = &off_7A7B8;
  v24[1] = &off_7A7B8;
  v23[2] = kCIAttributeMax;
  v23[3] = kCIAttributeType;
  v24[2] = &off_7A7D0;
  v24[3] = kCIAttributeTypeInteger;
  v29[4] = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v28[5] = @"inputSigmaRLuma";
  v21[0] = kCIAttributeDefault;
  v21[1] = kCIAttributeMin;
  v22[0] = &off_7A7B8;
  v22[1] = &off_7A7B8;
  v21[2] = kCIAttributeMax;
  v21[3] = kCIAttributeType;
  v22[2] = &off_7A7D0;
  v22[3] = kCIAttributeTypeInteger;
  v29[5] = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  v28[6] = @"inputSigmaRChroma";
  v19[0] = kCIAttributeDefault;
  v19[1] = kCIAttributeMin;
  v20[0] = &off_7A7B8;
  v20[1] = &off_7A7B8;
  v19[2] = kCIAttributeMax;
  v19[3] = kCIAttributeType;
  v20[2] = &off_7A7D0;
  v20[3] = kCIAttributeTypeInteger;
  v29[6] = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v28[7] = @"inputLambda";
  v17[0] = kCIAttributeDefault;
  v17[1] = kCIAttributeType;
  v18[0] = &off_7A9E0;
  v18[1] = kCIAttributeTypeScalar;
  v29[7] = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v28[8] = @"inputMaxNumIterations";
  v15[0] = kCIAttributeDefault;
  v15[1] = kCIAttributeType;
  v16[0] = &off_7A7E8;
  v16[1] = kCIAttributeTypeInteger;
  v29[8] = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v28[9] = @"inputBandRange";
  v13[0] = kCIAttributeDefault;
  v13[1] = kCIAttributeType;
  v14[0] = +[CIVector vectorWithX:0.00999999978 Y:0.200000003];
  v14[1] = kCIAttributeTypePosition;
  v29[9] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v28[10] = @"inputThresholdOffset";
  v11[0] = kCIAttributeDefault;
  v11[1] = kCIAttributeType;
  v12[0] = &off_7A9F0;
  v12[1] = kCIAttributeTypeScalar;
  v29[10] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v28[11] = @"inputFilterCut";
  v9[0] = kCIAttributeDefault;
  v9[1] = kCIAttributeType;
  v10[0] = &off_7AA00;
  v10[1] = kCIAttributeTypeScalar;
  v29[11] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v28[12] = @"inputFeatherBandRange";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeType;
  v8[0] = &off_7AA10;
  v8[1] = kCIAttributeTypeScalar;
  v29[12] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v28[13] = @"inputAdaptiveThresholdRange";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeType;
  v6[0] = &off_799E0;
  v6[1] = kCIAttributeTypeScalar;
  v29[13] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v28[14] = @"inputSigmaFallout";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &off_799F0;
  v4[1] = kCIAttributeTypeScalar;
  v29[14] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:15];
}

- (id)renormalize01
{
  if (qword_8C900 != -1) {
    dispatch_once(&qword_8C900, &stru_749E8);
  }
  return (id)qword_8C8F8;
}

- (id)computeBand
{
  if (qword_8C910 != -1) {
    dispatch_once(&qword_8C910, &stru_74A08);
  }
  return (id)qword_8C908;
}

- (id)protectInterior
{
  if (qword_8C920 != -1) {
    dispatch_once(&qword_8C920, &stru_74A28);
  }
  return (id)qword_8C918;
}

- (id)invertImage
{
  if (qword_8C930 != -1) {
    dispatch_once(&qword_8C930, &stru_74A48);
  }
  return (id)qword_8C928;
}

- (id)normalizeToPhysicalDepth
{
  if (qword_8C940 != -1) {
    dispatch_once(&qword_8C940, &stru_74A68);
  }
  return (id)qword_8C938;
}

- (id)foreground
{
  if (qword_8C950 != -1) {
    dispatch_once(&qword_8C950, &stru_74A88);
  }
  return (id)qword_8C948;
}

- (id)filterCut
{
  if (qword_8C960 != -1) {
    dispatch_once(&qword_8C960, &stru_74AA8);
  }
  return (id)qword_8C958;
}

- (id)boxBlur3Mono
{
  if (qword_8C970 != -1) {
    dispatch_once(&qword_8C970, &stru_74AC8);
  }
  return (id)qword_8C968;
}

- (id)denormalize
{
  if (qword_8C980 != -1) {
    dispatch_once(&qword_8C980, &stru_74AE8);
  }
  return (id)qword_8C978;
}

- (id)convertToHalfFloat
{
  if (qword_8C990 != -1) {
    dispatch_once(&qword_8C990, &stru_74B08);
  }
  return (id)qword_8C988;
}

- (id)renormalizeThreshold
{
  if (qword_8C9A0 != -1) {
    dispatch_once(&qword_8C9A0, &stru_74B28);
  }
  return (id)qword_8C998;
}

- (id)outputImage
{
  id result = self->inputDisparityImage;
  if (result)
  {
    if (self->inputImage && self->inputThresholdImage)
    {
      [(CIImage *)self->inputImage extent];
      if (CGRectIsInfinite(v94)) {
        return self->inputDisparityImage;
      }
      [(CIImage *)self->inputDisparityImage extent];
      if (CGRectIsInfinite(v95))
      {
        return self->inputDisparityImage;
      }
      else
      {
        [(CIImage *)self->inputImage extent];
        double v5 = v4;
        double v7 = v6;
        [(CIImage *)self->inputDisparityImage extent];
        CGFloat v9 = v8 / v5;
        CGFloat v11 = v10 / v7;
        [(CIImage *)self->inputDisparityImage extent];
        double v74 = v13;
        double v75 = v12;
        double v15 = v14;
        double v17 = v16;
        id v18 = [(CIPortraitPrepareStage *)self convertToHalfFloat];
        [(CIImage *)self->inputImage extent];
        inputImage = self->inputImage;
        id v23 = objc_msgSend(v18, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &inputImage, 1), v19, v20, v21, v22);
        CGAffineTransformMakeScale(&v76, v9, v11);
        id v73 = [v23 imageByApplyingTransform:&v76];
        inputDisparityImage = self->inputDisparityImage;
        v90 = kCIInputExtentKey;
        [(CIImage *)inputDisparityImage extent];
        v91 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
        v25 = [[(CIImage *)inputDisparityImage imageByApplyingFilter:@"CIAreaMinMaxRed" withInputParameters:+[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1]] imageByClampingToExtent];
        uint64_t v88 = kCIKernelOutputFormat;
        v89 = +[NSNumber numberWithInt:kCIFormatRh];
        v26 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        id v27 = [(CIPortraitPrepareStage *)self renormalize01];
        [(CIImage *)inputDisparityImage extent];
        v87[0] = inputDisparityImage;
        v87[1] = v25;
        id v32 = objc_msgSend(v27, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 2), v26, v28, v29, v30, v31);
        v85 = kCIInputDisparityImageKey;
        id v86 = v32;
        id v33 = objc_msgSend(v73, "imageByApplyingFilter:withInputParameters:", @"CIConfidenceMap", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
        id v34 = [(CIPortraitPrepareStage *)self renormalizeThreshold];
        [(CIImage *)self->inputThresholdImage extent];
        v84[0] = self->inputThresholdImage;
        v84[1] = v25;
        v35 = v25;
        id v40 = objc_msgSend(v34, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 2), v26, v36, v37, v38, v39);
        [(CIVector *)self->inputBandRange X];
        double v42 = v41;
        [(CIVector *)self->inputBandRange Y];
        double v44 = v43;
        [(NSNumber *)self->inputFeatherBandRange floatValue];
        v46 = +[CIVector vectorWithX:v42 Y:v44 Z:v45];
        id v47 = [(CIPortraitPrepareStage *)self computeBand];
        [v32 extent];
        v83[0] = v32;
        v83[1] = v40;
        v83[2] = v35;
        v83[3] = v46;
        id v52 = objc_msgSend(v47, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 4), v26, v48, v49, v50, v51);
        id v53 = [(CIPortraitPrepareStage *)self protectInterior];
        [v52 extent];
        v82[0] = v33;
        v82[1] = v52;
        id v58 = objc_msgSend(v53, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2), v26, v54, v55, v56, v57);
        id v59 = [v73 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
        v80[0] = kCIInputImageKey;
        v80[1] = kCIInputDisparityImageKey;
        v81[0] = v59;
        v81[1] = v32;
        inputMaxNumVertices = self->inputMaxNumVertices;
        v80[2] = @"inputConfidenceMapImage";
        v80[3] = @"inputMaxNumVertices";
        inputSigmaS = self->inputSigmaS;
        v81[2] = v58;
        v81[3] = inputMaxNumVertices;
        v80[4] = @"inputSigmaS";
        v80[5] = @"inputSigmaRLuma";
        inputSigmaRLuma = self->inputSigmaRLuma;
        inputSigmaRChroma = self->inputSigmaRChroma;
        v81[4] = inputSigmaS;
        v81[5] = inputSigmaRLuma;
        inputLambda = self->inputLambda;
        v80[6] = @"inputSigmaRChroma";
        v80[7] = @"inputLambda";
        v81[6] = inputSigmaRChroma;
        v81[7] = inputLambda;
        v80[8] = @"inputMaxNumIterations";
        v81[8] = self->inputMaxNumIterations;
        v65 = -[CIImage imageByApplyingFilter:](-[CIImage imageByCroppingToRect:]([+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"PortraitFastBilateralSolver", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 9)) outputImage], "imageByCroppingToRect:", v75, v74, v15, v17), "imageByApplyingFilter:",
                @"PFBoxBlur3_7");
        id v66 = [(CIPortraitPrepareStage *)self denormalize];
        [(CIImage *)v65 extent];
        v79[0] = v65;
        v79[1] = v35;
        id v71 = objc_msgSend(v66, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 2), v26, v67, v68, v69, v70);
        v72 = +[CIVector vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
        v77[0] = @"inputRVector";
        v77[1] = @"inputGVector";
        v78[0] = v72;
        v78[1] = v72;
        v77[2] = @"inputBVector";
        v78[2] = v72;
        return objc_msgSend(objc_msgSend(v71, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 3)), "imageByCroppingToRect:", v75, v74, v15, v17);
      }
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputDisparityImage:(id)a3
{
}

- (CIImage)inputThresholdImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputThresholdImage:(id)a3
{
}

- (NSNumber)inputMaxNumVertices
{
  return self->inputMaxNumVertices;
}

- (void)setInputMaxNumVertices:(id)a3
{
}

- (NSNumber)inputSigmaS
{
  return self->inputSigmaS;
}

- (void)setInputSigmaS:(id)a3
{
}

- (NSNumber)inputSigmaRLuma
{
  return self->inputSigmaRLuma;
}

- (void)setInputSigmaRLuma:(id)a3
{
}

- (NSNumber)inputSigmaRChroma
{
  return self->inputSigmaRChroma;
}

- (void)setInputSigmaRChroma:(id)a3
{
}

- (NSNumber)inputLambda
{
  return self->inputLambda;
}

- (void)setInputLambda:(id)a3
{
}

- (NSNumber)inputMaxNumIterations
{
  return self->inputMaxNumIterations;
}

- (void)setInputMaxNumIterations:(id)a3
{
}

- (CIVector)inputBandRange
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputBandRange:(id)a3
{
}

- (NSNumber)inputThresholdOffset
{
  return self->inputThresholdOffset;
}

- (void)setInputThresholdOffset:(id)a3
{
}

- (NSNumber)inputFilterCut
{
  return self->inputFilterCut;
}

- (void)setInputFilterCut:(id)a3
{
}

- (NSNumber)inputFeatherBandRange
{
  return self->inputFeatherBandRange;
}

- (void)setInputFeatherBandRange:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdRange
{
  return self->inputAdaptiveThresholdRange;
}

- (void)setInputAdaptiveThresholdRange:(id)a3
{
}

- (NSNumber)inputSigmaFallout
{
  return self->inputSigmaFallout;
}

- (void)setInputSigmaFallout:(id)a3
{
}

@end