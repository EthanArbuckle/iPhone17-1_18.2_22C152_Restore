@interface GDXPCInternalService
- (BOOL)behaviorUnderstandingClearAllDataWithShouldClearFeaturizer:(BOOL)a3 shouldClearSampleGenerator:(BOOL)a4 error:(id *)a5;
- (BOOL)behaviorUnderstandingClearEntityTaggingInjectedTagsWithError:(id *)a3;
- (BOOL)behaviorUnderstandingDigestWithShouldDigestFeaturizer:(BOOL)a3 shouldDigestSampleGenerator:(BOOL)a4 error:(id *)a5;
- (BOOL)behaviorUnderstandingInjectTagForPersonID:(id)a3 tagType:(id)a4 confidence:(double)a5 error:(id *)a6;
- (BOOL)behaviorUnderstandingMockEntityRelevanceContextWithDate:(id)a3 error:(id *)a4;
- (BOOL)behaviorUnderstandingTriggerEntityTaggingDataCollectionWithError:(id *)a3;
- (BOOL)benchmarkWithError:(id *)a3;
- (BOOL)clearStatusWithError:(id *)a3;
- (BOOL)runDeltaUpdatePipelineWithSource:(id)a3 error:(id *)a4;
- (BOOL)runToMatchingPipelineWithError:(id *)a3;
- (BOOL)stopPipelineWithError:(id *)a3;
- (GDXPCInternalService)init;
- (id)behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath:(id)a3 error:(id *)a4;
- (id)behaviorUnderstandingEvaluateForBehaviorType:(id)a3 queryName:(id)a4 inferenceServiceInstanceId:(id)a5 error:(id *)a6;
- (id)behaviorUnderstandingFeaturizeBehaviorOfType:(id)a3 identifier:(id)a4 usingContextAt:(id)a5 error:(id *)a6;
- (id)behaviorUnderstandingFeaturizedBehaviorsForFeatureName:(id)a3 behaviorType:(id)a4 error:(id *)a5;
- (id)behaviorUnderstandingHistogramsOfKind:(id)a3 behaviorType:(id)a4 viewName:(id)a5 error:(id *)a6;
- (id)behaviorUnderstandingRecentBehaviorsOfType:(id)a3 error:(id *)a4;
- (id)behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID:(id)a3 error:(id *)a4;
- (id)behaviorUnderstandingShowEntityTaggingInjectedTagsWithError:(id *)a3;
- (id)behaviorUnderstandingStatusWithError:(id *)a3;
- (id)contextDataForSource:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6;
- (id)featureKeysWithError:(id *)a3;
- (id)generateActivityCentricLifeEventsFromStartDate:(id)a3 toEndDate:(id)a4 error:(id *)a5;
- (id)photosMetadataWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(int64_t)a5 newestFirst:(BOOL)a6 error:(id *)a7;
- (id)resolveEntityWithRequest:(id)a3 enableSessionLogging:(BOOL)a4 configName:(id)a5 encodedConfig:(id)a6 withError:(id *)a7;
- (id)statsWithError:(id *)a3;
- (id)statusWithError:(id *)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)triplesQueryWithQuery:(id)a3;
- (id)validateGraph:(id *)a3;
- (id)vectorSearchBenchmarkWithConfigFilePath:(id)a3 error:(id *)a4;
- (id)viewInfoWithViewQuery:(id)a3 rows:(id)a4 error:(id *)a5;
- (id)viewSqlWithName:(id)a3 statement:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)locked_establishConnection;
@end

