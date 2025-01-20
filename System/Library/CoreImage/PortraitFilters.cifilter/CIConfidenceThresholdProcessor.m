@interface CIConfidenceThresholdProcessor
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIConfidenceThresholdProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v9 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  id v10 = [a3 objectAtIndexedSubscript:1];
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputFocusRect"), "CGRectValue");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  memset(v94, 0, sizeof(v94));
  memset(v92, 0, sizeof(v92));
  memset(v93, 0, sizeof(v93));
  [v9 region];
  double v20 = v19;
  [v9 region];
  int v22 = (int)v21;
  if ((int)v21 < 1)
  {
    float v31 = -1000.0;
    float v30 = 1000.0;
    float v50 = -2000.0;
    float v86 = -0.0005;
    float v49 = -15.748;
    float v87 = 1000.0;
  }
  else
  {
    int v23 = 0;
    int v24 = (int)v20;
    double v84 = v18;
    double v85 = v16;
    double v25 = v12;
    double v88 = v12 + v16;
    double v26 = v14;
    double v27 = v14 + v18;
    double v28 = 0.0;
    float v29 = -1000.0;
    float v30 = 1000.0;
    float v87 = 1000.0;
    float v31 = -1000.0;
    do
    {
      if (v24 >= 1)
      {
        double v32 = 0.0;
        int v33 = v24;
        do
        {
          float v34 = sub_4A2C(v9, v32, v28);
          if (v34 < v30) {
            float v30 = v34;
          }
          if (v34 >= v31) {
            float v31 = v34;
          }
          if (v25 <= v32 && v88 > v32 && v26 <= v28 && v27 > v28)
          {
            float v38 = sub_4A2C(v10, v32, v28);
            float v39 = v87;
            if (v38 < v87) {
              float v39 = v38;
            }
            float v87 = v39;
            if (v38 >= v29) {
              float v29 = v38;
            }
          }
          double v32 = v32 + 1.0;
          --v33;
        }
        while (v33);
      }
      double v28 = v28 + 1.0;
      ++v23;
    }
    while (v23 != v22);
    int v40 = 0;
    *((float *)&v83 + 1) = v31 - v30;
    float v86 = 1.0 / (float)(v31 - v30);
    double v41 = 0.0;
    *(float *)&uint64_t v83 = (float)(v29 - v87) / 127.0;
    do
    {
      if (v24 >= 1)
      {
        double v42 = 0.0;
        int v43 = v24;
        do
        {
          float v44 = fmaxf(floorf(v86 * (float)((float)(sub_4A2C(v9, v42, v41) - v30) * 127.0)), 0.0);
          if (v44 > 127.0) {
            float v44 = 127.0;
          }
          ++*((_DWORD *)v94 + (int)v44);
          if (v25 <= v42 && v88 > v42 && v26 <= v41 && v27 > v41)
          {
            float v48 = fmaxf(floorf((float)(1.0 / (float)(v29 - v87)) * (float)((float)(sub_4A2C(v10, v42, v41) - v87) * 127.0)), 0.0);
            if (v48 > 127.0) {
              float v48 = 127.0;
            }
            ++*((_DWORD *)v93 + (int)v48);
          }
          double v42 = v42 + 1.0;
          --v43;
        }
        while (v43);
      }
      double v41 = v41 + 1.0;
      ++v40;
    }
    while (v40 != v22);
    double v18 = v84;
    double v16 = v85;
    float v49 = (float)(v29 - v87) / 127.0;
    float v50 = v31 - v30;
  }
  int v51 = (int)(v16 * v18);
  int v52 = v51 + 2;
  if (v51 >= -1) {
    int v52 = v51 + 1;
  }
  if (v51 < 1)
  {
    float v57 = 0.0;
  }
  else
  {
    unint64_t v53 = 0;
    int v54 = 0;
    int v55 = v52 >> 1;
    do
    {
      int v56 = v53 + 1;
      if (v53 > 0x7E) {
        break;
      }
      v54 += *((_DWORD *)v93 + v53++);
    }
    while (v54 < v55);
    float v57 = (float)v56;
  }
  double v58 = fmax((float)(v49 * v57), 0.0) + v87;
  int v91 = 1024846306;
  uint64_t v90 = 0x3DE3F1413E5DE69BLL;
  unint64_t v59 = (unint64_t)&v89 | 0xC;
  long long v89 = xmmword_55E60;
  for (unint64_t i = 3; i != 131; ++i)
  {
    if (i <= 5) {
      int v61 = 0;
    }
    else {
      int v61 = i - 6;
    }
    if (i >= 0x7F) {
      int v62 = 6;
    }
    else {
      int v62 = i;
    }
    float v63 = 0.0;
    if (v61 < v62)
    {
      uint64_t v64 = v62;
      v65 = (float *)(v59 - 4 * v61);
      v66 = (int *)v94 + v61;
      uint64_t v67 = v64 - v61;
      do
      {
        int v68 = *v66++;
        float v69 = (float)v68;
        float v70 = *v65--;
        float v63 = v63 + (float)(v69 * v70);
        --v67;
      }
      while (v67);
    }
    *((float *)v92 + i - 3) = v63;
    v59 += 4;
  }
  float v71 = v58;
  int v72 = (int)(float)(v86 * (float)(v71 - v30)) << 7;
  if (v72 <= 1) {
    int v72 = 1;
  }
  if (v72 >= 128) {
    unsigned int v73 = 128;
  }
  else {
    unsigned int v73 = v72;
  }
  float v74 = 0.0;
  if (v73 >= 2)
  {
    uint64_t v75 = 0;
    int v76 = 0;
    uint64_t v77 = v73 - 1;
    float v78 = -1000.0;
    do
    {
      float v79 = *((float *)v92 + v75);
      if ((float)((float)((float)((float)(int)v75 / 127.0) * (float)((float)(int)v75 / 127.0)) * v79) > v78)
      {
        float v78 = (float)((float)((float)(int)v75 / 127.0) * (float)((float)(int)v75 / 127.0)) * v79;
        int v76 = v75;
      }
      ++v75;
    }
    while (v77 != v75);
    float v74 = (float)v76;
  }
  float v80 = v30 + (float)((float)(v50 / 127.0) * v74);
  v81 = (float *)objc_msgSend(a5, "baseAddress", v83);
  float *v81 = v80;
  v81[1] = v30;
  v81[2] = v31;
  v81[3] = 1.0;
  return 1;
}

+ (int)outputFormat
{
  return kCIFormatRGBAf;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return kCIFormatRGBAf;
}

@end