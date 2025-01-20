@interface CSAudioZeroFilter
- (CSAudioZeroFilter)initWithZeroWindowSize:(unint64_t)a3 approxAbsSpeechThreshold:(unsigned __int16)a4 numHostTicksPerAudioSample:(double)a5;
- (id).cxx_construct;
- (id)metrics;
- (unint64_t)endAudioAndFetchAnyTrailingZerosPacket:(id *)a3;
- (unint64_t)filterZerosInAudioPacket:(id)a3 atBufferHostTime:(unint64_t)a4 filteredPacket:(id *)a5;
@end

@implementation CSAudioZeroFilter

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_audioZeroFilterImpl.__ptr_.__value_;
  self->_audioZeroFilterImpl.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<CSAudioZeroFilterImpl<unsigned short>>::operator()[abi:ne180100]((uint64_t)value);
  }
}

- (id)metrics
{
  v31[2] = *MEMORY[0x1E4F143B8];
  value = (unsigned __int8 *)self->_audioZeroFilterImpl.__ptr_.__value_;
  v3 = (void *)*((void *)value + 7);
  v4 = (void *)*((void *)value + 8);
  if (v3 == v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    v7 = 0;
    v8 = 0;
    unint64_t v9 = 0;
    int v10 = *((_DWORD *)value + 7);
    int v11 = value[24];
    do
    {
      if (!*v3) {
        uint64_t v5 = v3[1];
      }
      if (v3[1] > v6) {
        unint64_t v6 = v3[1];
      }
      if (v11 && v10 <= (int)*v3)
      {
        if ((unint64_t)v8 >= v9)
        {
          uint64_t v12 = (v8 - v7) >> 4;
          unint64_t v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) >> 60) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v9 - (void)v7) >> 3 > v13) {
            unint64_t v13 = (uint64_t)(v9 - (void)v7) >> 3;
          }
          if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v14 = v13;
          }
          if (v14) {
            unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v14);
          }
          else {
            uint64_t v15 = 0;
          }
          v16 = (_OWORD *)(v14 + 16 * v12);
          _OWORD *v16 = *(_OWORD *)v3;
          if (v8 == v7)
          {
            v18 = (char *)(v14 + 16 * v12);
          }
          else
          {
            unint64_t v17 = v14 + 16 * v12;
            do
            {
              v18 = (char *)(v17 - 16);
              *(_OWORD *)(v17 - 16) = *((_OWORD *)v8 - 1);
              v8 -= 16;
              v17 -= 16;
            }
            while (v8 != v7);
          }
          unint64_t v9 = v14 + 16 * v15;
          v8 = (char *)(v16 + 1);
          if (v7) {
            operator delete(v7);
          }
          v7 = v18;
        }
        else
        {
          *(_OWORD *)v8 = *(_OWORD *)v3;
          v8 += 16;
        }
      }
      v3 += 2;
    }
    while (v3 != v4);
  }
  v27 = [MEMORY[0x1E4F1CA48] array];
  if (v7 != v8)
  {
    v19 = v7;
    do
    {
      v30[0] = @"start";
      v20 = [NSNumber numberWithUnsignedLong:*(void *)v19];
      v30[1] = @"len";
      v31[0] = v20;
      v21 = [NSNumber numberWithUnsignedLong:*((void *)v19 + 1)];
      v31[1] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
      [v27 addObject:v22];

      v19 += 16;
    }
    while (v19 != v8);
  }
  v28[0] = @"CSInitialContinuousZeros";
  v23 = [NSNumber numberWithUnsignedLong:v5];
  v29[0] = v23;
  v28[1] = @"CSMaxContinuousZeros";
  v24 = [NSNumber numberWithUnsignedLong:v6];
  v28[2] = @"CSMidSegmentContinuousZeros";
  v29[1] = v24;
  v29[2] = v27;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

  if (v7) {
    operator delete(v7);
  }
  return v25;
}

