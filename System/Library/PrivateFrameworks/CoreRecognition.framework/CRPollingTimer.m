@interface CRPollingTimer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fireTime;
- (BOOL)fired;
- (BOOL)valid;
- (CRPollingTimer)initWithTarget:(id)a3 selector:(SEL)a4;
- (SEL)selector;
- (id)target;
- (void)evalAtTime:(id *)a3;
- (void)invalidate;
- (void)setFireTime:(id *)a3;
- (void)setFired:(BOOL)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CRPollingTimer

- (CRPollingTimer)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRPollingTimer;
  v7 = [(CRPollingTimer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    [(CRPollingTimer *)v7 setTarget:v6];
    [(CRPollingTimer *)v8 setSelector:a4];
    long long v10 = *MEMORY[0x263F010B8];
    uint64_t v11 = *(void *)(MEMORY[0x263F010B8] + 16);
    [(CRPollingTimer *)v8 setFireTime:&v10];
    [(CRPollingTimer *)v8 setFired:0];
    [(CRPollingTimer *)v8 setValid:1];
  }

  return v8;
}

- (void)setFireTime:(id *)a3
{
  obj = self;
  objc_sync_enter(obj);
  int64_t var3 = a3->var3;
  *(_OWORD *)&obj->_fireTime.value = *(_OWORD *)&a3->var0;
  obj->_fireTime.epoch = var3;
  objc_sync_exit(obj);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fireTime
{
  obj = self;
  objc_sync_enter(obj);
  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)obj->_fireTime;
  objc_sync_exit(obj);

  return result;
}

- (void)evalAtTime:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if ([(CRPollingTimer *)v4 valid])
  {
    if (![(CRPollingTimer *)v4 fired])
    {
      [(CRPollingTimer *)v4 fireTime];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
      if (CMTimeCompare((CMTime *)&v8, &time2) >= 1)
      {
        v5 = [(CRPollingTimer *)v4 target];
        id v6 = (void (*)(void *, SEL))objc_msgSend(v5, "methodForSelector:", -[CRPollingTimer selector](v4, "selector"));
        v7 = [(CRPollingTimer *)v4 target];
        v6(v7, [(CRPollingTimer *)v4 selector]);

        [(CRPollingTimer *)v4 setFired:1];
      }
    }
  }
  objc_sync_exit(v4);
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  [(CRPollingTimer *)obj setValid:0];
  objc_sync_exit(obj);
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (BOOL)fired
{
  return self->_fired;
}

- (void)setFired:(BOOL)a3
{
  self->_fired = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
}

@end