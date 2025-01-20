@interface CTXPCRequestMessage
- (CTXPCRequestMessage)init;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCRequestMessage

- (CTXPCRequestMessage)init
{
  return [(CTXPCMessage *)self initWithNamedArguments:MEMORY[0x1E4F1CC08]];
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  v9 = NSString;
  v10 = NSStringFromSelector(a2);
  v11 = [v9 stringWithFormat:@"You must override %@ in a subclass", v10];
  id v12 = [v8 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (int)requiredEntitlement
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  v3 = NSString;
  v4 = NSStringFromSelector(a2);
  v5 = [v3 stringWithFormat:@"You must override %@ in a subclass", v4];
  id v6 = [v2 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

@end