@interface GCKeyboardControllerManager
+ (id)sharedInstance;
- (GCKeyboardControllerManager)init;
- (id)initEmulatedControllerWithMapping:(int)a3;
- (int)emulatedControllerMapping;
- (void)ensureEmulatedControllerWithDevice:(id)a3 added:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onKeyboardOrMouseConnectionStateChanged:(id)a3;
- (void)setEmulatedControllerMapping:(int)a3;
@end

@implementation GCKeyboardControllerManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance_Shared_1;

  return v2;
}

void __45__GCKeyboardControllerManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GCKeyboardControllerManager);
  v1 = (void *)sharedInstance_Shared_1;
  sharedInstance_Shared_1 = (uint64_t)v0;
}

- (id)initEmulatedControllerWithMapping:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(GCKeyboardControllerManager *)self init];
  [(GCKeyboardControllerManager *)v4 setEmulatedControllerMapping:v3];
  return v4;
}

- (GCKeyboardControllerManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)GCKeyboardControllerManager;
  v2 = [(GCKeyboardControllerManager *)&v10 init];
  v2->_emulatedControllerMapping = 0;
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  [v3 addObserver:v2 forKeyPath:@"GCEnableKeyboardMouseController" options:1 context:0];
  [v3 addObserver:v2 forKeyPath:@"GCDefaultMouseSensitivity" options:1 context:0];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:v2 selector:sel_onKeyboardOrMouseConnectionStateChanged_ name:@"GCKeyboardDidConnectNotification" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:v2 selector:sel_onKeyboardOrMouseConnectionStateChanged_ name:@"GCKeyboardDidDisconnectNotification" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:v2 selector:sel_onKeyboardOrMouseConnectionStateChanged_ name:@"GCMouseDidConnectNotification" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:v2 selector:sel_onKeyboardOrMouseConnectionStateChanged_ name:@"GCMouseDidDisconnectNotification" object:0];

  v8 = [v3 valueForKey:@"GCEnableKeyboardMouseController"];
  -[GCKeyboardControllerManager setEmulatedControllerMapping:](v2, "setEmulatedControllerMapping:", [v8 intValue]);

  return v2;
}

- (void)setEmulatedControllerMapping:(int)a3
{
  if (self->_emulatedControllerMapping != a3)
  {
    self->_emulatedControllerMapping = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __60__GCKeyboardControllerManager_setEmulatedControllerMapping___block_invoke;
    v3[3] = &unk_26D22BC10;
    v3[4] = self;
    int v4 = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

uint64_t __60__GCKeyboardControllerManager_setEmulatedControllerMapping___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setEmulatedControllerMapping:*(unsigned int *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 ensureEmulatedControllerWithDevice:0 added:0];
}

- (void)ensureEmulatedControllerWithDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_emulatedControllerMapping)
  {
    v7 = +[GCMouse mice];
    if ([v7 count])
    {
      v8 = +[GCKeyboard coalescedKeyboard];

      if (v8)
      {
        emulatedController = self->_emulatedController;
        if (emulatedController)
        {
          if (v4) {
            [(GCKeyboardAndMouseEmulatedController *)emulatedController addDevice:v6];
          }
          else {
            [(GCKeyboardAndMouseEmulatedController *)emulatedController removeDevice:v6];
          }
        }
        else
        {
          v12 = [[GCKeyboardAndMouseEmulatedController alloc] initEmulatedControllerWithMapping:self->_emulatedControllerMapping windowManager:0];
          v13 = self->_emulatedController;
          self->_emulatedController = v12;

          _publishCustomController(self->_emulatedController);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          v14 = +[GCMouse mice];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v20 != v17) {
                  objc_enumerationMutation(v14);
                }
                [(GCKeyboardAndMouseEmulatedController *)self->_emulatedController addDevice:*(void *)(*((void *)&v19 + 1) + 8 * i)];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v16);
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  objc_super v10 = self->_emulatedController;
  if (v10 && !self->_emulatedControllerMapping)
  {
    _unpublishCustomController(v10);
    v11 = self->_emulatedController;
    self->_emulatedController = 0;
  }
LABEL_20:
}

- (void)onKeyboardOrMouseConnectionStateChanged:(id)a3
{
  id v14 = a3;
  BOOL v4 = [v14 name];
  v5 = v4;
  if (v4 == @"GCKeyboardDidConnectNotification")
  {

    goto LABEL_7;
  }
  id v6 = [v14 name];

  if (v6 == @"GCMouseDidConnectNotification")
  {
LABEL_7:
    objc_super v10 = [v14 object];
    v11 = self;
    v12 = v10;
    uint64_t v13 = 1;
    goto LABEL_10;
  }
  v7 = [v14 name];
  v8 = v7;
  if (v7 == @"GCKeyboardDidDisconnectNotification")
  {
  }
  else
  {
    v9 = [v14 name];

    if (v9 != @"GCMouseDidDisconnectNotification") {
      goto LABEL_11;
    }
  }
  objc_super v10 = [v14 object];
  v11 = self;
  v12 = v10;
  uint64_t v13 = 0;
LABEL_10:
  [(GCKeyboardControllerManager *)v11 ensureEmulatedControllerWithDevice:v12 added:v13];

LABEL_11:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEqualToString:@"GCEnableKeyboardMouseController"])
  {
    objc_super v10 = [v9 valueForKey:@"new"];
    int v11 = [v10 intValue];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __78__GCKeyboardControllerManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_26D22BC10;
    block[4] = self;
    int v15 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if ([v8 isEqualToString:@"GCDefaultMouseSensitivity"])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __78__GCKeyboardControllerManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v12[3] = &unk_26D22A8E8;
    v12[4] = self;
    id v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

uint64_t __78__GCKeyboardControllerManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEmulatedControllerMapping:*(unsigned int *)(a1 + 40)];
}

void __78__GCKeyboardControllerManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) valueForKey:@"new"];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setMouseSensitivity:", (int)objc_msgSend(v2, "intValue"));
}

- (int)emulatedControllerMapping
{
  return self->_emulatedControllerMapping;
}

- (void).cxx_destruct
{
}

@end