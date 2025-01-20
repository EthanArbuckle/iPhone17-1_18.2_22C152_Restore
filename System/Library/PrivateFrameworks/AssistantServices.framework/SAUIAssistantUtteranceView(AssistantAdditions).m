@interface SAUIAssistantUtteranceView(AssistantAdditions)
- (uint64_t)af_isUtterance;
@end

@implementation SAUIAssistantUtteranceView(AssistantAdditions)

- (uint64_t)af_isUtterance
{
  return 1;
}

@end