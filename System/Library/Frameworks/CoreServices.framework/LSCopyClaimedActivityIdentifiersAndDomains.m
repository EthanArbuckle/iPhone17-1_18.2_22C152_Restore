@interface LSCopyClaimedActivityIdentifiersAndDomains
@end

@implementation LSCopyClaimedActivityIdentifiersAndDomains

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFSetRef v6 = _LSBundleCopyUserActivityTypes(**(void ***)(a1 + 48), a2, a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFSetRef v7 = v6;
  uint64_t v8 = [(__CFSet *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        CFSetAddValue(*(CFMutableSetRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(const void **)(*((void *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [(__CFSet *)v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  CFSetRef v11 = _LSBundleCopyUserActivityDomainNames(**(void **)(a1 + 48), a2, a3);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFSetRef v12 = v11;
  uint64_t v13 = [(__CFSet *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        CFSetAddValue(*(CFMutableSetRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(const void **)(*((void *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [(__CFSet *)v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v3);
}

void ___LSCopyClaimedActivityIdentifiersAndDomains_block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11 && v7)
  {
    id v9 = (id)[v11 mutableCopy];
    *(void *)(*(void *)(a1[4] + 8) + 24) = v9;

    id v10 = (id)[v7 mutableCopy];
    *(void *)(*(void *)(a1[5] + 8) + 24) = v10;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = _LSGetOSStatusFromNSError(v8);
  }
}

@end