@interface DDCoreRecents
+ (void)addResultToRecents:(id)a3 associatedResults:(id)a4 weight:(id)a5 context:(id)a6 userInitiated:(BOOL)a7;
+ (void)addResultToRecents:(id)a3 eventDate:(id)a4 subject:(id)a5 weight:(id)a6 metadata:(id)a7 userInitiated:(BOOL)a8;
@end

@implementation DDCoreRecents

+ (void)addResultToRecents:(id)a3 eventDate:(id)a4 subject:(id)a5 weight:(id)a6 metadata:(id)a7 userInitiated:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke;
  v23[3] = &unk_1E5A85ED0;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  BOOL v29 = a8;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  _os_activity_initiate(&dword_1A1709000, "Add Data Detectors result to Core Recents", OS_ACTIVITY_FLAG_DEFAULT, v23);
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.datadetectors.AddToRecentsService"];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF557490];
  [v2 setRemoteObjectInterface:v3];

  [v2 resume];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2;
  v15[3] = &unk_1E5A85EA8;
  id v4 = v2;
  id v16 = v4;
  v5 = [v4 remoteObjectProxyWithErrorHandler:v15];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_cold_1((uint64_t)v5);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 72);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7;
  v13[3] = &unk_1E5A85450;
  id v14 = v4;
  id v12 = v4;
  [v5 addResultToRecents:v6 eventDate:v7 subject:v8 weight:v9 metadata:v10 userInitiated:v11 completionBlock:v13];
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2_cold_1((uint64_t)v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7_cold_1();
  }
  return [*(id *)(a1 + 32) invalidate];
}

+ (void)addResultToRecents:(id)a3 associatedResults:(id)a4 weight:(id)a5 context:(id)a6 userInitiated:(BOOL)a7
{
  BOOL v7 = a7;
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v18 category] - 4 >= 0xFFFFFFFE)
  {
    if (!v12
      || (beginDateOfEventResults(v12, v14, 0, 0, 0), (id v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v15 = [v14 objectForKeyedSubscript:@"ReferenceDate"];
    }
    id v16 = [v14 objectForKeyedSubscript:@"EventTitle"];
    id v17 = [v14 objectForKeyedSubscript:@"CoreRecents"];
    [a1 addResultToRecents:v18 eventDate:v15 subject:v16 weight:v13 metadata:v17 userInitiated:v7];
  }
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Got proxy %@", (uint8_t *)&v1, 0xCu);
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Error caught while adding an address to the recents: %@", (uint8_t *)&v1, 0xCu);
}

void __84__DDCoreRecents_addResultToRecents_eventDate_subject_weight_metadata_userInitiated___block_invoke_7_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed adding the result to recents", v0, 2u);
}

@end