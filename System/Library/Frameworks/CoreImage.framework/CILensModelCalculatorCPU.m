@interface CILensModelCalculatorCPU
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CILensModelCalculatorCPU

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3) {
    return 2312;
  }
  else {
    return 0;
  }
}

+ (int)outputFormat
{
  return 2056;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v6 = objc_msgSend(a4, "objectForKeyedSubscript:", @"inputFocusRect", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v7 = 1.0;
  double v8 = 1.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if (!a3 && v6) {
    objc_msgSend(v6, "CGRectValue", 0.0, 0.0, 1.0, 1.0);
  }
  result.size.height = v7;
  result.size.width = v8;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6);
  double v7 = v6;
  double v9 = v8;
  v11 = v10;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v12 = (void *)[v10 objectAtIndexedSubscript:0];
  objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"inputFocusRect"), "CGRectValue");
  double v14 = v13;
  double v51 = v15;
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)[v9 objectForKeyedSubscript:@"inputTuningParameters"];
  bzero(v53, 0x400uLL);
  bzero(v52, 0x4000uLL);
  int v21 = 0;
  int v22 = 0;
  double v23 = v19 * 0.015625;
  double v50 = v19 * 0.015625 * 0.5;
  double v24 = 0.0;
  do
  {
    int v25 = 0;
    double v26 = 0.0;
    do
    {
      v52[v21 + v25] = sampleLinearWithOffset(v12, 0, v17 * 0.015625 * 0.5 + v14 + v17 * 0.015625 * v26, v50 + v51 + v23 * v24);
      double v26 = v26 + 1.0;
      ++v25;
    }
    while (v25 != 64);
    double v24 = v24 + 1.0;
    ++v22;
    v21 += 64;
  }
  while (v22 != 64);
  v27 = (void *)[v11 objectAtIndexedSubscript:1];
  float v28 = sampleLinearWithOffset(v27, 0, 0.0, 0.0);
  float v29 = sampleLinearWithOffset(v27, 1u, 0.0, 0.0);
  BOOL v30 = vabds_f32(v29, v28) < 0.001;
  if (v28 == 1.0) {
    BOOL v30 = 1;
  }
  char v31 = v29 == 1.0 || v30;
  if ((v31 & 1) == 0)
  {
    for (uint64_t i = 0; i != 4096; ++i)
    {
      double v33 = (float)(1.0 / (float)(v29 - v28)) * 255.0 * (float)(v52[i] - v28);
      unsigned int v34 = (int)v33 & ~((int)v33 >> 31);
      if (v34 >= 0xFF) {
        unsigned int v34 = 255;
      }
      ++*(_DWORD *)&v53[4 * v34];
    }
    v35 = (void *)[MEMORY[0x1E4F28E78] string];
    for (uint64_t j = 0; j != 1024; j += 4)
      [v35 appendFormat:@"%d, ", *(unsigned int *)&v53[j]];
    NSLog(&cfstr_Focus.isa, v35);
    SDOFSimpleLensModelValue(@"zeroShiftPercentile", v20);
    int v38 = vcvtmd_s64_f64(v37 * 64.0 * 64.0);
    if (v38 < 1)
    {
      float v42 = 0.0;
    }
    else
    {
      unint64_t v39 = 0;
      for (int k = 0; k < v38; k += *(_DWORD *)&v53[4 * v39++])
      {
        int v41 = v39 + 1;
        if (v39 > 0xFE) {
          break;
        }
      }
      float v42 = (float)v41;
    }
    float v43 = (float)((float)(v29 - v28) * v42) / 255.0 + v28;
    v44 = (float *)[v7 baseAddress];
    float *v44 = v28;
    v44[1] = v43;
    v44[2] = 0.83689;
    v44[3] = v29;
    [v7 region];
    if (v45 != 1.0)
    {
      [v7 region];
      if (v46 > 0.0)
      {
        unsigned int v47 = 0;
        do
        {
          memset_pattern16((void *)([v7 baseAddress] + objc_msgSend(v7, "bytesPerRow") * v47++), v44, objc_msgSend(v7, "bytesPerRow"));
          [v7 region];
        }
        while (v48 > (double)v47);
      }
    }
  }
  return v31 ^ 1;
}

@end