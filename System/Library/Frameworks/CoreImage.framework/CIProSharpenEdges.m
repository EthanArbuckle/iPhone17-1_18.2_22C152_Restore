@interface CIProSharpenEdges
+ (id)customAttributes;
- (id)_CIBlur1;
- (id)_CIBlur2;
- (id)_CIBlur4;
- (id)_CIConvertRGBtoY;
- (id)_CIEdgesPrep;
- (id)_CIFindEdges;
- (id)_CISharpenCombineEdges;
- (id)outputImage;
@end

@implementation CIProSharpenEdges

- (id)_CIConvertRGBtoY
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convertRGBtoY];
}

- (id)_CIBlur1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_blur1];
}

- (id)_CIBlur2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_blur2];
}

- (id)_CIBlur4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_blur4];
}

- (id)_CIEdgesPrep
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_edgesPrep];
}

- (id)_CIFindEdges
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_findEdges];
}

- (id)_CISharpenCombineEdges
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_sharpenCombineEdges];
}

- (id)outputImage
{
  v55[1] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputFalloff floatValue];
  float v4 = fminf(fmaxf(v3, 0.0), 1.0);
  [(NSNumber *)self->inputSharpness floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputEdgeScale floatValue];
  float v8 = v6 / (float)((float)(v4 + 1.0) + (float)(v4 * v4));
  if (v8 >= 0.1)
  {
    float v11 = fminf(fmaxf(v7, 0.0), 5.5);
    if ((float)(v4 * v8) >= 0.1) {
      float v12 = v4 * v8;
    }
    else {
      float v12 = 0.0;
    }
    if ((float)((float)(v4 * v4) * v8) >= 0.1) {
      float v13 = (float)(v4 * v4) * v8;
    }
    else {
      float v13 = 0.0;
    }
    id v14 = [(CIProSharpenEdges *)self _CIEdgesPrep];
    [(CIImage *)self->inputImage extent];
    v55[0] = self->inputImage;
    v19 = objc_msgSend(v14, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v55, 1), v15, v16, v17, v18);
    id v20 = [(CIProSharpenEdges *)self _CIFindEdges];
    [v19 extent];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v54[0] = v19;
    v54[1] = [NSNumber numberWithDouble:__exp10(v11)];
    uint64_t v29 = objc_msgSend(v20, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_48_0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v54, 2), v22, v24, v26, v28);
    id v30 = [(CIProSharpenEdges *)self _CIConvertRGBtoY];
    [(CIImage *)self->inputImage extent];
    inputImage = self->inputImage;
    v35 = objc_msgSend(v30, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &inputImage, 1), v31, v32, v33, v34);
    id v36 = [(CIProSharpenEdges *)self _CIBlur1];
    [v35 extent];
    CGRect v58 = CGRectInset(v57, -1.0, -1.0);
    v52 = v35;
    v37 = objc_msgSend(v36, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_51_0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v52, 1), v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    if (v12 > 0.0)
    {
      id v38 = [(CIProSharpenEdges *)self _CIBlur2];
      [v37 extent];
      CGRect v60 = CGRectInset(v59, -2.0, -2.0);
      v51 = v37;
      v37 = objc_msgSend(v38, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_53, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v51, 1), v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
    }
    if (v13 > 0.0)
    {
      id v39 = [(CIProSharpenEdges *)self _CIBlur4];
      [v37 extent];
      CGRect v62 = CGRectInset(v61, -4.0, -4.0);
      v50 = v37;
      v37 = objc_msgSend(v39, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_55, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v50, 1), v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    }
    id v40 = [(CIProSharpenEdges *)self _CISharpenCombineEdges];
    [v37 extent];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    v49[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v8, v12, v13, self->inputImage, v37);
    v49[3] = v29;
    return (id)objc_msgSend(v40, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v49, 4), v42, v44, v46, v48);
  }
  else
  {
    v9 = self->inputImage;
    return v9;
  }
}

double __32__CIProSharpenEdges_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __32__CIProSharpenEdges_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __32__CIProSharpenEdges_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

double __32__CIProSharpenEdges_outputImage__block_invoke_4(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -4.0, -4.0);
  return result;
}

+ (id)customAttributes
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategorySharpen";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v9[4] = @"CICategoryApplePrivate";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  v10[1] = @"inputFalloff";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeMin";
  v8[0] = @"CIAttributeTypeScalar";
  v8[1] = &unk_1EE4A9AA0;
  v7[2] = @"CIAttributeMax";
  v7[3] = @"CIAttributeSliderMin";
  v8[2] = &unk_1EE4A9AF0;
  v8[3] = &unk_1EE4A9AA0;
  v7[4] = @"CIAttributeSliderMax";
  v7[5] = @"CIAttributeDefault";
  v8[4] = &unk_1EE4A9AF0;
  v8[5] = &unk_1EE4A9B00;
  v11[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v10[2] = @"inputSharpness";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeScalar";
  v6[1] = &unk_1EE4A9AA0;
  v5[2] = @"CIAttributeMax";
  v5[3] = @"CIAttributeSliderMin";
  v6[2] = &unk_1EE4A9AB0;
  v6[3] = &unk_1EE4A9AA0;
  v5[4] = @"CIAttributeSliderMax";
  v5[5] = @"CIAttributeDefault";
  v6[4] = &unk_1EE4A9AB0;
  v6[5] = &unk_1EE4A9B10;
  v5[6] = @"CIAttributeIdentity";
  v6[6] = &unk_1EE4A9AA0;
  v11[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v10[3] = @"inputEdgeScale";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A9AA0;
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeSliderMin";
  v4[2] = &unk_1EE4A9B20;
  v4[3] = &unk_1EE4A9AA0;
  v3[4] = @"CIAttributeSliderMax";
  v3[5] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4A9B20;
  v4[5] = &unk_1EE4A9B30;
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
}

@end