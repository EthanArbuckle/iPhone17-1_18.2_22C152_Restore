@interface EXCopyingLoadOperator
@end

@implementation EXCopyingLoadOperator

void __42___EXCopyingLoadOperator_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v20 = 0;
    long long v9 = *(_OWORD *)(v8 + 40);
    v19[0] = *(_OWORD *)(v8 + 24);
    v19[1] = v9;
    v10 = [(id)v8 _sandboxedResourceForItemIfNeeded:v5 auditToken:v19 error:&v20];
    id v11 = v20;
    v7 = v11;
    if (v10 && !v11)
    {
      id v12 = v10;

      id v5 = v12;
    }
  }
  v13 = [_EXItemProviderItem alloc];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v7) {
    v15 = [(_EXItemProviderItem *)v13 initWithTypeIdentifier:v14 error:v7];
  }
  else {
    v15 = [(_EXItemProviderItem *)v13 initWithTypeIdentifier:v14 payload:v5];
  }
  v16 = v15;
  if (v15)
  {
    v17 = *(void **)(a1 + 48);
    v18 = [(_EXItemProviderItem *)v15 typeIdentifier];
    [v17 setObject:v16 forKey:v18];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

@end