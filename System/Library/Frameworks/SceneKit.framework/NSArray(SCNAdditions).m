@interface NSArray(SCNAdditions)
+ (uint64_t)SCN_arrayWithSimdMatrix4:()SCNAdditions;
- (__n128)SCN_simdMatrix4Value;
@end

@implementation NSArray(SCNAdditions)

+ (uint64_t)SCN_arrayWithSimdMatrix4:()SCNAdditions
{
  v13[16] = *MEMORY[0x263EF8340];
  v13[0] = objc_msgSend(NSNumber, "numberWithFloat:");
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  v13[1] = [NSNumber numberWithFloat:v4];
  v13[2] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v13[3] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v13[4] = [NSNumber numberWithFloat:a2.n128_f64[0]];
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  v13[5] = [NSNumber numberWithFloat:v5];
  v13[6] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v13[7] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v13[8] = [NSNumber numberWithFloat:a3.n128_f64[0]];
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  v13[9] = [NSNumber numberWithFloat:v6];
  v13[10] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v13[11] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v13[12] = [NSNumber numberWithFloat:a4.n128_f64[0]];
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  v13[13] = [NSNumber numberWithFloat:v7];
  v13[14] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v13[15] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  return [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:16];
}

- (__n128)SCN_simdMatrix4Value
{
  if ((unint64_t)[a1 count] > 0xF)
  {
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 0), "floatValue");
    unsigned int v10 = v3;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 1), "floatValue");
    unsigned int v9 = v4;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 2), "floatValue");
    unsigned int v8 = v5;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 3), "floatValue");
    *(void *)&long long v6 = __PAIR64__(v9, v10);
    *((void *)&v6 + 1) = __PAIR64__(v7, v8);
    long long v11 = v6;
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 4), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 5), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 6), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 7), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 8), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 9), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 10), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 11), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 12), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 13), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 14), "floatValue");
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 15), "floatValue");
    return (__n128)v11;
  }
  else
  {
    return *(__n128 *)MEMORY[0x263EF89A8];
  }
}

@end