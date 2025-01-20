id getDataFromFile(NSString *a1, NSString *a2)
{
  NSString *v3;
  NSString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  v5 = [MEMORY[0x263F08850] defaultManager];
  if (v4)
  {
    v6 = [(NSString *)v4 stringByAppendingPathComponent:v3];
  }
  else
  {
    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 bundlePath];
    v6 = [v7 stringWithFormat:@"%@/%@", v9, v3];
  }
  if ([v5 fileExistsAtPath:v6]) {
    v10 = v6;
  }
  else {
    v10 = 0;
  }
  if (v10)
  {
    v11 = v6;
  }
  else
  {
    v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 resourcePath];
    v11 = [v12 stringWithFormat:@"%@/%@", v14, v3];

    if ([v5 fileExistsAtPath:v11]) {
      v15 = v11;
    }
    else {
      v15 = 0;
    }
    v6 = v15;
  }
  v16 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];

  return v16;
}

void sub_2451470B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getDataFromData(void *a1, int a2, int a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a4;
  unint64_t v9 = [v7 length];
  if (v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(id *)(*((void *)&v34 + 1) + 8 * i);
          objc_msgSend(v14, "unsignedLongValue", (void)v34);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v11);
    }
  }
  if (a3 == a2)
  {
    id v15 = v7;
LABEL_28:
    v32 = v15;
    goto LABEL_29;
  }
  v16 = (float *)[v7 bytes];
  unint64_t v17 = (unsigned __int16)a2 >> 3;
  unint64_t v18 = v9 / v17;
  if (a3 == 536870920)
  {
    v28 = malloc_type_malloc(v9 / v17, 0x100004077774924uLL);
    if (v9 >= v17)
    {
      if (v18 <= 1) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = v9 / v17;
      }
      v30 = v28;
      do
      {
        float v31 = *v16++;
        *v30++ = (int)v31;
        --v29;
      }
      while (v29);
    }
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v28, v9 / v17, 1, (void)v34);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (a3 == 268435472)
  {
    v19 = malloc_type_malloc(2 * v18, 0x1000040BDFB0063uLL);
    if (v9 >= v17)
    {
      if (v18 <= 1) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = v9 / v17;
      }
      v21 = v19;
      do
      {
        float v22 = *v16++;
        _S0 = v22;
        __asm { FCVT            H0, S0 }
        *v21++ = LOWORD(_S0);
        --v20;
      }
      while (v20);
    }
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v19, 2 * v18, 1, (void)v34);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v32 = 0;
LABEL_29:

  return v32;
}

void sub_245147384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getDataFromFile(NSString *a1, NSString *a2, int a3, int a4, void *a5)
{
  id v9 = a5;
  id v10 = getDataFromFile(a1, a2);
  uint64_t v11 = getDataFromData(v10, a3, a4, v9);

  return v11;
}

void sub_245147458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id makeMPSTensorDataWithData(MPSGraphDevice *a1, uint64_t a2, uint64_t a3, uint64_t a4, NSString *a5, int *a6, int a7)
{
  v23[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = a1;
  v23[0] = &unk_26F9DB150;
  v13 = [NSNumber numberWithInt:a4];
  v23[1] = v13;
  id v14 = [NSNumber numberWithInt:a3];
  v23[2] = v14;
  id v15 = [NSNumber numberWithInt:a2];
  v23[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];

  if (a7) {
    uint64_t v17 = 268435472;
  }
  else {
    uint64_t v17 = 8;
  }
  unint64_t v18 = (((v17 >> 3) & 3) * (uint64_t)(int)a2 + 63) & 0xFFFFFFFFFFFFFFC0;
  if (a6) {
    *a6 = v18;
  }
  [(MPSGraphDevice *)v12 metalDevice];
  if (a7) {
    v19 = {;
  }
    createMetalBufferRand<half>(v19, a2, a3, a4, v18, 1.0);
  }
  else {
    v19 = {;
  }
    createMetalBufferRand<unsigned char>(v19, a2, a3, a4, v18, 255.0);
  uint64_t v20 = };

  v21 = (void *)[objc_alloc(MEMORY[0x263F13460]) initWithMTLBuffer:v20 shape:v16 dataType:v17 rowBytes:v18];

  return v21;
}

void sub_245147664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id createMetalBufferRand<half>(void *a1, int a2, int a3, int a4, uint64_t a5, float a6)
{
  id v27 = a1;
  srand(1u);
  size_t v26 = a3 * a5 * a4;
  v28 = (char *)malloc_type_malloc(v26, 0xE7AFA5C9uLL);
  if (a4 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = a3;
    uint64_t v29 = a5 * a3;
    v13 = v28;
    int v30 = a3;
    do
    {
      if (a3 >= 1)
      {
        uint64_t v14 = 0;
        id v15 = v13;
        do
        {
          uint64_t v16 = a2;
          uint64_t v17 = v15;
          if (a2 >= 1)
          {
            do
            {
              uint64_t v18 = rand();
              _S0 = (float)(int)((((v18 << 32 >> 2) + (int)v18) >> 61)
                               + ((unint64_t)((v18 << 32 >> 2) + (int)v18) >> 63))
                  * a6;
              __asm { FCVT            H0, S0 }
              *v17++ = LOWORD(_S0);
              --v16;
            }
            while (v16);
          }
          ++v14;
          id v15 = (_WORD *)((char *)v15 + a5);
        }
        while (v14 != v12);
      }
      ++v11;
      v13 += v29;
      a3 = v30;
    }
    while (v11 != a4);
  }
  v24 = objc_msgSend(v27, "newBufferWithBytes:length:options:", v28, v26, 0, v26);
  free(v28);

  return v24;
}

void sub_245147830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id createMetalBufferRand<unsigned char>(void *a1, int a2, int a3, int a4, uint64_t a5, float a6)
{
  id v22 = a1;
  srand(1u);
  size_t v21 = a3 * a5 * a4;
  v23 = malloc_type_malloc(v21, 0xE7AFA5C9uLL);
  if (a4 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = a3;
    uint64_t v24 = a5 * a3;
    v13 = v23;
    int v25 = a3;
    do
    {
      if (a3 >= 1)
      {
        uint64_t v14 = 0;
        id v15 = v13;
        do
        {
          uint64_t v16 = a2;
          uint64_t v17 = v15;
          if (a2 >= 1)
          {
            do
            {
              uint64_t v18 = rand();
              *v17++ = (int)(float)((float)(int)((((v18 << 32 >> 2) + (int)v18) >> 61)
                                               + ((unint64_t)((v18 << 32 >> 2) + (int)v18) >> 63))
                                  * a6);
              --v16;
            }
            while (v16);
          }
          ++v14;
          v15 += a5;
        }
        while (v14 != v12);
      }
      ++v11;
      v13 += v24;
      a3 = v25;
    }
    while (v11 != a4);
  }
  v19 = objc_msgSend(v22, "newBufferWithBytes:length:options:", v23, v21, 0, v21);
  free(v23);

  return v19;
}

void sub_2451479C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t getModelFilePath()
{
  return 0;
}

id getModelFileURL()
{
  v0 = [NSURL fileURLWithPath:0];

  return v0;
}

id getEmitModelWeightsPath(uint64_t a1, uint64_t a2, int a3)
{
  v4 = NSString;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 resourcePath];
  id v7 = (void *)v6;
  id v8 = @"emit_v35_constants.dat";
  if (a3) {
    id v8 = @"emit_v35_constants_2x.dat";
  }
  id v9 = [v4 stringWithFormat:@"%@/%@", v6, v8];

  return v9;
}

void sub_245147ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmitModelWeightsData(uint64_t a1, uint64_t a2, int a3)
{
  v3 = getEmitModelWeightsPath(a1, 0, a3);
  v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];

  return v4;
}

void sub_245147B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t parseNum<unsigned long long>(const char *a1, uint64_t a2)
{
  uint64_t result = sscanf(a1, "0x%llx", a2);
  if (result != 1) {
    return sscanf(a1, "%llu", a2) == 1;
  }
  return result;
}

uint64_t parseNum<unsigned int>(const char *a1, uint64_t a2)
{
  uint64_t result = sscanf(a1, "0x%x", a2);
  if (result != 1) {
    return sscanf(a1, "%u", a2) == 1;
  }
  return result;
}

BOOL parseNum<int>(const char *a1, uint64_t a2)
{
  return sscanf(a1, "%i", a2) == 1;
}

BOOL findEnvVarNum<int>(const char *a1, _DWORD *a2, int a3, int a4)
{
  id v8 = getenv(a1);
  if (!v8 || !*v8)
  {
    BOOL v10 = 0;
    *a2 = a3;
    return v10;
  }
  int v9 = sscanf(v8, "%i", a2);
  BOOL v10 = v9 == 1;
  if (v9 != 1)
  {
    *a2 = a3;
    if (!a4) {
      return v10;
    }
    goto LABEL_5;
  }
  if (a4) {
LABEL_5:
  }
    setenv(a1, "", 1);
  return v10;
}

uint64_t findEnvVarNum<unsigned int>(const char *a1, _DWORD *a2, int a3, int a4)
{
  id v8 = getenv(a1);
  if (!v8 || !*v8)
  {
    uint64_t v9 = 0;
    *a2 = a3;
    return v9;
  }
  uint64_t v9 = parseNum<unsigned int>(v8, (uint64_t)a2);
  if ((v9 & 1) == 0)
  {
    *a2 = a3;
    if (!a4) {
      return v9;
    }
    goto LABEL_5;
  }
  if (a4) {
LABEL_5:
  }
    setenv(a1, "", 1);
  return v9;
}

uint64_t findEnvVarNum<unsigned long long>(const char *a1, void *a2, uint64_t a3, int a4)
{
  id v8 = getenv(a1);
  if (!v8 || !*v8)
  {
    uint64_t v9 = 0;
    *a2 = a3;
    return v9;
  }
  uint64_t v9 = parseNum<unsigned long long>(v8, (uint64_t)a2);
  if ((v9 & 1) == 0)
  {
    *a2 = a3;
    if (!a4) {
      return v9;
    }
    goto LABEL_5;
  }
  if (a4) {
LABEL_5:
  }
    setenv(a1, "", 1);
  return v9;
}

void sub_245148194(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_2451483F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_245148734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_245148ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id computeKernel(void *a1, void *a2, void *a3, void *a4, void *a5, unint64_t a6, uint64_t a7)
{
  id v13 = a2;
  uint64_t v14 = functionFromLibrary(a1, a3, (uint64_t)a4, a5);
  if (!v14 || a4 && *a4)
  {
    id v15 = 0;
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x263F12850]);
    [v16 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:a7];
    [v16 setComputeFunction:v14];
    if (a6) {
      [v16 setMaxTotalThreadsPerThreadgroup:a6];
    }
    uint64_t v17 = (void *)[v13 newComputePipelineStateWithDescriptor:v16 error:a4];
    uint64_t v18 = v17;
    if (v17 && [v17 maxTotalThreadsPerThreadgroup] >= a6) {
      id v15 = v18;
    }
    else {
      id v15 = 0;
    }
  }

  return v15;
}

void sub_245148C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id tileKernel(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v15 = a2;
  id v16 = functionFromLibrary(a1, a3, (uint64_t)a4, a5);
  if (!v16 || a4 && *a4)
  {
    uint64_t v17 = 0;
  }
  else
  {
    id v18 = objc_alloc_init(MEMORY[0x263F12A70]);
    [v18 setSampleCount:1];
    [v18 setTileFunction:v16];
    if (a6) {
      [v18 setMaxTotalThreadsPerThreadgroup:a6];
    }
    id v27 = &a10;
    uint64_t v19 = a9;
    if (a9)
    {
      uint64_t v20 = 0;
      do
      {
        size_t v21 = [v18 colorAttachments];
        id v22 = [v21 objectAtIndexedSubscript:v20];
        [v22 setPixelFormat:v19];

        v23 = v27++;
        uint64_t v19 = *v23;
        ++v20;
      }
      while (*v23);
    }
    uint64_t v24 = (void *)[v15 newRenderPipelineStateWithTileDescriptor:v18 error:a4];
    uint64_t v17 = v24;
    if (v24) {
      id v25 = v24;
    }
  }

  return v17;
}

