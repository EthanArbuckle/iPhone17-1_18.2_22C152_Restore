@interface ATXDataStore
@end

@implementation ATXDataStore

uint64_t __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __36___ATXDataStore_appInfoForBundleId___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _appInfoForBundleIdNoSync:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

void __58___ATXDataStore_updateOrInsertHistogramData_forHistogram___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":histogram_type" toInt64:v3];
  [v4 bindNamedParam:":histogram_data" toNSData:*(void *)(a1 + 32)];
}

void __69___ATXDataStore_updateOrInsertCategoricalHistogramData_forHistogram___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":histogram_type" toInt64:v3];
  [v4 bindNamedParam:":histogram_data" toNSData:*(void *)(a1 + 32)];
}

uint64_t __26___ATXDataStore__doAsync___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  pthread_mutex_lock(&_doAsync__txnLock);
  if (!--_doAsync__txnCount)
  {
    uint64_t v3 = (void *)_doAsync__txn;
    _doAsync__txn = 0;
  }
  return pthread_mutex_unlock(&_doAsync__txnLock);
}

uint64_t __64___ATXDataStore_addCategoricalHistogramData_forHistogramOfType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertCategoricalHistogramData:*(void *)(a1 + 40) forHistogram:*(void *)(a1 + 48)];
}

uint64_t __53___ATXDataStore_addHistogramData_forHistogramOfType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertHistogramData:*(void *)(a1 + 40) forHistogram:*(void *)(a1 + 48)];
}

uint64_t __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumn:0];
  if (v4)
  {
    v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v4];
  }
  else
  {
    v23 = 0;
  }
  uint64_t v5 = [v3 getInt64ForColumn:1];
  if (v5)
  {
    v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v5];
  }
  else
  {
    v22 = 0;
  }
  uint64_t v6 = [v3 getInt64ForColumn:2];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v6];
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 3));
  v9 = [v3 getNSDataForColumn:4];
  v10 = decodeSubGenresData(v9);

  uint64_t v11 = [v3 getInt64ForColumn:5];
  uint64_t v12 = [v3 getInt64ForColumn:6];
  if ([v3 isColumnNull:6])
  {
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected NULL isEnterpriseApp for bundleId: %@", buf, 0xCu);
    }
  }
  v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 7));
  if ([v3 isColumnNull:8])
  {
    v16 = 0;
  }
  else
  {
    v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 8));
  }
  if ([v3 isColumnNull:9])
  {
    v17 = 0;
  }
  else
  {
    v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 9));
  }
  v18 = [[_ATXAppInfo alloc] initWithBundleId:*(void *)(a1 + 32) isExtension:v11 != 0 isEnterpriseApp:v12 != 0 installDate:v23 lastLaunch:v22 lastSpotlightLaunch:v7 averageSecondsBetweenLaunches:v16 medianSecondsBetweenLaunches:v17 genreId:v8 subGenreIds:v10 app2VecCluster:v15];
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  return *MEMORY[0x1E4F93C10];
}

void __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_2;
  v3[3] = &unk_1E68AD1B0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 prepAndRunQuery:@"INSERT INTO intentCache (cacheKey, bundleId, paramCombinationsWithSchema) VALUES (:cache_key, :bundle_id, :param_combinations) ON CONFLICT(cacheKey) DO UPDATE SET paramCombinationsWithSchema=excluded.paramCombinationsWithSchema", v3, 0, &__block_literal_global_31 onPrep onRow onError];
}

void __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 stringRepresentationForSerialization];
  [v6 bindNamedParam:":cache_key" toNSString:v4];

  id v5 = [*(id *)(a1 + 32) bundleId];
  [v6 bindNamedParam:":bundle_id" toNSString:v5];

  [v6 bindNamedParam:":param_combinations" toNSData:*(void *)(a1 + 40)];
}

uint64_t __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_3()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_3_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT paramCombinationsWithSchema FROM intentCache WHERE cacheKey = :cache_key LIMIT 1" onPrep:v4 onRow:v3 onError:&__block_literal_global_24];
}

void __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stringRepresentationForSerialization];
  [v3 bindNamedParam:":cache_key" toNSString:v4];
}

uint64_t __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_4()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_4_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_2;
  v3[3] = &unk_1E68AD498;
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 prepAndRunQuery:@"INSERT INTO intentCache (cacheKey, bundleId, backgroundExecution) VALUES (:cache_key, :bundle_id, :background_execution) ON CONFLICT(cacheKey) DO UPDATE SET backgroundExecution=excluded.backgroundExecution", v3, 0, &__block_literal_global_35_0 onPrep onRow onError];
}

void __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 stringRepresentationForSerialization];
  [v6 bindNamedParam:":cache_key" toNSString:v4];

  char v5 = [*(id *)(a1 + 32) bundleId];
  [v6 bindNamedParam:":bundle_id" toNSString:v5];

  [v6 bindNamedParam:":background_execution" toInteger:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_3()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_3_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT backgroundExecution FROM intentCache WHERE cacheKey = :cache_key LIMIT 1" onPrep:v4 onRow:v3 onError:&__block_literal_global_40_0];
}

void __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stringRepresentationForSerialization];
  [v3 bindNamedParam:":cache_key" toNSString:v4];
}

uint64_t __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getInt64AsNSNumberForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_4()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_4_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_2;
  v3[3] = &unk_1E68AD1B0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 prepAndRunQuery:@"INSERT INTO intentCache (cacheKey, bundleId, title) VALUES (:cache_key, :bundle_id, :title) ON CONFLICT(cacheKey) DO UPDATE SET title=excluded.title", v3, 0, &__block_literal_global_49 onPrep onRow onError];
}

void __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  id v4 = [v3 stringRepresentationForSerialization];
  [v7 bindNamedParam:":cache_key" toNSString:v4];

  id v5 = [*(id *)(a1 + 32) bundleId];
  [v7 bindNamedParam:":bundle_id" toNSString:v5];

  if (*(void *)(a1 + 40)) {
    id v6 = *(__CFString **)(a1 + 40);
  }
  else {
    id v6 = &stru_1F2740B58;
  }
  [v7 bindNamedParam:":title" toNSString:v6];
}

uint64_t __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_3()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_3_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT title FROM intentCache WHERE cacheKey = :cache_key LIMIT 1" onPrep:v4 onRow:v3 onError:&__block_literal_global_54_0];
}

void __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stringRepresentationForSerialization];
  [v3 bindNamedParam:":cache_key" toNSString:v4];
}

uint64_t __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_4()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_4_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_2;
  v3[3] = &unk_1E68AD1B0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 prepAndRunQuery:@"INSERT INTO intentCache (cacheKey, bundleId, subtitle) VALUES (:cache_key, :bundle_id, :subtitle) ON CONFLICT(cacheKey) DO UPDATE SET subtitle=excluded.subtitle", v3, 0, &__block_literal_global_60_0 onPrep onRow onError];
}

void __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 stringRepresentationForSerialization];
  [v6 bindNamedParam:":cache_key" toNSString:v4];

  id v5 = [*(id *)(a1 + 32) bundleId];
  [v6 bindNamedParam:":bundle_id" toNSString:v5];

  [v6 bindNamedParam:":subtitle" toNSString:*(void *)(a1 + 40)];
}

uint64_t __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_3()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_3_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT subtitle FROM intentCache WHERE cacheKey = :cache_key LIMIT 1" onPrep:v4 onRow:v3 onError:&__block_literal_global_65_0];
}

void __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stringRepresentationForSerialization];
  [v3 bindNamedParam:":cache_key" toNSString:v4];
}

uint64_t __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_4()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_4_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_2;
  v3[3] = &unk_1E68AD498;
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 prepAndRunQuery:@"INSERT INTO intentCache (cacheKey, bundleId, eligibleForWidgets) VALUES (:cache_key, :bundle_id, :eligible_for_widgets) ON CONFLICT(cacheKey) DO UPDATE SET eligibleForWidgets=excluded.eligibleForWidgets", v3, 0, &__block_literal_global_71 onPrep onRow onError];
}

void __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 stringRepresentationForSerialization];
  [v6 bindNamedParam:":cache_key" toNSString:v4];

  char v5 = [*(id *)(a1 + 32) bundleId];
  [v6 bindNamedParam:":bundle_id" toNSString:v5];

  [v6 bindNamedParam:":eligible_for_widgets" toInteger:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_3()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_3_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT eligibleForWidgets FROM intentCache WHERE cacheKey = :cache_key LIMIT 1" onPrep:v4 onRow:v3 onError:&__block_literal_global_76];
}

void __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stringRepresentationForSerialization];
  [v3 bindNamedParam:":cache_key" toNSString:v4];
}

uint64_t __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getInt64AsNSNumberForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_4()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_4_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_2;
  v3[3] = &unk_1E68AD200;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM intentCache WHERE bundleId = :bundle_id" onPrep:v3 onRow:0 onError:&__block_literal_global_81];
}

uint64_t __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bundle_id" toNSString:*(void *)(a1 + 32)];
}

uint64_t __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_3()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_3_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) db];
  [v1 prepAndRunQuery:@"DELETE FROM intentCache" onPrep:0 onRow:0 onError:&__block_literal_global_86_0];
}

uint64_t __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke_2()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke_2_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT webClipBundleId FROM webClipForAppClip WHERE appClipBundleId = :appClipBundleId" onPrep:v4 onRow:v3 onError:&__block_literal_global_42];
}

uint64_t __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":appClipBundleId" toNSString:*(void *)(a1 + 32)];
}

uint64_t __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_4()
{
  v0 = __atxlog_handle_hero();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_4_cold_1(v0);
  }

  return *MEMORY[0x1E4F93C10];
}

void __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_2;
  v3[3] = &unk_1E68AD1B0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 prepAndRunQuery:@"INSERT INTO webClipForAppClip (webClipBundleId, appClipBundleId)VALUES (:webClipBundleId, :appClipBundleId)ON CONFLICT(webClipBundleId) DO UPDATE SET appClipBundleId=excluded.appClipBundleId", v3, 0, &__block_literal_global_23 onPrep onRow onError];
}

void __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":webClipBundleId" toNSString:v3];
  [v4 bindNamedParam:":appClipBundleId" toNSString:*(void *)(a1 + 40)];
}

uint64_t __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_3()
{
  v0 = __atxlog_handle_hero();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_3_cold_1(v0);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __31___ATXDataStore_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_instance;
  sharedInstance_instance = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __43___ATXDataStore_removeFeedbackForBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeFeedbackForBundleId:*(void *)(a1 + 40)];
}

uint64_t __34___ATXDataStore_removeAllFeedback__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___ATXDataStore_removeAllFeedback__block_invoke_2;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"DELETE FROM app" onPrep:0 onRow:0 onError:v4];
}

uint64_t __34___ATXDataStore_removeAllFeedback__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke_2;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"DELETE FROM predictionFeedbackInfo" onPrep:0 onRow:0 onError:v4];
}

uint64_t __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"DELETE FROM messageRecipients WHERE lastDateMessaged<?" onPrep:v4 onRow:0 onError:v3];
}

void __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindParam:1 toInt64:(uint64_t)v3];
}

uint64_t __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __44___ATXDataStore__removeFeedbackForBundleId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __44___ATXDataStore__removeFeedbackForBundleId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_2;
  aBlock[3] = &unk_1E68B0CF8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v8 = v2;
  uint64_t v9 = v3;
  char v12 = *(unsigned char *)(a1 + 64);
  id v10 = v4;
  id v11 = *(id *)(a1 + 56);
  id v5 = _Block_copy(aBlock);
  id v6 = *(void **)(*(void *)(a1 + 40) + 48);
  if (*(unsigned char *)(a1 + 64)) {
    [v6 readTransaction:v5];
  }
  else {
    [v6 writeTransaction:v5];
  }
}

