@interface AXAssistiveTouchServer
+ (id)server;
- (BOOL)_connectIfNecessary;
- (BOOL)home;
- (BOOL)isMenuOpen;
- (BOOL)setPointerPosition:(CGPoint)a3;
- (BOOL)tapMenuItem:(id)a3;
- (CGPoint)getMenuItemPosition:(id)a3;
- (CGPoint)getNubbitPosition;
- (CGPoint)getPointerPosition;
- (id)_serviceName;
- (id)currentBubbleElement;
- (id)menuItems;
- (void)_didConnectToClient;
- (void)_wasDisconnectedFromClient;
- (void)_willClearServer;
- (void)closeMenu;
- (void)menuAction:(id)a3;
- (void)openMenu;
- (void)pointerClick;
- (void)setNubbitPosition:(CGPoint)a3;
- (void)virtualPointer:(BOOL)a3;
@end

@implementation AXAssistiveTouchServer

+ (id)server
{
  if (server_onceToken_3 != -1) {
    dispatch_once(&server_onceToken_3, &__block_literal_global_17);
  }
  v2 = (void *)server_Server_3;

  return v2;
}

uint64_t __32__AXAssistiveTouchServer_server__block_invoke()
{
  server_Server_3 = objc_alloc_init(AXAssistiveTouchServer);

  return MEMORY[0x1F41817F8]();
}

- (id)_serviceName
{
  return @"com.apple.accessibility.AXAssistiveTouchServer";
}

- (BOOL)_connectIfNecessary
{
  if (_AXSAssistiveTouchScannerEnabled() || (int v3 = _AXSAssistiveTouchEnabled()) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXAssistiveTouchServer;
    LOBYTE(v3) = [(AXServer *)&v5 _connectIfNecessary];
  }
  return v3;
}

- (void)_didConnectToClient
{
  int v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXSwitchControlServer _didConnectToClient](self);
  }
}

- (void)_wasDisconnectedFromClient
{
  int v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXSwitchControlServer _wasDisconnectedFromClient](self);
  }
}

- (void)_willClearServer
{
  int v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AXSwitchControlServer _willClearServer](self);
  }
}

- (BOOL)home
{
  BOOL v3 = [(AXAssistiveTouchServer *)self _connectIfNecessary];
  if (v3)
  {
    v4 = [AXIPCMessage alloc];
    objc_super v5 = [(AXIPCMessage *)v4 initWithKey:6002 payload:MEMORY[0x1E4F1CC08]];
    v6 = [(AXServer *)self client];
    v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (CGPoint)getNubbitPosition
{
  double v3 = -1.0;
  double v4 = -1.0;
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    objc_super v5 = [AXIPCMessage alloc];
    v6 = [(AXIPCMessage *)v5 initWithKey:6023 payload:MEMORY[0x1E4F1CC08]];
    v7 = [(AXServer *)self client];
    v8 = [v7 sendMessage:v6 withError:0];

    v9 = [v8 payload];
    char v10 = [v9 objectForKeyedSubscript:@"result"];
    [v10 axCGPointValue];
    double v3 = v11;
    double v4 = v12;
  }
  double v13 = v3;
  double v14 = v4;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)setNubbitPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    v6 = [AXIPCMessage alloc];
    double v13 = @"action";
    *(CGFloat *)double v12 = x;
    *(CGFloat *)&v12[1] = y;
    v7 = [MEMORY[0x1E4F29238] valueWithBytes:v12 objCType:"{CGPoint=dd}"];
    v14[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v9 = [(AXIPCMessage *)v6 initWithKey:6024 payload:v8];

    char v10 = [(AXServer *)self client];
    id v11 = (id)[v10 sendMessage:v9 withError:0];
  }
}

- (void)openMenu
{
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    double v3 = [AXIPCMessage alloc];
    v6 = [(AXIPCMessage *)v3 initWithKey:6020 payload:MEMORY[0x1E4F1CC08]];
    double v4 = [(AXServer *)self client];
    id v5 = (id)[v4 sendMessage:v6 withError:0];
  }
}

- (void)closeMenu
{
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    double v3 = [AXIPCMessage alloc];
    v6 = [(AXIPCMessage *)v3 initWithKey:6021 payload:MEMORY[0x1E4F1CC08]];
    double v4 = [(AXServer *)self client];
    id v5 = (id)[v4 sendMessage:v6 withError:0];
  }
}

