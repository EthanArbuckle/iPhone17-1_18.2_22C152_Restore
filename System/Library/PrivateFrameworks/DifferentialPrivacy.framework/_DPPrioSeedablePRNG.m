@interface _DPPrioSeedablePRNG
+ (id)generateSeed;
+ (id)randomDataFromSeed:(id)a3 length:(unint64_t)a4;
+ (unint64_t)seedLength;
@end

@implementation _DPPrioSeedablePRNG

+ (id)randomDataFromSeed:(id)a3 length:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 length];
  if (v7 == [a1 seedLength])
  {
    v8 = objc_msgSend(v6, "subdataWithRange:", 0, 16);
    objc_msgSend(v6, "subdataWithRange:", 16, 16);
    CCCryptorRef cryptorRef = 0;
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const void *)[v9 bytes];
    v11 = v8;
    CCCryptorStatus v12 = CCCryptorCreateWithMode(0, 4u, 0, 0, v10, (const void *)[v11 bytes], 0x10uLL, 0, 0, 0, 2u, &cryptorRef);
    if (v12)
    {
      int v13 = v12;
      v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:](v13, v14);
      }
      v15 = 0;
    }
    else
    {
      id v34 = v9;
      v35 = v11;
      id v36 = v6;
      v33 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * a4];
      uint64_t v16 = [v33 mutableBytes];
      unint64_t v17 = (a4 >> 2) & 0xFFFFFFFFFFFFFFFLL;
      if (v17 >= 0xFFF) {
        unint64_t v17 = 4095;
      }
      unint64_t v18 = 16 * v17 + 16;
      v19 = [MEMORY[0x1E4F1CA58] dataWithLength:v18];
      if (a4)
      {
        unint64_t v20 = 0;
        while (1)
        {
          id v21 = v19;
          bzero((void *)[v21 mutableBytes], objc_msgSend(v21, "length"));
          v22 = cryptorRef;
          id v23 = v21;
          v24 = (const void *)[v23 bytes];
          size_t v25 = [v23 length];
          id v26 = v23;
          CCCryptorStatus v27 = CCCryptorUpdate(v22, v24, v25, (void *)[v26 mutableBytes], objc_msgSend(v26, "length"), 0);
          if (v27) {
            break;
          }
          if (v20 < a4)
          {
            unint64_t v28 = 0;
            do
            {
              unsigned int v29 = *(_DWORD *)([v26 bytes] + v28);
              if (v29 <= 0xFFF00000) {
                *(_DWORD *)(v16 + 4 * v20++) = v29;
              }
              v28 += 4;
            }
            while (v28 < v18 && v20 < a4);
          }
          if (v20 >= a4) {
            goto LABEL_21;
          }
        }
        int v30 = v27;
        v31 = +[_DPLog framework];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:](v30, v31);
        }

        CCCryptorRelease(cryptorRef);
        v15 = 0;
        v11 = v35;
        id v6 = v36;
        v14 = v33;
        id v9 = v34;
      }
      else
      {
LABEL_21:
        CCCryptorRelease(cryptorRef);
        v14 = v33;
        v15 = v33;
        v11 = v35;
        id v6 = v36;
        id v9 = v34;
      }
    }
  }
  else
  {
    v11 = +[_DPLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_DPPrioSeedablePRNG randomDataFromSeed:length:](v11);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)generateSeed
{
  size_t v2 = +[_DPPrioSeedablePRNG seedLength];
  id v3 = [MEMORY[0x1E4F1CA58] dataWithLength:v2];
  arc4random_buf((void *)[v3 mutableBytes], v2);
  return v3;
}

+ (unint64_t)seedLength
{
  return 32;
}

+ (void)randomDataFromSeed:(os_log_t)log length:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "_DPPrioSeedablePRNG's seed is with wrong length!", v1, 2u);
}

@end