void sub_245148DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24514A0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  for (uint64_t i = 16; i != -8; i -= 8)
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v23 - 216));

  _Unwind_Resume(a1);
}

void checkInputOutputTextures(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v23 = a1;
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  if (!v23) {
    MTLReportFailure();
  }
  if (objc_msgSend(v23, "textureType", a9) != 2) {
    MTLReportFailure();
  }
  if ([v23 width] != a5) {
    MTLReportFailure();
  }
  if ([v23 height] != a6) {
    MTLReportFailure();
  }
  if (v19)
  {
    if ([v19 textureType] != 2) {
      MTLReportFailure();
    }
    if ([v19 width] != a5) {
      MTLReportFailure();
    }
    if ([v19 height] != a6) {
      MTLReportFailure();
    }
  }
  if (v20)
  {
    if ([v20 textureType] != 2) {
      MTLReportFailure();
    }
    if ([v20 width] != a5) {
      MTLReportFailure();
    }
    if ([v20 height] != a6) {
      MTLReportFailure();
    }
  }
  if (!v21) {
    MTLReportFailure();
  }
  if ([v21 textureType] != 2) {
    MTLReportFailure();
  }
  if ([v21 width] != a10) {
    MTLReportFailure();
  }
  if ([v21 height] != a11) {
    MTLReportFailure();
  }
  if ([v23 pixelFormat] != a7) {
    MTLReportFailure();
  }
  if ([v21 pixelFormat] != a12) {
    MTLReportFailure();
  }
  if ([v23 width] < a8) {
    MTLReportFailure();
  }
  if ([v23 height] < v22) {
    MTLReportFailure();
  }
}

void sub_24514A6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_24514A728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id functionFromLibrary(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  if (v9) {
    uint64_t v10 = [v7 newFunctionWithName:v8 constantValues:v9 error:a3];
  }
  else {
    uint64_t v10 = [v7 newFunctionWithName:v8];
  }
  uint64_t v11 = (void *)v10;

  return v11;
}

void sub_24514AD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MetalFxScopedSignpost::MetalFxScopedSignpost(MetalFxScopedSignpost *this, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_DWORD *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a4;
  *((void *)this + 3) = a5;
  *((void *)this + 4) = a6;
  if (MTLTraceEnabledSPI())
  {
    if (MTLTraceEnabled()) {
      kdebug_trace();
    }
  }
}

void MetalFxScopedSignpost::~MetalFxScopedSignpost(MetalFxScopedSignpost *this)
{
  if (MTLTraceEnabledSPI())
  {
    if (MTLTraceEnabled()) {
      kdebug_trace();
    }
  }
}

void __clang_call_terminate(void *a1)
{
}

