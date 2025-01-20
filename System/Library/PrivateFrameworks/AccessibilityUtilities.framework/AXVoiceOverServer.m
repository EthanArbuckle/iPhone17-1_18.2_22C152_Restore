@interface AXVoiceOverServer
+ (id)server;
- (BOOL)_connectIfNecessary;
- (BOOL)isBluetoothBrailleDisplayConnected;
- (BOOL)isBrailleInputUIShowing;
- (BOOL)isBrailleScreenInputInScreenAwayMode;
- (BOOL)isHandwritingInputUIShowing;
- (BOOL)isScreenCurtainEnabled;
- (BOOL)triggerCommand:(int64_t)a3;
- (BOOL)triggerCommand:(int64_t)a3 withArgument:(id)a4;
- (BOOL)triggerEventCommand:(id)a3;
- (BOOL)triggerGesture:(id)a3;
- (CGRect)currentCursorFrame;
- (id)_serviceName;
- (id)currentFocusedElement;
- (id)currentRotorName;
- (id)lastScreenChange;
- (id)lastSoundsPlayed;
- (id)lastSpokenContents;
- (id)lastSpokenPhrases;
- (id)recognizedGestureForTutorial;
- (void)clearLastSoundsPlayed:(id)a3;
- (void)clearLastSpokenPhrases:(id)a3;
- (void)performAutomationTestingCommand:(id)a3 userInfo:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)recognizedGestureForTutorial;
@end

@implementation AXVoiceOverServer

+ (id)server
{
  if (server_onceToken_4 != -1) {
    dispatch_once(&server_onceToken_4, &__block_literal_global_21);
  }
  v2 = (void *)server_Server_4;

  return v2;
}

uint64_t __27__AXVoiceOverServer_server__block_invoke()
{
  server_Server_4 = objc_alloc_init(AXVoiceOverServer);

  return MEMORY[0x1F41817F8]();
}

- (id)_serviceName
{
  return @"com.apple.accessibility.AXVoiceOverServer";
}

- (BOOL)_connectIfNecessary
{
  int v3 = _AXSVoiceOverTouchEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AXVoiceOverServer;
    LOBYTE(v3) = [(AXServer *)&v5 _connectIfNecessary];
  }
  return v3;
}

- (id)lastSpokenPhrases
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    v4 = [(AXIPCMessage *)v3 initWithKey:7002 payload:MEMORY[0x1E4F1CC08]];
    objc_super v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearLastSpokenPhrases:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AXVoiceOverServer_clearLastSpokenPhrases___block_invoke;
  v6[3] = &unk_1E55875A0;
  id v7 = v4;
  id v5 = v4;
  [(AXVoiceOverServer *)self performAutomationTestingCommand:&unk_1EDC624A8 userInfo:0 timeout:v6 completion:10.0];
}

uint64_t __44__AXVoiceOverServer_clearLastSpokenPhrases___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)lastSpokenContents
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7008 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    id v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)lastSoundsPlayed
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7005 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    id v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearLastSoundsPlayed:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AXVoiceOverServer_clearLastSoundsPlayed___block_invoke;
  v6[3] = &unk_1E55875A0;
  id v7 = v4;
  id v5 = v4;
  [(AXVoiceOverServer *)self performAutomationTestingCommand:&unk_1EDC624C0 userInfo:0 timeout:v6 completion:10.0];
}

uint64_t __43__AXVoiceOverServer_clearLastSoundsPlayed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)currentRotorName
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7003 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    id v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)currentCursorFrame
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7016 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    id v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
    NSRect v17 = NSRectFromString(v8);
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)lastScreenChange
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7004 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    id v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)currentFocusedElement
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7001 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    v6 = [v5 sendMessage:v4 withError:0];

    id v7 = [v6 payload];
    v8 = [v7 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)triggerGesture:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    id v5 = [AXIPCMessage alloc];
    double v14 = @"gesture";
    v15[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v7 = [(AXIPCMessage *)v5 initWithKey:7010 payload:v6];

    v8 = [(AXServer *)self client];
    v9 = [v8 sendMessage:v7 withError:0];

    v10 = [v9 payload];
    v11 = [v10 objectForKeyedSubscript:@"result"];
    char v12 = [v11 BOOLValue];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)triggerCommand:(int64_t)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (![(AXVoiceOverServer *)self _connectIfNecessary]) {
    return 0;
  }
  id v5 = [AXIPCMessage alloc];
  double v15 = @"command";
  v6 = [NSNumber numberWithInteger:a3];
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v8 = [(AXIPCMessage *)v5 initWithKey:7000 payload:v7];

  v9 = [(AXServer *)self client];
  v10 = [v9 sendMessage:v8 withError:0];

  v11 = [v10 payload];
  char v12 = [v11 objectForKeyedSubscript:@"result"];
  char v13 = [v12 BOOLValue];

  return v13;
}

