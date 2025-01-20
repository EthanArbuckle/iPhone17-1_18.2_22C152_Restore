@interface MTLDynamicLibraryContainer
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MTLDynamicLibraryContainer)initWithLibrary:(void *)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6;
- (MTLDynamicLibraryContainer)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)airData;
- (id)reflectionData;
- (void)dealloc;
- (void)initReflectionData;
- (void)initWithURL:(float *)a1 device:(unint64_t *)a2 options:error:;
- (void)release;
@end

@implementation MTLDynamicLibraryContainer

- (MTLDynamicLibraryContainer)initWithLibrary:(void *)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  v25.receiver = self;
  v25.super_class = (Class)MTLDynamicLibraryContainer;
  v10 = [(MTLDynamicLibraryContainer *)&v25 init];
  if (v10)
  {
    *((void *)v10 + 2) = a5;
    v11 = (void *)(*(uint64_t (**)(void *))(*(void *)a3 + 32))(a3);
    *((void *)v10 + 10) = v11;
    *((void *)v10 + 14) = [v11 length];
    *((_DWORD *)v10 + 34) = (unint64_t)+[MTLLoader sliceIDForAIR:]((uint64_t)MTLLoader, (uint64_t)a3) >> 32;
    id v12 = (id)(*(uint64_t (**)(void *))(*(void *)a3 + 56))(a3);
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (id)MEMORY[0x1E4F1CBF0];
    }
    *((void *)v10 + 6) = v14;
    id v15 = (id)(*(uint64_t (**)(void *))(*(void *)a3 + 40))(a3);
    if (v15) {
      id v16 = v15;
    }
    else {
      id v16 = v13;
    }
    *((void *)v10 + 5) = v16;
    id v17 = (id)(*(uint64_t (**)(void *))(*(void *)a3 + 72))(a3);
    if (v17) {
      id v18 = v17;
    }
    else {
      id v18 = v13;
    }
    *((void *)v10 + 8) = v18;
    id v19 = (id)(*(uint64_t (**)(void *))(*(void *)a3 + 64))(a3);
    if (v19) {
      id v20 = v19;
    }
    else {
      id v20 = v13;
    }
    *((void *)v10 + 7) = v20;
    id v21 = (id)(*(uint64_t (**)(void *))(*(void *)a3 + 104))(a3);
    *((void *)v10 + 9) = v21;
    if (v21 && [v21 length])
    {
      v22 = (long long *)(*(uint64_t (**)(void *))(*(void *)a3 + 296))(a3);
      long long v23 = *v22;
      *(_OWORD *)(v10 + 156) = v22[1];
      *(_OWORD *)(v10 + 140) = v23;
      (*(void (**)(void *, char *, char *))(*(void *)a3 + 216))(a3, v10 + 88, v10 + 96);
      (*(void (**)(void *, char *, char *, id *))(*(void *)a3 + 224))(a3, v10 + 120, v10 + 128, a6);
      *((void *)v10 + 3) = a4;
      dispatch_retain((dispatch_object_t)a4);
      *((void *)v10 + 4) = 0;
      *((_DWORD *)v10 + 46) = 0;
    }
    else
    {
      if (a6) {
        *a6 = newErrorWithMessage(&cfstr_LibraryHasNoIn.isa, MTLDynamicLibraryErrorCompilationFailure);
      }

      return 0;
    }
  }
  return (MTLDynamicLibraryContainer *)v10;
}

