@interface IDSSocketPairSMSTextDownloadMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSMSTextDownloadMessage

- (unsigned)command
{
  return 15;
}

@end