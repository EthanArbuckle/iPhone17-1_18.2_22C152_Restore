@interface CICMYKHalftone
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputGCR;
- (NSNumber)inputSharpness;
- (NSNumber)inputUCR;
- (NSNumber)inputWidth;
- (id)_CICMYK_black;
- (id)_CICMYK_convert;
- (id)_CICMYK_cyan;
- (id)_CICMYK_magenta;
- (id)_CICMYK_yellow;
- (id)_CIWhite;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputGCR:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSharpness:(id)a3;
- (void)setInputUCR:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CICMYKHalftone

- (id)_CIWhite
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_white];
}

- (id)_CICMYK_convert
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cmyk_convert];
}

- (id)_CICMYK_cyan
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cmyk_cyan];
}

- (id)_CICMYK_magenta
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cmyk_magenta];
}

- (id)_CICMYK_yellow
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cmyk_yellow];
}

- (id)_CICMYK_black
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_cmyk_black];
}

- (id)outputImage
{
  v89[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = 1.0 / v3;
  [(NSNumber *)self->inputAngle floatValue];
  float v6 = v5 + 1.30899694;
  [(NSNumber *)self->inputAngle floatValue];
  float v8 = v7 + 0.261799388;
  float v79 = v8;
  [(NSNumber *)self->inputAngle floatValue];
  float v81 = v9 + 0.0;
  [(NSNumber *)self->inputAngle floatValue];
  float v11 = v10 + 0.785398163;
  float v82 = v11;
  [(NSNumber *)self->inputSharpness floatValue];
  double v83 = fmin(1.0 / (1.0 - v12), 10000.0);
  id v13 = [(CICMYKHalftone *)self _CICMYK_convert];
  [(CIImage *)self->inputImage extent];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v89[0] = self->inputImage;
  [(NSNumber *)self->inputUCR floatValue];
  double v23 = v22;
  [(NSNumber *)self->inputGCR floatValue];
  v89[1] = +[CIVector vectorWithX:v23 Y:v24];
  uint64_t v25 = objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v89, 2), v15, v17, v19, v21);
  id v26 = [(CICMYKHalftone *)self _CIWhite];
  [(CIImage *)self->inputImage extent];
  inputImage = self->inputImage;
  v31 = objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &inputImage, 1), v27, v28, v29, v30);
  __float2 v32 = __sincosf_stret(v6);
  id v33 = [(CICMYKHalftone *)self _CICMYK_cyan];
  [v31 extent];
  double v78 = v34;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  inputCenter = self->inputCenter;
  v87[0] = v31;
  v87[1] = v25;
  v87[2] = inputCenter;
  v87[3] = +[CIVector vectorWithX:(float)(v4 * v32.__cosval) Y:(float)(v4 * v32.__sinval) Z:(float)-(float)(v32.__sinval * v4) W:(float)(v4 * v32.__cosval)];
  v87[4] = [NSNumber numberWithDouble:v83];
  v42 = objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v87, 5), v78, v36, v38, v40);
  __float2 v43 = __sincosf_stret(v79);
  id v44 = [(CICMYKHalftone *)self _CICMYK_magenta];
  [v42 extent];
  double v80 = v45;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v52 = self->inputCenter;
  v86[0] = v42;
  v86[1] = v25;
  v86[2] = v52;
  v86[3] = +[CIVector vectorWithX:(float)(v4 * v43.__cosval) Y:(float)(v4 * v43.__sinval) Z:(float)-(float)(v43.__sinval * v4) W:(float)(v4 * v43.__cosval)];
  v86[4] = [NSNumber numberWithDouble:v83];
  v53 = objc_msgSend(v44, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v86, 5), v80, v47, v49, v51);
  __float2 v54 = __sincosf_stret(v81);
  id v55 = [(CICMYKHalftone *)self _CICMYK_yellow];
  [v53 extent];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  v64 = self->inputCenter;
  v85[0] = v53;
  v85[1] = v25;
  v85[2] = v64;
  v85[3] = +[CIVector vectorWithX:(float)(v4 * v54.__cosval) Y:(float)(v4 * v54.__sinval) Z:(float)-(float)(v54.__sinval * v4) W:(float)(v4 * v54.__cosval)];
  v85[4] = [NSNumber numberWithDouble:v83];
  v65 = objc_msgSend(v55, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v85, 5), v57, v59, v61, v63);
  __float2 v66 = __sincosf_stret(v82);
  id v67 = [(CICMYKHalftone *)self _CICMYK_black];
  [v65 extent];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v76 = self->inputCenter;
  v84[0] = v65;
  v84[1] = v25;
  v84[2] = v76;
  v84[3] = +[CIVector vectorWithX:(float)(v4 * v66.__cosval) Y:(float)(v4 * v66.__sinval) Z:(float)-(float)(v66.__sinval * v4) W:(float)(v4 * v66.__cosval)];
  v84[4] = [NSNumber numberWithDouble:v83];
  return (id)objc_msgSend(v67, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v84, 5), v69, v71, v73, v75);
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryHalftoneEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"9";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.4";
  v12[3] = @"inputWidth";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A7DF0;
  v10[1] = &unk_1EE4A7E00;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeDefault";
  v10[2] = &unk_1EE4A7E10;
  v10[3] = &unk_1EE4A7E20;
  v9[4] = @"CIAttributeIdentity";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A7E20;
  v10[5] = @"CIAttributeTypeDistance";
  v9[6] = @"CIUIParameterSet";
  v10[6] = @"CIUISetBasic";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  v12[4] = @"inputSharpness";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A7E30;
  v8[1] = &unk_1EE4A7E30;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A7E40;
  v8[3] = &unk_1EE4A7E50;
  v7[4] = @"CIAttributeType";
  v7[5] = @"CIUIParameterSet";
  v8[4] = @"CIAttributeTypeDistance";
  v8[5] = @"CIUISetBasic";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputGCR";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7E30;
  v6[1] = &unk_1EE4A7E30;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7E40;
  v6[3] = &unk_1EE4A7E40;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7E40;
  v6[5] = @"CIAttributeTypeScalar";
  v5[6] = @"CIUIParameterSet";
  v6[6] = @"CIUISetIntermediate";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v12[6] = @"inputUCR";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7E30;
  v4[1] = &unk_1EE4A7E30;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7E40;
  v4[3] = &unk_1EE4A7E60;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7E60;
  v4[5] = @"CIAttributeTypeScalar";
  v3[6] = @"CIUIParameterSet";
  v4[6] = @"CIUISetIntermediate";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
}

- (NSNumber)inputGCR
{
  return self->inputGCR;
}

- (void)setInputGCR:(id)a3
{
}

- (NSNumber)inputUCR
{
  return self->inputUCR;
}

- (void)setInputUCR:(id)a3
{
}

@end