id EmitBR_Net_V35_getMPSGraphExecutable(NSData *a1, const BRNetDescriptor *a2, MPSGraphCompilationDescriptor *a3)
{
  v335[4] = *MEMORY[0x263EF8340];
  v328 = a1;
  v258 = a3;
  v5 = objc_opt_new();
  v335[0] = &unk_26F9DB168;
  v335[1] = &unk_26F9DB180;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:a2->input_height];
  v335[2] = v6;
  id v7 = [NSNumber numberWithUnsignedInt:a2->input_width];
  v335[3] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v335 count:4];
  v318 = [v5 placeholderWithShape:v8 dataType:8 name:@"tensor0"];

  v313 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.007843];
  id v9 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 0, 1440);
  v312 = [v5 constantWithData:v9 shape:&unk_26F9DB2D0 dataType:536870920];

  uint64_t v10 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 1440, 16);
  v311 = [v5 constantWithData:v10 shape:&unk_26F9DB2E8 dataType:268435472];

  uint64_t v11 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 1456, 16);
  v310 = [v5 constantWithData:v11 shape:&unk_26F9DB300 dataType:268435472];

  v308 = [v5 constantWithScalar:&unk_26F9DB318 shape:268435472 dataType:0.0];
  v309 = [v5 constantWithScalar:&unk_26F9DB330 shape:268435472 dataType:1.0];
  v307 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.216797];
  uint64_t v12 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 1472, 9216);
  v306 = [v5 constantWithData:v12 shape:&unk_26F9DB348 dataType:536870920];

  id v13 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 10688, 64);
  v305 = [v5 constantWithData:v13 shape:&unk_26F9DB360 dataType:268435472];

  uint64_t v14 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 10752, 64);
  v304 = [v5 constantWithData:v14 shape:&unk_26F9DB378 dataType:268435472];

  id v15 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 10816, 9216);
  v303 = [v5 constantWithData:v15 shape:&unk_26F9DB390 dataType:536870920];

  id v16 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 20032, 64);
  v302 = [v5 constantWithData:v16 shape:&unk_26F9DB3A8 dataType:268435472];

  uint64_t v17 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 20096, 64);
  v301 = [v5 constantWithData:v17 shape:&unk_26F9DB3C0 dataType:268435472];

  id v18 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 20160, 18432);
  v300 = [v5 constantWithData:v18 shape:&unk_26F9DB3D8 dataType:536870920];

  id v19 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 38592, 128);
  v299 = [v5 constantWithData:v19 shape:&unk_26F9DB3F0 dataType:268435472];

  id v20 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 38720, 128);
  v298 = [v5 constantWithData:v20 shape:&unk_26F9DB408 dataType:268435472];

  id v21 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 38848, 73728);
  v297 = [v5 constantWithData:v21 shape:&unk_26F9DB420 dataType:536870920];

  unint64_t v22 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 112576, 256);
  v296 = [v5 constantWithData:v22 shape:&unk_26F9DB438 dataType:268435472];

  id v23 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 112832, 256);
  v295 = [v5 constantWithData:v23 shape:&unk_26F9DB450 dataType:268435472];

  v294 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:162.75];
  uint64_t v24 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 113088, 0x4000);
  v293 = [v5 constantWithData:v24 shape:&unk_26F9DB468 dataType:536870920];

  id v25 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 129472, 256);
  v292 = [v5 constantWithData:v25 shape:&unk_26F9DB480 dataType:268435472];

  size_t v26 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 129728, 256);
  v291 = [v5 constantWithData:v26 shape:&unk_26F9DB498 dataType:268435472];

  v319 = [v5 constantWithScalar:&unk_26F9DB4B0 shape:268435472 dataType:0.0];
  v320 = [v5 constantWithScalar:&unk_26F9DB4C8 shape:268435472 dataType:1.0];
  v289 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:232.75];
  id v27 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 129984, 0x2000);
  v288 = [v5 constantWithData:v27 shape:&unk_26F9DB4E0 dataType:536870920];

  v28 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 138176, 128);
  v287 = [v5 constantWithData:v28 shape:&unk_26F9DB4F8 dataType:268435472];

  uint64_t v29 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 138304, 128);
  v285 = [v5 constantWithData:v29 shape:&unk_26F9DB510 dataType:268435472];

  v284 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:169.0];
  int v30 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 138432, 16);
  v194 = [v5 constantWithData:v30 shape:&unk_26F9DB528 dataType:536870944];

  float v31 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 138448, 1024);
  v283 = [v5 constantWithData:v31 shape:&unk_26F9DB540 dataType:536870920];

  v32 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 139472, 128);
  v282 = [v5 constantWithData:v32 shape:&unk_26F9DB558 dataType:268435472];

  v281 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:172.0];
  v290 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:32.8125];
  v33 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 139600, 4096);
  v278 = [v5 constantWithData:v33 shape:&unk_26F9DB570 dataType:536870920];

  long long v34 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 143696, 128);
  v277 = [v5 constantWithData:v34 shape:&unk_26F9DB588 dataType:268435472];

  long long v35 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 143824, 128);
  v274 = [v5 constantWithData:v35 shape:&unk_26F9DB5A0 dataType:268435472];

  v324 = [v5 constantWithScalar:&unk_26F9DB5B8 shape:268435472 dataType:0.0];
  v325 = [v5 constantWithScalar:&unk_26F9DB5D0 shape:268435472 dataType:1.0];
  v273 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:43.71875];
  long long v36 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 143952, 2048);
  v272 = [v5 constantWithData:v36 shape:&unk_26F9DB5E8 dataType:536870920];

  long long v37 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 146000, 64);
  v269 = [v5 constantWithData:v37 shape:&unk_26F9DB600 dataType:268435472];

  v38 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 146064, 64);
  v268 = [v5 constantWithData:v38 shape:&unk_26F9DB618 dataType:268435472];

  v266 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:18.65625];
  uint64_t v39 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 146128, 16);
  v193 = [v5 constantWithData:v39 shape:&unk_26F9DB630 dataType:536870944];

  v40 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 146144, 512);
  v264 = [v5 constantWithData:v40 shape:&unk_26F9DB648 dataType:536870920];

  v41 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 146656, 64);
  v263 = [v5 constantWithData:v41 shape:&unk_26F9DB660 dataType:268435472];

  v257 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:12.539062];
  v286 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:5.898438];
  v190 = [v5 constantWithScalar:&unk_26F9DB678 shape:536870944 dataType:1.0];
  v191 = [v5 constantWithScalar:&unk_26F9DB690 shape:536870944 dataType:0.0];
  v192 = [v5 constantWithScalar:&unk_26F9DB6A8 shape:536870944 dataType:16.0];
  v317 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:1.546875];
  v42 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 146720, 1024);
  v256 = [v5 constantWithData:v42 shape:&unk_26F9DB6C0 dataType:536870920];

  v43 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 147744, 64);
  v255 = [v5 constantWithData:v43 shape:&unk_26F9DB6D8 dataType:268435472];

  v44 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 147808, 64);
  v251 = [v5 constantWithData:v44 shape:&unk_26F9DB6F0 dataType:268435472];

  v250 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:5.726562];
  v45 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 147872, 512);
  v248 = [v5 constantWithData:v45 shape:&unk_26F9DB708 dataType:536870920];

  v46 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148384, 32);
  v247 = [v5 constantWithData:v46 shape:&unk_26F9DB720 dataType:268435472];

  v47 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148416, 32);
  v246 = [v5 constantWithData:v47 shape:&unk_26F9DB738 dataType:268435472];

  v243 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:5.152344];
  v48 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148448, 32);
  v189 = [v5 constantWithData:v48 shape:&unk_26F9DB750 dataType:536870944];

  v188 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:0.0];
  v49 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148480, 16);
  v187 = [v5 constantWithData:v49 shape:&unk_26F9DB768 dataType:536870944];

  v50 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148496, 256);
  v240 = [v5 constantWithData:v50 shape:&unk_26F9DB780 dataType:536870920];

  v51 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148752, 32);
  v239 = [v5 constantWithData:v51 shape:&unk_26F9DB798 dataType:268435472];

  v234 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:5.457031];
  v323 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:49.75];
  v52 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 148784, 512);
  v232 = [v5 constantWithData:v52 shape:&unk_26F9DB7B0 dataType:536870920];

  v53 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 149296, 64);
  v231 = [v5 constantWithData:v53 shape:&unk_26F9DB7C8 dataType:268435472];

  v54 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 149360, 64);
  v230 = [v5 constantWithData:v54 shape:&unk_26F9DB7E0 dataType:268435472];

  v326 = [v5 constantWithScalar:&unk_26F9DB7F8 shape:268435472 dataType:0.0];
  v327 = [v5 constantWithScalar:&unk_26F9DB810 shape:268435472 dataType:1.0];
  v227 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:2.353516];
  v55 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 149424, 512);
  v226 = [v5 constantWithData:v55 shape:&unk_26F9DB828 dataType:536870920];

  v56 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 149936, 32);
  v225 = [v5 constantWithData:v56 shape:&unk_26F9DB840 dataType:268435472];

  v57 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 149968, 32);
  v222 = [v5 constantWithData:v57 shape:&unk_26F9DB858 dataType:268435472];

  v221 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.471436];
  v58 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 150000, 256);
  v220 = [v5 constantWithData:v58 shape:&unk_26F9DB870 dataType:536870920];

  v59 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 150256, 32);
  v216 = [v5 constantWithData:v59 shape:&unk_26F9DB888 dataType:268435472];

  v60 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 150288, 32);
  v214 = [v5 constantWithData:v60 shape:&unk_26F9DB8A0 dataType:268435472];

  v321 = [v5 constantWithScalar:&unk_26F9DB8B8 shape:268435472 dataType:0.0];
  v322 = [v5 constantWithScalar:&unk_26F9DB8D0 shape:268435472 dataType:1.0];
  v212 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.063416];
  v61 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 150320, 6336);
  v211 = [v5 constantWithData:v61 shape:&unk_26F9DB8E8 dataType:536870920];

  v62 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 156656, 88);
  v210 = [v5 constantWithData:v62 shape:&unk_26F9DB900 dataType:268435472];

  v63 = -[NSData subdataWithRange:](v328, "subdataWithRange:", 156744, 88);
  v207 = [v5 constantWithData:v63 shape:&unk_26F9DB918 dataType:268435472];

  v206 = [v5 constantWithScalar:&unk_26F9DB930 shape:268435472 dataType:0.0];
  v205 = [v5 constantWithScalar:&unk_26F9DB948 shape:268435472 dataType:1.0];
  v204 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.003922];
  v314 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:8 dataType:0.0];
  v203 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:3.0];
  v202 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:2.0];
  v201 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:1.0];
  v64 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870920 dataType:0.0];
  v280 = [v5 dequantizeTensor:v318 scaleTensor:v313 zeroPointTensor:v314 dataType:268435472 axis:0 name:@"tensor97"];
  v279 = [v5 dequantizeTensor:v312 scaleTensor:v311 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor98"];
  v186 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:2 paddingRight:2 paddingTop:2 paddingBottom:2 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v185 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v280, v279);
  LODWORD(v65) = 925353388;
  v184 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v65);
  v183 = objc_msgSend(v5, "reLUWithTensor:name:");
  v182 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v276 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v275 = [v5 dequantizeTensor:v306 scaleTensor:v305 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor104"];
  v181 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:2 paddingRight:2 paddingTop:2 paddingBottom:2 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v180 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v276, v275);
  LODWORD(v66) = 925353388;
  v179 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v66);
  v178 = objc_msgSend(v5, "reLUWithTensor:name:");
  v235 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v271 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v270 = [v5 dequantizeTensor:v303 scaleTensor:v302 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor110"];
  v177 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v176 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v271, v270);
  LODWORD(v67) = 925353388;
  v175 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v67);
  v174 = objc_msgSend(v5, "reLUWithTensor:name:");
  v173 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v315 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v267 = [v5 dequantizeTensor:v300 scaleTensor:v299 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor116"];
  v172 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v171 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v315, v267);
  LODWORD(v68) = 925353388;
  v170 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v68);
  v169 = objc_msgSend(v5, "reLUWithTensor:name:");
  v168 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v316 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v265 = [v5 dequantizeTensor:v297 scaleTensor:v296 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor122"];
  v167 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v166 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v316, v265);
  LODWORD(v69) = 925353388;
  v165 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v69);
  v164 = objc_msgSend(v5, "reLUWithTensor:name:");
  v163 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v262 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v261 = [v5 dequantizeTensor:v293 scaleTensor:v292 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor128"];
  v162 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v161 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v262, v261);
  LODWORD(v70) = 925353388;
  v160 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v70);
  v159 = objc_msgSend(v5, "reLUWithTensor:name:");
  v158 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v260 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v259 = [v5 dequantizeTensor:v288 scaleTensor:v287 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor134"];
  v157 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v156 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v260, v259);
  LODWORD(v71) = 925353388;
  v155 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v71);
  v154 = objc_msgSend(v5, "reLUWithTensor:name:");
  v153 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v152 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v252 = objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v253 = [v5 dequantizeTensor:v283 scaleTensor:v282 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor141"];
  v254 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:64 paddingLeft:3 paddingRight:3 paddingTop:3 paddingBottom:3 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v334[0] = &unk_26F9DB168;
  v334[1] = &unk_26F9DB1F8;
  v72 = [NSNumber numberWithUnsignedInt:a2->output_height >> 3];
  v334[2] = v72;
  v73 = [NSNumber numberWithUnsignedInt:a2->output_width >> 3];
  v334[3] = v73;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v334 count:4];
  v249 = [v5 convolutionTranspose2DWithSourceTensor:v252 weightsTensor:v253 outputShape:v74 descriptor:v254 name:@"tensor142"];

  v151 = [v5 quantizeTensor:v249 scaleTensor:v281 zeroPointTensor:v64 dataType:536870920 axis:0 name:@"tensor143"];
  v150 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v149 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v148 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v245 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v244 = [v5 dequantizeTensor:v278 scaleTensor:v277 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor148"];
  v147 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v146 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v245, v244);
  LODWORD(v75) = 925353388;
  v145 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v75);
  v144 = objc_msgSend(v5, "reLUWithTensor:name:");
  v143 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v242 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v241 = [v5 dequantizeTensor:v272 scaleTensor:v269 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor154"];
  v142 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v141 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v242, v241);
  LODWORD(v76) = 925353388;
  v140 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v76);
  v139 = objc_msgSend(v5, "reLUWithTensor:name:");
  v138 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v137 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v236 = objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v237 = [v5 dequantizeTensor:v264 scaleTensor:v263 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor161"];
  v238 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:32 paddingLeft:3 paddingRight:3 paddingTop:3 paddingBottom:3 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v333[0] = &unk_26F9DB168;
  v333[1] = &unk_26F9DB1C8;
  v77 = [NSNumber numberWithUnsignedInt:a2->output_height >> 2];
  v333[2] = v77;
  v78 = [NSNumber numberWithUnsignedInt:a2->output_width >> 2];
  v333[3] = v78;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v333 count:4];
  v233 = [v5 convolutionTranspose2DWithSourceTensor:v236 weightsTensor:v237 outputShape:v79 descriptor:v238 name:@"tensor162"];

  v136 = [v5 quantizeTensor:v233 scaleTensor:v257 zeroPointTensor:v64 dataType:536870920 axis:0 name:@"tensor163"];
  v135 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v134 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v133 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v229 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v132 = [v5 sliceTensor:v235 dimension:1 start:0 length:16 name:@"tensor168"];
  v215 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v228 = [v5 dequantizeTensor:v256 scaleTensor:v255 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor170"];
  v131 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v130 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v229, v228);
  LODWORD(v80) = 925353388;
  v129 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v80);
  v128 = objc_msgSend(v5, "reLUWithTensor:name:");
  v127 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v224 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v223 = [v5 dequantizeTensor:v248 scaleTensor:v247 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor176"];
  v126 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v125 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v224, v223);
  LODWORD(v81) = 925353388;
  v124 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v81);
  v123 = objc_msgSend(v5, "reLUWithTensor:name:");
  v122 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v121 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v217 = objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v218 = [v5 dequantizeTensor:v240 scaleTensor:v239 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor183"];
  v219 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:16 paddingLeft:3 paddingRight:3 paddingTop:3 paddingBottom:3 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v332[0] = &unk_26F9DB168;
  v332[1] = &unk_26F9DB240;
  v82 = [NSNumber numberWithUnsignedInt:a2->output_height >> 1];
  v332[2] = v82;
  v83 = [NSNumber numberWithUnsignedInt:a2->output_width >> 1];
  v332[3] = v83;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v332 count:4];
  v213 = [v5 convolutionTranspose2DWithSourceTensor:v217 weightsTensor:v218 outputShape:v84 descriptor:v219 name:@"tensor184"];

  v120 = [v5 quantizeTensor:v213 scaleTensor:v234 zeroPointTensor:v64 dataType:536870920 axis:0 name:@"tensor185"];
  v119 = [v5 dequantizeTensor:v120 scaleTensor:v234 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor186"];
  v118 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v117 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v209 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v208 = [v5 dequantizeTensor:v232 scaleTensor:v231 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor190"];
  v116 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v115 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v209, v208);
  LODWORD(v85) = 925353388;
  v114 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v85);
  v113 = objc_msgSend(v5, "reLUWithTensor:name:");
  v112 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v200 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v199 = [v5 dequantizeTensor:v226 scaleTensor:v225 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor196"];
  v111 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v110 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v200, v199);
  LODWORD(v86) = 925353388;
  v109 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v86);
  v108 = objc_msgSend(v5, "reLUWithTensor:name:");
  v107 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v198 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v197 = [v5 dequantizeTensor:v220 scaleTensor:v216 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor202"];
  v106 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v105 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v198, v197);
  LODWORD(v87) = 925353388;
  v104 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v87);
  v103 = objc_msgSend(v5, "reLUWithTensor:name:");
  v102 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v196 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v195 = [v5 dequantizeTensor:v211 scaleTensor:v210 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor208"];
  v101 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v100 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v196, v195);
  LODWORD(v88) = 925353388;
  v89 = objc_msgSend(v5, "normalizationWithTensor:meanTensor:varianceTensor:gammaTensor:betaTensor:epsilon:name:", v88);
  v90 = [v5 sigmoidWithTensor:v89 name:@"tensor211"];
  v91 = [v5 quantizeTensor:v90 scaleTensor:v204 zeroPointTensor:v314 dataType:8 axis:0 name:@"tensor212"];
  v92 = [v5 depthToSpace2DTensor:v91 widthAxisTensor:v203 heightAxisTensor:v202 depthAxisTensor:v201 blockSize:2 usePixelShuffleOrder:1 name:@"tensor213"];
  v331 = v92;
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v331 count:1];
  v329 = v318;
  id v94 = objc_alloc(MEMORY[0x263F13450]);
  v95 = [v318 shape];
  v96 = objc_msgSend(v94, "initWithShape:dataType:", v95, objc_msgSend(v318, "dataType"));
  v330 = v96;
  v97 = [NSDictionary dictionaryWithObjects:&v330 forKeys:&v329 count:1];

  v98 = [v5 compileWithDevice:0 feeds:v97 targetTensors:v93 targetOperations:0 compilationDescriptor:v258];

  return v98;
}

void sub_24514E574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

