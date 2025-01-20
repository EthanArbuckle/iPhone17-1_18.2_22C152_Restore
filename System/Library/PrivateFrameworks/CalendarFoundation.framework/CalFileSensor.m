@interface CalFileSensor
- (BOOL)started;
- (CalFileSensor)init;
- (CalFileSensor)initWithPath:(id)a3 eventBlock:(id)a4;
- (NSString)path;
- (id)description;
- (id)eventBlock;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation CalFileSensor

- (CalFileSensor)init
{
}

- (CalFileSensor)initWithPath:(id)a3 eventBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (v9 = v8, ![v7 length]))
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"The 'path' parameter must be non-nil and non-empty" userInfo:0];
    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CalFileSensor;
  v10 = [(CalFileSensor *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_path, a3);
    uint64_t v12 = MEMORY[0x192FD8850](v9);
    id eventBlock = v11->_eventBlock;
    v11->_id eventBlock = (id)v12;

    v11->_started = 0;
    CalGenerateRandomDispatchQueueName((__CFString *)v11->_path);
    id v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v15;
  }
  return v11;
}

- (void)dealloc
{
  source = self->_source;
  if (source) {
    dispatch_source_cancel(source);
  }
  v4.receiver = self;
  v4.super_class = (Class)CalFileSensor;
  [(CalFileSensor *)&v4 dealloc];
}

- (id)description
{
  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalFileSensor;
  objc_super v4 = [(CalFileSensor *)&v9 description];
  v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  [(CalDescriptionBuilder *)v5 setKey:@"_path" withString:self->_path];
  [(CalDescriptionBuilder *)v5 setKey:@"_queue" withDispatchQueue:self->_queue];
  [(CalDescriptionBuilder *)v5 setKey:@"_source" withDispatchSource:self->_source];
  v6 = (void *)MEMORY[0x192FD8850](self->_eventBlock);
  [(CalDescriptionBuilder *)v5 setKey:@"_eventBlock" withObject:v6];

  [(CalDescriptionBuilder *)v5 setKey:@"_started" withBoolean:self->_started];
  id v7 = [(CalDescriptionBuilder *)v5 build];

  return v7;
}

- (void)start
{
}

uint64_t __22__CalFileSensor_start__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (dispatch_source_get_data(v4[2]))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [(dispatch_source_t *)v4 stop];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __22__CalFileSensor_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    if (*((void *)v4 + 2))
    {
      v5 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __22__CalFileSensor_start__block_invoke_2_cold_1((uint64_t)v4, v5);
      }

      close(*(_DWORD *)(a1 + 48));
      v6 = (void *)*((void *)v4 + 2);
      *((void *)v4 + 2) = 0;

      *((unsigned char *)v4 + 32) = 0;
    }
    objc_sync_exit(v4);

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 0;
      [v4 start];
    }
  }
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  obj->_started = 0;
  source = obj->_source;
  if (source) {
    dispatch_source_cancel(source);
  }
  objc_sync_exit(obj);
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)started
{
  return self->_started;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_eventBlock, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __22__CalFileSensor_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Unregistering a file sensor for path: [%@]", (uint8_t *)&v3, 0xCu);
}

@end