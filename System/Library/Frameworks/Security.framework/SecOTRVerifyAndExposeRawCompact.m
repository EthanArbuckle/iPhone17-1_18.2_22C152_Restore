@interface SecOTRVerifyAndExposeRawCompact
@end

@implementation SecOTRVerifyAndExposeRawCompact

void __SecOTRVerifyAndExposeRawCompact_locked_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = SecOTRPublicIdentityCopyFromPrivate(*MEMORY[0x1E4F1CF80], *(void *)(*(void *)(a1 + 32) + 24), 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  v6[2] = __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_2;
  v6[3] = &__block_descriptor_tmp_74_12195;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = a2;
  uint64_t v10 = v5;
  char v11 = *(unsigned char *)(a1 + 64);
  SecOTRPIPerformWithSerializationString((uint64_t)v4, (uint64_t)v6);
  if (v4) {
    CFRelease(v4);
  }
}

void __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_3;
  v3[3] = &__block_descriptor_tmp_73_12196;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = a2;
  long long v7 = *(_OWORD *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 72);
  SecOTRPIPerformWithSerializationString(v2, (uint64_t)v3);
}

void __SecOTRVerifyAndExposeRawCompact_locked_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v4 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = v5[10];
    uint64_t v8 = v5[11];
    uint64_t v9 = v5[13];
    uint64_t v10 = v5[14];
    int v18 = 134219522;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v6;
    _os_log_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, session: %@, mk: %@, mpk: %@, tpk: %@, tk: %@, chose tktu: %@", (uint8_t *)&v18, 0x48u);
  }
  char v11 = secLogObjForScope("OTR");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(void **)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 72);
    int v17 = *(unsigned __int8 *)(a1 + 80);
    int v18 = 134219522;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = a2;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    __int16 v30 = 1024;
    LODWORD(v31) = v17;
    _os_log_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEFAULT, "session[%p] failed to decrypt, mktu: %@, mpi: %@, tpi: %@, m: %@, tP: %@, tb: %hhx", (uint8_t *)&v18, 0x44u);
  }
}

@end