@implementation GDXPCInternalService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInterface, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)featureKeysWithError:(id *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1B2E72588;
  v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B2E72588;
  v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEBUG, "GDXPCInternalService: featureKeysWithError called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E725A0;
  v17[3] = &unk_1E60140A0;
  v17[4] = &v19;
  v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7266C;
  v16[3] = &unk_1E6013DC8;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_featureKeys_(v9, v10, (uint64_t)v16, v11, v12);

  v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)viewSqlWithName:(id)a3 statement:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1B2E72588;
  v34 = sub_1B2E72598;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1B2E72588;
  v28 = sub_1B2E72598;
  id v29 = 0;
  v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v8;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewSql called [name=%@].", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E729A0;
  v21[3] = &unk_1E6013E90;
  id v11 = v8;
  id v22 = v11;
  v23 = &v24;
  v15 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v12, (uint64_t)v21, v13, v14);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E72A7C;
  v20[3] = &unk_1E6013FC0;
  v20[4] = &v30;
  v20[5] = &v24;
  objc_msgSend_viewSqlWithName_statement_completion_(v15, v16, (uint64_t)v11, (uint64_t)v9, (uint64_t)v20);

  v17 = (void *)v31[5];
  if (a5 && !v17)
  {
    *a5 = (id) v25[5];
    v17 = (void *)v31[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)viewInfoWithViewQuery:(id)a3 rows:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1B2E72588;
  uint64_t v32 = sub_1B2E72598;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1B2E72588;
  uint64_t v26 = sub_1B2E72598;
  id v27 = 0;
  v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: viewInfo called.", buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E72D68;
  v20[3] = &unk_1E60140A0;
  v20[4] = &v22;
  uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v20, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E72E34;
  v19[3] = &unk_1E6013DC8;
  v19[4] = &v28;
  v19[5] = &v22;
  objc_msgSend_viewInfoWithViewQuery_rows_completion_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v19);

  v16 = (void *)v29[5];
  if (a5 && !v16)
  {
    *a5 = (id) v23[5];
    v16 = (void *)v29[5];
  }
  id v17 = v16;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);

  return v17;
}

- (BOOL)behaviorUnderstandingClearEntityTaggingInjectedTagsWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding clearEntityTaggingInjectedTags called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E730C0;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  id v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E731A4;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_behaviorUnderstandingClearEntityTaggingInjectedTagsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)behaviorUnderstandingShowEntityTaggingInjectedTagsWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = sub_1B2E72588;
  id v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding showEntityTaggingInjectedTags called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E733FC;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  id v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E734E8;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_behaviorUnderstandingShowEntityTaggingInjectedTagsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);
  int v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    int v13 = (void *)v26[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (BOOL)behaviorUnderstandingInjectTagForPersonID:(id)a3 tagType:(id)a4 confidence:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1B2E72588;
  char v28 = sub_1B2E72598;
  id v29 = 0;
  uint64_t v12 = GDXPCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v12, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding injectTagForPerson called.", buf, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E737A8;
  v22[3] = &unk_1E6014050;
  v22[4] = &v24;
  v22[5] = &v30;
  v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E7388C;
  v21[3] = &unk_1E6014078;
  void v21[4] = &v30;
  v21[5] = &v24;
  objc_msgSend_behaviorUnderstandingInjectTagForPersonID_tagType_confidence_completion_(v16, v17, (uint64_t)v10, (uint64_t)v11, (uint64_t)v21, a5);
  int v18 = *((unsigned __int8 *)v31 + 24);
  if (a6 && !*((unsigned char *)v31 + 24))
  {
    *a6 = (id) v25[5];
    int v18 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v19 = v18 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

- (BOOL)behaviorUnderstandingMockEntityRelevanceContextWithDate:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  v23 = sub_1B2E72598;
  id v24 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding mockEntityRelevanceContext called with date: %@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E73B00;
  v18[3] = &unk_1E6014050;
  v18[4] = &v19;
  v18[5] = &v25;
  id v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E73BE4;
  v17[3] = &unk_1E6014078;
  v17[4] = &v25;
  void v17[5] = &v19;
  objc_msgSend_behaviorUnderstandingMockEntityRelevanceContextWithDate_completion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

  int v14 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((unsigned char *)v26 + 24))
  {
    *a4 = (id) v20[5];
    int v14 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (id)behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = sub_1B2E72588;
  id v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  v23 = sub_1B2E72598;
  id v24 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding dumpEntityTaggingFeatures called with outputPath: %@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E73E8C;
  v18[3] = &unk_1E6014050;
  v18[4] = &v19;
  v18[5] = &v25;
  id v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E73F78;
  v17[3] = &unk_1E6013FC0;
  v17[4] = &v25;
  void v17[5] = &v19;
  objc_msgSend_behaviorUnderstandingDumpEntityTaggingDataCollectionWithOutputPath_completion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

  int v14 = (void *)v26[5];
  if (a4 && !v14)
  {
    *a4 = (id) v20[5];
    int v14 = (void *)v26[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v15;
}

- (BOOL)behaviorUnderstandingTriggerEntityTaggingDataCollectionWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding triggerEntityTaggingDataCollection called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E74204;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E742E8;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_behaviorUnderstandingTriggerEntityTaggingDataCollectionWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)generateActivityCentricLifeEventsFromStartDate:(id)a3 toEndDate:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B2E72588;
  uint64_t v31 = sub_1B2E72598;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B2E72588;
  uint64_t v25 = sub_1B2E72598;
  id v26 = 0;
  uint64_t v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: generateActivityCentricLifeEvents called [startDate: %@, endDate: %@].", buf, 0x16u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B2E745BC;
  v20[3] = &unk_1E6014050;
  v20[4] = &v21;
  void v20[5] = &v27;
  BOOL v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)v20, v12, v13);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E746A8;
  v19[3] = &unk_1E6013DC8;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend_generateActivityCentricLifeEventsFromStartDate_toEndDate_completion_(v14, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v19);

  v16 = (void *)v28[5];
  if (a5 && !v16)
  {
    *a5 = (id) v22[5];
    v16 = (void *)v28[5];
  }
  id v17 = v16;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v17;
}