- (MTLDynamicLibraryContainer)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  v84.receiver = self;
  v84.super_class = (Class)MTLDynamicLibraryContainer;
  id v10 = [(MTLDynamicLibraryContainer *)&v84 init];
  if (!v10) {
    return (MTLDynamicLibraryContainer *)v10;
  }
  *((void *)v10 + 2) = a4;
  uint64_t v11 = *((void *)a4 + 59);
  uint64_t v12 = -[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:](v11, (NSURL *)a3, (NSError **)a6, &cfstr_Mtldynamiclibr.isa, 1);
  if (!v12)
  {

    return 0;
  }
  v13 = (MTLLoadedFile *)v12;
  uint64_t v14 = -[MTLLoader associateLoadedFile:withObject:](v11, v12, 0);
  if (!v14)
  {
    id v16 = [(MTLLoadedFile *)v13 contents];
    uint64_t v83 = 0;
    int v82 = 0;
    unint64_t v81 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a4, &v83, &v82);
    uint64_t v17 = +[MTLLoader sliceIDForAIR:]((uint64_t)MTLLoader, 0);
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x2020000000;
    char v80 = 0;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    char v76 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    uint64_t v72 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    uint64_t v68 = 0;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3052000000;
    v62 = __Block_byref_object_copy__0;
    v63 = __Block_byref_object_dispose__0;
    uint64_t v64 = 0;
    uint64_t v64 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    uint64_t v51 = 0;
    v52 = (float *)&v51;
    uint64_t v53 = 0x5812000000;
    v54 = __Block_byref_object_copy__9;
    memset(v56, 0, sizeof(v56));
    v55 = __Block_byref_object_dispose__10;
    uint64_t v57 = 0;
    int v58 = 1065353216;
    *(void *)v50 = 0;
    uint64_t v18 = _MTLGetMTLCompilerLLVMVersionForDevice(a4);
    _MTLGetMaxAIRAndLanguageVersions(v18, &v50[1], v50);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke;
    v48[3] = &unk_1E5220078;
    v48[6] = &v59;
    v48[7] = &v51;
    v48[8] = &v77;
    v48[9] = &v69;
    v48[12] = v81;
    v48[13] = v17;
    unsigned int v49 = v50[1];
    v48[10] = &v65;
    v48[11] = &v73;
    v48[4] = v10;
    v48[5] = v16;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_2;
    v47[3] = &unk_1E521FF88;
    v47[4] = v16;
    int v19 = +[MTLLoader deserializeUniversalBinaryHeaderWithHandler:reader:bytes:]((uint64_t)MTLLoader, (uint64_t)v48, (uint64_t)v47, [(NSData *)v16 length]);
    if (*((unsigned char *)v78 + 24)
      && (char v20 = isVendorSliceCompatible((uint64_t)&v81, (uint64_t)v16, v70[3], a4),
          *((unsigned char *)v78 + 24) = v20,
          (v20 & 1) != 0)
      || (id v21 = (void *)[a4 getMostCompatibleArchitecture:v60[5]],
          ![v21 cpuType]))
    {
      int v26 = 0;
    }
    else
    {
      v22 = v52;
      uint64_t v23 = [v21 cpuType];
      unint64_t v46 = (int)[v21 cpuSubtype] | (unint64_t)(v23 << 32);
      v24 = std::unordered_map<unsigned long long,-[MTLDynamicLibraryContainer initWithURL:device:options:error:]::archSliceId>::operator[](v22 + 12, &v46);
      uint64_t v25 = v24[1];
      v70[3] = *v24;
      v66[3] = v25;
      int v26 = 1;
    }
    [(id)v60[5] removeAllObjects];

    v60[5] = 0;
    v27 = v78;
    if (((*((unsigned char *)v78 + 24) == 0) & ~v26) == 0)
    {
      if (v19)
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_3;
        v44[3] = &unk_1E52200A0;
        v44[4] = v10;
        v44[5] = v16;
        v44[6] = &v73;
        v44[7] = &v69;
        v44[8] = v83;
        v44[9] = v81;
        int v45 = v82;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_4;
        v43[3] = &unk_1E52200C8;
        v43[4] = v16;
        v43[5] = &v69;
        char v28 = +[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 1, (uint64_t)v44, (uint64_t)v43);
        v27 = v78;
      }
      else
      {
        char v28 = 0;
      }
      *((unsigned char *)v27 + 24) = v28;
    }
    if (*((unsigned char *)v74 + 24))
    {
      id v29 = *((id *)v10 + 10);
      if (*((unsigned char *)v74 + 24))
      {
        v30 = [v10 airData];
        v35 = MTLLibraryBuilder::newLibraryWithData(*(void *)(*((void *)v10 + 2) + 424), *((_MTLDevice **)v10 + 2), v30, a6, v31, v32, v33, v34);
        v36 = v35;
        if (v35)
        {
          uint64_t v37 = [(_MTLLibrary *)v35 libraryData];
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v37 + 216))(v37, (uint64_t)v10 + 88, (uint64_t)v10 + 96);
          uint64_t v38 = [(_MTLLibrary *)v36 libraryData];
          (*(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(void *)v38 + 224))(v38, (uint64_t)v10 + 120, (uint64_t)v10 + 128, a6);
          uint64_t v39 = *((void *)v10 + 13);
          *((void *)v10 + 11) += v39;
          *((void *)v10 + 15) += v39;
          if ((v7 & 2) != 0) {
            [(_MTLLibrary *)v36 setShaderValidationEnabled:1];
          }
        }
        dispatch_release(v30);
        if (*((unsigned char *)v78 + 24))
        {
        }
        else
        {
          if (v36) {
            v41 = (void *)[*((id *)v10 + 2) newDynamicLibrary:v36 error:a6];
          }
          else {
            v41 = 0;
          }

          if (v41)
          {
            id v15 = (MTLDynamicLibraryContainer *)(id)[v41 container];

            -[MTLLoader releaseLoadedFile:](v11, v13);
LABEL_34:
            char v40 = 0;
            goto LABEL_36;
          }
        }
      }
    }
    else if ((v7 & 1) == 0)
    {
      if (a6) {
        *a6 = newErrorWithMessage((NSString *)[NSString stringWithFormat:@"MTLDynamicLibrary could not be loaded as its AIR slice is missing"], MTLDynamicLibraryErrorInvalidFile);
      }
      -[MTLLoader releaseLoadedFile:](v11, v13);

      char v40 = 0;
      id v15 = 0;
      goto LABEL_36;
    }
    id v15 = (MTLDynamicLibraryContainer *)-[MTLLoader associateLoadedFile:withObject:](v11, (uint64_t)v13, (uint64_t)v10);
    if (v15)
    {
      -[MTLLoader releaseLoadedFile:](v11, v13);

      goto LABEL_34;
    }
    *((void *)v10 + 4) = 0;
    *((_DWORD *)v10 + 46) = 0;
    char v40 = 1;
    *((void *)v10 + 1) = v13;
