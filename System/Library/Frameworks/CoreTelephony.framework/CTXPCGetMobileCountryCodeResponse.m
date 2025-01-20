@interface CTXPCGetMobileCountryCodeResponse
- (CTXPCGetMobileCountryCodeResponse)initWithMcc:(id)a3;
- (NSString)mcc;
@end

@implementation CTXPCGetMobileCountryCodeResponse

- (NSString)mcc
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"mcc"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (CTXPCGetMobileCountryCodeResponse)initWithMcc:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"mcc";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetMobileCountryCodeResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

@end