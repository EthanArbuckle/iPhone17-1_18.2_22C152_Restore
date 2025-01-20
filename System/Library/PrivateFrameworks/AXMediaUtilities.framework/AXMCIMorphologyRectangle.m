@interface AXMCIMorphologyRectangle
+ (id)customAttributes;
- (BOOL)_doMinimum;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputHeight;
- (NSNumber)inputWidth;
- (id)outputImage;
- (void)setInputHeight:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation AXMCIMorphologyRectangle

+ (id)customAttributes
{
  v28[5] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v26[0] = *MEMORY[0x1E4F1E178];
  v26[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1E180];
  v26[2] = *MEMORY[0x1E4F1E1B8];
  v26[3] = v3;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  uint64_t v4 = *MEMORY[0x1E4F1E0B0];
  v28[0] = v17;
  v28[1] = @"13";
  uint64_t v5 = *MEMORY[0x1E4F1E0A8];
  v27[1] = v4;
  v27[2] = v5;
  v28[2] = @"10.15";
  v27[3] = *MEMORY[0x1E4F1E518];
  uint64_t v7 = *MEMORY[0x1E4F1E128];
  uint64_t v8 = *MEMORY[0x1E4F1E0D8];
  v20[0] = *MEMORY[0x1E4F1E0F0];
  uint64_t v6 = v20[0];
  v20[1] = v8;
  v25[0] = v7;
  v25[1] = &unk_1F0E93E80;
  uint64_t v10 = *MEMORY[0x1E4F1E0E0];
  uint64_t v21 = *MEMORY[0x1E4F1E0E8];
  uint64_t v9 = v21;
  uint64_t v22 = v10;
  v25[2] = &unk_1F0E93E80;
  v25[3] = &unk_1F0E93E90;
  uint64_t v12 = *MEMORY[0x1E4F1E0C8];
  uint64_t v23 = *MEMORY[0x1E4F1E098];
  uint64_t v11 = v23;
  uint64_t v24 = v12;
  v25[4] = &unk_1F0E93EA0;
  v25[5] = &unk_1F0E93E80;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v20 count:6];
  v28[3] = v13;
  v27[4] = @"inputHeight";
  v18[0] = v6;
  v18[1] = v8;
  v19[0] = v7;
  v19[1] = &unk_1F0E93E80;
  v18[2] = v9;
  v18[3] = v10;
  v19[2] = &unk_1F0E93E80;
  v19[3] = &unk_1F0E93E90;
  v18[4] = v11;
  v18[5] = v12;
  v19[4] = &unk_1F0E93EA0;
  v19[5] = &unk_1F0E93E80;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v28[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];

  return v15;
}

- (BOOL)_isIdentity
{
  return [(NSNumber *)self->inputWidth intValue] <= 2
      && [(NSNumber *)self->inputHeight intValue] < 3;
}

- (BOOL)_doMinimum
{
  return 0;
}

- (id)outputImage
{
  v44[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage)
  {
    uint64_t v4 = 0;
    goto LABEL_28;
  }
  if ([(AXMCIMorphologyRectangle *)self _isIdentity])
  {
    uint64_t v3 = self->inputImage;
LABEL_24:
    uint64_t v4 = v3;
    goto LABEL_28;
  }
  [(NSNumber *)self->inputWidth floatValue];
  signed int v6 = 1;
  if (v5 > 2.0) {
    signed int v6 = (2 * vcvtms_s32_f32(v5 * 0.5)) | 1;
  }
  [(NSNumber *)self->inputHeight floatValue];
  signed int v8 = 1;
  if (v7 > 2.0) {
    signed int v8 = (2 * vcvtms_s32_f32(v7 * 0.5)) | 1;
  }
  if ([(AXMCIMorphologyRectangle *)self _doMinimum])
  {
    [(CIImage *)self->inputImage extent];
    if (v9 <= (double)(v6 - 1) || ([(CIImage *)self->inputImage extent], v10 <= (double)(v8 - 1)))
    {
      uint64_t v3 = [MEMORY[0x1E4F1E050] emptyImage];
      goto LABEL_24;
    }
    uint64_t v4 = self->inputImage;
    if (kernel_morphmin_once != -1) {
      dispatch_once(&kernel_morphmin_once, &__block_literal_global_4);
    }
    int v11 = 1;
    uint64_t v12 = &kernel_morphmin_singleton;
  }
  else
  {
    uint64_t v4 = self->inputImage;
    if (kernel_morphmax_once != -1) {
      dispatch_once(&kernel_morphmax_once, &__block_literal_global_81);
    }
    int v11 = -1;
    uint64_t v12 = &kernel_morphmax_singleton;
  }
  id v13 = (id)*v12;
  if (v8 >= 0) {
    int v14 = v8;
  }
  else {
    int v14 = v8 + 1;
  }
  int v15 = v11 * v8 + (v11 * v8 < 0);
  if (v6 >= 3)
  {
    int v37 = v11 * v8 + (v11 * v8 < 0);
    int v38 = v14;
    int v16 = v11 * v6 / 2;
    uint64_t v17 = v6 >> 1;
    [(CIImage *)v4 extent];
    CGRect v47 = CGRectInset(v46, (double)v16, 0.0);
    double x = v47.origin.x;
    double y = v47.origin.y;
    double width = v47.size.width;
    double height = v47.size.height;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __39__AXMCIMorphologyRectangle_outputImage__block_invoke;
    v41[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    int v42 = v17;
    v44[0] = v4;
    uint64_t v22 = [NSNumber numberWithInt:v17];
    v44[1] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0];
    v44[2] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    uint64_t v25 = objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v41, v24, x, y, width, height);

    int v15 = v37;
    int v14 = v38;
    uint64_t v4 = (CIImage *)v25;
  }
  if (v8 >= 3)
  {
    uint64_t v26 = (v14 >> 1);
    int v27 = v15 >> 1;
    [(CIImage *)v4 extent];
    CGRect v49 = CGRectInset(v48, 0.0, (double)v27);
    double v28 = v49.origin.x;
    double v29 = v49.origin.y;
    double v30 = v49.size.width;
    double v31 = v49.size.height;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __39__AXMCIMorphologyRectangle_outputImage__block_invoke_2;
    v39[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    int v40 = v26;
    v43[0] = v4;
    v32 = [NSNumber numberWithInt:v26];
    v43[1] = v32;
    v33 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0];
    v43[2] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
    uint64_t v35 = objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v39, v34, v28, v29, v30, v31);

    uint64_t v4 = (CIImage *)v35;
  }

LABEL_28:

  return v4;
}

double __39__AXMCIMorphologyRectangle_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (double)-*(_DWORD *)(a1 + 32), 0.0);
  return result;
}

double __39__AXMCIMorphologyRectangle_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 32));
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputHeight, 0);
  objc_storeStrong((id *)&self->inputWidth, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end