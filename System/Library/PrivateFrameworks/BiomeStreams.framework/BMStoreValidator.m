@interface BMStoreValidator
- (BMStoreValidator)initWithIdentifier:(id)a3 storeConfig:(id)a4;
- (int)isChronologicallyValidFromBookmark:(id)a3 shouldContinue:(id)a4;
- (int)isChronologicallyValidFromTimestamp:(double)a3;
- (int)isChronologicallyValidFromTimestamp:(double)a3 shouldContinue:(id)a4;
- (int)isChronologicallyValidWithPublisher:(id)a3 shouldContinue:(id)a4;
@end

@implementation BMStoreValidator

- (BMStoreValidator)initWithIdentifier:(id)a3 storeConfig:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMStoreValidator;
  v9 = [(BMStoreValidator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = [[BPSBiomeStorePublisher alloc] initWithStreamId:v7 storeConfig:v8];
    publisher = v10->_publisher;
    v10->_publisher = v11;
  }
  return v10;
}

- (int)isChronologicallyValidFromTimestamp:(double)a3
{
  v3 = self;
  v4 = [(BPSBiomeStorePublisher *)self->_publisher withStartTime:a3];
  LODWORD(v3) = [(BMStoreValidator *)v3 isChronologicallyValidWithPublisher:v4 shouldContinue:&__block_literal_global_16];

  return (int)v3;
}

uint64_t __56__BMStoreValidator_isChronologicallyValidFromTimestamp___block_invoke()
{
  return 1;
}

- (int)isChronologicallyValidFromBookmark:(id)a3 shouldContinue:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    [(BPSBiomeStorePublisher *)self->_publisher applyBookmark:a3];
    int v7 = [(BMStoreValidator *)self isChronologicallyValidWithPublisher:self->_publisher shouldContinue:v6];
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMStoreValidator isChronologicallyValidFromBookmark:shouldContinue:]();
    }

    int v7 = 2;
  }

  return v7;
}

- (int)isChronologicallyValidFromTimestamp:(double)a3 shouldContinue:(id)a4
{
  v5 = self;
  publisher = self->_publisher;
  id v7 = a4;
  id v8 = [(BPSBiomeStorePublisher *)publisher withStartTime:a3];
  LODWORD(v5) = [(BMStoreValidator *)v5 isChronologicallyValidWithPublisher:v8 shouldContinue:v7];

  return (int)v5;
}

- (int)isChronologicallyValidWithPublisher:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_4;
    v13[3] = &unk_1E55D82B8;
    v15 = v17;
    v16 = &v18;
    v13[4] = self;
    id v14 = v7;
    id v9 = (id)[v6 sinkWithCompletion:&__block_literal_global_3 shouldContinue:v13];
    int v10 = *((_DWORD *)v19 + 6);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMStoreValidator isChronologicallyValidWithPublisher:shouldContinue:]();
    }

    int v10 = 2;
  }

  return v10;
}

void __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_cold_1(v2, v4);
    }
  }
}

uint64_t __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_4(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 timestamp];
  if (v4 < *(double *)(*(void *)(a1[6] + 8) + 24))
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = *(void *)(a1[4] + 8);
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24);
      v11 = [v3 segmentName];
      [v3 timestamp];
      uint64_t v13 = v12;
      double v14 = *(double *)(*(void *)(a1[6] + 8) + 24);
      [v3 timestamp];
      int v16 = 138413314;
      uint64_t v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      int v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      double v25 = v14 - v15;
      _os_log_fault_impl(&dword_18E67D000, v5, OS_LOG_TYPE_FAULT, "found unchronological events for stream - %@, last timestamp:%f, current event segment:%@ timestamp:%f diff:%f", (uint8_t *)&v16, 0x34u);
    }
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  [v3 timestamp];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v6;
  uint64_t v7 = (*(uint64_t (**)(void))(a1[5] + 16))();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)isChronologicallyValidFromBookmark:shouldContinue:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v2, v3, "%@: cannot create enumerator from nil bookmark for stream: %@, giving up .", v4, v5, v6, v7, v8);
}

- (void)isChronologicallyValidWithPublisher:shouldContinue:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v2, v3, "%@: failed to create stream publisher for stream %@, giving up.", v4, v5, v6, v7, v8);
}

void __71__BMStoreValidator_isChronologicallyValidWithPublisher_shouldContinue___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Error reading from stream during chronological validation: %@", (uint8_t *)&v4, 0xCu);
}

@end