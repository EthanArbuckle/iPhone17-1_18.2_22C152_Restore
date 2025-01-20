@interface MOEffectiveApplicationSettings
+ (id)newConnection;
+ (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation MOEffectiveApplicationSettings

+ (id)newConnection
{
  id v2 = +[MOManagedSettingsAgentConnection newConnection];
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __47__MOEffectiveApplicationSettings_newConnection__block_invoke;
  v7 = &unk_1E61CBE28;
  objc_copyWeak(&v8, &location);
  [v2 setInterruptionHandler:&v4];
  objc_msgSend(v2, "activate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __47__MOEffectiveApplicationSettings_newConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

+ (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[a1 newConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__MOEffectiveApplicationSettings_askToOverrideUnremovabilityOfApplication_teamIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E61CC110;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v11 withRetryCount:1 proxyHandler:v15];
  [v11 invalidate];
}

uint64_t __108__MOEffectiveApplicationSettings_askToOverrideUnremovabilityOfApplication_teamIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 askToOverrideUnremovabilityOfApplication:a1[4] teamIdentifier:a1[5] replyHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

@end