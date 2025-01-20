@interface MSRHDRProcessingT2
- (MSRHDRProcessingT2)init;
- (unsigned)polynomialTableScale;
- (void)setupHardwareConfigUnit;
- (void)setupMSRMappingTableWithMetadata:(id *)a3;
- (void)setupMSRPolynomialTableForHDR10;
- (void)updateMmrReshapeChromaForComponent:(unsigned __int16)a3 mmrReshapeChroma:(int)a4;
- (void)updateMmrTableForComponent:(unsigned __int16)a3 mmrClipValMin:(unsigned __int16 *)a4 mmrClipValMax:(unsigned __int16 *)a5 mmrCoeff:(float *)a6;
- (void)updatePolynomialTablesForComponent:(unsigned __int16 *)a3 Component:(unsigned __int16)a4 TableSize:(unint64_t)a5;
@end

@implementation MSRHDRProcessingT2

- (MSRHDRProcessingT2)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSRHDRProcessingT2;
  result = [(MSRHDRProcessing *)&v3 init];
  result->super.super._mmrEnable = 0;
  avdHistSupport = 1;
  return result;
}

- (void)setupHardwareConfigUnit
{
  v4.receiver = self;
  v4.super_class = (Class)MSRHDRProcessingT2;
  [(MSRHDRProcessingT1 *)&v4 setupHardwareConfigUnit];
  msrCU = self->super.super._msrCU;
  msrCU->var5 = (MSRHcuEntryHeader_t)0xC066726172;
  msrCU->var0 = (MSRHcuHeader_t)vadd_s32((int32x2_t)msrCU->var0, (int32x2_t)0xC000000001);
}

- (unsigned)polynomialTableScale
{
  return 16;
}

- (void)updatePolynomialTablesForComponent:(unsigned __int16 *)a3 Component:(unsigned __int16)a4 TableSize:(unint64_t)a5
{
  self->super.super._reshapeLUTCreated = 1;
  self->super.super._reshapeLUTSize = a5;
  if (a5)
  {
    v5 = &a3[a4 * a5];
    v6 = self->super.super._reshapeLUT[(unint64_t)a4];
    do
    {
      __int16 v7 = *v5++;
      *v6++ = 4 * v7;
      --a5;
    }
    while (a5);
  }
}

- (void)updateMmrTableForComponent:(unsigned __int16)a3 mmrClipValMin:(unsigned __int16 *)a4 mmrClipValMax:(unsigned __int16 *)a5 mmrCoeff:(float *)a6
{
  msrCU = self->super.super._msrCU;
  var4 = msrCU->var6.var4;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFDLL;
  do
  {
    *(var4 - 3) = a4[v8 + 3];
    *var4++ = a5[v8 + 3];
    ++v8;
  }
  while (v8 * 2);
  if (a3 == 1)
  {
    uint64_t v9 = 42044;
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v9 = 42132;
  }
  v10 = (char *)msrCU + v9;
  for (uint64_t i = 0; i != 22; ++i)
    *(float *)&v10[i * 4] = a6[i];
}

- (void)updateMmrReshapeChromaForComponent:(unsigned __int16)a3 mmrReshapeChroma:(int)a4
{
  p_var6 = &self->super.super._msrCU->var6;
  self->super.super._msrCU->var6.var2 = 4;
  if (a3 == 2)
  {
    p_var6->var1 = a4 != 0;
  }
  else if (a3 == 1)
  {
    p_var6->var0 = a4 != 0;
  }
}

- (void)setupMSRPolynomialTableForHDR10
{
  v4.receiver = self;
  v4.super_class = (Class)MSRHDRProcessingT2;
  [(MSRHDRProcessing *)&v4 setupMSRPolynomialTableForHDR10];
  for (int i = 0; i != 3; ++i)
    [(MSRHDRProcessingT2 *)self updateMmrReshapeChromaForComponent:(unsigned __int16)i mmrReshapeChroma:1];
}

- (void)setupMSRMappingTableWithMetadata:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unsigned int v5 = a3->var0 + 8;
  uint64_t v21 = (1 << (LOBYTE(a3->var0) + 8));
  v6 = malloc_type_malloc(6 << (LOBYTE(a3->var0) + 8), 0x742732A2uLL);
  __int16 v7 = malloc_type_calloc(0x2CuLL, 4uLL, 0x100004052888210uLL);
  uint64_t v9 = v7;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v11 = logInstanceID;
      }
      else {
        uint64_t v11 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = WORD1(v11);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"polyBuf && mmrCoefBuf\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingT2.mm\" at line 164\n", buf, 0xCu);
      }
      prevLogInstanceID = v11;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"polyBuf && mmrCoefBuf\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingT2.mm\" at line 164\n", buf, 2u);
    }
  }
  uint64_t v12 = 0;
  int v13 = -22;
  v14 = &_os_log_internal;
  uint64_t v15 = 276;
  *(void *)&long long v8 = 134217984;
  long long v20 = v8;
  do
  {
    unsigned int v16 = *(unsigned int *)((char *)&a3->var0 + v15);
    if (v16 >= 2)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v17 = logInstanceID;
        }
        else {
          uint64_t v17 = prevLogInstanceID;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          uint64_t v25 = WORD1(v17);
          _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"metadata->mapping_idc[0][0][cmp][0] == 0 || metadata->mapping_idc[0][0][cmp][0] == 1\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingT2.mm\" at line 167\n", buf, 0xCu);
        }
        prevLogInstanceID = v17;
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"metadata->mapping_idc[0][0][cmp][0] == 0 || metadata->mapping_idc[0][0][cmp][0] == 1\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingT2.mm\" at line 167\n", buf, 2u);
      }
      unsigned int v16 = *(unsigned int *)((char *)&a3->var0 + v15);
    }
    if (v16 && (v16 != 1 || [(MSRHDRProcessing *)self isMMREnabled]))
    {
      if (!v12)
      {
        if (enableLogInstance)
        {
          if (logInstanceID) {
            uint64_t v18 = logInstanceID;
          }
          else {
            uint64_t v18 = prevLogInstanceID;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            uint64_t v25 = WORD1(v18);
            _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"cmp != 0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingT2.mm\" at line 182\n", buf, 0xCu);
          }
          prevLogInstanceID = v18;
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22224D000, v14, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"cmp != 0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/MSR/MSRHDRProcessingT2.mm\" at line 182\n", buf, 2u);
        }
      }
      createMmrTableForComponent((uint64_t)a3, v12, (uint64_t)v23, (uint64_t)v22, &v9[v13 & 0xFFFFFFFE]);
      [(MSRHDRProcessingT2 *)self updateMmrTableForComponent:(unsigned __int16)v12 mmrClipValMin:v23 mmrClipValMax:v22 mmrCoeff:&v9[v13 & 0xFFFFFFFE]];
      uint64_t v19 = 0;
    }
    else
    {
      createPolynomialTableForComponent((int *)a3, v12, (uint64_t)v6 + 2 * (v12 << v5));
      [(MSRHDRProcessingT2 *)self updatePolynomialTablesForComponent:v6 Component:(unsigned __int16)v12 TableSize:v21];
      uint64_t v19 = 1;
    }
    -[MSRHDRProcessingT2 updateMmrReshapeChromaForComponent:mmrReshapeChroma:](self, "updateMmrReshapeChromaForComponent:mmrReshapeChroma:", (unsigned __int16)v12++, v19, v20);
    v13 += 22;
    v15 += 36;
  }
  while (v12 != 3);
  free(v9);
  free(v6);
}

@end