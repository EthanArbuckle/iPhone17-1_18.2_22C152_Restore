@interface INIntentForwardingAction
+ (BOOL)supportsSecureCoding;
+ (Class)responseClass;
- ($115C4C562B26FF47E01F9F4EA65B5887)hostProcessAuditToken;
- (BOOL)allowsForegroundAppLaunch;
- (BOOL)allowsScenelessAppLaunch;
- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4;
- (INIntent)intent;
- (INIntentForwardingAction)initWithCoder:(id)a3;
- (INIntentForwardingAction)initWithIntent:(id)a3;
- (NSString)appBundleIdentifier;
- (double)requestTimeout;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsScenelessAppLaunch:(BOOL)a3;
- (void)setRequestTimeout:(double)a3;
@end

@implementation INIntentForwardingAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

- (void)setRequestTimeout:(double)a3
{
  self->_requestTimeout = a3;
}

- (double)requestTimeout
{
  return self->_requestTimeout;
}

- (BOOL)allowsForegroundAppLaunch
{
  return self->_allowsForegroundAppLaunch;
}

- (void)setAllowsScenelessAppLaunch:(BOOL)a3
{
  self->_allowsScenelessAppLaunch = a3;
}

- (BOOL)allowsScenelessAppLaunch
{
  return self->_allowsScenelessAppLaunch;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostProcessAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)encodeWithCoder:(id)a3
{
  intent = self->_intent;
  id v5 = a3;
  [v5 encodeObject:intent forKey:@"intent"];
  long long v6 = *(_OWORD *)&self->_hostProcessAuditToken.val[4];
  v8[0] = *(_OWORD *)self->_hostProcessAuditToken.val;
  v8[1] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "if_dataWithAuditToken:", v8);
  [v5 encodeObject:v7 forKey:@"hostProcessAuditToken"];

  [v5 encodeBool:self->_allowsScenelessAppLaunch forKey:@"allowsScenelessAppLaunch"];
  [v5 encodeDouble:@"requestTimeout" forKey:self->_requestTimeout];
}

- (INIntentForwardingAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  long long v6 = [(INIntentForwardingAction *)self initWithIntent:v5];

  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostProcessAuditToken"];
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "if_auditToken");
      *(_OWORD *)v6->_hostProcessAuditToken.val = v11;
      *(_OWORD *)&v6->_hostProcessAuditToken.val[4] = v12;
    }
    v6->_allowsScenelessAppLaunch = [v4 decodeBoolForKey:@"allowsScenelessAppLaunch"];
    [v4 decodeDoubleForKey:@"requestTimeout"];
    v6->_requestTimeout = v9;
  }
  return v6;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (a3
    || ([(INIntentForwardingAction *)self appBundleIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    BOOL v7 = 0;
  }
  else
  {
    double v9 = [(INIntentForwardingAction *)self intent];
    INIssueSandboxExtensionsForFileURLEnumerable(v9);

    v10 = [INAppIntentDeliverer alloc];
    long long v11 = [(INIntentForwardingAction *)self appBundleIdentifier];
    long long v12 = [(INAppIntentDeliverer *)v10 initWithBundleIdentifier:v11 intentForwardingAction:self];

    [(INAppIntentDeliverer *)v12 deliverIntentForwardingActionWithResponseHandler:v6];
    BOOL v7 = 1;
  }

  return v7;
}

- (NSString)appBundleIdentifier
{
  appBundleIdentifier = self->_appBundleIdentifier;
  if (!appBundleIdentifier)
  {
    id v4 = [(INIntentForwardingAction *)self intent];
    id v5 = objc_msgSend(v4, "_intents_launchIdForCurrentPlatform");
    id v9 = 0;
    INExtractAppInfoFromSiriLaunchId(v5, &v9, 0);
    id v6 = (NSString *)v9;

    BOOL v7 = self->_appBundleIdentifier;
    self->_appBundleIdentifier = v6;

    appBundleIdentifier = self->_appBundleIdentifier;
  }

  return appBundleIdentifier;
}

- (INIntentForwardingAction)initWithIntent:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INIntentForwardingAction;
  id v6 = [(INIntentForwardingAction *)&v13 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intent, a3);
    v8 = [MEMORY[0x1E4F28F80] processInfo];
    id v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "if_auditToken");
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    *(_OWORD *)v7->_hostProcessAuditToken.val = v11;
    *(_OWORD *)&v7->_hostProcessAuditToken.val[4] = v12;

    v7->_allowsScenelessAppLaunch = 1;
    v7->_requestTimeout = 10.0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)responseClass
{
  return 0;
}

@end