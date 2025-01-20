@interface CNCoreSpotlightSearch
+ (id)_runQuery:(id)a3 timeout:(double)a4 error:(id *)a5;
+ (id)executeQuery:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 fetchAttributes:(id)a6 error:(id *)a7;
@end

@implementation CNCoreSpotlightSearch

+ (id)executeQuery:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 fetchAttributes:(id)a6 error:(id *)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)MEMORY[0x192FD3A40]();
  getCSSearchQueryContextClass();
  v16 = objc_opt_new();
  v26[0] = v12;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v16 setProtectionClasses:v17];

  id v25 = v13;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v16 setBundleIDs:v18];

  [v16 setFetchAttributes:v14];
  v19 = (void *)[objc_alloc(getCSSearchQueryClass()) initWithQueryString:v11 context:v16];
  if (v19)
  {
    id v24 = 0;
    v20 = +[CNCoreSpotlightSearch _runQuery:v19 timeout:&v24 error:120.0];
    id v21 = v24;
  }
  else
  {
    id v21 = 0;
    v20 = 0;
  }

  if (v21)
  {
    id v22 = 0;
    if (a7) {
      *a7 = v21;
    }
  }
  else
  {
    id v22 = v20;
  }

  return v22;
}

+ (id)_runQuery:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = objc_opt_new();
  dispatch_group_t v9 = dispatch_group_create();
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__17;
  v26 = __Block_byref_object_dispose__17;
  id v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke;
  v20[3] = &unk_1E56B66F8;
  id v10 = v8;
  id v21 = v10;
  [v7 setFoundItemsHandler:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke_2;
  v17[3] = &unk_1E56B6720;
  v19 = &v22;
  id v11 = v9;
  v18 = v11;
  [v7 setCompletionHandler:v17];
  dispatch_group_enter(v11);
  [v7 start];
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  if (dispatch_group_wait(v11, v12))
  {
    [v7 cancel];
    CNSetError(a5, 1001, 0);
  }
  else if (a5)
  {
    v16 = (void *)v23[5];
    if (v16) {
      *a5 = (id)[v16 copy];
    }
  }
  id v13 = v18;
  id v14 = v10;

  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

void __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end