@interface APClientInfoUI
+ (id)sharedInstance;
- (APClientInfoUI)init;
- (NSArray)userKeyboards;
- (id)initForTesting;
- (id)keyboards;
- (void)dealloc;
- (void)orientationChanged:(id)a3;
- (void)setUserKeyboards:(id)a3;
@end

@implementation APClientInfoUI

- (void)orientationChanged:(id)a3
{
  id v10 = a3;
  v4 = [v10 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v10 object];
    uint64_t v7 = [v6 orientation];
    if ((unint64_t)(v7 - 1) >= 4) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = v7 - 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
  }
  v9 = self;
  objc_sync_enter(v9);
  [(APClientInfo *)v9 setOrientation:v8];
  objc_sync_exit(v9);

  [(APClientInfo *)v9 updateActiveClientInfo];
}

- (id)keyboards
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3 = [MEMORY[0x263F1C748] sharedInputModeController];
    v4 = [v3 normalizedEnabledInputModeIdentifiers];
    userKeyboards = self->_userKeyboards;
    self->_userKeyboards = v4;

    v6 = self->_userKeyboards;
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_235F4FF9C;
    v10[3] = &unk_264C96168;
    objc_copyWeak(&v11, &location);
    dispatch_async(MEMORY[0x263EF83A0], v10);
    uint64_t v7 = self->_userKeyboards;
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    }
    v6 = v8;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (APClientInfoUI)init
{
  v14.receiver = self;
  v14.super_class = (Class)APClientInfoUI;
  v2 = [(APClientInfoUI *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C5C0] currentDevice];
    -[APClientInfo setInterfaceIdiom:](v2, "setInterfaceIdiom:", [v3 userInterfaceIdiom]);

    v4 = NSNumber;
    v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
    v6 = objc_msgSend(v4, "numberWithDouble:");
    [(APClientInfo *)v2 setScale:v6];

    uint64_t v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;

    [(APClientInfo *)v2 setScreenWidth:(uint64_t)v9];
    [(APClientInfo *)v2 setScreenHeight:(uint64_t)v11];
    [(APClientInfoUI *)v2 orientationChanged:0];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v2 selector:sel_orientationChanged_ name:*MEMORY[0x263F1D1B0] object:0];

    [(APClientInfo *)v2 updateActiveClientInfo];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_26AB31C98 != -1) {
    dispatch_once(&qword_26AB31C98, &unk_26E94DD68);
  }
  v2 = (void *)qword_26AB31CA0;
  return v2;
}

- (id)initForTesting
{
  return (id)MEMORY[0x270F9A6D0](self, sel_init);
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)APClientInfoUI;
  [(APClientInfoUI *)&v4 dealloc];
}

- (NSArray)userKeyboards
{
  return self->_userKeyboards;
}

- (void)setUserKeyboards:(id)a3
{
}

- (void).cxx_destruct
{
}

@end