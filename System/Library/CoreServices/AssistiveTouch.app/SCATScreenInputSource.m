@interface SCATScreenInputSource
- (BOOL)handledEvent:(id)a3;
- (NSString)switchDisplayName;
- (id)_actionIdentifierWithType:(id)a3;
- (unint64_t)priority;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_startHandlingEvents;
- (void)_stopHandlingEvents;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setSwitchDisplayName:(id)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATScreenInputSource

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = [(SCATInputSource *)self delegate];
  v10 = [(SCATInputSource *)self queue];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100076A78;
    v12[3] = &unk_1001ACF28;
    id v13 = v9;
    v14 = self;
    id v11 = v8;
    id v15 = v11;
    BOOL v16 = a4;
    BOOL v17 = a5;
    [v10 performAsynchronousWritingBlock:v12];
    HNDTestingSetLastFiredAction(v11);
  }
}

- (id)_actionIdentifierWithType:(id)a3
{
  id v4 = a3;
  v5 = [(SCATInputSource *)self actions];

  if (v5)
  {
    v6 = [(SCATInputSource *)self actions];
    v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    _AXLogWithFacility();
    v7 = 0;
  }

  return v7;
}

- (BOOL)handledEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  if (v5 == 3001)
  {
    v6 = [v4 handInfo];
    unsigned int v7 = [v6 eventType];

    id v8 = [v4 handInfo];
    unsigned int v9 = [v8 eventType];

    if (v9 > 0xA || (int v10 = 1, ((1 << v9) & 0x640) == 0))
    {
      if (v7 != 1)
      {
        _AXSAutomationEnabled();
        goto LABEL_10;
      }
      int v10 = 0;
    }
    id v11 = [(SCATScreenInputSource *)self _actionIdentifierWithType:@"SwitchActionTypeNormal"];
    v12 = [(SCATScreenInputSource *)self _actionIdentifierWithType:@"SwitchActionTypeLongPress"];
    id v13 = [(SCATScreenInputSource *)self switchDisplayName];
    [(SCATInputSource *)self _handleAction:v11 longPressAction:v12 start:v7 == 1 switchIdentifier:@"FullScreen" switchDisplayName:v13];

    int v14 = _AXSAutomationEnabled();
    if (v10 && v14) {
      UIAccessibilityPostNotification(0xFA2u, &off_1001BC148);
    }
  }
LABEL_10:

  return v5 == 3001;
}

- (unint64_t)priority
{
  return 1000;
}

- (void)_startHandlingEvents
{
  id v3 = +[HNDHandManager sharedManager];
  [v3 addEventHandler:self];
}

- (void)_stopHandlingEvents
{
  id v3 = +[HNDHandManager sharedManager];
  [v3 removeEventHandler:self];
}

- (void)dealloc
{
  [(SCATScreenInputSource *)self stopRunning];
  v3.receiver = self;
  v3.super_class = (Class)SCATScreenInputSource;
  [(SCATScreenInputSource *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SCATScreenInputSource;
  [(SCATInputSource *)&v4 setDelegate:a3 queue:a4];
}

- (void)startRunning
{
  if (![(SCATInputSource *)self isRunning])
  {
    [(SCATScreenInputSource *)self _startHandlingEvents];
    [(SCATInputSource *)self setRunning:1];
  }
}

- (void)stopRunning
{
  if ([(SCATInputSource *)self isRunning])
  {
    [(SCATScreenInputSource *)self _stopHandlingEvents];
    [(SCATInputSource *)self setRunning:0];
  }
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCATScreenInputSource;
  id v7 = a3;
  [(SCATInputSource *)&v14 updateWithSwitches:v7 recipe:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100076FB4;
  v10[3] = &unk_1001ACF50;
  id v11 = v6;
  id v12 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  id v13 = self;
  id v8 = v12;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];

  [(SCATInputSource *)self setActions:v8];
}

- (NSString)switchDisplayName
{
  return self->_switchDisplayName;
}

- (void)setSwitchDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end