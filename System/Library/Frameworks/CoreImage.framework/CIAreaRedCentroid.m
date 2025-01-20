@interface CIAreaRedCentroid
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation CIAreaRedCentroid

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryReduction";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryHighDynamicRange";
  v3[5] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v45[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->super.super.inputImage;
  if (!inputImage) {
    goto LABEL_3;
  }
  [(CIImage *)inputImage extent];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CIVector *)self->super.super.inputExtent CGRectValue];
  v49.origin.x = v12;
  v49.origin.y = v13;
  v49.size.width = v14;
  v49.size.height = v15;
  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  CGRect v48 = CGRectIntersection(v47, v49);
  if (!CGRectIsEmpty(v48))
  {
    [(CIVector *)self->super.super.inputExtent CGRectValue];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v17);
    id v26 = [(CIAreaCentroid *)self _kernelWeightedCoordinate];
    [(CIImage *)self->super.super.inputImage extent];
    v45[0] = self->super.super.inputImage;
    v45[1] = v25;
    v31 = objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v45, 2), v27, v28, v29, v30);
    v43 = @"inputExtent";
    v44 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v18, v20, v22, v24);
    v32 = objc_msgSend((id)objc_msgSend(v31, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1)), "imageByUnpremultiplyingAlpha");
    id v33 = [(CIAreaCentroid *)self _kernelCentroid];
    [v32 extent];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42[0] = v32;
    v42[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v18, v20, v22, v24);
    return (id)objc_msgSend((id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v42, 2), v35, v37, v39, v41), "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0);
  }
  else
  {
LABEL_3:
    return +[CIImage emptyImage];
  }
}

@end