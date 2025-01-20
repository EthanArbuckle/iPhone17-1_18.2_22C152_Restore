@interface IKDOMEventDispatcher
+ (id)sharedInstance;
- (BOOL)_runPhase:(int64_t)a3 event:(id)a4 nodeEn:(id)a5;
- (BOOL)dispatchEvent:(id)a3;
@end

@implementation IKDOMEventDispatcher

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__IKDOMEventDispatcher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_dispatcher;
  return v2;
}

uint64_t __38__IKDOMEventDispatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_dispatcher;
  sharedInstance_dispatcher = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (BOOL)dispatchEvent:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setInUse:1];
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [v4 target];
  v7 = [v6 parentNode];

  if (v7)
  {
    do
    {
      [v5 insertObject:v7 atIndex:0];
      uint64_t v8 = [v7 parentNode];

      v7 = (void *)v8;
    }
    while (v8);
  }
  v9 = [v5 objectEnumerator];
  int v10 = [(IKDOMEventDispatcher *)self _runPhase:1 event:v4 nodeEn:v9];

  if (([v4 isPropagationStopped] & 1) == 0)
  {
    v11 = [v4 target];
    v16[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    v13 = [v12 objectEnumerator];
    v10 |= [(IKDOMEventDispatcher *)self _runPhase:2 event:v4 nodeEn:v13];
  }
  if (([v4 isPropagationStopped] & 1) == 0 && objc_msgSend(v4, "bubbles"))
  {
    v14 = [v5 reverseObjectEnumerator];
    v10 |= [(IKDOMEventDispatcher *)self _runPhase:3 event:v4 nodeEn:v14];
  }
  [v4 setInUse:0];

  return v10;
}

- (BOOL)_runPhase:(int64_t)a3 event:(id)a4 nodeEn:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v9 = [v8 nextObject];
  if (v9)
  {
    do
    {
      if ([v7 isPropagationStopped]) {
        break;
      }
      [v7 updateDispatchStateWithCurrentTarget:v9 phase:a3];
      int v10 = [v7 type];
      v11 = [v7 xmlAttribute];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__IKDOMEventDispatcher__runPhase_event_nodeEn___block_invoke;
      v15[3] = &unk_1E6DE3BF0;
      v17 = &v18;
      id v16 = v7;
      [v9 enumerateEventListernersForType:v10 xmlAttribute:v11 phase:a3 usingBlock:v15];

      uint64_t v12 = [v8 nextObject];

      v9 = (void *)v12;
    }
    while (v12);
  }
  char v13 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __47__IKDOMEventDispatcher__runPhase_event_nodeEn___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if ([v5 isEnabled])
  {
    v6 = [v5 value];
    v9[0] = *(void *)(a1 + 32);
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v8 = (id)[v6 callWithArguments:v7];
  }
  if ([*(id *)(a1 + 32) isImmediatePropagationStopped]) {
    *a3 = 1;
  }
}

@end