- (BOOL)triggerCommand:(int64_t)a3 withArgument:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    id v7 = [AXIPCMessage alloc];
    v17[0] = @"command";
    v8 = [NSNumber numberWithInteger:a3];
    v17[1] = @"argument";
    v18[0] = v8;
    v18[1] = v6;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v10 = [(AXIPCMessage *)v7 initWithKey:7000 payload:v9];

    v11 = [(AXServer *)self client];
    char v12 = [v11 sendMessage:v10 withError:0];

    char v13 = [v12 payload];
    double v14 = [v13 objectForKeyedSubscript:@"result"];
    char v15 = [v14 BOOLValue];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)triggerEventCommand:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[AXVoiceOverServer _connectIfNecessary](self, "_connectIfNecessary") && [v4 length])
  {
    id v5 = [AXIPCMessage alloc];
    double v14 = @"eventCommand";
    v15[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v7 = [(AXIPCMessage *)v5 initWithKey:7013 payload:v6];

    v8 = [(AXServer *)self client];
    v9 = [v8 sendMessage:v7 withError:0];

    v10 = [v9 payload];
    v11 = [v10 objectForKeyedSubscript:@"result"];
    char v12 = [v11 BOOLValue];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isBrailleInputUIShowing
{
  if (![(AXVoiceOverServer *)self _connectIfNecessary]) {
    return 0;
  }
  int v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:7006 payload:MEMORY[0x1E4F1CC08]];
  id v5 = [(AXServer *)self client];
  uint64_t v11 = 0;
  id v6 = [v5 sendMessage:v4 withError:&v11];

  id v7 = [v6 payload];
  v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)isHandwritingInputUIShowing
{
  if (![(AXVoiceOverServer *)self _connectIfNecessary]) {
    return 0;
  }
  int v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:7009 payload:MEMORY[0x1E4F1CC08]];
  id v5 = [(AXServer *)self client];
  uint64_t v11 = 0;
  id v6 = [v5 sendMessage:v4 withError:&v11];

  id v7 = [v6 payload];
  v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)isBluetoothBrailleDisplayConnected
{
  if (![(AXVoiceOverServer *)self _connectIfNecessary]) {
    return 0;
  }
  int v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:7011 payload:MEMORY[0x1E4F1CC08]];
  id v5 = [(AXServer *)self client];
  uint64_t v11 = 0;
  id v6 = [v5 sendMessage:v4 withError:&v11];

  id v7 = [v6 payload];
  v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)isScreenCurtainEnabled
{
  if (![(AXVoiceOverServer *)self _connectIfNecessary]) {
    return 0;
  }
  int v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:7012 payload:MEMORY[0x1E4F1CC08]];
  id v5 = [(AXServer *)self client];
  uint64_t v11 = 0;
  id v6 = [v5 sendMessage:v4 withError:&v11];

  id v7 = [v6 payload];
  v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (BOOL)isBrailleScreenInputInScreenAwayMode
{
  if (![(AXVoiceOverServer *)self _connectIfNecessary]) {
    return 0;
  }
  int v3 = [AXIPCMessage alloc];
  id v4 = [(AXIPCMessage *)v3 initWithKey:7015 payload:MEMORY[0x1E4F1CC08]];
  id v5 = [(AXServer *)self client];
  uint64_t v11 = 0;
  id v6 = [v5 sendMessage:v4 withError:&v11];

  id v7 = [v6 payload];
  v8 = [v7 objectForKeyedSubscript:@"result"];
  char v9 = [v8 BOOLValue];

  return v9;
}

- (id)recognizedGestureForTutorial
{
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    int v3 = [AXIPCMessage alloc];
    id v4 = [(AXIPCMessage *)v3 initWithKey:7014 payload:MEMORY[0x1E4F1CC08]];
    id v5 = [(AXServer *)self client];
    id v13 = 0;
    id v6 = [v5 sendMessage:v4 withError:&v13];
    id v7 = v13;

    v8 = [v6 payload];
    char v9 = [v8 objectForKeyedSubscript:@"result"];

    if ([v9 count])
    {
      v10 = [v9 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v11 = AXLogIPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(AXVoiceOverServer *)(uint64_t)v7 recognizedGestureForTutorial];
      }

      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)performAutomationTestingCommand:(id)a3 userInfo:(id)a4 timeout:(double)a5 completion:(id)a6
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(AXVoiceOverServer *)self _connectIfNecessary])
  {
    v20[0] = @"command";
    v20[1] = @"userInfo";
    id v13 = (id)MEMORY[0x1E4F1CC08];
    if (v11) {
      id v13 = v11;
    }
    v21[0] = v10;
    v21[1] = v13;
    v20[2] = @"timeout";
    double v14 = [NSNumber numberWithDouble:a5];
    v21[2] = v14;
    char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

    double v16 = [[AXIPCMessage alloc] initWithKey:7007 payload:v15];
    NSRect v17 = [(AXServer *)self client];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__AXVoiceOverServer_performAutomationTestingCommand_userInfo_timeout_completion___block_invoke;
    void v18[3] = &unk_1E5586688;
    id v19 = v12;
    [v17 sendAsyncMessage:v16 replyOnQueue:MEMORY[0x1E4F14428] replyHandler:v18];
  }
}

void __81__AXVoiceOverServer_performAutomationTestingCommand_userInfo_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_msgSend(a3, "ax_nonRedundantDescription");
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    id v7 = [v5 payload];
    v8 = [v7 objectForKeyedSubscript:@"error"];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v8);
    }
    else
    {
      id v10 = [v11 payload];
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
    }
  }
}

- (void)recognizedGestureForTutorial
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Could not connect VoiceOver for tutorial message: %@", (uint8_t *)&v2, 0xCu);
}

@end