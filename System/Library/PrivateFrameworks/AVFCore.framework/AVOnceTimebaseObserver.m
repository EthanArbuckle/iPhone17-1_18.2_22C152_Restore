@interface AVOnceTimebaseObserver
- (AVOnceTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 fireTime:(id *)a4 queue:(id)a5 block:(id)a6;
- (BOOL)didFire;
- (void)_fireBlock;
- (void)_resetNextFireTime;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AVOnceTimebaseObserver

- (AVOnceTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 fireTime:(id *)a4 queue:(id)a5 block:(id)a6
{
  v23.receiver = self;
  v23.super_class = (Class)AVOnceTimebaseObserver;
  v9 = [(AVTimebaseObserver *)&v23 initWithTimebase:a3 queue:a5];
  v10 = (AVOnceTimebaseObserver *)v9;
  if (v9)
  {
    if (!a6)
    {
      v13 = *((void *)v9 + 1);
      if (v13)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke;
        block[3] = &unk_1E57B1E80;
        block[4] = v10;
        dispatch_async(v13, block);
      }
      else
      {
        [(AVOnceTimebaseObserver *)v10 invalidate];
      }
      v14 = v10;
      v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, @"invalid parameter not satisfying: %s", v15, v16, v17, v18, v19, (uint64_t)"block"), 0 reason userInfo];
      objc_exception_throw(v20);
    }
    int64_t var3 = a4->var3;
    *(_OWORD *)(v9 + 68) = *(_OWORD *)&a4->var0;
    *(void *)(v9 + 84) = var3;
    *((void *)v9 + 12) = [a6 copy];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke_2;
    v21[3] = &unk_1E57B1E80;
    v21[4] = v10;
    [(AVTimebaseObserver *)v10 _finishInitializationWithTimerEventHandler:v21];
    [(AVOnceTimebaseObserver *)v10 _resetNextFireTime];
  }
  return v10;
}

uint64_t __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireBlock];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVOnceTimebaseObserver;
  [(AVTimebaseObserver *)&v2 dealloc];
}

- (void)invalidate
{
  self->_block = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVOnceTimebaseObserver;
  [(AVTimebaseObserver *)&v3 invalidate];
}

- (void)_fireBlock
{
  if (!self->super._invalid && !self->_didFire)
  {
    self->_didFire = 1;
    objc_super v3 = (void *)MEMORY[0x199715AE0]();
    (*((void (**)(void))self->_block + 2))();
  }
}

- (BOOL)didFire
{
  return self->_didFire;
}

- (void)_resetNextFireTime
{
  if (!self->super._invalid && !self->_didFire)
  {
    timerQueue = self->super._timerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AVOnceTimebaseObserver__resetNextFireTime__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_async(timerQueue, block);
  }
}

void __44__AVOnceTimebaseObserver__resetNextFireTime__block_invoke(uint64_t a1)
{
  __n128 v13 = 0uLL;
  CMTimeEpoch v14 = 0;
  *(void *)&double v2 = AVTimebaseObserver_figTimebaseGetTime(&v13).n128_u64[0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 64) && !*(unsigned char *)(v3 + 104))
  {
    v4 = (long long *)(v3 + 68);
    if ((*(unsigned char *)(v3 + 80) & 1) == 0)
    {
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "_fireBlock", v2);
      return;
    }
    if (*(double *)(v3 + 56) >= 0.0)
    {
      long long v6 = *v4;
      time1.epoch = *(void *)(v3 + 84);
      *(_OWORD *)&time1.value = v6;
      *(__n128 *)&v11.value = v13;
      v11.epoch = v14;
      if (CMTimeCompare(&time1, &v11) < 1) {
        goto LABEL_4;
      }
    }
    else
    {
      *(__n128 *)&time1.value = v13;
      time1.epoch = v14;
      long long v5 = *v4;
      v11.epoch = *(void *)(v3 + 84);
      *(_OWORD *)&v11.value = v5;
      if (CMTimeCompare(&time1, &v11) <= 0) {
        goto LABEL_4;
      }
    }
    v7 = *(long long **)(a1 + 32);
    v9 = *((void *)v7 + 3);
    v8 = (OpaqueCMTimebase *)*((void *)v7 + 4);
    v7 = (long long *)((char *)v7 + 68);
    long long v10 = *v7;
    time1.epoch = *((void *)v7 + 2);
    *(_OWORD *)&time1.value = v10;
    CMTimebaseSetTimerDispatchSourceNextFireTime(v8, v9, &time1, 0);
  }
}

@end