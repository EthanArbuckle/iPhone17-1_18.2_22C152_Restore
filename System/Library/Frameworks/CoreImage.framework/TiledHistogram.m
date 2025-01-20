@interface TiledHistogram
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4;
+ (int)outputFormatWithArguments:(id)a3;
@end

@implementation TiledHistogram

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v41[4095] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"binCount"), "unsignedLongValue");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaW"), "longValue");
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaH"), "longValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"scale"), "floatValue");
  float v13 = v12;
  v14 = (void *)[a3 objectAtIndexedSubscript:0];
  [v14 region];
  double v16 = v15;
  unint64_t v18 = (unint64_t)v17;
  bzero(v40, 0x8000uLL);
  uint64_t v19 = [v14 baseAddress];
  if (v18)
  {
    uint64_t v20 = v19;
    for (uint64_t i = 0; i != v18; ++i)
    {
      if ((unint64_t)v16)
      {
        uint64_t v22 = v20 + 4;
        unint64_t v23 = (unint64_t)v16;
        do
        {
          _H0 = *(_WORD *)(v22 + 2);
          uint64_t v25 = 16 * (int)*(short float *)(v22 - 4);
          __asm { FCVT            S0, H0 }
          *(float *)&v40[v25] = *(float *)&v40[v25] + _S0;
          v31 = (float *)&v40[16 * (int)*(short float *)(v22 - 2)];
          v31[1] = v31[1] + _S0;
          v32 = (float *)&v40[16 * (int)*(short float *)v22];
          v32[2] = v32[2] + _S0;
          v22 += 8;
          --v23;
        }
        while (v23);
      }
      v20 += [v14 bytesPerRow] & 0xFFFFFFFFFFFFFFF8;
    }
  }
  v33 = (float *)[a5 baseAddress];
  if (![v14 roiTileIndex]) {
    bzero(v33, 16 * v9);
  }
  if (v9)
  {
    *(float *)v34.i32 = v13 / (float)(v11 * v10);
    float32x2_t v35 = (float32x2_t)vdup_lane_s32(v34, 0);
    v36 = v33 + 2;
    v37 = (float *)v41;
    do
    {
      *((float32x2_t *)v36 - 1) = vmla_f32(*(float32x2_t *)(v36 - 2), v35, *(float32x2_t *)(v37 - 2));
      float v38 = *v37;
      v37 += 4;
      float *v36 = *v36 + (float)(v38 * *(float *)v34.i32);
      v36 += 4;
      --v9;
    }
    while (v9);
  }
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  return 2056;
}

+ (int)outputFormatWithArguments:(id)a3
{
  return 2312;
}

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"tileSize", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "longValue");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaX"), "longValue");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaY"), "longValue");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaW"), "longValue");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"areaH"), "longValue");
  uint64_t v11 = (v6 - 1 + v10) / v6;
  float v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if ((v6 - 1 + v9) / v6 >= 1)
      {
        uint64_t v14 = (v6 - 1 + v9) / v6;
        uint64_t v15 = v7;
        do
        {
          v17.origin.x = (double)v15;
          v17.origin.y = (double)(v8 + i * v6);
          v17.size.width = (double)v6;
          v17.size.height = (double)v6;
          v19.origin.x = (double)v7;
          v19.origin.y = (double)v8;
          v19.size.width = (double)v9;
          v19.size.height = (double)v10;
          CGRect v18 = CGRectIntersection(v17, v19);
          objc_msgSend(v12, "addObject:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height));
          v15 += v6;
          --v14;
        }
        while (v14);
      }
    }
  }
  return v12;
}

@end