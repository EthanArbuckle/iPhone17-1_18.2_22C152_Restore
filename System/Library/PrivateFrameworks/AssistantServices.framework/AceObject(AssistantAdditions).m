@interface AceObject(AssistantAdditions)
- (uint64_t)af_dialogIdentifier;
- (uint64_t)af_isUserUtterance;
- (uint64_t)af_isUtterance;
- (uint64_t)af_speakableText;
- (uint64_t)af_text;
@end

@implementation AceObject(AssistantAdditions)

- (uint64_t)af_speakableText
{
  return 0;
}

- (uint64_t)af_text
{
  return 0;
}

- (uint64_t)af_dialogIdentifier
{
  return 0;
}

- (uint64_t)af_isUserUtterance
{
  return 0;
}

- (uint64_t)af_isUtterance
{
  return 0;
}

@end