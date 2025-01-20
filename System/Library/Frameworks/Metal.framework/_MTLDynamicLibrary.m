@interface _MTLDynamicLibrary
+ (unsigned)dynamicLibraryTypeAtURL:(id)a3 device:(id)a4 error:(id *)a5;
+ (void)dynamicLibraryTypeAtURL:(float *)a1 device:(unint64_t *)a2 error:;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)shaderValidationEnabled;
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLDevice)device;
- (NSArray)exportedFunctions;
- (NSArray)exportedVariables;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSArray)relocations;
- (NSString)description;
- (NSString)installName;
- (NSString)libraryPath;
- (OS_dispatch_data)binaryData;
- (OS_dispatch_data)reflectionData;
- (_MTLDynamicLibrary)initWithLibrary:(id)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6;
- (_MTLDynamicLibrary)initWithURL:(id)a3 device:(id)a4 error:(id *)a5;
- (_MTLDynamicLibrary)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (const)libraryUUID;
- (id)airData;
- (id)container;
- (id)formattedDescription:(unint64_t)a3;
- (void)dealloc;
- (void)setDebugInstrumentationData:(id)a3;
- (void)setRelocations:(id)a3;
@end

@implementation _MTLDynamicLibrary

- (MTLDevice)device
{
  return self->_container->_device;
}

- (OS_dispatch_data)binaryData
{
  return self->_container->_vendorData;
}

- (OS_dispatch_data)reflectionData
{
  return (OS_dispatch_data *)[(MTLDynamicLibraryContainer *)self->_container reflectionData];
}

- (NSArray)exportedFunctions
{
  return self->_container->_exportedFunctions;
}

- (NSArray)exportedVariables
{
  return self->_container->_exportedVariables;
}

- (NSArray)importedSymbols
{
  return self->_container->_importedSymbols;
}

- (NSArray)importedLibraries
{
  return self->_container->_importedLibraries;
}

- (NSString)installName
{
  return self->_container->_installName;
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return self->_container->_debugInstrumentationData;
}

- (void)setDebugInstrumentationData:(id)a3
{
  container = self->_container;
  debugInstrumentationData = container->_debugInstrumentationData;
  if (!debugInstrumentationData)
  {
    atomic_compare_exchange_strong((atomic_ullong *volatile)&container->_debugInstrumentationData, (unint64_t *)&debugInstrumentationData, (unint64_t)a3);
    if (!debugInstrumentationData) {
      v5 = self->_container->_debugInstrumentationData;
    }
  }
}

- (_MTLDynamicLibrary)initWithLibrary:(id)a3 binaryData:(id)a4 device:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)_MTLDynamicLibrary;
  v10 = [(_MTLObjectWithLabel *)&v13 init];
  if (v10)
  {
    uint64_t v11 = [a3 libraryData];
    v10->_libraryPath = (NSString *)(id)(*(uint64_t (**)(uint64_t))(*(void *)v11 + 304))(v11);
    v10->_container = [[MTLDynamicLibraryContainer alloc] initWithLibrary:v11 binaryData:a4 device:a5 error:a6];
    v10->_shaderValidationEnabled = [a3 shaderValidationEnabled];
  }
  return v10;
}

- (_MTLDynamicLibrary)initWithURL:(id)a3 device:(id)a4 error:(id *)a5
{
  return [(_MTLDynamicLibrary *)self initWithURL:a3 device:a4 options:0 error:a5];
}

- (_MTLDynamicLibrary)initWithURL:(id)a3 device:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v13.receiver = self;
  v13.super_class = (Class)_MTLDynamicLibrary;
  v10 = [(_MTLObjectWithLabel *)&v13 init];
  if (v10)
  {
    if (a3)
    {
      uint64_t v11 = [[MTLDynamicLibraryContainer alloc] initWithURL:a3 device:a4 options:a5 error:a6];
      v10->_container = v11;
      if (v11)
      {
        v10->_libraryPath = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "standardizedURL"), "path");
        v10->_shaderValidationEnabled = (a5 & 2) != 0;
        return v10;
      }
    }
    else if (a6)
    {
      *a6 = newErrorWithMessage(&cfstr_UrlForDynamicL.isa, MTLDynamicLibraryErrorInvalidFile);
    }

    return 0;
  }
  return v10;
}

