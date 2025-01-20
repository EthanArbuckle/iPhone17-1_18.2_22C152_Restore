@interface CTXPCSubscriberAuthenticateResponse
+ (id)allowedClassesForArguments;
- (CTSubscriberAuthDataHolder)authInfo;
- (CTXPCSubscriberAuthenticateResponse)initWithAuthInfo:(id)a3;
@end

@implementation CTXPCSubscriberAuthenticateResponse

- (CTXPCSubscriberAuthenticateResponse)initWithAuthInfo:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"auth-info";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCSubscriberAuthenticateResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTSubscriberAuthDataHolder)authInfo
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"auth-info"];
  id v4 = CTThrowingCastIfClass<CTSubscriberAuthDataHolder>(v3);

  return (CTSubscriberAuthDataHolder *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSubscriberAuthenticateResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end