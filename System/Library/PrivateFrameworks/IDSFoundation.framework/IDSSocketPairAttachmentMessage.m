@interface IDSSocketPairAttachmentMessage
- (unsigned)command;
@end

@implementation IDSSocketPairAttachmentMessage

- (unsigned)command
{
  return 30;
}

@end