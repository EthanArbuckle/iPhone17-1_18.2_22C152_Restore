@interface ETReadReceiptMessage
+ (unsigned)messageType;
@end

@implementation ETReadReceiptMessage

+ (unsigned)messageType
{
  return 7;
}

@end