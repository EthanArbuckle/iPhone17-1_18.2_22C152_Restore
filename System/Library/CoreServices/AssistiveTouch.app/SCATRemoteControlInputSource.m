@interface SCATRemoteControlInputSource
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleAXEvent:(id)a3;
- (BOOL)_handleRemoteControlEvent:(int64_t)a3;
- (SCATRemoteControlInputSource)init;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_startRemoteControlEventProcessor;
- (void)_stopRemoteControlEventProcessor;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setEventProcessor:(id)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation SCATRemoteControlInputSource

- (SCATRemoteControlInputSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATRemoteControlInputSource;
  v2 = [(SCATInputSource *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SCATRemoteControlInputSource *)v2 _startRemoteControlEventProcessor];
  }
  return v3;
}

- (void)dealloc
{
  [(SCATRemoteControlInputSource *)self _stopRemoteControlEventProcessor];
  [(SCATRemoteControlInputSource *)self stopRunning];
  v3.receiver = self;
  v3.super_class = (Class)SCATRemoteControlInputSource;
  [(SCATRemoteControlInputSource *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SCATRemoteControlInputSource;
  [(SCATInputSource *)&v4 setDelegate:a3 queue:a4];
}

- (void)startRunning
{
  if (![(SCATInputSource *)self isRunning])
  {
    [(SCATInputSource *)self setRunning:1];
  }
}

- (void)stopRunning
{
  if ([(SCATInputSource *)self isRunning])
  {
    [(SCATInputSource *)self setRunning:0];
  }
}

- (void)_startRemoteControlEventProcessor
{
  id v3 = [objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"Switch Control - Remote Control" HIDEventTapPriority:25 systemEventTapIdentifier:0 systemEventTapPriority:25];
  [(SCATRemoteControlInputSource *)self setEventProcessor:v3];

  objc_super v4 = [(SCATRemoteControlInputSource *)self eventProcessor];
  [v4 setHIDEventFilterMask:32];

  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  objc_super v5 = [(SCATRemoteControlInputSource *)self eventProcessor];
  [v5 setHIDEventHandler:&v7];

  v6 = [(SCATRemoteControlInputSource *)self eventProcessor];
  [v6 beginHandlingHIDEventsForReason:@"Switch Control Remote Control Event Handler"];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_stopRemoteControlEventProcessor
{
  id v3 = [(SCATRemoteControlInputSource *)self eventProcessor];
  [v3 endHandlingHIDEventsForReason:@"Switch Control Remote Control Event Handler"];

  [(SCATRemoteControlInputSource *)self setEventProcessor:0];
}

- (BOOL)_handleAXEvent:(id)a3
{
  objc_super v4 = [a3 accessibilityData];
  if ([v4 page] == (id)6) {
    BOOL v5 = -[SCATRemoteControlInputSource _handleRemoteControlEvent:](self, "_handleRemoteControlEvent:", [v4 usage]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_handleRemoteControlEvent:(int64_t)a3
{
  BOOL v5 = AXParameterizedLocalizedString();
  id v3 = v5;
  AXPerformBlockOnMainThread();

  return 1;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = [(SCATInputSource *)self delegate];
  v10 = [(SCATInputSource *)self queue];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008EA3C;
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

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end