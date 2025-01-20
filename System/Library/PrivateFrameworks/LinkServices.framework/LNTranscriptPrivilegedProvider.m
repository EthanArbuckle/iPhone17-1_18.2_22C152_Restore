@interface LNTranscriptPrivilegedProvider
- (id)transcriptPublisherWithStreamName:(id)a3 fromDate:(id)a4 error:(id *)a5;
- (id)transcriptPublisherWithStreamName:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7 error:(id *)a8;
- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7;
@end

@implementation LNTranscriptPrivilegedProvider

- (id)transcriptPublisherWithStreamName:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v14 = (__CFString *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__13281;
  v40 = __Block_byref_object_dispose__13282;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__13281;
  v34 = __Block_byref_object_dispose__13282;
  id v35 = 0;
  v18 = [(LNTranscriptProvider *)self connection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke;
  v29[3] = &unk_1E5B3A3E8;
  v29[4] = &v30;
  v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v29];
  v20 = v19;
  if (v14) {
    v21 = v14;
  }
  else {
    v21 = @"System";
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke_3;
  v28[3] = &unk_1E5B3A410;
  v28[4] = &v30;
  v28[5] = &v36;
  [v19 requestReadAccessForStream:v21 reply:v28];

  v22 = (void *)v37[5];
  if (v22)
  {
    v23 = [v22 url];
    v24 = +[LNTranscriptProvider publisherForStream:v23 fromDate:v15 toDate:v16 maxEvents:v17 reversed:v9];
  }
  else
  {
    v25 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = v31[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v26;
      _os_log_impl(&dword_1A4419000, v25, OS_LOG_TYPE_ERROR, "Failed to get transcript %@", buf, 0xCu);
    }

    v24 = 0;
    if (a8) {
      *a8 = (id) v31[5];
    }
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v24;
}

void __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __109__LNTranscriptPrivilegedProvider_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Error when executing requestReadAccessForStream. error: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"LNTranscriptErrorDomain" code:1004 userInfo:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)transcriptPublisherWithStreamName:(id)a3 fromDate:(id)a4 error:(id *)a5
{
  return [(LNTranscriptPrivilegedProvider *)self transcriptPublisherWithStreamName:a3 fromDate:a4 toDate:0 maxEvents:0 reversed:0 error:a5];
}

- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = getLNLogCategoryExecution();
  id v16 = v15;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "donating", "", buf, 2u);
  }

  id v17 = [(LNTranscriptProvider *)self connection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke;
  v24[3] = &unk_1E5B3A578;
  id v18 = v12;
  id v25 = v18;
  id v26 = a3;
  v19 = [v17 remoteObjectProxyWithErrorHandler:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke_1;
  v21[3] = &unk_1E5B3A578;
  id v22 = v18;
  id v23 = a3;
  id v20 = v18;
  [v19 donateActionRecordData:v14 bundleIdentifier:v13 timestamp:v7 writeImmediately:v21 reply:a5];
}

void __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = getLNLogCategoryExecution();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", "", (uint8_t *)&v8, 2u);
  }
}

void __107__LNTranscriptPrivilegedProvider_donateActionRecordData_bundleIdentifier_timestamp_writeImmediately_reply___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = getLNLogCategoryExecution();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", "", (uint8_t *)&v8, 2u);
  }
}

@end