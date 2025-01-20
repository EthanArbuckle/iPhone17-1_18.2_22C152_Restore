@interface BMIntentStream
- (BMIntentStream)init;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)deleteIntentsWithGroupIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteIntentsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)init;
@end

@implementation BMIntentStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FB88] streamIdentifierForStream:2];
}

- (BMIntentStream)init
{
  v10.receiver = self;
  v10.super_class = (Class)BMIntentStream;
  v2 = [(BMIntentStream *)&v10 init];
  if (v2)
  {
    v3 = BMRootLibraryBridge();
    v4 = [v3 App];
    v5 = [v4 Intent];
    uint64_t v6 = [v5 storeStreamWithLegacyClass:objc_opt_class()];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMIntentStream init]();
      }
    }
  }
  return v2;
}

- (id)publisherFromStartTime:(double)a3
{
  return [(BMStoreStream *)self->_storeStream publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:0 reversed:a6];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
}

- (id)publisher
{
  v3 = [BMDSLStreamPublisher alloc];
  v4 = [(BMIntentStream *)self identifier];
  v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:1 eventDataClass:objc_opt_class()];

  return v5;
}

- (id)source
{
  return [(BMStoreStream *)self->_storeStream source];
}

- (void)deleteIntentsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (!v8)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18E67D000, v9, OS_LOG_TYPE_INFO, "No itemIDs specified for deletion, returning early", buf, 2u);
    }
  }
  storeStream = self->_storeStream;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke;
  v24 = &unk_1E55D6E20;
  id v11 = v7;
  id v25 = v11;
  id v12 = v6;
  id v26 = v12;
  v27 = &v29;
  uint64_t v28 = v8;
  [(BMStoreStream *)storeStream pruneWithPredicateBlock:&v21];
  uint64_t v13 = v30[3];
  if (v13 == objc_msgSend(v12, "count", v21, v22, v23, v24))
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v12 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = v15;
      v16 = "Deleted all intents identifiers matching %lu specified";
      v17 = v14;
      uint32_t v18 = 12;
LABEL_10:
      _os_log_impl(&dword_18E67D000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
  }
  else
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v30[3];
      uint64_t v20 = [v12 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v34 = v19;
      __int16 v35 = 2048;
      uint64_t v36 = v20;
      v16 = "Deleted %ld intents matching %lu provided";
      v17 = v14;
      uint32_t v18 = 22;
      goto LABEL_10;
    }
  }

  _Block_object_dispose(&v29, 8);
}

uint64_t __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = v6;
  if (!v6)
  {
    objc_super v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  uint64_t v8 = [v6 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_3(v7);
    }
    goto LABEL_11;
  }
  objc_super v10 = [v7 eventBody];
  id v11 = [v10 bundleID];
  if (v11 || a1[4])
  {
    v3 = [v10 bundleID];
    if (([v3 isEqualToString:a1[4]] & 1) == 0) {
      goto LABEL_18;
    }
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
  }
  v14 = [v10 itemID];
  if (!v14)
  {

    if ((v12 & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v15 = (void *)a1[5];
  v16 = [v10 itemID];
  int v17 = [v15 containsObject:v16];

  if ((v12 & 1) == 0)
  {

    if (v17) {
      goto LABEL_23;
    }
LABEL_20:
    uint64_t v13 = 0;
    goto LABEL_21;
  }

  if ((v17 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_23:
  uint64_t v19 = __biome_log_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_2(v10, v19);
  }

  if (++*(void *)(*(void *)(a1[6] + 8) + 24) != a1[7])
  {
LABEL_11:
    uint64_t v13 = 1;
    goto LABEL_21;
  }
  uint64_t v20 = __biome_log_for_category();
  uint64_t v13 = 1;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_18E67D000, v20, OS_LOG_TYPE_INFO, "Deleted all requested identifiers, stopping early", v21, 2u);
  }

  *a3 = 1;
LABEL_21:

  return v13;
}

- (void)deleteIntentsWithGroupIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = (id)objc_opt_new();
  if ([v6 count])
  {
    storeStream = self->_storeStream;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke;
    v14[3] = &unk_1E55D6E48;
    uint64_t v15 = v7;
    id v9 = v6;
    id v16 = v9;
    int v17 = &v18;
    [(BMStoreStream *)storeStream pruneWithPredicateBlock:v14];
    objc_super v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(id)v19[5] count];
      uint64_t v12 = [v9 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v25 = v11;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_DEFAULT, "Deleted %lu intents matching %lu provided group identifiers", buf, 0x16u);
    }

    uint64_t v13 = v15;
  }
  else
  {
    uint64_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18E67D000, v13, OS_LOG_TYPE_INFO, "No groupIdentifiers specified for deletion, returning early", buf, 2u);
    }
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  if (!v4)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  id v6 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_3(v5);
    }
    goto LABEL_11;
  }
  uint64_t v8 = [v5 eventBody];
  id v9 = [v8 bundleID];
  if (v9 || a1[4])
  {
    v2 = [v8 bundleID];
    if (([v2 isEqualToString:a1[4]] & 1) == 0) {
      goto LABEL_18;
    }
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  uint64_t v12 = [v8 groupIdentifier];
  if (!v12)
  {

    if ((v10 & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v13 = (void *)a1[5];
  v14 = [v8 groupIdentifier];
  int v15 = [v13 containsObject:v14];

  if (v10)
  {

    if (v15) {
      goto LABEL_23;
    }
LABEL_20:
    uint64_t v11 = 0;
    goto LABEL_21;
  }

  if (!v15) {
    goto LABEL_20;
  }
LABEL_23:
  int v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke_cold_2(v8, v17);
  }

  uint64_t v18 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v19 = [v8 identifier];
  [v18 addObject:v19];

LABEL_11:
  uint64_t v11 = 1;
LABEL_21:

  return v11;
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_18E67D000, v0, OS_LOG_TYPE_FAULT, "Unable to initialize BMAppIntentStream, please consult error logs for cause", v1, 2u);
}

void __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "Unreadable store event, marking for deletion", v2, v3, v4, v5, v6);
}

void __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 itemID];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Intent matching itemID %@ found, marking for deletion", v4, 0xCu);
}

void __56__BMIntentStream_deleteIntentsWithIdentifiers_bundleID___block_invoke_cold_3(void *a1)
{
  [a1 timestamp];
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "Event in Intent stream of unexpected class timestamp %{public}f marking for deletion", v3, v4, v5, v6, 0);
}

void __61__BMIntentStream_deleteIntentsWithGroupIdentifiers_bundleID___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 groupIdentifier];
  uint64_t v5 = [a1 itemID];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Intent with matching groupIdentifier %@ found, marking for deletion event with ID: %@", (uint8_t *)&v6, 0x16u);
}

@end