@interface SecOTRVerifyAndExposeRaw
@end

@implementation SecOTRVerifyAndExposeRaw

void __SecOTRVerifyAndExposeRaw_locked_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = SecOTRPublicIdentityCopyFromPrivate(*MEMORY[0x1E4F1CF80], *(void *)(*(void *)(a1 + 32) + 24), 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = __SecOTRVerifyAndExposeRaw_locked_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_71_12199;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  SecOTRPIPerformWithSerializationString((uint64_t)v4, (uint64_t)v5);
  if (v4) {
    CFRelease(v4);
  }
}

void __SecOTRVerifyAndExposeRaw_locked_block_invoke_2(void *a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = __SecOTRVerifyAndExposeRaw_locked_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_70_12200;
  uint64_t v2 = *(void *)(a1[4] + 32);
  long long v5 = *((_OWORD *)a1 + 2);
  uint64_t v3 = a1[7];
  uint64_t v6 = a1[6];
  uint64_t v7 = a2;
  uint64_t v8 = v3;
  SecOTRPIPerformWithSerializationString(v2, (uint64_t)v4);
}

void __SecOTRVerifyAndExposeRaw_locked_block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = v5[10];
    uint64_t v8 = v5[11];
    uint64_t v9 = v5[13];
    uint64_t v10 = v5[14];
    int v16 = 134219522;
    v17 = v5;
    __int16 v18 = 2112;
    v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    uint64_t v29 = v6;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, session: %@, mk: %@, mpk: %@, tpk: %@, tk: %@, chose tktu: %@", (uint8_t *)&v16, 0x48u);
  }
  v11 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)a1[4];
    v13 = (void *)a1[6];
    uint64_t v14 = a1[7];
    uint64_t v15 = a1[8];
    int v16 = 134219010;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = a2;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, mktu: %@, mpi: %@, tpi: %@, m: %@", (uint8_t *)&v16, 0x34u);
  }
}

@end