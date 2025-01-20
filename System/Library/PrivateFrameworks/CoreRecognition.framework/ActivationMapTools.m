@interface ActivationMapTools
+ (BOOL)matchLabel:(int)a3 toModelCharacter:(unsigned __int16)a4;
+ (id)characterCentroidsFromActivationMap:(const void *)a3 codeMap:(const int *)a4 decodedSymbolIndexes:(id *)a5;
+ (id)characterCentroidsFromActivationMap:(void *)a3 codeMap:(const int *)a4 potentialPatterns:(id)a5 minWordLengthFractionForCorrelationPeak:(float)a6 bestModelIndex:(int64_t *)a7;
+ (id)decodeStringWithCentroids:(id)a3 activationMap:(const void *)a4 codeMap:(const int *)a5 model:(id)a6;
+ (id)fitSpacingModel:(id)a3 toActivationMap:(const void *)a4 codeMap:(const int *)a5 minWordLengthFractionForCorrelationPeak:(float)a6 cost:(float *)a7;
+ (id)textFromActivationMap:(void *)a3 codeMap:(const int *)a4 invert:(BOOL)a5;
+ (int)colInImage:(vImage_Buffer *)a3 forPoint:(int)a4 inActivationMapWithSize:(int)a5;
+ (void)extractActivationSignals:(void *)a3 fromActivationMap:(const void *)a4 forModel:(id)a5 codeMap:(const int *)a6;
@end

@implementation ActivationMapTools

