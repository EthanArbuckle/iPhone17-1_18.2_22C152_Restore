@interface LAKeyStoreKey
@end

@implementation LAKeyStoreKey

void __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, void *a4)
{
  CFErrorRef error = 0;
  v6 = a4;
  CFDataRef v7 = SecKeyCopyExternalRepresentation(a3, &error);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v6[2](v6, error);
}

uint64_t __44___LAKeyStoreKey_exportBytesWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke(void *a1, __SecKey *a2, uint64_t a3, void *a4)
{
  CFErrorRef error = 0;
  CFStringRef v6 = (const __CFString *)a1[6];
  CFDataRef v7 = (const __CFData *)a1[4];
  uint64_t v8 = a4;
  CFDataRef v9 = SecKeyCreateSignature(a2, v6, v7, &error);
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v8[2](v8, error);
}

uint64_t __62___LAKeyStoreKey_signData_secKeyAlgorithm_context_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke(void *a1, __SecKey *a2, uint64_t a3, void *a4)
{
  CFErrorRef error = 0;
  CFStringRef v6 = (const __CFString *)a1[6];
  CFDataRef v7 = (const __CFData *)a1[4];
  uint64_t v8 = a4;
  CFDataRef v9 = SecKeyCreateDecryptedData(a2, v6, v7, &error);
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v8[2](v8, error);
}

uint64_t __65___LAKeyStoreKey_decryptData_secKeyAlgorithm_context_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  CFStringRef v6 = a2;
  CFDataRef v7 = a4;
  CFErrorRef v16 = 0;
  CFDataRef v8 = *(const __CFData **)(a1 + 32);
  uint64_t v9 = *MEMORY[0x1E4F3B6D8];
  v17[0] = *MEMORY[0x1E4F3B718];
  v17[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3B6F0];
  v18[0] = *MEMORY[0x1E4F3B740];
  v18[1] = v10;
  v11 = SecKeyCreateWithData(v8, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2], &v16);
  if (!v11 || v16)
  {
    if (v16)
    {
      v7[2](v7, v16);
    }
    else
    {
      v15 = +[LAAuthorizationError genericErrorWithMessage:@"Cannot perform a key exchange with the given public key."];
      v7[2](v7, v15);
    }
  }
  else
  {
    CFDataRef v12 = SecKeyCopyKeyExchangeResult(v6, *(SecKeyAlgorithm *)(a1 + 56), v11, *(CFDictionaryRef *)(a1 + 40), &v16);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    v7[2](v7, v16);
  }
}

uint64_t __96___LAKeyStoreKey_exchangeKeysWithPublicKey_secKeyAlgorithm_secKeyParameters_context_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke(void *a1, uint64_t a2, __SecKey *a3, void *a4)
{
  CFErrorRef error = 0;
  CFStringRef v6 = (const __CFString *)a1[6];
  CFDataRef v7 = (const __CFData *)a1[4];
  CFDataRef v8 = a4;
  CFDataRef v9 = SecKeyCreateEncryptedData(a3, v6, v7, &error);
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v8[2](v8, error);
}

uint64_t __57___LAKeyStoreKey_encryptData_secKeyAlgorithm_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

void __66___LAKeyStoreKey_verifyData_signature_secKeyAlgorithm_completion___block_invoke(void *a1, uint64_t a2, __SecKey *a3, void *a4)
{
  CFErrorRef error = 0;
  CFDataRef v6 = (const __CFData *)a1[5];
  CFStringRef v5 = (const __CFString *)a1[6];
  CFDataRef v7 = (const __CFData *)a1[4];
  CFDataRef v8 = a4;
  SecKeyVerifySignature(a3, v5, v7, v6, &error);
  v8[2](v8, error);
}

void __68___LAKeyStoreKey__performOperationWithContext_operation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  SecKeySetParameter();
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
}

@end