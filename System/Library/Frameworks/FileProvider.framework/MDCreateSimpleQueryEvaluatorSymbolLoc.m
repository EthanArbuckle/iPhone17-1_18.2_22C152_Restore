@interface MDCreateSimpleQueryEvaluatorSymbolLoc
@end

@implementation MDCreateSimpleQueryEvaluatorSymbolLoc

void *__get_MDCreateSimpleQueryEvaluatorSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileSpotlightIndexLibrary();
  result = dlsym(v2, "_MDCreateSimpleQueryEvaluator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end