+ (id)characterCentroidsFromActivationMap:(const void *)a3 codeMap:(const int *)a4 decodedSymbolIndexes:(id *)a5
{
  v8 = [MEMORY[0x263EFF980] array];
  id v42 = [MEMORY[0x263EFF980] array];
  if (!a3) {
    goto LABEL_48;
  }
  v10 = *(void **)a3;
  uint64_t v9 = *((void *)a3 + 1);
  if (v9 == *(void *)a3) {
    goto LABEL_48;
  }
  uint64_t v11 = v10[1] - *v10;
  if (v11)
  {
    unint64_t v12 = 0;
    unint64_t v13 = v11 >> 2;
    if (v13 <= 1) {
      unint64_t v13 = 1;
    }
    while (a4[v12] != 103)
    {
      if (v13 == ++v12) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    unint64_t v12 = -1;
  }
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  int v17 = 0;
  unint64_t v41 = 0;
  do
  {
    while (1)
    {
      v18 = (float *)v10[3 * v14];
      v19 = v18;
      if (v12 >= 2)
      {
        v20 = v18 + 1;
        float v21 = *v18;
        uint64_t v22 = 4 * v12 - 4;
        v19 = (float *)v10[3 * v14];
        v23 = v18 + 1;
        do
        {
          float v24 = *v23++;
          float v25 = v24;
          if (v21 < v24)
          {
            float v21 = v25;
            v19 = v20;
          }
          v20 = v23;
          v22 -= 4;
        }
        while (v22);
      }
      v26 = &v18[v12];
      v27 = v26 + 1;
      v28 = (float *)v10[3 * v14 + 1];
      v29 = v26 + 2;
      if (v27 != v28 && v29 != v28)
      {
        float v31 = *v27;
        v32 = v29;
        do
        {
          float v33 = *v32++;
          float v34 = v33;
          if (v31 < v33)
          {
            float v31 = v34;
            v27 = v29;
          }
          v29 = v32;
        }
        while (v32 != v28);
      }
      if (*v19 <= *v27) {
        v19 = v27;
      }
      uint64_t v35 = v19 - v18;
      float v36 = *v19;
      double v37 = *v19;
      if (v17 != 2) {
        break;
      }
      if (v37 >= 0.2)
      {
        if (v36 < (float)v41)
        {
          int v17 = 2;
          goto LABEL_45;
        }
        unint64_t v41 = (unint64_t)v36;
        int v17 = 2;
        goto LABEL_44;
      }
      if (v14 - v16 < 2) {
        goto LABEL_40;
      }
      v38 = [NSNumber numberWithUnsignedLong:(v16 + v14) >> 1];
      [v8 addObject:v38];

      if (a5)
      {
        v39 = [NSNumber numberWithUnsignedLong:v15];
        [v42 addObject:v39];

        ++v14;
        v10 = *(void **)a3;
        uint64_t v9 = *((void *)a3 + 1);
        int v17 = 1;
        if (v14 >= 0xAAAAAAAAAAAAAAABLL * ((v9 - *(void *)a3) >> 3)) {
          goto LABEL_47;
        }
      }
      else
      {
        ++v14;
        v10 = *(void **)a3;
        uint64_t v9 = *((void *)a3 + 1);
        int v17 = 1;
        if (v14 >= 0xAAAAAAAAAAAAAAABLL * ((v9 - *(void *)a3) >> 3)) {
          goto LABEL_48;
        }
      }
    }
    if (v17 == 1)
    {
      if (v37 < 0.2)
      {
LABEL_40:
        int v17 = 1;
        goto LABEL_45;
      }
      unint64_t v41 = (unint64_t)v36;
      int v17 = 2;
      uint64_t v16 = v14;
LABEL_44:
      uint64_t v15 = v35;
      goto LABEL_45;
    }
    if (v37 < 0.2) {
      int v17 = 1;
    }
    else {
      int v17 = 2;
    }
    uint64_t v16 = v14;
LABEL_45:
    ++v14;
  }
  while (v14 < 0xAAAAAAAAAAAAAAABLL * ((v9 - (uint64_t)v10) >> 3));
  if (!a5) {
    goto LABEL_48;
  }
LABEL_47:
  *a5 = v42;
LABEL_48:

  return v8;
}

+ (int)colInImage:(vImage_Buffer *)a3 forPoint:(int)a4 inActivationMapWithSize:(int)a5
{
  return (a3->width - 18) * a4 / a5 + 9;
}

+ (id)characterCentroidsFromActivationMap:(void *)a3 codeMap:(const int *)a4 potentialPatterns:(id)a5 minWordLengthFractionForCorrelationPeak:(float)a6 bestModelIndex:(int64_t *)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a5;
  v26 = a7;
  *a7 = -1;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v30;
    float v18 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        float v28 = 0.0;
        *(float *)&double v14 = a6;
        float v21 = [a1 fitSpacingModel:v20 toActivationMap:a3 codeMap:a4 minWordLengthFractionForCorrelationPeak:&v28 cost:v14];
        uint64_t v22 = v21;
        float v23 = v28;
        if (v28 < v18)
        {
          id v24 = v21;

          int64_t *v26 = v15 + i;
          uint64_t v16 = v24;
          float v18 = v23;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      v15 += i;
    }
    while (v13);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)decodeStringWithCentroids:(id)a3 activationMap:(const void *)a4 codeMap:(const int *)a5 model:(id)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v43 = a6;
  uint64_t v9 = [v43 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
  uint64_t v10 = [v9 length];
  if (v10 == [v44 count])
  {
    uint64_t v11 = [MEMORY[0x263F089D8] string];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v44;
    uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v12)
    {
      uint64_t v49 = 0;
      v50 = v9;
      uint64_t v47 = *(void *)v57;
      v51 = v11;
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v46 = v12;
        do
        {
          if (*(void *)v57 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = v13;
          double v14 = *(void **)(*((void *)&v56 + 1) + 8 * v13);
          uint64_t v15 = [v9 characterAtIndex:v49];
          int v16 = [v14 intValue];
          if (v16 <= 2) {
            int v17 = 2;
          }
          else {
            int v17 = v16;
          }
          unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
          unint64_t v19 = v18 - 1;
          int v20 = v18 - 1;
          if (v19 >= v16 + 2) {
            int v21 = v16 + 2;
          }
          else {
            int v21 = v20;
          }
          unint64_t v22 = (uint64_t)(*(void *)(*(void *)a4 + 24 * v16 + 8) - *(void *)(*(void *)a4 + 24 * v16)) >> 2;
          uint64_t v53 = 0;
          std::vector<double>::vector(&__p, v22, &v53);
          float v23 = [MEMORY[0x263F089D8] string];
          uint64_t v25 = (v17 - 2);
          if ((int)v25 > v21)
          {
LABEL_23:
            if (__p == v55)
            {
              uint64_t v35 = __p;
            }
            else
            {
              uint64_t v34 = (double *)((char *)__p + 8);
              uint64_t v35 = __p;
              if ((char *)__p + 8 != v55)
              {
                double v24 = *(double *)__p;
                uint64_t v35 = __p;
                float v36 = (double *)((char *)__p + 8);
                do
                {
                  double v37 = *v36++;
                  double v38 = v37;
                  if (v24 < v37)
                  {
                    double v24 = v38;
                    uint64_t v35 = v34;
                  }
                  uint64_t v34 = v36;
                }
                while (v36 != (double *)v55);
              }
            }
            LOWORD(v53) = *(const int *)((char *)a5 + ((v35 - (unsigned char *)__p) << 29 >> 30));
            v40 = objc_msgSend(NSString, "stringWithCharacters:length:", &v53, 1, v24);
            [v11 appendString:v40];

            ++v49;
            int v39 = 1;
          }
          else
          {
            int v26 = v21 + 1;
            while (1)
            {
              v27 = (uint64_t *)(*(void *)a4 + 24 * v25);
              if (v27[1] == *v27)
              {
                int v39 = 0;
                goto LABEL_34;
              }
              unint64_t v28 = 0;
              float v29 = -INFINITY;
              uint64_t v30 = 0xFFFFFFFFLL;
              do
              {
                int v31 = [a1 matchLabel:a5[v28] toModelCharacter:v15];
                uint64_t v32 = *v27;
                if (v31 && *(float *)(v32 + 4 * v28) > v29)
                {
                  uint64_t v30 = v28;
                  float v29 = *(float *)(v32 + 4 * v28);
                }
                ++v28;
              }
              while (v28 < (v27[1] - v32) >> 2);
              if ((v30 & 0x80000000) != 0) {
                break;
              }
              *((double *)__p + v30) = *((double *)__p + v30) + v29;
              LOWORD(v53) = a5[v30];
              uint64_t v9 = v50;
              float v33 = [NSString stringWithCharacters:&v53 length:1];
              uint64_t v11 = v51;
              [v23 appendString:v33];

              if (v26 == ++v25) {
                goto LABEL_23;
              }
            }
            int v39 = 0;
            uint64_t v9 = v50;
            uint64_t v11 = v51;
          }
LABEL_34:

          if (__p)
          {
            v55 = (char *)__p;
            operator delete(__p);
          }
          if (!v39)
          {

            id v41 = 0;
            goto LABEL_42;
          }
          uint64_t v13 = v48 + 1;
        }
        while (v48 + 1 != v46);
        uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v41 = v11;
LABEL_42:
  }
  else
  {
    id v41 = 0;
  }

  return v41;
}

+ (id)textFromActivationMap:(void *)a3 codeMap:(const int *)a4 invert:(BOOL)a5
{
  v72[3] = *MEMORY[0x263EF8340];
  v5 = *(uint64_t **)a3;
  uint64_t v6 = *((void *)a3 + 1) - *(void *)a3;
  if (v6)
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v63 = 0;
    uint64_t v10 = v5;
    uint64_t v9 = (uint64_t *)*v5;
    int v11 = -1431655765 * ((v10[1] - (uint64_t)v9) >> 3);
    if ((int)v8 < 2)
    {
      std::vector<std::vector<float>>::resize(&v63, v11);
      if (v11 >= 1)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 24 * v11;
        do
        {
          uint64_t v38 = **(void **)a3;
          if (v63 != v38) {
            std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(v63 + v36), *(char **)(v38 + v36), *(void *)(v38 + v36 + 8), (uint64_t)(*(void *)(v38 + v36 + 8) - *(void *)(v38 + v36)) >> 2);
          }
          v36 += 24;
        }
        while (v37 != v36);
      }
    }
    else
    {
      uint64_t v13 = *v9;
      uint64_t v12 = v9[1];
      std::vector<std::vector<float>>::resize(&v63, v11);
      if (v11 >= 1)
      {
        uint64_t v15 = 0;
        uint64_t v60 = v11;
        unint64_t v61 = (unint64_t)(v12 - v13) >> 2;
        do
        {
          if ((int)v61 >= 1)
          {
            uint64_t v16 = 0;
            do
            {
              int v17 = *(uint64_t **)a3;
              double v14 = 0.0;
              uint64_t v18 = v8;
              do
              {
                uint64_t v19 = *v17;
                v17 += 3;
                *(float *)&double v14 = *(float *)&v14 + *(float *)(*(void *)(v19 + 24 * v15) + 4 * v16);
                --v18;
              }
              while (v18);
              uint64_t v20 = v63 + 24 * v15;
              float v21 = *(float *)&v14 / (float)(int)v8;
              float v23 = (float **)(v20 + 8);
              unint64_t v22 = *(float **)(v20 + 8);
              uint64_t v25 = (void *)(v20 + 16);
              unint64_t v24 = *(void *)(v20 + 16);
              if ((unint64_t)v22 >= v24)
              {
                v27 = *(float **)v20;
                uint64_t v28 = ((uint64_t)v22 - *(void *)v20) >> 2;
                unint64_t v29 = v28 + 1;
                if ((unint64_t)(v28 + 1) >> 62) {
                  std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v30 = v24 - (void)v27;
                if (v30 >> 1 > v29) {
                  unint64_t v29 = v30 >> 1;
                }
                if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v31 = v29;
                }
                if (v31)
                {
                  uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v25, v31);
                  unint64_t v22 = *v23;
                  v27 = *(float **)v20;
                }
                else
                {
                  uint64_t v32 = 0;
                }
                float v33 = (float *)&v32[4 * v28];
                *float v33 = v21;
                int v26 = v33 + 1;
                while (v22 != v27)
                {
                  int v34 = *((_DWORD *)v22-- - 1);
                  *((_DWORD *)v33-- - 1) = v34;
                }
                *(void *)uint64_t v20 = v33;
                void *v23 = v26;
                *uint64_t v25 = &v32[4 * v31];
                if (v27) {
                  operator delete(v27);
                }
              }
              else
              {
                *unint64_t v22 = v21;
                int v26 = v22 + 1;
              }
              void *v23 = v26;
              ++v16;
            }
            while (v16 != v61);
          }
          ++v15;
        }
        while (v15 != v60);
      }
    }
    if (v64 == v63)
    {
      uint64_t v35 = 0;
    }
    else
    {
      v66 = 0;
      LODWORD(v14) = 1060320051;
      int v39 = [a1 characterCentroidsFromActivationMap:&v63 codeMap:a4 potentialPatterns:&unk_26C7C56B8 minWordLengthFractionForCorrelationPeak:&v66 bestModelIndex:v14];
      uint64_t v40 = MEMORY[0x263EFFA68];
      if (v39
        && ([&unk_26C7C56B8 objectAtIndexedSubscript:v66],
            id v41 = objc_claimAutoreleasedReturnValue(),
            [a1 decodeStringWithCentroids:v39 activationMap:&v63 codeMap:a4 model:v41],
            id v42 = objc_claimAutoreleasedReturnValue(),
            v41,
            v42))
      {
        id v43 = (void *)[NSString _newZStringWithString:v42];
        v71[0] = v43;
        v71[1] = v39;
        id v44 = [NSNumber numberWithUnsignedInteger:0xAAAAAAAAAAAAAAABLL * ((v64 - v63) >> 3)];
        v71[2] = v44;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:3];
      }
      else
      {
        v72[0] = &stru_26C7BF850;
        v72[1] = v40;
        id v43 = [NSNumber numberWithUnsignedInteger:0xAAAAAAAAAAAAAAABLL * ((v64 - v63) >> 3)];
        v72[2] = v43;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:3];
        id v42 = 0;
      }

      uint64_t v62 = 0;
      LODWORD(v46) = 1050253722;
      uint64_t v47 = [a1 characterCentroidsFromActivationMap:&v63 codeMap:a4 potentialPatterns:&unk_26C7C56D0 minWordLengthFractionForCorrelationPeak:&v62 bestModelIndex:v46];
      if (v47
        && ([&unk_26C7C56D0 objectAtIndexedSubscript:v62],
            uint64_t v48 = objc_claimAutoreleasedReturnValue(),
            [a1 decodeStringWithCentroids:v47 activationMap:&v63 codeMap:a4 model:v48],
            uint64_t v49 = objc_claimAutoreleasedReturnValue(),
            v48,
            v49))
      {
        v50 = (void *)[v47 mutableCopy];
        for (unint64_t i = 0; i < [v47 count]; ++i)
        {
          v52 = NSNumber;
          uint64_t v53 = [v50 objectAtIndexedSubscript:i];
          v54 = objc_msgSend(v52, "numberWithInteger:", 2 * objc_msgSend(v53, "integerValue"));
          [v50 setObject:v54 atIndexedSubscript:i];
        }
        v69[0] = v49;
        v69[1] = v50;
        long long v56 = [NSNumber numberWithUnsignedInteger:0x5555555555555556 * ((v64 - v63) >> 3)];
        v69[2] = v56;
        v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:3];
      }
      else
      {
        v70[0] = &stru_26C7BF850;
        v70[1] = v40;
        v50 = [NSNumber numberWithUnsignedInteger:0xAAAAAAAAAAAAAAABLL * ((v64 - v63) >> 3)];
        v70[2] = v50;
        v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:3];
        uint64_t v49 = 0;
      }

      v67[0] = @"CardNumber";
      v67[1] = @"Expiration";
      v68[0] = v45;
      v68[1] = v55;
      uint64_t v35 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
    }
    v66 = (void **)&v63;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v66);
  }
  else
  {
    uint64_t v35 = 0;
  }
  return v35;
}