void __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = *(void **)(*(void *)(a1 + 40) + 48);
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_3;
    v70[3] = &unk_1E68AE948;
    id v5 = v3;
    id v71 = v5;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_4;
    v69[3] = &unk_1E68AD250;
    v69[4] = *(void *)(a1 + 40);
    [v4 prepAndRunQuery:@"SELECT bundleId FROM app" onPrep:0 onRow:v70 onError:v69];
    id v2 = v5;
  }
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  int v68 = 32;
  uint64_t v63 = 0;
  v64 = (int *)&v63;
  uint64_t v65 = 0x2020000000;
  int v66 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v62 = 0;
  v62 = malloc_type_calloc(0x18uLL, 0x20uLL, 0x78E31E6BuLL);
  id v6 = *(void **)(*(void *)(a1 + 40) + 48);
  v57[4] = *(void *)(a1 + 40);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_5;
  v58[3] = &unk_1E68AEF30;
  v58[4] = &v63;
  v58[5] = v67;
  v58[6] = &v59;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_6;
  v57[3] = &unk_1E68AD250;
  [v6 prepAndRunQuery:@"SELECT bundleId, data FROM app ORDER BY bundleId", 0, v58, v57 onPrep onRow onError];
  int v7 = [v2 count];
  v34 = malloc_type_calloc(v7, 0x10uLL, 0x1000040451B5BE8uLL);
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v34;
    do
    {
      id v10 = (void *)MEMORY[0x1D25F6CC0]();
      void *v9 = 0;
      v9[1] = 0;
      uint64_t __key = 0;
      p_key = 0;
      uint64_t v52 = 0;
      id v11 = [v2 objectAtIndexedSubscript:v8];
      uint64_t __key = [v11 UTF8String];
      p_key = 0;
      uint64_t v52 = 0;

      char v12 = (char *)bsearch_b(&__key, (const void *)v60[3], v64[6], 0x18uLL, &__block_literal_global_196_0);
      if (v12) {
        *(_OWORD *)uint64_t v9 = *(_OWORD *)(v12 + 8);
      }
      ++v8;
      v9 += 2;
    }
    while (v7 != v8);
  }
  if (v64[6] >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    do
    {
      free(*(void **)(v60[3] + v13));
      ++v14;
      v13 += 24;
    }
    while (v14 < v64[6]);
  }
  free((void *)v60[3]);
  uint64_t __key = 0;
  p_key = &__key;
  uint64_t v52 = 0x3810000000;
  v53 = &unk_1D14E1507;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  v15 = *(void **)(*(void *)(a1 + 40) + 48);
  v48[4] = *(void *)(a1 + 40);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_8;
  v49[3] = &unk_1E68AD228;
  v49[4] = &__key;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_9;
  v48[3] = &unk_1E68AD250;
  [v15 prepAndRunQuery:@"SELECT data FROM meta LIMIT 1" onPrep:0 onRow:v49 onError:v48];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t *))(v16 + 16))(v16, p_key + 4);
    }
    if (v7 >= 1)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v7;
      uint64_t v19 = v34;
      do
      {
        v20 = (void *)MEMORY[0x1D25F6CC0](v16);
        uint64_t v21 = *(void *)(a1 + 56);
        if (v21)
        {
          v22 = [v2 objectAtIndexedSubscript:v17];
          (*(void (**)(uint64_t, void *, void *))(v21 + 16))(v21, v22, v19);
        }
        ++v17;
        v19 += 2;
      }
      while (v18 != v17);
    }
  }
  else
  {
    v23 = p_key;
    long long v46 = *((_OWORD *)p_key + 2);
    uint64_t v47 = p_key[6];
    uint64_t v24 = *(void *)(a1 + 48);
    if (v24)
    {
      (*(void (**)(uint64_t, long long *))(v24 + 16))(v24, &v46);
      v23 = p_key;
    }
    uint64_t v25 = v23[4];
    uint64_t v26 = v23[5];
    uint64_t v27 = v23[6];
    if (v25 != (void)v46 || v26 != *((void *)&v46 + 1) || v27 != v47)
    {
      v30 = *(void **)(*(void *)(a1 + 40) + 48);
      v42[4] = *(void *)(a1 + 40);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_10;
      v43[3] = &__block_descriptor_56_e29_v16__0___PASSqliteStatement_8l;
      long long v44 = v46;
      uint64_t v45 = v47;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_11;
      v42[3] = &unk_1E68AD250;
      [v30 prepAndRunQuery:@"INSERT OR REPLACE INTO meta (id, data, version) VALUES (1, ?, (SELECT version FROM meta WHERE id = 1))", v43, 0, v42 onPrep onRow onError];
    }
    v31 = *(void **)(*(void *)(a1 + 40) + 48);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_12;
    v36[3] = &unk_1E68B0CD0;
    int v41 = v7;
    v40 = v34;
    id v39 = *(id *)(a1 + 56);
    id v32 = v2;
    uint64_t v33 = *(void *)(a1 + 40);
    id v37 = v32;
    uint64_t v38 = v33;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_13;
    v35[3] = &unk_1E68AD250;
    v35[4] = v33;
    [v31 prepQuery:@"INSERT OR REPLACE INTO app (bundleId, data) VALUES (?, ?)", v36, v35 onPrep onError];
  }
  free(v34);
  _Block_object_dispose(&__key, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 getNSStringForColumn:0];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_5(void *a1, id a2)
{
  id v3 = a2;
  id v4 = sqlite3_column_text((sqlite3_stmt *)[v3 stmt], 0);
  id v5 = v3;
  id v6 = (sqlite3_stmt *)[v5 stmt];

  int v7 = sqlite3_column_blob(v6, 1);
  if (v4)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      int v9 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
      uint64_t v10 = *(void *)(a1[5] + 8);
      if (v9 == *(_DWORD *)(v10 + 24))
      {
        *(_DWORD *)(v10 + 24) = 2 * v9;
        *(void *)(*(void *)(a1[6] + 8) + 24) = reallocf(*(void **)(*(void *)(a1[6] + 8) + 24), 24 * *(int *)(*(void *)(a1[5] + 8) + 24));
        int v9 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
      }
      *(_OWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 24 * v9 + 8) = *v8;
      *(void *)(*(void *)(*(void *)(a1[6] + 8) + 24)
                + 24 * (int)(*(_DWORD *)(*(void *)(a1[4] + 8) + 24))++) = strdup((const char *)v4);
    }
  }
  return *MEMORY[0x1E4F93C08];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_7(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_8(uint64_t a1, id a2)
{
  id v3 = sqlite3_column_blob((sqlite3_stmt *)[a2 stmt], 0);
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v5 = *(_OWORD *)v3;
    *(void *)(v4 + 48) = v3[2];
    *(_OWORD *)(v4 + 32) = v5;
  }
  return *MEMORY[0x1E4F93C10];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_10(uint64_t a1, id a2)
{
  id v3 = (sqlite3_stmt *)[a2 stmt];
  return sqlite3_bind_blob(v3, 1, (const void *)(a1 + 32), 24, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v15 = 0uLL;
  if (*(int *)(a1 + 64) >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      long long v15 = *(_OWORD *)(v6 + v4);
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
        (*(void (**)(uint64_t, void *, long long *))(v7 + 16))(v7, v8, &v15);

        uint64_t v6 = *(void *)(a1 + 56);
      }
      int v9 = (uint64_t *)(v6 + v4);
      uint64_t v11 = *v9;
      uint64_t v10 = v9[1];
      if ((void)v15 != v11 || *((void *)&v15 + 1) != v10)
      {
        uint64_t v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
        [v3 bindParam:1 toNSString:v13];

        id v14 = v3;
        sqlite3_bind_blob((sqlite3_stmt *)[v14 stmt], 2, &v15, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        [*(id *)(*(void *)(a1 + 40) + 48) runQuery:v14 onRow:0];
        sqlite3_reset((sqlite3_stmt *)[v14 stmt]);
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < *(int *)(a1 + 64));
  }
}

uint64_t __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __44___ATXDataStore_vacuumDatabaseWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    return [v1 didDefer] ^ 1;
  }
  else {
    return 1;
  }
}

uint64_t __82___ATXDataStore_addAppInstallForBundleId_date_genreId_subGenreIds_app2VecCluster___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[ATXLaunchServicesHelper bundleIsExtension:*(void *)(a1 + 32)];
  char v3 = [MEMORY[0x1E4F4AF00] isEnterpriseAppForBundle:*(void *)(a1 + 32)];
  uint64_t v4 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Attempting to write install date for %@ with date: %{public}@", buf, 0x16u);
  }

  uint64_t v7 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  LOBYTE(v10) = v3;
  return [v7 updateOrInsertInstallTimestamp:(uint64_t)v8 genreId:*(void *)(a1 + 56) subGenreIds:*(void *)(a1 + 64) app2VecCluster:*(void *)(a1 + 72) forBundleId:*(void *)(a1 + 32) isExtension:v2 isEnterpriseApp:v10];
}

void __61___ATXDataStore_addAppLaunchForBundleId_date_withLaunchType___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v4 = (uint64_t)v3;
  dateColumnNameForLaunchType(*(void *)(a1 + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateOrInsertTimestamp:v4 intoColumn:v5 forBundleId:*(void *)(a1 + 48) isExtension:0];
}

uint64_t __53___ATXDataStore_addAppActionLaunchForAppAction_date___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 updateOrInsertTimestamp:(uint64_t)v3 forAppAction:v4];
}

uint64_t __52___ATXDataStore_addExtensionLaunchForBundleId_date___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 updateOrInsertTimestamp:(uint64_t)v3 intoColumn:@"lastLaunchDate" forBundleId:v4 isExtension:1];
}

uint64_t __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_218(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_2;
  v8[3] = &unk_1E68AD200;
  id v9 = v2;
  v6[4] = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_3;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_4;
  v6[3] = &unk_1E68AD250;
  id v5 = v2;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @"SELECT BUNDLEID FROM appInfo WHERE (installDate > ? OR lastLaunchDate > ?) AND installDate IS NOT NULL;",
    v8,
    v7,
    v6);
}

void __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v5 = a2;
  [v2 timeIntervalSinceReferenceDate];
  uint64_t v4 = (uint64_t)v3;
  [v5 bindParam:1 toInteger:(uint64_t)v3];
  [v5 bindParam:2 toInteger:v4];
}

uint64_t __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = [a2 getNSStringForColumn:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke_4(uint64_t a1)
{
  return *MEMORY[0x1E4F93C10];
}

void __44___ATXDataStore__allAppsRequireInstallDate___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v2 = @"WHERE installDate IS NOT NULL";
  }
  else {
    BOOL v2 = &stru_1F2740B58;
  }
  double v3 = [NSString stringWithFormat:@"SELECT bundleId, installDate FROM appInfo %@", v2];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_2;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_3;
  v6[3] = &unk_1E68AD250;
  v6[4] = v4;
  [v5 prepAndRunQuery:v3 onPrep:0 onRow:v7 onError:v6];
}

uint64_t __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 getNSStringForColumn:0];
  if ([v3 length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __44___ATXDataStore__allAppsRequireInstallDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  BOOL v2 = *(void **)(v1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v6[4] = a1[6];
  void v4[4] = v1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  v5[4] = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_4;
  v4[3] = &unk_1E68AD250;
  return [v2 prepAndRunQuery:@"SELECT bundleId, lastLaunchDate FROM appInfo ORDER BY lastLaunchDate DESC LIMIT 1 OFFSET ?", v6, v5, v4 onPrep onRow onError];
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInteger:*(void *)(a1 + 32)];
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke(void *a1)
{
  BOOL v2 = dateColumnNameForLaunchType(a1[6]);
  uint64_t v3 = [NSString stringWithFormat:@"SELECT MAX(%@) FROM appInfo WHERE isExtension = FALSE", v2];
  uint64_t v4 = a1[4];
  id v5 = *(void **)(v4 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_2;
  v7[3] = &unk_1E68AD228;
  v7[4] = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_3;
  v6[3] = &unk_1E68AD250;
  v6[4] = v4;
  [v5 prepAndRunQuery:v3 onPrep:0 onRow:v7 onError:v6];
}

uint64_t __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getInt64ForColumn:0];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);
  if (v3) {

  }
  return *MEMORY[0x1E4F93C10];
}

uint64_t __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __32___ATXDataStore_lastLaunchedApp__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32___ATXDataStore_lastLaunchedApp__block_invoke_3;
  v5[3] = &unk_1E68AD228;
  v5[4] = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32___ATXDataStore_lastLaunchedApp__block_invoke_4;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"SELECT bundleId FROM appInfo WHERE lastLaunchDate = (SELECT MAX(lastLaunchDate) FROM appInfo WHERE isExtension = FALSE)" onPrep:&__block_literal_global_244 onRow:v5 onError:v4];
}

uint64_t __32___ATXDataStore_lastLaunchedApp__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __32___ATXDataStore_lastLaunchedApp__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25F6CC0]();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [&unk_1F27F2CA0 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(&unk_1F27F2CA0);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * v5);
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_2;
        v10[3] = &unk_1E68AD200;
        id v11 = *(id *)(a1 + 40);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_3;
        v9[3] = &unk_1E68AD250;
        v9[4] = *(void *)(a1 + 32);
        [v7 prepAndRunQuery:v6 onPrep:v10 onRow:0 onError:v9];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F27F2CA0 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

uint64_t __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":installedBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke_3(uint64_t a1)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [&unk_1F27F2CB8 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(&unk_1F27F2CB8);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * v5);
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_2;
        v9[3] = &unk_1E68AD200;
        id v10 = *(id *)(a1 + 40);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_4;
        v8[3] = &unk_1E68AD250;
        void v8[4] = *(void *)(a1 + 32);
        [v7 prepAndRunQuery:v6 onPrep:v9 onRow:&__block_literal_global_265_0 onError:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [&unk_1F27F2CB8 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_3()
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __42___ATXDataStore_removeAppInfoForBundleId___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_2;
  v8[3] = &unk_1E68AD200;
  id v9 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3;
  v5[3] = &unk_1E68AD1D8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 prepAndRunQuery:@"UPDATE appInfo SET lastLaunchDate=NULL, lastSpotlightLaunchDate=NULL WHERE bundleId=?", v8, 0, v5 onPrep onRow onError];
}

uint64_t __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v3];
  [*(id *)(a1 + 40) integrityCheckOrAbort];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __35___ATXDataStore_clearAppLaunchInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35___ATXDataStore_clearAppLaunchInfo__block_invoke_2;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"UPDATE appInfo SET lastLaunchDate=NULL, lastSpotlightLaunchDate=NULL", 0, 0, v4 onPrep onRow onError];
}

uint64_t __35___ATXDataStore_clearAppLaunchInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __36___ATXDataStore_clearAppInstallInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36___ATXDataStore_clearAppInstallInfo__block_invoke_2;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"UPDATE appInfo SET installDate=NULL" onPrep:0 onRow:0 onError:v4];
}

uint64_t __36___ATXDataStore_clearAppInstallInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __33___ATXDataStore_launchedAppCount__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___ATXDataStore_launchedAppCount__block_invoke_2;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33___ATXDataStore_launchedAppCount__block_invoke_3;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM appInfo WHERE ((lastLaunchDate!=0 AND lastLaunchDate IS NOT NULL) OR (lastSpotlightLaunchDate!=0 AND lastSpotlightLaunchDate IS NOT NULL)) AND (installDate IS NOT NULL)" onPrep:0 onRow:v5 onError:v4];
}

uint64_t __33___ATXDataStore_launchedAppCount__block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __33___ATXDataStore_launchedAppCount__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __28___ATXDataStore_loadAppInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28___ATXDataStore_loadAppInfo__block_invoke_2;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28___ATXDataStore_loadAppInfo__block_invoke_286;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT bundleId, installDate, lastLaunchDate, lastSpotlightLaunchDate, genreId, subGenreIds, isExtension, isEnterpriseApp, app2VecCluster, averageSecondsBetweenLaunches, medianSecondsBetweenLaunches FROM appInfo", 0, v4, v3 onPrep onRow onError];
}

uint64_t __28___ATXDataStore_loadAppInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];
  if (v4)
  {
    uint64_t v22 = a1;
    if (v5)
    {
      v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v5];
    }
    else
    {
      v23 = 0;
    }
    uint64_t v7 = [v3 getInt64ForColumn:2];
    if (v7)
    {
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v7];
    }
    else
    {
      uint64_t v21 = 0;
    }
    uint64_t v8 = [v3 getInt64ForColumn:3];
    if (v8)
    {
      v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v8];
    }
    else
    {
      v20 = 0;
    }
    id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 4));
    id v10 = [v3 getNSDataForColumn:5];
    long long v11 = decodeSubGenresData(v10);

    uint64_t v12 = [v3 getInt64ForColumn:6];
    uint64_t v13 = [v3 getInt64ForColumn:7];
    if ([v3 isColumnNull:7])
    {
      long long v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __28___ATXDataStore_loadAppInfo__block_invoke_2_cold_1();
      }
    }
    long long v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 8));
    if ([v3 isColumnNull:9])
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 9));
    }
    if ([v3 isColumnNull:10])
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 10));
    }
    uint64_t v18 = [[_ATXAppInfo alloc] initWithBundleId:v4 isExtension:v12 != 0 isEnterpriseApp:v13 != 0 installDate:v23 lastLaunch:v21 lastSpotlightLaunch:v20 averageSecondsBetweenLaunches:v16 medianSecondsBetweenLaunches:v17 genreId:v9 subGenreIds:v11 app2VecCluster:v15];
    [*(id *)(v22 + 32) setObject:v18 forKeyedSubscript:v4];

    uint64_t v6 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    if ([MEMORY[0x1E4F93B08] isInternalBuild]) {
      [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"rdar://28434856 Caught appInfo entry with nil bundleId"];
    }
    uint64_t v6 = *MEMORY[0x1E4F93C10];
  }

  return v6;
}

uint64_t __28___ATXDataStore_loadAppInfo__block_invoke_286(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __34___ATXDataStore_loadAppActionInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34___ATXDataStore_loadAppActionInfo__block_invoke_2;
  v5[3] = &unk_1E68AECE8;
  long long v6 = *(_OWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___ATXDataStore_loadAppActionInfo__block_invoke_3;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"SELECT appAction, lastAppActionLaunchDate FROM appActionInfo ORDER BY lastAppActionLaunchDate DESC LIMIT 1", 0, v5, v4 onPrep onRow onError];
}

uint64_t __34___ATXDataStore_loadAppActionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = [v3 getInt64ForColumn:1];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
    if (v7) {
  }
    }
  else if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"rdar://28434856 Caught appActionInfo entry with nil appAction"];
  }
  id v9 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v9;
}