- (unint64_t)endAudioAndFetchAnyTrailingZerosPacket:(id *)a3
{
  if (!a3) {
    return 0;
  }
  value = (unint64_t *)self->_audioZeroFilterImpl.__ptr_.__value_;
  unint64_t v5 = value[2];
  if (v5 >= *value)
  {
    unint64_t v14 = value[5] - v5;
    v16 = (unint64_t *)value[8];
    unint64_t v15 = value[9];
    if ((unint64_t)v16 >= v15)
    {
      unint64_t v18 = value[7];
      uint64_t v19 = (uint64_t)((uint64_t)v16 - v18) >> 4;
      unint64_t v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v21 = v15 - v18;
      if (v21 >> 3 > v20) {
        unint64_t v20 = v21 >> 3;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v20;
      }
      v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v22);
      v24 = (unint64_t *)&v23[16 * v19];
      v26 = &v23[16 * v25];
      unint64_t v27 = value[2];
      unint64_t *v24 = v14;
      v24[1] = v27;
      unint64_t v17 = v24 + 2;
      v29 = (char *)value[7];
      v28 = (char *)value[8];
      if (v28 != v29)
      {
        do
        {
          *((_OWORD *)v24 - 1) = *((_OWORD *)v28 - 1);
          v24 -= 2;
          v28 -= 16;
        }
        while (v28 != v29);
        v28 = (char *)value[7];
      }
      value[7] = (unint64_t)v24;
      value[8] = (unint64_t)v17;
      value[9] = (unint64_t)v26;
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      unint64_t *v16 = v14;
      v16[1] = v5;
      unint64_t v17 = v16 + 2;
    }
    unint64_t v5 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    value[8] = (unint64_t)v17;
    goto LABEL_32;
  }
  value[4] += v5;
  if (!v5)
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    goto LABEL_32;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v5);
  v7 = v6;
  v8 = &v6[2 * v5];
  uint64_t v9 = 2 * v5;
  int v10 = v6;
  do
  {
    *v10++ = 0;
    v9 -= 2;
  }
  while (v9);
  uint64_t v11 = (uint64_t)(2 * v5) >> 1;
  if (v8 != v6)
  {
    if (((2 * v5) & 0x8000000000000000) != 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v5 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(2 * v5) >> 1);
    memmove((void *)v5, v7, v8 - v7);
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  unint64_t v5 = 0;
  if (v6) {
LABEL_10:
  }
    operator delete(v7);
LABEL_11:
  if (v8 == v7)
  {
    unint64_t v13 = 0;
    unint64_t v12 = v5;
  }
  else
  {
    unint64_t v12 = v5 + 2 * v11;
    unint64_t v13 = value[6];
  }
LABEL_32:
  *a3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:v12 - v5];
  if (v5) {
    operator delete((void *)v5);
  }
  return v13;
}