id EmitBR_Net_V35_2x_getMPSGraphExecutable(NSData *a1, const BRNetDescriptor *a2, MPSGraphCompilationDescriptor *a3)
{
  v323[4] = *MEMORY[0x263EF8340];
  v316 = a1;
  v248 = a3;
  v5 = objc_opt_new();
  v323[0] = &unk_26F9DB168;
  v323[1] = &unk_26F9DB180;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:a2->input_height];
  v323[2] = v6;
  id v7 = [NSNumber numberWithUnsignedInt:a2->input_width];
  v323[3] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v323 count:4];
  v314 = [v5 placeholderWithShape:v8 dataType:8 name:@"tensor0"];

  v309 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.007843];
  id v9 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 0, 1440);
  v308 = [v5 constantWithData:v9 shape:&unk_26F9DB9F0 dataType:536870920];

  uint64_t v10 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 1440, 16);
  v307 = [v5 constantWithData:v10 shape:&unk_26F9DBA08 dataType:268435472];

  uint64_t v11 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 1456, 16);
  v306 = [v5 constantWithData:v11 shape:&unk_26F9DBA20 dataType:268435472];

  v305 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.089966];
  uint64_t v12 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 1472, 18432);
  v304 = [v5 constantWithData:v12 shape:&unk_26F9DBA38 dataType:536870920];

  id v13 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 19904, 128);
  v303 = [v5 constantWithData:v13 shape:&unk_26F9DBA50 dataType:268435472];

  uint64_t v14 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 20032, 128);
  v302 = [v5 constantWithData:v14 shape:&unk_26F9DBA68 dataType:268435472];

  id v15 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 20160, 36864);
  v301 = [v5 constantWithData:v15 shape:&unk_26F9DBA80 dataType:536870920];

  id v16 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 57024, 128);
  v300 = [v5 constantWithData:v16 shape:&unk_26F9DBA98 dataType:268435472];

  uint64_t v17 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 57152, 128);
  v299 = [v5 constantWithData:v17 shape:&unk_26F9DBAB0 dataType:268435472];

  id v18 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 57280, 73728);
  v298 = [v5 constantWithData:v18 shape:&unk_26F9DBAC8 dataType:536870920];

  id v19 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 131008, 256);
  v297 = [v5 constantWithData:v19 shape:&unk_26F9DBAE0 dataType:268435472];

  id v20 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 131264, 256);
  v296 = [v5 constantWithData:v20 shape:&unk_26F9DBAF8 dataType:268435472];

  id v21 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 131520, 294912);
  v295 = [v5 constantWithData:v21 shape:&unk_26F9DBB10 dataType:536870920];

  unint64_t v22 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 426432, 512);
  v294 = [v5 constantWithData:v22 shape:&unk_26F9DBB28 dataType:268435472];

  id v23 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 426944, 512);
  v293 = [v5 constantWithData:v23 shape:&unk_26F9DBB40 dataType:268435472];

  v292 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:1.224609];
  uint64_t v24 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 427456, 0x10000);
  v291 = [v5 constantWithData:v24 shape:&unk_26F9DBB58 dataType:536870920];

  id v25 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 492992, 512);
  v290 = [v5 constantWithData:v25 shape:&unk_26F9DBB70 dataType:268435472];

  size_t v26 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 493504, 512);
  v288 = [v5 constantWithData:v26 shape:&unk_26F9DBB88 dataType:268435472];

  v287 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.895996];
  id v27 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 494016, 0x8000);
  v286 = [v5 constantWithData:v27 shape:&unk_26F9DBBA0 dataType:536870920];

  v28 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 526784, 256);
  v285 = [v5 constantWithData:v28 shape:&unk_26F9DBBB8 dataType:268435472];

  uint64_t v29 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 527040, 256);
  v283 = [v5 constantWithData:v29 shape:&unk_26F9DBBD0 dataType:268435472];

  v282 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.808105];
  int v30 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 527296, 16);
  v179 = [v5 constantWithData:v30 shape:&unk_26F9DBBE8 dataType:536870944];

  float v31 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 527312, 2048);
  v281 = [v5 constantWithData:v31 shape:&unk_26F9DBC00 dataType:536870920];

  v32 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 529360, 256);
  v280 = [v5 constantWithData:v32 shape:&unk_26F9DBC18 dataType:268435472];

  v276 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.729004];
  v289 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.556152];
  v33 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 529616, 0x4000);
  v275 = [v5 constantWithData:v33 shape:&unk_26F9DBC30 dataType:536870920];

  long long v34 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 546000, 256);
  v272 = [v5 constantWithData:v34 shape:&unk_26F9DBC48 dataType:268435472];

  long long v35 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 546256, 256);
  v270 = [v5 constantWithData:v35 shape:&unk_26F9DBC60 dataType:268435472];

  v266 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.465576];
  long long v36 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 546512, 0x2000);
  v265 = [v5 constantWithData:v36 shape:&unk_26F9DBC78 dataType:536870920];

  long long v37 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 554704, 128);
  v264 = [v5 constantWithData:v37 shape:&unk_26F9DBC90 dataType:268435472];

  v38 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 554832, 128);
  v261 = [v5 constantWithData:v38 shape:&unk_26F9DBCA8 dataType:268435472];

  v259 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.366455];
  uint64_t v39 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 554960, 16);
  v178 = [v5 constantWithData:v39 shape:&unk_26F9DBCC0 dataType:536870944];

  v40 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 554976, 1024);
  v257 = [v5 constantWithData:v40 shape:&unk_26F9DBCD8 dataType:536870920];

  v41 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 556000, 128);
  v254 = [v5 constantWithData:v41 shape:&unk_26F9DBCF0 dataType:268435472];

  v249 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.297607];
  v284 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.359131];
  v175 = [v5 constantWithScalar:&unk_26F9DBD08 shape:536870944 dataType:1.0];
  v176 = [v5 constantWithScalar:&unk_26F9DBD20 shape:536870944 dataType:0.0];
  v177 = [v5 constantWithScalar:&unk_26F9DBD38 shape:536870944 dataType:32.0];
  v313 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.167603];
  v42 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 556128, 4096);
  v247 = [v5 constantWithData:v42 shape:&unk_26F9DBD50 dataType:536870920];

  v43 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 560224, 128);
  v243 = [v5 constantWithData:v43 shape:&unk_26F9DBD68 dataType:268435472];

  v44 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 560352, 128);
  v242 = [v5 constantWithData:v44 shape:&unk_26F9DBD80 dataType:268435472];

  v240 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.186157];
  v45 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 560480, 2048);
  v239 = [v5 constantWithData:v45 shape:&unk_26F9DBD98 dataType:536870920];

  v46 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 562528, 64);
  v238 = [v5 constantWithData:v46 shape:&unk_26F9DBDB0 dataType:268435472];

  v47 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 562592, 64);
  v234 = [v5 constantWithData:v47 shape:&unk_26F9DBDC8 dataType:268435472];

  v233 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.189941];
  v48 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 562656, 32);
  v174 = [v5 constantWithData:v48 shape:&unk_26F9DBDE0 dataType:536870944];

  v173 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:0.0];
  v49 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 562688, 16);
  v172 = [v5 constantWithData:v49 shape:&unk_26F9DBDF8 dataType:536870944];

  v50 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 562704, 512);
  v229 = [v5 constantWithData:v50 shape:&unk_26F9DBE10 dataType:536870920];

  v51 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 563216, 64);
  v228 = [v5 constantWithData:v51 shape:&unk_26F9DBE28 dataType:268435472];

  v222 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.153076];
  v315 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.501953];
  v52 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 563280, 2048);
  v221 = [v5 constantWithData:v52 shape:&unk_26F9DBE40 dataType:536870920];

  v53 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 565328, 128);
  v220 = [v5 constantWithData:v53 shape:&unk_26F9DBE58 dataType:268435472];

  v54 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 565456, 128);
  v217 = [v5 constantWithData:v54 shape:&unk_26F9DBE70 dataType:268435472];

  v215 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.106323];
  v55 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 565584, 2048);
  v214 = [v5 constantWithData:v55 shape:&unk_26F9DBE88 dataType:536870920];

  v56 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 567632, 64);
  v211 = [v5 constantWithData:v56 shape:&unk_26F9DBEA0 dataType:268435472];

  v57 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 567696, 64);
  v209 = [v5 constantWithData:v57 shape:&unk_26F9DBEB8 dataType:268435472];

  v208 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.083557];
  v58 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 567760, 1024);
  v204 = [v5 constantWithData:v58 shape:&unk_26F9DBED0 dataType:536870920];

  v59 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 568784, 64);
  v203 = [v5 constantWithData:v59 shape:&unk_26F9DBEE8 dataType:268435472];

  v60 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 568848, 64);
  v200 = [v5 constantWithData:v60 shape:&unk_26F9DBF00 dataType:268435472];

  v199 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.077332];
  v61 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 568912, 12672);
  v198 = [v5 constantWithData:v61 shape:&unk_26F9DBF18 dataType:536870920];

  v62 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 581584, 88);
  v195 = [v5 constantWithData:v62 shape:&unk_26F9DBF30 dataType:268435472];

  v63 = -[NSData subdataWithRange:](v316, "subdataWithRange:", 581672, 88);
  v193 = [v5 constantWithData:v63 shape:&unk_26F9DBF48 dataType:268435472];

  v190 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:268435472 dataType:0.003922];
  v310 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:8 dataType:0.0];
  v188 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:3.0];
  v187 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:2.0];
  v186 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870944 dataType:1.0];
  v64 = [v5 constantWithScalar:MEMORY[0x263EFFA68] shape:536870920 dataType:0.0];
  v279 = [v5 dequantizeTensor:v314 scaleTensor:v309 zeroPointTensor:v310 dataType:268435472 axis:0 name:@"tensor85"];
  v278 = [v5 dequantizeTensor:v308 scaleTensor:v307 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor86"];
  v171 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:2 paddingRight:2 paddingTop:2 paddingBottom:2 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v277 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v279, v278);
  v170 = [v5 reshapeTensor:v306 withShape:&unk_26F9DBF60 name:@"tensor88_biasReshape"];
  v169 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v277);
  v168 = objc_msgSend(v5, "reLUWithTensor:name:");
  v167 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v274 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v273 = [v5 dequantizeTensor:v304 scaleTensor:v303 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor92"];
  v166 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:2 paddingRight:2 paddingTop:2 paddingBottom:2 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v271 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v274, v273);
  v165 = [v5 reshapeTensor:v302 withShape:&unk_26F9DBF78 name:@"tensor94_biasReshape"];
  v164 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v271);
  v163 = objc_msgSend(v5, "reLUWithTensor:name:");
  v224 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v269 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v268 = [v5 dequantizeTensor:v301 scaleTensor:v300 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor98"];
  v162 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v267 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v269, v268);
  v161 = [v5 reshapeTensor:v299 withShape:&unk_26F9DBF90 name:@"tensor100_biasReshape"];
  v160 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v267);
  v159 = objc_msgSend(v5, "reLUWithTensor:name:");
  v158 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v311 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v263 = [v5 dequantizeTensor:v298 scaleTensor:v297 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor104"];
  v157 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v262 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v311, v263);
  v156 = [v5 reshapeTensor:v296 withShape:&unk_26F9DBFA8 name:@"tensor106_biasReshape"];
  v155 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v262);
  v154 = objc_msgSend(v5, "reLUWithTensor:name:");
  v153 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v312 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v260 = [v5 dequantizeTensor:v295 scaleTensor:v294 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor110"];
  v152 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v258 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v312, v260);
  v151 = [v5 reshapeTensor:v293 withShape:&unk_26F9DBFC0 name:@"tensor112_biasReshape"];
  v150 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v258);
  v149 = objc_msgSend(v5, "reLUWithTensor:name:");
  v148 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v256 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v255 = [v5 dequantizeTensor:v291 scaleTensor:v290 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor116"];
  v147 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v253 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v256, v255);
  v146 = [v5 reshapeTensor:v288 withShape:&unk_26F9DBFD8 name:@"tensor118_biasReshape"];
  v145 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v253);
  v144 = objc_msgSend(v5, "reLUWithTensor:name:");
  v143 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v252 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v251 = [v5 dequantizeTensor:v286 scaleTensor:v285 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor122"];
  v142 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v250 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v252, v251);
  v141 = [v5 reshapeTensor:v283 withShape:&unk_26F9DBFF0 name:@"tensor124_biasReshape"];
  v140 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v250);
  v139 = objc_msgSend(v5, "reLUWithTensor:name:");
  v138 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v137 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v244 = objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v245 = [v5 dequantizeTensor:v281 scaleTensor:v280 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor129"];
  v246 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:128 paddingLeft:3 paddingRight:3 paddingTop:3 paddingBottom:3 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v322[0] = &unk_26F9DB168;
  v322[1] = &unk_26F9DB210;
  double v65 = [NSNumber numberWithUnsignedInt:a2->output_height >> 3];
  v322[2] = v65;
  double v66 = [NSNumber numberWithUnsignedInt:a2->output_width >> 3];
  v322[3] = v66;
  double v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v322 count:4];
  v241 = [v5 convolutionTranspose2DWithSourceTensor:v244 weightsTensor:v245 outputShape:v67 descriptor:v246 name:@"tensor130"];

  v136 = [v5 quantizeTensor:v241 scaleTensor:v276 zeroPointTensor:v64 dataType:536870920 axis:0 name:@"tensor131"];
  v135 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v134 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v133 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v237 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v236 = [v5 dequantizeTensor:v275 scaleTensor:v272 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor136"];
  v132 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v235 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v237, v236);
  v131 = [v5 reshapeTensor:v270 withShape:&unk_26F9DC038 name:@"tensor138_biasReshape"];
  v130 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v235);
  v129 = objc_msgSend(v5, "reLUWithTensor:name:");
  v128 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v232 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v231 = [v5 dequantizeTensor:v265 scaleTensor:v264 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor142"];
  v127 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v230 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v232, v231);
  v126 = [v5 reshapeTensor:v261 withShape:&unk_26F9DC050 name:@"tensor144_biasReshape"];
  v125 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v230);
  v124 = objc_msgSend(v5, "reLUWithTensor:name:");
  v123 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v122 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v225 = objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v226 = [v5 dequantizeTensor:v257 scaleTensor:v254 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor149"];
  v227 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:64 paddingLeft:3 paddingRight:3 paddingTop:3 paddingBottom:3 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v321[0] = &unk_26F9DB168;
  v321[1] = &unk_26F9DB1F8;
  double v68 = [NSNumber numberWithUnsignedInt:a2->output_height >> 2];
  v321[2] = v68;
  double v69 = [NSNumber numberWithUnsignedInt:a2->output_width >> 2];
  v321[3] = v69;
  double v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:v321 count:4];
  v223 = [v5 convolutionTranspose2DWithSourceTensor:v225 weightsTensor:v226 outputShape:v70 descriptor:v227 name:@"tensor150"];

  v121 = [v5 quantizeTensor:v223 scaleTensor:v249 zeroPointTensor:v64 dataType:536870920 axis:0 name:@"tensor151"];
  v120 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v119 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v118 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v219 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v117 = [v5 sliceTensor:v224 dimension:1 start:0 length:32 name:@"tensor156"];
  v202 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v218 = [v5 dequantizeTensor:v247 scaleTensor:v243 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor158"];
  v116 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v216 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v219, v218);
  v115 = [v5 reshapeTensor:v242 withShape:&unk_26F9DC098 name:@"tensor160_biasReshape"];
  v114 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v216);
  v113 = objc_msgSend(v5, "reLUWithTensor:name:");
  v112 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v213 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v212 = [v5 dequantizeTensor:v239 scaleTensor:v238 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor164"];
  v111 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v210 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v213, v212);
  v110 = [v5 reshapeTensor:v234 withShape:&unk_26F9DC0B0 name:@"tensor166_biasReshape"];
  v109 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v210);
  v108 = objc_msgSend(v5, "reLUWithTensor:name:");
  v107 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v106 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v205 = objc_msgSend(v5, "padTensor:withPaddingMode:leftPadding:rightPadding:constantValue:name:", 0.0);
  v206 = [v5 dequantizeTensor:v229 scaleTensor:v228 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor171"];
  v207 = [MEMORY[0x263F13408] descriptorWithStrideInX:2 strideInY:2 dilationRateInX:1 dilationRateInY:1 groups:32 paddingLeft:3 paddingRight:3 paddingTop:3 paddingBottom:3 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v320[0] = &unk_26F9DB168;
  v320[1] = &unk_26F9DB1C8;
  double v71 = [NSNumber numberWithUnsignedInt:a2->output_height >> 1];
  v320[2] = v71;
  v72 = [NSNumber numberWithUnsignedInt:a2->output_width >> 1];
  v320[3] = v72;
  v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v320 count:4];
  v201 = [v5 convolutionTranspose2DWithSourceTensor:v205 weightsTensor:v206 outputShape:v73 descriptor:v207 name:@"tensor172"];

  v105 = [v5 quantizeTensor:v201 scaleTensor:v222 zeroPointTensor:v64 dataType:536870920 axis:0 name:@"tensor173"];
  v104 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v103 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:");
  v102 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v197 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v196 = [v5 dequantizeTensor:v221 scaleTensor:v220 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor178"];
  v101 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v194 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v197, v196);
  v100 = [v5 reshapeTensor:v217 withShape:&unk_26F9DC0F8 name:@"tensor180_biasReshape"];
  v99 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v194);
  v98 = objc_msgSend(v5, "reLUWithTensor:name:");
  v97 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v192 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v191 = [v5 dequantizeTensor:v214 scaleTensor:v211 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor184"];
  v96 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v189 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v192, v191);
  v95 = [v5 reshapeTensor:v209 withShape:&unk_26F9DC110 name:@"tensor186_biasReshape"];
  id v94 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v189);
  v93 = objc_msgSend(v5, "reLUWithTensor:name:");
  v92 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v185 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v184 = [v5 dequantizeTensor:v204 scaleTensor:v203 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor190"];
  v91 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v183 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v185, v184);
  v90 = [v5 reshapeTensor:v200 withShape:&unk_26F9DC128 name:@"tensor192_biasReshape"];
  v89 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v183);
  double v88 = objc_msgSend(v5, "reLUWithTensor:name:");
  double v87 = objc_msgSend(v5, "quantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v182 = objc_msgSend(v5, "dequantizeTensor:scaleTensor:zeroPointTensor:dataType:axis:name:");
  v181 = [v5 dequantizeTensor:v198 scaleTensor:v195 zeroPointTensor:v64 dataType:268435472 axis:0 name:@"tensor196"];
  double v86 = [MEMORY[0x263F13408] descriptorWithStrideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 groups:1 paddingLeft:1 paddingRight:1 paddingTop:1 paddingBottom:1 paddingStyle:0 dataLayout:0 weightsLayout:2];
  v180 = objc_msgSend(v5, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v182, v181);
  double v85 = [v5 reshapeTensor:v193 withShape:&unk_26F9DC140 name:@"tensor198_biasReshape"];
  v74 = objc_msgSend(v5, "additionWithPrimaryTensor:secondaryTensor:name:", v180);
  double v75 = [v5 sigmoidWithTensor:v74 name:@"tensor199"];
  double v76 = [v5 quantizeTensor:v75 scaleTensor:v190 zeroPointTensor:v310 dataType:8 axis:0 name:@"tensor200"];
  v77 = [v5 depthToSpace2DTensor:v76 widthAxisTensor:v188 heightAxisTensor:v187 depthAxisTensor:v186 blockSize:2 usePixelShuffleOrder:1 name:@"tensor201"];
  v319 = v77;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v319 count:1];
  v317 = v314;
  id v79 = objc_alloc(MEMORY[0x263F13450]);
  double v80 = [v314 shape];
  double v81 = objc_msgSend(v79, "initWithShape:dataType:", v80, objc_msgSend(v314, "dataType"));
  v318 = v81;
  v82 = [NSDictionary dictionaryWithObjects:&v318 forKeys:&v317 count:1];

  v83 = [v5 compileWithDevice:0 feeds:v82 targetTensors:v78 targetOperations:0 compilationDescriptor:v248];

  return v83;
}

