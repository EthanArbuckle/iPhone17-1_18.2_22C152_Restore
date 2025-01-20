@interface NSError
@end

@implementation NSError

void __73__NSError_EKAdditions___cal_serializedEntryForKey_value_outKey_outValue___block_invoke(uint64_t a1, SecCertificateRef certificate)
{
  CFDataRef v3 = SecCertificateCopyData(certificate);
  if (v3)
  {
    CFDataRef v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    CFRelease(v4);
  }
}

void __48__NSError_EKAdditions__cal_serializableUserInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    id v18 = 0;
    id v19 = 0;
    int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "_cal_serializedEntryForKey:value:outKey:outValue:", v5, v6, &v19, &v18);
    id v8 = v19;
    id v9 = v18;
    if (v7)
    {
      v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v10)
      {
        uint64_t v11 = [*(id *)(a1 + 40) mutableCopy];
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v10 removeObjectForKey:v5];
      if (v8 && v9) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v9 forKeyedSubscript:v8];
      }
    }
  }
  else
  {
    v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v14)
    {
      uint64_t v15 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v14 removeObjectForKey:v5];
  }
}

@end