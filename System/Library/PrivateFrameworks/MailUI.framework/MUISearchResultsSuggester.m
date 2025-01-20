@interface MUISearchResultsSuggester
+ (NSArray)dateAttributes;
+ (NSString)dateQueryString;
+ (OS_os_log)log;
+ (id)dateForSuggestionResult:(id)a3;
+ (id)documentsSuggesterWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5;
+ (id)linksSuggesterWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5;
+ (id)suggestionResultsSortedByDate:(id)a3;
- (BOOL)shouldQueryForAsYouType;
- (MUISearchResultsSuggester)initWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5 configuration:(id)a6;
- (NSArray)categories;
- (NSString)logIdentifier;
- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4;
@end

@implementation MUISearchResultsSuggester

+ (id)documentsSuggesterWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(_MUISearchResultsSuggesterDocumentsConfiguration);
  v12 = (void *)[objc_alloc((Class)a1) initWithBundleID:v10 messageRepository:v9 senderQueryManager:v8 configuration:v11];

  return v12;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MUISearchResultsSuggester_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1) {
    dispatch_once(&log_onceToken_11, block);
  }
  v2 = (void *)log_log_11;
  return (OS_os_log *)v2;
}

void __32__MUISearchResultsSuggester_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;
}

- (MUISearchResultsSuggester)initWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5 configuration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MUISearchResultsSuggester;
  v15 = [(MUISearchResultsSuggester *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleID, a3);
    objc_storeStrong((id *)&v16->_messageRepository, a4);
    objc_storeStrong((id *)&v16->_senderQueryManager, a5);
    objc_storeStrong((id *)&v16->_configuration, a6);
  }

  return v16;
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 phraseKind])
  {
    id v8 = -[MUIResultSuggestionQuery initWithPhraseManager:handler:suggester:]((id *)[MUIResultSuggestionQuery alloc], v6, v7, self);
    id v9 = v8;
    if (v8) {
      [v8[7] start];
    }
  }
  else
  {
    id v10 = +[MUISearchResultsSuggester log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MUISearchResultsSuggester generateSuggestionsUsingPhraseManager:handler:](v10);
    }

    id v9 = 0;
  }

  return v9;
}

- (BOOL)shouldQueryForAsYouType
{
  return 0;
}

- (NSString)logIdentifier
{
  if (self) {
    self = (MUISearchResultsSuggester *)self->_configuration;
  }
  return [(MUISearchResultsSuggester *)self logIdentifier];
}

- (NSArray)categories
{
  if (self) {
    self = (MUISearchResultsSuggester *)self->_configuration;
  }
  return [(MUISearchResultsSuggester *)self categories];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_senderQueryManager, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (NSArray)dateAttributes
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F236C8];
  v6[0] = *MEMORY[0x1E4F23700];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22C38];
  v6[2] = *MEMORY[0x1E4F236D0];
  v6[3] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  return (NSArray *)v4;
}

+ (NSString)dateQueryString
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [v2 dateByAddingTimeInterval:-1209600.0];
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;

  id v6 = +[MUISearchResultsSuggester dateAttributes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MUISearchResultsSuggester_Date__dateQueryString__block_invoke;
  v10[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v10[4] = v5;
  id v7 = objc_msgSend(v6, "ef_map:", v10);
  id v8 = [v7 componentsJoinedByString:@" || "];

  return (NSString *)v8;
}

uint64_t __50__MUISearchResultsSuggester_Date__dateQueryString__block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@ > %f", a2, *(void *)(a1 + 32)];
}

+ (id)dateForSuggestionResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 searchableItem];
  uint64_t v5 = [v4 attributeSet];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v6 = +[MUISearchResultsSuggester dateAttributes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__MUISearchResultsSuggester_Date__dateForSuggestionResult___block_invoke;
  v10[3] = &unk_1E6D13420;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __59__MUISearchResultsSuggester_Date__dateForSuggestionResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v12 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) attributeForKey:v3];
    if (([v12 isEqualToString:*MEMORY[0x1E4F236C8]] & 1) != 0
      || [v12 isEqualToString:*MEMORY[0x1E4F236D0]])
    {
      uint64_t v6 = [v5 firstObject];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = v5;
      id v8 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v10;
    }

    id v4 = v12;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (id)suggestionResultsSortedByDate:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_partition:", &__block_literal_global_32);
  id v4 = [v3 second];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = +[MUISearchResultsSuggester log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MUISearchResultsSuggester(Date) suggestionResultsSortedByDate:](v3);
    }
  }
  uint64_t v7 = [v3 first];
  id v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_116];

  return v8;
}

BOOL __65__MUISearchResultsSuggester_Date__suggestionResultsSortedByDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[MUISearchResultsSuggester dateForSuggestionResult:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __65__MUISearchResultsSuggester_Date__suggestionResultsSortedByDate___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = +[MUISearchResultsSuggester dateForSuggestionResult:v4];
  uint64_t v7 = +[MUISearchResultsSuggester dateForSuggestionResult:v5];
  uint64_t v8 = [v7 compare:v6];
  if (!v8)
  {
    uint64_t v9 = [v5 searchableItem];
    id v10 = [v9 uniqueIdentifier];
    id v11 = [v4 searchableItem];
    id v12 = [v11 uniqueIdentifier];
    uint64_t v8 = [v10 compare:v12];
  }
  return v8;
}

+ (id)linksSuggesterWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(_MUISearchResultsSuggesterRichLinksConfiguration);
  id v12 = (void *)[objc_alloc((Class)a1) initWithBundleID:v10 messageRepository:v9 senderQueryManager:v8 configuration:v11];

  return v12;
}

- (void)generateSuggestionsUsingPhraseManager:(os_log_t)log handler:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_DEBUG, "Rich results not generated for AYT search", v1, 2u);
}

@end