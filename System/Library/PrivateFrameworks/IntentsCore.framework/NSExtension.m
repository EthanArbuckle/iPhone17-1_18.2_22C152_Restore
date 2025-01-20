@interface NSExtension
@end

@implementation NSExtension

void __109__NSExtension_IntentsCore___intents_startExtensionConnectionWithExtensionInputItems_intent_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315650;
    v6 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]_block_invoke";
    __int16 v7 = 2050;
    uint64_t v8 = 0x4024000000000000;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_error_impl(&dword_1BC57D000, v2, OS_LOG_TYPE_ERROR, "%s Extension launching timed out after %{public}f seconds for intent %@", (uint8_t *)&v5, 0x20u);
  }
  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300D0] code:5000 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __109__NSExtension_IntentsCore___intents_startExtensionConnectionWithExtensionInputItems_intent_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

@end