@interface MOManagedSettingsAgentConnection
+ (id)newConnection;
+ (id)newInterface;
+ (id)oneTimeConnection;
@end

@implementation MOManagedSettingsAgentConnection

+ (id)newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ManagedSettingsAgent" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)oneTimeConnection
{
  v2 = (void *)[a1 newConnection];
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __53__MOManagedSettingsAgentConnection_oneTimeConnection__block_invoke;
  v7 = &unk_1E61CBE28;
  objc_copyWeak(&v8, &location);
  [v2 setInterruptionHandler:&v4];
  objc_msgSend(v2, "activate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __53__MOManagedSettingsAgentConnection_oneTimeConnection__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 setInvalidationHandler:0];

  id v2 = objc_loadWeakRetained(&to);
  [v2 invalidate];

  objc_destroyWeak(&to);
}

@end