@interface CAMModeAndDeviceConfigurationTestHarness
- (CAMModeAndDeviceConfigurationTestHarness)initWithTestName:(id)a3;
- (NSMutableArray)_modeChangeListeners;
- (void)_handleChangeToMode:(id)a3;
- (void)_handleDidCloseViewfinderForReason:(id)a3;
- (void)_handleDidOpenViewfinderForReason:(id)a3;
- (void)_handleWillCloseViewfinderForReason:(id)a3;
- (void)_handleWillOpenViewfinderForReason:(id)a3;
- (void)handleChangeToMode:(int64_t)a3 device:(int64_t)a4;
- (void)registerHandler:(id)a3 forChangeToMode:(int64_t)a4 devicePosition:(int64_t)a5;
- (void)removeListeners;
- (void)setupListeners;
- (void)startTesting;
- (void)stopTesting;
@end

@implementation CAMModeAndDeviceConfigurationTestHarness

- (CAMModeAndDeviceConfigurationTestHarness)initWithTestName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMModeAndDeviceConfigurationTestHarness;
  v3 = [(CAMPerformanceTestHarness *)&v8 initWithTestName:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modeChangeListeners = v3->__modeChangeListeners;
    v3->__modeChangeListeners = v4;

    [(CAMModeAndDeviceConfigurationTestHarness *)v3 setupListeners];
    v6 = v3;
  }

  return v3;
}

- (void)setupListeners
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleChangeToMode_ name:@"CAMPerformanceDidChangeToModeNotification" object:0];
  [v3 addObserver:self selector:sel__handleWillCloseViewfinderForReason_ name:@"CAMPerformanceWillCloseViewfinderNotification" object:0];
  [v3 addObserver:self selector:sel__handleDidCloseViewfinderForReason_ name:@"CAMPerformanceDidCloseViewfinderNotification" object:0];
  [v3 addObserver:self selector:sel__handleWillOpenViewfinderForReason_ name:@"CAMPerformanceWillOpenViewfinderNotification" object:0];
  [v3 addObserver:self selector:sel__handleDidOpenViewfinderForReason_ name:@"CAMPerformanceDidOpenViewfinderNotification" object:0];
}

- (void)removeListeners
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)startTesting
{
  [(CAMModeAndDeviceConfigurationTestHarness *)self setupListeners];
  v3.receiver = self;
  v3.super_class = (Class)CAMModeAndDeviceConfigurationTestHarness;
  [(CAMPerformanceTestHarness *)&v3 startTesting];
}

- (void)stopTesting
{
  v3.receiver = self;
  v3.super_class = (Class)CAMModeAndDeviceConfigurationTestHarness;
  [(CAMPerformanceTestHarness *)&v3 stopTesting];
  [(CAMModeAndDeviceConfigurationTestHarness *)self removeListeners];
}

- (void)_handleChangeToMode:(id)a3
{
  id v8 = [a3 userInfo];
  v4 = [v8 valueForKey:@"mode"];
  uint64_t v5 = (int)[v4 intValue];

  v6 = [v8 valueForKey:@"device"];
  uint64_t v7 = (int)[v6 intValue];

  [(CAMModeAndDeviceConfigurationTestHarness *)self handleChangeToMode:v5 device:v7];
}

- (void)_handleWillCloseViewfinderForReason:(id)a3
{
  id v6 = [a3 userInfo];
  v4 = [v6 valueForKey:@"reason"];
  uint64_t v5 = (int)[v4 intValue];

  [(CAMModeAndDeviceConfigurationTestHarness *)self handleWillCloseViewfinderForReason:v5];
}

- (void)_handleDidCloseViewfinderForReason:(id)a3
{
  id v6 = [a3 userInfo];
  v4 = [v6 valueForKey:@"reason"];
  uint64_t v5 = (int)[v4 intValue];

  [(CAMModeAndDeviceConfigurationTestHarness *)self handleDidCloseViewfinderForReason:v5];
}

- (void)_handleWillOpenViewfinderForReason:(id)a3
{
  id v6 = [a3 userInfo];
  v4 = [v6 valueForKey:@"reason"];
  uint64_t v5 = (int)[v4 intValue];

  [(CAMModeAndDeviceConfigurationTestHarness *)self handleWillOpenViewfinderForReason:v5];
}

- (void)_handleDidOpenViewfinderForReason:(id)a3
{
  id v6 = [a3 userInfo];
  v4 = [v6 valueForKey:@"reason"];
  uint64_t v5 = (int)[v4 intValue];

  [(CAMModeAndDeviceConfigurationTestHarness *)self handleDidOpenViewfinderForReason:v5];
}

- (void)handleChangeToMode:(int64_t)a3 device:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_209C7BAA8[a4 - 1];
  }
  id v6 = [(CAMModeAndDeviceConfigurationTestHarness *)self _modeChangeListeners];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v13 desiredMode] == a3 && objc_msgSend(v13, "desiredDevicePosition") == v5) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        objc_msgSend(v19, "handler", (void)v21);
        v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v20[2]();

        [v8 removeObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
}

- (void)registerHandler:(id)a3 forChangeToMode:(int64_t)a4 devicePosition:(int64_t)a5
{
  id v8 = a3;
  uint64_t v10 = objc_alloc_init(CAMModeAndDeviceConfigurationChangeListener);
  [(CAMModeAndDeviceConfigurationChangeListener *)v10 setDesiredMode:a4];
  [(CAMModeAndDeviceConfigurationChangeListener *)v10 setDesiredDevicePosition:a5];
  [(CAMModeAndDeviceConfigurationChangeListener *)v10 setHandler:v8];

  uint64_t v9 = [(CAMModeAndDeviceConfigurationTestHarness *)self _modeChangeListeners];
  [v9 addObject:v10];
}

- (NSMutableArray)_modeChangeListeners
{
  return self->__modeChangeListeners;
}

- (void).cxx_destruct
{
}

@end