+ (void)extractActivationSignals:(void *)a3 fromActivationMap:(const void *)a4 forModel:(id)a5 codeMap:(const int *)a6
{
  id v9 = a5;
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    id v51 = v9;
    v55 = [v9 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    unint64_t v10 = 0;
    uint64_t v52 = **(void **)a4;
    uint64_t v53 = *(void *)(*(void *)a4 + 8);
    int v11 = (char *)a3 + 8;
    if ((unint64_t)((v53 - v52) >> 2) <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (v53 - v52) >> 2;
    }
    while (v10 < [v55 length])
    {
      uint64_t v13 = [v55 characterAtIndex:v10];
      uint64_t v14 = v13;
      uint64_t v15 = *v11;
      if (!*v11) {
        goto LABEL_16;
      }
      uint64_t v16 = v11;
      do
      {
        int v17 = *(_DWORD *)(v15 + 32);
        BOOL v18 = v17 < (int)v13;
        if (v17 >= (int)v13) {
          uint64_t v19 = (uint64_t *)v15;
        }
        else {
          uint64_t v19 = (uint64_t *)(v15 + 8);
        }
        if (!v18) {
          uint64_t v16 = (void *)v15;
        }
        uint64_t v15 = *v19;
      }
      while (*v19);
      if (v16 == v11 || *((_DWORD *)v16 + 8) > (int)v13)
      {
LABEL_16:
        uint64_t v62 = 0;
        uint64_t v63 = 0;
        unint64_t v64 = 0;
        if (v53 != v52)
        {
          uint64_t v20 = 0;
          do
          {
            if ([a1 matchLabel:a6[v20] toModelCharacter:v14])
            {
              float v21 = v63;
              if ((unint64_t)v63 >= v64)
              {
                float v23 = v62;
                uint64_t v24 = (v63 - v62) >> 2;
                unint64_t v25 = v24 + 1;
                if ((unint64_t)(v24 + 1) >> 62) {
                  std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v26 = v64 - (void)v62;
                if ((uint64_t)(v64 - (void)v62) >> 1 > v25) {
                  unint64_t v25 = v26 >> 1;
                }
                if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v27 = v25;
                }
                if (v27)
                {
                  uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v64, v27);
                  float v23 = v62;
                  float v21 = v63;
                }
                else
                {
                  uint64_t v28 = 0;
                }
                unint64_t v29 = &v28[4 * v24];
                *(_DWORD *)unint64_t v29 = v20;
                unint64_t v22 = v29 + 4;
                while (v21 != v23)
                {
                  int v30 = *((_DWORD *)v21 - 1);
                  v21 -= 4;
                  *((_DWORD *)v29 - 1) = v30;
                  v29 -= 4;
                }
                uint64_t v62 = v29;
                uint64_t v63 = v22;
                unint64_t v64 = (unint64_t)&v28[4 * v27];
                if (v23) {
                  operator delete(v23);
                }
              }
              else
              {
                *(_DWORD *)uint64_t v63 = v20;
                unint64_t v22 = v21 + 4;
              }
              uint64_t v63 = v22;
            }
            ++v20;
          }
          while (v20 != v12);
        }
        unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
        int v56 = 0;
        std::vector<float>::vector(&v60, v31, &v56);
        uint64_t v32 = *(uint64_t **)a4;
        uint64_t v33 = *((void *)a4 + 1);
        int v34 = (float *)v60;
        uint64_t v35 = v33 - *(void *)a4;
        if (v33 != *(void *)a4)
        {
          uint64_t v36 = 0;
          unint64_t v37 = v35 / 24;
          uint64_t v38 = (int *)v62;
          int v39 = (int *)v63;
          if (v37 <= 1) {
            unint64_t v37 = 1;
          }
          do
          {
            if (v38 != v39)
            {
              uint64_t v40 = v32[3 * v36];
              float v41 = v34[v36];
              id v42 = v38;
              do
              {
                uint64_t v43 = *v42++;
                float v41 = v41 + *(float *)(v40 + 4 * v43);
                v34[v36] = v41;
              }
              while (v42 != v39);
            }
            ++v36;
          }
          while (v36 != v37);
        }
        int v56 = v14;
        long long v58 = 0;
        uint64_t v59 = 0;
        __p = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v34, (uint64_t)v61, (v61 - (unsigned char *)v34) >> 2);
        std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)a3, v56, (uint64_t)&v56);
        int v11 = (char *)a3 + 8;
        if (__p)
        {
          long long v58 = __p;
          operator delete(__p);
        }
        if (v60)
        {
          unint64_t v61 = v60;
          operator delete(v60);
        }
        if (v62)
        {
          uint64_t v63 = v62;
          operator delete(v62);
        }
      }
      ++v10;
    }
    if (v53 == v52)
    {
LABEL_55:
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v44 = 0;
      while (a6[v44] != 103)
      {
        if (v12 == ++v44) {
          goto LABEL_55;
        }
      }
    }
    std::vector<float>::vector(&v62, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3));
    v45 = *(uint64_t **)a4;
    double v46 = v62;
    uint64_t v47 = *((void *)a4 + 1) - *(void *)a4;
    if (v47)
    {
      unint64_t v48 = v47 / 24;
      if (v48 <= 1) {
        unint64_t v48 = 1;
      }
      uint64_t v49 = (float *)v62;
      do
      {
        uint64_t v50 = *v45;
        v45 += 3;
        *v49++ = 1.0 - *(float *)(v50 + 4 * v44);
        --v48;
      }
      while (v48);
    }
    int v56 = -1;
    long long v58 = 0;
    uint64_t v59 = 0;
    __p = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v46, (uint64_t)v63, (v63 - v46) >> 2);
    std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)a3, v56, (uint64_t)&v56);
    if (__p)
    {
      long long v58 = __p;
      operator delete(__p);
    }
    if (v62)
    {
      uint64_t v63 = v62;
      operator delete(v62);
    }

    id v9 = v51;
  }
}

