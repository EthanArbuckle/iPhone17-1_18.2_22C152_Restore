@interface MDMEvents
+ (id)sharedInstance;
- (MDMEvents)init;
- (void)recordData:(id)a3 forEvent:(id)a4;
- (void)recordDateForEvent:(id)a3;
@end

@implementation MDMEvents

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__MDMEvents_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance__sharedInstance_1;
  return v2;
}

void __27__MDMEvents_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__sharedInstance_1;
  sharedInstance__sharedInstance_1 = (uint64_t)v1;

  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = MDMEventsFilePath();
  char v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    v6 = [NSDictionary dictionary];
    v7 = MDMEventsFilePath();
    [v6 DMCWriteToBinaryFile:v7];

    MDMEventsFilePath();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    DMCSetSkipBackupAttributeToItemAtPath();
  }
}

- (MDMEvents)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDMEvents;
  v2 = [(MDMEvents *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MDMEventQueue", 0);
    writerQueue = v2->_writerQueue;
    v2->_writerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)recordDateForEvent:(id)a3
{
  id v4 = a3;
  writerQueue = self->_writerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MDMEvents_recordDateForEvent___block_invoke;
  block[3] = &unk_264B9D3E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(writerQueue, block);
}

void __32__MDMEvents_recordDateForEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  dispatch_queue_t v3 = MDMEventsFilePath();
  id v6 = [v2 dictionaryWithContentsOfFile:v3];

  id v4 = [MEMORY[0x263EFF910] date];
  [v6 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];

  char v5 = MDMEventsFilePath();
  [v6 DMCWriteToBinaryFile:v5];
}

- (void)recordData:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writerQueue = self->_writerQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__MDMEvents_recordData_forEvent___block_invoke;
  v11[3] = &unk_264B9D408;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(writerQueue, v11);
}

void __33__MDMEvents_recordData_forEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  dispatch_queue_t v3 = MDMEventsFilePath();
  id v5 = [v2 dictionaryWithContentsOfFile:v3];

  [v5 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = MDMEventsFilePath();
  [v5 DMCWriteToBinaryFile:v4];
}

- (void).cxx_destruct
{
}

@end