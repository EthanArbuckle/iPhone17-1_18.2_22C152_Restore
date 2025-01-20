@interface NSArray(AVTExtension)
+ (id)avt_arrayWithFloat3:()AVTExtension;
+ (id)avt_arrayWithFloat3:()AVTExtension roundingBehavior:;
+ (id)avt_arrayWithFloat4:()AVTExtension;
+ (id)avt_arrayWithFloat4:()AVTExtension roundingBehavior:;
+ (id)avt_arrayWithFloat4x4:()AVTExtension;
+ (id)avt_arrayWithFloat4x4:()AVTExtension roundingBehavior:;
- (__n128)avt_float3;
- (__n128)avt_float4;
- (__n128)avt_float4x4;
- (id)avt_mutableContainersCopy;
- (id)avt_randomObject;
@end

@implementation NSArray(AVTExtension)

+ (id)avt_arrayWithFloat4x4:()AVTExtension
{
  v36[4] = *MEMORY[0x263EF8340];
  v26 = objc_msgSend(NSNumber, "numberWithFloat:");
  v35[0] = v26;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  v25 = [NSNumber numberWithFloat:v4];
  v35[1] = v25;
  v24 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v35[2] = v24;
  a1.n128_u64[0] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v35[3] = a1.n128_u64[0];
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
  v36[0] = v23;
  v22 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  v34[0] = v22;
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  v21 = [NSNumber numberWithFloat:v5];
  v34[1] = v21;
  v20 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v34[2] = v20;
  a2.n128_u64[0] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v34[3] = a2.n128_u64[0];
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v36[1] = v19;
  v18 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v33[0] = v18;
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  v7 = [NSNumber numberWithFloat:v6];
  v33[1] = v7;
  v8 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v33[2] = v8;
  v9 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v33[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  v36[2] = v10;
  v11 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  v32[0] = v11;
  HIDWORD(v12) = a4.n128_u32[1];
  LODWORD(v12) = a4.n128_u32[1];
  v13 = [NSNumber numberWithFloat:v12];
  v32[1] = v13;
  v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v32[2] = v14;
  v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v32[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  v36[3] = v16;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];

  return v31;
}

+ (id)avt_arrayWithFloat4x4:()AVTExtension roundingBehavior:
{
  v41[4] = *MEMORY[0x263EF8340];
  v7 = NSNumber;
  id v8 = a7;
  v32 = objc_msgSend(v7, "avt_numberWithFloat:roundingBehavior:", v8, a1.n128_f64[0]);
  v40[0] = v32;
  HIDWORD(v9) = a1.n128_u32[1];
  LODWORD(v9) = a1.n128_u32[1];
  v31 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, v9);
  v40[1] = v31;
  v30 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v40[2] = v30;
  a1.n128_u64[0] = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v40[3] = a1.n128_u64[0];
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
  v41[0] = v29;
  v28 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, a2.n128_f64[0]);
  v39[0] = v28;
  HIDWORD(v10) = a2.n128_u32[1];
  LODWORD(v10) = a2.n128_u32[1];
  v27 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, v10);
  v39[1] = v27;
  v26 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v39[2] = v26;
  a2.n128_u64[0] = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v39[3] = a2.n128_u64[0];
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
  v41[1] = v25;
  v24 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, a3.n128_f64[0]);
  v38[0] = v24;
  HIDWORD(v11) = a3.n128_u32[1];
  LODWORD(v11) = a3.n128_u32[1];
  double v12 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, v11);
  v38[1] = v12;
  v13 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v38[2] = v13;
  v14 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v38[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
  v41[2] = v15;
  v16 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, a4.n128_f64[0]);
  v37[0] = v16;
  HIDWORD(v17) = a4.n128_u32[1];
  LODWORD(v17) = a4.n128_u32[1];
  v18 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, v17);
  v37[1] = v18;
  v19 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v37[2] = v19;
  v20 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v8, COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));

  v37[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  v41[3] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];

  return v22;
}

- (__n128)avt_float4x4
{
  if ([a1 count] == 4)
  {
    id v2 = a1;
    v40 = [v2 objectAtIndexedSubscript:0];
    v39 = [v40 objectAtIndexedSubscript:0];
    [v39 floatValue];
    unsigned int v43 = v3;
    v38 = [v2 objectAtIndexedSubscript:0];
    v37 = [v38 objectAtIndexedSubscript:1];
    [v37 floatValue];
    unsigned int v42 = v4;
    v36 = [v2 objectAtIndexedSubscript:0];
    v35 = [v36 objectAtIndexedSubscript:2];
    [v35 floatValue];
    unsigned int v41 = v5;
    v34 = [v2 objectAtIndexedSubscript:0];
    v33 = [v34 objectAtIndexedSubscript:3];
    [v33 floatValue];
    *(void *)&long long v6 = __PAIR64__(v42, v43);
    *((void *)&v6 + 1) = __PAIR64__(v7, v41);
    long long v44 = v6;
    v32 = [v2 objectAtIndexedSubscript:1];
    v31 = [v32 objectAtIndexedSubscript:0];
    [v31 floatValue];
    v30 = [v2 objectAtIndexedSubscript:1];
    v29 = [v30 objectAtIndexedSubscript:1];
    [v29 floatValue];
    v28 = [v2 objectAtIndexedSubscript:1];
    v27 = [v28 objectAtIndexedSubscript:2];
    [v27 floatValue];
    v26 = [v2 objectAtIndexedSubscript:1];
    v25 = [v26 objectAtIndexedSubscript:3];
    [v25 floatValue];
    v24 = [v2 objectAtIndexedSubscript:2];
    v23 = [v24 objectAtIndexedSubscript:0];
    [v23 floatValue];
    v22 = [v2 objectAtIndexedSubscript:2];
    v21 = [v22 objectAtIndexedSubscript:1];
    [v21 floatValue];
    v20 = [v2 objectAtIndexedSubscript:2];
    v19 = [v20 objectAtIndexedSubscript:2];
    [v19 floatValue];
    id v8 = [v2 objectAtIndexedSubscript:2];
    double v9 = [v8 objectAtIndexedSubscript:3];
    [v9 floatValue];
    double v10 = [v2 objectAtIndexedSubscript:3];
    double v11 = [v10 objectAtIndexedSubscript:0];
    [v11 floatValue];
    double v12 = [v2 objectAtIndexedSubscript:3];
    v13 = [v12 objectAtIndexedSubscript:1];
    [v13 floatValue];
    v14 = [v2 objectAtIndexedSubscript:3];
    v15 = [v14 objectAtIndexedSubscript:2];
    [v15 floatValue];
    v16 = [v2 objectAtIndexedSubscript:3];

    double v17 = [v16 objectAtIndexedSubscript:3];
    [v17 floatValue];

    return (__n128)v44;
  }
  else
  {
    return *(__n128 *)MEMORY[0x263EF89A8];
  }
}

