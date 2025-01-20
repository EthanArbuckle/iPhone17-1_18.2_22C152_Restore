@interface CIOpTile
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_CIOpTile;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIOpTile

- (id)_CIOpTile
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_opTile];
}

- (id)outputImage
{
  v21[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputScale floatValue];
  float v6 = 1.0 / v5;
  [(NSNumber *)self->inputAngle floatValue];
  __float2 v8 = __sincosf_stret(v7);
  v9 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v6 * v8.__cosval), (float)(v6 * v8.__sinval), (float)-(float)(v8.__sinval * v6));
  v10 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0 / v4);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", self->inputCenter, v10, v9, 0);
  id v12 = [(CIOpTile *)self _CIOpTile];
  double v13 = *MEMORY[0x1E4F1DB10];
  double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __23__CIOpTile_outputImage__block_invoke;
  v20[3] = &unk_1E57716D0;
  inputImage = self->inputImage;
  inputCenter = self->inputCenter;
  v20[4] = v11;
  v21[0] = inputImage;
  v21[1] = inputCenter;
  v21[2] = v10;
  v21[3] = v9;
  return (id)objc_msgSend(v12, "applyWithExtent:roiCallback:arguments:", v20, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 4), v13, v14, v15, v16);
}

double __23__CIOpTile_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v9 = *(void **)(a1 + 32);
  v10 = (void *)[v9 objectAtIndex:0];
  uint64_t v11 = (void *)[v9 objectAtIndex:1];
  id v12 = (void *)[v9 objectAtIndex:2];
  double v13 = a3 + a5;
  double v14 = a2 + a4;
  [v10 X];
  float v16 = v15;
  [v10 Y];
  *(float *)&double v17 = v17;
  double v18 = v16;
  double v19 = a2 - v16;
  double v20 = *(float *)&v17;
  double v21 = a3 - *(float *)&v17;
  double v22 = v13 - *(float *)&v17;
  [v11 X];
  *(float *)&double v13 = v23;
  [v11 Y];
  *(float *)&double v24 = v24;
  double v25 = *(float *)&v13;
  double v26 = floor(v19 * *(float *)&v13);
  CGFloat v27 = *(float *)&v24;
  double v28 = v26 * *(float *)&v24;
  double v29 = floor(v21 * v25) * *(float *)&v24;
  double v63 = floor(v22 * v25) * *(float *)&v24;
  double v30 = floor((v14 - v18) * v25) * *(float *)&v24;
  [v12 X];
  *(float *)&double v31 = v31;
  float v62 = *(float *)&v31;
  [v12 Y];
  float v33 = v32;
  [v12 Z];
  *(float *)&double v22 = v34;
  [v12 W];
  *(float *)&double v35 = v35;
  double v36 = v29 * v33;
  double v37 = v36 + v28 * v62;
  double v38 = *(float *)&v35;
  double v39 = v29 * v38;
  double v40 = v29 * v38 + v28 * *(float *)&v22;
  double v41 = v63 * v33;
  double v42 = v41 + v28 * v62;
  double v43 = v63 * v38;
  double v44 = v43 + v28 * *(float *)&v22;
  double v45 = v41 + v30 * v62;
  double v46 = v43 + v30 * *(float *)&v22;
  double v47 = v36 + v30 * v62;
  double v48 = v39 + v30 * *(float *)&v22;
  double v49 = v37 + v18;
  double v50 = v40 + v20;
  CGFloat v51 = v42 + v18;
  CGFloat v52 = v44 + v20;
  v65.origin.CGFloat x = v45 + v18;
  v65.origin.CGFloat y = v46 + v20;
  v68.origin.CGFloat x = v47 + v18;
  v68.origin.CGFloat y = v48 + v20;
  v65.size.CGFloat width = v27;
  v65.size.CGFloat height = v27;
  v68.size.CGFloat width = v27;
  v68.size.CGFloat height = v27;
  CGRect v69 = CGRectUnion(v65, v68);
  v66.origin.CGFloat x = v51;
  v66.origin.CGFloat y = v52;
  v66.size.CGFloat width = v27;
  v66.size.CGFloat height = v27;
  CGRect v67 = CGRectUnion(v66, v69);
  CGFloat x = v67.origin.x;
  CGFloat y = v67.origin.y;
  CGFloat width = v67.size.width;
  CGFloat height = v67.size.height;
  double v57 = v49;
  double v58 = v50;
  CGFloat v59 = v27;
  CGFloat v60 = v27;

  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v57, *(CGRect *)&x);
  return result;
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryTileEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"9";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputWidth";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A94F0;
  v6[1] = &unk_1EE4A9500;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9510;
  v6[3] = &unk_1EE4A9520;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9520;
  v6[5] = @"CIAttributeTypeDistance";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A94F0;
  v4[1] = &unk_1EE4A9530;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9540;
  v4[3] = &unk_1EE4A9550;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9500;
  v4[5] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end