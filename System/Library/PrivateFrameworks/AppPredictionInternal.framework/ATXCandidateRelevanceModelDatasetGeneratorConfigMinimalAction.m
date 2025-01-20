@interface ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction
+ (id)candidatePublisherFromStartTime:(double)a3;
+ (id)candidatePublisherFromStartTime:(double)a3 datastore:(id)a4;
+ (id)candidatePublisherFromStartTime:(id)a3 endTime:(id)a4 datastore:(id)a5;
+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4;
@end

@implementation ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction

+ (id)candidatePublisherFromStartTime:(double)a3
{
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  v7 = objc_opt_class();
  v8 = [NSNumber numberWithDouble:a3];
  v9 = [NSNumber numberWithDouble:v6];
  v10 = [v7 candidatePublisherWithStartTime:v8 endTime:v9];

  return v10;
}

+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = +[_ATXDataStore sharedInstance];
  v9 = [v7 candidatePublisherFromStartTime:v6 endTime:v5 datastore:v8];

  return v9;
}

+ (id)candidatePublisherFromStartTime:(double)a3 datastore:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  v7 = [v5 date];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  v10 = objc_opt_class();
  v11 = [NSNumber numberWithDouble:a3];
  v12 = [NSNumber numberWithDouble:v9];
  v13 = [v10 candidatePublisherFromStartTime:v11 endTime:v12 datastore:v6];

  return v13;
}

+ (id)candidatePublisherFromStartTime:(id)a3 endTime:(id)a4 datastore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke;
  v20 = &unk_1E68AC3B8;
  id v21 = v9;
  id v22 = v7;
  id v23 = v8;
  id v24 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  [v14 _doSync:&v17];
  v15 = objc_msgSend(v11, "bpsPublisher", v17, v18, v19, v20);

  return v15;
}

void __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke(id *a1)
{
  v2 = [a1[4] db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_2;
  v5[3] = &unk_1E68AD1B0;
  id v6 = a1[5];
  id v7 = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_3;
  v3[3] = &unk_1E68AE948;
  id v4 = a1[7];
  [v2 prepAndRunQuery:@"SELECT alogBundleId.bundleId, alogAction.actionType, slotSetKey.paramHash, alog.date FROM alog, slotSetKey, alogBundleId, alogAction WHERE alog.id=slotSetKey.alogId AND alog.bundleId=alogBundleId.id AND alog.actionType=alogAction.id AND alog.date >= ? AND alog.date <= ? ORDER BY alog.date ASC", v5, v3, &__block_literal_global_99_0 onPrep onRow onError];
}

void __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bindParam:toInt64:", 1, objc_msgSend(v3, "integerValue"));
  objc_msgSend(v4, "bindParam:toInt64:", 2, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
}

uint64_t __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumn:0];
  id v5 = [v3 getNSStringForColumn:1];
  id v6 = -[ATXMinimalAction initWithBundleId:actionType:paramHash:]([ATXMinimalAction alloc], "initWithBundleId:actionType:paramHash:", v4, v5, [v3 getInt64ForColumn:2]);
  id v7 = [[ATXCandidateMinimalAction alloc] initWithBiomeStoreData:v6];
  uint64_t v8 = [v3 getInt64ForColumn:3];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B620]) initWithEventBody:v7 timestamp:(double)v8];
  [*(id *)(a1 + 32) addObject:v9];
  v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v10;
}

uint64_t __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_4_cold_1((uint64_t)v2, v3);
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unable to produce minimalActionCandidateEvents from alog. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end