uint64_t __34___ATXDataStore_loadAppActionInfo__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __40___ATXDataStore_lastMessageToRecipient___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT lastDateMessaged FROM messageRecipients WHERE recipientName = :recipient" onPrep:v5 onRow:v4 onError:v3];
}

uint64_t __40___ATXDataStore_lastMessageToRecipient___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":recipient" toNSString:*(void *)(a1 + 32)];
}

uint64_t __40___ATXDataStore_lastMessageToRecipient___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getInt64ForColumn:0];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __40___ATXDataStore_lastMessageToRecipient___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v6[4] = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_3;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT appAction, predictionsCount, feedbackCount, uiType FROM predictionFeedbackInfo ORDER BY predictionsCount DESC LIMIT :num_app_actions", v6, v4, v3 onPrep onRow onError];
}

uint64_t __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":num_app_actions" toInt64:*(void *)(a1 + 32)];
}

uint64_t __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:0];
  if (v4)
  {
    uint64_t v5 = [v3 getIntegerForColumn:1];
    uint64_t v6 = [v3 getIntegerForColumn:2];
    uint64_t v7 = [v3 getNSStringForColumn:3];
    id v8 = objc_alloc(MEMORY[0x1E4F93BB8]);
    id v9 = [NSNumber numberWithInteger:v5];
    id v10 = [NSNumber numberWithInteger:v6];
    long long v11 = (void *)[v8 initWithFirst:v9 second:v10];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v4 second:v7];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
    uint64_t v13 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    if ([MEMORY[0x1E4F93B08] isInternalBuild]) {
      [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"rdar://28434856 Caught predictionFeedbackInfo entry with nil appAction"];
    }
    uint64_t v13 = *MEMORY[0x1E4F93C10];
  }

  return v13;
}

uint64_t __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __47___ATXDataStore_writeLaunches_followingBundle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertSubsequentLaunchCountData:*(void *)(a1 + 40) forBundleId:*(void *)(a1 + 48)];
}

uint64_t __59___ATXDataStore_writeAppActionLaunches_followingAppAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertSubsequentAppActionLaunchCountData:*(void *)(a1 + 40) forAppAction:*(void *)(a1 + 48)];
}

uint64_t __64___ATXDataStore_writeAverageSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertAverageSecondsBetweenLaunches:*(void *)(a1 + 40) forBundleId:*(void *)(a1 + 48)];
}

uint64_t __63___ATXDataStore_writeMedianSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertMedianSecondsBetweenLaunches:*(void *)(a1 + 40) forBundleId:*(void *)(a1 + 48)];
}

uint64_t __67___ATXDataStore_writeAverageSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertAverageSecondsBetweenAppActions:*(void *)(a1 + 40) forAppAction:*(void *)(a1 + 48)];
}

uint64_t __66___ATXDataStore_writeMedianSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertMedianSecondsBetweenAppActions:*(void *)(a1 + 40) forAppAction:*(void *)(a1 + 48)];
}

uint64_t __54___ATXDataStore_writeGenreId_subGenreIds_forBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertGenreId:*(void *)(a1 + 40) subGenreIds:*(void *)(a1 + 48) forBundleId:*(void *)(a1 + 56)];
}

uint64_t __49___ATXDataStore_writeApp2VecCluster_forBundleId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOrInsertApp2VecCluster:*(void *)(a1 + 40) forBundleId:*(void *)(a1 + 48)];
}

void __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_2;
  v8[3] = &unk_1E68AD200;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3;
  v6[3] = &unk_1E68AEBE8;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v7 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_326;
  v5[3] = &unk_1E68AD250;
  void v5[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT subsequentLaunchCounts FROM appInfo WHERE bundleId = ?" onPrep:v8 onRow:v6 onError:v5];
}

uint64_t __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 getNSDataForColumn:0];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    id v9 = (void *)MEMORY[0x1D25F6CC0]();
    id v17 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v4 error:&v17];
    id v11 = v17;
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      long long v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3_cold_1();
      }
    }
  }
  long long v15 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v15;
}

uint64_t __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_326(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasSuffix:@"#AppLaunched"];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 substringWithRange:0, objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(@":#AppLaunched", "length")];
    uint64_t v5 = @"SELECT subsequentAppActionLaunchCounts FROM appInfo WHERE bundleId = ?";
  }
  else
  {
    id v4 = v3;
    uint64_t v5 = @"SELECT subsequentAppActionLaunchCounts FROM appActionInfo WHERE appAction = ?";
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_2;
  v13[3] = &unk_1E68AD200;
  id v14 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_3;
  v10[3] = &unk_1E68AEBE8;
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v14;
  uint64_t v12 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_339;
  v9[3] = &unk_1E68AD250;
  void v9[4] = *(void *)(a1 + 40);
  id v8 = v14;
  [v6 prepAndRunQuery:v5 onPrep:v13 onRow:v10 onError:v9];
}

uint64_t __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    id v9 = (void *)MEMORY[0x1D25F6CC0]();
    id v17 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v4 error:&v17];
    id v11 = v17;
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3_cold_1();
      }
    }
  }
  long long v15 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v15;
}

uint64_t __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke_339(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"UPDATE appInfo SET subsequentLaunchCounts = NULL WHERE bundleId = ?" onPrep:v5 onRow:0 onError:v3];
}

uint64_t __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasSuffix:@"#AppLaunched"];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 substringWithRange:0, objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(@":#AppLaunched", "length")];
    uint64_t v5 = @"UPDATE appInfo SET subsequentAppActionLaunchCounts = NULL WHERE bundleId = ?";
  }
  else
  {
    id v4 = v3;
    uint64_t v5 = @"UPDATE appActionInfo SET subsequentAppActionLaunchCounts = NULL WHERE appAction = ?";
  }
  id v6 = *(void **)(*(void *)(a1 + 40) + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_2;
  v10[3] = &unk_1E68AD200;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3;
  v8[3] = &unk_1E68AD250;
  id v9 = *(id *)(a1 + 32);
  id v7 = v4;
  [v6 prepAndRunQuery:v5 onPrep:v10 onRow:0 onError:v8];
}

uint64_t __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __55___ATXDataStore_enumerateAppInfoBundlesExecutingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateAppInfoBundlesExecutingBlock:*(void *)(a1 + 40)];
}

uint64_t __58___ATXDataStore_enumerateAppInfoAppActionsExecutingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateAppInfoAppActionsExecutingBlock:*(void *)(a1 + 40)];
}

uint64_t __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v5 = [v3 getNSStringForColumn:0];
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"rdar://28434856 Caught appInfo entry with nil bundleId"];
  }

  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v6;
}

uint64_t __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke_2_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v5 = [v3 getNSStringForColumn:0];
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    [MEMORY[0x1E4F93AE8] simulateCrashWithDescription:@"rdar://28434856 Caught appInfo entry with nil appAction"];
  }

  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v6;
}

uint64_t __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke_2_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_2;
  v4[3] = &unk_1E68AE948;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_3;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT appAction FROM appActionInfo" onPrep:0 onRow:v4 onError:v3];
}

uint64_t __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumn:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __38___ATXDataStore_totalSlotsInDatastore__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___ATXDataStore_totalSlotsInDatastore__block_invoke_2;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38___ATXDataStore_totalSlotsInDatastore__block_invoke_3;
  v4[3] = &unk_1E68AD250;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"select count(*) from (select distinct l.bundleId, l.actionType, s.paramHash from slotSetKey as s, alog as l, alogBundleId as b, alogAction as a where l.id=s.alogId and b.id=l.bundleId and a.id=l.actionType)", 0, v5, v4 onPrep onRow onError];
}

uint64_t __38___ATXDataStore_totalSlotsInDatastore__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __38___ATXDataStore_totalSlotsInDatastore__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT COUNT(DISTINCT l.actionType) FROM alog as l, alogBundleId as b WHERE b.bundleId = ? AND b.id = l.bundleId", v5, v4, v3 onPrep onRow onError];
}

uint64_t __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_2;
  v5[3] = &unk_1E68AD1B0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT 1 FROM alog, alogBundleId, alogAction WHERE alogBundleId.bundleId = ? AND alogBundleId.id = alog.bundleId AND alogAction.actionType = ? AND alogAction.id = alog.actionType LIMIT 1", v5, v4, v3 onPrep onRow onError];
}

void __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindParam:1 toNSString:v3];
  [v4 bindParam:2 toNSString:*(void *)(a1 + 40)];
}

uint64_t __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];

  return *MEMORY[0x1E4F93C10];
}

uint64_t __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __36___ATXDataStore_containsActionType___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___ATXDataStore_containsActionType___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36___ATXDataStore_containsActionType___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36___ATXDataStore_containsActionType___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT id FROM alogAction WHERE actionType = ?" onPrep:v5 onRow:v4 onError:v3];
}

uint64_t __36___ATXDataStore_containsActionType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __36___ATXDataStore_containsActionType___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __36___ATXDataStore_containsActionType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT lastAppActionLaunchDate FROM appActionInfo WHERE appAction = ?" onPrep:v5 onRow:v4 onError:v3];
}

uint64_t __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isColumnNull:0] & 1) == 0)
  {
    uint64_t v4 = [v3 getInt64ForColumn:0];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v8;
}

uint64_t __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT averageSecondsBetweenAppActions FROM appActionInfo WHERE appAction = ?" onPrep:v5 onRow:v4 onError:v3];
}

uint64_t __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isColumnNull:0] & 1) == 0)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 0));
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v7;
}

uint64_t __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_2;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_3;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT medianSecondsBetweenAppActions FROM appActionInfo WHERE appAction = ?" onPrep:v5 onRow:v4 onError:v3];
}

uint64_t __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isColumnNull:0] & 1) == 0)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 0));
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v7;
}

uint64_t __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke(uint64_t a1)
{
  if (([MEMORY[0x1E4F93BA0] isInMemoryPath:*(void *)(*(void *)(a1 + 32) + 16)] & 1) == 0)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 16) lastPathComponent];
    uint64_t v3 = [@"dataStore_" stringByAppendingString:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"tempdb-backup.db"];
    nukeDbFiles(v6);
    id v7 = *(void **)(*(void *)(a1 + 32) + 48);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_2;
    v26[3] = &unk_1E68AD200;
    id v8 = v6;
    id v27 = v8;
    [v7 prepAndRunQuery:@"VACUUM INTO :tmp_db_path" onPrep:v26 onRow:0 onError:0];
    uint64_t v22 = 0;
    v23 = (sqlite3 **)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_3;
    aBlock[3] = &unk_1E68AB898;
    id v9 = v8;
    id v20 = v9;
    uint64_t v21 = &v22;
    uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
    id v11 = v9;
    uint64_t v12 = (const char *)[v11 UTF8String];
    if (sqlite3_open_v2(v12, v23 + 3, 2, 0)
      || sqlite3_exec(v23[3], "PRAGMA journal_mode=memory", 0, 0, 0)
      || *(unsigned char *)(a1 + 56)
      && !+[_ATXDataStore pareDownForBackup:v23[3]])
    {
      v10[2](v10);
      id v13 = 0;
    }
    else
    {
      sqlite3_exec(v23[3], "VACUUM", 0, 0, 0);
      sqlite3_close(v23[3]);
      v23[3] = 0;
      id v18 = 0;
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v11 options:1 error:&v18];
      id v13 = v18;
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        nukeDbFiles(v11);
      }
      else
      {
        id v17 = __atxlog_handle_default();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_cold_1();
        }

        v10[2](v10);
      }
    }

    _Block_object_dispose(&v22, 8);
  }
}

uint64_t __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":tmp_db_path" toNSString:*(void *)(a1 + 32)];
}

sqlite3 *__67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    nukeDbFiles(v2);
  }
  uint64_t result = *(sqlite3 **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result)
  {
    return (sqlite3 *)sqlite3_close(result);
  }
  return result;
}

void __89___ATXDataStore_removeSensitiveInformationFromModeEntityScoresFile_shouldBackupContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 stableContactIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v5 stableContactIdentifier];
    int v9 = [v10 isEqualToString:v8];

    if (v9)
    {
      [v5 setDisplayName:0];
      [v5 setRawIdentifier:0];
      [v5 setCnContactId:0];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v10];
    }
  }
}

void __35___ATXDataStore_restoreFromBackup___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v8 hasPrefix:@"dataStore_"])
        {
          if (v5)
          {
            int v9 = __atxlog_handle_backup();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              __35___ATXDataStore_restoreFromBackup___block_invoke_cold_4(&buf, v23, v9);
            }
          }
          else
          {
            id v5 = v8;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);

    if (v5)
    {
      id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      id v11 = -[NSObject substringFromIndex:](v5, "substringFromIndex:", [@"dataStore_" length]);
      uint64_t v12 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:v11];
      if (v10 && +[_ATXDataStore isSqliteData:v10])
      {
        [*(id *)(a1 + 40) _disconnectFromDb];
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v13 removeItemAtPath:v12 error:0];

        uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v15 = [v12 stringByAppendingString:@"-shm"];
        [v14 removeItemAtPath:v15 error:0];

        uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v17 = [v12 stringByAppendingString:@"-wal"];
        [v16 removeItemAtPath:v17 error:0];

        id v21 = 0;
        LOBYTE(v17) = [v10 writeToFile:v12 options:1073741825 error:&v21];
        id v18 = v21;
        if (v17)
        {
          char v19 = 1;
        }
        else
        {
          id v20 = __atxlog_handle_backup();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            __35___ATXDataStore_restoreFromBackup___block_invoke_cold_3((uint64_t)v11);
          }

          char v19 = 0;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        id v18 = __atxlog_handle_backup();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __35___ATXDataStore_restoreFromBackup___block_invoke_cold_2();
        }
      }

      goto LABEL_29;
    }
  }
  else
  {
  }
  id v5 = __atxlog_handle_backup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __35___ATXDataStore_restoreFromBackup___block_invoke_cold_1();
  }
LABEL_29:
}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_2;
  v4[3] = &unk_1E68AC320;
  void v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 writeTransaction:v4];
}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_3;
  v14[3] = &unk_1E68AD1B0;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_4;
  v13[3] = &unk_1E68AD250;
  void v13[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO appLaunchSequence (launchDate, bundleId) VALUES (:launch_date, :bundle_id)", v14, 0, v13 onPrep onRow onError];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[4] = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_5;
  v8[3] = &unk_1E68AD228;
  void v8[4] = &v9;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_6;
  v7[3] = &unk_1E68AD250;
  [v3 prepAndRunQuery:@"SELECT COUNT(*) FROM appLaunchSequence" onPrep:0 onRow:v8 onError:v7];
  if (v10[3] >= 5)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
    void v5[4] = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_7;
    v6[3] = &unk_1E68B0ED8;
    void v6[4] = &v9;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_8;
    v5[3] = &unk_1E68AD250;
    [v4 prepAndRunQuery:@"DELETE FROM appLaunchSequence WHERE rowid IN (SELECT rowid FROM appLaunchSequence ORDER BY launchDate LIMIT :count - :max_count)" onPrep:v6 onRow:0 onError:v5];
  }
  _Block_object_dispose(&v9, 8);
}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":launch_date" toInteger:(uint64_t)v4];
  [v5 bindNamedParam:":bundle_id" toNSString:*(void *)(a1 + 40)];
}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_5(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C08];
}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v3 = a2;
  [v3 bindNamedParam:":count" toInteger:v2];
  [v3 bindNamedParam:":max_count" toInteger:4];
}

