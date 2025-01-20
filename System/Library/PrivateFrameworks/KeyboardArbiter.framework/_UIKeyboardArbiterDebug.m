@interface _UIKeyboardArbiterDebug
+ (id)sharedInstance;
- (BOOL)pause;
- (_UIKeyboardArbiterDebug)debugWithMessage:(id)a3;
- (_UIKeyboardArbiterDebug)init;
- (void)addAsynchronousData:(id)a3;
- (void)addEntry:(id)a3;
- (void)errorWithMessage:(id)a3;
- (void)getDebugInfoDictionariesWithCompletionHandler:(id)a3;
- (void)infoWithMessage:(id)a3;
- (void)setPause:(BOOL)a3;
@end

@implementation _UIKeyboardArbiterDebug

+ (id)sharedInstance
{
  if (qword_26AC12AA0 != -1) {
    dispatch_once(&qword_26AC12AA0, &__block_literal_global_4);
  }
  v2 = (void *)qword_26AC12A98;
  return v2;
}

- (_UIKeyboardArbiterDebug)debugWithMessage:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = +[_UIKeyboardArbiterDebugEntryString entryWithMessage:v7 type:@"Debug"];
  [(_UIKeyboardArbiterDebug *)v4 addEntry:v5];

  objc_sync_exit(v4);

  return result;
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  if (!self->_disable && ![(_UIKeyboardArbiterDebug *)self pause])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36___UIKeyboardArbiterDebug_addEntry___block_invoke;
    v6[3] = &unk_2647211A0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (BOOL)pause
{
  return self->_pause;
}

- (void)infoWithMessage:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = +[_UIKeyboardArbiterDebugEntryString entryWithMessage:v6 type:@"Info"];
  [(_UIKeyboardArbiterDebug *)v4 addEntry:v5];

  objc_sync_exit(v4);
}

- (_UIKeyboardArbiterDebug)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardArbiterDebug;
  v2 = [(_UIKeyboardArbiterDebug *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.UIKit.keyboard-arbiter.debug", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_importantCount = 0;
    v5 = (void *)CFPreferencesCopyAppValue(@"DisableKeyboardDebugInfo", @"com.apple.keyboard");
    v2->_disable = [v5 BOOLValue];
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v6;
  }
  return v2;
}

- (void)errorWithMessage:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = +[_UIKeyboardArbiterDebugEntryString entryWithMessage:v6 type:@"Error"];
  [(_UIKeyboardArbiterDebug *)v4 addEntry:v5];

  objc_sync_exit(v4);
}

- (void)addAsynchronousData:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47___UIKeyboardArbiterDebug_addAsynchronousData___block_invoke;
  v3[3] = &unk_2647218F0;
  v3[4] = self;
  (*((void (**)(id, void *))a3 + 2))(a3, v3);
}

- (void)getDebugInfoDictionariesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73___UIKeyboardArbiterDebug_getDebugInfoDictionariesWithCompletionHandler___block_invoke;
  v7[3] = &unk_264721940;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setPause:(BOOL)a3
{
  self->_pause = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end