LABEL_36:
    _Block_object_dispose(&v51, 8);
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v56[8]);
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v77, 8);
    if ((v40 & 1) == 0) {
      return v15;
    }
    return (MTLDynamicLibraryContainer *)v10;
  }
  id v15 = (MTLDynamicLibraryContainer *)v14;
  -[MTLLoader releaseLoadedFile:](v11, v13);

  return v15;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = a2;
  unint64_t v8 = HIDWORD(a2);
  v9 = [[MTLArchitecture alloc] initWithCPUType:a2 cpuSubtype:HIDWORD(a2)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
  id v10 = (float *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
  uint64_t v14 = (a2 << 32) | (a2 >> 32);
  uint64_t v11 = std::unordered_map<unsigned long long,-[MTLDynamicLibraryContainer initWithURL:device:options:error:]::archSliceId>::operator[](v10, (unint64_t *)&v14);
  void *v11 = a3;
  v11[1] = a4;

  if (v15 == *(void *)(a1 + 96))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a4;
  }
  else if (*(_DWORD *)(a1 + 104) == a2 && *(_DWORD *)(a1 + 112) >= v8)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
    if (!*(unsigned char *)(v12 + 24) || *(_DWORD *)(*(void *)(a1 + 32) + 136) < (int)v8)
    {
      *(unsigned char *)(v12 + 24) = 1;
      *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
      *(void *)(*(void *)(a1 + 32) + 104) = a3;
      *(void *)(*(void *)(a1 + 32) + 112) = a4;
      *(_DWORD *)(*(void *)(a1 + 32) + 136) = v8;
    }
  }
  return 1;
}

