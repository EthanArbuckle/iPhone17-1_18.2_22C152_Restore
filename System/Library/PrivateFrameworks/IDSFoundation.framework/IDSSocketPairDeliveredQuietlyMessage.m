@interface IDSSocketPairDeliveredQuietlyMessage
- (unsigned)command;
@end

@implementation IDSSocketPairDeliveredQuietlyMessage

- (unsigned)command
{
  return 47;
}

@end