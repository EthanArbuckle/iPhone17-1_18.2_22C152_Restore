@interface CTXPCGetMobileNetworkCodeResponse
- (CTXPCGetMobileNetworkCodeResponse)initWithMnc:(id)a3;
- (NSString)mnc;
@end

@implementation CTXPCGetMobileNetworkCodeResponse

- (NSString)mnc
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"mnc"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (CTXPCGetMobileNetworkCodeResponse)initWithMnc:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"mnc";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetMobileNetworkCodeResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

@end