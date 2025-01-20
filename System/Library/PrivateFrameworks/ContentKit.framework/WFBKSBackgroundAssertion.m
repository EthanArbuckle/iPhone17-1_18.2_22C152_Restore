@interface WFBKSBackgroundAssertion
+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4;
- (BKSProcessAssertion)assertion;
- (NSString)taskName;
- (WFBKSBackgroundAssertion)initWithName:(id)a3 expirationHandler:(id)a4;
- (id)expirationHandler;
- (id)observer;
- (void)end;
- (void)setAssertion:(id)a3;
- (void)setExpirationHandler:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation WFBKSBackgroundAssertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
}

- (void)setObserver:(id)a3
{
}

- (id)observer
{
  return self->_observer;
}

- (void)setAssertion:(id)a3
{
}

- (BKSProcessAssertion)assertion
{
  return self->_assertion;
}

- (void)setExpirationHandler:(id)a3
{
}

- (id)expirationHandler
{
  return self->_expirationHandler;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)end
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = getWFBackgroundAssertionLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(WFBKSBackgroundAssertion *)self taskName];
    int v6 = 136315394;
    v7 = "-[WFBKSBackgroundAssertion end]";
    __int16 v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_216505000, v3, OS_LOG_TYPE_INFO, "%s Finished background assertion for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = [(WFBKSBackgroundAssertion *)self assertion];
  [v5 invalidate];

  [(WFBKSBackgroundAssertion *)self setAssertion:0];
  [(WFBKSBackgroundAssertion *)self setObserver:0];
}

- (WFBKSBackgroundAssertion)initWithName:(id)a3 expirationHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  __int16 v8 = (void (**)(void))a4;
  v27.receiver = self;
  v27.super_class = (Class)WFBKSBackgroundAssertion;
  v9 = [(WFBKSBackgroundAssertion *)&v27 init];
  uint64_t v10 = v9;
  if (!v9)
  {
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v9->_taskName, a3);
  uint64_t v11 = [v8 copy];
  id expirationHandler = v10->_expirationHandler;
  v10->_id expirationHandler = (id)v11;

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v13 = (void *)getBKSProcessAssertionClass_softClass;
  uint64_t v31 = getBKSProcessAssertionClass_softClass;
  if (!getBKSProcessAssertionClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBKSProcessAssertionClass_block_invoke;
    v33 = &unk_26428AC60;
    v34 = &v28;
    __getBKSProcessAssertionClass_block_invoke((uint64_t)buf);
    v13 = (void *)v29[3];
  }
  v14 = v13;
  _Block_object_dispose(&v28, 8);
  uint64_t v15 = [[v14 alloc] initWithPID:getpid() flags:1 reason:4 name:v7];
  assertion = v10->_assertion;
  v10->_assertion = (BKSProcessAssertion *)v15;

  if (([(BKSProcessAssertion *)v10->_assertion acquire] & 1) == 0)
  {
    v23 = getWFBackgroundAssertionLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFBKSBackgroundAssertion initWithName:expirationHandler:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_216505000, v23, OS_LOG_TYPE_INFO, "%s Failed to acquire background assertion for %{public}@", buf, 0x16u);
    }

    if (v8) {
      v8[2](v8);
    }
    goto LABEL_12;
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v17 = (void *)getRBSProcessHandleClass_softClass;
  uint64_t v31 = getRBSProcessHandleClass_softClass;
  if (!getRBSProcessHandleClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRBSProcessHandleClass_block_invoke;
    v33 = &unk_26428AC60;
    v34 = &v28;
    __getRBSProcessHandleClass_block_invoke((uint64_t)buf);
    v17 = (void *)v29[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v28, 8);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __59__WFBKSBackgroundAssertion_initWithName_expirationHandler___block_invoke;
  v25[3] = &unk_26428A060;
  v19 = v10;
  v26 = v19;
  uint64_t v20 = [v18 observeForImminentAssertionsExpiration:v25];
  id observer = v19->_observer;
  v19->_id observer = (id)v20;

  v22 = v19;
LABEL_13:

  return v22;
}

uint64_t __59__WFBKSBackgroundAssertion_initWithName_expirationHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[2]);
    v2 = *(void **)(a1 + 32);
  }
  return [v2 end];
}

+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 expirationHandler:v6];

  return v8;
}

@end