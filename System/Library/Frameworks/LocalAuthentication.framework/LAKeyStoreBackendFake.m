@interface LAKeyStoreBackendFake
@end

@implementation LAKeyStoreBackendFake

id __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v2 = *MEMORY[0x1E4F3BC18];
  v3 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F3BC18]];
  v4 = (void *)[v3 mutableCopy];

  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F3B6B0]];
  v5 = +[LASecAccessControl allowAllACL];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B548]];

  [v1 setObject:v4 forKeyedSubscript:v2];

  return v1;
}

id __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  }
  v5 = v4;

  [v5 addObject:a1[6]];

  return v5;
}

id __63___LAKeyStoreBackendFake_createGenericPasswordWithQuery_error___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  }
  v5 = v4;

  [v5 addObject:a1[6]];

  return v5;
}

uint64_t __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

uint64_t __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

@end