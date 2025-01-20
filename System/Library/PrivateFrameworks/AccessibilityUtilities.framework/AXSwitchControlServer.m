@interface AXSwitchControlServer
+ (id)server;
- (BOOL)_connectIfNecessary;
- (BOOL)_triggerAutomationCommand:(int64_t)a3;
- (BOOL)isAutoScanEnabled;
- (BOOL)isDwellEnabled;
- (BOOL)isManualScanEnabled;
- (BOOL)isScannerActive;
- (BOOL)isScannerPaused;
- (BOOL)setupAutomation;
- (BOOL)tearDownAutomation;
- (BOOL)triggerCommand:(int64_t)a3;
- (CGPoint)headTrackingPoint;
- (id)_serviceName;
- (id)currentFocusedElement;
- (id)lastSpokenPhrases;
- (void)_didConnectToClient;
- (void)_wasDisconnectedFromClient;
- (void)_willClearServer;
- (void)clearSpokenPhrases;
@end

@implementation AXSwitchControlServer

+ (id)server
{
  if (server_onceToken_1 != -1) {
    dispatch_once(&server_onceToken_1, &__block_literal_global_8);
  }
  v2 = (void *)server_Server_1;

  return v2;
}

uint64_t __31__AXSwitchControlServer_server__block_invoke()
{
  server_Server_1 = objc_alloc_init(AXSwitchControlServer);

  return MEMORY[0x1F41817F8]();
}

- (id)_serviceName
{
  return @"com.apple.accessibility.AXSwitchControlServer";
}

- (BOOL)_connectIfNecessary
{
  if (_AXSAssistiveTouchScannerEnabled() || (int v3 = _AXSAssistiveTouchEnabled()) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXSwitchControlServer;
    LOBYTE(v3) = [(AXServer *)&v5 _connectIfNecessary];
  }
  return v3;
}

- (void)_didConnectToClient
{
  v1 = [a1 _serviceName];
  OUTLINED_FUNCTION_0_1(&dword_18D308000, v2, v3, "%@ did connect", v4, v5, v6, v7, 2u);
}

- (void)_wasDisconnectedFromClient
{
  v1 = [a1 _serviceName];
  OUTLINED_FUNCTION_0_1(&dword_18D308000, v2, v3, "%@ was disconnected", v4, v5, v6, v7, 2u);
}

- (void)_willClearServer
{
  v1 = [a1 _serviceName];
  OUTLINED_FUNCTION_0_1(&dword_18D308000, v2, v3, "%@ will clear server info", v4, v5, v6, v7, 2u);
}

- (BOOL)_triggerAutomationCommand:(int64_t)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (![(AXSwitchControlServer *)self _connectIfNecessary]) {
    return 0;
  }
  uint64_t v5 = [AXIPCMessage alloc];
  v15 = @"command";
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v16[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v8 = [(AXIPCMessage *)v5 initWithKey:6509 payload:v7];

  v9 = [(AXServer *)self client];
  v10 = [v9 sendMessage:v8 withError:0];

  v11 = [v10 payload];
  v12 = [v11 objectForKeyedSubscript:@"result"];
  char v13 = [v12 BOOLValue];

  return v13;
}

- (BOOL)setupAutomation
{
  return [(AXSwitchControlServer *)self _triggerAutomationCommand:0];
}

- (BOOL)tearDownAutomation
{
  return [(AXSwitchControlServer *)self _triggerAutomationCommand:1];
}

- (BOOL)triggerCommand:(int64_t)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (![(AXSwitchControlServer *)self _connectIfNecessary]) {
    return 0;
  }
  if ((unint64_t)(a3 - 1) > 0x17) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_18D430260[a3 - 1];
  }
  uint64_t v7 = [AXIPCMessage alloc];
  v16 = @"action";
  v8 = [NSNumber numberWithInteger:v5];
  v17[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v10 = [(AXIPCMessage *)v7 initWithKey:6500 payload:v9];

  v11 = [(AXServer *)self client];
  v12 = [v11 sendMessage:v10 withError:0];

  char v13 = [v12 payload];
  v14 = [v13 objectForKeyedSubscript:@"result"];
  char v6 = [v14 BOOLValue];

  return v6;
}

