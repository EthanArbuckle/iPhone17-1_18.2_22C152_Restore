@interface PSMessagesPinningFeedbackClass
@end

@implementation PSMessagesPinningFeedbackClass

Class __get_PSMessagesPinningFeedbackClass_block_invoke(uint64_t a1)
{
  PeopleSuggesterLibraryCore();
  Class result = objc_getClass("_PSMessagesPinningFeedback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_PSMessagesPinningFeedbackClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end