@interface ACAccount
@end

@implementation ACAccount

void __75__ACAccount_AppleIDAuthentication__aida_tokenForService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a3;
    id v7 = [a2 objectForKeyedSubscript:v5];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

void __85__ACAccount_AppleIDAuthentication___performSilentReauthForAccount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 objectForKey:*MEMORY[0x1E4F4EDC0]];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
  }
}

@end