uint64_t __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __34___ATXDataStore_appLaunchSequence__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_2;
  v3[3] = &unk_1E68AB870;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 writeTransaction:v3];
}

void __34___ATXDataStore_appLaunchSequence__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceReferenceDate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_3;
  v11[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v11[4] = (uint64_t)(v3 + -3600.0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_4;
  v10[3] = &unk_1E68AD250;
  void v10[4] = v4;
  [v5 prepAndRunQuery:@"DELETE FROM appLaunchSequence WHERE launchDate <= :cut_off" onPrep:v11 onRow:0 onError:v10];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_5;
  v8[3] = &unk_1E68AE948;
  id v9 = *(id *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34___ATXDataStore_appLaunchSequence__block_invoke_6;
  v7[3] = &unk_1E68AD250;
  v7[4] = *(void *)(a1 + 32);
  [v6 prepAndRunQuery:@"SELECT bundleId FROM appLaunchSequence" onPrep:0 onRow:v8 onError:v7];
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":cut_off" toInteger:*(void *)(a1 + 32)];
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [a2 getNSStringForColumn:0];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __34___ATXDataStore_appLaunchSequence__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = a1[6];
  void v4[4] = v1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke_4;
  v4[3] = &unk_1E68AD250;
  return [v2 prepAndRunQuery:@"SELECT histogramData FROM histograms WHERE histogramType = ?" onPrep:v6 onRow:v5 onError:v4];
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInteger:*(void *)(a1 + 32)];
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __47___ATXDataStore_histogramDataForHistogramType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = a1[6];
  void v4[4] = v1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_4;
  v4[3] = &unk_1E68AD250;
  return [v2 prepAndRunQuery:@"SELECT histogramData FROM categoricalHistograms WHERE histogramType = ?" onPrep:v6 onRow:v5 onError:v4];
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInteger:*(void *)(a1 + 32)];
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __28___ATXDataStore_blobOfType___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void **)(v1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28___ATXDataStore_blobOfType___block_invoke_2;
  v6[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v6[4] = a1[6];
  void v4[4] = v1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28___ATXDataStore_blobOfType___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28___ATXDataStore_blobOfType___block_invoke_4;
  v4[3] = &unk_1E68AD250;
  return [v2 prepAndRunQuery:@"SELECT data FROM blobs WHERE blobType = ? AND (expirationDate IS NULL OR expirationDate > ?)" onPrep:v6 onRow:v5 onError:v4];
}

void __28___ATXDataStore_blobOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindParam:1 toInteger:v2];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v4 bindParam:2 toInt64:(uint64_t)v3];
}

uint64_t __28___ATXDataStore_blobOfType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __28___ATXDataStore_blobOfType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_2;
  v4[3] = &unk_1E68AEA58;
  uint64_t v7 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_3;
  v3[3] = &unk_1E68AD250;
  void v3[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO blobs (blobType, data, expirationDate) VALUES (?,?,?)", v4, 0, v3 onPrep onRow onError];
}

void __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_2(void *a1, void *a2)
{
  id v5 = a2;
  [v5 bindParam:1 toInteger:a1[6]];
  if (a1[4]) {
    objc_msgSend(v5, "bindParam:toNSData:", 2);
  }
  else {
    [v5 bindParamToNull:2];
  }
  uint64_t v3 = (void *)a1[5];
  if (v3)
  {
    [v3 timeIntervalSinceReferenceDate];
    [v5 bindParam:3 toInt64:(uint64_t)v4];
  }
  else
  {
    [v5 bindParamToNull:3];
  }
}

uint64_t __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __40___ATXDataStore_alogContainsActionUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___ATXDataStore_alogContainsActionUUID___block_invoke_2;
  v4[3] = &unk_1E68AD200;
  id v5 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40___ATXDataStore_alogContainsActionUUID___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT id FROM alog WHERE actionUUID=? LIMIT 1" onPrep:v4 onRow:v3 onError:&__block_literal_global_456];
}

uint64_t __40___ATXDataStore_alogContainsActionUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 getUUIDBytes:v7];
  id v4 = v3;
  id v5 = (sqlite3_stmt *)[v4 stmt];

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __40___ATXDataStore_alogContainsActionUUID___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __40___ATXDataStore_alogContainsActionUUID___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F93AE8];
  id v3 = [NSString stringWithFormat:@"Error while trying to retrieve action from alog: %@", a2];
  [v2 simulateCrashWithDescription:v3];

  return *MEMORY[0x1E4F93C10];
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2;
  v6[3] = &unk_1E68B0F78;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 120);
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 80);
  uint64_t v18 = *(void *)(a1 + 136);
  id v4 = *(id *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 144);
  id v13 = v4;
  uint64_t v19 = v5;
  id v14 = *(id *)(a1 + 96);
  id v15 = *(id *)(a1 + 104);
  long long v20 = *(_OWORD *)(a1 + 152);
  id v16 = *(id *)(a1 + 112);
  [v3 writeTransaction:v6];
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2(uint64_t a1)
{
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_3;
  v42[3] = &unk_1E68AD200;
  id v43 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO alogBundleId (bundleId) VALUES (?)" onPrep:v42 onRow:0 onError:0];
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_4;
  v40[3] = &unk_1E68AD200;
  id v41 = *(id *)(a1 + 48);
  [v3 prepAndRunQuery:@"INSERT OR IGNORE INTO alogAction (actionType) VALUES (?)" onPrep:v40 onRow:0 onError:0];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_5;
  v38[3] = &unk_1E68AD200;
  id v39 = *(id *)(a1 + 40);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_6;
  v37[3] = &unk_1E68AD228;
  v37[4] = v45;
  [v4 prepAndRunQuery:@"SELECT id FROM alogBundleId WHERE bundleId=?" onPrep:v38 onRow:v37 onError:0];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_7;
  v35[3] = &unk_1E68AD200;
  id v36 = *(id *)(a1 + 48);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_8;
  v34[3] = &unk_1E68AD228;
  v34[4] = v44;
  [v5 prepAndRunQuery:@"SELECT id FROM alogAction WHERE actionType=?" onPrep:v35 onRow:v34 onError:0];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_9;
  v20[3] = &unk_1E68B0F00;
  v28 = v45;
  uint64_t v29 = v44;
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 64);
  long long v30 = *(_OWORD *)(a1 + 120);
  id v23 = *(id *)(a1 + 72);
  id v24 = *(id *)(a1 + 80);
  uint64_t v31 = *(void *)(a1 + 136);
  id v7 = *(id *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 144);
  id v25 = v7;
  uint64_t v32 = v8;
  id v26 = *(id *)(a1 + 96);
  id v27 = *(id *)(a1 + 104);
  long long v33 = *(_OWORD *)(a1 + 152);
  [v6 prepAndRunQuery:@"INSERT OR IGNORE INTO alog (bundleId, actionType, slots, date, timeOfDay, dayOfWeek, prevLocation, location, weight, actionUUID, motionType, appSessionStartDate, appSessionEndDate, creationDateInMilliseconds, geoHash, coarseGeohash) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", v20, 0, 0 onPrep onRow onError];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = *(void **)(*(void *)(a1 + 32) + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_10;
  v13[3] = &unk_1E68AD200;
  id v14 = *(id *)(a1 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_11;
  v12[3] = &unk_1E68AECE8;
  v12[4] = &v15;
  v12[5] = v19;
  [v9 prepAndRunQuery:@"SELECT id, MAX(creationDateInMilliseconds) FROM alog WHERE actionUUID=?", v13, v12, &__block_literal_global_501 onPrep onRow onError];
  if (*((unsigned char *)v16 + 24))
  {
    id v10 = *(void **)(a1 + 112);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_502;
    v11[3] = &unk_1E68B0F50;
    v11[4] = *(void *)(a1 + 32);
    void v11[5] = v19;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v45, 8);
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_8(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 bindParam:1 toInt64:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  [v3 bindParam:2 toInt64:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  [v3 bindParam:3 toNSData:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v3 bindParam:4 toInt64:(uint64_t)v4];
  [v3 bindParam:5 toInteger:*(void *)(a1 + 104)];
  [v3 bindParam:6 toInteger:*(void *)(a1 + 112)];
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5)
  {
    [v5 getUUIDBytes:v13];
    sqlite3_bind_blob((sqlite3_stmt *)[v3 stmt], 7, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [v3 bindParamToNull:7];
  }
  id v6 = *(void **)(a1 + 56);
  if (v6)
  {
    [v6 getUUIDBytes:v13];
    sqlite3_bind_blob((sqlite3_stmt *)[v3 stmt], 8, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [v3 bindParamToNull:8];
  }
  [v3 bindParam:9 toDouble:*(double *)(a1 + 120)];
  [*(id *)(a1 + 64) getUUIDBytes:v13];
  id v7 = v3;
  sqlite3_bind_blob((sqlite3_stmt *)[v7 stmt], 10, v13, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  [v7 bindParam:11 toInteger:*(void *)(a1 + 128)];
  uint64_t v8 = *(void **)(a1 + 72);
  if (v8)
  {
    [v8 timeIntervalSinceReferenceDate];
    [v7 bindParam:12 toInt64:(uint64_t)v9];
  }
  else
  {
    [v7 bindParamToNull:12];
  }
  id v10 = *(void **)(a1 + 80);
  if (v10)
  {
    [v10 timeIntervalSinceReferenceDate];
    [v7 bindParam:13 toInt64:(uint64_t)v11];
  }
  else
  {
    [v7 bindParamToNull:13];
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [v7 bindParam:14 toInt64:(uint64_t)(v12 * 1000.0)];
  [v7 bindParam:15 toInt64:*(void *)(a1 + 136)];
  [v7 bindParam:16 toInt64:*(void *)(a1 + 144)];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 getUUIDBytes:v7];
  id v4 = v3;
  uint64_t v5 = (sqlite3_stmt *)[v4 stmt];

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_11(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_12_cold_1();
  }

  id v4 = (void *)MEMORY[0x1E4F93AE8];
  uint64_t v5 = [v2 description];
  [v4 simulateCrashWithDescription:v5];

  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v6;
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_502(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2_506;
  v11[3] = &unk_1E68B0F28;
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 prepAndRunQuery:@"INSERT OR IGNORE INTO slotSetKey (alogId, uuid, paramHash, slotHash, paramCount) VALUES (?,?,?,?,?)", v11, 0, 0 onPrep onRow onError];
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_2_506(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 bindParam:1 toInt64:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [*(id *)(a1 + 32) getUUIDBytes:v7];
  id v4 = v3;
  sqlite3_bind_blob((sqlite3_stmt *)[v4 stmt], 2, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "hash"));
  objc_msgSend(v4, "bindParam:toInt64:", 4, objc_msgSend(*(id *)(a1 + 40), "slotHash"));
  id v5 = *(void **)(a1 + 40);
  if (v5) {
    uint64_t v6 = [v5 paramCount];
  }
  else {
    uint64_t v6 = 0;
  }
  [v4 bindParam:5 toInt64:v6];
}

uint64_t __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_cold_1(a1, v2);
  }

  id v3 = (void *)MEMORY[0x1E4F93AE8];
  id v4 = [*(id *)(a1 + 40) description];
  [v3 simulateCrashWithDescription:v4];

  id v5 = *(void **)(*(void *)(a1 + 48) + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_511;
  v9[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v9[4] = *(void *)(a1 + 56);
  [v5 prepAndRunQuery:@"DELETE FROM alog WHERE id=?" onPrep:v9 onRow:0 onError:0];
  uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_2;
  v8[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v8[4] = *(void *)(a1 + 56);
  [v6 prepAndRunQuery:@"DELETE FROM slotSetKey WHERE alogId=?" onPrep:v8 onRow:0 onError:0];
  return xpc_transaction_exit_clean();
}

uint64_t __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_511(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(a1 + 32)];
}

uint64_t __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(a1 + 32)];
}

void __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_2;
  v7[3] = &unk_1E68AED38;
  id v8 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_3;
  v5[3] = &unk_1E68B0FC8;
  void v5[4] = v4;
  id v6 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT i.actionType, l.slots, l.date, l.timeOfDay, l.dayOfWeek, l.prevLocation, l.location, l.motionType, l.appSessionStartDate, l.appSessionEndDate, l.geohash, l.coarseGeohash, l.weight, l.id FROM alog AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType AND b.bundleId = ? AND i.actionType = ? ORDER BY l.rowid DESC LIMIT ?", v7, v5, 0 onPrep onRow onError];
}

void __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindParam:1 toNSString:v3];
  [v4 bindParam:2 toNSString:a1[5]];
  [v4 bindParam:3 toInteger:*(void *)(a1[6] + 56)];
}

uint64_t __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_4;
  v6[3] = &unk_1E68B0FA0;
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 _deserializeActionLogRowWithStmt:a2 invokingBlock:v6];

  return v4;
}

uint64_t __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3, a4, a5, a6);
}

void __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_2;
  v16[3] = &unk_1E68AED38;
  id v17 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v18 = v3;
  uint64_t v19 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3;
  v7[3] = &unk_1E68B0FF0;
  long long v10 = *(_OWORD *)(a1 + 72);
  long long v11 = *(_OWORD *)(a1 + 88);
  long long v12 = *(_OWORD *)(a1 + 104);
  long long v13 = *(_OWORD *)(a1 + 120);
  long long v14 = *(_OWORD *)(a1 + 136);
  long long v15 = *(_OWORD *)(a1 + 152);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v6;
  long long v9 = v6;
  id v8 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT s.uuid, l.id, i.actionType, l.date, l.timeOfDay, l.dayOfWeek, l.prevLocation, l.location, l.motionType, l.weight, s.paramHash, s.slotHash, s.paramCount, l.appSessionStartDate, l.appSessionEndDate, l.geohash, l.coarseGeohash FROM alog AS l, slotSetKey AS s, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType AND b.bundleId = ? AND l.id = s.alogId AND i.actionType = ? ORDER BY l.rowid DESC LIMIT ?", v16, v7, 0 onPrep onRow onError];
}

void __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindParam:1 toNSString:v3];
  [v4 bindParam:2 toNSString:a1[5]];
  [v4 bindParam:3 toInteger:*(void *)(a1[6] + 56)];
}

