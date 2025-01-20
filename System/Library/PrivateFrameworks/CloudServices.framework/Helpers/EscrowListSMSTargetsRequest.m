@interface EscrowListSMSTargetsRequest
- (Class)responseClass;
- (id)command;
@end

@implementation EscrowListSMSTargetsRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"GET_SMS_TARGETS";
}

@end