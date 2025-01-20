@interface CIAreaReductionFilter
- (id)_reduce1X4;
- (id)_reduce2X2;
- (id)_reduce4X1;
- (id)_reduce4X4;
- (id)outputImage;
@end

@implementation CIAreaReductionFilter

- (id)_reduce4X4
{
  return 0;
}

- (id)_reduce2X2
{
  return 0;
}

- (id)_reduce4X1
{
  return 0;
}

- (id)_reduce1X4
{
  return 0;
}

- (id)outputImage
{
  v65[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(CIReductionFilter *)self offsetAndCrop];
  if (v3 && (v4 = v3, [v3 extent], !CGRectIsEmpty(v67)))
  {
    if (-[CIAreaReductionFilter _reduce4X4](self, "_reduce4X4") && ([v4 extent], v6 > 2.0))
    {
      uint64_t v7 = 0;
      while (1)
      {
        [v4 extent];
        if (v8 <= 2.0) {
          break;
        }
        [v4 extent];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        id v17 = [(CIAreaReductionFilter *)self _reduce4X4];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __36__CIAreaReductionFilter_outputImage__block_invoke;
        v60[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        *(double *)&v60[4] = v10;
        *(double *)&v60[5] = v12;
        *(double *)&v60[6] = v14;
        *(double *)&v60[7] = v16;
        v65[0] = v4;
        v65[1] = +[CIVector vectorWithX:v14 Y:v16];
        uint64_t v18 = (v7 + 1);
        v65[2] = [NSNumber numberWithInt:v7];
        v4 = objc_msgSend(v17, "applyWithExtent:roiCallback:arguments:", v60, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v65, 3), v10, v12, ceil(v14 * 0.25), ceil(v16 * 0.25));
        [v4 extent];
        uint64_t v7 = v18;
        if (v19 <= 2.0) {
          goto LABEL_13;
        }
      }
      uint64_t v18 = v7;
    }
    else
    {
      uint64_t v18 = 0;
    }
LABEL_13:
    if ([(CIAreaReductionFilter *)self _reduce2X2])
    {
      [v4 extent];
      if (v20 > 1.0)
      {
        while (1)
        {
          [v4 extent];
          if (v21 <= 1.0) {
            break;
          }
          [v4 extent];
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          id v30 = [(CIAreaReductionFilter *)self _reduce2X2];
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __36__CIAreaReductionFilter_outputImage__block_invoke_2;
          v59[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v59[4] = v23;
          *(double *)&v59[5] = v25;
          *(double *)&v59[6] = v27;
          *(double *)&v59[7] = v29;
          v64[0] = v4;
          v64[1] = +[CIVector vectorWithX:v27 Y:v29];
          uint64_t v31 = (v18 + 1);
          v64[2] = [NSNumber numberWithInt:v18];
          v4 = objc_msgSend(v30, "applyWithExtent:roiCallback:arguments:", v59, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v64, 3), v23, v25, ceil(v27 * 0.5), ceil(v29 * 0.5));
          [v4 extent];
          uint64_t v18 = v31;
          if (v32 <= 1.0) {
            goto LABEL_19;
          }
        }
      }
    }
    uint64_t v31 = v18;
LABEL_19:
    [v4 extent];
    if (v33 <= 1.0)
    {
      uint64_t v43 = v31;
    }
    else
    {
      do
      {
        [v4 extent];
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        id v42 = [(CIAreaReductionFilter *)self _reduce1X4];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __36__CIAreaReductionFilter_outputImage__block_invoke_3;
        v58[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        *(double *)&v58[4] = v35;
        *(double *)&v58[5] = v37;
        *(double *)&v58[6] = v39;
        *(double *)&v58[7] = v41;
        v63[0] = v4;
        v63[1] = [NSNumber numberWithDouble:v41];
        uint64_t v43 = (v31 + 1);
        v63[2] = [NSNumber numberWithInt:v31];
        v4 = objc_msgSend(v42, "applyWithExtent:roiCallback:arguments:", v58, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v63, 3), v35, v37, v39, ceil(v41 * 0.25));
        [v4 extent];
        uint64_t v31 = v43;
      }
      while (v44 > 1.0);
    }
    [v4 extent];
    if (v45 > 1.0)
    {
      do
      {
        [v4 extent];
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        double v53 = v52;
        id v54 = [(CIAreaReductionFilter *)self _reduce4X1];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __36__CIAreaReductionFilter_outputImage__block_invoke_4;
        v57[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        *(double *)&v57[4] = v47;
        *(double *)&v57[5] = v49;
        *(double *)&v57[6] = v51;
        *(double *)&v57[7] = v53;
        v62[0] = v4;
        v62[1] = [NSNumber numberWithDouble:v51];
        v62[2] = [NSNumber numberWithInt:v43];
        v4 = objc_msgSend(v54, "applyWithExtent:roiCallback:arguments:", v57, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v62, 3), v47, v49, ceil(v51 * 0.25), v53);
        [v4 extent];
        uint64_t v43 = (v43 + 1);
      }
      while (v55 > 1.0);
    }
    id v56 = [(CIReductionFilter *)self _reduceCrop];
    v61 = v4;
    return (id)objc_msgSend(v56, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_59, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v61, 1), 0.0, 0.0, 1.0, 1.0);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

void __36__CIAreaReductionFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = *(double *)(a1 + 48);
  float v6 = *(double *)(a1 + 56);
  ReductionROIwh(*(CGRect *)&a2, 4.0, 4.0, v5, v6);
}

float __36__CIAreaReductionFilter_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = *(double *)(a1 + 48);
  float v6 = *(double *)(a1 + 56);
  ReductionROIwh(*(CGRect *)&a2, 2.0, 2.0, v5, v6);
  return result;
}

void __36__CIAreaReductionFilter_outputImage__block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = *(double *)(a1 + 56);
  ReductionROIh(*(CGRect *)&a2, 4.0, v5);
}

void __36__CIAreaReductionFilter_outputImage__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = *(double *)(a1 + 48);
  ReductionROIw(*(CGRect *)&a2, 4.0, v5);
}

@end