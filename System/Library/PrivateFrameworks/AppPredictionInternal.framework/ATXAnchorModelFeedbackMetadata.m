@interface ATXAnchorModelFeedbackMetadata
+ (BOOL)supportsSecureCoding;
+ (id)anchorFeedbackMetadataFromArchivedData:(id)a3;
+ (id)archivedDataForAnchorFeedbackMetadata:(id)a3;
- (ATXAnchorModelFeedbackMetadata)initWithAnchorSuggestionTuples:(id)a3;
- (ATXAnchorModelFeedbackMetadata)initWithCoder:(id)a3;
- (ATXAnchorModelFeedbackMetadata)initWithSuggestionUUIDToAnchorPredictionMapping:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXAnchorModelFeedbackMetadata:(id)a3;
- (id)anchorModelPredictionForProactiveSuggestion:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfAnchorModelPredictions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXAnchorModelFeedbackMetadata

+ (id)archivedDataForAnchorFeedbackMetadata:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v10];
  id v6 = v10;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ATXAnchorModelFeedbackMetadata archivedDataForAnchorFeedbackMetadata:]();
    }
  }
  return v5;
}

+ (id)anchorFeedbackMetadataFromArchivedData:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = 0;
  v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
  id v6 = v10;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ATXAnchorModelFeedbackMetadata anchorFeedbackMetadataFromArchivedData:]();
    }
  }
  return v5;
}

- (ATXAnchorModelFeedbackMetadata)initWithAnchorSuggestionTuples:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ATXAnchorModelFeedbackMetadata_initWithAnchorSuggestionTuples___block_invoke;
  v9[3] = &unk_1E68B3FD0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  BOOL v7 = [(ATXAnchorModelFeedbackMetadata *)self initWithSuggestionUUIDToAnchorPredictionMapping:v6];
  return v7;
}

void __65__ATXAnchorModelFeedbackMetadata_initWithAnchorSuggestionTuples___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 first];
  id v4 = [v3 second];

  v5 = [v4 uuid];

  [*(id *)(a1 + 32) setObject:v6 forKey:v5];
}

- (ATXAnchorModelFeedbackMetadata)initWithSuggestionUUIDToAnchorPredictionMapping:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAnchorModelFeedbackMetadata;
  id v6 = [(ATXAnchorModelFeedbackMetadata *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggestionUUIDToAnchorPredictionMapping, a3);
  }

  return v7;
}

- (id)anchorModelPredictionForProactiveSuggestion:(id)a3
{
  if (a3)
  {
    id v4 = [a3 uuid];
    id v5 = [(NSMutableDictionary *)self->_suggestionUUIDToAnchorPredictionMapping objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (unint64_t)numberOfAnchorModelPredictions
{
  return [(NSMutableDictionary *)self->_suggestionUUIDToAnchorPredictionMapping count];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXAnchorModelFeedbackMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  id v10 = (void *)MEMORY[0x1E4F93B90];
  v11 = __atxlog_handle_anchor();
  v12 = [v10 robustDecodeObjectOfClasses:v9 forKey:@"mapping" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXAnchorModelFeedbackMetadata" errorCode:-1 logHandle:v11];

  v13 = [(ATXAnchorModelFeedbackMetadata *)self initWithSuggestionUUIDToAnchorPredictionMapping:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXAnchorModelFeedbackMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXAnchorModelFeedbackMetadata *)self isEqualToATXAnchorModelFeedbackMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXAnchorModelFeedbackMetadata:(id)a3
{
  id v4 = self->_suggestionUUIDToAnchorPredictionMapping;
  id v5 = v4;
  if (v4 == *((NSMutableDictionary **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableDictionary isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_suggestionUUIDToAnchorPredictionMapping allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) hash] - v5 + 32 * v5;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (void)archivedDataForAnchorFeedbackMetadata:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - could not archive metadata, error: %@", v4, v5, v6, v7, v8);
}

+ (void)anchorFeedbackMetadataFromArchivedData:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - could not unarchive metadata, error: %@", v4, v5, v6, v7, v8);
}

@end