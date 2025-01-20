@interface CISegmentationFusion
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (id)kernel;
- (id)outputImage;
@end

@implementation CISegmentationFusion

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_segmentationFusion];
}

+ (id)customAttributes
{
  v22[3] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(&unk_1EE4AB388, "objectForKeyedSubscript:", @"additiveLowerAlpha"), "floatValue");
  double v3 = v2;
  objc_msgSend((id)objc_msgSend(&unk_1EE4AB388, "objectForKeyedSubscript:", @"additiveUpperAlpha"), "floatValue");
  double v5 = v4;
  objc_msgSend((id)objc_msgSend(&unk_1EE4AB388, "objectForKeyedSubscript:", @"additiveMaxBlur"), "floatValue");
  v7 = +[CIVector vectorWithX:v3 Y:v5 Z:v6];
  objc_msgSend((id)objc_msgSend(&unk_1EE4AB388, "objectForKeyedSubscript:", @"subtractiveLowerAlpha"), "floatValue");
  double v9 = v8;
  objc_msgSend((id)objc_msgSend(&unk_1EE4AB388, "objectForKeyedSubscript:", @"subtractiveUpperAlpha"), "floatValue");
  double v11 = v10;
  objc_msgSend((id)objc_msgSend(&unk_1EE4AB388, "objectForKeyedSubscript:", @"subtractiveMaxBlur"), "floatValue");
  v13 = +[CIVector vectorWithX:v9 Y:v11 Z:v12];
  v21[0] = @"inputAddBlur";
  v19[0] = @"CIAttributeType";
  v19[1] = @"CIAttributeDefault";
  v20[0] = @"CIAttributeTypePosition3";
  v20[1] = v7;
  v19[2] = @"CIAttributeIdentity";
  v20[2] = &unk_1EE4AA270;
  v22[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v21[1] = @"inputRemoveBlur";
  v17[0] = @"CIAttributeType";
  v17[1] = @"CIAttributeDefault";
  v18[0] = @"CIAttributeTypePosition3";
  v18[1] = v13;
  v17[2] = @"CIAttributeIdentity";
  v18[2] = &unk_1EE4AA270;
  v22[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v21[2] = @"inputApertureScaling";
  v15[0] = @"CIAttributeType";
  v15[1] = @"CIAttributeDefault";
  v16[0] = @"CIAttributeTypeScalar";
  v16[1] = &unk_1EE4AA280;
  v15[2] = @"CIAttributeIdentity";
  v16[2] = &unk_1EE4AA280;
  v22[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
}

- (BOOL)_isIdentity
{
  [(CIVector *)self->inputAddBlur Z];
  BOOL result = 0;
  if (v3 == 0.0)
  {
    [(CIVector *)self->inputRemoveBlur Z];
    if (v4 == 0.0) {
      return 1;
    }
  }
  return result;
}

- (id)outputImage
{
  v77[4] = *MEMORY[0x1E4F143B8];
  inputMatteImage = self->inputMatteImage;
  if (!inputMatteImage) {
    return self->inputImage;
  }
  [(CIImage *)inputMatteImage extent];
  if (v4 <= 1.0) {
    return self->inputImage;
  }
  [(CIImage *)self->inputMatteImage extent];
  if (v5 <= 1.0) {
    return self->inputImage;
  }
  float v6 = self->inputMatteImage;
  [(CIImage *)v6 extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(CIImage *)self->inputImage extent];
  v80.origin.x = v15;
  v80.origin.y = v16;
  v80.size.width = v17;
  v80.size.height = v18;
  v78.origin.x = v8;
  v78.origin.y = v10;
  v78.size.width = v12;
  v78.size.height = v14;
  if (!CGRectEqualToRect(v78, v80))
  {
    [(CIImage *)self->inputMatteImage extent];
    if (!CGRectEqualToRect(v79, *MEMORY[0x1E4F1DB10]))
    {
      [(CIImage *)self->inputImage extent];
      double v20 = v19;
      double v22 = v21;
      [(CIImage *)self->inputMatteImage extent];
      float v24 = v20 / v23;
      float v26 = v22 / v25;
      CGAffineTransformMakeScale(&v74, v24, v26);
      float v6 = [(CIImage *)v6 imageByApplyingTransform:&v74];
    }
  }
  if (!self->inputImage) {
    return 0;
  }
  if ([(CISegmentationFusion *)self _isIdentity]) {
    return self->inputImage;
  }
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v29 = v28;
  [(CIVector *)self->inputRemoveBlur X];
  float v31 = v30;
  [(CIVector *)self->inputRemoveBlur Y];
  float v33 = v32;
  [(CIVector *)self->inputRemoveBlur Z];
  *(float *)&double v34 = v34;
  float v73 = (float)(*(float *)&v34 / (float)(v33 - v31)) / v29;
  [(CIVector *)self->inputRemoveBlur X];
  float v36 = v35;
  [(CIVector *)self->inputRemoveBlur Y];
  float v38 = v37;
  [(CIVector *)self->inputRemoveBlur Z];
  *(float *)&double v39 = v39;
  float v40 = (float)((float)((float)((float)-*(float *)&v39 / (float)(v38 - v36)) * v36) + 0.0) / v29;
  [(NSNumber *)self->inputApertureScaling floatValue];
  double v42 = v41;
  [(CIVector *)self->inputRemoveBlur Z];
  double v44 = v29;
  *(float *)&double v42 = v43 * v42 / v29;
  [(CIVector *)self->inputAddBlur X];
  float v46 = v45;
  [(CIVector *)self->inputAddBlur Z];
  float v48 = v47;
  [(CIVector *)self->inputAddBlur Y];
  *(float *)&double v49 = v49;
  float v50 = (float)((float)(0.0 - v48) / (float)(*(float *)&v49 - v46)) / v29;
  [(CIVector *)self->inputAddBlur X];
  float v52 = v51;
  [(CIVector *)self->inputAddBlur Z];
  float v54 = v53;
  [(CIVector *)self->inputAddBlur Y];
  *(float *)&double v55 = v55;
  float v56 = (float)(v54 + (float)((float)((float)-(float)(0.0 - v54) / (float)(*(float *)&v55 - v52)) * v52)) / v29;
  [(NSNumber *)self->inputApertureScaling floatValue];
  double v58 = v57;
  [(CIVector *)self->inputAddBlur Z];
  *(float *)&double v58 = v59 * v58 / v44;
  v60 = +[CIVector vectorWithX:v73 Y:v40 Z:*(float *)&v42];
  v61 = +[CIVector vectorWithX:v50 Y:v56 Z:*(float *)&v58];
  id v62 = [(CISegmentationFusion *)self kernel];
  [(CIImage *)self->inputImage extent];
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  v77[0] = self->inputImage;
  v77[1] = v6;
  v77[2] = v61;
  v77[3] = v60;
  uint64_t v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
  v75[0] = @"kCIKernelOutputFormat";
  uint64_t v72 = [NSNumber numberWithInt:2053];
  v75[1] = @"kCIImageAlphaOne";
  v76[0] = v72;
  v76[1] = MEMORY[0x1E4F1CC38];
  return (id)objc_msgSend(v62, "applyWithExtent:arguments:options:", v71, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v76, v75, 2), v64, v66, v68, v70);
}

@end