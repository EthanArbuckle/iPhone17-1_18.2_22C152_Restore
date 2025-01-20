@interface EscrowDeleteRequest
- (Class)responseClass;
- (id)command;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowDeleteRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"DELETE";
}

@end