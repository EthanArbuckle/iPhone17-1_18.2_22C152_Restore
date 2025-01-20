@interface CTXPCGetProvisioningServerURLResponse
- (CTXPCGetProvisioningServerURLResponse)initWithURL:(id)a3;
- (NSString)url;
@end

@implementation CTXPCGetProvisioningServerURLResponse

- (CTXPCGetProvisioningServerURLResponse)initWithURL:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"url";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetProvisioningServerURLResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (NSString)url
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"url"];
  id v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

@end