void sub_245152E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  _Unwind_Resume(a1);
}

BOOL isAtLeast2160p(unsigned int a1, unsigned int a2)
{
  if (a1 <= a2) {
    unsigned int v2 = a2;
  }
  else {
    unsigned int v2 = a1;
  }
  if (a1 >= a2) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = a1;
  }
  return v2 > 0xEFF && v3 > 0x86F;
}

void sub_245154F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,uint64_t a24,void *a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void MPSGraphMPSGraphExecutableWrapper::prewarm(uint64_t a1, void *a2, void *a3, void *a4, char a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  if (a5)
  {
    dispatch_group_t v22 = dispatch_group_create();
    id v23 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v22;

    *(unsigned char *)(a1 + 128) = 0;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 120));
    uint64_t v24 = *(NSObject **)(a1 + 120);
    id v25 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_group_notify(v24, v25, block);

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke_2;
    v26[3] = &unk_2651C6C18;
    uint64_t v32 = a1;
    uint64_t v33 = a6;
    id v27 = v19;
    id v28 = v18;
    char v36 = 1;
    id v29 = v20;
    uint64_t v34 = a9;
    id v30 = v21;
    uint64_t v35 = a10;
    id v31 = v17;
    dispatch_async(v25, v26);
  }
  else
  {
    *(unsigned char *)(a1 + 128) = 1;
  }
}

void MPSGraphMPSGraphExecutableWrapper::run(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, int a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  v37[1] = *MEMORY[0x263EF8340];
  id v31 = a2;
  id v30 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  if (*(void *)a1)
  {
    id v20 = objc_opt_new();
    [v20 setWaitUntilCompleted:a5];
    if (v18 && a6) {
      [v20 waitForANEPrePowerUpEvent:v18 value:a9];
    }
    if (v19)
    {
      [v20 waitForEvent:v19 value:a9];
      [v20 signalEvent:v19 atExecutionEvent:0 value:a10];
    }
    if (a6)
    {
      NSSelectorFromString(&cfstr_Compilationdes.isa);
      if (objc_opt_respondsToSelector())
      {
        id v21 = objc_opt_new();
        [v21 setOptimizationLevel:1];
        [v21 setOptimizationProfile:1];
        [v21 setAneCompilerSpatialSplitting:3];
        [v21 setEnableANELateLatch:1];
        [v21 setEnableANEFWToFWSignal:1];
        [v20 setCompilationDescriptor:v21];
      }
    }
    uint64_t v36 = *(void *)(a1 + 32);
    v37[0] = v17;
    dispatch_group_t v22 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v24 = v30;
    id v23 = v31;
    uint64_t v34 = *(void *)(a1 + 24);
    id v35 = v30;
    id v25 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    [*(id *)a1 runAsyncWithMTLCommandQueue:v31 feeds:v25 targetOperations:0 resultsDictionary:v22 executionDescriptor:v20];
  }
  else
  {
    if (!*(void *)(a1 + 8)) {
      __assert_rtn("run", "MetalFXTemporalScalingEffectV3.h", 198, "0");
    }
    id v26 = objc_alloc(MEMORY[0x263F13420]);
    id v27 = objc_opt_new();
    id v20 = (void *)[v26 initWithGraphExecutionDescriptor:v27];

    [v20 setWaitUntilCompleted:a5];
    if (v18 && a6 && *(unsigned char *)(a1 + 128)) {
      [v20 waitForANEPrePowerUpEvent:v18 value:a9];
    }
    if (v19)
    {
      [v20 waitForEvent:v19 value:a9];
      [v20 signalEvent:v19 atExecutionEvent:0 value:a10];
    }
    id v33 = v17;
    dispatch_group_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    uint64_t v24 = v30;
    id v23 = v31;
    id v32 = v30;
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    uint64_t v28 = 8;
    if (!*(unsigned char *)(a1 + 128)) {
      uint64_t v28 = 16;
    }
    id v29 = (id)[*(id *)(a1 + v28) runAsyncWithMTLCommandQueue:v31 inputsArray:v25 resultsArray:v22 executionDescriptor:v20];
  }
}

void sub_2451555FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_24515576C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_245155D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41)
{
  _Block_object_dispose((const void *)(v42 - 184), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);

  _Unwind_Resume(a1);
}

void sub_245156558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v18 - 128));
  _Unwind_Resume(a1);
}

void sub_245156644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2451568C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL15isInternalBuildv_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalBuild(void)::isInternal = result;
  return result;
}

uint64_t ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 128) = 1;
  return result;
}

void ___ZN33MPSGraphMPSGraphExecutableWrapper7prewarmEPU26objcproto15MTLCommandQueue11objc_objectP18MPSGraphTensorDataS3_byPU25objcproto14MTLSharedEvent11objc_objectS5_yy_block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 72);
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v10, 3, *(void *)(a1 + 80), 6, 0, 0);
  id v3 = objc_alloc(MEMORY[0x263F13420]);
  v4 = objc_opt_new();
  v5 = (void *)[v3 initWithGraphExecutionDescriptor:v4];

  [v5 setWaitUntilCompleted:1];
  v12[0] = *(void *)(a1 + 32);
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  if (*(void *)(a1 + 48) && *(unsigned char *)(a1 + 104) && *(unsigned char *)(v2 + 128)) {
    objc_msgSend(v5, "waitForANEPrePowerUpEvent:value:");
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    [v5 waitForEvent:v8 value:*(void *)(a1 + 88)];
    [v5 signalEvent:*(void *)(a1 + 56) atExecutionEvent:0 value:*(void *)(a1 + 96)];
  }
  id v9 = (id)[*(id *)(v2 + 8) runAsyncWithMTLCommandQueue:*(void *)(a1 + 64) inputsArray:v7 resultsArray:v6 executionDescriptor:v5];
  dispatch_group_leave(*(dispatch_group_t *)(v2 + 120));

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v10);
}

