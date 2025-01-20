@interface SFCard(CRCard)
+ (id)_interactionsByIntentDataHashes;
- (BOOL)asynchronous;
- (id)_interactionDataKey;
- (id)cardIdentifier;
- (id)interaction;
- (id)interactions;
- (id)resolvedCardSections;
- (id)underlyingInteraction;
- (uint64_t)cardFormat;
- (void)cardIdentifier;
- (void)interaction;
- (void)loadCardWithCompletion:()CRCard;
@end

@implementation SFCard(CRCard)

+ (id)_interactionsByIntentDataHashes
{
  if (_interactionsByIntentDataHashes_onceToken != -1) {
    dispatch_once(&_interactionsByIntentDataHashes_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_interactionsByIntentDataHashes_interactionsByIntentDataHashes;
  return v0;
}

- (BOOL)asynchronous
{
  return [a1 type] == 2 || objc_msgSend(a1, "type") == 3;
}

- (void)loadCardWithCompletion:()CRCard
{
  id v4 = a3;
  v5 = +[CRSFCardLoader sharedLoader];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SFCard_CRCard__loadCardWithCompletion___block_invoke;
  v7[3] = &unk_2647EEFA0;
  id v8 = v4;
  id v6 = v4;
  [v5 loadSFCard:a1 completion:v7];
}

- (id)interactions
{
  v1 = [a1 interaction];
  if (v1) {
    [MEMORY[0x263EFFA08] setWithObject:v1];
  }
  else {
  v2 = [MEMORY[0x263EFFA08] set];
  }

  return v2;
}

- (id)interaction
{
  v2 = [a1 intentMessageData];

  if (v2)
  {
    v3 = [(id)objc_opt_class() _interactionsByIntentDataHashes];
    id v4 = [a1 _interactionDataKey];
    v5 = [v3 objectForKey:v4];
    if (!v5)
    {
      id v6 = [a1 intentMessageName];
      v7 = [a1 intentMessageData];
      id v8 = INIntentCreate();

      v9 = [a1 intentResponseMessageName];
      v10 = [a1 intentResponseMessageData];
      v11 = INIntentResponseCreate();

      v5 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v8 response:v11];
      if (v5) {
        [v3 setObject:v5 forKey:v4];
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)cardIdentifier
{
  v2 = [a1 cardId];

  if (!v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    id v4 = [v3 UUIDString];

    v5 = CRLogContextCards;
    if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR)) {
      [(SFCard(CRCard) *)(uint64_t)a1 cardIdentifier];
    }
    [a1 setCardId:v4];
  }
  id v6 = [a1 cardId];
  return v6;
}

- (uint64_t)cardFormat
{
  return 1;
}

- (id)resolvedCardSections
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [a1 cardSections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v9 = objc_msgSend(v8, "resolvedCardSections", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              [v2 addObject:*(void *)(*((void *)&v16 + 1) + 8 * j)];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }

        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  v14 = (void *)[v2 copy];
  return v14;
}

- (id)underlyingInteraction
{
  v1 = [a1 interactions];
  id v2 = [v1 anyObject];

  return v2;
}

- (id)_interactionDataKey
{
  id v2 = [a1 intentResponseMessageData];

  v3 = NSString;
  uint64_t v4 = [a1 cardId];
  uint64_t v5 = [a1 intentMessageData];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = v6;
  if (v2)
  {
    id v8 = [a1 intentResponseMessageData];
    v9 = [v3 stringWithFormat:@"%@/%zd%zd", v4, v7, objc_msgSend(v8, "hash")];
  }
  else
  {
    v9 = [v3 stringWithFormat:@"%@/%zd", v4, v6];
  }

  return v9;
}

- (void)interaction
{
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_226EA8000, v5, OS_LOG_TYPE_ERROR, "Invalid intent payload for intentMessageName: %@. Exception: %@", v4, 0x16u);
}

- (void)cardIdentifier
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226EA8000, log, OS_LOG_TYPE_ERROR, "Card %@ does not have a card identifier. This is a requirement. Category CRCard on SFCard is setting one (%@) on the client's behalf as a workaround", (uint8_t *)&v3, 0x16u);
}

@end