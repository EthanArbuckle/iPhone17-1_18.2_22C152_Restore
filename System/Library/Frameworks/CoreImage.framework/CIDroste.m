@interface CIDroste
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CIDroste;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIDroste

- (id)_CIDroste
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_droste];
}

- (id)outputImage
{
  v61[5] = *MEMORY[0x1E4F143B8];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x5012000000;
  v56 = __Block_byref_object_copy__4;
  v57 = __Block_byref_object_dispose__4;
  v58 = "";
  long long v59 = 0u;
  long long v60 = 0u;
  [(CIImage *)self->inputImage extent];
  *(void *)&long long v59 = v3;
  *((void *)&v59 + 1) = v4;
  *(void *)&long long v60 = v5;
  *((void *)&v60 + 1) = v6;
  if (CGRectIsEmpty(*(CGRect *)(v54 + 6)) || CGRectIsInfinite(*(CGRect *)(v54 + 6)))
  {
    v7 = 0;
  }
  else
  {
    [(NSNumber *)self->inputZoom doubleValue];
    [(CIVector *)self->inputInsetPoint0 X];
    double v9 = v8;
    [(CIVector *)self->inputInsetPoint1 X];
    double v11 = v10;
    [(CIVector *)self->inputInsetPoint0 X];
    double v13 = v12;
    [(CIVector *)self->inputInsetPoint1 X];
    double v15 = v14;
    [(CIVector *)self->inputInsetPoint0 Y];
    double v17 = v16;
    [(CIVector *)self->inputInsetPoint1 Y];
    double v19 = v18;
    [(CIVector *)self->inputInsetPoint0 Y];
    double v21 = v20;
    [(CIVector *)self->inputInsetPoint1 Y];
    double v50 = v22;
    double v49 = v21;
    double MinX = CGRectGetMinX(*(CGRect *)(v54 + 6));
    double v23 = v19;
    double MaxX = CGRectGetMaxX(*(CGRect *)(v54 + 6));
    double v24 = v17;
    double MinY = CGRectGetMinY(*(CGRect *)(v54 + 6));
    double MaxY = CGRectGetMaxY(*(CGRect *)(v54 + 6));
    [(NSNumber *)self->inputStrands floatValue];
    float v45 = v26;
    [(NSNumber *)self->inputPeriodicity floatValue];
    float v44 = v27;
    double v28 = fmin(v9, v11);
    double v29 = fmax(v13, v15);
    double v30 = fmin(v24, v23);
    double v31 = fmax(v49, v50);
    double v32 = v29 - v28;
    double v33 = v31 - v30;
    double v34 = v28 + (v29 - v28) * 0.5;
    double v35 = v30 + (v31 - v30) * 0.5;
    double v36 = log(fmin((v35 - MinY) / (v35 - v30), fmin((v34 - MinX) / (v34 - v28), fmin((MaxY - v35) / (v31 - v35), (MaxX - v34) / (v29 - v34)))));
    id v37 = [(CIDroste *)self _CIDroste];
    double v38 = *MEMORY[0x1E4F1DB10];
    double v51 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v40 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v39 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __23__CIDroste_outputImage__block_invoke;
    v52[3] = &unk_1E5771720;
    v52[4] = &v53;
    inputImage = self->inputImage;
    v61[0] = +[CIVector vectorWithX:v34 Y:v35];
    v61[1] = +[CIVector vectorWithX:(double)(int)llroundf(fmaxf(v45, 1.0)) Y:v36 * (double)(int)llroundf(v44) / 6.28318531];
    *(float *)&double v42 = v36;
    v61[2] = [NSNumber numberWithFloat:v42];
    [(NSNumber *)self->inputRotation doubleValue];
    v61[3] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:");
    v61[4] = +[CIVector vectorWithX:v32 * 0.5 Y:v33 * 0.5];
    v7 = objc_msgSend(v37, "applyWithExtent:roiCallback:inputImage:arguments:", v52, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v61, 5), v38, v51, v40, v39);
  }
  _Block_object_dispose(&v53, 8);
  return v7;
}

double __23__CIDroste_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
}

+ (id)customAttributes
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v16[0] = @"CIAttributeFilterCategories";
  v15[0] = @"CICategoryDistortionEffect";
  v15[1] = @"CICategoryVideo";
  v15[2] = @"CICategoryStillImage";
  v15[3] = @"CICategoryBuiltIn";
  v17[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v17[1] = @"9";
  v16[1] = @"CIAttributeFilterAvailable_iOS";
  v16[2] = @"CIAttributeFilterAvailable_Mac";
  v17[2] = @"10.6";
  v16[3] = @"inputInsetPoint0";
  v13[0] = @"CIAttributeType";
  v13[1] = @"CIAttributeDefault";
  v14[0] = @"CIAttributeTypePosition";
  v14[1] = +[CIVector vectorWithX:200.0 Y:200.0];
  v17[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[4] = @"inputInsetPoint1";
  v11[1] = @"CIAttributeDefault";
  v12[0] = @"CIAttributeTypePosition";
  v11[0] = @"CIAttributeType";
  v12[1] = +[CIVector vectorWithX:400.0 Y:400.0];
  v17[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[5] = @"inputPeriodicity";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeMin";
  v10[0] = @"CIAttributeTypeScalar";
  v10[1] = &unk_1EE4A8640;
  v9[2] = @"CIAttributeSliderMin";
  v9[3] = @"CIAttributeSliderMax";
  v10[2] = &unk_1EE4A8640;
  v10[3] = &unk_1EE4A8650;
  v9[4] = @"CIAttributeDefault";
  v10[4] = &unk_1EE4A8640;
  v17[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v16[6] = @"inputStrands";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeMin";
  v8[0] = @"CIAttributeTypeScalar";
  v8[1] = &unk_1EE4A8660;
  v8[2] = &unk_1EE4A8670;
  v8[3] = &unk_1EE4A8680;
  v7[2] = @"CIAttributeMax";
  v7[3] = @"CIAttributeSliderMin";
  v7[4] = @"CIAttributeSliderMax";
  v7[5] = @"CIAttributeDefault";
  v8[4] = &unk_1EE4A8690;
  v8[5] = &unk_1EE4A8640;
  v17[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v16[7] = @"inputRotation";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = @"CIAttributeTypeAngle";
  v6[1] = &unk_1EE4A86A0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A86B0;
  v6[3] = &unk_1EE4A86A0;
  v17[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v16[8] = @"inputZoom";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A86C0;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A86C0;
  v4[3] = &unk_1EE4A8650;
  v3[4] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4A8640;
  v17[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:9];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end