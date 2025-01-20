@interface LAPSPasscodeBackoffTimerController
- (LAPSPasscodeBackoffTimerController)initWithTimeout:(int64_t)a3 updateHandler:(id)a4 completionHandler:(id)a5;
- (void)_startTimerWithTimeout:(int64_t)a3;
- (void)start;
@end

@implementation LAPSPasscodeBackoffTimerController

- (LAPSPasscodeBackoffTimerController)initWithTimeout:(int64_t)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LAPSPasscodeBackoffTimerController;
  v10 = [(LAPSPasscodeBackoffTimerController *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_timeout = a3;
    uint64_t v12 = MEMORY[0x2455CBB70](v8);
    id updateHandler = v11->_updateHandler;
    v11->_id updateHandler = (id)v12;

    uint64_t v14 = MEMORY[0x2455CBB70](v9);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v14;
  }
  return v11;
}

- (void)start
{
  timer = self->_timer;
  if (!timer || dispatch_source_testcancel(timer))
  {
    int64_t timeout = self->_timeout;
    [(LAPSPasscodeBackoffTimerController *)self _startTimerWithTimeout:timeout];
  }
}

- (void)_startTimerWithTimeout:(int64_t)a3
{
  if (a3 <= 0)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timer);
    timer = self->_timer;
    self->_timer = 0;

    v11 = (void (*)(void))*((void *)self->_completionHandler + 2);
    v11();
  }
  else
  {
    (*((void (**)(void))self->_updateHandler + 2))();
    if (a3 % 0x3CuLL) {
      double v5 = (double)(a3 % 0x3CuLL);
    }
    else {
      double v5 = 60.0;
    }
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, MEMORY[0x263EF83A0]);
    v7 = self->_timer;
    self->_timer = v6;

    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_timer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    id v9 = self->_timer;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__LAPSPasscodeBackoffTimerController__startTimerWithTimeout___block_invoke;
    v12[3] = &unk_26506F3C8;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    v13[2] = *(id *)&v5;
    dispatch_source_set_event_handler(v9, v12);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __61__LAPSPasscodeBackoffTimerController__startTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startTimerWithTimeout:", (uint64_t)fmax((double)*(uint64_t *)(a1 + 40) - *(double *)(a1 + 48), 0.0));
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end