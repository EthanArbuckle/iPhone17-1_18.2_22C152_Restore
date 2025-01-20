@interface EXExtensionGenerateNSPredicateFromActivationDictionary
@end

@implementation EXExtensionGenerateNSPredicateFromActivationDictionary

uint64_t ___EXExtensionGenerateNSPredicateFromActivationDictionary_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_EXExtensionGenerateNSPredicateFromActivationDictionary_predicateCache;
  _EXExtensionGenerateNSPredicateFromActivationDictionary_predicateCache = (uint64_t)v0;

  v2 = (void *)_EXExtensionGenerateNSPredicateFromActivationDictionary_predicateCache;

  return [v2 setName:@"NSExtension predicate cache"];
}

@end