@interface HFUnknownCondition
+ (BOOL)canHandlePredicate:(id)a3;
- (id)hf_naturalLanguageSummaryWithOptions:(id)a3;
@end

@implementation HFUnknownCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v4 = a3;
  v5 = _HFLocalizedStringWithDefaultValue(@"HFConditionNameUnknown", @"HFConditionNameUnknown", 1);
  uint64_t v6 = [v4 formattingContext];

  if (v6 != 5)
  {
    uint64_t v7 = objc_msgSend(v5, "hf_stringByCapitalizingFirstWord");

    v5 = (void *)v7;
  }
  v8 = [[HFConditionUISummary alloc] initWithCondition:self title:v5 description:0];

  return v8;
}

+ (BOOL)canHandlePredicate:(id)a3
{
  return 1;
}

@end