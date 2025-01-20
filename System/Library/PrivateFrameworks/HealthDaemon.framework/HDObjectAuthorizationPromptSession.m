@interface HDObjectAuthorizationPromptSession
@end

@implementation HDObjectAuthorizationPromptSession

void __76___HDObjectAuthorizationPromptSession_beginPromptTransactionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Attempt to start a prompt transaction that has already started.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __76___HDObjectAuthorizationPromptSession_beginPromptTransactionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48), 0);
}

uint64_t __77___HDObjectAuthorizationPromptSession_endPromptTransactionWithSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __77___HDObjectAuthorizationPromptSession_endPromptTransactionWithSuccess_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

@end