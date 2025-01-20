@interface CDDataCollection
@end

@implementation CDDataCollection

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_3();
  }

  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__29;
  v20[3] = __Block_byref_object_dispose__29;
  id v21 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  id v7 = v5;
  uint64_t v8 = OSAWriteLogForSubmission();
  v9 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [NSNumber numberWithBool:v8];
    __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_2(v10, buf, v9);
  }

  if (*(void *)(v20[0] + 40))
  {
    v11 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_1((uint64_t)v20, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  _Block_object_dispose(&v19, 8);
}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  [a2 writeData:v2 error:&obj];
  objc_storeStrong(v3, obj);
}

uint64_t __29___CDDataCollection__execute__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Submission Success %@", buf, 0xCu);
}

void __137___CDDataCollection_initWithStorage_activity_sessionPath_dataDirectory_collectionDate_samplingRate_daysPerBatch_eventStreams_maxBatches___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Submitting compressed json to crash reporter", v2, v3, v4, v5, v6);
}

@end