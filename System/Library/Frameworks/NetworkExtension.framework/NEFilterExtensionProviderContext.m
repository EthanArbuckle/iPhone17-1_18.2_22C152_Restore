@interface NEFilterExtensionProviderContext
- (NSString)description;
- (OS_dispatch_queue)queue;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEFilterExtensionProviderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)stopWithReason:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = [(NEExtensionProviderContext *)self _principalObject];
  v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@: Calling stopFilterWithReason because: %s", buf, 0x16u);
  }

  if (self && (a3 - 1) <= 0x29) {
    uint64_t v7 = qword_19DF9BFE8[a3 - 1];
  }
  else {
    uint64_t v7 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NEFilterExtensionProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_1E5990A58;
  int v9 = a3;
  v8[4] = self;
  [v5 stopFilterWithReason:v7 completionHandler:v8];
}

uint64_t __51__NEFilterExtensionProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)NEFilterExtensionProviderContext;
  objc_msgSendSuper2(&v4, sel_stopWithReason_, v2);
  return [*(id *)(a1 + 32) dispose];
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [(NEExtensionProviderContext *)self _principalObject];
  v8 = [v6 contentFilter];

  int v9 = [v8 provider];
  [v7 setFilterConfiguration:v9];

  if (v11)
  {
    v10 = [NSString stringWithFormat:@"[Extension: %@]", v11];
    -[NEExtensionProviderContext setDescription:]((uint64_t)self, v10);
  }
}

- (NSString)description
{
  return self->_description;
}

- (OS_dispatch_queue)queue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_queue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NEFilterExtensionProviderContext queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  objc_sync_exit(v2);

  id v6 = v2->_queue;

  return v6;
}

@end