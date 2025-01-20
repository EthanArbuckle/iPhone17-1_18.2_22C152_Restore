@interface SecKeyAlgorithmAdaptorCopyResult
@end

@implementation SecKeyAlgorithmAdaptorCopyResult

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15SHA256_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15SHA1_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15SHA384_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPSSSHA512_block_invoke(uint64_t a1, const __CFData *a2)
{
  CFDictionaryRef v4 = SecKeyCopyAttributes(**(SecKeyRef **)(a1 + 32));
  v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"bsiz"];
  ccsha512_di();
  ccsha512_di();
  ccsha512_di();
  CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  [v5 integerValue];
  CFDataGetBytePtr(a2);
  BOOL v6 = ccrsa_emsa_pss_decode() == 0;

  return v6;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPSSSHA384_block_invoke(uint64_t a1, const __CFData *a2)
{
  CFDictionaryRef v4 = SecKeyCopyAttributes(**(SecKeyRef **)(a1 + 32));
  v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"bsiz"];
  ccsha384_di();
  ccsha384_di();
  ccsha384_di();
  CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  [v5 integerValue];
  CFDataGetBytePtr(a2);
  BOOL v6 = ccrsa_emsa_pss_decode() == 0;

  return v6;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPSSSHA256_block_invoke(uint64_t a1, const __CFData *a2)
{
  CFDictionaryRef v4 = SecKeyCopyAttributes(**(SecKeyRef **)(a1 + 32));
  v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"bsiz"];
  ccsha256_di();
  ccsha256_di();
  ccsha256_di();
  CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  [v5 integerValue];
  CFDataGetBytePtr(a2);
  BOOL v6 = ccrsa_emsa_pss_decode() == 0;

  return v6;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPSSSHA224_block_invoke(uint64_t a1, const __CFData *a2)
{
  CFDictionaryRef v4 = SecKeyCopyAttributes(**(SecKeyRef **)(a1 + 32));
  v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"bsiz"];
  ccsha224_di();
  ccsha224_di();
  ccsha224_di();
  CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  [v5 integerValue];
  CFDataGetBytePtr(a2);
  BOOL v6 = ccrsa_emsa_pss_decode() == 0;

  return v6;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPSSSHA1_block_invoke(uint64_t a1, const __CFData *a2)
{
  CFDictionaryRef v4 = SecKeyCopyAttributes(**(SecKeyRef **)(a1 + 32));
  v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:@"bsiz"];
  ccsha1_di();
  ccsha1_di();
  ccsha1_di();
  CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  [v5 integerValue];
  CFDataGetBytePtr(a2);
  BOOL v6 = ccrsa_emsa_pss_decode() == 0;

  return v6;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15MD5_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15Raw_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15SHA512_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureDigestPKCS1v15SHA224_block_invoke(uint64_t a1, CFDataRef theData)
{
  return ccrsa_emsa_pkcs1v15_verify() == 0;
}

BOOL __SecKeyAlgorithmAdaptorCopyResult_Verify_RSASignatureRaw_block_invoke(uint64_t a1, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  if (*BytePtr) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = Length < 1;
  }
  if (v6)
  {
    size_t v7 = Length;
  }
  else
  {
    do
    {
      int v8 = *++BytePtr;
      size_t v7 = Length - 1;
      if (v8) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = (unint64_t)Length > 1;
      }
      --Length;
    }
    while (v9);
  }
  if (v7 != CFDataGetLength(*(CFDataRef *)(a1 + 32))) {
    return 0;
  }
  v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
  return memcmp(v10, BytePtr, v7) == 0;
}

@end