- (BOOL)isMenuOpen
{
  BOOL v3 = [(AXAssistiveTouchServer *)self _connectIfNecessary];
  if (v3)
  {
    double v4 = [AXIPCMessage alloc];
    id v5 = [(AXIPCMessage *)v4 initWithKey:6022 payload:MEMORY[0x1E4F1CC08]];
    v6 = [(AXServer *)self client];
    v7 = [v6 sendMessage:v5 withError:0];

    v8 = [v7 payload];
    v9 = [v8 objectForKeyedSubscript:@"result"];
    char v10 = [v9 BOOLValue];

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (id)menuItems
{
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    BOOL v3 = [AXIPCMessage alloc];
    double v4 = [(AXIPCMessage *)v3 initWithKey:6025 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
    v9 = [v8 stringValue];

    char v10 = [v9 componentsSeparatedByString:@"|"];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)tapMenuItem:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    id v5 = [AXIPCMessage alloc];
    double v14 = @"action";
    v15[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v7 = [(AXIPCMessage *)v5 initWithKey:6026 payload:v6];

    v8 = [(AXServer *)self client];
    v9 = [v8 sendMessage:v7 withError:0];

    char v10 = [v9 payload];
    id v11 = [v10 objectForKeyedSubscript:@"result"];
    char v12 = [v11 BOOLValue];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)menuAction:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    id v5 = [AXIPCMessage alloc];
    char v10 = @"action";
    v11[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v7 = [(AXIPCMessage *)v5 initWithKey:6027 payload:v6];

    v8 = [(AXServer *)self client];
    id v9 = (id)[v8 sendMessage:v7 withError:0];
  }
}

- (CGPoint)getMenuItemPosition:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = -1.0;
  double v6 = -1.0;
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    v7 = [AXIPCMessage alloc];
    v18 = @"action";
    v19[0] = v4;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v9 = [(AXIPCMessage *)v7 initWithKey:6033 payload:v8];

    char v10 = [(AXServer *)self client];
    id v11 = [v10 sendMessage:v9 withError:0];

    char v12 = [v11 payload];
    double v13 = [v12 objectForKeyedSubscript:@"result"];
    [v13 axCGPointValue];
    double v5 = v14;
    double v6 = v15;
  }
  double v16 = v5;
  double v17 = v6;
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (void)virtualPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    double v5 = [AXIPCMessage alloc];
    id v11 = @"action";
    double v6 = [NSNumber numberWithBool:v3];
    v12[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v8 = [(AXIPCMessage *)v5 initWithKey:6028 payload:v7];

    id v9 = [(AXServer *)self client];
    id v10 = (id)[v9 sendMessage:v8 withError:0];
  }
}

- (CGPoint)getPointerPosition
{
  double v3 = -1.0;
  double v4 = -1.0;
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    double v5 = [AXIPCMessage alloc];
    double v6 = [(AXIPCMessage *)v5 initWithKey:6029 payload:MEMORY[0x1E4F1CC08]];
    v7 = [(AXServer *)self client];
    v8 = [v7 sendMessage:v6 withError:0];

    id v9 = [v8 payload];
    id v10 = [v9 objectForKeyedSubscript:@"result"];
    [v10 axCGPointValue];
    double v3 = v11;
    double v4 = v12;
  }
  double v13 = v3;
  double v14 = v4;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (BOOL)setPointerPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v18[1] = *MEMORY[0x1E4F143B8];
  if (![(AXAssistiveTouchServer *)self _connectIfNecessary]) {
    return 0;
  }
  double v6 = [AXIPCMessage alloc];
  double v17 = @"action";
  *(CGFloat *)double v16 = x;
  *(CGFloat *)&v16[1] = y;
  v7 = [MEMORY[0x1E4F29238] valueWithBytes:v16 objCType:"{CGPoint=dd}"];
  v18[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v9 = [(AXIPCMessage *)v6 initWithKey:6030 payload:v8];

  id v10 = [(AXServer *)self client];
  double v11 = [v10 sendMessage:v9 withError:0];

  double v12 = [v11 payload];
  double v13 = [v12 objectForKeyedSubscript:@"result"];
  char v14 = [v13 BOOLValue];

  return v14;
}

- (void)pointerClick
{
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    double v3 = [AXIPCMessage alloc];
    double v6 = [(AXIPCMessage *)v3 initWithKey:6032 payload:MEMORY[0x1E4F1CC08]];
    double v4 = [(AXServer *)self client];
    id v5 = (id)[v4 sendMessage:v6 withError:0];
  }
}

- (id)currentBubbleElement
{
  if ([(AXAssistiveTouchServer *)self _connectIfNecessary])
  {
    double v3 = [AXIPCMessage alloc];
    double v4 = [(AXIPCMessage *)v3 initWithKey:6031 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    double v6 = [v5 sendMessage:v4 withError:0];

    v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end