- (void)initWithURL:(float *)a1 device:(unint64_t *)a2 options:error:
{
  unint64_t v4 = *a2;
  unint64_t v5 = *((void *)a1 + 1);
  if (v5)
  {
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v2 = *a2;
      if (v4 >= v5) {
        unint64_t v2 = v4 % v5;
      }
    }
    else
    {
      unint64_t v2 = (v5 - 1) & v4;
    }
    char v7 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v7)
    {
      for (i = *v7; i; i = (void *)*i)
      {
        unint64_t v9 = i[1];
        if (v9 == v4)
        {
          if (i[2] == v4) {
            return i + 3;
          }
        }
        else
        {
          if (v6.u32[0] > 1uLL)
          {
            if (v9 >= v5) {
              v9 %= v5;
            }
          }
          else
          {
            v9 &= v5 - 1;
          }
          if (v9 != v2) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0x28uLL);
  void *i = 0;
  i[1] = v4;
  i[3] = 0;
  i[4] = 0;
  i[2] = v4;
  float v10 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v11 = a1[8];
  if (!v5 || (float)(v11 * (float)v5) < v10)
  {
    BOOL v12 = (v5 & (v5 - 1)) == 0;
    if (v5 < 3) {
      BOOL v12 = 0;
    }
    unint64_t v13 = (2 * v5) | !v12;
    unint64_t v14 = vcvtps_u32_f32(v10 / v11);
    if (v13 <= v14) {
      int8x8_t prime = (int8x8_t)v14;
    }
    else {
      int8x8_t prime = (int8x8_t)v13;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v5 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v5) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v5)
    {
      unint64_t v22 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v5 < 3 || (uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)v5), v23.i16[0] = vaddlv_u8(v23), v23.u32[0] > 1uLL))
      {
        unint64_t v22 = std::__next_prime(v22);
      }
      else
      {
        uint64_t v24 = 1 << -(char)__clz(v22 - 1);
        if (v22 >= 2) {
          unint64_t v22 = v24;
        }
      }
      if (*(void *)&prime <= v22) {
        int8x8_t prime = (int8x8_t)v22;
      }
      if (*(void *)&prime >= v5)
      {
        unint64_t v5 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          id v16 = operator new(8 * *(void *)&prime);
          uint64_t v17 = *(void **)a1;
          *(void *)a1 = v16;
          if (v17) {
            operator delete(v17);
          }
          uint64_t v18 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v18++) = 0;
          while (*(void *)&prime != v18);
          int v19 = (void *)*((void *)a1 + 2);
          if (v19)
          {
            unint64_t v20 = v19[1];
            uint8x8_t v21 = (uint8x8_t)vcnt_s8(prime);
            v21.i16[0] = vaddlv_u8(v21);
            if (v21.u32[0] > 1uLL)
            {
              if (v20 >= *(void *)&prime) {
                v20 %= *(void *)&prime;
              }
            }
            else
            {
              v20 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v20) = a1 + 4;
            uint64_t v25 = (void *)*v19;
            if (*v19)
            {
              do
              {
                unint64_t v26 = v25[1];
                if (v21.u32[0] > 1uLL)
                {
                  if (v26 >= *(void *)&prime) {
                    v26 %= *(void *)&prime;
                  }
                }
                else
                {
                  v26 &= *(void *)&prime - 1;
                }
                if (v26 != v20)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v26))
                  {
                    *(void *)(*(void *)a1 + 8 * v26) = v19;
                    goto LABEL_55;
                  }
                  *int v19 = *v25;
                  *uint64_t v25 = **(void **)(*(void *)a1 + 8 * v26);
                  **(void **)(*(void *)a1 + 8 * v26) = v25;
                  uint64_t v25 = v19;
                }
                unint64_t v26 = v20;
LABEL_55:
                int v19 = v25;
                uint64_t v25 = (void *)*v25;
                unint64_t v20 = v26;
              }
              while (v25);
            }
          }
          unint64_t v5 = (unint64_t)prime;
          goto LABEL_59;
        }
        uint64_t v31 = *(void **)a1;
        *(void *)a1 = 0;
        if (v31) {
          operator delete(v31);
        }
        unint64_t v5 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v4 >= v5) {
        unint64_t v2 = v4 % v5;
      }
      else {
        unint64_t v2 = v4;
      }
    }
    else
    {
      unint64_t v2 = (v5 - 1) & v4;
    }
  }
  v27 = *(void **)a1;
  char v28 = *(void **)(*(void *)a1 + 8 * v2);
  if (v28)
  {
    void *i = *v28;
LABEL_72:
    *char v28 = i;
    goto LABEL_73;
  }
  void *i = *((void *)a1 + 2);
  *((void *)a1 + 2) = i;
  v27[v2] = a1 + 4;
  if (*i)
  {
    unint64_t v29 = *(void *)(*i + 8);
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v29 >= v5) {
        v29 %= v5;
      }
    }
    else
    {
      v29 &= v5 - 1;
    }
    char v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return i + 3;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 + a2 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + a2;
  }
  else {
    return 0;
  }
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = a2;
  if (*(void *)(a3 + 96))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
    *(void *)(*(void *)(a1 + 32) + 104) = *(void *)(a3 + 96)
                                              + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)(*(void *)(a1 + 32) + 112) = *(void *)(a3 + 104);
  }
  if (*(void *)(a1 + 72) != v27) {
    return 0;
  }
  uint64_t v10 = *(void *)(a3 + 48);
  if (!*(unsigned char *)(a3 + 41))
  {
    if (*(void *)(a1 + 64) == v10) {
      goto LABEL_10;
    }
    return 0;
  }
  if (*(_DWORD *)(a1 + 80) != v10) {
    return 0;
  }