uint64_t __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];
  [v3 getInt64ForColumn:10];
  [v3 getInt64ForColumn:11];
  [v3 getInt64ForColumn:12];
  uint64_t v6 = *(void *)(a1[6] + 8);
  if (*(void *)(v6 + 24) != v5)
  {
    uint64_t v7 = [v3 getNSStringForColumn:2];
    uint64_t v8 = *(void *)(a1[7] + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 3));
    uint64_t v11 = *(void *)(a1[8] + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(void *)(*(void *)(a1[9] + 8) + 24) = [v3 getIntegerForColumn:4];
    *(void *)(*(void *)(a1[10] + 8) + 24) = [v3 getIntegerForColumn:5];
    long long v13 = [v3 getNSDataForColumn:6];
    if ([v13 length] == 16)
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v13, "bytes"));
      uint64_t v15 = *(void *)(a1[11] + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    else
    {
      uint64_t v17 = *(void *)(a1[11] + 8);
      id v16 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;
    }

    id v18 = [v3 getNSDataForColumn:7];
    if ([v18 length] == 16)
    {
      uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v18, "bytes"));
      uint64_t v20 = *(void *)(a1[12] + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
    else
    {
      uint64_t v22 = *(void *)(a1[12] + 8);
      id v21 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = 0;
    }

    *(void *)(*(void *)(a1[13] + 8) + 24) = [v3 getIntegerForColumn:8];
    [v3 getDoubleForColumn:9];
    *(void *)(*(void *)(a1[14] + 8) + 24) = v23;
    if (([v3 isColumnNull:13] & 1) == 0)
    {
      uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 13));
      uint64_t v25 = *(void *)(a1[15] + 8);
      id v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;
    }
    if (([v3 isColumnNull:14] & 1) == 0)
    {
      uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 14));
      uint64_t v28 = *(void *)(a1[16] + 8);
      uint64_t v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;
    }
    *(void *)(*(void *)(a1[17] + 8) + 24) = [v3 getInt64ForColumn:15];
    *(void *)(*(void *)(a1[18] + 8) + 24) = [v3 getInt64ForColumn:16];

    uint64_t v6 = *(void *)(a1[6] + 8);
  }
  *(void *)(v6 + 24) = v5;
  if ([v4 length] == 16)
  {
    long long v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));
    uint64_t v31 = (void *)MEMORY[0x1D25F6CC0]();
    int v32 = (*(uint64_t (**)(double))(a1[5] + 16))(*(double *)(*(void *)(a1[14] + 8) + 24));
    if (v32) {
      long long v33 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
    }
    else {
      long long v33 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
    }
  }
  else
  {
    long long v30 = __atxlog_handle_default();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3_cold_1();
    }
    long long v33 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  }

  return *v33;
}

void __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  [*(id *)(a1 + 32) count];
  id v3 = _PASQMarksSeparatedByCommas();
  id v4 = (void *)[v2 initWithFormat:@"SELECT i.actionType, l.slots, l.date, l.timeOfDay, l.dayOfWeek, l.prevLocation, l.location, l.motionType, l.appSessionStartDate, l.appSessionEndDate, l.geohash, l.coarseGeohash, l.weight, l.id FROM alog AS l, alogAction AS i WHERE actionUUID IN (%@) AND i.id = l.actionType", v3];

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_2;
  v9[3] = &unk_1E68AD200;
  id v10 = *(id *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_3;
  v7[3] = &unk_1E68B0FC8;
  uint64_t v6 = *(void **)(a1 + 48);
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  [v5 prepAndRunQuery:v4 onPrep:v9 onRow:v7 onError:0];
}

void __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
      [v5 getUUIDBytes:v6];

      sqlite3_bind_blob((sqlite3_stmt *)[v3 stmt], ++v4, v6, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    while (v4 < [*(id *)(a1 + 32) count]);
  }
}

uint64_t __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deserializeActionLogRowWithStmt:a2 invokingBlock:*(void *)(a1 + 40)];
}

void __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_2;
  v5[3] = &unk_1E68AD1B0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_3;
  v3[3] = &unk_1E68AE948;
  id v4 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT alog.id, alogBundleId.bundleId, alogAction.actionType, alog.date, slotSetKey.uuid, slotSetKey.paramHash, slotSetKey.slotHash, slotSetKey.paramCount FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id INNER JOIN slotSetKey on alog.id = slotSetKey.alogId WHERE alog.date > ? AND alog.date < ?", v5, v3, 0 onPrep onRow onError];
}

void __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindParam:1 toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindParam:2 toInt64:(uint64_t)v5];
}

uint64_t __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isColumnNull:0] & 1) != 0
    || ([v3 isColumnNull:1] & 1) != 0
    || ([v3 isColumnNull:2] & 1) != 0
    || ([v3 isColumnNull:4] & 1) != 0
    || ([v3 isColumnNull:5] & 1) != 0
    || ([v3 isColumnNull:6] & 1) != 0
    || [v3 isColumnNull:7])
  {
    uint64_t v4 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    uint64_t v18 = [v3 getInt64ForColumn:0];
    uint64_t v20 = [v3 getNSStringForColumn:1];
    uint64_t v19 = [v3 getNSStringForColumn:2];
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 3));
    uint64_t v7 = [v3 getInt64ForColumn:5];
    uint64_t v8 = [v3 getInt64ForColumn:6];
    uint64_t v9 = [v3 getInt64ForColumn:7];
    id v10 = [ATXAppIntentDuetEvent alloc];
    uint64_t v11 = [NSNumber numberWithLongLong:v7];
    v22[0] = v11;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    long long v13 = [NSNumber numberWithLongLong:v8];
    id v21 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v15 = [NSNumber numberWithLongLong:v9];
    id v16 = [NSNumber numberWithLongLong:v18];
    uint64_t v17 = [(ATXAppIntentDuetEvent *)v10 initWithBundleId:v20 actionType:v19 parameterHashes:v12 slotSetHashes:v14 paramCount:v15 startDate:v6 endDate:v6 alogId:v16];

    if (v17) {
      [*(id *)(a1 + 32) addObject:v17];
    }
    uint64_t v4 = *MEMORY[0x1E4F93C08];
  }
  return v4;
}

void __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_2;
  v7[3] = &unk_1E68AEA58;
  id v8 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v9 = v3;
  uint64_t v10 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_3;
  v5[3] = &unk_1E68AE948;
  id v6 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT alogBundleId.bundleId, alogAction.actionType, alog.date, slotSetKey.uuid, slotSetKey.paramHash, slotSetKey.slotHash, slotSetKey.paramCount FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id INNER JOIN slotSetKey on alog.id = slotSetKey.alogId WHERE alog.date > ? AND alog.date < ? ORDER BY alog.date DESC LIMIT ?", v7, v5, 0 onPrep onRow onError];
}

void __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindParam:1 toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindParam:2 toInt64:(uint64_t)v5];
  [v6 bindParam:3 toInteger:*(void *)(a1 + 48)];
}

uint64_t __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isColumnNull:0] & 1) != 0
    || ([v3 isColumnNull:1] & 1) != 0
    || ([v3 isColumnNull:2] & 1) != 0
    || ([v3 isColumnNull:4] & 1) != 0
    || ([v3 isColumnNull:5] & 1) != 0
    || [v3 isColumnNull:6])
  {
    uint64_t v4 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    id v6 = [v3 getNSStringForColumn:0];
    uint64_t v7 = [v3 getNSStringForColumn:1];
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 2));
    id v9 = [v3 getNSDataForColumn:3];
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    id v11 = v9;
    long long v12 = objc_msgSend(v10, "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));
    long long v13 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:]([ATXMinimalSlotResolutionParameters alloc], "initWithParameterHash:slotHash:uuid:paramCount:", [v3 getIntegerForColumn:4], objc_msgSend(v3, "getIntegerForColumn:", 5), v12, objc_msgSend(v3, "getIntegerForColumn:", 6));
    uint64_t v14 = [[ATXMinimalActionParameters alloc] initWithMinimalSlotResolutionParameters:v13 actionTime:v8 bundleId:v6 actionType:v7];
    [*(id *)(a1 + 32) addMinimalActionParameter:v14];
    uint64_t v4 = *MEMORY[0x1E4F93C08];
  }
  return v4;
}

void __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_2;
  v5[3] = &unk_1E68AD1B0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_3;
  v3[3] = &unk_1E68AE948;
  id v4 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"SELECT alogBundleId.bundleId, alogAction.actionType, COUNT(*) FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id WHERE alog.date > ? AND alog.date < ? GROUP BY alogBundleId.bundleId, alogAction.actionType", v5, v3, 0 onPrep onRow onError];
}

void __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindParam:1 toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindParam:2 toInt64:(uint64_t)v5];
}

uint64_t __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 getNSStringForColumn:0];
  double v5 = [v3 getNSStringForColumn:1];
  id v6 = [v3 getInt64AsNSNumberForColumn:2];

  id v7 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:v4 actionType:v5];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

void __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_2;
  v4[3] = &unk_1E68B1040;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 72);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id WHERE alog.date > ? AND alog.date < ? AND alogBundleId.bundleId = ? AND alogAction.actionType = ?" onPrep:v4 onRow:v3 onError:0];
}

void __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindParam:1 toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindParam:2 toInt64:(uint64_t)v5];
  [v6 bindParam:3 toNSString:*(void *)(a1 + 48)];
  [v6 bindParam:4 toNSString:*(void *)(a1 + 56)];
}

uint64_t __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_2;
  v4[3] = &unk_1E68AED38;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_3;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 64);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id WHERE alog.date > ? AND alog.date < ? AND alogBundleId.bundleId = ?" onPrep:v4 onRow:v3 onError:0];
}

void __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindParam:1 toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindParam:2 toInt64:(uint64_t)v5];
  [v6 bindParam:3 toNSString:*(void *)(a1 + 48)];
}

uint64_t __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_2;
  v6[3] = &unk_1E68B10B8;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 80);
  id v10 = v3;
  uint64_t v11 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 72);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) as numOccurrences FROM alog INNER JOIN alogBundleId ON alog.bundleId = alogBundleId.id INNER JOIN alogAction ON alog.actionType = alogAction.id INNER JOIN slotSetKey on alog.id = slotSetKey.alogId WHERE alog.date > ? AND alog.date < ? AND alogBundleId.bundleId = ? AND alogAction.actionType = ? AND slotSetKey.paramHash = ?" onPrep:v6 onRow:v5 onError:0];
}

void __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 timeIntervalSinceReferenceDate];
  [v6 bindParam:1 toInt64:(uint64_t)v4];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v6 bindParam:2 toInt64:(uint64_t)v5];
  [v6 bindParam:3 toNSString:*(void *)(a1 + 48)];
  [v6 bindParam:4 toNSString:*(void *)(a1 + 56)];
  [v6 bindParam:5 toInt64:*(void *)(a1 + 64)];
}

uint64_t __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __35___ATXDataStore_actionForSlotUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 getUUIDBytes:v7];
  id v4 = v3;
  double v5 = (sqlite3_stmt *)[v4 stmt];

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __35___ATXDataStore_actionForSlotUUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSDataForColumn:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v6 = ATXSlotSetsDeserialize();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return *MEMORY[0x1E4F93C10];
}

uint64_t __35___ATXDataStore_actionForSlotUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35___ATXDataStore_actionForSlotUUID___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v7) getUUIDBytes:v18];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v18 length:16];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v9 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_2;
  v12[3] = &unk_1E68AB870;
  v12[4] = v9;
  id v13 = v2;
  id v11 = v2;
  [v10 writeTransaction:v12];
}

void __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_3;
  v9[3] = &unk_1E68AD200;
  id v10 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM slotSetKey WHERE alogId IN (SELECT rowid FROM alog WHERE actionUUID IN _pas_nsset(:actionUUIDSet))" onPrep:v9 onRow:0 onError:0];
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_4;
  v7[3] = &unk_1E68AD200;
  id v8 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:@"DELETE FROM alog WHERE actionUUID IN _pas_nsset(:actionUUIDSet)" onPrep:v7 onRow:0 onError:0];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_5;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  [v4 prepAndRunQuery:@"DELETE FROM afeedback WHERE actionUUID IN _pas_nsset(:actionUUIDSet)" onPrep:v5 onRow:0 onError:0];
}

uint64_t __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":actionUUIDSet" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":actionUUIDSet" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":actionUUIDSet" toNSSet:*(void *)(a1 + 32)];
}

void __47___ATXDataStore_removeActionDataForActionUUID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_2;
  v3[3] = &unk_1E68AB870;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 writeTransaction:v3];
}

void __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_3;
  v9[3] = &unk_1E68AD200;
  id v10 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM slotSetKey WHERE alogId IN (SELECT rowid FROM alog WHERE actionUUID=?)" onPrep:v9 onRow:0 onError:0];
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_4;
  v7[3] = &unk_1E68AD200;
  id v8 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:@"DELETE FROM alog WHERE actionUUID=?" onPrep:v7 onRow:0 onError:0];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_5;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  [v4 prepAndRunQuery:@"DELETE FROM afeedback WHERE actionUUID=?" onPrep:v5 onRow:0 onError:0];
}

uint64_t __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 getUUIDBytes:v7];
  id v4 = v3;
  uint64_t v5 = (sqlite3_stmt *)[v4 stmt];

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 getUUIDBytes:v7];
  id v4 = v3;
  uint64_t v5 = (sqlite3_stmt *)[v4 stmt];

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __47___ATXDataStore_removeActionDataForActionUUID___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 getUUIDBytes:v7];
  id v4 = v3;
  uint64_t v5 = (sqlite3_stmt *)[v4 stmt];

  return sqlite3_bind_blob(v5, 1, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke_2;
  v3[3] = &unk_1E68AD228;
  void v3[4] = *(void *)(a1 + 40);
  return [v1 prepAndRunQuery:@"SELECT uuid FROM slotSetKey WHERE alogId NOT IN (SELECT id FROM alog)" onPrep:0 onRow:v3 onError:0];
}

uint64_t __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

void __45___ATXDataStore_removeActionDataForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke_2;
  v3[3] = &unk_1E68AB870;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 writeTransaction:v3];
}

void __45___ATXDataStore_removeActionDataForBundleId___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke_3;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke_4;
  v4[3] = &unk_1E68AD228;
  void v4[4] = &v7;
  [v2 prepAndRunQuery:@"SELECT id FROM alogBundleId WHERE bundleId=?" onPrep:v5 onRow:v4 onError:0];
  uint64_t v3 = v8[3];
  if (v3 != -1) {
    removeActionDataByBundleIdId(*(void **)(*(void *)(a1 + 32) + 48), v3);
  }

  _Block_object_dispose(&v7, 8);
}

uint64_t __45___ATXDataStore_removeActionDataForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __45___ATXDataStore_removeActionDataForBundleId___block_invoke_4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __40___ATXDataStore_actionAndSlotsForRowId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, objc_msgSend(v2, "integerValue"));
}

uint64_t __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  if (v4
    && (ATXSlotSetsDeserialize(),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8),
        uint64_t v7 = *(void **)(v6 + 40),
        *(void *)(v6 + 40) = v5,
        v7,
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)))
  {
    uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  }
  else
  {
    uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  }

  return *v8;
}

uint64_t __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_3_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_608(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2_609(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "getInt64ForColumn:", 0));
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

void __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_610(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, objc_msgSend(v2, "longLongValue"));
}

uint64_t __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2_611()
{
  return *MEMORY[0x1E4F93C08];
}

void __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_default();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = __atxlog_handle_default();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "regenerateSlotSetKeyForBundleId", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke_614;
  v10[3] = &unk_1E68AB870;
  void v10[4] = v6;
  id v11 = *(id *)(a1 + 40);
  [v7 writeTransaction:v10];
  uint64_t v8 = __atxlog_handle_default();
  uint64_t v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v9, OS_SIGNPOST_INTERVAL_END, v3, "regenerateSlotSetKeyForBundleId", "", buf, 2u);
  }
}

