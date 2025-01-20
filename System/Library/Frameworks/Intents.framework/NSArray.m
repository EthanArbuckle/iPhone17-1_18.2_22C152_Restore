@interface NSArray
@end

@implementation NSArray

uint64_t __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL __41__NSArray_INKeyImageProducing___keyImage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1EDBB1E40])
  {
    v3 = [v2 _keyImage];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 addObject:v2];
}

uint64_t __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __51__NSArray_Intents___intents_indexingRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_intents_indexingRepresentation");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __40__NSArray_Intents__descriptionAtIndent___block_invoke(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = [a2 descriptionAtIndent:a1[6] + 1];
  [v2 appendFormat:@"%@    %@,", v3, v4];
}

uint64_t __138__NSArray_INIntentResolutionResultDataProviding__transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __138__NSArray_INIntentResolutionResultDataProviding__transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end