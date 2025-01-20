@interface AXClarityBoardServer
+ (BOOL)isAvailable;
+ (id)server;
+ (void)server;
- (BOOL)dismissSiri;
- (BOOL)isAppSwitcherVisible;
- (BOOL)isControlCenterVisible;
- (BOOL)isDockVisible;
- (BOOL)isLockScreenVisible;
- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3;
- (BOOL)isNotificationCenterVisible;
- (BOOL)isNotificationVisible;
- (BOOL)isNowPlayingUIVisible;
- (BOOL)isPasscodeLockVisible;
- (BOOL)isReceivingAirPlay;
- (BOOL)isScreenSaverVisible;
- (BOOL)isScreenshotWindowVisible;
- (BOOL)isShelfSwitcherVisible;
- (BOOL)isSiriTalkingOrListening;
- (BOOL)isSiriVisible;
- (BOOL)isSoftwareUpdateUIVisible;
- (BOOL)isStageManagerSwitcherVisible;
- (BOOL)isSystemSleeping;
- (BOOL)showControlCenter:(BOOL)a3;
- (BOOL)toggleIncomingCall;
- (id)_serviceName;
- (int)_actionResultKey;
- (int)_pidFromReply:(id)a3;
- (int)pid;
- (int64_t)_BOOLFromReply:(id)a3;
- (int64_t)_integerFromReply:(id)a3;
- (int64_t)activeInterfaceOrientation;
- (void)_didConnectToClient;
- (void)_wasDisconnectedFromClient;
- (void)activeInterfaceOrientation:(id)a3;
- (void)goHome;
- (void)isMediaPlayingForApp:(id)a3 completionHandler:(id)a4;
- (void)pid:(id)a3;
- (void)registerActionHandler:(id)a3 withIdentifierCallback:(id)a4;
- (void)removeActionHandler:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)unlockDevice;
- (void)wakeUpDeviceIfNecessary;
@end

@implementation AXClarityBoardServer

+ (BOOL)isAvailable
{
  v2 = [MEMORY[0x1E4F59088] sharedSystemShellSwitcher];
  char v3 = [v2 isClarityBoardEnabled];

  return v3;
}

+ (id)server
{
  if ([a1 isAvailable])
  {
    if (server_onceToken_5 != -1) {
      dispatch_once(&server_onceToken_5, &__block_literal_global_22);
    }
    id v2 = (id)server_Server_5;
  }
  else
  {
    char v3 = [MEMORY[0x1E4F59050] commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      +[AXClarityBoardServer server](v3);
    }

    id v2 = 0;
  }

  return v2;
}

uint64_t __30__AXClarityBoardServer_server__block_invoke()
{
  server_Server_5 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (int64_t)activeInterfaceOrientation
{
  if (![(AXServer *)self _connectIfNecessary]) {
    return 0;
  }
  char v3 = [AXIPCMessage alloc];
  v4 = [(AXIPCMessage *)v3 initWithKey:AXClarityBoardMessageKeyActiveInterfaceOrientation payload:0];
  v5 = [(AXServer *)self client];
  v6 = [v5 sendMessage:v4 withError:0];

  int64_t v7 = [(AXClarityBoardServer *)self _integerFromReply:v6];
  return v7;
}

- (void)activeInterfaceOrientation:(id)a3
{
  id v4 = a3;
  if ([(AXServer *)self _connectIfNecessary])
  {
    v5 = [AXIPCMessage alloc];
    v6 = [(AXIPCMessage *)v5 initWithKey:AXClarityBoardMessageKeyActiveInterfaceOrientation payload:0];
    int64_t v7 = [(AXServer *)self client];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke_2;
    v9[3] = &unk_1E55875D0;
    v9[4] = self;
    id v10 = v4;
    id v8 = v4;
    [v7 sendAsyncMessage:v6 replyOnQueue:MEMORY[0x1E4F14428] replyHandler:v9];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke;
    block[3] = &unk_1E5586638;
    id v12 = v4;
    v6 = (AXIPCMessage *)v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v8 = v12;
  }
}

uint64_t __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__AXClarityBoardServer_activeInterfaceOrientation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _integerFromReply:a2];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (BOOL)dismissSiri
{
  return 0;
}

- (BOOL)isAppSwitcherVisible
{
  return 0;
}

- (BOOL)isControlCenterVisible
{
  return 0;
}

- (BOOL)isDockVisible
{
  return 0;
}

- (BOOL)isLockScreenVisible
{
  return 0;
}

- (void)isMediaPlayingForApp:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)isNonExclusiveSystemUIFocusableIncludingPIPWindow:(BOOL)a3
{
  return 0;
}

- (BOOL)isNotificationCenterVisible
{
  return 0;
}

- (BOOL)isNotificationVisible
{
  return 0;
}

- (BOOL)isNowPlayingUIVisible
{
  return 0;
}

- (BOOL)isPasscodeLockVisible
{
  return 0;
}

- (BOOL)isReceivingAirPlay
{
  return 0;
}

- (BOOL)isScreenSaverVisible
{
  return 0;
}

- (BOOL)isScreenshotWindowVisible
{
  return 0;
}

- (BOOL)isShelfSwitcherVisible
{
  return 0;
}

- (BOOL)isSiriTalkingOrListening
{
  return 0;
}

- (BOOL)isSiriVisible
{
  return 0;
}

