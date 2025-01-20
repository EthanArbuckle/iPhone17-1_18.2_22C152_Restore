@interface AXClarityBoardServerInstance
- (AXClarityBoardServerInstance)init;
- (AXClarityBoardServerInstanceDelegate)delegate;
- (AXFrontBoardProcessWatcher)processWatcher;
- (AXIPCServer)server;
- (AXServerInstanceActionHandlerHelper)actionHandlerHelper;
- (BOOL)isServerRunning;
- (id)_activeInterfaceOrientation:(id)a3;
- (id)_goHome:(id)a3;
- (id)_isSystemSleeping:(id)a3;
- (id)_registerActionHandler:(id)a3;
- (id)_setOrientation:(id)a3;
- (id)_systemAppPID:(id)a3;
- (id)_unlockDevice:(id)a3;
- (id)_wakeUpDeviceIfNecessary:(id)a3;
- (id)accessibilityEnabledNotificationObserverToken;
- (void)_addHandlerForServer:(id)a3 selector:(SEL)a4 key:(int)a5;
- (void)_startSystemAppServerIfNeeded;
- (void)dealloc;
- (void)notifyActionOccurredWithType:(int64_t)a3 payload:(id)a4;
- (void)setAccessibilityEnabledNotificationObserverToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsServerRunning:(BOOL)a3;
- (void)setServer:(id)a3;
@end

@implementation AXClarityBoardServerInstance

- (AXClarityBoardServerInstance)init
{
  v18.receiver = self;
  v18.super_class = (Class)AXClarityBoardServerInstance;
  v2 = [(AXClarityBoardServerInstance *)&v18 init];
  v3 = v2;
  if (v2)
  {
    [(AXClarityBoardServerInstance *)v2 _startSystemAppServerIfNeeded];
    v4 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = kAXSAccessibilityEnabledNotification;
    v6 = +[NSOperationQueue mainQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006128;
    v16[3] = &unk_10015BF00;
    v7 = v3;
    v17 = v7;
    uint64_t v8 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v16];
    id accessibilityEnabledNotificationObserverToken = v7->_accessibilityEnabledNotificationObserverToken;
    v7->_id accessibilityEnabledNotificationObserverToken = (id)v8;

    id v10 = objc_alloc((Class)AXServerInstanceActionHandlerHelper);
    v11 = (AXServerInstanceActionHandlerHelper *)[v10 initWithRegistrationMessageKey:AXClarityBoardMessageKeyRegisterActionHandler actionResultMessageKey:AXClarityBoardMessageKeyActionResult];
    actionHandlerHelper = v7->_actionHandlerHelper;
    v7->_actionHandlerHelper = v11;

    uint64_t v13 = objc_opt_new();
    processWatcher = v7->_processWatcher;
    v7->_processWatcher = (AXFrontBoardProcessWatcher *)v13;
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_accessibilityEnabledNotificationObserverToken];

  v4.receiver = self;
  v4.super_class = (Class)AXClarityBoardServerInstance;
  [(AXClarityBoardServerInstance *)&v4 dealloc];
}

- (void)notifyActionOccurredWithType:(int64_t)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = [(AXClarityBoardServerInstance *)self actionHandlerHelper];
  [v7 notifyActionOccurredWithType:a3 payload:v6];
}

- (void)_addHandlerForServer:(id)a3 selector:(SEL)a4 key:(int)a5
{
}

- (void)_startSystemAppServerIfNeeded
{
  if (![(AXClarityBoardServerInstance *)self isServerRunning]
    && _AXSAccessibilityEnabled())
  {
    [(AXClarityBoardServerInstance *)self setIsServerRunning:1];
    id v3 = objc_alloc((Class)AXIPCServer);
    id v4 = [v3 initWithServiceName:AXClarityBoardServerServiceName perPidService:0];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_systemAppPID:" key:AXClarityBoardMessageKeyPID];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_activeInterfaceOrientation:" key:AXClarityBoardMessageKeyActiveInterfaceOrientation];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_registerActionHandler:" key:AXClarityBoardMessageKeyRegisterActionHandler];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_isSystemSleeping:" key:AXClarityBoardMessageKeyIsSystemSleeping];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_wakeUpDeviceIfNecessary:" key:AXClarityBoardMessageKeyWakeUpDeviceIfNecessary];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_setOrientation:" key:AXClarityBoardMessageKeySetOrientation];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_goHome:" key:AXClarityBoardMessageKeyGoHome];
    [(AXClarityBoardServerInstance *)self _addHandlerForServer:v4 selector:"_unlockDevice:" key:AXClarityBoardMessageKeyUnlockDevice];
    id v11 = 0;
    [v4 startServerWithError:&v11];
    id v5 = v11;
    if (v5)
    {
      id v6 = +[CLFLog commonLog];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000FEF4C((uint64_t)self, (uint64_t)v5, v6);
      }
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100006544;
      v10[3] = &unk_10015BF28;
      v10[4] = self;
      [v4 setClientInvalidationCallback:v10];
      id v7 = +[CLFLog commonLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started system app server for %@.", buf, 0xCu);
      }
      [(AXClarityBoardServerInstance *)self setServer:v4];
    }
  }
}