+ (BOOL)matchLabel:(int)a3 toModelCharacter:(unsigned __int16)a4
{
  BOOL v4 = a4 == a3;
  if (a4 == 64) {
    BOOL v4 = (a3 - 58) < 0xFFFFFFF6;
  }
  BOOL v5 = a4 == 63 || v4;
  if (a4 == 35) {
    BOOL v5 = (a3 - 48) < 0xA;
  }
  return a3 != 103 && v5;
}

+ (id)fitSpacingModel:(id)a3 toActivationMap:(const void *)a4 codeMap:(const int *)a5 minWordLengthFractionForCorrelationPeak:(float)a6 cost:(float *)a7
{
  v242 = a7;
  v287[16] = *MEMORY[0x263EF8340];
  id v244 = a3;
  id v253 = a1;
  v249 = a4;
  id v11 = [a1 characterCentroidsFromActivationMap:a4 codeMap:a5 decodedSymbolIndexes:0];
  if ((unint64_t)[v11 count] < 2)
  {
    id v12 = 0;
    goto LABEL_297;
  }
  v252 = a5;
  std::vector<int>::vector(&v286, [v11 count] - 1);
  for (uint64_t i = 0; i + 1 < (unint64_t)[v11 count]; ++i)
  {
    uint64_t v14 = [v11 objectAtIndexedSubscript:i];
    int v15 = [v14 intValue];

    uint64_t v16 = [v11 objectAtIndexedSubscript:i + 1];
    LODWORD(v14) = [v16 intValue];

    v286.__begin_[i] = v14 - v15;
  }
  v284 = 0;
  v285 = 0;
  v280 = 0;
  v281 = 0;
  v282 = 0;
  v283 = 0;
  std::vector<int>::pointer begin = v286.__begin_;
  if (v286.__end_ != v286.__begin_)
  {
    BOOL v18 = 0;
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    v254 = &v282;
    LODWORD(v255) = -1;
    while (1)
    {
      id v21 = v11;
      int v22 = begin[v20];
      if (v281 == v19) {
        break;
      }
      uint64_t v23 = 0;
      unint64_t v24 = v281 - v19;
      if (v24 <= 1) {
        unint64_t v24 = 1;
      }
      int v25 = -1;
      float v26 = INFINITY;
      do
      {
        float v27 = vabds_f32(v19[v23], (float)v22);
        if (v27 < 4.0 && v27 < v26)
        {
          float v26 = v27;
          int v25 = v23;
        }
        ++v23;
      }
      while (v24 != v23);
      if (v25 < 0) {
        break;
      }
      uint64_t v28 = &v18[24 * v25];
      int v30 = (int **)(v28 + 8);
      unint64_t v29 = (int *)*((void *)v28 + 1);
      unint64_t v31 = *((void *)v28 + 2);
      if ((unint64_t)v29 >= v31)
      {
        id v51 = *(int **)v28;
        uint64_t v52 = ((uint64_t)v29 - *(void *)v28) >> 2;
        unint64_t v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 62) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v54 = v31 - (void)v51;
        if (v54 >> 1 > v53) {
          unint64_t v53 = v54 >> 1;
        }
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v55 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v55 = v53;
        }
        if (v55)
        {
          int v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v28 + 16), v55);
          unint64_t v29 = *v30;
          id v51 = *(int **)v28;
        }
        else
        {
          int v56 = 0;
        }
        v67 = (int *)&v56[4 * v52];
        int *v67 = v22;
        uint64_t v32 = v67 + 1;
        while (v29 != v51)
        {
          int v68 = *--v29;
          *--v67 = v68;
        }
        *(void *)uint64_t v28 = v67;
        *int v30 = v32;
        *((void *)v28 + 2) = &v56[4 * v55];
        if (v51) {
          operator delete(v51);
        }
      }
      else
      {
        int *v29 = v22;
        uint64_t v32 = v29 + 1;
      }
      *int v30 = v32;
      BOOL v18 = v283;
      id v11 = v21;