void sub_245157078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)&a9);
  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::~BRNet_v3_Filter(BRNet_v3_Filter *this)
{
  for (uint64_t i = 256; i != 240; i -= 8)
  for (uint64_t j = 224; j != 208; j -= 8)

  do
  {

    j -= 8;
  }
  while (j != 192);
  do
  {

    j -= 8;
  }
  while (j != 176);

  for (uint64_t k = 120; k != 104; k -= 8)
  do
  {

    k -= 8;
  }
  while (k != 88);
}

CHistoryRecord *CHistoryRecord::UpdateMinMax(CHistoryRecord *this)
{
  int v1 = 0;
  float v2 = 0.0;
  float v3 = 999.99;
  for (uint64_t i = 20; i != 500; i += 4)
  {
    float v5 = *(float *)((char *)&this->var0 + i);
    float v6 = fminf(v3, v5);
    float v7 = fmaxf(v2, v5);
    if (v5 > 0.0)
    {
      float v3 = v6;
      float v2 = v7;
      ++v1;
    }
  }
  if (!v1)
  {
    float v2 = 0.0;
    float v3 = 0.0;
  }
  this->var7 = v2;
  this->var6 = v3;
  return this;
}

void MPSGraphMPSGraphExecutableWrapper::~MPSGraphMPSGraphExecutableWrapper(MPSGraphMPSGraphExecutableWrapper *this)
{
  if (!this->_prewarmComplete) {
    dispatch_group_wait((dispatch_group_t)this->_prewarm_group, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void sub_24515740C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_245157498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_245157524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2451576EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2451577C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2451579C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_245157A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_245157D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_24515803C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24515865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v16 = v15;

  _Unwind_Resume(a1);
}

void sub_2451590C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v18 - 160));
  _Unwind_Resume(a1);
}

void sub_2451591C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_24515A2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_24515A51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_24515AE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)(v18 - 128));
  _Unwind_Resume(a1);
}

void sub_24515B29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24515B31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24515B534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_24515B860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int *BRNet_v3_Filter::BRNet_v3_Filter(int *a1, void *a2, void *a3, int a4, int a5, int a6, int a7, uint64_t a8, int a9, int a10, char a11, char a12, char a13, char a14)
{
  id v114 = a2;
  id v21 = a3;
  *(_OWORD *)(a1 + 18) = 0u;
  *(_OWORD *)(a1 + 34) = 0u;
  dispatch_group_t v22 = (id *)(a1 + 34);
  *(_OWORD *)(a1 + 22) = 0u;
  *(_OWORD *)(a1 + 26) = 0u;
  *((void *)a1 + 15) = 0;
  *(_OWORD *)(a1 + 38) = 0u;
  *(_OWORD *)(a1 + 42) = 0u;
  *(_OWORD *)(a1 + 46) = 0u;
  *(_OWORD *)(a1 + 50) = 0u;
  *(_OWORD *)(a1 + 54) = 0u;
  *(_OWORD *)(a1 + 58) = 0u;
  *(_OWORD *)(a1 + 62) = 0u;
  *(_OWORD *)(a1 + 66) = 0u;
  *(_OWORD *)(a1 + 70) = 0u;
  *(_OWORD *)(a1 + 74) = 0u;
  *(_OWORD *)(a1 + 78) = 0u;
  *(_OWORD *)(a1 + 82) = 0u;
  *(_OWORD *)(a1 + 86) = 0u;
  *(_OWORD *)(a1 + 90) = 0u;
  *(_OWORD *)(a1 + 94) = 0u;
  *(_OWORD *)(a1 + 98) = 0u;
  *(_OWORD *)(a1 + 102) = 0u;
  *(_OWORD *)(a1 + 106) = 0u;
  *a1 = a4;
  a1[1] = a5;
  *((void *)a1 + 1) = *(void *)(a8 + 4);
  a1[4] = a6;
  a1[5] = a7;
  long long v23 = *(_OWORD *)(a8 + 12);
  *((void *)&v23 + 1) = *(void *)(a8 + 44);
  *((unsigned char *)a1 + 60) = a14;
  char v119 = a13;
  *(_OWORD *)(a1 + 6) = v23;
  int v24 = *(_DWORD *)(a8 + 20);
  *((_WORD *)a1 + 26) = *(_DWORD *)(a8 + 24);
  *((_WORD *)a1 + 27) = *(_DWORD *)(a8 + 40);
  a1[10] = v24;
  a1[11] = a9;
  a1[12] = a10;
  a1[16] = *(_DWORD *)a8;
  *((unsigned char *)a1 + 58) = a11;
  *((unsigned char *)a1 + 59) = a13;
  id v25 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:65 width:a4 height:a5 mipmapped:0];
  [v25 setUsage:3];
  [v25 setCompressionMode:1];
  uint64_t v26 = [v114 newTextureWithDescriptor:v25];
  id v27 = (void *)*((void *)a1 + 9);
  *((void *)a1 + 9) = v26;

  [v25 setPixelFormat:115];
  uint64_t v28 = [v114 newTextureWithDescriptor:v25];
  id v29 = (void *)*((void *)a1 + 10);
  *((void *)a1 + 10) = v28;

  [v25 setWidth:a1[4]];
  [v25 setHeight:a1[5]];
  uint64_t v30 = [v114 newTextureWithDescriptor:v25];
  id v31 = (void *)*((void *)a1 + 11);
  *((void *)a1 + 11) = v30;

  *((unsigned char *)a1 + 128) = 0;
  [v25 setPixelFormat:25];
  [v25 setTextureType:2];
  [v25 setWidth:(uint64_t)(a1[2] + (a1[2] < 0)) >> 1];
  [v25 setHeight:(uint64_t)(a1[3] + (a1[3] < 0)) >> 1];
  [v25 setArrayLength:1];
  uint64_t v32 = [v114 newTextureWithDescriptor:v25];
  id v33 = (void *)*((void *)a1 + 12);
  *((void *)a1 + 12) = v32;

  uint64_t v34 = [v114 newTextureWithDescriptor:v25];
  id v35 = (void *)*((void *)a1 + 13);
  *((void *)a1 + 13) = v34;

  uint64_t v36 = [v114 newTextureWithDescriptor:v25];
  long long v37 = (void *)*((void *)a1 + 14);
  *((void *)a1 + 14) = v36;

  uint64_t v38 = [v114 newTextureWithDescriptor:v25];
  uint64_t v39 = (void *)*((void *)a1 + 15);
  *((void *)a1 + 15) = v38;

  if (v119) {
    uint64_t v40 = 30;
  }
  else {
    uint64_t v40 = 65;
  }
  [v25 setPixelFormat:v40];
  uint64_t v41 = [v114 newTextureWithDescriptor:v25];
  id v42 = *v22;
  *dispatch_group_t v22 = (id)v41;

  [v25 setPixelFormat:25];
  uint64_t v43 = [v114 newTextureWithDescriptor:v25];
  v44 = (void *)*((void *)a1 + 22);
  *((void *)a1 + 22) = v43;

  if (v119) {
    uint64_t v45 = 70;
  }
  else {
    uint64_t v45 = 115;
  }
  [v25 setPixelFormat:v45];
  objc_msgSend(v25, "setWidth:", (unint64_t)objc_msgSend(*v22, "width") >> 1);
  objc_msgSend(v25, "setHeight:", (unint64_t)objc_msgSend(*v22, "height") >> 1);
  uint64_t v46 = [v114 newTextureWithDescriptor:v25];
  v47 = (void *)*((void *)a1 + 18);
  *((void *)a1 + 18) = v46;

  [v25 setWidth:(uint64_t)(a1[2] + (a1[2] < 0)) >> 1];
  [v25 setHeight:(uint64_t)(a1[3] + (a1[3] < 0)) >> 1];
  uint64_t v48 = [v114 newBufferWithLength:4 * a1[1] * *a1 options:0];
  v49 = (void *)*((void *)a1 + 19);
  *((void *)a1 + 19) = v48;

  [v25 setPixelFormat:25];
  uint64_t v50 = [v114 newTextureWithDescriptor:v25];
  v51 = (void *)*((void *)a1 + 23);
  *((void *)a1 + 23) = v50;

  uint64_t v52 = [v114 newTextureWithDescriptor:v25];
  v53 = (void *)*((void *)a1 + 24);
  *((void *)a1 + 24) = v52;

  uint64_t v54 = [v114 newTextureWithDescriptor:v25];
  v55 = (void *)*((void *)a1 + 25);
  *((void *)a1 + 25) = v54;

  uint64_t v56 = [v114 newTextureWithDescriptor:v25];
  v57 = (void *)*((void *)a1 + 26);
  *((void *)a1 + 26) = v56;

  [v25 setPixelFormat:23];
  uint64_t v58 = [v114 newTextureWithDescriptor:v25];
  v59 = (void *)*((void *)a1 + 27);
  *((void *)a1 + 27) = v58;

  uint64_t v60 = [v114 newTextureWithDescriptor:v25];
  v61 = (void *)*((void *)a1 + 28);
  *((void *)a1 + 28) = v60;

  [v25 setPixelFormat:115];
  uint64_t v62 = [v114 newTextureWithDescriptor:v25];
  v63 = (void *)*((void *)a1 + 29);
  *((void *)a1 + 29) = v62;

  uint64_t v64 = [v114 newTextureWithDescriptor:v25];
  double v65 = (void *)*((void *)a1 + 30);
  *((void *)a1 + 30) = v64;

  [v25 setPixelFormat:65];
  [v25 setWidth:*a1];
  [v25 setHeight:a1[1]];
  uint64_t v66 = [v114 newTextureWithDescriptor:v25];
  double v67 = (void *)*((void *)a1 + 20);
  *((void *)a1 + 20) = v66;

  [v25 setPixelFormat:25];
  uint64_t v68 = [v114 newTextureWithDescriptor:v25];
  double v69 = (void *)*((void *)a1 + 21);
  *((void *)a1 + 21) = v68;

  uint64_t v70 = [v114 newBufferWithLength:2 options:0];
  double v71 = (void *)*((void *)a1 + 31);
  *((void *)a1 + 31) = v70;

  uint64_t v72 = [v114 newBufferWithLength:2 options:0];
  v73 = (void *)*((void *)a1 + 32);
  *((void *)a1 + 32) = v72;

  *(_WORD *)[*((id *)a1 + 31) contents] = COERCE_UNSIGNED_INT(1.0);
  *(_WORD *)[*((id *)a1 + 32) contents] = COERCE_UNSIGNED_INT(1.0);
  uint64_t v74 = [v114 newBufferWithLength:1 options:32];
  double v75 = (void *)*((void *)a1 + 33);
  *((void *)a1 + 33) = v74;

  uint64_t v76 = [v114 newBufferWithLength:0x2000 options:0];
  v77 = (void *)*((void *)a1 + 34);
  *((void *)a1 + 34) = v76;

  v78 = objc_opt_new();
  id v79 = v78;
  char v80 = a12;
  if (a12) {
    char v80 = *((unsigned char *)a1 + 58);
  }
  *((unsigned char *)a1 + 56) = v80;
  [v78 setConstantValue:a1 + 14 type:53 atIndex:10];
  [v79 setConstantValue:&v119 type:53 atIndex:13];
  [v79 setConstantValue:a1 + 15 type:53 atIndex:14];
  int v118 = 1023826251;
  [v79 setConstantValue:&v118 type:3 atIndex:9];
  uint64_t v81 = computeKernel(v21, v114, @"luma_log_sum", 0, v79, 0, 1);
  v82 = (void *)*((void *)a1 + 35);
  *((void *)a1 + 35) = v81;

  uint64_t v83 = computeKernel(v21, v114, @"luma_log_sum_to_exposure", 0, v79, 0, 1);
  v84 = (void *)*((void *)a1 + 36);
  *((void *)a1 + 36) = v83;

  uint64_t v85 = computeKernel(v21, v114, @"exposure_texture_to_buffer", 0, v79, 0, 1);
  double v86 = (void *)*((void *)a1 + 37);
  *((void *)a1 + 37) = v85;

  uint64_t v87 = computeKernel(v21, v114, @"brnetv3_build_tensors_low_resolution", 0, v79, 0, 1);
  double v88 = (void *)*((void *)a1 + 38);
  *((void *)a1 + 38) = v87;

  char v117 = 0;
  [v79 setConstantValue:&v117 type:53 atIndex:12];
  uint64_t v89 = computeKernel(v21, v114, @"brnetv3_lowres_signals", 0, v79, 0, 1);
  v90 = (void *)*((void *)a1 + 41);
  *((void *)a1 + 41) = v89;

  char v117 = 1;
  [v79 setConstantValue:&v117 type:53 atIndex:12];
  uint64_t v91 = computeKernel(v21, v114, @"brnetv3_lowres_signals", 0, v79, 0, 1);
  v92 = (void *)*((void *)a1 + 54);
  *((void *)a1 + 54) = v91;

  uint64_t v93 = computeKernel(v21, v114, @"brnetv3_warp_history_high_resolution", 0, v79, 0, 1);
  id v94 = (void *)*((void *)a1 + 40);
  *((void *)a1 + 40) = v93;

  uint64_t v95 = computeKernel(v21, v114, @"brnetv3_anisotropic_gaussian_filter", 0, v79, 0x400uLL, 1);
  v96 = (void *)*((void *)a1 + 42);
  *((void *)a1 + 42) = v95;

  __int16 v116 = 4;
  [v79 setConstantValue:&v116 type:41 atIndex:0];
  uint64_t v97 = computeKernel(v21, v114, @"brnetv3_output_spatial_lr", 0, v79, 0, 1);
  v98 = (void *)*((void *)a1 + 43);
  *((void *)a1 + 43) = v97;

  uint64_t v99 = computeKernel(v21, v114, @"brnetv3_output_temporal", 0, v79, 0, 1);
  v100 = (void *)*((void *)a1 + 44);
  *((void *)a1 + 44) = v99;

  char v115 = 1;
  [v79 setConstantValue:&v115 type:53 atIndex:5];
  uint64_t v101 = computeKernel(v21, v114, @"brnetv3_flow_splat", 0, v79, 0, 1);
  v102 = (void *)*((void *)a1 + 48);
  *((void *)a1 + 48) = v101;

  char v115 = 0;
  [v79 setConstantValue:&v115 type:53 atIndex:5];
  uint64_t v103 = computeKernel(v21, v114, @"brnetv3_flow_splat", 0, v79, 0, 1);
  v104 = (void *)*((void *)a1 + 49);
  *((void *)a1 + 49) = v103;

  uint64_t v105 = computeKernel(v21, v114, @"brnetv3_flow_splat_texture", 0, v79, 0, 1);
  v106 = (void *)*((void *)a1 + 50);
  *((void *)a1 + 50) = v105;

  uint64_t v107 = computeKernel(v21, v114, @"brnetv3_flow_diff_texture", 0, v79, 0, 1);
  v108 = (void *)*((void *)a1 + 51);
  *((void *)a1 + 51) = v107;

  uint64_t v109 = computeKernel(v21, v114, @"brnetv3_flow_splat_init_forward_z", 0, v79, 0, 1);
  v110 = (void *)*((void *)a1 + 52);
  *((void *)a1 + 52) = v109;

  uint64_t v111 = computeKernel(v21, v114, @"brnetv3_update_sample_statistics", 0, v79, 0, 1);
  v112 = (void *)*((void *)a1 + 53);
  *((void *)a1 + 53) = v111;

  return a1;
}

