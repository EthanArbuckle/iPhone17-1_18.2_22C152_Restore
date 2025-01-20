@interface ATXAmbientLightMonitor
+ (ATXAmbientLightMonitor)sharedInstance;
+ (int)getAmbientLightTypeForXValue:(double)a3 YValue:(double)a4 ZValue:(double)a5;
- (ATXAmbientLightMonitor)init;
- (ATXAmbientLightMonitor)initWithoutMonitoring;
- (id)getCurrentSampledValues;
- (int)getCurrentAmbientLightType;
- (void)addSampleWithXValue:(id)a3 YValue:(id)a4 ZValue:(id)a5;
- (void)dealloc;
- (void)start;
@end

@implementation ATXAmbientLightMonitor

- (void)addSampleWithXValue:(id)a3 YValue:(id)a4 ZValue:(id)a5
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D25F6CC0]();
  if ((unint64_t)[(NSMutableArray *)self->_sampledAmbientLightValues count] > 4)
  {
    v14[0] = v8;
    v14[1] = v9;
    v14[2] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [(NSMutableArray *)self->_sampledAmbientLightValues setObject:v13 atIndexedSubscript:self->_sampledAmbientLightValuesCurrentIndex];
  }
  else
  {
    sampledAmbientLightValues = self->_sampledAmbientLightValues;
    v15[0] = v8;
    v15[1] = v9;
    v15[2] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    [(NSMutableArray *)sampledAmbientLightValues addObject:v13];
  }

  self->_sampledAmbientLightValuesCurrentIndex = (self->_sampledAmbientLightValuesCurrentIndex + 1) % 5uLL;
}

+ (ATXAmbientLightMonitor)sharedInstance
{
  if (sharedInstance__pasOnceToken2_3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_3, &__block_literal_global_184);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_44;
  return (ATXAmbientLightMonitor *)v2;
}

void __40__ATXAmbientLightMonitor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_44;
  sharedInstance__pasExprOnceResult_44 = v1;
}

- (ATXAmbientLightMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXAmbientLightMonitor;
  v2 = [(ATXAmbientLightMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sampledAmbientLightValues = v2->_sampledAmbientLightValues;
    v2->_sampledAmbientLightValues = (NSMutableArray *)v3;

    v2->_sampledAmbientLightValuesCurrentIndex = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("ATXAmbientLightMonitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    [(ATXAmbientLightMonitor *)v2 start];
  }
  return v2;
}

- (ATXAmbientLightMonitor)initWithoutMonitoring
{
  v10.receiver = self;
  v10.super_class = (Class)ATXAmbientLightMonitor;
  v2 = [(ATXAmbientLightMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sampledAmbientLightValues = v2->_sampledAmbientLightValues;
    v2->_sampledAmbientLightValues = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("ATXAmbientLightMonitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)start
{
  uint64_t v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  self->_client = v3;
  if (v3)
  {
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    IOHIDEventSystemClientRegisterEventCallback();
    client = self->_client;
    IOHIDEventSystemClientSetProperty(client, @"ClientEventFilter", &unk_1F27F3768);
  }
}

- (void)dealloc
{
  if (self->_client)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    IOHIDEventSystemClientCancel();
    IOHIDEventSystemClientCancel();
    CFRelease(self->_client);
    self->_client = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXAmbientLightMonitor;
  [(ATXAmbientLightMonitor *)&v3 dealloc];
}

- (int)getCurrentAmbientLightType
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_client)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__89;
    v30 = __Block_byref_object_dispose__89;
    id v31 = (id)objc_opt_new();
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__ATXAmbientLightMonitor_getCurrentAmbientLightType__block_invoke;
    block[3] = &unk_1E68AFB40;
    block[4] = self;
    v25 = &v26;
    v5 = v3;
    v24 = v5;
    dispatch_async(queue, block);
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v5 timeoutSeconds:1.0])
    {
      int v6 = 7;
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = (id)v27[5];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
      if (v8)
      {
        unint64_t v9 = 0;
        uint64_t v10 = *(void *)v20;
        v11 = &unk_1F27F1F08;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            unint64_t v14 = objc_msgSend((id)v27[5], "countForObject:", v13, (void)v19);
            unint64_t v15 = v14;
            if (v14 <= v9)
            {
              if (v14 != v9) {
                continue;
              }
              uint64_t v17 = [v13 integerValue];
              if (v17 >= [v11 integerValue]) {
                continue;
              }
            }
            id v16 = v13;

            v11 = v16;
            unint64_t v9 = v15;
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
        }
        while (v8);
      }
      else
      {
        v11 = &unk_1F27F1F08;
      }

      int v6 = [v11 intValue];
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    [(ATXAmbientLightMonitor *)self start];
    return 7;
  }
  return v6;
}

intptr_t __52__ATXAmbientLightMonitor_getCurrentAmbientLightType__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", 0, (void)v20);
        [v8 doubleValue];
        double v10 = v9;

        v11 = [v7 objectAtIndexedSubscript:1];
        [v11 doubleValue];
        double v13 = v12;

        unint64_t v14 = [v7 objectAtIndexedSubscript:2];
        [v14 doubleValue];
        double v16 = v15;

        uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_opt_class(), "getAmbientLightTypeForXValue:YValue:ZValue:", v10, v13, v16));
        [v17 addObject:v18];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)getCurrentSampledValues
{
  return self->_sampledAmbientLightValues;
}

+ (int)getAmbientLightTypeForXValue:(double)a3 YValue:(double)a4 ZValue:(double)a5
{
  if (a4 < 4.0) {
    return 0;
  }
  if (a5 < a4 && a4 < 100.0 && a5 < a3) {
    return 1;
  }
  double v8 = a3 * 0.8;
  if (a4 < 200.0 && v8 <= a5) {
    return 2;
  }
  if (a4 < 1000.0)
  {
    BOOL v9 = v8 == a5;
    BOOL v10 = v8 < a5;
  }
  else
  {
    BOOL v9 = 1;
    BOOL v10 = 0;
  }
  if (!v10 && !v9) {
    return 3;
  }
  if (a4 < 30000.0)
  {
    BOOL v11 = v8 == a5;
    BOOL v12 = v8 < a5;
  }
  else
  {
    BOOL v11 = 1;
    BOOL v12 = 0;
  }
  if (!v12 && !v11) {
    return 4;
  }
  if (a4 >= 10000.0) {
    return 6;
  }
  return 5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampledAmbientLightValues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end