LABEL_70:
      v69 = (int **)&v18[24 * v25];
      v70 = *v69;
      uint64_t v72 = (char *)v69[1] - (char *)*v69;
      BOOL v71 = v72 == 0;
      unint64_t v73 = v72 >> 2;
      if (v71)
      {
        float v75 = 0.0;
      }
      else
      {
        if (v73 <= 1) {
          uint64_t v74 = 1;
        }
        else {
          uint64_t v74 = v73;
        }
        float v75 = 0.0;
        do
        {
          int v76 = *v70++;
          float v75 = v75 + (float)v76;
          --v74;
        }
        while (v74);
      }
      float v77 = v75 / (float)v73;
      uint64_t v19 = v280;
      v280[v25] = v77;
      ++v20;
      std::vector<int>::pointer begin = v286.__begin_;
      if (v20 >= v286.__end_ - v286.__begin_)
      {
        v78 = v284;
        goto LABEL_81;
      }
    }
    uint64_t v33 = operator new(4uLL);
    int v34 = v33;
    *uint64_t v33 = v22;
    unint64_t v35 = (unint64_t)(v33 + 1);
    uint64_t v36 = v284;
    if (v284 < v285)
    {
      *(void *)v284 = v33;
      *((void *)v36 + 1) = v35;
      unint64_t v37 = v36 + 24;
      *((void *)v36 + 2) = v35;
      id v11 = v21;
LABEL_46:
      v284 = v37;
      long long v57 = v281;
      if (v281 >= v282)
      {
        uint64_t v59 = v280;
        uint64_t v60 = v281 - v280;
        unint64_t v61 = v60 + 1;
        if ((unint64_t)(v60 + 1) >> 62) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v62 = (char *)v282 - (char *)v280;
        if (((char *)v282 - (char *)v280) >> 1 > v61) {
          unint64_t v61 = v62 >> 1;
        }
        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v63 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v63 = v61;
        }
        if (v63)
        {
          unint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v254, v63);
          uint64_t v59 = v280;
          long long v57 = v281;
        }
        else
        {
          unint64_t v64 = 0;
        }
        uint64_t v65 = (float *)&v64[4 * v60];
        *uint64_t v65 = 0.0;
        long long v58 = v65 + 1;
        while (v57 != v59)
        {
          int v66 = *((_DWORD *)v57-- - 1);
          *((_DWORD *)v65-- - 1) = v66;
        }
        v280 = v65;
        v281 = v58;
        v282 = (float *)&v64[4 * v63];
        if (v59) {
          operator delete(v59);
        }
      }
      else
      {
        float *v281 = 0.0;
        long long v58 = v57 + 1;
      }
      v281 = v58;
      BOOL v18 = v283;
      int v25 = v255 - 1431655765 * ((unint64_t)(v284 - v283) >> 3);
      goto LABEL_70;
    }
    unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * ((v284 - v18) >> 3);
    unint64_t v39 = v38 + 1;
    if (v38 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * ((v285 - v18) >> 3) > v39) {
      unint64_t v39 = 0x5555555555555556 * ((v285 - v18) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v285 - v18) >> 3) >= 0x555555555555555) {
      unint64_t v40 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v40 = v39;
    }
    float v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v40);
    uint64_t v43 = &v41[24 * v38];
    *((void *)v43 + 1) = 0;
    *((void *)v43 + 2) = 0;
    *(void *)uint64_t v43 = v34;
    *(int64x2_t *)(v43 + 8) = vdupq_n_s64(v35);
    unint64_t v37 = v43 + 24;
    uint64_t v44 = v283;
    v45 = v284;
    if (v284 == v283)
    {
      v283 = v43;
      v284 = v43 + 24;
      v285 = &v41[24 * v42];
    }
    else
    {
      do
      {
        *((void *)v43 - 3) = 0;
        *((void *)v43 - 2) = 0;
        v43 -= 24;
        *((void *)v43 + 2) = 0;
        long long v46 = *(_OWORD *)(v45 - 24);
        v45 -= 24;
        *(_OWORD *)uint64_t v43 = v46;
        *((void *)v43 + 2) = *((void *)v45 + 2);
        *(void *)v45 = 0;
        *((void *)v45 + 1) = 0;
        *((void *)v45 + 2) = 0;
      }
      while (v45 != v44);
      v45 = v283;
      uint64_t v47 = v284;
      v283 = v43;
      v284 = v37;
      v285 = &v41[24 * v42];
      if (v47 != v45)
      {
        unint64_t v48 = v47;
        do
        {
          uint64_t v50 = (void *)*((void *)v48 - 3);
          v48 -= 24;
          uint64_t v49 = v50;
          if (v50)
          {
            *((void *)v47 - 2) = v49;
            operator delete(v49);
          }
          uint64_t v47 = v48;
        }
        while (v48 != v45);
        id v11 = v21;
        if (!v45) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
    }
    id v11 = v21;
    if (!v45) {
      goto LABEL_46;
    }
LABEL_45:
    operator delete(v45);
    goto LABEL_46;
  }
  BOOL v18 = 0;
  v78 = 0;
