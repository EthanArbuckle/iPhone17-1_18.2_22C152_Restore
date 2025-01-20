@interface FEFocusUpdateRequest
@end

@implementation FEFocusUpdateRequest

uint64_t __78___FEFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [*(id *)(a1 + 32) environment];

  id v8 = v10;
  if (v6 != v10)
  {
    uint64_t v7 = _FEFocusEnvironmentPrefersFocusContainment(v10);
    id v8 = v10;
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v8 = v10;
      *a3 = 1;
    }
  }
  return MEMORY[0x270F9A758](v7, v8);
}

@end