@interface PSCNAutocompleteFeedbackClass
@end

@implementation PSCNAutocompleteFeedbackClass

Class __get_PSCNAutocompleteFeedbackClass_block_invoke(uint64_t a1)
{
  PeopleSuggesterLibraryCore();
  Class result = objc_getClass("_PSCNAutocompleteFeedback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_PSCNAutocompleteFeedbackClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end