- (id)behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B2E72588;
  uint64_t v33 = sub_1B2E72598;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1B2E72588;
  uint64_t v27 = sub_1B2E72598;
  id v28 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding sampleEntityTaggingFeatures called [personID=%@].", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E749CC;
  v19[3] = &unk_1E6013DA0;
  id v8 = v6;
  id v20 = v8;
  uint64_t v21 = &v23;
  uint64_t v22 = &v29;
  uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v19, v10, v11);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E74AC8;
  v18[3] = &unk_1E6013FC0;
  v18[4] = &v29;
  v18[5] = &v23;
  objc_msgSend_behaviorUnderstandingSampleEntityTaggingFeaturesForPersonID_completion_(v12, v13, (uint64_t)v8, (uint64_t)v18, v14);

  id v15 = (void *)v30[5];
  if (a4 && !v15)
  {
    *a4 = (id) v24[5];
    id v15 = (void *)v30[5];
  }
  id v16 = v15;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (id)behaviorUnderstandingEvaluateForBehaviorType:(id)a3 queryName:(id)a4 inferenceServiceInstanceId:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_1B2E72588;
  v42 = sub_1B2E72598;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = sub_1B2E72588;
  id v36 = sub_1B2E72598;
  id v37 = 0;
  uint64_t v13 = GDXPCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v10;
    __int16 v46 = 2112;
    id v47 = v11;
    __int16 v48 = 2112;
    id v49 = v12;
    _os_log_impl(&dword_1B2996000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding evaluate called [behaviorType=%@, queryName=%@, inferenceServiceInstanceId=%@].", buf, 0x20u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1B2E74E5C;
  v26[3] = &unk_1E6013DF0;
  id v14 = v10;
  id v27 = v14;
  id v15 = v11;
  id v28 = v15;
  id v16 = v12;
  id v29 = v16;
  id v30 = &v32;
  uint64_t v31 = &v38;
  id v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v26, v18, v19);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1B2E74F6C;
  v25[3] = &unk_1E6013F88;
  v25[4] = &v38;
  v25[5] = &v32;
  objc_msgSend_behaviorUnderstandingEvaluateForBehaviorType_queryName_inferenceServiceInstanceId_completion_(v20, v21, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, v25);

  uint64_t v22 = (void *)v39[5];
  if (a6 && !v22)
  {
    *a6 = (id) v33[5];
    uint64_t v22 = (void *)v39[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v23;
}

- (id)photosMetadataWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(int64_t)a5 newestFirst:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1B2E72588;
  id v43 = sub_1B2E72598;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_1B2E72588;
  id v37 = sub_1B2E72598;
  id v38 = 0;
  id v14 = GDXPCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v46 = v12;
    __int16 v47 = 2112;
    id v48 = v13;
    __int16 v49 = 2048;
    int64_t v50 = a5;
    __int16 v51 = 1024;
    BOOL v52 = v8;
    _os_log_impl(&dword_1B2996000, v14, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: PhotosMetadataWithStartDate [startDate=%@, endDate=%@, maxEvents=%ld, newestFirst=%d].", buf, 0x26u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1B2E75304;
  v26[3] = &unk_1E6013E68;
  id v15 = v12;
  id v27 = v15;
  id v16 = v13;
  BOOL v32 = v8;
  id v28 = v16;
  id v29 = &v33;
  id v30 = &v39;
  int64_t v31 = a5;
  id v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v26, v18, v19);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1B2E75428;
  v25[3] = &unk_1E6013E40;
  v25[4] = &v39;
  v25[5] = &v33;
  objc_msgSend_photosMetadataWithStartDate_endDate_maxEvents_newestFirst_completion_(v20, v21, (uint64_t)v15, (uint64_t)v16, a5, v8, v25);

  uint64_t v22 = (void *)v40[5];
  if (a7 && !v22)
  {
    *a7 = (id) v34[5];
    uint64_t v22 = (void *)v40[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

- (id)contextDataForSource:(id)a3 startDate:(id)a4 endDate:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = sub_1B2E72588;
  v42 = sub_1B2E72598;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_1B2E72588;
  id v36 = sub_1B2E72598;
  id v37 = 0;
  id v13 = GDXPCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v11;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v10;
    _os_log_impl(&dword_1B2996000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: ContextData fetch called [startDate=%@, endDate=%@, source=%@].", buf, 0x20u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1B2E757BC;
  v26[3] = &unk_1E6013DF0;
  id v14 = v11;
  id v27 = v14;
  id v15 = v12;
  id v28 = v15;
  id v16 = v10;
  id v29 = v16;
  id v30 = &v32;
  int64_t v31 = &v38;
  id v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v26, v18, v19);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1B2E758CC;
  v25[3] = &unk_1E6013FC0;
  v25[4] = &v38;
  v25[5] = &v32;
  objc_msgSend_contextDataForSource_startDate_endDate_completion_(v20, v21, (uint64_t)v16, (uint64_t)v14, (uint64_t)v15, v25);

  uint64_t v22 = (void *)v39[5];
  if (a6 && !v22)
  {
    *a6 = (id) v33[5];
    uint64_t v22 = (void *)v39[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v23;
}

- (id)behaviorUnderstandingFeaturizedBehaviorsForFeatureName:(id)a3 behaviorType:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_1B2E72588;
  id v37 = sub_1B2E72598;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B2E72588;
  int64_t v31 = sub_1B2E72598;
  id v32 = 0;
  id v10 = GDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v8;
    __int16 v41 = 2112;
    id v42 = v9;
    _os_log_impl(&dword_1B2996000, v10, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding featurizedBehaviors called [featureName=%@, behaviorType=%@].", buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B2E75C30;
  v22[3] = &unk_1E6013E18;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  uint64_t v25 = &v27;
  id v26 = &v33;
  id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v22, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B2E75D34;
  v21[3] = &unk_1E6013E40;
  void v21[4] = &v33;
  v21[5] = &v27;
  objc_msgSend_behaviorUnderstandingFeaturizedBehaviorsForFeatureName_behaviorType_completion_(v16, v17, (uint64_t)v11, (uint64_t)v12, (uint64_t)v21);

  uint64_t v18 = (void *)v34[5];
  if (a5 && !v18)
  {
    *a5 = (id) v28[5];
    uint64_t v18 = (void *)v34[5];
  }
  id v19 = v18;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (id)behaviorUnderstandingHistogramsOfKind:(id)a3 behaviorType:(id)a4 viewName:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_1B2E72588;
  id v40 = sub_1B2E72598;
  id v41 = 0;
  uint64_t v30 = 0;
  int64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B2E72588;
  uint64_t v34 = sub_1B2E72598;
  id v35 = 0;
  id v13 = GDXPCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v43 = v10;
    __int16 v44 = 2112;
    id v45 = v11;
    _os_log_impl(&dword_1B2996000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding histograms called [kind=%@, behaviorType=%@].", buf, 0x16u);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1B2E760AC;
  v25[3] = &unk_1E6013E18;
  id v14 = v10;
  id v26 = v14;
  id v15 = v11;
  id v27 = v15;
  id v28 = &v30;
  uint64_t v29 = &v36;
  id v19 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v25, v17, v18);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B2E761B0;
  v24[3] = &unk_1E6013E40;
  v24[4] = &v36;
  v24[5] = &v30;
  objc_msgSend_behaviorUnderstandingHistogramsOfKind_behaviorType_viewName_completion_(v19, v20, (uint64_t)v14, (uint64_t)v15, (uint64_t)v12, v24);

  uint64_t v21 = (void *)v37[5];
  if (a6 && !v21)
  {
    *a6 = (id) v31[5];
    uint64_t v21 = (void *)v37[5];
  }
  id v22 = v21;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

- (id)behaviorUnderstandingFeaturizeBehaviorOfType:(id)a3 identifier:(id)a4 usingContextAt:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1B2E72588;
  id v42 = sub_1B2E72598;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_1B2E72588;
  uint64_t v36 = sub_1B2E72598;
  id v37 = 0;
  id v13 = GDXPCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v45 = v10;
    __int16 v46 = 2112;
    id v47 = v11;
    __int16 v48 = 2112;
    id v49 = v12;
    _os_log_impl(&dword_1B2996000, v13, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding featurizeBehavior called [type=%@, identifier=%@, date=%@].", buf, 0x20u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1B2E76544;
  v26[3] = &unk_1E6013DF0;
  id v14 = v10;
  id v27 = v14;
  id v15 = v11;
  id v28 = v15;
  id v16 = v12;
  id v29 = v16;
  uint64_t v30 = &v32;
  int64_t v31 = &v38;
  id v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v26, v18, v19);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1B2E76654;
  v25[3] = &unk_1E6013F88;
  void v25[4] = &v38;
  v25[5] = &v32;
  objc_msgSend_behaviorUnderstandingFeaturizeBehaviorOfType_identifier_usingContextAt_completion_(v20, v21, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, v25);

  id v22 = (void *)v39[5];
  if (a6 && !v22)
  {
    *a6 = (id) v33[5];
    id v22 = (void *)v39[5];
  }
  id v23 = v22;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v23;
}

- (id)behaviorUnderstandingRecentBehaviorsOfType:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_1B2E72588;
  uint64_t v33 = sub_1B2E72598;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1B2E72588;
  id v27 = sub_1B2E72598;
  id v28 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding recentBehaviorsOfType called [type=%@].", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E76978;
  v19[3] = &unk_1E6013DA0;
  id v8 = v6;
  id v20 = v8;
  uint64_t v21 = &v23;
  id v22 = &v29;
  id v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v9, (uint64_t)v19, v10, v11);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E76A74;
  v18[3] = &unk_1E6013DC8;
  v18[4] = &v29;
  v18[5] = &v23;
  objc_msgSend_behaviorUnderstandingRecentBehaviorsOfType_completion_(v12, v13, (uint64_t)v8, (uint64_t)v18, v14);

  id v15 = (void *)v30[5];
  if (a4 && !v15)
  {
    *a4 = (id) v24[5];
    id v15 = (void *)v30[5];
  }
  id v16 = v15;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (BOOL)behaviorUnderstandingDigestWithShouldDigestFeaturizer:(BOOL)a3 shouldDigestSampleGenerator:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B2E72588;
  uint64_t v25 = sub_1B2E72598;
  id v26 = 0;
  id v9 = GDXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding Digest called.", buf, 2u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E76D18;
  v19[3] = &unk_1E6014050;
  void v19[4] = &v21;
  v19[5] = &v27;
  id v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E76DFC;
  v18[3] = &unk_1E6014078;
  v18[4] = &v27;
  v18[5] = &v21;
  objc_msgSend_behaviorUnderstandingDigestWithShouldDigestFeaturizer_shouldDigestSampleGenerator_completion_(v13, v14, v7, v6, (uint64_t)v18);

  int v15 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v15 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v16 = v15 != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (BOOL)behaviorUnderstandingClearAllDataWithShouldClearFeaturizer:(BOOL)a3 shouldClearSampleGenerator:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B2E72588;
  uint64_t v25 = sub_1B2E72598;
  id v26 = 0;
  id v9 = GDXPCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v9, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding ClearAllData called.", buf, 2u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B2E77038;
  v19[3] = &unk_1E6014050;
  void v19[4] = &v21;
  v19[5] = &v27;
  id v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)v19, v11, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E7711C;
  v18[3] = &unk_1E6014078;
  v18[4] = &v27;
  v18[5] = &v21;
  objc_msgSend_behaviorUnderstandingClearAllDataWithShouldClearFeaturizer_shouldClearSampleGenerator_completion_(v13, v14, v7, v6, (uint64_t)v18);

  int v15 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v15 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v16 = v15 != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)behaviorUnderstandingStatusWithError:(id *)a3
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_1B2E72588;
  uint64_t v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: Behavior Understanding Status called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E77374;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  id v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E77460;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_behaviorUnderstandingStatusWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  id v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    id v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)resolveEntityWithRequest:(id)a3 enableSessionLogging:(BOOL)a4 configName:(id)a5 encodedConfig:(id)a6 withError:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (_os_feature_enabled_impl())
  {
    *(void *)uint64_t v33 = 0;
    id v34 = v33;
    uint64_t v35 = 0x3032000000;
    id v36 = sub_1B2E72588;
    uint64_t v37 = sub_1B2E72598;
    id v38 = 0;
    int v15 = GDXPCLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v15, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: resolveEntity called.", buf, 2u);
    }

    *(void *)buf = 0;
    id v28 = buf;
    uint64_t v29 = 0x3032000000;
    id v30 = sub_1B2E72588;
    uint64_t v31 = sub_1B2E72598;
    id v32 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B2E777C8;
    v26[3] = &unk_1E60140A0;
    void v26[4] = buf;
    uint64_t v19 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v26, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B2E77894;
    v25[3] = &unk_1E6013D78;
    void v25[4] = v33;
    v25[5] = buf;
    objc_msgSend_resolveEntityWithRequest_enableSessionLogging_configName_encodedConfig_completion_(v19, v20, (uint64_t)v12, v10, (uint64_t)v13, v14, v25);

    uint64_t v21 = (void *)*((void *)v34 + 5);
    if (a7 && !v21)
    {
      *a7 = *((id *)v28 + 5);
      uint64_t v21 = (void *)*((void *)v34 + 5);
    }
    id v22 = v21;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v33, 8);
  }
  else
  {
    uint64_t v23 = GDXPCLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_1B2996000, v23, OS_LOG_TYPE_DEFAULT, "IntelligencePlatform|NERD is not enabled.", v33, 2u);
    }

    id v22 = 0;
  }

  return v22;
}

