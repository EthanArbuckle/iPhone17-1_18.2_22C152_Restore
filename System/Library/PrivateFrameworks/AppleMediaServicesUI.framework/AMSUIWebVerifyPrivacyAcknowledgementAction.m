@interface AMSUIWebVerifyPrivacyAcknowledgementAction
- (AMSUIWebVerifyPrivacyAcknowledgementAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)privacyIdentifier;
- (id)runAction;
- (void)setPrivacyIdentifier:(id)a3;
@end

@implementation AMSUIWebVerifyPrivacyAcknowledgementAction

- (AMSUIWebVerifyPrivacyAcknowledgementAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebVerifyPrivacyAcknowledgementAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"privacyIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    privacyIdentifier = v7->_privacyIdentifier;
    v7->_privacyIdentifier = v9;
  }
  return v7;
}

- (id)runAction
{
  v14[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebVerifyPrivacyAcknowledgementAction;
  id v3 = [(AMSUIWebAction *)&v12 runAction];
  v4 = (void *)MEMORY[0x263F27AE0];
  v5 = [(AMSUIWebVerifyPrivacyAcknowledgementAction *)self privacyIdentifier];
  uint64_t v6 = [v4 acknowledgementNeededForPrivacyIdentifier:v5] ^ 1;

  v7 = (void *)MEMORY[0x263F27E10];
  v13 = @"acknowledged";
  v8 = [NSNumber numberWithBool:v6];
  v14[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10 = [v7 promiseWithResult:v9];

  return v10;
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end