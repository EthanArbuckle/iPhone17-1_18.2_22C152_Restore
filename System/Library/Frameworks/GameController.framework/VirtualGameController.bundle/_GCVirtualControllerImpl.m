@interface _GCVirtualControllerImpl
+ (void)forceVirtualController;
- (GCController)controller;
- (_GCVirtualControllerImpl)initWithConfiguration:(id)a3;
- (id)findKeyWindow;
- (void)connectWithReplyHandler:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)refreshViewForKeyWindow;
- (void)setPosition:(CGPoint)a3 forDirectionPadElement:(id)a4;
- (void)setValue:(double)a3 forButtonElement:(id)a4;
- (void)updateConfigurationForElement:(id)a3 configuration:(id)a4;
@end

@implementation _GCVirtualControllerImpl

- (_GCVirtualControllerImpl)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCVirtualControllerImpl;
  v6 = [(_GCVirtualControllerImpl *)&v15 init];
  if (!v5 && GCCurrentProcessLinkedOnAfter())
  {
    id v14 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"*** 'configuration' must not be nil." userInfo:0];
    objc_exception_throw(v14);
  }
  objc_storeStrong((id *)&v6->_configuration, a3);
  v7 = [[GCTouchController alloc] initWithConfiguration:v5];
  controller = v6->_controller;
  v6->_controller = v7;

  if (([v5 isHidden] & 1) == 0)
  {
    v9 = [GCControllerView alloc];
    v10 = +[UIScreen mainScreen];
    [v10 bounds];
    v11 = -[GCControllerView initWithFrame:configuration:](v9, "initWithFrame:configuration:", v5);
    controllerView = v6->_controllerView;
    v6->_controllerView = v11;

    [(GCControllerView *)v6->_controllerView setController:v6->_controller];
  }

  return v6;
}

- (void)dealloc
{
  [(_GCVirtualControllerImpl *)self disconnect];
  v3.receiver = self;
  v3.super_class = (Class)_GCVirtualControllerImpl;
  [(_GCVirtualControllerImpl *)&v3 dealloc];
}

- (void)connectWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  uint64_t v6 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&s_connected, (unint64_t *)&v6, (unint64_t)self);
  if (v6)
  {
    if (v4)
    {
      v11[0] = NSLocalizedDescriptionKey;
      v11[1] = NSLocalizedFailureReasonErrorKey;
      v12[0] = @"Virtual game controller setup failed.";
      v12[1] = @"Another instance of GCVirtualController is already connected.";
      v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
      v8 = +[NSError gc_VirtualControllerError:userInfo:]((uint64_t)NSError, 3, v7);

      ((void (**)(void, void *))v5)[2](v5, v8);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __52___GCVirtualControllerImpl_connectWithReplyHandler___block_invoke;
    block[3] = &unk_105E0;
    block[4] = self;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)findKeyWindow
{
  if (a1)
  {
    v1 = +[UIApplication sharedApplication];
    v2 = [v1 windows];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v8, "isKeyWindow", (void)v11))
          {
            id v9 = v8;

            goto LABEL_12;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v9 = [v3 firstObject];
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)disconnect
{
  v2 = self;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&s_connected, (unint64_t *)&v2, 0);
  if (v2 == self)
  {
    id v4 = self->_controller;
    id v5 = self->_controllerView;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __38___GCVirtualControllerImpl_disconnect__block_invoke;
    v8[3] = &unk_10608;
    id v9 = v4;
    id v10 = v5;
    uint64_t v6 = v5;
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

- (GCController)controller
{
  if ((_GCVirtualControllerImpl *)atomic_load_explicit((atomic_ullong *volatile)&s_connected, memory_order_acquire) == self) {
    v2 = self->_controller;
  }
  else {
    v2 = 0;
  }

  return (GCController *)v2;
}

- (void)updateConfigurationForElement:(id)a3 configuration:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  controllerView = self->_controllerView;
  if (!controllerView)
  {
    +[NSException exceptionWithName:NSInvalidArgumentException reason:@"*** -updateConfigurationForElement:configuration: may not be called on a GCVirtualController instance configured with 'hidden' = YES." userInfo:0];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v8 = [(GCControllerView *)controllerView getConfigurationForElement:v11];
  id v9 = v6[2](v6, v8);

  [(GCControllerView *)self->_controllerView setConfigurationForElement:v11 configuration:v9];
}

- (void)setValue:(double)a3 forButtonElement:(id)a4
{
}

- (void)setPosition:(CGPoint)a3 forDirectionPadElement:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerView, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)refreshViewForKeyWindow
{
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __61___GCVirtualControllerImpl_Internal__refreshViewForKeyWindow__block_invoke;
    block[3] = &unk_10630;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

+ (void)forceVirtualController
{
  if (!forceVirtualController_ForcedVirtualController)
  {
    id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
    v2 = [v10 arrayForKey:@"GCVirtualConfiguration"];
    id v3 = objc_opt_new();
    if (v2) {
      +[NSSet setWithArray:v2];
    }
    else {
    id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", GCInputButtonA, GCInputButtonB, GCInputButtonX, GCInputButtonY, GCInputLeftThumbstick, GCInputRightThumbstick, GCInputLeftShoulder, GCInputRightShoulder, GCInputLeftTrigger, GCInputRightTrigger, 0);
    }
    [v3 setElements:v4];

    id v5 = [[_GCVirtualControllerImpl alloc] initWithConfiguration:v3];
    [(_GCVirtualControllerImpl *)v5 connectWithReplyHandler:0];
    uint64_t v6 = (void *)forceVirtualController_ForcedVirtualController;
    forceVirtualController_ForcedVirtualController = (uint64_t)v5;
    v7 = v5;

    v8 = +[NSNotificationCenter defaultCenter];

    id v9 = [v8 addObserverForName:UIWindowDidBecomeKeyNotification object:0 queue:0 usingBlock:&__block_literal_global_1];
  }
}

@end