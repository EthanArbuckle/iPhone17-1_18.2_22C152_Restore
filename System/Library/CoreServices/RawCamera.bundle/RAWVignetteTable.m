@interface RAWVignetteTable
- (BOOL)makeMapImages;
- (id)outputImage;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWVignetteTable

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputVignetteTableData", v9, v10))
  {
    vigImg = self->vigImg;
    self->vigImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWVignetteTable;
  [(RAWVignetteTable *)&v12 setValue:v6 forKey:v7];
}

- (BOOL)makeMapImages
{
  v49[3] = *MEMORY[0x1E4F143B8];
  if (!self->vigImg)
  {
    int v6 = objc_msgSend_intValue(self->inputVignetteTableDataSize, a2, v2, v3, v4);
    if (v6 < 1) {
      return 0;
    }
    int v10 = v6;
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v7, ((8 * v6) & 0x7FFFFFFF0) + 16, v8, v9);
    id v42 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_mutableBytes(v42, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_bytes(self->inputVignetteTableData, v16, v17, v18, v19);
    uint64_t v21 = 0;
    int64x2_t v43 = vdupq_n_s64(1uLL);
    do
    {
      __int16 v47 = 0;
      int v46 = *(_DWORD *)(v20 + v21);
      dest.rowBytes = 2;
      src.data = &v46;
      *(int64x2_t *)&src.height = v43;
      src.rowBytes = 4;
      dest.data = &v47;
      *(int64x2_t *)&dest.height = v43;
      vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
      v26.i16[1] = 15360;
      v26.i32[1] = 1006648320;
      v26.i16[0] = v47;
      int16x4_t v27 = vzip1_s16(v26, v26);
      v27.i16[2] = v47;
      *(int16x4_t *)(v15 + 2 * (v21 & 0xFFFFFFFC)) = v27;
      v21 += 4;
    }
    while (4 * v10 != v21);
    v28 = (void *)MEMORY[0x1E4F1E050];
    uint64_t v29 = objc_msgSend_length(v42, v22, v23, v24, v25);
    uint64_t v30 = *MEMORY[0x1E4F1E328];
    v48[0] = *MEMORY[0x1E4F1E388];
    v48[1] = v30;
    v49[0] = MEMORY[0x1E4F1CC38];
    v49[1] = MEMORY[0x1E4F1CC38];
    v48[2] = *MEMORY[0x1E4F1E390];
    v35 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v31, v32, v33, v34);
    v49[2] = v35;
    v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v49, (uint64_t)v48, 3);
    objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_options_(v28, v38, (uint64_t)v42, v29, *MEMORY[0x1E4F1E300], v37, (double)v10, 1.0);
    v39 = (CIImage *)objc_claimAutoreleasedReturnValue();
    vigImg = self->vigImg;
    self->vigImg = v39;
  }
  return 1;
}

- (id)outputImage
{
  v68[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    goto LABEL_16;
  }
  objc_msgSend_extent(inputImage, a2, v2, v3, v4);
  double x = v70.origin.x;
  double y = v70.origin.y;
  double width = v70.size.width;
  double height = v70.size.height;
  if (CGRectIsInfinite(v70))
  {
    NSLog(&cfstr_Rawvignettetab_0.isa);
LABEL_4:
    uint64_t v15 = self->inputImage;
    goto LABEL_17;
  }
  if ((int)objc_msgSend_intValue(self->inputVignetteTableDataSize, v11, v12, v13, v14) >= 1
    && objc_msgSend_makeMapImages(self, v16, v17, v18, v19))
  {
    if (!self->vigImg) {
      goto LABEL_4;
    }
    uint64_t v20 = sub_1DDA83E7C();
    uint64_t v21 = v20;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v21, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWVignetteTable", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = sub_1DDA377CC;
    v66[3] = &unk_1E6D04A58;
    v66[4] = self;
    v22 = (void (**)(void))MEMORY[0x1E01C46E0](v66);
    int v27 = objc_msgSend_intValue(self->inputVignetteTableDataSize, v23, v24, v25, v26);
    long double v28 = hypot(width * 0.5, height * 0.5);
    uint64_t v33 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v29, v30, v31, v32, x + width * 0.5, y + height * 0.5, (double)((float)((float)v27 + -1.0) / v28), 0.5);
    uint64_t v34 = self->inputImage;
    id v38 = self->inputColorSpace;
    if (v38)
    {
      uint64_t v39 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v34, v35, (uint64_t)v38, v36, v37);

      uint64_t v34 = (CIImage *)v39;
    }
    v40 = objc_msgSend_kernelWithName_(GainMapKernels, v35, @"vignetteCorrectionTable", v36, v37);
    objc_msgSend_extent(v34, v41, v42, v43, v44);
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = sub_1DDA37854;
    v64[3] = &unk_1E6D04BA8;
    vigImg = self->vigImg;
    LODWORD(v65) = v27;
    v68[0] = v34;
    v68[1] = vigImg;
    v68[2] = v33;
    v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v54, (uint64_t)v68, 3, v55, MEMORY[0x1E4F143A8], 3221225472, sub_1DDA37854, &unk_1E6D04BA8, v65);
    objc_msgSend_applyWithExtent_roiCallback_arguments_(v40, v57, (uint64_t)v64, (uint64_t)v56, v58, v46, v48, v50, v52);
    uint64_t v15 = (CIImage *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      uint64_t v62 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v15, v59, (uint64_t)v38, v60, v61);

      uint64_t v15 = (CIImage *)v62;
    }

    v22[2](v22);
  }
  else
  {
LABEL_16:
    uint64_t v15 = 0;
  }
LABEL_17:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vigImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVignetteTableDataSize, 0);
  objc_storeStrong((id *)&self->inputVignetteTableData, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end