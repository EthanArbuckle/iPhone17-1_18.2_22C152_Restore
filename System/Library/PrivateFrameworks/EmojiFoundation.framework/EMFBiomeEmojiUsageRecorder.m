@interface EMFBiomeEmojiUsageRecorder
- (BMSource)biomeStream;
- (BOOL)report;
- (BOOL)wasPositiveEngagement;
- (EMFBiomeEmojiUsageRecorder)initWithEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9;
- (NSLocale)locale;
- (NSNumber)numberSearchQueriesRun;
- (NSNumber)resultPosition;
- (NSString)localeIdentifier;
- (NSString)replacementContext;
- (NSString)searchQuery;
- (id)_createEngagementEvent;
- (id)delegate;
- (id)recordingKey;
- (unint64_t)usageSource;
- (void)_createEngagementEvent;
- (void)report;
- (void)setBiomeStream:(id)a3;
@end

@implementation EMFBiomeEmojiUsageRecorder

- (EMFBiomeEmojiUsageRecorder)initWithEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v41.receiver = self;
  v41.super_class = (Class)EMFBiomeEmojiUsageRecorder;
  v20 = [(EMFDPRecorder *)&v41 initWithEmoji:v15];
  if (v20)
  {
    v21 = [v15 localeData];
    v22 = [v21 localeIdentifier];
    uint64_t v23 = [v22 copy];
    localeIdentifier = v20->_localeIdentifier;
    v20->_localeIdentifier = (NSString *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v20->_localeIdentifier];
    locale = v20->_locale;
    v20->_locale = (NSLocale *)v25;

    v20->_usageSource = a4;
    uint64_t v27 = [v16 copy];
    replacementContext = v20->_replacementContext;
    v20->_replacementContext = (NSString *)v27;

    uint64_t v29 = [v17 copy];
    searchQuery = v20->_searchQuery;
    v20->_searchQuery = (NSString *)v29;

    uint64_t v31 = [v18 copy];
    resultPosition = v20->_resultPosition;
    v20->_resultPosition = (NSNumber *)v31;

    uint64_t v33 = [v19 copy];
    numberSearchQueriesRun = v20->_numberSearchQueriesRun;
    v20->_numberSearchQueriesRun = (NSNumber *)v33;

    v20->_wasPositiveEngagement = a9;
    v35 = BiomeLibrary();
    v36 = [v35 Emoji];
    v37 = [v36 Engagement];
    uint64_t v38 = [v37 source];
    biomeStream = v20->_biomeStream;
    v20->_biomeStream = (BMSource *)v38;
  }
  return v20;
}

- (id)recordingKey
{
  return @"Emoji.Engagement";
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)EMFBiomeEmojiUsageRecorder;
  v2 = [(EMFDPRecorder *)&v4 delegate];
  return v2;
}

- (BOOL)report
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v3 = [(EMFBiomeEmojiUsageRecorder *)self localeIdentifier];

  if (v3)
  {
    objc_super v4 = [(EMFBiomeEmojiUsageRecorder *)self biomeStream];

    if (!v4)
    {
      v5 = emf_logging_get_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[EMFBiomeEmojiUsageRecorder report](v5);
      }
      BOOL v6 = 0;
      goto LABEL_16;
    }
    v5 = [(EMFBiomeEmojiUsageRecorder *)self _createEngagementEvent];
    BOOL v6 = v5 != 0;
    v7 = emf_logging_get_default_log();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(EMFBiomeEmojiUsageRecorder *)v5 report];
      }

      v9 = [(EMFBiomeEmojiUsageRecorder *)self biomeStream];
      [v9 sendEvent:v5];

      v10 = [(EMFBiomeEmojiUsageRecorder *)self delegate];

      if (!v10)
      {
        BOOL v6 = 1;
        goto LABEL_16;
      }
      v8 = [(EMFBiomeEmojiUsageRecorder *)self delegate];
      v11 = [v5 emoji];
      v14[0] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v8 record:v12];
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(EMFBiomeEmojiUsageRecorder *)self report];
    }

LABEL_16:
    return v6;
  }
  return 0;
}

- (id)_createEngagementEvent
{
  v3 = [(EMFDPRecorder *)self emoji];
  objc_super v4 = [v3 string];

  if (v4)
  {
    v5 = 0;
    uint64_t v6 = 1;
    switch([(EMFBiomeEmojiUsageRecorder *)self usageSource])
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_15;
      case 2uLL:
        uint64_t v6 = 2;
        goto LABEL_15;
      case 3uLL:
        uint64_t v6 = 3;
        goto LABEL_15;
      case 4uLL:
        uint64_t v6 = 4;
        goto LABEL_15;
      case 5uLL:
        uint64_t v6 = 5;
        goto LABEL_15;
      case 6uLL:
        uint64_t v6 = 6;
        goto LABEL_15;
      case 7uLL:
        uint64_t v6 = 7;
        goto LABEL_15;
      case 8uLL:
        uint64_t v6 = 8;
        goto LABEL_15;
      case 9uLL:
        uint64_t v6 = 9;
        goto LABEL_15;
      case 10uLL:
        uint64_t v6 = 10;
LABEL_15:
        id v8 = objc_alloc(MEMORY[0x1E4F4FE18]);
        v9 = objc_msgSend(NSNumber, "numberWithBool:", -[EMFBiomeEmojiUsageRecorder wasPositiveEngagement](self, "wasPositiveEngagement"));
        v10 = [(EMFBiomeEmojiUsageRecorder *)self localeIdentifier];
        v11 = [(EMFBiomeEmojiUsageRecorder *)self replacementContext];
        v12 = [(EMFBiomeEmojiUsageRecorder *)self resultPosition];
        v13 = [(EMFBiomeEmojiUsageRecorder *)self numberSearchQueriesRun];
        v14 = [(EMFBiomeEmojiUsageRecorder *)self searchQuery];
        v5 = (void *)[v8 initWithEmoji:v4 wasPositiveEngagement:v9 localeIdentifier:v10 inputMode:v6 replacementContext:v11 resultPosition:v12 numberSearchQueriesRun:v13 finalSearchQuery:v14];

        break;
      default:
        -[EMFBiomeEmojiUsageRecorder _createEngagementEvent]();
    }
  }
  else
  {
    v7 = emf_logging_get_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(EMFBiomeEmojiUsageRecorder *)self _createEngagementEvent];
    }

    v5 = 0;
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (unint64_t)usageSource
{
  return self->_usageSource;
}

- (NSString)replacementContext
{
  return self->_replacementContext;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (NSNumber)resultPosition
{
  return self->_resultPosition;
}

- (NSNumber)numberSearchQueriesRun
{
  return self->_numberSearchQueriesRun;
}

- (BOOL)wasPositiveEngagement
{
  return self->_wasPositiveEngagement;
}

- (BMSource)biomeStream
{
  return (BMSource *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBiomeStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStream, 0);
  objc_storeStrong((id *)&self->_numberSearchQueriesRun, 0);
  objc_storeStrong((id *)&self->_resultPosition, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_replacementContext, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)report
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 emoji];
  objc_super v4 = [v3 string];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_ERROR, "Failed to donate emoji engagement to Biome: '%{public}@'", (uint8_t *)&v5, 0xCu);
}

- (void)_createEngagementEvent
{
}

@end