LABEL_81:
  LODWORD(v79) = -1431655765 * ((v78 - v18) >> 3);
  if ((int)v79 < 1)
  {
    float v82 = 0.0;
  }
  else
  {
    v80 = v280;
    uint64_t v79 = v79;
    v81 = v18 + 8;
    float v82 = 0.0;
    LODWORD(v83) = 0x80000000;
    do
    {
      if ((int)v83 < (int)((*v81 - *(v81 - 1)) >> 2))
      {
        float v82 = *v80;
        uint64_t v83 = (*v81 - *(v81 - 1)) >> 2;
      }
      ++v80;
      v81 += 3;
      --v79;
    }
    while (v79);
  }
  v278 = 0;
  uint64_t v279 = 0;
  v277 = &v278;
  id v84 = v253;
  id v253 = v11;
  v254 = &v278;
  [v84 extractActivationSignals:&v277 fromActivationMap:v249 forModel:v244 codeMap:v252];
  if (!v279)
  {
    id v12 = 0;
    goto LABEL_293;
  }
  id v241 = [v244 componentsSeparatedByString:@" "];
  unint64_t v85 = [v241 count];
  unint64_t v86 = v85;
  v274 = 0;
  v275 = 0;
  v276 = 0;
  v257 = &v274;
  LOBYTE(v258) = 0;
  if (v85)
  {
    if (v85 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v85);
    v274 = v87;
    v276 = &v87[24 * v88];
    size_t v89 = 24 * ((24 * v86 - 24) / 0x18) + 24;
    bzero(v87, v89);
    v275 = &v87[v89];
  }
  unint64_t v90 = [v241 count];
  uint64_t v271 = 0;
  v272 = 0;
  uint64_t v273 = 0;
  v257 = (char **)&v271;
  LOBYTE(v258) = 0;
  if (v90)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](&v271, v90);
    v91 = v272;
    size_t v92 = 24 * ((24 * v90 - 24) / 0x18) + 24;
    bzero(v272, v92);
    v272 = &v91[v92];
  }
  long long v267 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  long long v270 = 0u;
  id v255 = v241;
  uint64_t v93 = [v255 countByEnumeratingWithState:&v267 objects:v287 count:16];
  if (v93)
  {
    uint64_t v251 = 0;
    uint64_t v247 = *(void *)v268;
    do
    {
      v252 = 0;
      v246 = (const int *)v93;
      do
      {
        if (*(void *)v268 != v247) {
          objc_enumerationMutation(v255);
        }
        unint64_t v94 = 0;
        v95 = *(void **)(*((void *)&v267 + 1) + 8 * (void)v252);
        v265 = 0;
        uint64_t v266 = 0;
        v264 = (uint64_t *)&v265;
        while (v94 < [v95 length])
        {
          int v96 = [v95 characterAtIndex:v94];
          int v97 = v96;
          v98 = v265;
          if (!v265) {
            goto LABEL_110;
          }
          v99 = &v265;
          do
          {
            v100 = v98;
            v101 = v99;
            int v102 = *((_DWORD *)v98 + 8);
            v103 = (uint64_t **)(v98 + 1);
            if (v102 >= v96)
            {
              v103 = (uint64_t **)v100;
              v99 = (uint64_t **)v100;
            }
            v98 = *v103;
          }
          while (v98);
          if (v99 == &v265) {
            goto LABEL_110;
          }
          if (v102 < v96) {
            v100 = (uint64_t *)v101;
          }
          if (*((_DWORD *)v100 + 8) > v96)
          {
LABEL_110:
            uint64_t v104 = [v95 length];
            LODWORD(v257) = 0;
            std::vector<float>::vector(&v261, (unint64_t)(float)((float)((float)(unint64_t)(v104 + 1) * v82) + 1.0), &v257);
            for (unint64_t j = 0; [v95 length] + 2 > j; ++j)
            {
              if (j)
              {
                if (j != [v95 length] + 1
                  && [v95 characterAtIndex:j - 1] == v97)
                {
                  unint64_t v106 = (int)(float)((float)((float)(int)j * v82) + 0.0);
                  if ((v106 & 0x80000000) == 0 && v106 < v262 - v261) {
                    v261[v106] = 1.0;
                  }
                }
              }
            }
            LODWORD(v257) = v97;
            v259 = 0;
            uint64_t v260 = 0;
            v258 = 0;
            std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v258, v261, (uint64_t)v262, v262 - v261);
            std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)&v264, (int)v257, (uint64_t)&v257);
            if (v258)
            {
              v259 = v258;
              operator delete(v258);
            }
            if (v261)
            {
              v262 = v261;
              operator delete(v261);
            }
          }
          ++v94;
        }
        uint64_t v107 = [v95 length];
        LODWORD(v257) = 0;
        std::vector<float>::vector(&v261, (unint64_t)(float)((float)((float)(unint64_t)(v107 + 1) * v82) + 1.0), &v257);
        if (v262 != v261) {
          float *v261 = -1.0;
        }
        uint64_t v108 = (int)(float)((float)((float)(unint64_t)([v95 length] + 1) * v82) + 0.0);
        v109 = v261;
        uint64_t v110 = (uint64_t)v262;
        if ((v108 & 0x80000000) != 0)
        {
          unint64_t v111 = v262 - v261;
        }
        else
        {
          unint64_t v111 = v262 - v261;
          if (v111 > v108) {
            v261[v108] = -1.0;
          }
        }
        LODWORD(v257) = -1;
        v259 = 0;
        uint64_t v260 = 0;
        v258 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v258, v109, v110, v111);
        std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)&v264, (int)v257, (uint64_t)&v257);
        if (v258)
        {
          v259 = v258;
          operator delete(v258);
        }
        unint64_t v112 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v249[1] - *v249) >> 3);
        int v256 = 0;
        std::vector<float>::vector(&v257, v112, &v256);
        v113 = v277;
        if (v277 == v254)
        {
          BOOL v126 = 1;
        }
        else
        {
          do
          {
            v114 = v265;
            v115 = &v265;
            v116 = &v265;
            if (v265)
            {
              int v117 = *((_DWORD *)v113 + 8);
              do
              {
                while (1)
                {
                  v116 = (uint64_t **)v114;
                  int v118 = *((_DWORD *)v114 + 8);
                  if (v118 <= v117) {
                    break;
                  }
                  v114 = *v116;
                  v115 = v116;
                  if (!*v116) {
                    goto LABEL_142;
                  }
                }
                if (v118 >= v117)
                {
                  v120 = v116;
                  goto LABEL_145;
                }
                v114 = v116[1];
              }
              while (v114);
              v115 = v116 + 1;
            }
LABEL_142:
            v120 = operator new(0x40uLL);
            v120[8] = *((_DWORD *)v113 + 8);
            *((void *)v120 + 6) = 0;
            *((void *)v120 + 7) = 0;
            *((void *)v120 + 5) = 0;
            *(void *)v120 = 0;
            *((void *)v120 + 1) = 0;
            *((void *)v120 + 2) = v116;
            *v115 = (uint64_t *)v120;
            v119 = (uint64_t *)v120;
            if (*v264)
            {
              v264 = (uint64_t *)*v264;
              v119 = *v115;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v265, v119);
            ++v266;
LABEL_145:
            v121 = (float *)v113[5];
            unint64_t v122 = (uint64_t)(v113[6] - (void)v121) >> 2;
            v124 = (float *)*((void *)v120 + 5);
            v123 = (float *)*((void *)v120 + 6);
            uint64_t v125 = (char *)v123 - (char *)v124;
            BOOL v126 = v122 >= v123 - v124;
            if (v122 < v123 - v124) {
              break;
            }
            unint64_t v127 = v125 >> 2;
            unint64_t v128 = v122 + 1;
            unint64_t v129 = v128 - (v125 >> 2);
            if (v128 != v125 >> 2)
            {
              uint64_t v130 = 0;
              unint64_t v131 = v127 >> 1;
              v132 = (void **)v257;
              if (v127 <= 1) {
                unint64_t v127 = 1;
              }
              if (v129 <= 1) {
                unint64_t v129 = 1;
              }
              do
              {
                float v133 = 0.0;
                if (v123 != v124)
                {
                  v134 = v121;
                  v135 = v124;
                  unint64_t v136 = v127;
                  do
                  {
                    float v137 = *v134++;
                    float v138 = v137;
                    float v139 = *v135++;
                    float v133 = v133 + (float)(v138 * v139);
                    --v136;
                  }
                  while (v136);
                }
                *((float *)v132 + v130 + v131) = v133 + *((float *)v132 + v130 + v131);
                ++v130;
                ++v121;
              }
              while (v130 != v129);
            }
            v140 = (void *)v113[1];
            if (v140)
            {
              do
              {
                v141 = v140;
                v140 = (void *)*v140;
              }
              while (v140);
            }
            else
            {
              do
              {
                v141 = (void *)v113[2];
                BOOL v71 = *v141 == (void)v113;
                v113 = v141;
              }
              while (!v71);
            }
            v113 = v141;
          }
          while (v141 != v254);
        }
        v142 = (char *)(v271 + 24 * (int)v251);
        v143 = (void **)v257;
        if (v142 != (char *)&v257)
        {
          std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v142, (char *)v257, (uint64_t)v258, ((char *)v258 - (char *)v257) >> 2);
          v143 = (void **)v257;
        }
        if (v126)
        {
          int v144 = v251;
          v145 = v274;
          v146 = (void **)&v274[24 * (int)v251];
          if ((unint64_t)((((char *)v258 - (char *)v143) >> 2) - 7) <= 0xFFFFFFFFFFFFFFFBLL)
          {
            v147 = &v274[24 * (int)v251];
            v250 = (char **)(v147 + 8);
            v248 = (uint64_t *)(v147 + 16);
            uint64_t v148 = 4;
            unint64_t v149 = 3;
            uint64_t v245 = (int)v251;
            do
            {
              unint64_t v150 = [v95 length];
              v151 = (void **)v257;
              float v152 = *((float *)v257 + v149);
              if (v152 > (float)((float)v150 * a6) && v152 > *((float *)v257 + v149 - 3) && v152 > *((float *)v257 + 3))
              {
                uint64_t v153 = 0;
                while (v152 >= *(float *)((char *)v257 + v148 + v153))
                {
                  v153 += 4;
                  if (v153 == 20)
                  {
                    v154 = *v250;
                    uint64_t v155 = *v248;
                    if ((unint64_t)*v250 >= *v248)
                    {
                      v157 = (char *)*v146;
                      uint64_t v243 = (v154 - (unsigned char *)*v146) >> 2;
                      unint64_t v158 = v243 + 1;
                      if ((unint64_t)(v243 + 1) >> 62) {
                        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                      }
                      uint64_t v159 = v155 - (void)v157;
                      if (v159 >> 1 > v158) {
                        unint64_t v158 = v159 >> 1;
                      }
                      if ((unint64_t)v159 >= 0x7FFFFFFFFFFFFFFCLL) {
                        unint64_t v160 = 0x3FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v160 = v158;
                      }
                      if (v160)
                      {
                        v161 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v248, v160);
                        v154 = *v250;
                        v157 = (char *)*v146;
                      }
                      else
                      {
                        v161 = 0;
                      }
                      v162 = &v161[4 * v243];
                      *(_DWORD *)v162 = v149;
                      v156 = v162 + 4;
                      while (v154 != v157)
                      {
                        int v163 = *((_DWORD *)v154 - 1);
                        v154 -= 4;
                        *((_DWORD *)v162 - 1) = v163;
                        v162 -= 4;
                      }
                      *v146 = v162;
                      *v250 = v156;
                      uint64_t *v248 = (uint64_t)&v161[4 * v160];
                      if (v157) {
                        operator delete(v157);
                      }
                    }
                    else
                    {
                      *(_DWORD *)v154 = v149;
                      v156 = v154 + 4;
                    }
                    *v250 = v156;
                    v151 = (void **)v257;
                    int v144 = v245;
                    break;
                  }
                }
              }
              ++v149;
              v148 += 4;
            }
            while ((((char *)v258 - (char *)v151) >> 2) - 3 > v149);
          }
          v164 = [MEMORY[0x263EFF980] array];
          v165 = &v145[24 * v144];
          v167 = (void *)*((void *)v165 + 1);
          v166 = v165 + 8;
          v168 = (unsigned int *)*v146;
          if (v167 != *v146)
          {
            unint64_t v169 = 0;
            do
            {
              v170 = [NSNumber numberWithInt:v168[v169]];
              [v164 addObject:v170];

              ++v169;
              v168 = (unsigned int *)*v146;
            }
            while (v169 < (uint64_t)(*v166 - (void)*v146) >> 2);
          }
          id v171 = v164;

          uint64_t v251 = (v251 + 1);
          v143 = (void **)v257;
          id v253 = v171;
        }
        if (v143)
        {
          v258 = v143;
          operator delete(v143);
        }
        if (v261)
        {
          v262 = v261;
          operator delete(v261);
        }
        std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v265);
        if (!v126)
        {

          id v12 = 0;
          goto LABEL_292;
        }
        v252 = (const int *)((char *)v252 + 1);
      }
      while (v252 != v246);
      uint64_t v93 = [v255 countByEnumeratingWithState:&v267 objects:v287 count:16];
    }
    while (v93);
  }

  id v172 = v255;
  [v255 count];
  v252 = (const int *)&v241;
  MEMORY[0x270FA5388]();
  v174 = (_DWORD *)((char *)&v241 - ((v173 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v174, v173);
  id v175 = v253;
  unint64_t v176 = [v172 count];
  LODWORD(v264) = -1082130432;
  std::vector<float>::vector(&v257, v176, &v264);
  v254 = [MEMORY[0x263EFF910] date];
  float v177 = INFINITY;
  id v253 = v175;
  do
  {
    if ((unint64_t)[v255 count] < 2)
    {
      float v192 = 0.0;
      int v193 = -1;
      goto LABEL_247;
    }
    id v178 = v175;
    std::vector<float>::vector(&v264, [v255 count] - 1);
    uint64_t v179 = 0;
    unint64_t v180 = 0;
    uint64_t v181 = -2;
    while ([v255 count] - 1 > v180)
    {
      v182 = &v274[v179];
      if (*(void *)&v274[v179 + 8] == *(void *)&v274[v179] || *((void *)v182 + 4) == *((void *)v182 + 3))
      {
        *((_DWORD *)v264 + v180) = 2139095040;
      }
      else
      {
        id v183 = v255;
        int v184 = *(_DWORD *)(*(void *)v182 + 4 * (int)v174[v181 + 1 + [v255 count]]);
        int v185 = *(_DWORD *)(*((void *)v182 + 3) + 4 * (int)v174[v181 + [v183 count]]);
        v186 = [v183 objectAtIndexedSubscript:v180];
        v187 = [v183 objectAtIndexedSubscript:v180 + 1];
        uint64_t v188 = [v186 length];
        uint64_t v189 = [v187 length];
        float v190 = (double)v184 + (float)(v82 * (float)(unint64_t)(v188 - 1)) * 0.5;
        float v191 = (double)v185 - (float)(v82 * (float)(unint64_t)(v189 - 1)) * 0.5;
        *((float *)v264 + v180) = v191 - v190;

        id v178 = v253;
      }
      --v181;
      v179 += 24;
      ++v180;
    }
    v194 = v264;
    v195 = v265;
    uint64_t v196 = (char *)v265 - (char *)v264;
    if ((int)((unint64_t)((char *)v265 - (char *)v264) >> 2) < 1)
    {
      int v193 = -1;
      id v175 = v178;
    }
    else
    {
      uint64_t v197 = 0;
      int v198 = -1;
      id v175 = v178;
      while (1)
      {
        float v199 = *(float *)((char *)v264 + v197);
        if (v199 != INFINITY && (v199 < v82 || v199 > (float)(v82 * 6.0))) {
          break;
        }
        --v198;
        v197 += 4;
        if ((v196 & 0x3FFFFFFFCLL) == v197)
        {
          int v193 = -1;
          goto LABEL_224;
        }
      }
      int v209 = [v255 count];
      int v193 = v209 + v198 - 1;
      float v192 = 0.0;
      v194 = v264;
      if (v209 + v198 > 0) {
        goto LABEL_245;
      }
      v195 = v265;
      uint64_t v196 = (char *)v265 - (char *)v264;
    }
LABEL_224:
    v261 = 0;
    v262 = 0;
    uint64_t v263 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v261, v194, (uint64_t)v195, v196 >> 2);
    std::__sort<std::__less<float,float> &,float *>();
    v201 = v262;
    v202 = (char *)v261;
    if (v262 != v261)
    {
      v202 = (char *)v262;
      while (1)
      {
        float v203 = *--v201;
        if (v203 != INFINITY) {
          break;
        }
        v202 = (char *)v201;
        if (v201 == v261)
        {
          v202 = (char *)v261;
          break;
        }
      }
    }
    v194 = v264;
    unint64_t v204 = (char *)v265 - (char *)v264;
    if (v265 == v264)
    {
      float v207 = INFINITY;
    }
    else
    {
      if ((int)(v204 >> 2) < 1)
      {
        float v192 = INFINITY;
LABEL_244:
        v262 = v261;
        operator delete(v261);
        v194 = v264;
        goto LABEL_245;
      }
      float v205 = *(float *)((char *)v261 + (((v202 - (char *)v261) >> 1) & 0xFFFFFFFFFFFFFFFCLL));
      uint64_t v206 = (v204 >> 2);
      float v207 = INFINITY;
      v208 = (float *)v264;
      do
      {
        if (*v208 != INFINITY)
        {
          if (v207 == INFINITY) {
            float v207 = 0.0;
          }
          float v207 = v207 + (float)((float)(*v208 - v205) * (float)(*v208 - v205));
          if (v207 > v177) {
            break;
          }
        }
        ++v208;
        --v206;
      }
      while (v206);
    }
    float v192 = v207 + 0.0;
    if (v261) {
      goto LABEL_244;
    }
LABEL_245:
    if (v194)
    {
      v265 = v194;
      operator delete(v194);
    }
LABEL_247:
    if (v193 < 0 && v192 != INFINITY)
    {
      uint64_t v210 = 0;
      unint64_t v211 = 0;
      uint64_t v212 = -1;
      while (v211 < [v255 count])
      {
        v213 = &v274[v210];
        if (*(void *)&v274[v210 + 8] != *(void *)&v274[v210])
        {
          id v214 = v255;
          uint64_t v215 = [v255 count];
          float v216 = *(float *)(*(void *)(v271 + v210) + 4 * *(int *)(*(void *)v213 + 4 * (int)v174[v212 + v215]));
          v217 = [v214 objectAtIndexedSubscript:v211];
          unint64_t v218 = [v217 length];

          float v192 = v192 + (float)((float)v218 - v216);
        }
        ++v211;
        v210 += 24;
        --v212;
      }
      id v175 = v253;
    }
    if (v193 < 0 && v192 < v177)
    {
      uint64_t v219 = 0;
      unint64_t v220 = 0;
      uint64_t v221 = -1;
      while ([v255 count] > v220)
      {
        v222 = &v274[v219];
        if (*(void *)&v274[v219 + 8] != *(void *)&v274[v219])
        {
          uint64_t v223 = [v255 count];
          *((float *)v257 + v220) = (float)*(int *)(*(void *)v222 + 4 * (int)v174[v221 + v223]);
        }
        ++v220;
        v219 += 24;
        --v221;
      }
      float v177 = v192;
      id v175 = v253;
    }
    if (v193 >= 1)
    {
      uint64_t v224 = v193;
      v225 = v274 + 8;
      v226 = v174;
      do
      {
        *v226++ = ((*v225 - *(v225 - 1)) >> 2) - 1;
        v225 += 3;
        --v224;
      }
      while (v224);
    }
    uint64_t v227 = 0;
    unint64_t v228 = 0;
    ++*v174;
    char v229 = 1;
    while ([v255 count] > v228)
    {
      if ((int)v174[v228] >= (unint64_t)((uint64_t)(*(void *)&v274[v227 + 8] - *(void *)&v274[v227]) >> 2))
      {
        v174[v228] = 0;
        if ([v255 count] - 1 <= v228)
        {
          char v229 = 0;
        }
        else
        {
          ++v174[v228 + 1];
          char v229 = 1;
        }
      }
      ++v228;
      v227 += 24;
    }
    if ((v229 & 1) == 0) {
      break;
    }
    [v254 timeIntervalSinceNow];
  }
  while (v230 > -0.1);
  if (v177 != INFINITY)
  {
    v231 = [MEMORY[0x263EFF980] array];
    v233 = (void **)v257;
    v232 = v258;
    if (v258 != (void **)v257)
    {
      unint64_t v234 = 0;
      do
      {
        int v235 = (int)*((float *)v233 + v234);
        if ((v235 & 0x80000000) == 0)
        {
          v236 = [v255 objectAtIndexedSubscript:v234];
          for (unint64_t k = 0; [v236 length] > k; ++k)
          {
            v238 = objc_msgSend(NSNumber, "numberWithInt:", (int)((double)v235+ (float)(v82 * (float)(unint64_t)(objc_msgSend(v236, "length") - 1)) * -0.5+ (float)(v82 * (float)(int)k)));
            [v231 addObject:v238];
          }
          v233 = (void **)v257;
          v232 = v258;
        }
        ++v234;
      }
      while (v234 < ((char *)v232 - (char *)v233) >> 2);
    }
    id v175 = v231;
  }
  if (v242)
  {
    unint64_t v239 = [v244 length];
    float *v242 = v177 / (float)v239;
  }
  id v253 = v175;

  if (v257)
  {
    v258 = (void **)v257;
    operator delete(v257);
  }
  id v12 = v253;
LABEL_292:
  v257 = (char **)&v271;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v257);
  v257 = &v274;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v257);

  id v11 = v253;
LABEL_293:
  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v278);
  if (v280)
  {
    v281 = v280;
    operator delete(v280);
  }
  v257 = &v283;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v257);
  if (v286.__begin_)
  {
    v286.__end_ = v286.__begin_;
    operator delete(v286.__begin_);
  }
LABEL_297:

  return v12;
}

@end