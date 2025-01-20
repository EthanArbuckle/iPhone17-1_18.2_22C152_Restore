@interface AVUXMDisplayManager
+ (AVUXMDisplayManager)sharedAVKitUXMDisplayManager;
- (AVDisplayCriteria)preferredDisplayCriteria;
- (AVUXMDisplayManager)init;
- (id)currentUXMDisplayCriteria;
- (id)initInternal;
- (void)dealloc;
- (void)reset;
- (void)setPreferredDisplayCriteria:(id)a3;
@end

@implementation AVUXMDisplayManager

- (void)dealloc
{
  [(AVUXMDisplayManager *)self setPreferredDisplayCriteria:0];
  v3.receiver = self;
  v3.super_class = (Class)AVUXMDisplayManager;
  [(AVUXMDisplayManager *)&v3 dealloc];
}

- (void)reset
{
}

+ (AVUXMDisplayManager)sharedAVKitUXMDisplayManager
{
  if (createDispatchQueueOnce_onceToken != -1) {
    dispatch_once(&createDispatchQueueOnce_onceToken, &__block_literal_global_17);
  }
  return 0;
}

- (id)currentUXMDisplayCriteria
{
  return 0;
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__19;
  v9 = __Block_byref_object_dispose__19;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AVUXMDisplayManager_preferredDisplayCriteria__block_invoke;
  v4[3] = &unk_1E57B2110;
  v4[4] = self;
  v4[5] = &v5;
  av_readwrite_dispatch_queue_read((dispatch_queue_t)sAVUXMDisplayManagerQueue, v4);
  v2 = (AVDisplayCriteria *)(id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __47__AVUXMDisplayManager_preferredDisplayCriteria__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setPreferredDisplayCriteria:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__AVUXMDisplayManager_setPreferredDisplayCriteria___block_invoke;
  v3[3] = &unk_1E57B2098;
  v3[4] = self;
  v3[5] = a3;
  av_readwrite_dispatch_queue_write((dispatch_queue_t)sAVUXMDisplayManagerQueue, v3);
}

void *__51__AVUXMDisplayManager_setPreferredDisplayCriteria___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 8);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    id result = (id)v2[5];
    *(void *)(v2[4] + 8) = result;
    if (dword_1E9356B10)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (void *)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (AVUXMDisplayManager)init
{
  objc_exception_throw(v7);
}

- (id)initInternal
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (createDispatchQueueOnce_onceToken != -1) {
    dispatch_once(&createDispatchQueueOnce_onceToken, &__block_literal_global_17);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVUXMDisplayManager;
  return [(AVUXMDisplayManager *)&v4 init];
}

@end