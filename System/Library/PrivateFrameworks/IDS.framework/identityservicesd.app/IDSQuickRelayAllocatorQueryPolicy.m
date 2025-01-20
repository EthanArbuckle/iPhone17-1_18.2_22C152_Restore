@interface IDSQuickRelayAllocatorQueryPolicy
- (BOOL)_serverBagBoolForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)shouldPreventDuplicateTokensInAllocationForServiceIdentifier:(id)a3;
- (BOOL)shouldQueryOnEveryQRAllocationForServiceIdentifier:(id)a3;
- (IDSQuickRelayAllocatorQueryPolicy)initWithServerBag:(id)a3;
- (IDSServerBag)serverBag;
@end

@implementation IDSQuickRelayAllocatorQueryPolicy

- (IDSQuickRelayAllocatorQueryPolicy)initWithServerBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSQuickRelayAllocatorQueryPolicy;
  v6 = [(IDSQuickRelayAllocatorQueryPolicy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverBag, a3);
  }

  return v7;
}

- (BOOL)shouldQueryOnEveryQRAllocationForServiceIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"com.apple.private.alloy.ids.cloudmessaging"])
  {
    if (sub_100135138(v4))
    {
      CFStringRef v5 = @"ids-query-qr-allocate-groupfacetime";
    }
    else
    {
      id v8 = v4;
      if ([v8 isEqualToString:@"com.apple.private.alloy.facetime.video"])
      {
      }
      else
      {
        unsigned int v9 = [v8 isEqualToString:@"com.apple.private.alloy.facetime.audio"];

        if (!v9)
        {
          if ([v8 isEqualToString:@"com.apple.private.alloy.willow.stream"])
          {
            CFStringRef v5 = @"ids-query-qr-allocate-homekit";
          }
          else
          {
            if (![v8 isEqualToString:@"com.apple.private.alloy.terminus"])
            {
              v12 = +[NSString stringWithFormat:@"ids-query-qr-allocate-%@", v8];
              id v13 = v8;
              id v14 = [objc_alloc((Class)IDSServiceProperties) initWithServiceIdentifier:v13];

              id v15 = [v14 isUserDrivenRealTime];
              unsigned __int8 v10 = [(IDSQuickRelayAllocatorQueryPolicy *)self _serverBagBoolForKey:v12 withDefaultValue:v15];

              goto LABEL_12;
            }
            CFStringRef v5 = @"ids-query-qr-allocate-terminus";
          }
          goto LABEL_3;
        }
      }
      CFStringRef v5 = @"ids-query-qr-allocate-facetime";
    }
    v6 = self;
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  CFStringRef v5 = @"ids-query-qr-allocate-cloudmessaging";
LABEL_3:
  v6 = self;
  uint64_t v7 = 0;
LABEL_11:
  unsigned __int8 v10 = [(IDSQuickRelayAllocatorQueryPolicy *)v6 _serverBagBoolForKey:v5 withDefaultValue:v7];
LABEL_12:

  return v10;
}

- (BOOL)shouldPreventDuplicateTokensInAllocationForServiceIdentifier:(id)a3
{
  if (!sub_100135138(a3)) {
    return 1;
  }

  return [(IDSQuickRelayAllocatorQueryPolicy *)self _serverBagBoolForKey:@"ids-qr-allocate-prevent-duplicate-tokens" withDefaultValue:0];
}

- (BOOL)_serverBagBoolForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(IDSQuickRelayAllocatorQueryPolicy *)self serverBag];
  id v8 = [v7 objectForKey:v6];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a4 = [v8 BOOLValue];
    }
  }

  return a4;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void).cxx_destruct
{
}

@end