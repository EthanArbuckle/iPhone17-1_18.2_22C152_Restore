@interface SGDomainWhitelistChecker
+ ($30CD494556BCE78BE9FDF48ACEFE6DD0)payloadForDomain:(id)a3;
+ ($30CD494556BCE78BE9FDF48ACEFE6DD0)payloadWithStartChar:(const char *)a3 andSize:(unint64_t)a4;
+ (BOOL)isStructuredEventCandidateForEmailDomain:(id)a3;
+ (BOOL)isStructuredEventCandidateForURL:(id)a3 title:(id)a4;
+ (id)lock;
+ (void)_setTrieFromPath:(id)a3 guardedData:(id)a4;
+ (void)setTrieFromPath:(id)a3;
@end

@implementation SGDomainWhitelistChecker

+ (BOOL)isStructuredEventCandidateForEmailDomain:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 isEqualToString:&stru_1F24EEF20] & 1) == 0)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v7 = [a1 lock];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__SGDomainWhitelistChecker_isStructuredEventCandidateForEmailDomain___block_invoke;
    v9[3] = &unk_1E65B86C8;
    id v12 = a1;
    id v10 = v5;
    v11 = &v13;
    [v7 runWithLockAcquired:v9];

    BOOL v6 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __69__SGDomainWhitelistChecker_isStructuredEventCandidateForEmailDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 8))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) payloadForDomain:*(void *)(a1 + 32)] & 1;
  }
  else
  {
    v2 = sgEventsLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEFAULT, "SGDomainWhitelistChecker isStructuredEventCandidateForEmailDomain: trie is nil.", v3, 2u);
    }
  }
}

+ (BOOL)isStructuredEventCandidateForURL:(id)a3 title:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = [a3 host];
    if ((unint64_t)[v5 length] <= 0x64)
    {
      int v14 = 0;
      memset(v13, 0, sizeof(v13));
      v7 = v13;
      LOBYTE(v6) = 0;
      if ([v5 getCString:v13 maxLength:100 encoding:1])
      {
        int64_t v8 = strnlen((const char *)v13, 0x64uLL);
        v9 = (char *)v13 + v8;
        if (v8 >= 4) {
          v7 = (_OWORD *)((unint64_t)v13 | (4 * (LODWORD(v13[0]) == 779581303)));
        }
        for (uint64_t i = v9 - (unsigned char *)v7; v9 >= (unsigned char *)v7; --v9)
        {
          int v11 = (char)*v9;
          if ((v11 - 65) <= 0x19) {
            unsigned char *v9 = v11 | 0x20;
          }
        }
        unsigned int v6 = ([a1 payloadWithStartChar:v7 andSize:i] >> 2) & 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ ($30CD494556BCE78BE9FDF48ACEFE6DD0)payloadWithStartChar:(const char *)a3 andSize:(unint64_t)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2410000000;
  id v12 = "";
  int v13 = 0;
  unsigned int v6 = [a1 lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__SGDomainWhitelistChecker_payloadWithStartChar_andSize___block_invoke;
  v8[3] = &unk_1E65B86A0;
  v8[5] = a3;
  v8[6] = a4;
  v8[4] = &v9;
  [v6 runWithLockAcquired:v8];

  LODWORD(a4) = *((_DWORD *)v10 + 8);
  _Block_object_dispose(&v9, 8);
  return ($30CD494556BCE78BE9FDF48ACEFE6DD0)a4;
}

uint64_t __57__SGDomainWhitelistChecker_payloadWithStartChar_andSize___block_invoke(void *a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    uint64_t result = [v3 payloadForUTF8String:a1[5] length:a1[6]];
  }
  else
  {
    v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDomainWhitelistChecker payloadWithStartChar: trie is nil.", v6, 2u);
    }

    uint64_t result = 0;
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 32) = result;
  return result;
}

+ ($30CD494556BCE78BE9FDF48ACEFE6DD0)payloadForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2410000000;
  int v14 = "";
  int v15 = 0;
  v5 = [a1 lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SGDomainWhitelistChecker_payloadForDomain___block_invoke;
  v8[3] = &unk_1E65B8678;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 runWithLockAcquired:v8];

  LODWORD(v5) = *((_DWORD *)v12 + 8);
  _Block_object_dispose(&v11, 8);

  return ($30CD494556BCE78BE9FDF48ACEFE6DD0)v5;
}

uint64_t __45__SGDomainWhitelistChecker_payloadForDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    uint64_t result = [v3 payloadForString:*(void *)(a1 + 32)];
  }
  else
  {
    v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDomainWhitelistChecker payloadForDomain: trie is nil.", v6, 2u);
    }

    uint64_t result = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

+ (void)setTrieFromPath:(id)a3
{
  id v4 = a3;
  v5 = [a1 lock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGDomainWhitelistChecker_setTrieFromPath___block_invoke;
  v7[3] = &unk_1E65B8650;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 runWithLockAcquired:v7];
}

uint64_t __44__SGDomainWhitelistChecker_setTrieFromPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _setTrieFromPath:*(void *)(a1 + 32) guardedData:a2];
}

+ (void)_setTrieFromPath:(id)a3 guardedData:(id)a4
{
  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E4F93AC8];
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [[v5 alloc] initWithPath:v7];

    id v9 = (id)v6[1];
    v6[1] = v8;
  }
}

+ (id)lock
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SGDomainWhitelistChecker_lock__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lock_onceToken != -1) {
    dispatch_once(&lock_onceToken, block);
  }
  v2 = (void *)lock_lock;
  return v2;
}

void __32__SGDomainWhitelistChecker_lock__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = +[SGAsset asset];
  id v4 = [v3 filesystemPathForAssetDataRelativePath:@"master_whitelist.trie"];

  v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int out_token = 138412290;
    uint64_t v13 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Loading master domains whitelist from path = %@", (uint8_t *)&out_token, 0xCu);
  }

  [*(id *)(a1 + 32) _setTrieFromPath:v4 guardedData:v2];
  int out_token = 0;
  if (_block_invoke__pasOnceToken3 != -1) {
    dispatch_once(&_block_invoke__pasOnceToken3, &__block_literal_global_15349);
  }
  id v6 = (void *)*MEMORY[0x1E4F5DF58];
  id v7 = (id)_block_invoke__pasExprOnceResult_15350;
  uint64_t v8 = (const char *)[v6 UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __32__SGDomainWhitelistChecker_lock__block_invoke_2;
  handler[3] = &__block_descriptor_40_e8_v12__0i8l;
  handler[4] = *(void *)(a1 + 32);
  notify_register_dispatch(v8, &out_token, v7, handler);
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v2];
  id v10 = (void *)lock_lock;
  lock_lock = v9;
}

void __32__SGDomainWhitelistChecker_lock__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[SGAsset asset];
  v3 = [v2 filesystemPathForAssetDataRelativePath:@"master_whitelist.trie"];

  id v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "Received asset update notification. Now loading master domains whitelist from path = %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setTrieFromPath:v3];
}

void __32__SGDomainWhitelistChecker_lock__block_invoke_6()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.suggestions.masterwhitelist" qosClass:9];
  v2 = (void *)_block_invoke__pasExprOnceResult_15350;
  _block_invoke__pasExprOnceResult_15350 = v1;
}

@end