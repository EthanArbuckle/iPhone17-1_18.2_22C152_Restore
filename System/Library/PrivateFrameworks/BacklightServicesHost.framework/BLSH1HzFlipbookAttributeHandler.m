@interface BLSH1HzFlipbookAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
- (void)activateForSceneEnvironment:(id)a3;
- (void)deactivateForSceneEnvironment:(id)a3;
@end

@implementation BLSH1HzFlipbookAttributeHandler

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateForSceneEnvironment:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __63__BLSH1HzFlipbookAttributeHandler_activateForSceneEnvironment___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = *(void **)(a1 + 32);
    return [v2 set1HzFlipbook:1];
  }
  else
  {
    id v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [*(id *)(a1 + 32) debugDescription];
    v8 = [v4 stringWithFormat:@"class %@ must respond to selector set1HzFlipbook: in order to acquire assertion with BLS1HzFlipbookAttribute : %@", v6, v7];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __63__BLSH1HzFlipbookAttributeHandler_activateForSceneEnvironment___block_invoke_cold_1(a1, (uint64_t)v8);
    }
    [v8 UTF8String];
    uint64_t result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)deactivateForSceneEnvironment:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __65__BLSH1HzFlipbookAttributeHandler_deactivateForSceneEnvironment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) set1HzFlipbook:0];
}

void __63__BLSH1HzFlipbookAttributeHandler_activateForSceneEnvironment___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138544642;
  v9 = v4;
  __int16 v10 = 2114;
  v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  v15 = @"BLSH1HzFlipbookAttributeHandler.m";
  __int16 v16 = 1024;
  int v17 = 33;
  __int16 v18 = 2114;
  uint64_t v19 = a2;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end