- (BOOL)isSoftwareUpdateUIVisible
{
  return 0;
}

- (BOOL)isStageManagerSwitcherVisible
{
  return 0;
}

- (BOOL)isSystemSleeping
{
  if (![(AXServer *)self _connectIfNecessary]) {
    return 0;
  }
  uint64_t v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:AXClarityBoardMessageKeyIsSystemSleeping payload:0];
  v5 = [(AXServer *)self client];
  v6 = [v5 sendMessage:v4 withError:0];

  BOOL v7 = [(AXClarityBoardServer *)self _BOOLFromReply:v6] != 0;
  return v7;
}

- (int)pid
{
  int result = _ClarityBoardPid;
  if (_ClarityBoardPid == -1)
  {
    if ([(AXServer *)self _connectIfNecessary])
    {
      id v4 = [AXIPCMessage alloc];
      v5 = [(AXIPCMessage *)v4 initWithKey:AXClarityBoardMessageKeyPID payload:0];
      v6 = [(AXServer *)self client];
      BOOL v7 = [v6 sendMessage:v5 withError:0];

      _ClarityBoardPid = [(AXClarityBoardServer *)self _pidFromReply:v7];
      return _ClarityBoardPid;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

- (void)pid:(id)a3
{
  id v4 = a3;
  if ([(AXServer *)self _connectIfNecessary])
  {
    int v5 = _ClarityBoardPid;
    if (_ClarityBoardPid == -1)
    {
      BOOL v7 = [AXIPCMessage alloc];
      v6 = [(AXIPCMessage *)v7 initWithKey:AXClarityBoardMessageKeyPID payload:0];
      id v8 = [(AXServer *)self client];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __28__AXClarityBoardServer_pid___block_invoke_3;
      v9[3] = &unk_1E5586A60;
      v9[4] = self;
      id v10 = v4;
      [v8 sendAsyncMessage:v6 replyOnQueue:MEMORY[0x1E4F14428] replyHandler:v9];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__AXClarityBoardServer_pid___block_invoke_2;
      block[3] = &unk_1E5586660;
      id v12 = (AXIPCMessage *)v4;
      int v13 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v6 = v12;
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__AXClarityBoardServer_pid___block_invoke;
    v14[3] = &unk_1E5586638;
    v15 = (AXIPCMessage *)v4;
    dispatch_async(MEMORY[0x1E4F14428], v14);
    v6 = v15;
  }
}

uint64_t __28__AXClarityBoardServer_pid___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __28__AXClarityBoardServer_pid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __28__AXClarityBoardServer_pid___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _ClarityBoardPid = [*(id *)(a1 + 32) _pidFromReply:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (BOOL)showControlCenter:(BOOL)a3
{
  return 0;
}

- (void)wakeUpDeviceIfNecessary
{
  uint64_t v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:AXClarityBoardMessageKeyWakeUpDeviceIfNecessary payload:0];
  [(AXServer *)self sendSimpleMessage:v4];
}

- (BOOL)toggleIncomingCall
{
  return 0;
}

- (void)setOrientation:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = [AXIPCMessage alloc];
  uint64_t v6 = AXClarityBoardMessageKeySetOrientation;
  id v10 = @"orientation";
  BOOL v7 = [NSNumber numberWithLong:a3];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = [(AXIPCMessage *)v5 initWithKey:v6 payload:v8];
  [(AXServer *)self sendSimpleMessage:v9];
}

- (void)goHome
{
  uint64_t v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:AXClarityBoardMessageKeyGoHome payload:0];
  [(AXServer *)self sendSimpleMessage:v4];
}

- (void)unlockDevice
{
  uint64_t v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:AXClarityBoardMessageKeyUnlockDevice payload:0];
  [(AXServer *)self sendSimpleMessage:v4];
}

- (void)registerActionHandler:(id)a3 withIdentifierCallback:(id)a4
{
}

- (void)removeActionHandler:(id)a3
{
}

- (int)_actionResultKey
{
  return AXClarityBoardMessageKeyActionResult;
}

- (id)_serviceName
{
  return @"com.apple.accessibility.AXClarityBoardServer";
}

- (void)_wasDisconnectedFromClient
{
  v3.receiver = self;
  v3.super_class = (Class)AXClarityBoardServer;
  [(AXServer *)&v3 _wasDisconnectedFromClient];
  _ClarityBoardPid = -1;
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"AXSystemAppServerDiedNotification" object:0];
}

- (void)_didConnectToClient
{
  v2.receiver = self;
  v2.super_class = (Class)AXClarityBoardServer;
  [(AXServer *)&v2 _didConnectToClient];
  _ClarityBoardPid = -1;
}

- (int64_t)_BOOLFromReply:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKeyedSubscript:@"result"];
  int64_t v5 = [v4 BOOLValue];

  return v5;
}

- (int64_t)_integerFromReply:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKeyedSubscript:@"result"];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int)_pidFromReply:(id)a3
{
  if (!a3) {
    return -1;
  }
  objc_super v3 = [a3 payload];
  id v4 = [v3 objectForKeyedSubscript:@"result"];
  int v5 = [v4 intValue];

  if (v5) {
    return v5;
  }
  else {
    return -1;
  }
}

+ (void)server
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D308000, log, OS_LOG_TYPE_FAULT, "Incorrect attempt to use AXClarityBoardServer while ClarityBoard was not running.", v1, 2u);
}

@end