- (id)_systemAppPID:(id)a3
{
  uint64_t v3 = getpid();
  id v4 = objc_alloc((Class)AXIPCMessage);
  uint64_t v5 = AXClarityBoardMessageKeyPID;
  uint64_t v10 = AXClarityBoardResultKey;
  id v6 = +[NSNumber numberWithInt:v3];
  id v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v4 initWithKey:v5 payload:v7];

  return v8;
}

- (id)_activeInterfaceOrientation:(id)a3
{
  id v4 = [(AXClarityBoardServerInstance *)self delegate];
  id v5 = [v4 activeInterfaceOrientationForServerInstance:self];

  id v6 = objc_alloc((Class)AXIPCMessage);
  uint64_t v7 = AXClarityBoardMessageKeyActiveInterfaceOrientation;
  uint64_t v12 = AXClarityBoardResultKey;
  id v8 = +[NSNumber numberWithInteger:v5];
  uint64_t v13 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v10 = [v6 initWithKey:v7 payload:v9];

  return v10;
}

- (id)_registerActionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AXClarityBoardServerInstance *)self actionHandlerHelper];
  id v6 = [v5 handleActionHandlerRegistrationMessage:v4];

  return v6;
}

- (id)_isSystemSleeping:(id)a3
{
  id v4 = [(AXClarityBoardServerInstance *)self delegate];
  id v5 = [v4 isSystemSleepingForServerInstance:self];

  id v6 = objc_alloc((Class)AXIPCMessage);
  uint64_t v7 = AXClarityBoardMessageKeyIsSystemSleeping;
  uint64_t v12 = AXClarityBoardResultKey;
  id v8 = +[NSNumber numberWithBool:v5];
  uint64_t v13 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v10 = [v6 initWithKey:v7 payload:v9];

  return v10;
}

- (id)_wakeUpDeviceIfNecessary:(id)a3
{
  id v4 = [(AXClarityBoardServerInstance *)self delegate];
  [v4 wakeUpDeviceIfNecessaryForServerInstance:self];

  return 0;
}

- (id)_setOrientation:(id)a3
{
  uint64_t v3 = [a3 payload];
  id v4 = [v3 objectForKeyedSubscript:AXClarityBoardOrientationKey];
  id v5 = [v4 integerValue];

  id v6 = +[CLFLog commonLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Set orientation via server to: %ld", (uint8_t *)&v8, 0xCu);
  }

  +[AXUIDeviceUtilities setOrientation:v5];
  return 0;
}

- (id)_goHome:(id)a3
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:CLBGoHomeNotification object:0];

  return 0;
}

- (id)_unlockDevice:(id)a3
{
  id v4 = [(AXClarityBoardServerInstance *)self delegate];
  [v4 unlockDeviceForServerInstance:self];

  return 0;
}

- (AXClarityBoardServerInstanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXClarityBoardServerInstanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)accessibilityEnabledNotificationObserverToken
{
  return self->_accessibilityEnabledNotificationObserverToken;
}

- (void)setAccessibilityEnabledNotificationObserverToken:(id)a3
{
}

- (BOOL)isServerRunning
{
  return self->_isServerRunning;
}

- (void)setIsServerRunning:(BOOL)a3
{
  self->_isServerRunning = a3;
}

- (AXIPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (AXServerInstanceActionHandlerHelper)actionHandlerHelper
{
  return self->_actionHandlerHelper;
}

- (AXFrontBoardProcessWatcher)processWatcher
{
  return self->_processWatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processWatcher, 0);
  objc_storeStrong((id *)&self->_actionHandlerHelper, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong(&self->_accessibilityEnabledNotificationObserverToken, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end