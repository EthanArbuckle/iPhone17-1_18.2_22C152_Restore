@interface ICLexiconManager
@end

@implementation ICLexiconManager

void __42___ICLexiconManager__actuallyLoadLexicons__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WeakRetained[43] | 4) == 4)
  {
    v2 = WeakRetained;
    [WeakRetained doLoadLexicon];
    WeakRetained = v2;
  }
}

void __34___ICLexiconManager_loadLexicons___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 192) wordLexiconImpl];
  v7[0] = v2;
  v3 = [*(id *)(*(void *)(a1 + 32) + 192) phraseLexiconImpl];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __35___ICLexiconManager_unloadLexicons__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    switch([*(id *)(a1 + 32) contactLoadState])
    {
      case 1u:
      case 3u:
        [MEMORY[0x263F08B88] sleepForTimeInterval:0.1];
        [WeakRetained unloadLexicons];
        break;
      case 2u:
      case 4u:
        [WeakRetained[18] removeAllObjects];
        [WeakRetained changeContactLoadingState:0];
        break;
      default:
        break;
    }
    switch([*(id *)(a1 + 32) namedEntityLoadState])
    {
      case 1u:
      case 3u:
        [MEMORY[0x263F08B88] sleepForTimeInterval:0.1];
        [WeakRetained unloadLexicons];
        break;
      case 2u:
      case 4u:
        [WeakRetained[24] removeAllEntities];
        [WeakRetained changeNamedEntityLoadingState:0];
        break;
      default:
        break;
    }
  }
}

uint64_t __40___ICLexiconManager_addContactObserver___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[19];
    v7 = WeakRetained;
    uint64_t v4 = (void *)MEMORY[0x237DDFA40](*(void *)(a1 + 40));
    [v3 addObject:v4];

    int v5 = [*(id *)(a1 + 32) contactLoadState];
    if (v5 == 2)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else if (!v5)
    {
      [v7 doLoadLexicon];
    }
  }
  return MEMORY[0x270F9A758]();
}

void __43___ICLexiconManager_removeContactObserver___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[19];
    int v5 = WeakRetained;
    uint64_t v4 = (void *)MEMORY[0x237DDFA40](*(void *)(a1 + 32));
    [v3 removeObject:v4];

    WeakRetained = v5;
  }
}

void __52___ICLexiconManager_addNamedEntitiesUpdateObserver___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[20];
    int v5 = WeakRetained;
    uint64_t v4 = (void *)MEMORY[0x237DDFA40](*(void *)(a1 + 32));
    [v3 addObject:v4];

    WeakRetained = v5;
  }
}

void __55___ICLexiconManager_removeNamedEntitiesUpdateObserver___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[20];
    int v5 = WeakRetained;
    uint64_t v4 = (void *)MEMORY[0x237DDFA40](*(void *)(a1 + 32));
    [v3 removeObject:v4];

    WeakRetained = v5;
  }
}

void __39___ICLexiconManager_resetNamedEntities__block_invoke(uint64_t a1)
{
  v2 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, " Named Entities: resetNamedEntities", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[24] removeAllEntities];
  }
}

void __39___ICLexiconManager_setupNamedEntities__block_invoke(uint64_t a1)
{
  v2 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: setupNamedEntities", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained changeNamedEntityLoadingState:1];
  }
}

void __39___ICLexiconManager_handleNamedEntity___block_invoke(uint64_t a1)
{
  v2 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39___ICLexiconManager_handleNamedEntity___block_invoke_cold_1();
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[24] addEntity:*(void *)(a1 + 32) isDurable:1];
  }
}

void __42___ICLexiconManager_completeNamedEntities__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [WeakRetained[24] durableEntitiesAdded];
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: Reloading recents and processing %lu named entities entities", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained[24] reloadRecents];
    [WeakRetained changeNamedEntityLoadingState:2];
    [WeakRetained _notifyNamedEntitiesUpdateObservers];
  }
  uint64_t v4 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_235496000, v4, OS_LOG_TYPE_DEFAULT, "Named Entities: completeNamedEntities", (uint8_t *)&v5, 2u);
  }
}

void __45___ICLexiconManager_setupRecentNamedEntities__block_invoke(uint64_t a1)
{
  v2 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: setupRecentNamedEntities", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained changeNamedEntityLoadingState:3];
  }
}

void __45___ICLexiconManager_handleRecentNamedEntity___block_invoke(uint64_t a1)
{
  v2 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45___ICLexiconManager_handleRecentNamedEntity___block_invoke_cold_1();
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[24] addEntity:*(void *)(a1 + 32) isDurable:0];
  }
}

