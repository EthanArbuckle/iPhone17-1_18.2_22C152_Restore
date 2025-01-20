@interface NFCPresentmentSuppression
+ (id)assertionWithAssertion:(id)a3 delegate:(id)a4;
- (NFAssertionInternal)assertion;
- (NFCPresentmentSuppression)initWithAssertion:(id)a3 delegate:(id)a4;
- (NFCPresentmentSuppressionDelegate)delegate;
- (NSNumber)externalHandle;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)startAssertion:(double)a3;
- (void)startCooldown:(double)a3;
@end

@implementation NFCPresentmentSuppression

- (NFCPresentmentSuppression)initWithAssertion:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v8 = (NFCPresentmentSuppressionDelegate *)a4;
  v18.receiver = self;
  v18.super_class = (Class)NFCPresentmentSuppression;
  v9 = [(NFCPresentmentSuppression *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assertion, a3);
    v10->_delegate = v8;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.corenfc.presentment.suppression.timer", v11);
    timerQueue = v10->_timerQueue;
    v10->_timerQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [NSNumber numberWithInt:arc4random()];
    externalHandle = v10->_externalHandle;
    v10->_externalHandle = (NSNumber *)v14;

    v16 = v10;
  }

  return v10;
}

+ (id)assertionWithAssertion:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NFCPresentmentSuppression alloc] initWithAssertion:v6 delegate:v5];

  return v7;
}

- (void)startAssertion:(double)a3
{
  if (a3 >= 15.0) {
    double v5 = a3;
  }
  else {
    double v5 = 15.0;
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F8C6B0]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __44__NFCPresentmentSuppression_startAssertion___block_invoke;
  dispatch_queue_t v12 = &unk_2645B4378;
  v13 = self;
  v14[1] = (id)a2;
  objc_copyWeak(v14, &location);
  id v7 = (NFTimer *)[v6 initWithCallback:&v9 queue:self->_timerQueue];
  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = v7;

  -[NFTimer startTimer:](self->_assertionTimer, "startTimer:", v5, v9, v10, v11, v12, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __44__NFCPresentmentSuppression_startAssertion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v3 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v7 = 45;
    if (isMetaClass) {
      uint64_t v7 = 43;
    }
    v3(6, "%c[%{public}s %{public}s]:%i expired", v7, ClassName, Name, 57);
  }
  v8 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v9)) {
      int v10 = 43;
    }
    else {
      int v10 = 45;
    }
    v11 = object_getClassName(*(id *)(a1 + 32));
    dispatch_queue_t v12 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v10;
    __int16 v19 = 2082;
    v20 = v11;
    __int16 v21 = 2082;
    v22 = v12;
    __int16 v23 = 1024;
    int v24 = 57;
    _os_log_impl(&dword_2214B8000, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i expired", buf, 0x22u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = WeakRetained;
  if (WeakRetained)
  {
    v15 = [WeakRetained delegate];
    [v15 didExpire];
  }
}

- (void)startCooldown:(double)a3
{
  if (a3 >= 15.0) {
    double v5 = a3;
  }
  else {
    double v5 = 15.0;
  }
  [(NFTimer *)self->_assertionTimer stopTimer];
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F8C6B0]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __43__NFCPresentmentSuppression_startCooldown___block_invoke;
  dispatch_queue_t v12 = &unk_2645B4378;
  v13 = self;
  v14[1] = (id)a2;
  objc_copyWeak(v14, &location);
  uint64_t v7 = (NFTimer *)[v6 initWithCallback:&v9 queue:self->_timerQueue];
  cooldownTimer = self->_cooldownTimer;
  self->_cooldownTimer = v7;

  -[NFTimer startTimer:](self->_cooldownTimer, "startTimer:", v5, v9, v10, v11, v12, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __43__NFCPresentmentSuppression_startCooldown___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v3 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v7 = 45;
    if (isMetaClass) {
      uint64_t v7 = 43;
    }
    v3(6, "%c[%{public}s %{public}s]:%i expired", v7, ClassName, Name, 80);
  }
  v8 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v9)) {
      int v10 = 43;
    }
    else {
      int v10 = 45;
    }
    v11 = object_getClassName(*(id *)(a1 + 32));
    dispatch_queue_t v12 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v10;
    __int16 v19 = 2082;
    v20 = v11;
    __int16 v21 = 2082;
    v22 = v12;
    __int16 v23 = 1024;
    int v24 = 80;
    _os_log_impl(&dword_2214B8000, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i expired", buf, 0x22u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = WeakRetained;
  if (WeakRetained)
  {
    v15 = [WeakRetained delegate];
    [v15 didFinishCooldown];
  }
}

- (void)invalidate
{
  [(NFTimer *)self->_assertionTimer stopTimer];
  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = 0;

  [(NFTimer *)self->_cooldownTimer stopTimer];
  cooldownTimer = self->_cooldownTimer;
  self->_cooldownTimer = 0;
}

- (NFAssertionInternal)assertion
{
  return self->_assertion;
}

- (NFCPresentmentSuppressionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NFCPresentmentSuppressionDelegate *)a3;
}

- (NSNumber)externalHandle
{
  return self->_externalHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalHandle, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_cooldownTimer, 0);

  objc_storeStrong((id *)&self->_assertionTimer, 0);
}

@end