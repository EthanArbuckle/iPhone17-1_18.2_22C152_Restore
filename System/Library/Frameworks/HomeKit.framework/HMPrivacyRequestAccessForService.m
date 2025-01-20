@interface HMPrivacyRequestAccessForService
@end

@implementation HMPrivacyRequestAccessForService

uint64_t ____HMPrivacyRequestAccessForService_block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = ____HMPrivacyRequestAccessForService_block_invoke_2;
    v9 = &unk_1E5940600;
    id v10 = *(id *)(a1 + 48);
    char v11 = v2;
    dispatch_async(v4, &v6);
  }
  else
  {
    (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2 != 0);
  }
  return objc_msgSend(*(id *)(a1 + 40), "invalidate", v6, v7, v8, v9);
}

uint64_t ____HMPrivacyRequestAccessForService_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) != 0);
}

@end