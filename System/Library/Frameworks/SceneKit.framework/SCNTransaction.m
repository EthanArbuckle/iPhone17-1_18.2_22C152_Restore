@interface SCNTransaction
+ (BOOL)immediateMode;
+ (CAMediaTimingFunction)animationTimingFunction;
+ (__C3DScene)immediateModeRestrictedContext;
+ (id)valueForKey:(NSString *)key;
+ (unsigned)currentState;
+ (void)commit;
+ (void)commitImmediate;
+ (void)enqueueCommandForObject:(id)a3 immediateTransactionBlock:(id)a4;
+ (void)performPresentationInstanceQueriesInScene:(id)a3 usingBlock:(id)a4;
+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 applyBlock:(id)a5;
+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 applyBlock:(id)a6;
+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 subscriptIndex:(unint64_t)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8;
+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 subscriptKey:(id)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8;
+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 keyPath:(id)a5 applyBlock:(id)a6;
+ (void)setAnimationTimingFunction:(CAMediaTimingFunction *)animationTimingFunction;
+ (void)setCompletionBlock:(void *)completionBlock;
+ (void)setDisableActions:(BOOL)disableActions;
+ (void)setImmediateMode:(BOOL)a3;
+ (void)setImmediateModeRestrictedContext:(__C3DScene *)a3;
+ (void)setValue:(id)value forKey:(NSString *)key;
- (BOOL)disableActions;
- (double)animationDuration;
- (id)animationTimingFunction;
- (void)begin;
- (void)commit;
- (void)flush;
- (void)lock;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationTimingFunction:(id)a3;
- (void)setDisableActions:(BOOL)a3;
- (void)unlock;
@end

@implementation SCNTransaction

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 applyBlock:(id)a5
{
  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    v10 = (void (*)(id, __n128))*((void *)a5 + 2);
    v9.n128_u64[0] = 0;
    v10(a5, v9);
  }
  else
  {
    v11 = (const void *)objc_msgSend(a4, "__CFObject");
    C3DTransactionAddCommandBlock(Current, a3, a4, v11, 0, a5);
  }
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 keyPath:(id)a5 applyBlock:(id)a6
{
  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a6 + 2))(a6, 0.0);
    if (a3 && a5)
    {
      v11 = (float32x4_t *)objc_msgSend(a4, "__CFObject");
      C3DTransactionUpdateModelValueForKeypathIfNeeded((uint64_t)a3, v11, (const __CFString *)a5);
    }
  }
  else
  {
    v12 = (const void *)objc_msgSend(a4, "__CFObject");
    C3DTransactionAddCommandBlock(Current, a3, a4, v12, a5, a6);
  }
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 applyBlock:(id)a6
{
  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a6 + 2))(a6, 0.0);
    if (a3 && a5)
    {
      v11 = (float32x4_t *)objc_msgSend(a4, "__CFObject");
      C3DTransactionUpdateModelValueForKeyIfNeeded((uint64_t)a3, v11, (const __CFString *)a5);
    }
  }
  else
  {
    v12 = (const void *)objc_msgSend(a4, "__CFObject");
    C3DTransactionAddCommandBlock(Current, a3, a4, v12, a5, a6);
  }
}

+ (void)setImmediateMode:(BOOL)a3
{
}

+ (void)commitImmediate
{
}

+ (void)setImmediateModeRestrictedContext:(__C3DScene *)a3
{
}

+ (BOOL)immediateMode
{
  Current = C3DTransactionGetCurrent();

  return C3DTransactionIsImmediate((uint64_t)Current);
}

+ (void)commit
{
}

+ (CAMediaTimingFunction)animationTimingFunction
{
  result = (CAMediaTimingFunction *)C3DTransactionGetTimingFunction();
  if (result)
  {
    return (CAMediaTimingFunction *)CAMediaTimingFunctionFromC3DTimingFunction((uint64_t)result);
  }
  return result;
}

+ (void)setAnimationTimingFunction:(CAMediaTimingFunction *)animationTimingFunction
{
  id v3 = C3DTimingFunctionFromCAMediaTimingFunction(animationTimingFunction);

  C3DTransactionSetTimingFunction(v3);
}

+ (void)setDisableActions:(BOOL)disableActions
{
}

+ (void)setCompletionBlock:(void *)completionBlock
{
}