void __48___ICLexiconManager_completeRecentNamedEntities__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [WeakRetained[24] recentEntitiesAdded];
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: processing %lu recent named entities entities", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained changeNamedEntityLoadingState:2];
    [WeakRetained _notifyNamedEntitiesUpdateObservers];
  }
  uint64_t v4 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_235496000, v4, OS_LOG_TYPE_DEFAULT, "Named Entities: completeNamedEntities", (uint8_t *)&v5, 2u);
  }
}

void __34___ICLexiconManager_setupContacts__block_invoke(uint64_t a1)
{
  v2 = _ICPersContactOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, "Contacts: setupContacts", (uint8_t *)v5, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[18] removeAllObjects];
  }
}

void __35___ICLexiconManager_handleContact___block_invoke(uint64_t a1)
{
  v2 = _ICPersContactOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __35___ICLexiconManager_handleContact___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained addContact:*(void *)(a1 + 32)];
  }
}

void __37___ICLexiconManager_completeContacts__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) changeContactLoadingState:2];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = _ICPersContactOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [WeakRetained[18] count];
      uint64_t v5 = [WeakRetained[19] count];
      *(_DWORD *)buf = 134218240;
      uint64_t v18 = v4;
      __int16 v19 = 2048;
      uint64_t v20 = v5;
      _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_DEFAULT, "Contacts: sending %lu contacts to %lu observers", buf, 0x16u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = WeakRetained[19];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  v11 = _ICPersContactOSLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235496000, v11, OS_LOG_TYPE_DEFAULT, "Contacts: completeContacts", buf, 2u);
  }
}

void __40___ICLexiconManager_setupRecentContacts__block_invoke(uint64_t a1)
{
  v2 = _ICPersContactOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_DEFAULT, "setupRecentContacts", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained contactLoadState] != 4) {
      [v4 changeContactLoadingState:3];
    }
    v4[42] = 0;
  }
}

void __41___ICLexiconManager_handleRecentContact___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained
    && [a1[4] contactLoadState] != 4
    && [a1[4] contactLoadState])
  {
    int v2 = [a1[5] changeType];
    if (v2 != 1)
    {
      if (v2 != 2)
      {
        if (v2 == 3) {
          [a1[4] removeContact:a1[5]];
        }
        goto LABEL_10;
      }
      [a1[4] removeContact:a1[5]];
    }
    [a1[4] addContact:a1[5]];
LABEL_10:
    ++WeakRetained[42];
  }
}

void __43___ICLexiconManager_completeRecentContacts__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) contactLoadState] != 4
    && [*(id *)(a1 + 32) contactLoadState])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained changeContactLoadingState:2];
      uint64_t v4 = _ICPersContactOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *((_DWORD *)v3 + 42);
        uint64_t v6 = [*((id *)v3 + 19) count];
        *(_DWORD *)buf = 67109376;
        int v19 = v5;
        __int16 v20 = 2048;
        uint64_t v21 = v6;
        _os_log_impl(&dword_235496000, v4, OS_LOG_TYPE_DEFAULT, "Contacts: %d changes received, if > 0, notifying %lu observers", buf, 0x12u);
      }

      if (*((int *)v3 + 42) >= 1)
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v7 = *((id *)v3 + 19);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v14;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v7);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v11));
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v9);
        }
      }
    }
  }
  long long v12 = _ICPersContactOSLogFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235496000, v12, OS_LOG_TYPE_DEFAULT, "completeRecentContacts", buf, 2u);
  }
}

uint64_t __41___ICLexiconManager_printLexiconToNSLog___block_invoke(uint64_t a1)
{
  int v2 = (const void *)LXEntryCopyString();
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  CFRelease(v2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:@" "];
  return MEMORY[0x270F9A758]();
}

uint64_t __32___ICLexiconManager_countWords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:&stru_26E89F4A0];
}

uint64_t __36___ICLexiconManager_getContactCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __41___ICLexiconManager_debugEntityLoadState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 176);
  return result;
}

void __39___ICLexiconManager_handleNamedEntity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235496000, v0, v1, "Named Entities: handleNamedEntity: %@", v2, v3, v4, v5, v6);
}

void __45___ICLexiconManager_handleRecentNamedEntity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235496000, v0, v1, "Named Entities: handleRecentNamedEntity: %@", v2, v3, v4, v5, v6);
}

void __35___ICLexiconManager_handleContact___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235496000, v0, v1, "Contacts: handleContact: %@", v2, v3, v4, v5, v6);
}

@end