uint64_t __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke_614(uint64_t a1)
{
  return [*(id *)(a1 + 32) _regenerateSlotSetKeyForBundleId:*(void *)(a1 + 40)];
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2;
  v5[3] = &unk_1E68AB870;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 writeTransaction:v5];
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2(uint64_t a1)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_opt_new();
    id v3 = *(void **)(*(void *)(a1 + 40) + 48);
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3;
    v100[3] = &unk_1E68AEB98;
    id v101 = *(id *)(a1 + 32);
    id v4 = v2;
    id v102 = v4;
    [v3 prepAndRunQuery:@"SELECT id, bundleId FROM alogBundleId", 0, v100, 0 onPrep onRow onError];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v96 objects:v104 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v97 != v7) {
            objc_enumerationMutation(v5);
          }
          removeActionDataByBundleIdId(*(void **)(*(void *)(a1 + 40) + 48), [*(id *)(*((void *)&v96 + 1) + 8 * i) unsignedLongLongValue]);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v96 objects:v104 count:16];
      }
      while (v6);
    }
  }
  uint64_t v9 = objc_opt_new();
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = -1;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x2020000000;
  uint64_t v91 = -1;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = -1;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  int v83 = 0;
  uint64_t v10 = +[_ATXGlobals sharedInstance];
  id v11 = (void *)MEMORY[0x1E4F1C9C8];
  v48 = v10;
  [v10 maximumSlotResolutionDatabaseEntryAge];
  id v13 = [v11 dateWithTimeIntervalSinceNow:v12 * 24.0 * 60.0 * -60.0];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__50;
  v78 = __Block_byref_object_dispose__50;
  id v79 = 0;
  uint64_t v14 = *(void *)(a1 + 40);
  long long v15 = *(void **)(v14 + 48);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4;
  v66[3] = &unk_1E68B1108;
  v70 = &v92;
  id v71 = &v88;
  v72 = &v80;
  v69 = &v74;
  v66[4] = v14;
  id v16 = v13;
  id v67 = v16;
  id v17 = v9;
  id v68 = v17;
  v73 = &v84;
  [v15 prepAndRunQuery:@"SELECT bundleId, actionType, id, date FROM alog ORDER BY bundleId, actionType ASC, rowid DESC", 0, v66, 0 onPrep onRow onError];
  if (v93[3] != -1 && v89[3] != -1)
  {
    if (*(void *)(*(void *)(a1 + 40) + 56) < (unint64_t)*((int *)v81 + 6)
      || ([(id)v75[5] timeIntervalSinceDate:v16], v18 < 0.0))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F93BB8]);
      uint64_t v20 = [NSNumber numberWithLongLong:v93[3]];
      id v21 = [NSNumber numberWithLongLong:v89[3]];
      uint64_t v22 = (void *)[v19 initWithFirst:v20 second:v21];

      uint64_t v23 = [NSNumber numberWithLongLong:v85[3]];
      [v17 setObject:v23 forKeyedSubscript:v22];
    }
  }
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5;
  v65[3] = &unk_1E68B1130;
  v65[4] = *(void *)(a1 + 40);
  [v17 enumerateKeysAndObjectsUsingBlock:v65];
  uint64_t v24 = objc_opt_new();

  v93[3] = -1;
  v89[3] = -1;
  v85[3] = -1;
  *((_DWORD *)v81 + 6) = 0;
  uint64_t v25 = (void *)MEMORY[0x1E4F1C9C8];
  [v48 maximumSlotFeedbackDatabaseEntryAge];
  uint64_t v27 = [v25 dateWithTimeIntervalSinceNow:v26 * 24.0 * 60.0 * -60.0];

  uint64_t v28 = objc_opt_new();
  uint64_t v29 = *(void **)(*(void *)(a1 + 40) + 48);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3_634;
  v55[3] = &unk_1E68B1158;
  v60 = &v74;
  id v30 = v28;
  uint64_t v61 = &v92;
  v62 = &v88;
  uint64_t v63 = &v80;
  uint64_t v31 = *(void *)(a1 + 40);
  id v56 = v30;
  uint64_t v57 = v31;
  id v32 = v27;
  id v58 = v32;
  id v33 = v24;
  id v59 = v33;
  v64 = &v84;
  [v29 prepAndRunQuery:@"SELECT bundleId, actionType, id, date FROM afeedback ORDER BY bundleId, actionType ASC, id DESC", 0, v55, 0 onPrep onRow onError];
  if (v93[3] != -1 && v89[3] != -1)
  {
    if (*(void *)(*(void *)(a1 + 40) + 56) < (unint64_t)*((int *)v81 + 6)
      || ([(id)v75[5] timeIntervalSinceDate:v32], v34 < 0.0))
    {
      id v35 = objc_alloc(MEMORY[0x1E4F93BB8]);
      id v36 = [NSNumber numberWithLongLong:v93[3]];
      id v37 = [NSNumber numberWithLongLong:v89[3]];
      uint64_t v38 = (void *)[v35 initWithFirst:v36 second:v37];

      id v39 = [NSNumber numberWithLongLong:v85[3]];
      [v33 setObject:v39 forKeyedSubscript:v38];
    }
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4_635;
  v54[3] = &unk_1E68B1130;
  v54[4] = *(void *)(a1 + 40);
  [v33 enumerateKeysAndObjectsUsingBlock:v54];
  uint64_t v47 = v33;
  v40 = v32;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v41 = v30;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v50 objects:v103 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v51 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v45 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        long long v46 = *(void **)(*(void *)(a1 + 40) + 48);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_6;
        v49[3] = &unk_1E68AD200;
        v49[4] = v45;
        [v46 prepAndRunQuery:@"DELETE FROM afeedback WHERE id=?" onPrep:v49 onRow:0 onError:0];
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v50 objects:v103 count:16];
    }
    while (v42);
  }

  [*(id *)(*(void *)(a1 + 40) + 48) prepAndRunQuery:@"DELETE FROM alogAction WHERE id NOT IN (SELECT actionType FROM alog UNION SELECT actionType FROM afeedback)" onPrep:0 onRow:0 onError:0];
  [*(id *)(*(void *)(a1 + 40) + 48) prepAndRunQuery:@"DELETE FROM alogBundleId WHERE id NOT IN (SELECT bundleId FROM alog UNION SELECT bundleId FROM afeedback)" onPrep:0 onRow:0 onError:0];
  [*(id *)(*(void *)(a1 + 40) + 48) prepAndRunQuery:@"DELETE FROM slotSetKey WHERE alogId NOT IN (SELECT id FROM alog)" onPrep:0 onRow:0 onError:0];

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v92, 8);
}

uint64_t __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 getNSStringForColumn:1];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 0));
    [v6 addObject:v7];
  }
  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];
  uint64_t v6 = [v3 getInt64ForColumn:3];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  if (v6) {

  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void *)(v8 + 24);
  if (v4 == v9)
  {
    if (v4 == -1) {
      goto LABEL_17;
    }
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v5 == v10) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v9 == -1) {
      goto LABEL_17;
    }
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  if (v10 != -1)
  {
    if (*(void *)(*(void *)(a1 + 32) + 56) < (unint64_t)*(int *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                             + 24)
      || ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceDate:*(void *)(a1 + 40)], v11 < 0.0))
    {
      id v12 = objc_alloc(MEMORY[0x1E4F93BB8]);
      id v13 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      uint64_t v14 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      long long v15 = (void *)[v12 initWithFirst:v13 second:v14];

      id v16 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
      [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v15];
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  }
LABEL_17:
  *(void *)(v8 + 24) = v4;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v5;
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  unint64_t v18 = *(int *)(v17 + 24);
  *(_DWORD *)(v17 + 24) = v18 + 1;
  if (*(void *)(*(void *)(a1 + 32) + 56) > v18)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceDate:*(void *)(a1 + 40)];
    if (v19 > 0.0) {
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v3 getInt64ForColumn:2];
    }
  }
  uint64_t v20 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v20;
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 134217984;
    uint64_t v21 = [v6 longLongValue];
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting rows older than id: %lld", buf, 0xCu);
  }

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_625;
  v17[3] = &unk_1E68AD1B0;
  id v9 = v5;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  [v8 prepAndRunQuery:@"DELETE FROM slotSetKey WHERE alogId IN (SELECT id FROM alog WHERE alog.bundleId=? AND alog.actionType=? AND alog.id<?)" onPrep:v17 onRow:0 onError:0];
  double v11 = *(void **)(*(void *)(a1 + 32) + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2_629;
  v14[3] = &unk_1E68AD1B0;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 prepAndRunQuery:@"DELETE FROM alog WHERE bundleId=? AND actionType=? AND id<?" onPrep:v14 onRow:0 onError:0];
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_625(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 first];
  objc_msgSend(v6, "bindParam:toInt64:", 1, objc_msgSend(v4, "longLongValue"));

  id v5 = [*(id *)(a1 + 32) second];
  objc_msgSend(v6, "bindParam:toInt64:", 2, objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_2_629(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 first];
  objc_msgSend(v6, "bindParam:toInt64:", 1, objc_msgSend(v4, "longLongValue"));

  id v5 = [*(id *)(a1 + 32) second];
  objc_msgSend(v6, "bindParam:toInt64:", 2, objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

uint64_t __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_3_634(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];
  uint64_t v6 = [v3 getInt64ForColumn:3];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    id v12 = *(void **)(a1 + 32);
    id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 2));
    [v12 addObject:v9];
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v14 = *(void *)(v13 + 24);
  if (v4 == v14)
  {
    if (v4 == -1) {
      goto LABEL_15;
    }
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v5 == v15) {
      goto LABEL_15;
    }
  }
  else
  {
    if (v14 == -1) {
      goto LABEL_15;
    }
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  }
  if (v15 != -1)
  {
    if (*(void *)(*(void *)(a1 + 40) + 56) < (unint64_t)*(int *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                             + 24)
      || ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceDate:*(void *)(a1 + 48)], v16 < 0.0))
    {
      id v17 = objc_alloc(MEMORY[0x1E4F93BB8]);
      id v18 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      id v19 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
      uint64_t v20 = (void *)[v17 initWithFirst:v18 second:v19];

      uint64_t v21 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
      [*(id *)(a1 + 56) setObject:v21 forKeyedSubscript:v20];
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  }
LABEL_15:
  *(void *)(v13 + 24) = v4;
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v5;
  uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
  unint64_t v23 = *(int *)(v22 + 24);
  *(_DWORD *)(v22 + 24) = v23 + 1;
  if (*(void *)(*(void *)(a1 + 40) + 56) > v23)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSinceDate:*(void *)(a1 + 48)];
    if (v24 > 0.0) {
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v3 getInt64ForColumn:2];
    }
  }
  uint64_t v25 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v25;
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_4_635(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5_639;
  v10[3] = &unk_1E68AD1B0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 prepAndRunQuery:@"DELETE FROM afeedback WHERE bundleId=? AND actionType=? AND id<?" onPrep:v10 onRow:0 onError:0];
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_5_639(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 first];
  objc_msgSend(v6, "bindParam:toInt64:", 1, objc_msgSend(v4, "longLongValue"));

  id v5 = [*(id *)(a1 + 32) second];
  objc_msgSend(v6, "bindParam:toInt64:", 2, objc_msgSend(v5, "longLongValue"));

  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

void __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindParam:toInt64:", 1, objc_msgSend(v2, "longLongValue"));
}

uint64_t __30___ATXDataStore_actionLogKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 getNSStringForColumn:0];
  uint64_t v7 = [v4 getNSStringForColumn:1];

  id v8 = (void *)[v5 initWithFirst:v6 second:v7];
  [v2 addObject:v8];

  return *MEMORY[0x1E4F93C08];
}

void __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_2;
  v4[3] = &unk_1E68B11A8;
  void v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 80);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  char v13 = *(unsigned char *)(a1 + 120);
  long long v11 = *(_OWORD *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 112);
  [v3 writeTransaction:v4];
}

void __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_2(uint64_t a1)
{
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_3;
  v25[3] = &unk_1E68AD200;
  id v26 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO alogBundleId (bundleId) VALUES (?)" onPrep:v25 onRow:0 onError:0];
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_4;
  v23[3] = &unk_1E68AD200;
  id v24 = *(id *)(a1 + 48);
  [v3 prepAndRunQuery:@"INSERT OR IGNORE INTO alogAction (actionType) VALUES (?)" onPrep:v23 onRow:0 onError:0];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_5;
  v21[3] = &unk_1E68AD200;
  id v22 = *(id *)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_6;
  v20[3] = &unk_1E68AD228;
  void v20[4] = v28;
  [v4 prepAndRunQuery:@"SELECT id FROM alogBundleId WHERE bundleId=?" onPrep:v21 onRow:v20 onError:0];
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_7;
  v18[3] = &unk_1E68AD200;
  id v19 = *(id *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_8;
  v17[3] = &unk_1E68AD228;
  void v17[4] = v27;
  [v5 prepAndRunQuery:@"SELECT id FROM alogAction WHERE actionType=?" onPrep:v18 onRow:v17 onError:0];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_9;
  v7[3] = &unk_1E68B1180;
  long long v11 = v28;
  uint64_t v12 = v27;
  id v8 = *(id *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 80);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  char v16 = *(unsigned char *)(a1 + 120);
  long long v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  [v6 prepAndRunQuery:@"INSERT OR IGNORE INTO afeedback (bundleId, actionType, slots, confirms, rejects, actionUUID, date, consumerSubType, feedbackType, geoHash, coarseGeohash) VALUES (?,?,?,?,?,?,?,?,?,?,?)", v7, 0, 0 onPrep onRow onError];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_8(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v4 = a2;
  [v4 bindParam:1 toInt64:v3];
  [v4 bindParam:2 toInt64:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [v4 bindParam:3 toNSData:*(void *)(a1 + 32)];
  [v4 bindParam:4 toDouble:*(double *)(a1 + 72)];
  [v4 bindParam:5 toDouble:*(double *)(a1 + 80)];
  [*(id *)(a1 + 40) getUUIDBytes:v9];
  id v5 = v4;
  sqlite3_bind_blob((sqlite3_stmt *)[v5 stmt], 6, v9, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  [v5 bindParam:7 toInt64:(uint64_t)v6];
  id v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 112)];
  [v5 bindParam:8 toNSString:v7];

  id v8 = [MEMORY[0x1E4F4AE58] actionFeedbackTypeToString:*(void *)(a1 + 88)];
  [v5 bindParam:9 toNSString:v8];

  [v5 bindParam:10 toInt64:*(void *)(a1 + 96)];
  [v5 bindParam:11 toInt64:*(void *)(a1 + 104)];
}

void __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F4B680] inverseConsumerSubtypeMapping];
  uint64_t v3 = [MEMORY[0x1E4F4AE58] inverseActionFeedbackTypeMapping];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_2;
  v14[3] = &unk_1E68AED38;
  id v15 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v16 = v5;
  uint64_t v17 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_3;
  v9[3] = &unk_1E68B11D0;
  id v10 = v2;
  id v11 = v3;
  uint64_t v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  id v8 = v2;
  [v4 prepAndRunQuery:@"SELECT l.slots, l.confirms, l.rejects, l.id, l.date, l.consumerSubType, l.feedbackType, l.geohash, l.coarseGeohash FROM afeedback AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType AND b.bundleId = ? AND i.actionType = ? ORDER BY l.rowid DESC LIMIT ?", v14, v9, 0 onPrep onRow onError];
}

void __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindParam:1 toNSString:v3];
  [v4 bindParam:2 toNSString:a1[5]];
  [v4 bindParam:3 toInteger:*(void *)(a1[6] + 56)];
}