+ (id)avt_arrayWithFloat3:()AVTExtension
{
  v8[3] = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(NSNumber, "numberWithFloat:");
  v8[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  unsigned int v3 = [NSNumber numberWithFloat:v2];
  v8[1] = v3;
  unsigned int v4 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v8[2] = v4;
  unsigned int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v5;
}

+ (id)avt_arrayWithFloat3:()AVTExtension roundingBehavior:
{
  v13[3] = *MEMORY[0x263EF8340];
  unsigned int v4 = NSNumber;
  id v5 = a4;
  long long v6 = objc_msgSend(v4, "avt_numberWithFloat:roundingBehavior:", v5, a1.n128_f64[0]);
  v13[0] = v6;
  HIDWORD(v7) = a1.n128_u32[1];
  LODWORD(v7) = a1.n128_u32[1];
  id v8 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v5, v7);
  v13[1] = v8;
  double v9 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v5, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));

  v13[2] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];

  return v10;
}

+ (id)avt_arrayWithFloat4:()AVTExtension
{
  v9[4] = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(NSNumber, "numberWithFloat:");
  v9[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  unsigned int v3 = [NSNumber numberWithFloat:v2];
  v9[1] = v3;
  unsigned int v4 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v9[2] = v4;
  id v5 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v9[3] = v5;
  long long v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return v6;
}

+ (id)avt_arrayWithFloat4:()AVTExtension roundingBehavior:
{
  v14[4] = *MEMORY[0x263EF8340];
  unsigned int v4 = NSNumber;
  id v5 = a4;
  long long v6 = objc_msgSend(v4, "avt_numberWithFloat:roundingBehavior:", v5, a1.n128_f64[0]);
  v14[0] = v6;
  HIDWORD(v7) = a1.n128_u32[1];
  LODWORD(v7) = a1.n128_u32[1];
  id v8 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v5, v7);
  v14[1] = v8;
  double v9 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v5, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v14[2] = v9;
  double v10 = objc_msgSend(NSNumber, "avt_numberWithFloat:roundingBehavior:", v5, COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));

  v14[3] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];

  return v11;
}

- (__n128)avt_float3
{
  unint64_t v2 = [a1 count];
  result.n128_u64[0] = 0;
  if (v2 >= 3)
  {
    id v4 = a1;
    id v5 = [v4 objectAtIndexedSubscript:0];
    [v5 floatValue];
    *(void *)&long long v13 = v6;
    double v7 = [v4 objectAtIndexedSubscript:1];
    [v7 floatValue];
    int v12 = v8;
    double v9 = [v4 objectAtIndexedSubscript:2];

    [v9 floatValue];
    long long v10 = v13;
    DWORD1(v10) = v12;
    DWORD2(v10) = v11;
    long long v14 = v10;

    return (__n128)v14;
  }
  return result;
}

- (__n128)avt_float4
{
  unint64_t v2 = [a1 count];
  result.n128_u64[0] = 0;
  if (v2 >= 4)
  {
    id v4 = a1;
    id v5 = [v4 objectAtIndexedSubscript:0];
    [v5 floatValue];
    unsigned int v16 = v6;
    double v7 = [v4 objectAtIndexedSubscript:1];
    [v7 floatValue];
    unsigned int v15 = v8;
    double v9 = [v4 objectAtIndexedSubscript:2];
    [v9 floatValue];
    unsigned int v14 = v10;
    int v11 = [v4 objectAtIndexedSubscript:3];

    [v11 floatValue];
    *(void *)&long long v12 = __PAIR64__(v15, v16);
    *((void *)&v12 + 1) = __PAIR64__(v13, v14);
    long long v17 = v12;

    return (__n128)v17;
  }
  return result;
}

- (id)avt_randomObject
{
  unint64_t v2 = (void *)[a1 count];
  if (v2)
  {
    unint64_t v2 = [a1 objectAtIndexedSubscript:arc4random_uniform((uint32_t)v2)];
  }
  return v2;
}

- (id)avt_mutableContainersCopy
{
  unint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__NSArray_AVTExtension__avt_mutableContainersCopy__block_invoke;
  v5[3] = &unk_264020580;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateObjectsUsingBlock:v5];

  return v3;
}

@end