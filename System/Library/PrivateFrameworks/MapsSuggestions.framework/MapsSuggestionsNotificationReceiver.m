@interface MapsSuggestionsNotificationReceiver
- (MapsSuggestionsNotificationReceiver)initWithDarwinNotification:(const char *)a3 block:(id)a4;
- (MapsSuggestionsNotificationReceiver)initWithDarwinNotification:(const char *)a3 queue:(id)a4 block:(id)a5;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation MapsSuggestionsNotificationReceiver

- (MapsSuggestionsNotificationReceiver)initWithDarwinNotification:(const char *)a3 queue:(id)a4 block:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsNotificationReceiver;
  if ([(MapsSuggestionsNotificationReceiver *)&v11 init])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__MapsSuggestionsNotificationReceiver_initWithDarwinNotification_queue_block___block_invoke;
    v10[3] = &unk_1E5CC34F8;
    v10[4] = v8;
    _Block_copy(v10);
    operator new();
  }

  return 0;
}

void __78__MapsSuggestionsNotificationReceiver_initWithDarwinNotification_queue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [[MapsSuggestionsNotification alloc] initWithCppNotification:a2];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, MapsSuggestionsNotification *))(v3 + 16))(v3, v4);
  }
}

- (MapsSuggestionsNotificationReceiver)initWithDarwinNotification:(const char *)a3 block:(id)a4
{
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = a4;
  dispatch_queue_t v9 = dispatch_queue_create("MapsSuggestionsNotificationReceiver", v7);
  v10 = [(MapsSuggestionsNotificationReceiver *)self initWithDarwinNotification:a3 queue:v9 block:v8];

  return v10;
}

- (void)dealloc
{
  std::unique_ptr<MSg::NotificationReceiver>::reset[abi:ne180100]((uint64_t *)&self->_receiver, 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsNotificationReceiver;
  [(MapsSuggestionsNotificationReceiver *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end