+ (unsigned)dynamicLibraryTypeAtURL:(id)a3 device:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  v8 = (void *)MEMORY[0x18530C9F0](a1, a2);
  v9 = objc_opt_new();
  v10 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:]((uint64_t)v9, (NSURL *)a3, (NSError **)a5, &cfstr_Mtldynamiclibr.isa, 1);
  uint64_t v67 = 0;
  int v66 = 0;
  unint64_t v11 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a4, &v67, &v66);
  unint64_t v65 = v11;
  uint64_t v12 = +[MTLLoader sliceIDForAIR:]((uint64_t)MTLLoader, 0);
  unsigned int v13 = 0;
  if (v9) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    goto LABEL_28;
  }
  uint64_t v15 = v12;
  v16 = [(MTLLoadedFile *)v10 contents];
  if ([(NSData *)v16 length] >= 0x58)
  {
    uint64_t v17 = [(NSData *)v16 bytes];
    if (*(_DWORD *)v17 == 1112298573 && (*(unsigned char *)(v17 + 10) & 0x7F) != 2)
    {
      -[MTLLoader releaseLoadedFile:]((uint64_t)v9, v10);

      unsigned int v13 = 0;
      goto LABEL_31;
    }
  }
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3052000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  uint64_t v48 = 0;
  uint64_t v48 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
  uint64_t v35 = 0;
  v36 = (float *)&v35;
  uint64_t v37 = 0x5812000000;
  v38 = __Block_byref_object_copy__116;
  memset(v40, 0, sizeof(v40));
  v39 = __Block_byref_object_dispose__117;
  uint64_t v41 = 0;
  int v42 = 1065353216;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke;
  v34[3] = &unk_1E5220118;
  v34[4] = &v43;
  v34[5] = &v35;
  v34[6] = &v61;
  v34[7] = &v53;
  v34[10] = v11;
  v34[11] = v15;
  v34[8] = &v49;
  v34[9] = &v57;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_2;
  v33[3] = &unk_1E521FF88;
  v33[4] = v16;
  int v18 = +[MTLLoader deserializeUniversalBinaryHeaderWithHandler:reader:bytes:]((uint64_t)MTLLoader, (uint64_t)v34, (uint64_t)v33, [(NSData *)v16 length]);
  if (*((unsigned char *)v62 + 24)
    && (char v19 = isVendorSliceCompatible((uint64_t)&v65, (uint64_t)v16, v54[3], a4),
        *((unsigned char *)v62 + 24) = v19,
        (v19 & 1) != 0)
    || (v20 = (void *)[a4 getMostCompatibleArchitecture:v44[5]],
        ![v20 cpuType]))
  {
    int v25 = 0;
  }
  else
  {
    v21 = v36;
    uint64_t v22 = [v20 cpuType];
    unint64_t v32 = (int)[v20 cpuSubtype] | (unint64_t)(v22 << 32);
    v23 = std::unordered_map<unsigned long long,+[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:]::archSliceId>::operator[](v21 + 12, &v32);
    uint64_t v24 = v23[1];
    v54[3] = *v23;
    v50[3] = v24;
    int v25 = 1;
  }
  [(id)v44[5] removeAllObjects];

  v44[5] = 0;
  if (!v18) {
    goto LABEL_20;
  }
  if (((*((unsigned char *)v62 + 24) == 0) & ~v25) != 0)
  {
LABEL_21:
    if (v25) {
      int v26 = 3;
    }
    else {
      int v26 = 1;
    }
    if (*((unsigned char *)v58 + 24)) {
      unsigned int v13 = v26;
    }
    else {
      unsigned int v13 = 4;
    }
    goto LABEL_27;
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_3;
  v30[3] = &unk_1E5220140;
  int v31 = v66;
  v30[6] = &v53;
  v30[7] = v67;
  v30[4] = v16;
  v30[5] = &v57;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_4;
  v29[3] = &unk_1E52200C8;
  v29[4] = v16;
  v29[5] = &v53;
  if (!+[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 1, (uint64_t)v30, (uint64_t)v29))
  {
LABEL_20:
    unsigned int v13 = 0;
    goto LABEL_27;
  }
  if (!*((unsigned char *)v62 + 24)) {
    goto LABEL_21;
  }
  unsigned int v13 = 2;
LABEL_27:
  -[MTLLoader releaseLoadedFile:]((uint64_t)v9, v10);
  _Block_object_dispose(&v35, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v40[8]);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
LABEL_28:

  if (a5 && *a5) {
    id v27 = *a5;
  }
LABEL_31:
  return v13;
}

