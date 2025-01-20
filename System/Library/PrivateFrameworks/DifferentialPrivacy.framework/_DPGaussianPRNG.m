@interface _DPGaussianPRNG
+ (BOOL)generateGaussianFloatsWithMean:(double)a3 stddev:(double)a4 x:(int)a5 y:(int)a6 out1:(float *)a7 out2:(float *)a8;
+ (id)generateSeed;
+ (id)randomFloatVectorFromSeed:(id)a3 length:(unint64_t)a4 mean:(double)a5 stddev:(double)a6;
+ (unint64_t)seedLength;
@end

@implementation _DPGaussianPRNG

+ (id)randomFloatVectorFromSeed:(id)a3 length:(unint64_t)a4 mean:(double)a5 stddev:(double)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 length];
  if (v11 == [a1 seedLength])
  {
    v12 = objc_msgSend(v10, "subdataWithRange:", 0, 16);
    objc_msgSend(v10, "subdataWithRange:", 16, 16);
    CCCryptorRef cryptorRef = 0;
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const void *)[v13 bytes];
    v15 = v12;
    CCCryptorStatus v16 = CCCryptorCreateWithMode(0, 4u, 0, 0, v14, (const void *)[v15 bytes], 0x10uLL, 0, 0, 0, 2u, &cryptorRef);
    if (v16)
    {
      int v17 = v16;
      v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:](v17, v18);
      }
      v19 = 0;
    }
    else
    {
      id v37 = v13;
      v36 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * a4];
      uint64_t v20 = [v36 mutableBytes];
      unint64_t v21 = (a4 >> 2) & 0xFFFFFFFFFFFFFFFLL;
      if (v21 >= 0xFFF) {
        unint64_t v21 = 4095;
      }
      size_t v22 = 16 * v21 + 16;
      id v35 = [MEMORY[0x1E4F1CA58] dataWithLength:v22];
      uint64_t v23 = [v35 mutableBytes];
      if (a4)
      {
        v24 = (char *)v23;
        unint64_t v25 = 0;
        while (1)
        {
          bzero(v24, v22);
          CCCryptorStatus v26 = CCCryptorUpdate(cryptorRef, v24, v22, v24, v22, 0);
          if (v26) {
            break;
          }
          if (v25 < a4)
          {
            unint64_t v27 = 0;
            do
            {
              v28 = &v24[4 * v27];
              uint64_t v29 = *(unsigned int *)v28;
              uint64_t v30 = *((unsigned int *)v28 + 1);
              uint64_t v38 = 0;
              if ([a1 generateGaussianFloatsWithMean:v29 stddev:v30 x:(char *)&v38 + 4 y:&v38 out1:a5 out2:a6])
              {
                unint64_t v31 = v25 + 1;
                *(_DWORD *)(v20 + 4 * v25) = HIDWORD(v38);
                if (v25 + 1 >= a4)
                {
                  ++v25;
                }
                else
                {
                  v25 += 2;
                  *(_DWORD *)(v20 + 4 * v31) = v38;
                }
              }
              v27 += 2;
            }
            while (v27 < (v22 >> 2) - 1 && v25 < a4);
          }
          if (v25 >= a4) {
            goto LABEL_23;
          }
        }
        int v32 = v26;
        v33 = +[_DPLog framework];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:](v32, v33);
        }

        CCCryptorRelease(cryptorRef);
        v19 = 0;
        v18 = v36;
        id v13 = v37;
      }
      else
      {
LABEL_23:
        CCCryptorRelease(cryptorRef);
        v18 = v36;
        v19 = v36;
        id v13 = v37;
      }
    }
  }
  else
  {
    v15 = +[_DPLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:](v10, a1, v15);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)generateSeed
{
  size_t v2 = +[_DPGaussianPRNG seedLength];
  id v3 = [MEMORY[0x1E4F1CA58] dataWithLength:v2];
  arc4random_buf((void *)[v3 mutableBytes], v2);
  return v3;
}

+ (unint64_t)seedLength
{
  return 32;
}

+ (BOOL)generateGaussianFloatsWithMean:(double)a3 stddev:(double)a4 x:(int)a5 y:(int)a6 out1:(float *)a7 out2:(float *)a8
{
  unsigned int v8 = a5 & 0x7FFFFFFF;
  unsigned int v9 = a6 & 0x7FFFFFFF;
  int64_t v10 = v9 * (unint64_t)v9 + v8 * (unint64_t)v8;
  if ((unint64_t)(v10 - 1) > 0x3FFFFFFFFFFFFFFELL) {
    return 0;
  }
  int v15 = (a6 != 0) | (a6 >> 31);
  int v16 = (a5 != 0) | (a5 >> 31);
  double v17 = sqrt(log((double)v10 * 2.16840434e-19) * -2.0 / ((double)v10 * 2.16840434e-19));
  float v18 = a3 + a4 * ((double)(int)v8 * (double)v16 / 2147483650.0 * v17);
  *a7 = v18;
  *(float *)&double v17 = a3 + a4 * ((double)(int)v9 * (double)v15 / 2147483650.0 * v17);
  *a8 = *(float *)&v17;
  return 1;
}

+ (void)randomFloatVectorFromSeed:(int)a1 length:(NSObject *)a2 mean:stddev:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Failed call to CCCryptorUpdate %d", (uint8_t *)v2, 8u);
}

+ (void)randomFloatVectorFromSeed:(int)a1 length:(NSObject *)a2 mean:stddev:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Failed to create cryptor %d", (uint8_t *)v2, 8u);
}

+ (void)randomFloatVectorFromSeed:(NSObject *)a3 length:mean:stddev:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 length];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 seedLength];
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "_DPGaussianPRNG's seed is with wrong length %lu, should be %lu", (uint8_t *)&v5, 0x16u);
}

@end