uint64_t __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = [v3 getNSDataForColumn:0];
  [v3 getDoubleForColumn:1];
  double v7 = v6;
  [v3 getDoubleForColumn:2];
  double v9 = v8;
  [v3 getInt64ForColumn:3];
  uint64_t v10 = [v3 getInt64ForColumn:4];
  id v11 = [v3 getNSStringForColumn:5];
  uint64_t v12 = [v3 getNSStringForColumn:6];
  uint64_t v29 = [v3 getInt64ForColumn:7];
  uint64_t v28 = [v3 getInt64ForColumn:8];
  id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
  id v15 = (void *)v14;
  if (v13 && v14 && v10)
  {
    uint64_t v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v10];
    if (v5)
    {
      id v16 = ATXSlotSetsDeserialize();
    }
    else
    {
      id v16 = 0;
    }
    id v26 = v16;
    id v19 = [v16 second];
    uint64_t v20 = [v19 count];

    uint64_t v21 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
    if (v20 == 1)
    {
      uint64_t v23 = *(void *)(a1 + 56);
      id v24 = [v26 first];
      uint64_t v25 = [v26 second];
      id v22 = [v25 anyObject];
      int v30 = (*(uint64_t (**)(uint64_t, void *, void *, void *, void, uint64_t, uint64_t, uint64_t, double, double))(v23 + 16))(v23, v24, v22, v27, [v13 unsignedIntValue], objc_msgSend(v15, "unsignedIntegerValue"), v29, v28, v7, v9);

      if (!v30) {
        uint64_t v21 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
      }
    }
    uint64_t v17 = *v21;
  }
  else
  {
    uint64_t v17 = *MEMORY[0x1E4F93C08];
  }

  return v17;
}

uint64_t __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_4_cold_1();
  }

  id v3 = (void *)MEMORY[0x1E4F93AE8];
  id v4 = [*(id *)(a1 + 32) description];
  [v3 simulateCrashWithDescription:v4];

  id v5 = *(void **)(*(void *)(a1 + 40) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_664;
  v7[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v7[4] = *(void *)(a1 + 48);
  [v5 prepAndRunQuery:@"DELETE FROM afeedback WHERE id=?" onPrep:v7 onRow:0 onError:0];
  return xpc_transaction_exit_clean();
}

uint64_t __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_664(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(a1 + 32)];
}

uint64_t __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke(uint64_t a1)
{
  uint64_t v2 = __atxlog_handle_deletions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting all actions", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 48) prepAndRunQuery:@"DELETE FROM alog" onPrep:0 onRow:0 onError:&__block_literal_global_670];
}

uint64_t __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke_668(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke_668_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) prepAndRunQuery:@"DELETE FROM afeedback" onPrep:0 onRow:0 onError:&__block_literal_global_675];
}

uint64_t __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) prepAndRunQuery:@"DELETE FROM slotSetKey" onPrep:0 onRow:0 onError:&__block_literal_global_680];
}

uint64_t __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __38___ATXDataStore_actionFeedbackLogKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v4 = a2;
  id v5 = [v3 alloc];
  double v6 = [v4 getNSStringForColumn:0];
  double v7 = [v4 getNSStringForColumn:1];

  double v8 = (void *)[v5 initWithFirst:v6 second:v7];
  [v2 addObject:v8];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __42___ATXDataStore_removeActionsWithoutTitle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeActionsWithoutTitle];
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2;
  v21[3] = &unk_1E68AE948;
  id v4 = v2;
  id v22 = v4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3;
  v20[3] = &unk_1E68AEB20;
  void v20[4] = *(void *)(a1 + 40);
  [v3 prepAndRunQuery:@"SELECT slots, id FROM alog", 0, v21, v20 onPrep onRow onError];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = __atxlog_handle_deletions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v9 longLongValue];
          *(_DWORD *)uint8_t buf = 134217984;
          uint64_t v24 = v11;
          _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting actions without title with rowId: %lld", buf, 0xCu);
        }

        uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 48);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_690;
        v15[3] = &unk_1E68AD200;
        v15[4] = v9;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_692;
        v14[3] = &unk_1E68AEB20;
        void v14[4] = *(void *)(a1 + 40);
        [v12 prepAndRunQuery:@"DELETE FROM alog WHERE id = :id" onPrep:v15 onRow:0 onError:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v6);
  }
}

uint64_t __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];
  if (v4)
  {
    uint64_t v6 = ATXSlotSetsDeserialize();
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v6 first];
  if (([v7 hasActionTitle] & 1) == 0)
  {
    double v8 = *(void **)(a1 + 32);
    double v9 = [NSNumber numberWithLongLong:v5];
    [v8 addObject:v9];
  }
  uint64_t v10 = *MEMORY[0x1E4F93C08];

  return v10;
}

uint64_t __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_690(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":id", objc_msgSend(v2, "longLongValue"));
}

uint64_t __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_692(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_692_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

uint64_t __37___ATXDataStore_currentSchemaVersion__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __37___ATXDataStore_currentSchemaVersion__block_invoke_2()
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __42___ATXDataStore_migrateWithMigrationPlan___block_invoke(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __34___ATXDataStore_configureDatabase__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C10];
}

BOOL __34___ATXDataStore_runMigrationPlan___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(NSString **)(*((void *)&v12 + 1) + 8 * i);
        if ([(NSString *)v6 hasPrefix:@"migration_"])
        {
          SEL v7 = NSSelectorFromString(v6);
          if (!v7
            || ((uint64_t (*)(void, SEL))[*(id *)(a1 + 40) methodForSelector:v7])(*(void *)(a1 + 40), v7) != 3)
          {
            *((unsigned char *)v17 + 24) = 0;
            goto LABEL_15;
          }
        }
        else
        {
          double v8 = *(void **)(*(void *)(a1 + 40) + 48);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __34___ATXDataStore_runMigrationPlan___block_invoke_2;
          v11[3] = &unk_1E68AEB20;
          void v11[4] = &v16;
          [v8 prepAndRunQuery:v6 onPrep:0 onRow:0 onError:v11];
          if (!*((unsigned char *)v17 + 24)) {
            goto LABEL_15;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (*((unsigned char *)v17 + 24))
  {
    [*(id *)(a1 + 40) updateSchemaVersionNumberTo:*(void *)(*(void *)(a1 + 40) + 24)];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 3;
    BOOL v9 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __34___ATXDataStore_runMigrationPlan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34___ATXDataStore_runMigrationPlan___block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

uint64_t __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toInt64:*(void *)(a1 + 32)];
}

uint64_t __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __30___ATXDataStore_clearDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 getNSStringForColumn:0];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __30___ATXDataStore_clearDatabase__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __30___ATXDataStore_clearDatabase__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_2;
  v12[3] = &unk_1E68B0D70;
  uint64_t v4 = *(void *)(a1 + 40);
  v12[4] = v2;
  void v12[5] = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_3;
  v11[3] = &unk_1E68AEB20;
  void v11[4] = v4;
  uint64_t result = [v3 prepAndRunQuery:@"SELECT bundleId, date FROM launchHistory", 0, v12, v11 onPrep onRow onError];
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(v6 + 8) + 24))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(void **)(v7 + 48);
    void v9[4] = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_4;
    v10[3] = &unk_1E68B0D70;
    void v10[4] = v7;
    void v10[5] = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_5;
    v9[3] = &unk_1E68AEB20;
    return [v8 prepAndRunQuery:@"SELECT bundleId, date FROM spotlightLaunchHistory", 0, v10, v9 onPrep onRow onError];
  }
  return result;
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];

  if ([*(id *)(a1 + 32) migrationUpdateOrInsertTimestamp:v5 intoColumn:@"lastLaunchDate" forBundleId:v4])
  {
    uint64_t v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v6 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  }

  return *v6;
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E4F93C10];
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];

  if ([*(id *)(a1 + 32) migrationUpdateOrInsertTimestamp:v5 intoColumn:@"lastSpotlightLaunchDate" forBundleId:v4])
  {
    uint64_t v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v6 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  }

  return *v6;
}

uint64_t __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke_5(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:a2];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumn:0];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0) {
    [*(id *)(a1 + 40) _removeFeedbackForBundleId:v3];
  }
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __54___ATXDataStore_migration_RemoveAllSubsequentLaunches__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54___ATXDataStore_migration_RemoveAllSubsequentLaunches__block_invoke_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

void __64___ATXDataStore_migration_DelinkFromCoreLocationVisitMonitoring__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1D25F6CC0]();
  id v3 = objc_opt_new();
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/CoreParsec.framework" delegate:v3 onQueue:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1E600]) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/Routine.bundle" delegate:v3 onQueue:*(void *)(a1 + 32)];
  [v4 stopMonitoringVisits];
  [v5 stopMonitoringVisits];
}

void __43___ATXDataStore_migration_AddExtensionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[ATXLaunchServicesHelper bundleIsExtension:](ATXLaunchServicesHelper, "bundleIsExtension:")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __47___ATXDataStore_migration_AddEnterpriseAppInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F4AF00];
  id v4 = a2;
  objc_msgSend(v2, "_markBundleId:asEnterpriseApp:", v4, objc_msgSend(v3, "isEnterpriseAppForBundle:", v4));
}

uint64_t __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":histogram_type" toInt64:8];
}

uint64_t __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

void __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 bindNamedParam:":h1" toInt64:15];
  [v2 bindNamedParam:":h2" toInt64:18];
  [v2 bindNamedParam:":h3" toInt64:21];
  [v2 bindNamedParam:":h4" toInt64:24];
  [v2 bindNamedParam:":h5" toInt64:27];
}

uint64_t __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_829(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":h1" toInt64:30];
}

uint64_t __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_832(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v2];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v4;
}

uint64_t __35___ATXDataStore_allActionsAndSlots__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  uint64_t v5 = [v3 getInt64ForColumn:1];
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  uint64_t v6 = ATXSlotSetsDeserialize();
  if (v6)
  {
LABEL_5:
    double v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    BOOL v9 = [NSNumber numberWithLongLong:v5];
    [v8 setObject:v6 forKeyedSubscript:v9];

    uint64_t v7 = *MEMORY[0x1E4F93C08];
    goto LABEL_6;
  }
  uint64_t v7 = *MEMORY[0x1E4F93C08];
LABEL_6:

  return v7;
}

uint64_t __35___ATXDataStore_allActionsAndSlots__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __35___ATXDataStore_allActionsAndSlots__block_invoke_2_cold_1();
  }

  +[_ATXDataStore _simulateCrashForMigrationFailure:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v7;
}

void __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bindParam:toInteger:", 1, objc_msgSend(v3, "integerValue"));
  uint64_t v5 = [*(id *)(a1 + 40) uuid];
  [v5 getUUIDBytes:v7];

  id v6 = v4;
  sqlite3_bind_blob((sqlite3_stmt *)[v6 stmt], 2, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "bindParam:toInt64:", 3, objc_msgSend(*(id *)(a1 + 48), "hash"));
  objc_msgSend(v6, "bindParam:toInt64:", 4, objc_msgSend(*(id *)(a1 + 40), "hash"));
  objc_msgSend(v6, "bindParam:toInt64:", 5, objc_msgSend(*(id *)(a1 + 48), "paramCount"));
}

uint64_t __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }

  **(void **)(a1 + 48) = 0;
  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v5;
}

void __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindParam:1 toNSData:v3];
  objc_msgSend(v4, "bindParam:toInteger:", 2, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
}

uint64_t __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke(uint64_t a1)
{
  return *MEMORY[0x1E4F93C08];
}

uint64_t __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
  +[_ATXDataStore _simulateCrashForMigrationFailure:a2];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:a2];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumn:0];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 1));
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "getInt64ForColumn:", 2));
  uint64_t v7 = [v3 getNSStringForColumn:3];

  uint64_t v8 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v4 second:v7];
  BOOL v9 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v5 second:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v8];
  uint64_t v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v10;
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:a2];
  return *MEMORY[0x1E4F93C10];
}

void __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":appAction" toNSString:v3];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":predictionsCount", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":feedbackCount", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
  [v4 bindNamedParam:":uiType" toNSString:*(void *)(a1 + 56)];
}

uint64_t __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_5(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  +[_ATXDataStore _simulateCrashForMigrationFailure:a2];
  return *MEMORY[0x1E4F93C10];
}

void __69___ATXDataStore_updateOrInsertSubsequentLaunchCountData_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:v3];
  [v4 bindNamedParam:":launch_count" toNSData:*(void *)(a1 + 40)];
}

void __66___ATXDataStore_migration_forceUpdateNewAzulSystemAppsInstallDate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":new_timestamp" toInt64:(uint64_t)v3];
  [v4 bindNamedParam:":translate_app" toNSString:@"com.apple.Translate"];
  [v4 bindNamedParam:":magnifier_app" toNSString:@"com.apple.Magnifier"];
}

uint64_t __66___ATXDataStore_migration_forceUpdateNewAzulSystemAppsInstallDate__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E4F93C10];
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":new_timestamp" toInt64:(uint64_t)v3];
  [v4 bindNamedParam:":generativePlayground_app" toNSString:@"com.apple.GenerativePlaygroundApp"];
  [v4 bindNamedParam:":printCenter_app" toNSString:@"com.apple.printcenter"];
  [v4 bindNamedParam:":tvRemote_app" toNSString:@"com.apple.TVRemoteUIService"];
  [v4 bindNamedParam:":passwords_app" toNSString:@"com.apple.Passwords"];
}

uint64_t __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v1 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_937(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":new_timestamp" toInt64:(uint64_t)v3];
  [v4 bindNamedParam:":calculator_app" toNSString:@"com.apple.calculator"];
}

uint64_t __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_944(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v1 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_944_cold_1();
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __65___ATXDataStore_migration_overrideNilInstallDateToDistantOldTime__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":new_timestamp" toInt64:1];
}

uint64_t __65___ATXDataStore_migration_overrideNilInstallDateToDistantOldTime__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E4F93C10];
}

void __45___ATXDataStore_migration_populateModeCaches__block_invoke()
{
  uint64_t v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Populating mode caches in migration", buf, 2u);
  }

  uint64_t v1 = __atxlog_handle_default();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_DEFAULT, "Training mode entity models...", v5, 2u);
  }

  id v2 = objc_opt_new();
  [v2 train];
  double v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Done training mode entity models.", v4, 2u);
  }
}

void __79___ATXDataStore_updateOrInsertSubsequentAppActionLaunchCountData_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":key" toNSString:v3];
  [v4 bindNamedParam:":launch_count" toNSData:*(void *)(a1 + 40)];
}

void __93___ATXDataStore_updateOrInsertPredictionsAndFeedbackForAppAction_feedbackReceived_forUIType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":app_action" toNSString:v3];
  [v4 bindNamedParam:":ui_type" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":feedback_count" toInt64:*(unsigned __int8 *)(a1 + 48)];
}

void __61___ATXDataStore_updateOrInsertMessageRecipient_dateMessaged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":recipient" toNSString:v3];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v5 bindNamedParam:":date_messaged" toInt64:(uint64_t)v4];
}

void __73___ATXDataStore_updateOrInsertAverageSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:*(void *)(a1 + 32)];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":average_seconds_between_launches", objc_msgSend(v3, "integerValue"));
  }
  else {
    [v4 bindNamedParamToNull:":average_seconds_between_launches"];
  }
}