+ (void)dynamicLibraryTypeAtURL:(float *)a1 device:(unint64_t *)a2 error:
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
    v7 = *(void ***)(*(void *)a1 + 8 * v2);
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
          v16 = operator new(8 * *(void *)&prime);
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
          char v19 = (void *)*((void *)a1 + 2);
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
            int v25 = (void *)*v19;
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
                  *char v19 = *v25;
                  *int v25 = **(void **)(*(void *)a1 + 8 * v26);
                  **(void **)(*(void *)a1 + 8 * v26) = v25;
                  int v25 = v19;
                }
                unint64_t v26 = v20;
LABEL_55:
                char v19 = v25;
                int v25 = (void *)*v25;
                unint64_t v20 = v26;
              }
              while (v25);
            }
          }
          unint64_t v5 = (unint64_t)prime;
          goto LABEL_59;
        }
        int v31 = *(void **)a1;
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
  id v27 = *(void **)a1;
  v28 = *(void **)(*(void *)a1 + 8 * v2);
  if (v28)
  {
    void *i = *v28;
LABEL_72:
    void *v28 = i;
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
    v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return i + 3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLDynamicLibrary;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[9] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  unint64_t v5 = [(_MTLObjectWithLabel *)self retainedLabel];
  uint8x8_t v6 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)_MTLDynamicLibrary;
  v7 = [(_MTLDynamicLibrary *)&v14 description];
  v15[0] = v4;
  v15[1] = @"label =";
  v8 = @"<none>";
  if (v5) {
    unint64_t v9 = v5;
  }
  else {
    unint64_t v9 = @"<none>";
  }
  v15[2] = v9;
  v15[3] = v4;
  installName = (__CFString *)self->_container->_installName;
  if (!installName) {
    installName = @"<none>";
  }
  v15[4] = @"installName =";
  v15[5] = installName;
  libraryPath = self->_libraryPath;
  v15[6] = v4;
  v15[7] = @"loadPath =";
  if (libraryPath) {
    v8 = (__CFString *)libraryPath;
  }
  v15[8] = v8;
  BOOL v12 = (void *)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 9), "componentsJoinedByString:", @" "];

  return v12;
}

- (NSString)description
{
  return (NSString *)[(_MTLDynamicLibrary *)self formattedDescription:0];
}

- (const)libraryUUID
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)&self->_container->_libraryUUID;
}

- (id)airData
{
  return [(MTLDynamicLibraryContainer *)self->_container airData];
}

- (id)container
{
  return self->_container;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return [(MTLDynamicLibraryContainer *)self->_container serializeToURL:a3 options:15 error:a4];
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return [(MTLDynamicLibraryContainer *)self->_container serializeToURL:a3 options:a4 error:a5];
}

- (NSString)libraryPath
{
  return self->_libraryPath;
}

- (NSArray)relocations
{
  return self->_relocations;
}

- (void)setRelocations:(id)a3
{
}

- (BOOL)shaderValidationEnabled
{
  return self->_shaderValidationEnabled;
}

@end