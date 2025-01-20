@interface NSItemProvider
@end

@implementation NSItemProvider

void __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5B05528;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  id v4 = (id)[v2 loadDataRepresentationForTypeIdentifier:v3 completionHandler:v5];
}

void __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_4;
    v5[3] = &unk_1E5B04E68;
    id v4 = &v8;
    id v8 = *(id *)(a1 + 40);
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_3;
    block[3] = &unk_1E5B05500;
    id v4 = &v10;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __62__NSItemProvider_LPExtras___lp_itemProviderWithData_MIMEType___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

@end