+ (id)valueForKey:(NSString *)key
{
  return C3DTransactionGetValue(key);
}

+ (void)setValue:(id)value forKey:(NSString *)key
{
}

+ (__C3DScene)immediateModeRestrictedContext
{
  Current = C3DTransactionGetCurrent();

  return (__C3DScene *)C3DParticleSystemInstanceGetSystem((uint64_t)Current);
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 subscriptIndex:(unint64_t)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a8 + 2))(a8, 0.0);
    if (a3 && a7)
    {
      v15 = (const void *)objc_msgSend(a4, "__CFObject");
      C3DTransactionUpdateModelValueForKeyAndSubscriptIndexIfNeeded((uint64_t)a3, v15, (const __CFString *)a5, a6);
    }
  }
  else
  {
    v16 = (const void *)objc_msgSend(a4, "__CFObject");
    C3DTransactionAddCommandBlock(Current, a3, a4, v16, a7, a8);
  }
}

+ (void)postCommandWithContext:(__C3DScene *)a3 object:(id)a4 key:(id)a5 subscriptKey:(id)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  Current = C3DTransactionGetCurrent();
  if (C3DTransactionAllowImmediate((uint64_t)Current, (id *)a3))
  {
    (*((void (**)(id, double))a8 + 2))(a8, 0.0);
    if (a3 && a7)
    {
      v15 = (const void *)objc_msgSend(a4, "__CFObject");
      C3DTransactionUpdateModelValueForKeyAndSubscriptKeyIfNeeded((uint64_t)a3, v15, (const __CFString *)a5, a6);
    }
  }
  else
  {
    v16 = (const void *)objc_msgSend(a4, "__CFObject");
    C3DTransactionAddCommandBlock(Current, a3, a4, v16, a7, a8);
  }
}

+ (void)enqueueCommandForObject:(id)a3 immediateTransactionBlock:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a3 = (id)[a3 scene];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [a3 sceneRef];
    if (!v8)
    {
      __n128 v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        +[SCNTransaction enqueueCommandForObject:immediateTransactionBlock:](v9);
      }
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke;
    v11[3] = &unk_264009E20;
    v11[4] = a4;
    v11[5] = a2;
    [a1 postCommandWithContext:v8 object:a3 applyBlock:v11];
  }
  else
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SCNTransaction enqueueCommandForObject:immediateTransactionBlock:]();
    }
  }
}

uint64_t __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke(uint64_t a1)
{
  if (+[SCNTransaction immediateMode])
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v2();
  }
  else
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke_cold_1(a1);
    }
    +[SCNTransaction setImmediateMode:1];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    return +[SCNTransaction setImmediateMode:0];
  }
}

+ (void)performPresentationInstanceQueriesInScene:(id)a3 usingBlock:(id)a4
{
  uint64_t v5 = [a3 sceneRef];
  uint64_t v7 = v5;
  if (v5)
  {
    uint64_t v6 = v5;
    C3DSceneLock(v5);
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v7);
    C3DSceneUnlock(v6);
  }
  else
  {
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v7);
  }
}

+ (unsigned)currentState
{
  return C3DTransactionGetCurrentDepth();
}

- (void)begin
{
}

- (void)commit
{
}

- (void)flush
{
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)setAnimationDuration:(double)a3
{
}

- (double)animationDuration
{
  +[SCNTransaction animationDuration];
  return result;
}

- (void)setDisableActions:(BOOL)a3
{
}

- (BOOL)disableActions
{
  return +[SCNTransaction disableActions];
}

- (void)setAnimationTimingFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a3 = (id)[MEMORY[0x263F15808] functionWithName:a3];
  }

  +[SCNTransaction setAnimationTimingFunction:a3];
}

- (id)animationTimingFunction
{
  return 0;
}

+ (void)enqueueCommandForObject:(os_log_t)log immediateTransactionBlock:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "sceneRef";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

+ (void)enqueueCommandForObject:immediateTransactionBlock:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Unreachable code: Unsupported class %@", v3, v4, v5, v6, 2u);
}

void __68__SCNTransaction_enqueueCommandForObject_immediateTransactionBlock___block_invoke_cold_1(uint64_t a1)
{
  NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Unreachable code: Command enqueued by %@ was expected to be run in immediate mode", v3, v4, v5, v6, 2u);
}

@end