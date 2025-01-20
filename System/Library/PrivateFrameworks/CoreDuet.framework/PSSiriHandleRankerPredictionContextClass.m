@interface PSSiriHandleRankerPredictionContextClass
@end

@implementation PSSiriHandleRankerPredictionContextClass

Class __get_PSSiriHandleRankerPredictionContextClass_block_invoke(uint64_t a1)
{
  PeopleSuggesterLibraryCore();
  Class result = objc_getClass("_PSSiriHandleRankerPredictionContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_PSSiriHandleRankerPredictionContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end