LABEL_10:
  uint64_t result = [*(id *)(a3 + 56) length];
  if (result)
  {
    unint64_t v11 = a5 + a4 + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v11 <= [*(id *)(a1 + 40) length])
    {
      v26[0] = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + a4;
      v26[1] = a5;
      *(void *)(*(void *)(a1 + 32) + 24) = _MTLNSDataToDispatchData(*(void **)(a1 + 40), v26);
      uint64_t v12 = *(void *)(a1 + 32);
      long long v13 = *(_OWORD *)(v12 + 156);
      long long v14 = *(_OWORD *)(v12 + 140);
      long long v15 = *(_OWORD *)(a3 + 24);
      *(_OWORD *)(v12 + 140) = *(_OWORD *)(a3 + 8);
      *(_OWORD *)(v12 + 156) = v15;
      *(_OWORD *)(a3 + 8) = v14;
      *(_OWORD *)(a3 + 24) = v13;
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(v16 + 72);
      *(void *)(v16 + 72) = *(void *)(a3 + 56);
      *(void *)(a3 + 56) = v17;
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(v18 + 64);
      *(void *)(v18 + 64) = *(void *)(a3 + 64);
      *(void *)(a3 + 64) = v19;
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(v20 + 56);
      *(void *)(v20 + 56) = *(void *)(a3 + 72);
      *(void *)(a3 + 72) = v21;
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(v22 + 40);
      *(void *)(v22 + 40) = *(void *)(a3 + 80);
      *(void *)(a3 + 80) = v23;
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(v24 + 48);
      *(void *)(v24 + 48) = *(void *)(a3 + 88);
      *(void *)(a3 + 88) = v25;
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t __63__MTLDynamicLibraryContainer_initWithURL_device_options_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + a2;
  if (v4 + a3 <= (unint64_t)[*(id *)(a1 + 32) length]) {
    return [*(id *)(a1 + 32) bytes] + v4;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  fileMapping = self->_fileMapping;
  if (fileMapping) {
    -[MTLLoader disassociateLoadedFile:withObject:](*((void *)self->_device + 59), fileMapping);
  }

  vendorData = self->_vendorData;
  if (vendorData) {
    dispatch_release(vendorData);
  }
  reflectionData = self->_reflectionData;
  if (reflectionData) {
    dispatch_release(reflectionData);
  }

  v6.receiver = self;
  v6.super_class = (Class)MTLDynamicLibraryContainer;
  [(MTLDynamicLibraryContainer *)&v6 dealloc];
}

- (void)release
{
  fileMapping = self->_fileMapping;
  if (fileMapping)
  {
    uint64_t v4 = *((void *)self->_device + 59);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MTLDynamicLibraryContainer_release__block_invoke;
    block[3] = &unk_1E521F9E8;
    block[4] = self;
    -[MTLLoader executeBlockForLoadedFile:withAssociatedObject:block:](v4, (int)fileMapping, (int)self, block);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLDynamicLibraryContainer;
    [(MTLDynamicLibraryContainer *)&v5 release];
  }
}

id __37__MTLDynamicLibraryContainer_release__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)MTLDynamicLibraryContainer;
  return objc_msgSendSuper2(&v2, sel_release);
}

