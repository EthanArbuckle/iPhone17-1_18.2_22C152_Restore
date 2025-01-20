@interface CIAreaAverage
- (id)outputImage;
- (id)outputImageNonMPS:(id)a3;
@end

@implementation CIAreaAverage

- (id)outputImageNonMPS:(id)a3
{
  v77[1] = *MEMORY[0x1E4F143B8];
  if (a3 && (v3 = (CIImage *)a3, [a3 extent], !CGRectIsEmpty(v79)))
  {
    [(CIImage *)v3 extent];
    double v65 = v5;
    [(CIImage *)v3 extent];
    double v66 = v6;
    [(CIImage *)v3 extent];
    double v7 = 1.0;
    if (CGRectGetMaxX(v80) > 4.0)
    {
      do
      {
        [(CIImage *)v3 extent];
        if (CGRectGetMaxY(v81) <= 4.0) {
          break;
        }
        double v7 = v7 * 64.0;
        v8 = +[CIKernel kernelWithInternalRepresentation:&CI::_areaAvg8];
        [(CIImage *)v3 extent];
        v77[0] = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v8, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_76_1, [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1], v11, v12, ceil(v9 * 0.125), ceil(v10 * 0.125));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v82) > 4.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxX(v83) > 2.0)
    {
      do
      {
        [(CIImage *)v3 extent];
        if (CGRectGetMaxY(v84) <= 2.0) {
          break;
        }
        double v7 = v7 * 16.0;
        v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_areaAvg4];
        [(CIImage *)v3 extent];
        v76 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v13, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_78, [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1], v16, v17, ceil(v14 * 0.25), ceil(v15 * 0.25));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v85) > 2.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxX(v86) > 1.0)
    {
      do
      {
        [(CIImage *)v3 extent];
        if (CGRectGetMaxY(v87) <= 1.0) {
          break;
        }
        double v7 = v7 * 4.0;
        v18 = +[CIKernel kernelWithInternalRepresentation:&CI::_areaAvg2];
        [(CIImage *)v3 extent];
        v75 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v18, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_80_0, [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1], v21, v22, ceil(v19 * 0.5), ceil(v20 * 0.5));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v88) > 1.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxY(v89) >= 16.0)
    {
      double v23 = v65;
      do
      {
        double v7 = v7 * 16.0;
        v24 = +[CIKernel kernelWithInternalRepresentation:&CI::_vertAvg16];
        [(CIImage *)v3 extent];
        v74 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v24, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_82_1, [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1], v26, v27, v28, ceil(v25 * 0.0625));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxY(v90) >= 16.0);
    }
    else
    {
      double v23 = v65;
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxY(v91) >= 8.0)
    {
      do
      {
        double v7 = v7 * 8.0;
        v29 = +[CIKernel kernelWithInternalRepresentation:&CI::_vertAvg8];
        [(CIImage *)v3 extent];
        v73 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v29, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_84_1, [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1], v31, v32, v33, ceil(v30 * 0.125));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxY(v92) >= 8.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxY(v93) >= 4.0)
    {
      do
      {
        double v7 = v7 * 4.0;
        v34 = +[CIKernel kernelWithInternalRepresentation:&CI::_vertAvg4];
        [(CIImage *)v3 extent];
        v72 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v34, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_86, [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1], v36, v37, v38, ceil(v35 * 0.25));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxY(v94) >= 4.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxY(v95) > 1.0)
    {
      do
      {
        double v7 = v7 + v7;
        v39 = +[CIKernel kernelWithInternalRepresentation:&CI::_vertAvg2];
        [(CIImage *)v3 extent];
        v71 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v39, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_88, [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1], v41, v42, v43, ceil(v40 * 0.5));
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxY(v96) > 1.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxX(v97) >= 16.0)
    {
      do
      {
        double v7 = v7 * 16.0;
        v44 = +[CIKernel kernelWithInternalRepresentation:&CI::_horizAvg16];
        [(CIImage *)v3 extent];
        v70 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v44, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_90_1, [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1], v46, v47, ceil(v45 * 0.0625), v48);
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v98) >= 16.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxX(v99) >= 8.0)
    {
      do
      {
        double v7 = v7 * 8.0;
        v49 = +[CIKernel kernelWithInternalRepresentation:&CI::_horizAvg8];
        [(CIImage *)v3 extent];
        v69 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v49, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_92_0, [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1], v51, v52, ceil(v50 * 0.125), v53);
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v100) >= 8.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxX(v101) >= 4.0)
    {
      do
      {
        double v7 = v7 * 4.0;
        v54 = +[CIKernel kernelWithInternalRepresentation:&CI::_horizAvg4];
        [(CIImage *)v3 extent];
        v68 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v54, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_94, [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1], v56, v57, ceil(v55 * 0.25), v58);
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v102) >= 4.0);
    }
    [(CIImage *)v3 extent];
    if (CGRectGetMaxX(v103) > 1.0)
    {
      do
      {
        double v7 = v7 + v7;
        v59 = +[CIKernel kernelWithInternalRepresentation:&CI::_horizAvg2];
        [(CIImage *)v3 extent];
        v67 = v3;
        v3 = -[CIKernel applyWithExtent:roiCallback:arguments:](v59, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_96, [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1], v61, v62, ceil(v60 * 0.5), v63);
        [(CIImage *)v3 extent];
      }
      while (CGRectGetMaxX(v104) > 1.0);
    }
    double v64 = v7 / (v23 * v66);
    if (v64 != 1.0) {
      return [(CIImage *)v3 filteredImage:@"CIColorMatrix", @"inputRVector", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0), @"inputGVector", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0), @"inputBVector", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0), @"inputAVector", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v64), @"inputBiasVector", +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0], 0 keysAndValues];
    }
    return v3;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_2(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_3(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_4(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_5(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_6(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_7(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_8(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_9(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_10(double a1, double a2, double a3, double a4)
{
}

void __35__CIAreaAverage_outputImageNonMPS___block_invoke_11(double a1, double a2, double a3, double a4)
{
}

- (id)outputImage
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CIReductionFilter *)self offsetAndCrop];
  if (v3 && (v4 = v3, [v3 extent], !CGRectIsEmpty(v23)))
  {
    [v4 extent];
    if (v6 != 1.0 || ([v4 extent], v7 != 1.0))
    {
      id v8 = [(CIAreaAverage *)self outputImageNonMPS:v4];
      if (!CI_ENABLE_MPS()) {
        return v8;
      }
      [v4 extent];
      double v12 = v11;
      double v14 = v13;
      *(float *)&double v11 = v9;
      *(float *)&double v13 = v10;
      if (fmaxf(*(float *)&v11, *(float *)&v13) > 4096.0) {
        return v8;
      }
      double v15 = v9;
      double v16 = v10;
      v21[0] = v4;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      double v20 = +[CIVector vectorWithCGRect:v12, v14, v15, v16, @"region"];
      v18 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIAreaAverageProcessor, "applyWithExtent:inputs:arguments:error:", v17, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1], 0, 0.0, 0.0, 1.0, 1.0);
      if (v18) {
        return +[CIImage imageForRenderingWithMPS:v18 orNonMPS:v8];
      }
      else {
        return v8;
      }
    }
    return v4;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

@end