void __72___ATXDataStore_updateOrInsertMedianSecondsBetweenLaunches_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:*(void *)(a1 + 32)];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":median_seconds_between_launches", objc_msgSend(v3, "integerValue"));
  }
  else {
    [v4 bindNamedParamToNull:":median_seconds_between_launches"];
  }
}

void __76___ATXDataStore_updateOrInsertAverageSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 bindNamedParam:":app_action" toNSString:*(void *)(a1 + 32)];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":average_seconds_between_app_actions", objc_msgSend(v3, "integerValue"));
  }
  else {
    [v4 bindNamedParamToNull:":average_seconds_between_app_actions"];
  }
}

void __75___ATXDataStore_updateOrInsertMedianSecondsBetweenAppActions_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 bindNamedParam:":app_action" toNSString:*(void *)(a1 + 32)];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":median_seconds_between_app_actions", objc_msgSend(v3, "integerValue"));
  }
  else {
    [v4 bindNamedParamToNull:":median_seconds_between_app_actions"];
  }
}

void __63___ATXDataStore_updateOrInsertGenreId_subGenreIds_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:v3];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":genreId_data", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v4, "bindNamedParam:toNSData:", ":subGenreIdsData");
  }
  else {
    [v4 bindNamedParamToNull:":subGenreIdsData"];
  }
}

void __58___ATXDataStore_updateOrInsertApp2VecCluster_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:v3];
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":app2vec_cluster", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
}

void __76___ATXDataStore_updateOrInsertTimestamp_intoColumn_forBundleId_isExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:v3];
  [v4 bindNamedParam:":new_timestamp" toInt64:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":is_extension" toInt64:*(unsigned __int8 *)(a1 + 48)];
}

void __54___ATXDataStore_updateOrInsertTimestamp_forAppAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":app_action" toNSString:v3];
  [v4 bindNamedParam:":new_timestamp" toInt64:*(void *)(a1 + 40)];
}

void __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bindNamedParam:":bundle_id" toNSString:*(void *)(a1 + 32)];
  [v3 bindNamedParam:":new_timestamp" toInt64:*(void *)(a1 + 64)];
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":genreId_data", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v3, "bindNamedParam:toNSData:", ":subGenreIds_data");
  }
  else {
    [v3 bindNamedParamToNull:":subGenreIds_data"];
  }
  [v3 bindNamedParam:":is_extension" toInt64:*(unsigned __int8 *)(a1 + 72)];
  [v3 bindNamedParam:":is_enterprise_app" toInt64:*(unsigned __int8 *)(a1 + 73)];
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":app2vec_cluster", objc_msgSend(*(id *)(a1 + 56), "integerValue"));
}

uint64_t __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_app_install();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __42___ATXDataStore__markBundleIdAsExtension___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":bundle_id" toNSString:*(void *)(a1 + 32)];
}

uint64_t __42___ATXDataStore__markBundleIdAsExtension___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __47___ATXDataStore__markBundleId_asEnterpriseApp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:v3];
  [v4 bindNamedParam:":is_enterprise_app" toInt64:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __47___ATXDataStore__markBundleId_asEnterpriseApp___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":bundle_id" toNSString:v3];
  [v4 bindNamedParam:":new_timestamp" toInt64:*(void *)(a1 + 40)];
}

uint64_t __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E4F93C10];
}

void __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_2;
  v6[3] = &unk_1E68B1310;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 96);
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 112);
  id v4 = *(id *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 120);
  id v13 = v4;
  uint64_t v16 = v5;
  [v3 writeTransaction:v6];
}

void __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_2(uint64_t a1)
{
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_3;
  v28[3] = &unk_1E68AD200;
  id v29 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR IGNORE INTO alogBundleId (bundleId) VALUES (?)" onPrep:v28 onRow:0 onError:0];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_4;
  v26[3] = &unk_1E68AD200;
  id v27 = *(id *)(a1 + 48);
  [v3 prepAndRunQuery:@"INSERT OR IGNORE INTO alogAction (actionType) VALUES (?)" onPrep:v26 onRow:0 onError:0];
  id v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_5;
  v24[3] = &unk_1E68AD200;
  id v25 = *(id *)(a1 + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_6;
  v23[3] = &unk_1E68AD228;
  void v23[4] = v31;
  [v4 prepAndRunQuery:@"SELECT id FROM alogBundleId WHERE bundleId=?" onPrep:v24 onRow:v23 onError:0];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_7;
  v21[3] = &unk_1E68AD200;
  id v22 = *(id *)(a1 + 48);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_8;
  v20[3] = &unk_1E68AD228;
  void v20[4] = v30;
  [v5 prepAndRunQuery:@"SELECT id FROM alogAction WHERE actionType=?" onPrep:v21 onRow:v20 onError:0];
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_9;
  v9[3] = &unk_1E68B12E8;
  uint64_t v15 = v31;
  uint64_t v16 = v30;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 96);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 80);
  uint64_t v18 = *(void *)(a1 + 112);
  id v7 = *(id *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 120);
  id v14 = v7;
  uint64_t v19 = v8;
  [v6 prepAndRunQuery:@"INSERT OR IGNORE INTO alog (bundleId, actionType, slots, date, timeOfDay, dayOfWeek, prevLocation, location, weight, actionUUID, motionType) VALUES (?,?,?,?,?,?,?,?,?,?,?)", v9, 0, 0 onPrep onRow onError];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_8(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

void __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 bindParam:1 toInt64:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v3 bindParam:2 toInt64:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  [v3 bindParam:3 toNSData:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v3 bindParam:4 toInt64:(uint64_t)v4];
  [v3 bindParam:5 toInteger:*(void *)(a1 + 88)];
  [v3 bindParam:6 toInteger:*(void *)(a1 + 96)];
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5)
  {
    [v5 getUUIDBytes:v8];
    sqlite3_bind_blob((sqlite3_stmt *)[v3 stmt], 7, v8, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [v3 bindParamToNull:7];
  }
  id v6 = *(void **)(a1 + 56);
  if (v6)
  {
    [v6 getUUIDBytes:v8];
    sqlite3_bind_blob((sqlite3_stmt *)[v3 stmt], 8, v8, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [v3 bindParamToNull:8];
  }
  [v3 bindParam:9 toDouble:*(double *)(a1 + 104)];
  [*(id *)(a1 + 64) getUUIDBytes:v8];
  id v7 = v3;
  sqlite3_bind_blob((sqlite3_stmt *)[v7 stmt], 10, v8, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  [v7 bindParam:11 toInteger:*(void *)(a1 + 112)];
}

uint64_t __29___ATXDataStore__testMigrate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) migrate];
}

void __38___ATXDataStore__testMigrateToSchema___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[_ATXDataStoreMigrations migrations];
  id v4 = [v2 _trimMigrationPlan:v3 toSchema:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) migrateWithMigrationPlan:v4];
}

void __38___ATXDataStore_swapInDuetHelperStub___block_invoke(uint64_t a1)
{
}

void __32___ATXDataStore__databaseSchema__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __32___ATXDataStore__databaseSchema__block_invoke_2;
  v20[3] = &unk_1E68AE948;
  id v21 = *(id *)(a1 + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32___ATXDataStore__databaseSchema__block_invoke_3;
  v19[3] = &unk_1E68AD250;
  void v19[4] = *(void *)(a1 + 32);
  [v2 prepAndRunQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND NOT name LIKE 'sqlite_%'" onPrep:0 onRow:v20 onError:v19];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [NSString stringWithFormat:@"PRAGMA table_info(%@);", v7];
        uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 48);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __32___ATXDataStore__databaseSchema__block_invoke_4;
        v12[3] = &unk_1E68AEB98;
        id v13 = *(id *)(a1 + 40);
        uint64_t v14 = v7;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __32___ATXDataStore__databaseSchema__block_invoke_5;
        v11[3] = &unk_1E68AD250;
        void v11[4] = *(void *)(a1 + 32);
        [v9 prepAndRunQuery:v8 onPrep:0 onRow:v12 onError:v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v4);
  }
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  uint64_t v4 = objc_opt_new();
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];

  uint64_t v5 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v5;
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_4(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumn:1];
  uint64_t v5 = [v3 getNSStringForColumn:2];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v9[0] = @"column";
  v9[1] = @"dataType";
  v10[0] = v4;
  v10[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v6 addObject:v7];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __32___ATXDataStore__databaseSchema__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return *MEMORY[0x1E4F93C10];
}

uint64_t __38___ATXDataStore_integrityCheckOrAbort__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumn:0];
  char v4 = [@"ok" isEqualToString:v3];

  if ((v4 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return *MEMORY[0x1E4F93C10];
}

uint64_t __38___ATXDataStore_integrityCheckOrAbort__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return *MEMORY[0x1E4F93C08];
}

void __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_2;
  v8[3] = &unk_1E68AD200;
  id v9 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 64);
  v5[2] = __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_3;
  v5[3] = &unk_1E68B3AD8;
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 prepAndRunQuery:@"SELECT log.id, logAction.actionType, log.date FROM alog AS log, alogAction AS logAction WHERE logAction.id = log.actionType AND log.date > ? ORDER BY log.date", v8, v5, &__block_literal_global_162 onPrep onRow onError];
}

void __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindParam:1 toInt64:(uint64_t)v3];
}

uint64_t __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 getInt64ForColumn:0];
  uint64_t v4 = [v3 getNSStringForColumn:1];
  uint64_t v5 = *(void *)(a1[6] + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "getInt64ForColumn:", 3));
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = (void *)MEMORY[0x1D25F6CC0]();
  LODWORD(a1) = (*(uint64_t (**)(void))(a1[4] + 16))();
  id v11 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  id v12 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  if (a1) {
    id v13 = v11;
  }
  else {
    id v13 = v12;
  }
  return *v13;
}

uint64_t __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_4()
{
  uint64_t v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_4_cold_1(v0);
  }

  return *MEMORY[0x1E4F93C10];
}

void __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to write parameterCombinationsWithSchema", v2, v3, v4, v5, v6);
}

void __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to read parameterCombinationsWithSchema", v2, v3, v4, v5, v6);
}

void __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to write backgroundExecution", v2, v3, v4, v5, v6);
}

void __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to read backgroundExecution", v2, v3, v4, v5, v6);
}

void __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to write title", v2, v3, v4, v5, v6);
}

void __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to read title", v2, v3, v4, v5, v6);
}

void __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to write subtitle", v2, v3, v4, v5, v6);
}

void __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to read subtitle", v2, v3, v4, v5, v6);
}

void __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to write eligibleForWidgets", v2, v3, v4, v5, v6);
}

void __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to read eligibleForWidgets", v2, v3, v4, v5, v6);
}

void __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to remove cached intents", v2, v3, v4, v5, v6);
}

void __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "_ATXDataStore failed to remove all cached intents", v2, v3, v4, v5, v6);
}

void __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke_4_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "_ATXDataStore failed to read webClipForAppClip", v1, 2u);
}

void __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "_ATXDataStore failed to write webClipForAppClip", v1, 2u);
}

void __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unable to delete launch timestamps for %@", v2, v3, v4, v5, v6);
}

void __28___ATXDataStore_loadAppInfo__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Unexpected NULL isEnterpriseApp for bundleId: %@", v1, 0xCu);
}

void __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Error unarchving subsequent launches for %@: %@", (void)v3, DWORD2(v3));
}

void __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Unable to delete subsequentLaunchCounts for bundle %@ (%@)", (void)v3, DWORD2(v3));
}

void __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Unable to delete subsequentAppActionLaunchCounts for appAction %@ (%@)", (void)v3, DWORD2(v3));
}

void __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error enumerating AppInfo bundleIds: %@", v2, v3, v4, v5, v6);
}

void __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error enumerating AppInfo appActions: %@", v2, v3, v4, v5, v6);
}

void __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Could not read sqlite database: %@", v2, v3, v4, v5, v6);
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "No datastore file found in backup", v2, v3, v4, v5, v6);
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Invalid chunk received for ATXDataStoreBackup", v2, v3, v4, v5, v6);
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Error restoring to file %@: %@", (void)v3, DWORD2(v3));
}

void __35___ATXDataStore_restoreFromBackup___block_invoke_cold_4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "More than one ATXDataStore found in backup", buf, 2u);
}

void __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error retrieving action just added: %@", v2, v3, v4, v5, v6);
}

void __64___ATXDataStore__deserializeActionLogRowWithStmt_invokingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Exception deserializing slots for %@: %@", (uint8_t *)&v4, 0x16u);
}

void __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error obtaining slotset UUID for action row: %lld", v2, v3, v4, v5, v6);
}

void __35___ATXDataStore_actionForSlotUUID___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Error retrieving action for slot UUID:%@ error:%@", (void)v3, DWORD2(v3));
}

void __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error fetching action and slots from db for row identifier: %@", v2, v3, v4, v5, v6);
}

void __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Error deleting slotSetKey data for bundleId: %@ error:%@", (void)v3, DWORD2(v3));
}

void __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Exception deserializing slots: %@", v2, v3, v4, v5, v6);
}

void __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke_668_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data associated with alog: %@", v2, v3, v4, v5, v6);
}

void __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data associated with afeedback: %@", v2, v3, v4, v5, v6);
}

void __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data associated with slotSetKey: %@", v2, v3, v4, v5, v6);
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error collating data while clearing actions without title: %@", v2, v3, v4, v5, v6);
}

void __43___ATXDataStore__removeActionsWithoutTitle__block_invoke_2_692_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data while clearing actions without title: %@", v2, v3, v4, v5, v6);
}

void __34___ATXDataStore_runMigrationPlan___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error creating table: %@", v2, v3, v4, v5, v6);
}

void __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error updating schema: %@", v2, v3, v4, v5, v6);
}

void __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error iterating through bundles in app table: %@", v2, v3, v4, v5, v6);
}

void __54___ATXDataStore_migration_RemoveAllSubsequentLaunches__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error wiping subsequent launch counts (migration_RemoveAllSubsequentLaunches: %@", v2, v3, v4, v5, v6);
}

void __58___ATXDataStore_migration_DeprecateGenericAppIntentModels__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data associated with deprecated histogram _APRHistogramTypeAppIntentDonation: %@", v2, v3, v4, v5, v6);
}

void __62___ATXDataStore_migration_DeprecateIntentForAllAppsHistograms__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error deleting data associated with deprecated histograms: %@", v2, v3, v4, v5, v6);
}

void __35___ATXDataStore_allActionsAndSlots__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error all actions and slots from db: %@", v2, v3, v4, v5, v6);
}

void __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) uuid];
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "Failed to insert slotSetKey UUID: %@ alogId: %@ with error: %@", v7, 0x20u);
}

void __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_10(&dword_1D0FA3000, v1, v2, "Failed to update action id: %@ with error: %@", (void)v3, DWORD2(v3));
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Database migration Failure: Failed to add install date for new Crystal apps", v2, v3, v4, v5, v6);
}

void __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_944_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Database migration Failure: Failed to add install date for new Crystal app (Calculator for iPad)", v2, v3, v4, v5, v6);
}

void __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_FAULT, "ATXDataStore: Updating install date failed for bundle id: %@ error: %{public}@", v2, 0x16u);
}

void __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke_4_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "_ATXDataStore failed to enumerateActionTypesOlderThan", v1, 2u);
}

@end