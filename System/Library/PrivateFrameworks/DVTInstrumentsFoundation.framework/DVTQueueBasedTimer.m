@interface DVTQueueBasedTimer
- (BOOL)running;
- (DVTQueueBasedTimer)initWithInterval:(double)a3 block:(id)a4;
- (DVTQueueBasedTimer)initWithInterval:(double)a3 qos:(unsigned int)a4 block:(id)a5;
- (double)interval;
- (id).cxx_construct;
- (unsigned)state;
- (void)_runBlock;
- (void)pause;
- (void)resume;
- (void)start;
- (void)stop;
@end

@implementation DVTQueueBasedTimer

- (DVTQueueBasedTimer)initWithInterval:(double)a3 block:(id)a4
{
  return [(DVTQueueBasedTimer *)self initWithInterval:21 qos:a4 block:a3];
}

- (DVTQueueBasedTimer)initWithInterval:(double)a3 qos:(unsigned int)a4 block:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DVTQueueBasedTimer;
  id v9 = [(DVTQueueBasedTimer *)&v16 init];
  if (v9)
  {
    snprintf(__str, 0x80uLL, "com.apple.instruments.kperf.timer.%llu", atomic_fetch_add(&qword_268708048, 1uLL));
    v10 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
    dispatch_queue_t v11 = dispatch_queue_create(__str, v10);
    v12 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v11;

    *((double *)v9 + 3) = a3;
    v13 = _Block_copy(v8);
    v14 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v13;

    atomic_store(0, (unsigned int *)v9 + 10);
  }

  return (DVTQueueBasedTimer *)v9;
}

- (void)_runBlock
{
  unsigned int v2 = atomic_load((unsigned int *)self + 10);
  if (v2 == 1)
  {
    int v4 = (*(uint64_t (**)(void))(*((void *)self + 4) + 16))();
    if (v4)
    {
      if (v4 != 2)
      {
        if (v4 != 1) {
          sub_23093E418();
        }
        dispatch_time_t v5 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(*((double *)self + 3) * 1000000000.0));
        v6 = *((void *)self + 1);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_2308E8868;
        block[3] = &unk_264B8F5B0;
        block[4] = self;
        dispatch_after(v5, v6, block);
      }
    }
    else
    {
      v7 = *((void *)self + 1);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2308E8870;
      v8[3] = &unk_264B8F5B0;
      v8[4] = self;
      dispatch_async(v7, v8);
    }
  }
}

- (void)start
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  int v4 = *((void *)self + 1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308E8908;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_async(v4, block);
  std::mutex::unlock(v3);
}

- (void)stop
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  int v4 = *((void *)self + 1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308E8A18;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_sync(v4, block);
  dispatch_time_t v5 = *((void *)self + 1);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308E8A2C;
  v6[3] = &unk_264B8F5B0;
  v6[4] = self;
  dispatch_sync(v5, v6);
  std::mutex::unlock(v3);
}

- (void)pause
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  int v4 = *((void *)self + 1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308E8ADC;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_sync(v4, block);
  dispatch_sync(*((dispatch_queue_t *)self + 1), &unk_26E5157A8);
  std::mutex::unlock(v3);
}

- (void)resume
{
  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  int v4 = *((void *)self + 1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308E8B84;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_async(v4, block);
  std::mutex::unlock(v3);
}

- (BOOL)running
{
  return [(DVTQueueBasedTimer *)self state] == 1;
}

- (unsigned)state
{
  return atomic_load((unsigned int *)self + 10);
}

- (double)interval
{
  return *((double *)self + 3);
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0;
  return self;
}

@end