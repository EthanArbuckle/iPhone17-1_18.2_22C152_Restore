@interface CISeedFillProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)result;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CISeedFillProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v10 = (void *)[a3 objectAtIndexedSubscript:1];
  [v9 format];
  [v10 format];
  [a5 format];
  [a5 region];
  double v12 = v11;
  [a5 region];
  double v14 = v13;
  uint64_t v15 = [a5 bytesPerRow];
  clearOutput(a5);
  *(_OWORD *)&src.height = xmmword_19394CBA0;
  src.rowBytes = 8;
  dest.data = v43;
  *(_OWORD *)&dest.height = xmmword_19394CBA0;
  dest.rowBytes = 16;
  src.data = (void *)[v10 baseAddress];
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
  double v16 = roundf(v43[0]);
  double v17 = roundf(v43[1]);
  [v9 region];
  int v19 = (int)(v16 - v18);
  [v9 region];
  int v21 = (int)(v17 - v20);
  if (v19 <= v21) {
    int v22 = (int)(v17 - v20);
  }
  else {
    int v22 = v19;
  }
  if (v22 >= 1)
  {
    unint64_t v23 = (unint64_t)v12;
    unint64_t v24 = (unint64_t)v14;
    [v9 region];
    uint64_t v26 = (int)(v25 - (double)v21 + -1.0);
    int v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kThreshold"), "intValue");
    unsigned __int8 v28 = (v27 & ~(v27 >> 31)) >= 0xFF ? -1 : v27 & ~(v27 >> 31);
    inited = initBitmask((unint64_t)v14, (unint64_t)v12);
    *((void *)&v37 + 1) = objc_msgSend(v9, "bytesPerRow", v28, 0, 0, 0, 0);
    [v9 region];
    unint64_t v38 = (unint64_t)v30;
    [v9 region];
    unint64_t v39 = (unint64_t)v31;
    LODWORD(v40) = 0;
    seedFill([v9 baseAddress], (uint64_t)inited, v19, v26, (uint64_t)&v37, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))fillR8);
    uint64_t v32 = [a5 baseAddress];
    if (v23)
    {
      uint64_t v33 = v32;
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (v24)
        {
          for (uint64_t j = 0; j != v24; ++j)
            *(unsigned char *)(v33 + j) = -(char)bitValueFromBitmask((uint64_t)inited, j, i);
        }
        v33 += v15;
      }
    }
  }
  return 1;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 == 1)
  {
    v3 = &kCIFormatRGBAh;
    return *v3;
  }
  if (!a3)
  {
    v3 = &kCIFormatR8;
    return *v3;
  }
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)result
{
  if (a3 == 1)
  {
    result.origin.x = 0.0;
    result.origin.y = 0.0;
    result.size.width = 1.0;
    result.size.height = 1.0;
  }
  return result;
}

@end