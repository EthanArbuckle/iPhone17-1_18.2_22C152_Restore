@interface ZWEventProcessor
+ (id)defaultEventProcessor;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3;
- (CGPoint)currentTouchOffset;
- (CGPoint)offsetForAutopanner:(id)a3;
- (NSPointerArray)externalDisplayDelegates;
- (SCRCThread)hidPostThread;
- (ZOTFullscreenEventHandler)fullscreenEventHandler;
- (ZWEventProcessor)init;
- (ZWEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (ZWEventProcessorDelegate)mainDisplayDelegate;
- (void)_adjustThreadPriority;
- (void)_sendCancelEventToAppDirectlyWithSenderID:(id)a3;
- (void)dealloc;
- (void)disableSleepTimer:(BOOL)a3;
- (void)dispatchEntireEventQueue;
- (void)dispatchEventToSystem:(id)a3;
- (void)resetEventQueue;
- (void)sendCancelEventToAppDirectlyWithSenderID:(unint64_t)a3;
- (void)setCurrentTouchOffset:(CGPoint)a3;
- (void)setExternalDisplayDelegates:(id)a3;
- (void)setHidPostThread:(id)a3;
- (void)setMainDisplayDelegate:(id)a3;
@end

@implementation ZWEventProcessor

+ (id)defaultEventProcessor
{
  if (defaultEventProcessor_onceToken != -1) {
    dispatch_once(&defaultEventProcessor_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)defaultEventProcessor__eventProcessor;

  return v2;
}

void __41__ZWEventProcessor_defaultEventProcessor__block_invoke(id a1)
{
  defaultEventProcessor__eventProcessor = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  _objc_release_x1();
}

- (ZWEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ZWEventProcessor;
  v12 = [(ZWEventProcessor *)&v25 initWithHIDTapIdentifier:v10 HIDEventTapPriority:v8 systemEventTapIdentifier:v11 systemEventTapPriority:v6];
  v13 = v12;
  if (v12)
  {
    [(ZWEventProcessor *)v12 setHIDEventFilterMask:19];
    v14 = (SCRCThread *)objc_alloc_init((Class)SCRCThread);
    hidPostThread = v13->_hidPostThread;
    v13->_hidPostThread = v14;

    [(SCRCThread *)v13->_hidPostThread performSelector:"_adjustThreadPriority" onTarget:v13 count:0 objects:0];
    [(ZWEventProcessor *)v13 setShouldNotifyUserEventOccurred:1];
    objc_initWeak(&location, v13);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = __113__ZWEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke;
    v22 = &unk_78F98;
    objc_copyWeak(&v23, &location);
    [(ZWEventProcessor *)v13 setHIDEventHandler:&v19];
    v16 = +[AXUIEventManager sharedEventManager];
    [v16 registerEventHandler:v13];

    v17 = +[NSPointerArray weakObjectsPointerArray];
    [(ZWEventProcessor *)v13 setExternalDisplayDelegates:v17];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

id __113__ZWEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (AXInPreboardScenario() & 1) != 0 || (AXInCheckerBoardScenario())
  {
    id v4 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained _handleEvent:v3];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = +[AXUIEventManager sharedEventManager];
  [v3 unregisterEventHandler:self];

  v4.receiver = self;
  v4.super_class = (Class)ZWEventProcessor;
  [(ZWEventProcessor *)&v4 dealloc];
}

- (void)_adjustThreadPriority
{
}

- (ZWEventProcessor)init
{
  return [(ZWEventProcessor *)self initWithHIDTapIdentifier:ZWHIDEventTapIdentifier HIDEventTapPriority:29 systemEventTapIdentifier:0 systemEventTapPriority:0];
}

- (BOOL)_handleEvent:(id)a3
{
  return 0;
}

- (CGPoint)offsetForAutopanner:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3
{
  return 1;
}

- (void)dispatchEventToSystem:(id)a3
{
}

- (void)dispatchEntireEventQueue
{
}

- (void)resetEventQueue
{
}

- (void)disableSleepTimer:(BOOL)a3
{
}

- (void)_sendCancelEventToAppDirectlyWithSenderID:(id)a3
{
  double y = CGPointZero.y;
  id v4 = a3;
  +[AXEventRepresentation touchRepresentationWithHandType:location:](AXEventRepresentation, "touchRepresentationWithHandType:location:", 8, CGPointZero.x, y);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  id v10 = +[AXBackBoardServer server];
  id v11 = objc_msgSend(v10, "contextIdForPosition:", v7 * 0.5, v9 * 0.5);

  [v14 setContextId:v11];
  id v12 = [v4 unsignedLongLongValue];

  [v14 setSenderID:v12];
  v13 = +[AXBackBoardServer server];
  [v13 postEvent:v14 afterNamedTap:@"__NOTHING__" includeTaps:&off_7B5C8];
}

- (void)sendCancelEventToAppDirectlyWithSenderID:(unint64_t)a3
{
  hidPostThread = self->_hidPostThread;
  id v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(SCRCThread *)hidPostThread performSelector:"_sendCancelEventToAppDirectlyWithSenderID:" onTarget:self count:1 objects:v5];
}

- (ZWEventProcessorDelegate)mainDisplayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainDisplayDelegate);

  return (ZWEventProcessorDelegate *)WeakRetained;
}

- (void)setMainDisplayDelegate:(id)a3
{
}

- (NSPointerArray)externalDisplayDelegates
{
  return self->_externalDisplayDelegates;
}

- (void)setExternalDisplayDelegates:(id)a3
{
}

- (ZOTFullscreenEventHandler)fullscreenEventHandler
{
  return self->_fullscreenEventHandler;
}

- (CGPoint)currentTouchOffset
{
  double x = self->_currentTouchOffset.x;
  double y = self->_currentTouchOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentTouchOffset:(CGPoint)a3
{
  self->_currentTouchOffset = a3;
}

- (SCRCThread)hidPostThread
{
  return self->_hidPostThread;
}

- (void)setHidPostThread:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidPostThread, 0);
  objc_storeStrong((id *)&self->_fullscreenEventHandler, 0);
  objc_storeStrong((id *)&self->_externalDisplayDelegates, 0);

  objc_destroyWeak((id *)&self->_mainDisplayDelegate);
}

@end