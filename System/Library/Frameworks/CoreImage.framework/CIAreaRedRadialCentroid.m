@interface CIAreaRedRadialCentroid
+ (id)customAttributes;
- (CIImage)inputCenter;
- (NSNumber)inputMinWeight;
- (NSNumber)inputRadialMode;
- (NSNumber)inputRadius;
- (id)_kernelCenter;
- (id)_kernelDisk;
- (id)_kernelGaussian;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputMinWeight:(id)a3;
- (void)setInputRadialMode:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIAreaRedRadialCentroid

+ (id)customAttributes
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryReduction";
  v13[1] = @"CICategoryBuiltIn";
  v13[2] = @"CICategoryHighDynamicRange";
  v13[3] = @"CICategoryApplePrivate";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v14[1] = @"inputCenter";
  v11 = @"CIAttributeType";
  v12 = @"CIAttributeTypeImage";
  v15[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14[2] = @"inputRadius";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeMax";
  v10[0] = &unk_1EE4AAE50;
  v10[1] = &unk_1EE4AB720;
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = &unk_1EE4AAEC8;
  v10[3] = @"CIAttributeTypeScalar";
  v15[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v14[3] = @"inputRadialMode";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4AAE50;
  v8[1] = &unk_1EE4AAEE0;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeType";
  v8[2] = &unk_1EE4AAE50;
  v8[3] = @"CIAttributeTypeInteger";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v14[4] = @"inputMinWeight";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = &unk_1EE4AAE50;
  v6[1] = &unk_1EE4AB720;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = &unk_1EE4AAE50;
  v6[3] = @"CIAttributeTypeScalar";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  id v3 = (id)objc_msgSend(+[CIAreaCentroid customAttributes](CIAreaCentroid, "customAttributes"), "mutableCopy");
  [v3 addEntriesFromDictionary:v2];
  return v3;
}

- (id)_kernelGaussian
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_RCFalloffGaussian];
}

- (id)_kernelDisk
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_RCFalloffDisk];
}

- (id)_kernelCenter
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_RCCenter];
}

- (id)outputImage
{
  v69[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSNumber *)self->inputRadialMode integerValue];
  inputCenter = self->inputCenter;
  if (self->super.super.super.inputExtent) {
    BOOL v5 = inputCenter == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = v3;
    if ((v3 & 0x8000000000000000) == 0 && v3 <= 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [(CIAreaRedRadialCentroid *)self _kernelCenter];
        [(CIImage *)self->super.super.super.inputImage extent];
        v66 = self->inputCenter;
        inputCenter = (CIImage *)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v66, 1), v8, v9, v10, v11);
      }
      v12 = [(CIImage *)inputCenter imageByClampingToExtent];
      [(NSNumber *)self->inputRadius floatValue];
      float v14 = v13;
      [(NSNumber *)self->inputRadius floatValue];
      float v16 = v14 * v15;
      if (v6)
      {
        float v16 = 1.0 / (v16 / 9.0);
        id v17 = [(CIAreaRedRadialCentroid *)self _kernelGaussian];
        [(CIImage *)self->super.super.super.inputImage extent];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        inputImage = self->super.super.super.inputImage;
        p_inputImage = &inputImage;
      }
      else
      {
        id v17 = [(CIAreaRedRadialCentroid *)self _kernelDisk];
        [(CIImage *)self->super.super.super.inputImage extent];
        double v19 = v18;
        double v21 = v27;
        double v23 = v28;
        double v25 = v29;
        v65 = self->super.super.super.inputImage;
        p_inputImage = &v65;
      }
      p_inputImage[1] = v12;
      *(float *)&double v18 = v16;
      p_inputImage[2] = (CIImage *)[NSNumber numberWithFloat:v18];
      v30 = objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", p_inputImage, 3), v19, v21, v23, v25);
      inputExtent = self->super.super.super.inputExtent;
      v62 = @"inputExtent";
      v63 = inputExtent;
      inputCenter = (CIImage *)objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", @"CIAreaRedCentroid", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
      inputMinWeight = self->inputMinWeight;
      if (inputMinWeight)
      {
        [(NSNumber *)inputMinWeight floatValue];
        if (v33 > 0.0)
        {
          v68 = @"inputExtent";
          float v61 = v33;
          [(CIImage *)inputCenter extent];
          v69[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
          uint64_t v34 = objc_msgSend((id)objc_msgSend(v30, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1)), "imageByClampingToExtent");
          v35 = +[CIKernel kernelWithInternalRepresentation:&CI::_RCSelectGreaterThan];
          [(CIImage *)inputCenter extent];
          CGFloat v37 = v36;
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          CGFloat v43 = v42;
          [(CIImage *)v12 extent];
          v74.origin.double x = v44;
          v74.origin.double y = v45;
          v74.size.double width = v46;
          v74.size.double height = v47;
          v70.origin.double x = v37;
          v70.origin.double y = v39;
          v70.size.double width = v41;
          v70.size.double height = v43;
          CGRect v71 = CGRectUnion(v70, v74);
          double x = v71.origin.x;
          double y = v71.origin.y;
          double width = v71.size.width;
          double height = v71.size.height;
          [v30 extent];
          v75.origin.double x = v52;
          v75.origin.double y = v53;
          v75.size.double width = v54;
          v75.size.double height = v55;
          v72.origin.double x = x;
          v72.origin.double y = y;
          v72.size.double width = width;
          v72.size.double height = height;
          CGRect v73 = CGRectUnion(v72, v75);
          double v56 = v73.origin.x;
          double v57 = v73.origin.y;
          double v58 = v73.size.width;
          double v59 = v73.size.height;
          v67[0] = inputCenter;
          v67[1] = v12;
          v67[2] = v34;
          *(float *)&v73.origin.double x = v61;
          v67[3] = [NSNumber numberWithFloat:v73.origin.x];
          return -[CIImage imageByCroppingToRect:](-[CIColorKernel applyWithExtent:arguments:](v35, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4], v56, v57, v58, v59), "imageByCroppingToRect:", x, y, width, height);
        }
      }
    }
  }
  return inputCenter;
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputRadialMode
{
  return self->inputRadialMode;
}

- (void)setInputRadialMode:(id)a3
{
}

- (NSNumber)inputMinWeight
{
  return self->inputMinWeight;
}

- (void)setInputMinWeight:(id)a3
{
}

@end