@interface PSContactSuggesterClass
@end

@implementation PSContactSuggesterClass

Class __get_PSContactSuggesterClass_block_invoke(uint64_t a1)
{
  PeopleSuggesterLibraryCore();
  Class result = objc_getClass("_PSContactSuggester");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_PSContactSuggesterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end