@interface IDSSocketPairSMSDownloadOutgoing
- (unsigned)command;
@end

@implementation IDSSocketPairSMSDownloadOutgoing

- (unsigned)command
{
  return 17;
}

@end