- (id)vectorSearchBenchmarkWithConfigFilePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1B2E72588;
  id v30 = sub_1B2E72598;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B2E72588;
  id v24 = sub_1B2E72598;
  id v25 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: vectorSearchBenchmark called.", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E77B6C;
  v18[3] = &unk_1E6014050;
  v18[4] = &v20;
  v18[5] = &v26;
  uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E77C58;
  v17[3] = &unk_1E6013FC0;
  v17[4] = &v26;
  void v17[5] = &v20;
  objc_msgSend_vectorSearchBenchmarkWithConfigFilePath_completion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

  id v14 = (void *)v27[5];
  if (a4 && !v14)
  {
    *a4 = (id) v21[5];
    id v14 = (void *)v27[5];
  }
  id v15 = v14;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);

  return v15;
}

- (id)validateGraph:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1B2E72588;
  uint64_t v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: validateGraph called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E77F18;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E78004;
  v16[3] = &unk_1E6013F88;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_validateGraphWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  uint64_t v13 = (void *)v26[5];
  if (a3 && v13)
  {
    *a3 = (id) v20[5];
    uint64_t v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (BOOL)benchmarkWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: benchmark called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E78290;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E78374;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_benchmarkWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (BOOL)runToMatchingPipelineWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: runToMatchingPipeline called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E78598;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7867C;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_runToMatchingPipelineWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (BOOL)runDeltaUpdatePipelineWithSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B2E72588;
  id v24 = sub_1B2E72598;
  id v25 = 0;
  uint64_t v7 = GDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v7, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: runDeltaUpdatePipeline called.", buf, 2u);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B2E788B8;
  v18[3] = &unk_1E6014050;
  v18[4] = &v20;
  v18[5] = &v26;
  uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v18, v9, v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E7899C;
  v17[3] = &unk_1E6014078;
  v17[4] = &v26;
  void v17[5] = &v20;
  objc_msgSend_runDeltaUpdatePipelineWithSource_completion_(v11, v12, (uint64_t)v6, (uint64_t)v17, v13);

  int v14 = *((unsigned __int8 *)v27 + 24);
  if (a4 && !*((unsigned char *)v27 + 24))
  {
    *a4 = (id) v21[5];
    int v14 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (BOOL)stopPipelineWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: stopPipeline called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E78BC0;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E78CA4;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_stopPipelineWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)triplesQueryWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1B2E72588;
  uint64_t v20 = sub_1B2E72598;
  id v21 = 0;
  id v21 = (id)objc_opt_new();
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: triplesQuery called.", buf, 2u);
  }

  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)&unk_1F0AC23E8, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B2E78E54;
  v14[3] = &unk_1E6013D50;
  v14[4] = &v16;
  objc_msgSend_triplesQueryWithQuery_completion_(v9, v10, (uint64_t)v4, (uint64_t)v14, v11);

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

