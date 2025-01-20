@interface CTXPCGetNetworkListResponse
+ (id)allowedClassesForArguments;
- (CTNetworkList)networks;
- (CTXPCGetNetworkListResponse)initWithNetworkList:(id)a3;
@end

@implementation CTXPCGetNetworkListResponse

- (CTXPCGetNetworkListResponse)initWithNetworkList:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"network";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetNetworkListResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTNetworkList)networks
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"network"];
  id v4 = CTThrowingCastIfClass<CTNetworkList>(v3);

  return (CTNetworkList *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetNetworkListResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end