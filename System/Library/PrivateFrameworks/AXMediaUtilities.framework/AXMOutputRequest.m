@interface AXMOutputRequest
+ (id)speechItemSeparator;
- (AXMOutputRequest)init;
- (AXMOutputRequestHandle)handle;
- (BOOL)interruptsAndClearsQueue;
- (NSArray)actions;
- (NSArray)activeSoundActions;
- (NSArray)hapticActions;
- (NSArray)oneShotSoundActions;
- (NSArray)speechActions;
- (id)completionBlock;
- (void)_addAction:(id)a3;
- (void)addActiveSoundItemWithID:(id)a3;
- (void)addActiveSoundItemWithURL:(id)a3;
- (void)addHapticItemWithURL:(id)a3;
- (void)addHapticItemWithURL:(id)a3 intensity:(double)a4;
- (void)addSoundItemWithID:(id)a3;
- (void)addSoundItemWithURL:(id)a3;
- (void)addSpeechItem:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setInterruptsAndClearsQueue:(BOOL)a3;
@end

@implementation AXMOutputRequest

+ (id)speechItemSeparator
{
  if (speechItemSeparator_onceToken != -1) {
    dispatch_once(&speechItemSeparator_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)speechItemSeparator__Separator;

  return v2;
}

void __39__AXMOutputRequest_speechItemSeparator__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@".\n "];
  v1 = (void *)speechItemSeparator__Separator;
  speechItemSeparator__Separator = v0;
}

- (AXMOutputRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXMOutputRequest;
  v2 = [(AXMOutputRequest *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(AXMOutputRequestHandle);
    handle = v2->_handle;
    v2->_handle = v3;

    dispatch_queue_t v5 = dispatch_queue_create("AXMOutputRequest", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    queue_actions = v2->_queue_actions;
    v2->_queue_actions = (NSMutableArray *)v7;
  }
  return v2;
}

- (NSArray)actions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  objc_super v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AXMOutputRequest_actions__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __27__AXMOutputRequest_actions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)speechActions
{
  uint64_t v2 = [(AXMOutputRequest *)self actions];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_35];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

uint64_t __33__AXMOutputRequest_speechActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)oneShotSoundActions
{
  id v2 = [(AXMOutputRequest *)self actions];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_38];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

uint64_t __39__AXMOutputRequest_oneShotSoundActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)activeSoundActions
{
  id v2 = [(AXMOutputRequest *)self actions];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

uint64_t __38__AXMOutputRequest_activeSoundActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)hapticActions
{
  id v2 = [(AXMOutputRequest *)self actions];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_44];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

uint64_t __33__AXMOutputRequest_hapticActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_addAction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __31__AXMOutputRequest__addAction___block_invoke;
  v12 = &unk_1E6116F08;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  dispatch_sync(queue, &v9);
  handle = self->_handle;
  uint64_t v8 = objc_msgSend(v6, "handle", v9, v10, v11, v12, v13);
  [(AXMOutputRequestHandle *)handle addActionHandle:v8];
}

uint64_t __31__AXMOutputRequest__addAction___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)addSpeechItem:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [[AXMSpeechOutputAction alloc] initWithText:v4];

  [(AXMOutputRequest *)self _addAction:v5];
}

- (void)addSoundItemWithID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(AXMSoundOutputAction *)[AXMOneShotSoundOutputAction alloc] initWithSoundID:v4];
  if (v5)
  {
    [(AXMOutputRequest *)self _addAction:v5];
  }
  else
  {
    id v6 = AXMediaLogSounds();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXMOutputRequest addSoundItemWithID:]();
    }
  }
}

- (void)addSoundItemWithURL:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(AXMSoundOutputAction *)[AXMOneShotSoundOutputAction alloc] initWithURL:v4];
  if (v5)
  {
    [(AXMOutputRequest *)self _addAction:v5];
  }
  else
  {
    id v6 = AXMediaLogSounds();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXMOutputRequest addSoundItemWithURL:]();
    }
  }
}

- (void)addActiveSoundItemWithID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [[AXMActiveSoundOutputAction alloc] initWithSoundID:v4];
  if (v5)
  {
    [(AXMOutputRequest *)self _addAction:v5];
  }
  else
  {
    id v6 = AXMediaLogSounds();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXMOutputRequest addSoundItemWithID:]();
    }
  }
}

- (void)addActiveSoundItemWithURL:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [[AXMActiveSoundOutputAction alloc] initWithURL:v4];
  if (v5)
  {
    [(AXMOutputRequest *)self _addAction:v5];
  }
  else
  {
    id v6 = AXMediaLogSounds();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXMOutputRequest addActiveSoundItemWithURL:]();
    }
  }
}

- (void)addHapticItemWithURL:(id)a3
{
}

- (void)addHapticItemWithURL:(id)a3 intensity:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [[AXMHapticOutputAction alloc] initWithURL:v6];
  [(AXMHapticOutputAction *)v7 setHapticIntensity:a4];
  if (v7)
  {
    [(AXMOutputRequest *)self _addAction:v7];
  }
  else
  {
    uint64_t v8 = AXMediaLogSounds();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXMOutputRequest addHapticItemWithURL:intensity:]();
    }
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)interruptsAndClearsQueue
{
  return self->_interruptsAndClearsQueue;
}

- (void)setInterruptsAndClearsQueue:(BOOL)a3
{
  self->_interruptsAndClearsQueue = a3;
}

- (AXMOutputRequestHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue_actions, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)addSoundItemWithID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Could not produce URL for soundID: %@", v2, v3, v4, v5, v6);
}

- (void)addSoundItemWithURL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Could not make soundAction url does not exist: %@", v2, v3, v4, v5, v6);
}

- (void)addActiveSoundItemWithURL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Could not make sound. Action url does not exist: %@", v2, v3, v4, v5, v6);
}

- (void)addHapticItemWithURL:intensity:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Could not make haptic. Action url does not exist: %@", v2, v3, v4, v5, v6);
}

@end