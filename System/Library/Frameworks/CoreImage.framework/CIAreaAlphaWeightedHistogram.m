@interface CIAreaAlphaWeightedHistogram
+ (id)customAttributes;
- (id)outputData;
- (id)outputImage;
@end

@implementation CIAreaAlphaWeightedHistogram

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryReduction";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"18";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"15.0";
  v8[3] = @"inputCount";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7B70;
  v6[1] = &unk_1EE4A7B80;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A7B90;
  v6[3] = &unk_1EE4A7BA0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7BB0;
  v6[5] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7BC0;
  v4[1] = &unk_1EE4A7BC0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7B70;
  v4[3] = &unk_1EE4A7B70;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)outputData
{
  return 0;
}

- (id)outputImage
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (![(CIAreaHistogram *)self _inputsAreOK]) {
    return 0;
  }
  v3 = [(CIImage *)self->super.inputImage imageByUnpremultiplyingAlpha];
  v4 = +[CIKernel kernelWithInternalRepresentation:&CI::_prepHistogram];
  [(CIImage *)v3 extent];
  inputCount = self->super.inputCount;
  v37[0] = v3;
  v37[1] = inputCount;
  uint64_t v10 = -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2], v6, v7, v8, v9);
  [(CIImage *)self->super.inputImage extent];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(CIVector *)self->super.inputExtent CGRectValue];
  v40.origin.unint64_t x = v19;
  v40.origin.y = v20;
  v40.size.unint64_t width = v21;
  v40.size.unint64_t height = v22;
  v38.origin.unint64_t x = v12;
  v38.origin.y = v14;
  v38.size.unint64_t width = v16;
  v38.size.unint64_t height = v18;
  CGRect v39 = CGRectIntersection(v38, v40);
  unint64_t x = (unint64_t)v39.origin.x;
  unint64_t width = (unint64_t)v39.size.width;
  unint64_t height = (unint64_t)v39.size.height;
  v35[0] = @"areaX";
  v36[0] = [NSNumber numberWithUnsignedLong:(unint64_t)v39.origin.x];
  v35[1] = @"areaY";
  v36[1] = [NSNumber numberWithUnsignedLong:x];
  v35[2] = @"areaW";
  v36[2] = [NSNumber numberWithUnsignedLong:width];
  v35[3] = @"areaH";
  uint64_t v26 = [NSNumber numberWithUnsignedLong:height];
  inputScale = self->super.inputScale;
  v36[3] = v26;
  v36[4] = inputScale;
  v35[4] = @"scale";
  v35[5] = @"tileSize";
  uint64_t v28 = [NSNumber numberWithUnsignedLong:256];
  v35[6] = @"binCount";
  v29 = self->super.inputCount;
  v36[5] = v28;
  v36[6] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:7];
  double v31 = (double)[(NSNumber *)self->super.inputCount intValue];
  uint64_t v34 = v10;
  v32 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](TiledHistogram, "applyWithExtent:inputs:arguments:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1], v30, 0, 0.0, 0.0, v31, 1.0);
  [(CIImage *)v32 extent];
  return -[CIImage imageBySettingAlphaOneInExtent:](v32, "imageBySettingAlphaOneInExtent:");
}

@end