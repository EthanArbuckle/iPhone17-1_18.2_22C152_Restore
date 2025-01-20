@interface RAWRadialLensCorrectionRB
+ (id)customAttributes;
- (BOOL)makeMapImages;
- (id)outputImage;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWRadialLensCorrectionRB

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputScales", v9, v10))
  {
    mapImg = self->mapImg;
    self->mapImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWRadialLensCorrectionRB;
  [(RAWRadialLensCorrectionRB *)&v12 setValue:v6 forKey:v7];
}

+ (id)customAttributes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19[0] = xmmword_1DDBFB448;
  v19[1] = unk_1DDBFB458;
  v19[2] = xmmword_1DDBFB468;
  v19[3] = unk_1DDBFB478;
  v3 = objc_msgSend_vectorWithValues_count_(MEMORY[0x1E4F1E080], a2, (uint64_t)v19, 8, v2);
  v17[0] = @"inputScalesR";
  uint64_t v5 = *MEMORY[0x1E4F1E0C8];
  v15[0] = *MEMORY[0x1E4F1E098];
  uint64_t v4 = v15[0];
  v15[1] = v5;
  v16[0] = v3;
  v16[1] = v3;
  id v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v16, (uint64_t)v15, 2);
  v17[1] = @"inputScalesB";
  v18[0] = v7;
  v13[0] = v4;
  v13[1] = v5;
  v14[0] = v3;
  v14[1] = v3;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v14, (uint64_t)v13, 2);
  v18[1] = v9;
  v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v18, (uint64_t)v17, 2);

  return v11;
}

- (BOOL)makeMapImages
{
  if (!self->inputScalesR || !self->inputScalesB || self->mapImg) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = objc_msgSend_count(self->inputScalesR, v4, v5, v6, v7);
      if (v8 == objc_msgSend_count(self->inputScalesB, v9, v10, v11, v12))
      {
        unint64_t v17 = objc_msgSend_count(self->inputScalesR, v13, v14, v15, v16);
        if (v17 > 2)
        {
          unint64_t v21 = v17;
          uint64_t v22 = (4 * v17 + 15) & 0xFFFFFFF0;
          objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v18, v22, v19, v20);
          id v23 = objc_claimAutoreleasedReturnValue();
          v31 = (_WORD *)objc_msgSend_mutableBytes(v23, v24, v25, v26, v27);
          for (uint64_t i = 0; i != v21; ++i)
          {
            objc_msgSend_valueAtIndex_(self->inputScalesR, v28, i, v29, v30);
            *(float *)&_D0 = _D0;
            __asm { FCVT            H0, S0 }
            _WORD *v31 = LOWORD(_D0);
            objc_msgSend_valueAtIndex_(self->inputScalesB, v38, i, v39, v40);
            *(float *)&_D0 = _D0;
            __asm { FCVT            H0, S0 }
            v31[1] = LOWORD(_D0);
            v31 += 2;
          }
          objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_colorSpace_(MEMORY[0x1E4F1E050], v28, (uint64_t)v23, v22, *MEMORY[0x1E4F1E308], 0, (double)v21, 1.0);
          v42 = (CIImage *)objc_claimAutoreleasedReturnValue();
          mapImg = self->mapImg;
          self->mapImg = v42;

          return 1;
        }
        NSLog(&cfstr_Radiallenscorr_4.isa);
      }
      else
      {
        NSLog(&cfstr_Radiallenscorr_3.isa);
      }
    }
    else
    {
      NSLog(&cfstr_Radiallenscorr_2.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Radiallenscorr_1.isa);
  }
  return 0;
}

- (id)outputImage
{
  v99[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (inputImage)
  {
    if (self->inputScalesR || self->inputScalesB)
    {
      uint64_t v4 = sub_1DDA83E7C();
      uint64_t v5 = v4;
      if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DDA14000, v5, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWRadialLensCorrectionRB", (const char *)&unk_1DDC3ACB6, buf, 2u);
      }

      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = sub_1DDAD27D0;
      v97[3] = &unk_1E6D04A58;
      v97[4] = self;
      uint64_t v6 = (void (**)(void))MEMORY[0x1E01C46E0](v97);
      if (objc_msgSend_makeMapImages(self, v7, v8, v9, v10))
      {
        objc_msgSend_extent(self->inputImage, v11, v12, v13, v14);
        double v16 = v15;
        double v18 = v17;
        long double v20 = v19;
        long double v22 = v21;
        v87 = objc_msgSend_kernelWithName_(LCKernels, v23, @"radialLensRB", v24, v25);
        double v26 = hypot(v20, v22);
        uint64_t v31 = objc_msgSend_count(self->inputScalesR, v27, v28, v29, v30);
        uint64_t v36 = objc_msgSend_count(self->inputScalesR, v32, v33, v34, v35);
        v86 = self->inputScalesR;
        v85 = self->inputScalesB;
        v41 = objc_msgSend_imageByClampingToExtent(self->inputImage, v37, v38, v39, v40);
        id v42 = self->inputColorSpace;
        uint64_t v43 = (uint64_t)v42;
        if (v42)
        {
          CFAutorelease(v42);
          uint64_t v47 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v41, v44, v43, v45, v46);

          v41 = (void *)v47;
        }
        double v48 = 2.0 / v26;
        float v49 = (float)(unint64_t)(v36 - 1);
        float v50 = v48;
        float v51 = v16 + v20 * 0.5;
        float v52 = v18 + v22 * 0.5;
        id v88 = v87;
        double v53 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
        double v84 = *MEMORY[0x1E4F1DB10];
        double v54 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
        double v55 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = sub_1DDAD2858;
        v89[3] = &unk_1E6D05318;
        float v93 = v51;
        float v94 = v52;
        float v95 = v50;
        float v96 = v49;
        v56 = v86;
        v90 = v56;
        v57 = v85;
        v91 = v57;
        uint64_t v92 = v31;
        mapImg = self->mapImg;
        v99[0] = v41;
        v99[1] = mapImg;
        v63 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v59, v60, v61, v62, v51, v52, v50, v49);
        v99[2] = v63;
        v66 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v64, (uint64_t)v99, 3, v65);
        v69 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v88, v67, (uint64_t)v89, (uint64_t)v66, v68, v84, v53, v54, v55);

        objc_msgSend_extent(self->inputImage, v70, v71, v72, v73);
        objc_msgSend_imageByCroppingToRect_(v69, v74, v75, v76, v77);
        v78 = (CIImage *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          uint64_t v82 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v78, v79, v43, v80, v81);

          v78 = (CIImage *)v82;
        }
      }
      else
      {
        v78 = 0;
      }
      v6[2](v6);
    }
    else
    {
      v78 = inputImage;
    }
  }
  else
  {
    v78 = 0;
  }

  return v78;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mapImg, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputLDCExecuteFlags, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputScalesB, 0);
  objc_storeStrong((id *)&self->inputScalesR, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end