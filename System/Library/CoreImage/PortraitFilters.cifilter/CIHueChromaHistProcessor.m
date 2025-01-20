@interface CIHueChromaHistProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIHueChromaHistProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v9 = objc_msgSend(a3, "objectAtIndex:", 0, a4, a5, a6);
  if (v9)
  {
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"chromaMin"), "floatValue");
    float v11 = v10;
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"hueRange"), "floatValue");
    float v13 = v12;
    double v14 = *((float *)objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 1), "baseAddress") + 2);
    v15 = (char *)[v9 baseAddress];
    v16 = (char *)[v9 bytesPerRow];
    [v9 region];
    CGRect v82 = CGRectIntegral(v81);
    unint64_t height = (unint64_t)v82.size.height;
    unint64_t width = (unint64_t)v82.size.width;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    double v19 = v11 * 255.0;
    if (v14 < 0.1) {
      double v19 = 0.0;
    }
    unint64_t v20 = vcvtad_u64_f64(v19);
    if ((int)height < 1) {
      goto LABEL_14;
    }
    uint64_t v21 = 0;
    v22 = (unsigned __int8 *)(v15 + 1);
    char v23 = 1;
    do
    {
      v24 = v22;
      uint64_t v25 = (unint64_t)v82.size.width;
      if ((int)width >= 1)
      {
        do
        {
          unsigned int v26 = *v24;
          unint64_t v27 = *(v24 - 1);
          if (v27 > v20)
          {
            char v23 = 0;
            signed int v28 = vcvtmd_s64_f64((double)v26 * 0.125);
            *((float *)&v72 + v28) = *((float *)&v72 + v28) + 1.0;
          }
          if (v27 >= v20)
          {
            signed int v29 = vcvtmd_s64_f64((double)v26 * 0.125);
            *((float *)&v64 + v29) = *((float *)&v64 + v29) + 1.0;
          }
          v24 += 4;
          --v25;
        }
        while (v25);
      }
      ++v21;
      v22 = (unsigned __int8 *)&v16[(void)v22];
    }
    while (v21 != (unint64_t)v82.size.height);
    if (v23)
    {
LABEL_14:
      int v30 = 0;
      long long v76 = v68;
      long long v77 = v69;
      long long v78 = v70;
      long long v79 = v71;
      long long v72 = v64;
      long long v73 = v65;
      long long v74 = v66;
      long long v75 = v67;
    }
    else
    {
      int v30 = 1;
    }
    unint64_t v31 = 0;
    float v32 = 0.0;
    float v33 = 0.0;
    do
    {
      if (*((float *)&v72 + v31) > v32)
      {
        float v33 = (float)v31;
        float v32 = *((float *)&v72 + v31);
      }
      ++v31;
    }
    while (v31 != 32);
    if (v14 >= 0.1) {
      double v34 = v13 * 3.14159265 / 180.0;
    }
    else {
      double v34 = 0.523598776;
    }
    bzero(v63, 0xC00uLL);
    if ((int)height < 1)
    {
      unint64_t v37 = 0;
    }
    else
    {
      uint64_t v36 = 0;
      unint64_t v37 = 0;
      float v38 = v34;
      float v39 = ((float)(v33 / 31.0) + (float)(v33 / 31.0)) * 3.14159265 + -3.14159265;
      double v40 = v39;
      double v41 = (float)(v38 * 0.5);
      double v42 = v41 + -3.14159265;
      double v43 = 3.14159265 - v41;
      v44 = v15 + 1;
      do
      {
        v45 = v44;
        uint64_t v46 = width;
        if ((int)width >= 1)
        {
          do
          {
            LOBYTE(v35) = *v45;
            float v35 = (float)LODWORD(v35);
            float v47 = ((float)(v35 * 0.0039216) + (float)(v35 * 0.0039216)) * 3.14159265 + -3.14159265;
            double v48 = v47;
            if ((v42 <= v40 || v43 >= v48) && (v43 >= v40 || v42 <= v48)) {
              float v49 = v39 - v47;
            }
            else {
              float v49 = v39 + v47;
            }
            unint64_t v50 = *(v45 - 1);
            float v51 = fabsf(v49);
            if (v51 < v38) {
              int v52 = v30;
            }
            else {
              int v52 = 0;
            }
            BOOL v53 = v52 == 1 && v50 > v20;
            if (v53 || (v51 > v38 ? (char v54 = 1) : (char v54 = v30), (v54 & 1) == 0 && v50 >= v20))
            {
              v55 = (float *)&v63[12 * v45[1]];
              float v56 = v55[1];
              float *v55 = *v55 + 1.0;
              v55[1] = v56 + (float)(v35 * 0.0039216);
              float v35 = v55[2] + (float)((float)v50 * 0.0039216);
              v55[2] = v35;
              ++v37;
            }
            v45 += 4;
            --v46;
          }
          while (v46);
        }
        ++v36;
        v44 = &v16[(void)v44];
      }
      while (v36 != height);
    }
    v57 = (float *)[a5 baseAddress];
    [a5 bytesPerRow];
    uint64_t v58 = 0;
    *(float *)v59.i32 = (float)v37;
    int32x4_t v60 = vdupq_lane_s32(v59, 0);
    do
    {
      v61 = (const float *)&v63[v58];
      float32x4x3_t v80 = vld3q_f32(v61);
      vst4q_f32(v57, *(float32x4x4_t *)(&v60 - 3));
      v57 += 16;
      v58 += 48;
    }
    while (v58 != 3072);
  }
  return v9 != 0;
}

+ (int)outputFormat
{
  return kCIFormatRGBAf;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      sub_4BDB4();
    }
    v3 = &kCIFormatRGBAf;
  }
  else
  {
    v3 = &kCIFormatBGRA8;
  }
  return *v3;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (!objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))sub_4BDE0(); {
  if ((unint64_t)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents"), "count") <= a3)
  }
    sub_4BE0C();
  id v7 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents"), "objectAtIndexedSubscript:", a3);

  [v7 CGRectValue];
  result.size.unint64_t height = v11;
  result.size.unint64_t width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end