{
  return BRNet_v3_Filter::BRNet_v3_Filter(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void sub_24515C310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  for (uint64_t i = 0; i != -2; --i)
  for (uint64_t j = 0; j != -2; --j)

  for (uint64_t k = 0; k != -2; --k)
  for (uint64_t m = 0; m != -2; --m)

  for (uint64_t n = 0; n != -2; --n)
  for (iuint64_t i = 0; ii != -2; --ii)

  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::encodePre(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, float32x2_t a9, float32x2_t a10, float a11, double a12, float a13, void *a14, char a15, char a16, char a17, unsigned int a18)
{
  unsigned int v28 = a18;
  id v49 = a2;
  id v29 = a3;
  id v30 = a4;
  id v31 = a5;
  id v32 = a6;
  id v33 = a7;
  id v50 = a8;
  id v34 = a14;
  v80[0] = a15;
  float v79 = a13;
  a1[7].i8[1] = 0;
  __int32 v35 = a1[1].i32[0];
  int v36 = (unsigned __int16)v28 - v35 / 2;
  if (v36 < 0) {
    int v36 = v35 / 2 - (unsigned __int16)v28;
  }
  if (v36 <= 2)
  {
    __int32 v37 = a1[1].i32[1];
    int v38 = HIWORD(v28) - v37 / 2;
    if (v38 < 0) {
      int v38 = v37 / 2 - HIWORD(v28);
    }
    if (v38 <= 2) {
      a1[7].i8[1] = 1;
    }
  }
  if (a17)
  {
    [v29 setComputePipelineState:*(void *)&a1[35]];
    [v29 setTexture:v30 atIndex:0];
    [v29 setBytes:&a18 length:4 atIndex:1];
    [v29 setBuffer:*(void *)&a1[34] offset:0 atIndex:0];
    long long v77 = xmmword_245162850;
    uint64_t v78 = 1;
    long long v75 = xmmword_245162A40;
    uint64_t v76 = 1;
    [v29 dispatchThreadgroups:&v77 threadsPerThreadgroup:&v75];
    [v29 setComputePipelineState:*(void *)&a1[36]];
    [v29 setBuffer:*(void *)&a1[34] offset:0 atIndex:0];
    LODWORD(v60[0]) = (unsigned __int16)a18 * HIWORD(a18);
    [v29 setBytes:v60 length:4 atIndex:1];
    [v29 setBuffer:*(void *)&a1[a1[16].u8[0] + 31] offset:0 atIndex:2];
    [v29 setBuffer:*(void *)&a1[(a1[16].i8[0] == 0) + 31] offset:0 atIndex:3];
    [v29 setBuffer:*(void *)&a1[33] offset:0 atIndex:4];
    [v29 setBytes:v80 length:1 atIndex:5];
    int64x2_t v73 = vdupq_n_s64(1uLL);
    uint64_t v74 = 1;
    long long v71 = xmmword_245162860;
    uint64_t v72 = 1;
    [v29 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];
  }
  else
  {
    [v29 setComputePipelineState:*(void *)&a1[37]];
    [v29 setTexture:v50 atIndex:0];
    [v29 setBuffer:*(void *)&a1[a1[16].u8[0] + 31] offset:0 atIndex:0];
    [v29 setBuffer:*(void *)&a1[(a1[16].i8[0] == 0) + 31] offset:0 atIndex:1];
    [v29 setBuffer:*(void *)&a1[33] offset:0 atIndex:2];
    [v29 setBytes:v80 length:1 atIndex:3];
    int64x2_t v69 = vdupq_n_s64(1uLL);
    uint64_t v70 = 1;
    long long v67 = xmmword_245162A30;
    uint64_t v68 = 1;
    [v29 dispatchThreads:&v69 threadsPerThreadgroup:&v67];
  }
  objc_msgSend(v29, "setComputePipelineState:", *(void *)&a1[38], *(void *)&a12);
  [v29 setTexture:v30 atIndex:0];
  [v29 setTexture:v31 atIndex:1];
  [v29 setTexture:v32 atIndex:2];
  [v29 setTexture:*(void *)&a1[10] atIndex:3];
  [v29 setTexture:*(void *)&a1[9] atIndex:4];
  float v39 = -1.0;
  if (a16) {
    float v39 = 1.0;
  }
  float v66 = v39;
  [v29 setBytes:&v66 length:4 atIndex:0];
  [v29 setBytes:&a18 length:4 atIndex:1];
  [v29 setBytes:&v79 length:4 atIndex:2];
  [v29 setBuffer:*(void *)&a1[a1[16].u8[0] + 31] offset:0 atIndex:3];
  [v29 setBuffer:*(void *)&a1[(a1[16].i8[0] == 0) + 31] offset:0 atIndex:4];
  v65[0] = (unsigned __int16)a18 + 2;
  v65[1] = HIWORD(a18) + 2;
  v65[2] = 1;
  int64x2_t v63 = vdupq_n_s64(8uLL);
  uint64_t v64 = 1;
  [v29 dispatchThreads:v65 threadsPerThreadgroup:&v63];
  v60[0] = vmul_f32(a9, a10);
  v60[1] = __PAIR64__(v47, LODWORD(a11));
  if (!a1[7].i8[0])
  {
    [v29 setComputePipelineState:*(void *)&a1[40]];
    [v29 setTexture:*(void *)&a1[10] atIndex:0];
    [v29 setTexture:v33 atIndex:1];
    [v29 setTexture:*(void *)&a1[9] atIndex:2];
    [v29 setTexture:*(void *)&a1[11] atIndex:3];
    [v29 setBytes:v60 length:24 atIndex:0];
    [v29 setBytes:&a18 length:4 atIndex:1];
    [v29 setBuffer:*(void *)&a1[a1[16].u8[0] + 31] offset:0 atIndex:2];
    [v29 setBuffer:*(void *)&a1[(a1[16].i8[0] == 0) + 31] offset:0 atIndex:3];
    [v29 setBuffer:*(void *)&a1[33] offset:0 atIndex:4];
    uint32x2_t v40 = a1[2];
    *(void *)&long long v41 = v40.i32[0];
    *((void *)&v41 + 1) = v40.i32[1];
    long long v58 = v41;
    uint64_t v59 = 1;
    int64x2_t v56 = vdupq_n_s64(8uLL);
    uint64_t v57 = 1;
    [v29 dispatchThreads:&v58 threadsPerThreadgroup:&v56];
  }
  uint64_t v42 = 54;
  if (!a1[7].i8[1]) {
    uint64_t v42 = 41;
  }
  [v29 setComputePipelineState:*(void *)&a1[v42]];
  [v29 setTexture:*(void *)&a1[10] atIndex:0];
  [v29 setTexture:*(void *)&a1[11] atIndex:1];
  [v29 setTexture:*(void *)&a1[9] atIndex:2];
  [v29 setTexture:v33 atIndex:3];
  [v29 setTexture:*(void *)&a1[a1[16].u8[0] + 12] atIndex:4];
  [v29 setTexture:*(void *)&a1[a1[16].u8[0] + 14] atIndex:5];
  [v29 setTexture:*(void *)&a1[(a1[16].i8[0] == 0) + 12] atIndex:6];
  [v29 setTexture:*(void *)&a1[(a1[16].i8[0] == 0) + 14] atIndex:7];
  [v29 setTexture:*(void *)&a1[17] atIndex:8];
  [v29 setTexture:*(void *)&a1[22] atIndex:9];
  [v29 setTexture:*(void *)&a1[a1[16].u8[0] + 23] atIndex:12];
  [v29 setTexture:*(void *)&a1[a1[16].u8[0] + 25] atIndex:13];
  [v29 setTexture:*(void *)&a1[a1[16].u8[0] + 27] atIndex:14];
  [v29 setTexture:*(void *)&a1[29] atIndex:15];
  [v29 setTexture:*(void *)&a1[30] atIndex:16];
  [v29 setBytes:&a18 length:4 atIndex:1];
  __int16 v62 = a1[3].i32[1];
  __int32 v61 = a1[5].i32[1];
  [v29 setBytes:v60 length:24 atIndex:0];
  [v29 setBuffer:v34 offset:0 atIndex:2];
  [v29 setBuffer:*(void *)&a1[a1[16].u8[0] + 31] offset:0 atIndex:3];
  [v29 setBuffer:*(void *)&a1[(a1[16].i8[0] == 0) + 31] offset:0 atIndex:4];
  [v29 setBuffer:*(void *)&a1[33] offset:0 atIndex:5];
  objc_msgSend(v29, "setThreadgroupMemoryLength:atIndex:", 0x1000uLL / objc_msgSend(*(id *)&a1[41], "threadExecutionWidth"), 0);
  uint32x2_t v43 = vshr_n_u32(vsra_n_u32(a1[1], a1[1], 0x1FuLL), 1uLL);
  v55[1] = v43.i16[2];
  v55[0] = v43.i16[0];
  [v29 setBytes:v55 length:4 atIndex:6];
  uint32x2_t v44 = a1[3];
  *(void *)&long long v45 = v44.i32[0];
  *((void *)&v45 + 1) = v44.i32[1];
  long long v53 = v45;
  uint64_t v54 = 1;
  int64x2_t v51 = vdupq_n_s64(8uLL);
  uint64_t v52 = 1;
  [v29 dispatchThreads:&v53 threadsPerThreadgroup:&v51];
}

void sub_24515CD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::encodeMid(int *a1, void *a2, void *a3, void *a4, void *a5, char a6, unsigned int a7, float32x2_t a8, float32x2_t a9, float a10, double a11, double a12)
{
  id v21 = a2;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  float32x2_t v58 = a8;
  unsigned int v57 = a7;
  double v56 = a12;
  if (a6)
  {
    id v25 = a1 + 96;
  }
  else
  {
    [v22 setComputePipelineState:*((void *)a1 + 52)];
    [v22 setBuffer:*((void *)a1 + 19) offset:0 atIndex:0];
    uint64_t v54 = a1[1] * (uint64_t)*a1;
    int64x2_t v55 = vdupq_n_s64(1uLL);
    long long v52 = xmmword_245162A20;
    uint64_t v53 = 1;
    [v22 dispatchThreads:&v54 threadsPerThreadgroup:&v52];
    id v25 = a1 + 98;
  }
  objc_msgSend(v22, "setComputePipelineState:", *v25, *(void *)&a11);
  [v22 setTexture:*((void *)a1 + 9) atIndex:0];
  [v22 setTexture:v24 atIndex:1];
  [v22 setBuffer:*((void *)a1 + 19) offset:0 atIndex:0];
  [v22 setBytes:&v58 length:8 atIndex:1];
  v51[0] = (unsigned __int16)a7;
  v51[1] = HIWORD(a7);
  v51[2] = 1;
  int64x2_t v49 = vdupq_n_s64(8uLL);
  uint64_t v50 = 1;
  [v22 dispatchThreads:v51 threadsPerThreadgroup:&v49];
  [v22 setComputePipelineState:*((void *)a1 + 50)];
  [v22 setTexture:*((void *)a1 + 9) atIndex:0];
  [v22 setTexture:*((void *)a1 + 20) atIndex:1];
  [v22 setBuffer:*((void *)a1 + 19) offset:0 atIndex:0];
  [v22 setBytes:&v58 length:8 atIndex:1];
  *(void *)&long long v26 = (int)*(void *)a1;
  *((void *)&v26 + 1) = (int)HIDWORD(*(void *)a1);
  long long v47 = v26;
  uint64_t v48 = 1;
  int64x2_t v45 = vdupq_n_s64(8uLL);
  uint64_t v46 = 1;
  [v22 dispatchThreads:&v47 threadsPerThreadgroup:&v45];
  [v22 setComputePipelineState:*((void *)a1 + 51)];
  [v22 setTexture:*((void *)a1 + 9) atIndex:0];
  [v22 setTexture:*((void *)a1 + 20) atIndex:1];
  [v22 setTexture:*((void *)a1 + 21) atIndex:2];
  [v22 setBytes:&v58 length:8 atIndex:0];
  v44[0] = (unsigned __int16)a7;
  v44[1] = HIWORD(a7);
  v44[2] = 1;
  int64x2_t v42 = vdupq_n_s64(8uLL);
  uint64_t v43 = 1;
  [v22 dispatchThreads:v44 threadsPerThreadgroup:&v42];
  [v22 setComputePipelineState:*((void *)a1 + 53)];
  [v22 setTexture:*((void *)a1 + 9) atIndex:0];
  [v22 setTexture:*((void *)a1 + 21) atIndex:1];
  [v22 setTexture:*(void *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 46] atIndex:2];
  [v22 setTexture:*(void *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 50] atIndex:3];
  [v22 setTexture:*(void *)&a1[2 * (*((unsigned char *)a1 + 128) == 0) + 46] atIndex:4];
  [v22 setTexture:*(void *)&a1[2 * (*((unsigned char *)a1 + 128) == 0) + 50] atIndex:5];
  [v22 setTexture:*(void *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 54] atIndex:6];
  [v22 setTexture:*(void *)&a1[2 * (*((unsigned char *)a1 + 128) == 0) + 54] atIndex:8];
  [v22 setTexture:*((void *)a1 + 10) atIndex:10];
  float32x2_t v41 = vmul_f32(v58, a9);
  [v22 setBytes:&v41 length:8 atIndex:0];
  [v22 setBytes:&v57 length:4 atIndex:1];
  [v22 setBytes:&v56 length:8 atIndex:2];
  int v27 = a1[3];
  v40[0] = (uint64_t)(a1[2] + (a1[2] < 0)) >> 1;
  v40[1] = (uint64_t)(v27 + (v27 < 0)) >> 1;
  v40[2] = 1;
  int64x2_t v38 = vdupq_n_s64(8uLL);
  uint64_t v39 = 1;
  [v22 dispatchThreads:v40 threadsPerThreadgroup:&v38];
  if (*((unsigned char *)a1 + 56))
  {
    v37[0] = vmul_f32(v58, a9);
    v37[1] = __PAIR64__(v31, LODWORD(a10));
    [v22 setComputePipelineState:*((void *)a1 + 40)];
    [v22 setTexture:*((void *)a1 + 10) atIndex:0];
    [v22 setTexture:v23 atIndex:1];
    [v22 setTexture:*((void *)a1 + 9) atIndex:2];
    [v22 setTexture:*((void *)a1 + 11) atIndex:3];
    [v22 setBytes:v37 length:24 atIndex:0];
    [v22 setBytes:&v57 length:4 atIndex:1];
    [v22 setBuffer:*(void *)&a1[2 * *((unsigned __int8 *)a1 + 128) + 62] offset:0 atIndex:2];
    [v22 setBuffer:*(void *)&a1[2 * (*((unsigned char *)a1 + 128) == 0) + 62] offset:0 atIndex:3];
    [v22 setBuffer:*((void *)a1 + 33) offset:0 atIndex:4];
    uint64_t v28 = *((void *)a1 + 2);
    *(void *)&long long v29 = (int)v28;
    *((void *)&v29 + 1) = SHIDWORD(v28);
    long long v35 = v29;
    uint64_t v36 = 1;
    int64x2_t v33 = vdupq_n_s64(8uLL);
    uint64_t v34 = 1;
    [v22 dispatchThreads:&v35 threadsPerThreadgroup:&v33];
  }
}

void sub_24515D2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BRNet_v3_Filter::encodePost(int32x2_t *a1, float32x2_t a2, float32x2_t a3, float a4, double a5, float a6, uint64_t a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13, int a14, unsigned __int16 a15, unsigned __int16 a16)
{
  v25.i32[0] = a15;
  v25.i32[1] = a16;
  uint32x2_t v40 = v25;
  id v26 = a8;
  id v27 = a9;
  id v28 = a10;
  id v29 = a11;
  id v30 = a12;
  id v31 = a13;
  float32x2_t v56 = a2;
  float v55 = a6;
  float32x2_t v54 = vdiv_f32(vcvt_f32_u32(v40), vcvt_f32_s32(a1[2]));
  __int16 v53 = a1[4].i32[1];
  __int32 v52 = a1[6].i32[0];
  [v26 setComputePipelineState:*(void *)&a1[43]];
  [v26 setBuffer:v27 offset:0 atIndex:0];
  [v26 setTexture:*(void *)&a1[18] atIndex:0];
  [v26 setBytes:&v52 length:8 atIndex:1];
  uint64_t v32 = [*(id *)&a1[18] width];
  uint64_t v33 = [*(id *)&a1[18] height];
  v51[0] = v32;
  v51[1] = v33;
  v51[2] = 1;
  int64x2_t v49 = vdupq_n_s64(8uLL);
  uint64_t v50 = 1;
  [v26 dispatchThreads:v51 threadsPerThreadgroup:&v49];
  [v26 setComputePipelineState:*(void *)&a1[44]];
  [v26 setTexture:*(void *)&a1[17] atIndex:0];
  [v26 setBuffer:v27 offset:0 atIndex:0];
  [v26 setBytes:&v52 length:8 atIndex:1];
  uint64_t v34 = [*(id *)&a1[17] width];
  uint64_t v35 = [*(id *)&a1[17] height];
  v48[0] = v34;
  v48[1] = v35;
  v48[2] = 1;
  int64x2_t v46 = vdupq_n_s64(8uLL);
  uint64_t v47 = 1;
  [v26 dispatchThreads:v48 threadsPerThreadgroup:&v46];
  [v26 setComputePipelineState:*(void *)&a1[42]];
  [v26 setTexture:*(void *)&a1[10] atIndex:0];
  [v26 setTexture:*(void *)&a1[11] atIndex:1];
  [v26 setTexture:v28 atIndex:3];
  [v26 setTexture:v31 atIndex:4];
  [v26 setTexture:*(void *)&a1[21] atIndex:5];
  [v26 setTexture:*(void *)&a1[22] atIndex:6];
  [v26 setTexture:*(void *)&a1[9] atIndex:7];
  [v26 setTexture:*(void *)&a1[18] atIndex:11];
  [v26 setTexture:*(void *)&a1[17] atIndex:12];
  [v26 setTexture:*(void *)&a1[29] atIndex:13];
  [v26 setTexture:*(void *)&a1[30] atIndex:14];
  [v26 setTexture:*(void *)&a1[(a1[16].i8[0] == 0) + 23] atIndex:15];
  [v26 setTexture:*(void *)&a1[(a1[16].i8[0] == 0) + 25] atIndex:16];
  if (a1[7].i8[4])
  {
    unint64_t v45 = (unint64_t)vmul_f32(a2, a3);
    [v26 setBytes:&v45 length:8 atIndex:6];
    [v26 setTexture:v29 atIndex:17];
    [v26 setTexture:v30 atIndex:18];
  }
  unint64_t v45 = __PAIR64__(LODWORD(a5), LODWORD(a4));
  objc_msgSend(v26, "setBytes:length:atIndex:", &v45, 8, 0, *(void *)&a5);
  [v26 setBytes:&v54 length:8 atIndex:1];
  [v26 setBuffer:*(void *)&a1[33] offset:0 atIndex:2];
  [v26 setBytes:&v55 length:4 atIndex:3];
  [v26 setBuffer:*(void *)&a1[a1[16].u8[0] + 31] offset:0 atIndex:4];
  [v26 setBytes:&v56 length:8 atIndex:5];
  int32x2_t v36 = a1[2];
  *(void *)&long long v37 = v36.i32[0];
  *((void *)&v37 + 1) = v36.i32[1];
  long long v43 = v37;
  uint64_t v44 = 1;
  int64x2_t v41 = vdupq_n_s64(0x20uLL);
  uint64_t v42 = 1;
  [v26 dispatchThreads:&v43 threadsPerThreadgroup:&v41];
  a1[16].i8[0] = a1[16].i8[0] == 0;
}

void sub_24515D71C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x270EE45F0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLReportFailure()
{
  return MEMORY[0x270EF5F58]();
}

uint64_t MTLReportFailureTypeEnabled()
{
  return MEMORY[0x270EF5F60]();
}

uint64_t MTLTraceEnabled()
{
  return MEMORY[0x270EF5FC0]();
}

uint64_t MTLTraceEnabledSPI()
{
  return MEMORY[0x270EF5FC8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void findEnvVarNum<int>()
{
  while (1)
    ;
}

void findEnvVarNum<unsigned int>()
{
  while (1)
    ;
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x270EDB3D8](__name, __value, *(void *)&__overwrite);
}

void srand(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}