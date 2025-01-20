@interface CTXPCGetDefaultVoiceResponse
+ (id)allowedClassesForArguments;
- (CTXPCGetDefaultVoiceResponse)initWithContext:(id)a3;
- (CTXPCServiceSubscriptionContext)context;
@end

@implementation CTXPCGetDefaultVoiceResponse

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetDefaultVoiceResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (CTXPCGetDefaultVoiceResponse)initWithContext:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"context";
  v10[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetDefaultVoiceResponse;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (CTXPCServiceSubscriptionContext)context
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"context"];
  id v4 = CTThrowingCastIfClass<CTXPCServiceSubscriptionContext>(v3);

  return (CTXPCServiceSubscriptionContext *)v4;
}

@end