- (id)airData
{
  id result = self->_airData;
  if (result)
  {
    long long v4 = *(_OWORD *)&self->_airOffset;
    return _MTLNSDataToDispatchData(result, &v4);
  }
  return result;
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v45 = 0;
  unint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v39 = 0;
  char v40 = &v39;
  uint64_t v41 = 0x3052000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  uint64_t v44 = 0;
  if (!self->_airData)
  {
    if (!a5) {
      goto LABEL_15;
    }
    id v20 = newErrorWithMessage(&cfstr_AirIsRequiredB.isa, MTLDynamicLibraryErrorCompilationFailure);
    goto LABEL_12;
  }
  id v6 = a3;
  if (!a3 || !objc_msgSend(a3, "path", a3, a4) || !objc_msgSend(v6, "filePathURL"))
  {
    if (!a5) {
      goto LABEL_15;
    }
    id v20 = newErrorWithMessage(&cfstr_InvalidUrl.isa, MTLDynamicLibraryErrorInvalidFile);
LABEL_12:
    LOBYTE(v6) = 0;
    *a5 = v20;
    goto LABEL_16;
  }
  if (stat((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "URLByDeletingLastPathComponent"), "path"), "UTF8String"), &v38) == -1)
  {
    if (a5)
    {
      id v20 = newErrorWithMessage(&cfstr_InvalidUrl.isa, MTLDynamicLibraryErrorInvalidFile);
      goto LABEL_12;
    }
LABEL_15:
    LOBYTE(v6) = 0;
    goto LABEL_16;
  }
  unint64_t v8 = (void *)MEMORY[0x18530C9F0]();
  int64_t v9 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, self->_device, 0);
  uint64_t v10 = (std::__shared_weak_count *)operator new(0x30uLL);
  v10->__shared_owners_ = 0;
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ECAC4880;
  v10[1].__vftable = 0;
  unint64_t v11 = (uint64_t *)&v10[1];
  v10[1].__shared_owners_ = 0;
  v10[1].__shared_weak_owners_ = 0;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  uint64_t v12 = (v9 << 32) | (v9 >> 32);
  uint64_t v33 = v12;
  long long v32 = *(_OWORD *)&self->_bitcodeOffset;
  dispatch_data_t v13 = _MTLNSDataToDispatchData(self->_airData, &v32);
  vendorData = self->_vendorData;
  *(void *)&long long v35 = v13;
  *((void *)&v35 + 1) = vendorData;
  dispatch_retain(vendorData);
  uint64_t v31 = strdup([(NSString *)self->_installName UTF8String]);
  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByDeletingLastPathComponent");
  uint64_t v17 = [v16 stringByAppendingFormat:@"/%@.metallib", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")];
  unint64_t shared_owners = v10[1].__shared_owners_;
  if (shared_owners >= v10[1].__shared_weak_owners_)
  {
    uint64_t v19 = std::vector<machOEntry>::__push_back_slow_path<machOEntry const&>(v11, (long long *)&v33);
  }
  else
  {
    std::vector<machOEntry>::__construct_one_at_end[abi:ne180100]<machOEntry const&>((uint64_t)v11, (long long *)&v33);
    uint64_t v19 = shared_owners + 72;
  }
  v10[1].__shared_owners_ = v19;
  uint64_t v22 = (void *)[(MTLDevice *)self->_device compiler];
  unint64_t v29 = v10 + 1;
  v30 = v10;
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __59__MTLDynamicLibraryContainer_serializeToURL_options_error___block_invoke;
  v26[3] = &unk_1E52200F0;
  v26[4] = v15;
  v26[5] = v6;
  v26[6] = v17;
  v26[7] = &v45;
  v26[8] = &v39;
  [v22 generateMachOWithID:0 binaryEntries:&v29 machOSpecializedData:&v31 machOType:1 Path:v17 platform:v12 bitcodeList:&v27 completionHandler:v26];
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  dispatch_release(*((dispatch_object_t *)&v35 + 1));
  dispatch_release((dispatch_object_t)v35);
  free(v31);
  if (a5)
  {
    uint64_t v23 = (void *)v40[5];
    *a5 = v23;
    if (!*((unsigned char *)v46 + 24) && v23) {
      id v24 = v23;
    }
  }
  else
  {
    LOBYTE(v6) = *((unsigned char *)v46 + 24) != 0;
  }
  if (*((void *)&v36 + 1))
  {
    *(void *)&long long v37 = *((void *)&v36 + 1);
    operator delete(*((void **)&v36 + 1));
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  if (a5)
  {
    if (*a5) {
      id v25 = *a5;
    }
    LOBYTE(v6) = *((unsigned char *)v46 + 24) != 0;
  }
LABEL_16:
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  return v6 & 1;
}

BOOL __59__MTLDynamicLibraryContainer_serializeToURL_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = newErrorWithMessage(*(NSString **)(a2 + 8), MTLDynamicLibraryErrorCompilationFailure);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", *(void *)(a1 + 48), 0), 0, 0, 0, *(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  v3 = (const std::__fs::filesystem::path *)[*(id *)(a1 + 48) UTF8String];

  return remove(v3, v4);
}

- (void)initReflectionData
{
  p_reflectionDataLock = &self->_reflectionDataLock;
  os_unfair_lock_lock(&self->_reflectionDataLock);
  if (!self->_reflectionData)
  {
    long long v4 = *(_OWORD *)&self->_reflectionOffset;
    self->_reflectionData = (OS_dispatch_data *)_MTLNSDataToDispatchData(self->_airData, &v4);
  }
  os_unfair_lock_unlock(p_reflectionDataLock);
}

- (id)reflectionData
{
  id result = self->_reflectionData;
  if (!result)
  {
    if (self->_airData && self->_reflectionSize)
    {
      [(MTLDynamicLibraryContainer *)self initReflectionData];
      return self->_reflectionData;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end