- (unint64_t)filterZerosInAudioPacket:(id)a3 atBufferHostTime:(unint64_t)a4 filteredPacket:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (!a5)
  {
    a4 = 0;
    goto LABEL_108;
  }
  if (!v8 || !*(void *)self->_audioZeroFilterImpl.__ptr_.__value_)
  {
    *a5 = v8;
    goto LABEL_108;
  }
  unint64_t v10 = [v8 length];
  value = (double *)self->_audioZeroFilterImpl.__ptr_.__value_;
  unint64_t v12 = (_WORD *)[v9 bytes];
  uint64_t v69 = v10 >> 1;
  if (*(void *)value)
  {
    unint64_t v13 = *((void *)value + 2);
    if (v13) {
      a4 = (unint64_t)((double)a4 - (double)v13 * value[10]);
    }
    unint64_t v68 = a4;
    if (v10 >= 2)
    {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v69);
      unint64_t v15 = &v17[2 * v18];
      unint64_t v14 = v17;
    }
    else
    {
      unint64_t v14 = 0;
      unint64_t v15 = 0;
    }
    if (*((unsigned char *)value + 10)) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = *v12 == 0;
    }
    v67 = a5;
    if (v10 >= 2)
    {
      v66 = v9;
      uint64_t v23 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = v14;
      do
      {
        if (v12[v23])
        {
          if (*((unsigned char *)value + 10))
          {
            unint64_t v24 = *((void *)value + 2);
            if (v24 >= *(void *)value)
            {
              if (v19) {
                unint64_t v68 = (unint64_t)((double)v68 + (double)v24 * value[10]);
              }
              unint64_t v34 = *((void *)value + 5) - v24;
              v36 = (unint64_t *)*((void *)value + 8);
              unint64_t v35 = *((void *)value + 9);
              if ((unint64_t)v36 >= v35)
              {
                uint64_t v38 = *((void *)value + 7);
                uint64_t v39 = ((uint64_t)v36 - v38) >> 4;
                if ((unint64_t)(v39 + 1) >> 60) {
                  std::vector<float>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v40 = v35 - v38;
                uint64_t v41 = v40 >> 3;
                if (v40 >> 3 <= (unint64_t)(v39 + 1)) {
                  uint64_t v41 = v39 + 1;
                }
                if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v42 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v42 = v41;
                }
                v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v42);
                v45 = (unint64_t *)&v43[16 * v39];
                unint64_t v46 = *((void *)value + 2);
                unint64_t *v45 = v34;
                v45[1] = v46;
                v48 = (char *)*((void *)value + 7);
                v47 = (char *)*((void *)value + 8);
                v49 = v45;
                if (v47 != v48)
                {
                  do
                  {
                    *((_OWORD *)v49 - 1) = *((_OWORD *)v47 - 1);
                    v49 -= 2;
                    v47 -= 16;
                  }
                  while (v47 != v48);
                  v47 = (char *)*((void *)value + 7);
                }
                v37 = v45 + 2;
                *((void *)value + 7) = v49;
                *((void *)value + 8) = v45 + 2;
                *((void *)value + 9) = &v43[16 * v44];
                if (v47) {
                  operator delete(v47);
                }
              }
              else
              {
                unint64_t *v36 = v34;
                v36[1] = v24;
                v37 = v36 + 2;
              }
              *((void *)value + 8) = v37;
            }
            else
            {
              if (v24)
              {
                for (unint64_t i = 0; i < v24; ++i)
                {
                  if (v22 >= v15)
                  {
                    uint64_t v26 = v22 - v14;
                    if (v22 - v14 <= -3) {
                      std::vector<float>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v27 = v26 >> 1;
                    if (v15 - v14 <= (unint64_t)((v26 >> 1) + 1)) {
                      uint64_t v28 = v27 + 1;
                    }
                    else {
                      uint64_t v28 = v15 - v14;
                    }
                    if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFELL) {
                      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      uint64_t v29 = v28;
                    }
                    if (v29) {
                      uint64_t v29 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v29);
                    }
                    else {
                      uint64_t v30 = 0;
                    }
                    v31 = (char *)(v29 + 2 * v27);
                    *(_WORD *)v31 = 0;
                    v32 = v31 + 2;
                    while (v22 != v14)
                    {
                      __int16 v33 = *((_WORD *)v22 - 1);
                      v22 -= 2;
                      *((_WORD *)v31 - 1) = v33;
                      v31 -= 2;
                    }
                    unint64_t v15 = (char *)(v29 + 2 * v30);
                    if (v14) {
                      operator delete(v14);
                    }
                    unint64_t v14 = v31;
                    unint64_t v22 = v32;
                  }
                  else
                  {
                    *(_WORD *)unint64_t v22 = 0;
                    v22 += 2;
                  }
                  ++*((void *)value + 4);
                  unint64_t v24 = *((void *)value + 2);
                }
              }
              v21 += v24;
            }
            BOOL v19 = 0;
            *((unsigned char *)value + 10) = 0;
            value[2] = 0.0;
          }
          if (!*((unsigned char *)value + 24) && (unsigned __int16)v12[v23] >= *((unsigned __int16 *)value + 4))
          {
            *((unsigned char *)value + 24) = 1;
            *((_DWORD *)value + 7) = *((void *)value + 5);
          }
          if (v22 >= v15)
          {
            uint64_t v51 = v22 - v14;
            if (v22 - v14 <= -3) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v52 = v51 >> 1;
            if (v15 - v14 <= (unint64_t)((v51 >> 1) + 1)) {
              uint64_t v53 = v52 + 1;
            }
            else {
              uint64_t v53 = v15 - v14;
            }
            if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v54 = v53;
            }
            if (v54) {
              uint64_t v54 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v54);
            }
            else {
              uint64_t v55 = 0;
            }
            v56 = (char *)(v54 + 2 * v52);
            *(_WORD *)v56 = v12[v23];
            v50 = v56 + 2;
            while (v22 != v14)
            {
              __int16 v57 = *((_WORD *)v22 - 1);
              v22 -= 2;
              *((_WORD *)v56 - 1) = v57;
              v56 -= 2;
            }
            unint64_t v15 = (char *)(v54 + 2 * v55);
            if (v14) {
              operator delete(v14);
            }
            unint64_t v14 = v56;
          }
          else
          {
            *(_WORD *)unint64_t v22 = v12[v23];
            v50 = v22 + 2;
          }
          ++*((void *)value + 4);
          ++v21;
          unint64_t v22 = v50;
        }
        else
        {
          ++*((void *)value + 2);
          *((unsigned char *)value + 10) = 1;
        }
        ++*((void *)value + 5);
        ++v23;
      }
      while (v23 != v69);
      unint64_t v20 = (v22 - v14) >> 1;
      if (v21 > v20)
      {
        unint64_t v58 = v21 - v20;
        uint64_t v9 = v66;
        if (v21 - v20 > (v15 - v22) >> 1)
        {
          if ((v21 & 0x8000000000000000) != 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (v15 - v14 <= v21) {
            uint64_t v59 = v21;
          }
          else {
            uint64_t v59 = v15 - v14;
          }
          if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v60 = v59;
          }
          a5 = v67;
          a4 = v68;
          v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v60) + 2 * v20;
          bzero(v61, 2 * v58);
          v62 = &v61[2 * v58];
          while (v22 != v14)
          {
            __int16 v63 = *((_WORD *)v22 - 1);
            v22 -= 2;
            *((_WORD *)v61 - 1) = v63;
            v61 -= 2;
          }
          if (v14) {
            operator delete(v14);
          }
          unint64_t v14 = v61;
          goto LABEL_104;
        }
        bzero(v22, 2 * v58);
        v62 = &v22[2 * v58];
