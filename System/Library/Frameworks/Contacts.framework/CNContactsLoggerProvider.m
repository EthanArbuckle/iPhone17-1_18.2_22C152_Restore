@interface CNContactsLoggerProvider
+ (CNContactsLoggerProvider)defaultProvider;
- (CNAPITriageLogger)apiTriageLogger;
- (CNContactsLogger)contactsLogger;
- (CNFavoritesLogger)favoritesLogger;
- (CNGeminiLogger)geminiLogger;
- (CNImageUtilitiesLogger)imageUtilitiesLogger;
- (CNRegulatoryLogger)regulatoryLogger;
- (CNSpotlightIndexingLogger)spotlightIndexingLogger;
@end

@implementation CNContactsLoggerProvider

id __42__CNContactsLoggerProvider_contactsLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNContactsLogger);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v2;
}

- (CNContactsLogger)contactsLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactsLogger *)v2;
}

- (CNFavoritesLogger)favoritesLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNFavoritesLogger *)v2;
}

+ (CNContactsLoggerProvider)defaultProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CNContactsLoggerProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_0 != -1) {
    dispatch_once(&defaultProvider_cn_once_token_0, block);
  }
  v2 = (void *)defaultProvider_cn_once_object_0;

  return (CNContactsLoggerProvider *)v2;
}

- (CNAPITriageLogger)apiTriageLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNAPITriageLogger *)v2;
}

id __43__CNContactsLoggerProvider_apiTriageLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc_init(CNAPITriageLogger);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }

  return v2;
}

uint64_t __43__CNContactsLoggerProvider_defaultProvider__block_invoke(uint64_t a1)
{
  defaultProvider_cn_once_object_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

id __43__CNContactsLoggerProvider_favoritesLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNFavoritesLogger);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }

  return v2;
}

- (CNSpotlightIndexingLogger)spotlightIndexingLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNSpotlightIndexingLogger *)v2;
}

id __51__CNContactsLoggerProvider_spotlightIndexingLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(_CNSpotlightIndexingLogger);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v2;
}

- (CNRegulatoryLogger)regulatoryLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNRegulatoryLogger *)v2;
}

id __44__CNContactsLoggerProvider_regulatoryLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F5A4D8]) initWithAuditToken:0 assumedIdentity:0];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }

  return v2;
}

- (CNGeminiLogger)geminiLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNGeminiLogger *)v2;
}

id __40__CNContactsLoggerProvider_geminiLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(_CNGeminiLogger);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }

  return v2;
}

- (CNImageUtilitiesLogger)imageUtilitiesLogger
{
  v2 = cn_objectResultWithObjectLock();

  return (CNImageUtilitiesLogger *)v2;
}

id __48__CNContactsLoggerProvider_imageUtilitiesLogger__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(_CNImageUtilitiesLogger);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUtilitiesLogger, 0);
  objc_storeStrong((id *)&self->_apiTriageLogger, 0);
  objc_storeStrong((id *)&self->_geminiLogger, 0);
  objc_storeStrong((id *)&self->_favoritesLogger, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_spotlightIndexingLogger, 0);

  objc_storeStrong((id *)&self->_contactsLogger, 0);
}

@end