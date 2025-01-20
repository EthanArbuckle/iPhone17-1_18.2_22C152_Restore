@interface AMSUIWebRestrictedFeatureAction
- (AMSUIWebRestrictedFeatureAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSNumber)enabled;
- (NSString)identifier;
- (id)_featureWithIdentifier:(id)a3;
- (id)_unknownIdentifierError;
- (id)runAction;
- (int64_t)_translateState:(int)a3;
- (void)setEnabled:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AMSUIWebRestrictedFeatureAction

- (AMSUIWebRestrictedFeatureAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebRestrictedFeatureAction;
  v7 = [(AMSUIWebAction *)&v15 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"enabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    enabled = v7->_enabled;
    v7->_enabled = v9;

    v11 = [v6 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    identifier = v7->_identifier;
    v7->_identifier = v12;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebRestrictedFeatureAction;
  id v3 = [(AMSUIWebAction *)&v19 runAction];
  v4 = [(AMSUIWebRestrictedFeatureAction *)self identifier];
  v5 = [(AMSUIWebRestrictedFeatureAction *)self _featureWithIdentifier:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    v7 = [(AMSUIWebRestrictedFeatureAction *)self enabled];
    if (v7)
    {
      if (([MEMORY[0x263F27E08] BOOLForEntitlement:@"com.apple.managedconfiguration.profiled-access"] & 1) == 0)
      {
        v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v8)
        {
          v8 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v9 = [v8 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = objc_opt_class();
          v11 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v23 = v10;
          __int16 v24 = 2114;
          v25 = v11;
          __int16 v26 = 2114;
          v27 = @"com.apple.managedconfiguration.profiled-access";
          _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Missing %{public}@ entitlement", buf, 0x20u);
        }
      }
      objc_msgSend(v6, "setBoolValue:forSetting:", objc_msgSend(v7, "BOOLValue"), v5);
    }
    v12 = (void *)MEMORY[0x263F27E10];
    v20[0] = @"locked";
    v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isBoolSettingLockedDownByRestrictions:", v5));
    v20[1] = @"state";
    v21[0] = v13;
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "effectiveBoolValueForSetting:", v5));
    v21[1] = v14;
    objc_super v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    v16 = [v12 promiseWithResult:v15];
  }
  else
  {
    v17 = (void *)MEMORY[0x263F27E10];
    id v6 = [(AMSUIWebRestrictedFeatureAction *)self _unknownIdentifierError];
    v16 = [v17 promiseWithError:v6];
  }

  return v16;
}

- (id)_featureWithIdentifier:(id)a3
{
  uint64_t v3 = _featureWithIdentifier__ams_once_token___COUNTER__;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_featureWithIdentifier__ams_once_token___COUNTER__, &__block_literal_global_29);
  }
  v5 = [(id)_featureWithIdentifier__ams_once_object___COUNTER__ objectForKey:v4];

  return v5;
}

void __58__AMSUIWebRestrictedFeatureAction__featureWithIdentifier___block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"explicitContentAllowed";
  v3[0] = *MEMORY[0x263F538B8];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)_featureWithIdentifier__ams_once_object___COUNTER__;
  _featureWithIdentifier__ams_once_object___COUNTER__ = v0;
}

- (int64_t)_translateState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (_translateState__ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_translateState__ams_once_token___COUNTER__, &__block_literal_global_32);
  }
  id v4 = (id)_translateState__ams_once_object___COUNTER__;
  v5 = [NSNumber numberWithUnsignedInt:v3];
  id v6 = [v4 objectForKey:v5];
  if (objc_opt_respondsToSelector())
  {
    v7 = [NSNumber numberWithUnsignedInt:v3];
    v8 = [v4 objectForKey:v7];
    int64_t v9 = [v8 longLongValue];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

void __51__AMSUIWebRestrictedFeatureAction__translateState___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CC73808;
  v2[1] = &unk_26CC73838;
  v3[0] = &unk_26CC73820;
  v3[1] = &unk_26CC73850;
  v2[2] = &unk_26CC73868;
  void v3[2] = &unk_26CC73880;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_translateState__ams_once_object___COUNTER__;
  _translateState__ams_once_object___COUNTER__ = v0;
}

- (id)_unknownIdentifierError
{
  return (id)AMSError();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end