LABEL_103:
        a5 = v67;
        a4 = v68;
LABEL_104:
        unint64_t v16 = v62 - v14;
        *((void *)value + 6) = (unint64_t)((double)a4 + (double)(unint64_t)((v62 - v14) >> 1)
                                                               * value[10]);
        if (v62 == v14) {
          a4 = 0;
        }
        goto LABEL_106;
      }
      uint64_t v9 = v66;
    }
    else
    {
      unint64_t v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = v14;
    }
    if (v20 <= v21) {
      v62 = v22;
    }
    else {
      v62 = &v14[2 * v21];
    }
    goto LABEL_103;
  }
  if (v10 > 1)
  {
    v64 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v69);
    unint64_t v16 = v10 & 0xFFFFFFFFFFFFFFFELL;
    memmove(v64, v12, v10 & 0xFFFFFFFFFFFFFFFELL);
    unint64_t v14 = (char *)v64;
  }
  else
  {
    unint64_t v14 = 0;
    unint64_t v16 = v10 & 0xFFFFFFFFFFFFFFFELL;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v14, v16, v66);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  if (v14) {
    operator delete(v14);
  }
LABEL_108:

  return a4;
}

- (CSAudioZeroFilter)initWithZeroWindowSize:(unint64_t)a3 approxAbsSpeechThreshold:(unsigned __int16)a4 numHostTicksPerAudioSample:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CSAudioZeroFilter;
  if ([(CSAudioZeroFilter *)&v6 init]) {
    operator new();
  }
  return 0;
}

@end