@interface IDSSocketPairDictionaryMessage
- (unsigned)command;
@end

@implementation IDSSocketPairDictionaryMessage

- (unsigned)command
{
  return 6;
}

@end