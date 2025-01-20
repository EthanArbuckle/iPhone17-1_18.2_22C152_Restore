@interface ASDTestFlightServiceExtensionRemoteContext
- (ASDTestFlightServiceExtension)extensionInstance;
- (void)_checkExtensionWithErrorReply:(void *)a3 invokeBlock:;
- (void)didReachTerminalPhaseWithBetaBundle:(id)a3 terminalPhase:(int64_t)a4 error:(id)a5 reply:(id)a6;
- (void)didReceivePushMessages:(id)a3 reply:(id)a4;
- (void)didReceivePushToken:(id)a3 reply:(id)a4;
- (void)invokeCommand:(id)a3 withArguments:(id)a4 reply:(id)a5;
- (void)reloadAppsFromServerWithReply:(id)a3;
- (void)serviceExtensionPerformCleanup;
- (void)serviceExtensionTimeWillExpire;
- (void)setExtensionInstance:(id)a3;
@end

@implementation ASDTestFlightServiceExtensionRemoteContext

- (void)_checkExtensionWithErrorReply:(void *)a3 invokeBlock:
{
  v8 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = [a1 extensionInstance];
    if (v6)
    {
      v5[2](v5, v6);
    }
    else
    {
      v7 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDTestFlightServiceErrorDomain", 901, @"Missing extension instance");
      v8[2](v8, 0, v7);
    }
  }
}

- (void)didReceivePushToken:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__ASDTestFlightServiceExtensionRemoteContext_didReceivePushToken_reply___block_invoke;
  v10[3] = &unk_1E58B4900;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v8, v10);
}

uint64_t __72__ASDTestFlightServiceExtensionRemoteContext_didReceivePushToken_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didReceivePushToken:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (void)didReceivePushMessages:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__ASDTestFlightServiceExtensionRemoteContext_didReceivePushMessages_reply___block_invoke;
  v10[3] = &unk_1E58B4900;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v8, v10);
}

uint64_t __75__ASDTestFlightServiceExtensionRemoteContext_didReceivePushMessages_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didReceivePushMessages:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (void)didReachTerminalPhaseWithBetaBundle:(id)a3 terminalPhase:(int64_t)a4 error:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__ASDTestFlightServiceExtensionRemoteContext_didReachTerminalPhaseWithBetaBundle_terminalPhase_error_reply___block_invoke;
  v16[3] = &unk_1E58B4928;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a4;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v13, v16);
}

void __108__ASDTestFlightServiceExtensionRemoteContext_didReachTerminalPhaseWithBetaBundle_terminalPhase_error_reply___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 didReachTerminalPhaseWithBetaBundleID:v5 terminalPhase:a1[7] error:a1[5] reply:a1[6]];
}

- (void)reloadAppsFromServerWithReply:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ASDTestFlightServiceExtensionRemoteContext_reloadAppsFromServerWithReply___block_invoke;
  v6[3] = &unk_1E58B4950;
  id v7 = v4;
  id v5 = v4;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v5, v6);
}

uint64_t __76__ASDTestFlightServiceExtensionRemoteContext_reloadAppsFromServerWithReply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadAppsFromServerWithReply:*(void *)(a1 + 32)];
}

- (void)invokeCommand:(id)a3 withArguments:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__ASDTestFlightServiceExtensionRemoteContext_invokeCommand_withArguments_reply___block_invoke;
  v14[3] = &unk_1E58B4978;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[ASDTestFlightServiceExtensionRemoteContext _checkExtensionWithErrorReply:invokeBlock:](self, v11, v14);
}

uint64_t __80__ASDTestFlightServiceExtensionRemoteContext_invokeCommand_withArguments_reply___block_invoke(void *a1, void *a2)
{
  return [a2 invokeCommand:a1[4] withArguments:a1[5] reply:a1[6]];
}

- (void)serviceExtensionPerformCleanup
{
  [(ASDTestFlightServiceExtensionRemoteContext *)self setExtensionInstance:0];
  [(ASDTestFlightServiceExtensionRemoteContext *)self completeRequestReturningItems:0 completionHandler:0];
}

- (void)serviceExtensionTimeWillExpire
{
  id v2 = [(ASDTestFlightServiceExtensionRemoteContext *)self extensionInstance];
  [v2 serviceExtensionTimeWillExpire];
}

- (ASDTestFlightServiceExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end