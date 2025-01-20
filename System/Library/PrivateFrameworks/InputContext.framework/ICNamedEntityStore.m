@interface ICNamedEntityStore
@end

@implementation ICNamedEntityStore

void __53___ICNamedEntityStore_exemplarSetForSupportedLocales__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = 0;
  exemplarSetForSupportedLocales_exemplarSet = _createExemplarSetForLocales(&unk_26E8A28A8, &v1);
  if (v1 >= 1)
  {
    v0 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v3 = v1;
      _os_log_impl(&dword_235496000, v0, OS_LOG_TYPE_DEFAULT, "Unable to create exemplar set for whitelisting named entities (UErrorCode=%d)", buf, 8u);
    }
  }
}

uint64_t __54___ICNamedEntityStore_areStringCharactersWhitelisted___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = MEMORY[0x237DDFC10](a2);
  uint64_t result = MEMORY[0x237DDFCA0](v5, v6);
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void __43___ICNamedEntityStore_addEntity_isDurable___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObject:");
  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 >= *(void *)(v4 + 16))
  {
    uint64_t v5 = [*(id *)(v4 + 8) firstObject];
    [*(id *)(*(void *)(a1 + 32) + 96) removeEntity:v5];
    [*(id *)(*(void *)(a1 + 32) + 88) removeEntity:v5];
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];

    uint64_t v4 = *(void *)(a1 + 32);
  }
  [*(id *)(v4 + 8) addObject:v6];
}

id __43___ICNamedEntityStore_addEntity_isDurable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = [a3 lowercaseString];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "name", (void)v15);
        v12 = [v11 lowercaseString];
        char v13 = [v5 isEqualToString:v12];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

void __32___ICNamedEntityStore_tokenize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    id v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v8 = [v6 stringByTrimmingCharactersInSet:v7];

    [*(id *)(a1 + 32) addObject:v8];
  }
}

@end