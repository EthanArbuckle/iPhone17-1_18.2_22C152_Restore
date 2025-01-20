@interface ECDKIMCryptoUtil
+ (BOOL)verifySignedData:(id)a3 withSignatureData:(id)a4 publicKeyData:(id)a5 hashingAlgorithm:(unint64_t)a6 error:(id *)a7;
@end

@implementation ECDKIMCryptoUtil

uint64_t ___ef_log_ECDKIMCryptoUtil_block_invoke()
{
  _ef_log_ECDKIMCryptoUtil_log = (uint64_t)os_log_create("com.apple.email", "ECDKIMCryptoUtil");
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)verifySignedData:(id)a3 withSignatureData:(id)a4 publicKeyData:(id)a5 hashingAlgorithm:(unint64_t)a6 error:(id *)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  CFDataRef v12 = (const __CFData *)a4;
  CFDataRef v13 = (const __CFData *)a5;
  if (v12)
  {
    CFErrorRef error = 0;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v15 = Mutable;
    if (!Mutable)
    {
      int v19 = 0;
LABEL_28:
      if (error)
      {
        if (a7)
        {
          v45 = error;
          *a7 = v45;
        }
        else
        {
          CFRelease(error);
        }
      }
      BOOL v28 = v19 == 1;
      goto LABEL_33;
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B718], (const void *)*MEMORY[0x1E4F3B760]);
    CFDictionaryAddValue(v15, (const void *)*MEMORY[0x1E4F3B6D8], (const void *)*MEMORY[0x1E4F3B6F0]);
    CFDictionaryAddValue(v15, (const void *)*MEMORY[0x1E4F3BC78], (const void *)*MEMORY[0x1E4F1CFD0]);
    v16 = SecKeyCreateWithData(v13, v15, &error);
    if (v16)
    {
      if (a6 == 1)
      {
        *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)md = v36;
        *(_OWORD *)&md[16] = v36;
        id v37 = v11;
        CC_SHA256((const void *)[v37 bytes], objc_msgSend(v37, "length"), md);
        CFDataRef v18 = CFDataCreate(0, md, 32);
        int v19 = SecKeyVerifySignature(v16, (SecKeyAlgorithm)*MEMORY[0x1E4F3BAD0], v18, v12, &error);
        if (!v19)
        {
          v38 = _ef_log_ECDKIMCryptoUtil();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:]((uint64_t)&error, v38, v39, v40, v41, v42, v43, v44);
          }
        }
        goto LABEL_25;
      }
      if (!a6)
      {
        memset(md, 170, 20);
        id v17 = v11;
        CC_SHA1((const void *)[v17 bytes], objc_msgSend(v17, "length"), md);
        CFDataRef v18 = CFDataCreate(0, md, 20);
        int v19 = SecKeyVerifySignature(v16, (SecKeyAlgorithm)*MEMORY[0x1E4F3BAC8], v18, v12, &error);
        if (!v19)
        {
          v20 = _ef_log_ECDKIMCryptoUtil();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:]((uint64_t)&error, v20, v21, v22, v23, v24, v25, v26);
          }
        }
LABEL_25:
        CFRelease(v18);
LABEL_26:
        CFRelease(v15);
        if (v16) {
          CFRelease(v16);
        }
        goto LABEL_28;
      }
    }
    else
    {
      v29 = _ef_log_ECDKIMCryptoUtil();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:]((uint64_t)&error, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    int v19 = 0;
    goto LABEL_26;
  }
  v27 = _ef_log_ECDKIMCryptoUtil();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:](v27);
  }

  if (a7)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-67688 userInfo:0];
    BOOL v28 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v28 = 0;
  }
LABEL_33:

  return v28;
}

+ (void)verifySignedData:(os_log_t)log withSignatureData:publicKeyData:hashingAlgorithm:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Unable to verify signed data because signature is nil.", v1, 2u);
}

+ (void)verifySignedData:(uint64_t)a3 withSignatureData:(uint64_t)a4 publicKeyData:(uint64_t)a5 hashingAlgorithm:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)verifySignedData:(uint64_t)a3 withSignatureData:(uint64_t)a4 publicKeyData:(uint64_t)a5 hashingAlgorithm:(uint64_t)a6 error:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end