- (id)currentFocusedElement
{
  if ([(AXSwitchControlServer *)self _connectIfNecessary])
  {
    uint64_t v3 = [AXIPCMessage alloc];
    uint64_t v4 = [(AXIPCMessage *)v3 initWithKey:6501 payload:MEMORY[0x1E4F1CC08]];
    uint64_t v5 = [(AXServer *)self client];
    char v6 = [v5 sendMessage:v4 withError:0];

    uint64_t v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)lastSpokenPhrases
{
  if ([(AXSwitchControlServer *)self _connectIfNecessary])
  {
    uint64_t v3 = [AXIPCMessage alloc];
    uint64_t v4 = [(AXIPCMessage *)v3 initWithKey:6503 payload:MEMORY[0x1E4F1CC08]];
    uint64_t v5 = [(AXServer *)self client];
    char v6 = [v5 sendMessage:v4 withError:0];

    uint64_t v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearSpokenPhrases
{
  if ([(AXSwitchControlServer *)self _connectIfNecessary])
  {
    uint64_t v3 = [AXIPCMessage alloc];
    char v6 = [(AXIPCMessage *)v3 initWithKey:6511 payload:MEMORY[0x1E4F1CC08]];
    uint64_t v4 = [(AXServer *)self client];
    id v5 = (id)[v4 sendMessage:v6 withError:0];
  }
}

- (BOOL)isScannerActive
{
  BOOL v3 = [(AXSwitchControlServer *)self _connectIfNecessary];
  if (v3)
  {
    uint64_t v4 = [AXIPCMessage alloc];
    id v5 = [(AXIPCMessage *)v4 initWithKey:6507 payload:MEMORY[0x1E4F1CC08]];
    char v6 = [(AXServer *)self client];
    uint64_t v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isScannerPaused
{
  BOOL v3 = [(AXSwitchControlServer *)self _connectIfNecessary];
  if (v3)
  {
    uint64_t v4 = [AXIPCMessage alloc];
    id v5 = [(AXIPCMessage *)v4 initWithKey:6508 payload:MEMORY[0x1E4F1CC08]];
    char v6 = [(AXServer *)self client];
    uint64_t v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isAutoScanEnabled
{
  BOOL v3 = [(AXSwitchControlServer *)self _connectIfNecessary];
  if (v3)
  {
    uint64_t v4 = [AXIPCMessage alloc];
    id v5 = [(AXIPCMessage *)v4 initWithKey:6504 payload:MEMORY[0x1E4F1CC08]];
    char v6 = [(AXServer *)self client];
    uint64_t v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isManualScanEnabled
{
  BOOL v3 = [(AXSwitchControlServer *)self _connectIfNecessary];
  if (v3)
  {
    uint64_t v4 = [AXIPCMessage alloc];
    id v5 = [(AXIPCMessage *)v4 initWithKey:6505 payload:MEMORY[0x1E4F1CC08]];
    char v6 = [(AXServer *)self client];
    uint64_t v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isDwellEnabled
{
  BOOL v3 = [(AXSwitchControlServer *)self _connectIfNecessary];
  if (v3)
  {
    uint64_t v4 = [AXIPCMessage alloc];
    id v5 = [(AXIPCMessage *)v4 initWithKey:6506 payload:MEMORY[0x1E4F1CC08]];
    char v6 = [(AXServer *)self client];
    uint64_t v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (CGPoint)headTrackingPoint
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(AXSwitchControlServer *)self _connectIfNecessary])
  {
    id v5 = [AXIPCMessage alloc];
    char v6 = [(AXIPCMessage *)v5 initWithKey:6510 payload:MEMORY[0x1E4F1CC08]];
    uint64_t v7 = [(AXServer *)self client];
    v8 = [v7 sendMessage:v6 withError:0];

    v9 = [v8 payload];
    char v10 = [v9 objectForKeyedSubscript:@"result"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 pointValue];
      double v3 = v11;
      double v4 = v12;
    }
  }
  double v13 = v3;
  double v14 = v4;
  result.y = v14;
  result.x = v13;
  return result;
}

@end