- (id)statsWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = sub_1B2E72588;
  char v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: stats called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E791B0;
  v17[3] = &unk_1E60140A0;
  v17[4] = &v19;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E7927C;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_statsWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  int v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    int v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (BOOL)clearStatusWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: clearStatus called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E79508;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E795EC;
  v16[3] = &unk_1E6014078;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_clearStatusWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a3 && !*((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (id)statusWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = sub_1B2E72588;
  char v29 = sub_1B2E72598;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B2E72588;
  uint64_t v23 = sub_1B2E72598;
  id v24 = 0;
  v5 = GDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: status called.", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B2E79844;
  v17[3] = &unk_1E6014050;
  v17[4] = &v19;
  void v17[5] = &v25;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B2E79930;
  v16[3] = &unk_1E6013FC0;
  v16[4] = &v25;
  v16[5] = &v19;
  objc_msgSend_statusWithCompletion_(v9, v10, (uint64_t)v16, v11, v12);

  int v13 = (void *)v26[5];
  if (a3 && !v13)
  {
    *a3 = (id) v20[5];
    int v13 = (void *)v26[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_locked_establishConnection(v5, v6, v7, v8, v9);
  int v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5->_connection, v10, (uint64_t)v4, v11, v12);
  objc_sync_exit(v5);

  return v13;
}

- (void)locked_establishConnection
{
  if (!self->_connection)
  {
    v3 = GDXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2996000, v3, OS_LOG_TYPE_DEFAULT, "GDXPCInternalService: establishing connection.", buf, 2u);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, @"com.apple.intelligenceplatform.Internal", 0, v6);
    connection = self->_connection;
    self->_connection = v7;

    objc_msgSend_setRemoteObjectInterface_(self->_connection, v9, (uint64_t)self->_serverInterface, v10, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1F0AE1F30, v13, v14);
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B2E79BA4;
    v22[3] = &unk_1E6014028;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend_setInvalidationHandler_(self->_connection, v15, (uint64_t)v22, v16, v17);
    objc_msgSend_resume(self->_connection, v18, v19, v20, v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dealloc
{
  objc_msgSend_invalidate(self->_connection, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)GDXPCInternalService;
  [(GDXPCInternalService *)&v6 dealloc];
}

- (GDXPCInternalService)init
{
  v34.receiver = self;
  v34.super_class = (Class)GDXPCInternalService;
  v5 = [(GDXPCInternalService *)&v34 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F0B270F8, v3, v4);
    serverInterface = v5->_serverInterface;
    v5->_serverInterface = (NSXPCInterface *)v6;

    uint64_t v8 = v5->_serverInterface;
    uint64_t v9 = (void *)MEMORY[0x1B3EB26F0]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v20 = objc_msgSend_initWithObjects_(v10, v17, v11, v18, v19, v12, v13, v14, v15, v16, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v8, v21, (uint64_t)v20, (uint64_t)sel_statsWithCompletion_, 0, 1);

    uint64_t v22 = v5->_serverInterface;
    id v23 = (void *)MEMORY[0x1B3EB26F0]();
    id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    id v31 = objc_msgSend_initWithObjects_(v24, v28, v25, v29, v30, v26, v27, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v22, v32, (uint64_t)v31, (uint64_t)sel_featureKeys_, 0, 1);
  }
  return v5;
}

@end