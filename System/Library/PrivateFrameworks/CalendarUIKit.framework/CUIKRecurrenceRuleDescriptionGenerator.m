@interface CUIKRecurrenceRuleDescriptionGenerator
- (id)naturalLanguageDescriptionForRecurrenceRule:(id)a3 withStartDate:(id)a4;
@end

@implementation CUIKRecurrenceRuleDescriptionGenerator

- (id)naturalLanguageDescriptionForRecurrenceRule:(id)a3 withStartDate:(id)a4
{
  return (id)[a3 humanReadableDescriptionWithStartDate:a4 isConcise:0];
}

@end