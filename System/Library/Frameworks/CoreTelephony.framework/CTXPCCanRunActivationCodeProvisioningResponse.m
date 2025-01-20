@interface CTXPCCanRunActivationCodeProvisioningResponse
+ (id)allowedClassesForArguments;
- (CTXPCCanRunActivationCodeProvisioningResponse)initWithTitle:(id)a3 message:(id)a4;
- (NSString)message;
- (NSString)title;
@end

@implementation CTXPCCanRunActivationCodeProvisioningResponse

- (CTXPCCanRunActivationCodeProvisioningResponse)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 setObject:v6 forKeyedSubscript:@"title"];
  [v8 setObject:v7 forKeyedSubscript:@"message"];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCCanRunActivationCodeProvisioningResponse;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (NSString)title
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)message
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"message"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCCanRunActivationCodeProvisioningResponse;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  id v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end