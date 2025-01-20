@interface HMTrigger(NaturalLanguage)
- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage;
- (id)hf_naturalLangugeDetailsWithOptions:()NaturalLanguage;
@end

@implementation HMTrigger(NaturalLanguage)

- (id)hf_naturalLangugeDetailsWithOptions:()NaturalLanguage
{
  v1 = objc_msgSend(a1, "_hf_naturalLanguageDetailsSentenceElementsWithOptions:");
  v2 = (void *)[v1 mutableCopy];

  if ([v2 count])
  {
    if (_MergedGlobals_239 != -1) {
      dispatch_once(&_MergedGlobals_239, &__block_literal_global_13_3);
    }
    id v3 = (id)qword_26AB2EF18;
    [v3 setListStyle:2];
    v4 = [v2 array];
    v5 = [v3 stringForObjectValue:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage
{
  if (qword_26AB2EF20 != -1) {
    dispatch_once(&qword_26AB2EF20, &__block_literal_global_17_3);
  }
  v0 = (void *)qword_26AB2EF28;
  return v0;
}

@end