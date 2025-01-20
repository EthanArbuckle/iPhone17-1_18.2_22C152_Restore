@interface BCVirtualBrtControl
+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4;
+ (void)failToCreateDisplaysFor:(double)a3;
- (BCVirtualBrtControl)init;
- (BOOL)setNits:(double)a3 error:(id *)a4;
- (double)getNitsWithError:(id *)a3;
@end

@implementation BCVirtualBrtControl

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x23EC8DDF0](a1, a2, a3, a4);
  v6 = (void *)[MEMORY[0x263EFF910] date];
  if (_failFrom) {
    BOOL v7 = _failUntil == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7
    && (v8 = v6, objc_msgSend(v6, "laterDate:") == v6)
    && (void *)[v8 earlierDate:_failUntil] == v8)
  {
    v12 = (void *)MEMORY[0x263EFFA20];
    [(id)_failUntil timeIntervalSinceDate:v8];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke;
    v16[3] = &unk_264D10318;
    v16[4] = a3;
    v13 = objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v16);
    id v14 = v13;
    v10 = objc_alloc_init(BCBrtMonitor);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke_2;
    v15[3] = &unk_264D10198;
    v15[4] = v13;
    [(BCBrtMonitor *)v10 setCancelHandler:v15];
  }
  else
  {
    v9 = objc_alloc_init(BCVirtualBrtControl);
    (*((void (**)(id, BCVirtualBrtControl *))a3 + 2))(a3, v9);

    v10 = objc_alloc_init(BCBrtMonitor);
  }
  return v10;
}

void __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(BCVirtualBrtControl);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__BCVirtualBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(void **)(a1 + 32);
}

+ (void)failToCreateDisplaysFor:(double)a3
{
  _failFrom = 0;
  _failUntil = 0;
  _failFrom = (uint64_t)objc_alloc_init(MEMORY[0x263EFF910]);
  _failUntil = [objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:a3];
}

- (BCVirtualBrtControl)init
{
  v8.receiver = self;
  v8.super_class = (Class)BCVirtualBrtControl;
  v2 = [(BCBrtControl *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x23EC8DDF0]();
    v4 = (void *)[MEMORY[0x263EFF910] date];
    if (_failFrom) {
      BOOL v5 = _failUntil == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5
      && (v6 = v4, objc_msgSend(v4, "laterDate:") == v4)
      && (void *)[v6 earlierDate:_failUntil] == v6)
    {

      v2 = 0;
    }
    else
    {
      v2->_nits = 0.0;
    }
  }
  return v2;
}

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  v6 = [(BCBrtControl *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__BCVirtualBrtControl_setNits_error___block_invoke;
  v8[3] = &unk_264D101C0;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  dispatch_async((dispatch_queue_t)v6, v8);
  return 1;
}

double __37__BCVirtualBrtControl_setNits_error___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 112) = result;
  return result;
}

- (double)getNitsWithError:(id *)a3
{
  uint64_t v8 = 0;
  v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v4 = [(BCBrtControl *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__BCVirtualBrtControl_getNitsWithError___block_invoke;
  v7[3] = &unk_264D10340;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)v4, v7);
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

double __40__BCVirtualBrtControl_getNitsWithError___block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 112);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end