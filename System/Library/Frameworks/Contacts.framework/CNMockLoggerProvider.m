@interface CNMockLoggerProvider
+ (id)loggerProvider;
- (CNAPITriageLogger)apiTriageLogger;
- (CNContactsLogger)contactsLogger;
- (CNFavoritesLogger)favoritesLogger;
- (CNGeminiLogger)geminiLogger;
- (CNImageUtilitiesLogger)imageUtilitiesLogger;
- (CNRegulatoryLogger)regulatoryLogger;
- (CNSpotlightIndexingLogger)spotlightIndexingLogger;
- (void)setApiTriageLogger:(id)a3;
- (void)setContactsLogger:(id)a3;
- (void)setFavoritesLogger:(id)a3;
- (void)setGeminiLogger:(id)a3;
- (void)setImageUtilitiesLogger:(id)a3;
- (void)setRegulatoryLogger:(id)a3;
- (void)setSpotlightIndexingLogger:(id)a3;
@end

@implementation CNMockLoggerProvider

+ (id)loggerProvider
{
  v2 = objc_alloc_init(CNMockLoggerProvider);
  v3 = objc_alloc_init(CNMockContactsLogger);
  [(CNMockLoggerProvider *)v2 setContactsLogger:v3];

  v4 = objc_alloc_init(CNMockSpotlightIndexingLogger);
  [(CNMockLoggerProvider *)v2 setSpotlightIndexingLogger:v4];

  v5 = objc_alloc_init(CNMockFavoritesLogger);
  [(CNMockLoggerProvider *)v2 setFavoritesLogger:v5];

  v6 = objc_alloc_init(CNMockGeminiLogger);
  [(CNMockLoggerProvider *)v2 setGeminiLogger:v6];

  v7 = objc_alloc_init(CNMockAPITriageLogger);
  [(CNMockLoggerProvider *)v2 setApiTriageLogger:v7];

  return v2;
}

- (CNContactsLogger)contactsLogger
{
  return self->_contactsLogger;
}

- (void)setContactsLogger:(id)a3
{
}

- (CNSpotlightIndexingLogger)spotlightIndexingLogger
{
  return self->_spotlightIndexingLogger;
}

- (void)setSpotlightIndexingLogger:(id)a3
{
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setRegulatoryLogger:(id)a3
{
}

- (CNFavoritesLogger)favoritesLogger
{
  return self->_favoritesLogger;
}

- (void)setFavoritesLogger:(id)a3
{
}

- (CNGeminiLogger)geminiLogger
{
  return self->_geminiLogger;
}

- (void)setGeminiLogger:(id)a3
{
}

- (CNAPITriageLogger)apiTriageLogger
{
  return self->_apiTriageLogger;
}

- (void)setApiTriageLogger:(id)a3
{
}

- (CNImageUtilitiesLogger)imageUtilitiesLogger
{
  return self->_imageUtilitiesLogger;
}

- (void)setImageUtilitiesLogger:(id)a3
{
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