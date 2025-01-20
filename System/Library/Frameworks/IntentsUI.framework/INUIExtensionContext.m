@interface INUIExtensionContext
@end

@implementation INUIExtensionContext

void __41___INUIExtensionContext_viewWasCancelled__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 viewWasCancelled];
}

void __66___INUIExtensionContext_queryRepresentedPropertiesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 queryRepresentedPropertiesWithCompletion:*(void *)(a1 + 40)];
}

void __46___INUIExtensionContext_desiresInteractivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 desiresInteractivity:*(void *)(a1 + 40)];
}

void __101___INUIExtensionContext_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 configureForParameters:*(void *)(a1 + 40) ofInteraction:*(void *)(a1 + 48) interactiveBehavior:*(void *)(a1 + 64) context:*(void *)(a1 + 72) completion:*(void *)(a1 + 56)];
}

void __48___INUIExtensionContext__errorHandlingHostProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[_INUIExtensionContext _errorHandlingHostProxy]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve extension context host: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

@end