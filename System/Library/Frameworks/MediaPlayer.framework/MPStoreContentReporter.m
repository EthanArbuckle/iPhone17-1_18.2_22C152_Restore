@interface MPStoreContentReporter
+ (MPStoreContentReporter)sharedReporter;
- (MPStoreContentReporter)init;
- (id)_deleteCommentURLComponentsFromBag:(id)a3;
- (id)_deletePostURLComponentsFromBag:(id)a3;
- (id)_dictionariesForType:(int64_t)a3;
- (id)_reportConcernBagDictionary;
- (id)baseURLStringForReport;
- (id)reportsForType:(int64_t)a3 contentID:(id)a4 aucType:(id)a5 commentText:(id)a6;
- (void)_performWithBag:(id)a3;
- (void)deleteComment:(id)a3 activityID:(id)a4 completion:(id)a5;
- (void)deletePost:(id)a3 completion:(id)a4;
- (void)submitReport:(id)a3 completion:(id)a4;
@end

@implementation MPStoreContentReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernBagDictionary, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (id)_deletePostURLComponentsFromBag:(id)a3
{
  v3 = [a3 dictionaryForBagKey:*MEMORY[0x1E4FB8550]];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F29088];
    v6 = [v3 objectForKey:@"deleteSocialPost"];
    v7 = [v5 componentsWithString:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_deleteCommentURLComponentsFromBag:(id)a3
{
  v3 = [a3 dictionaryForBagKey:*MEMORY[0x1E4FB8550]];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4F29088];
    v6 = [v3 objectForKey:@"deleteComment"];
    v7 = [v5 componentsWithString:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_reportConcernBagDictionary
{
  p_reportConcernBagDictionary = &self->_reportConcernBagDictionary;
  reportConcernBagDictionary = self->_reportConcernBagDictionary;
  if (!reportConcernBagDictionary)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__50782;
    v15 = __Block_byref_object_dispose__50783;
    id v16 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__MPStoreContentReporter__reportConcernBagDictionary__block_invoke;
    v8[3] = &unk_1E57F8C10;
    v10 = &v11;
    v6 = v5;
    v9 = v6;
    [(MPStoreContentReporter *)self _performWithBag:v8];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)p_reportConcernBagDictionary, (id)v12[5]);

    _Block_object_dispose(&v11, 8);
    reportConcernBagDictionary = *p_reportConcernBagDictionary;
  }

  return reportConcernBagDictionary;
}

void __53__MPStoreContentReporter__reportConcernBagDictionary__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 dictionaryForBagKey:*MEMORY[0x1E4FB8548]];
  id v5 = v3;
  if (v3)
  {
    v4 = [v3 objectForKey:@"reportConcern"];
    if (_NSIsNSDictionary()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_dictionariesForType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
  {
    id v5 = 0;
  }
  else
  {
    v3 = off_1E57F8CB8[a3];
    v4 = [(MPStoreContentReporter *)self _reportConcernBagDictionary];
    id v5 = [v4 objectForKey:v3];
  }

  return v5;
}

- (id)baseURLStringForReport
{
  v2 = [(MPStoreContentReporter *)self _reportConcernBagDictionary];
  v3 = [v2 objectForKey:@"url"];

  return v3;
}

- (id)reportsForType:(int64_t)a3 contentID:(id)a4 aucType:(id)a5 commentText:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(MPStoreContentReporter *)self _dictionariesForType:a3];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v19 = [v18 objectForKey:@"label"];
        v20 = [v18 objectForKey:@"id"];
        v21 = objc_alloc_init(MPStoreContentReport);
        [(MPStoreContentReport *)v21 setConcernItemType:a3];
        [(MPStoreContentReport *)v21 setConcernTypeID:v20];
        [(MPStoreContentReport *)v21 setDisplayText:v19];
        [(MPStoreContentReport *)v21 setContentID:v24];
        [(MPStoreContentReport *)v21 setAucType:v10];
        [(MPStoreContentReport *)v21 setCommentText:v11];
        [v13 addObject:v21];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  return v13;
}

- (void)_performWithBag:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4FB8758]);
  id v5 = [MEMORY[0x1E4FB87B8] activeAccount];
  v6 = (void *)[v4 initWithIdentity:v5];

  v7 = [MEMORY[0x1E4FB8788] sharedBagProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MPStoreContentReporter__performWithBag___block_invoke;
  v9[3] = &unk_1E57F8BE8;
  id v10 = v3;
  id v8 = v3;
  [v7 getBagForRequestContext:v6 withCompletionHandler:v9];
}

uint64_t __42__MPStoreContentReporter__performWithBag___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)deletePost:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MPStoreContentReporter_deletePost_completion___block_invoke;
  v10[3] = &unk_1E57F8BC0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPStoreContentReporter *)self _performWithBag:v10];
}

void __48__MPStoreContentReporter_deletePost_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _deletePostURLComponentsFromBag:v4];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [v5 queryItems];
  id v8 = [v6 arrayWithArray:v7];

  id v9 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@"sa." withString:&stru_1EE680640];
  id v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"activity" value:v9];
  [v8 addObject:v10];
  [v5 setQueryItems:v8];
  id v11 = [v5 URL];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__MPStoreContentReporter_deletePost_completion___block_invoke_2;
  v13[3] = &unk_1E57F8B98;
  id v14 = *(id *)(a1 + 48);
  id v12 = MPStoreContentReporterURLOperation(v11, 0, v13);

  [*(id *)(*(void *)(a1 + 32) + 8) addOperation:v12];
}

uint64_t __48__MPStoreContentReporter_deletePost_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteComment:(id)a3 activityID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke;
  v11[3] = &unk_1E57F8BC0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(MPStoreContentReporter *)self _performWithBag:v11];
}

void __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _deleteCommentURLComponentsFromBag:v4];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [v5 queryItems];
  id v8 = [v6 arrayWithArray:v7];

  id v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"commentId" value:*(void *)(a1 + 40)];
  [v8 addObject:v9];
  [v5 setQueryItems:v8];
  id v10 = [v5 URL];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke_2;
  v12[3] = &unk_1E57F8B98;
  id v13 = *(id *)(a1 + 48);
  id v11 = MPStoreContentReporterURLOperation(v10, 1, v12);

  [*(id *)(*(void *)(a1 + 32) + 8) addOperation:v11];
}

uint64_t __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitReport:(id)a3 completion:(id)a4
{
  v54[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v41 = a4;
  v42 = self;
  id v7 = (void *)MEMORY[0x1E4F29088];
  id v8 = [(MPStoreContentReporter *)self baseURLStringForReport];
  id v9 = [v7 componentsWithString:v8];

  id v10 = (void *)MEMORY[0x1E4F1CA48];
  v43 = v9;
  id v11 = [v9 queryItems];
  id v12 = [v10 arrayWithArray:v11];

  id v13 = (void *)MEMORY[0x1E4F1CA60];
  v53[0] = @"activity";
  id v14 = [v6 contentID];
  v54[0] = v14;
  v53[1] = @"concernItemType";
  unint64_t v15 = [v6 concernItemType];
  uint64_t v16 = &stru_1EE680640;
  if (v15 <= 6) {
    uint64_t v16 = off_1E57F8C80[v15];
  }
  v54[1] = v16;
  v53[2] = @"concernTypeId";
  v17 = [v6 concernTypeID];
  v54[2] = v17;
  v53[3] = @"concernItemId";
  v18 = [v6 contentID];
  v54[3] = v18;
  v53[4] = @"commentText";
  uint64_t v19 = [v6 commentText];
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = &stru_1EE680640;
  }
  v54[4] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:5];
  v23 = [v13 dictionaryWithDictionary:v22];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v30 = (void *)MEMORY[0x1E4F290C8];
        v31 = [v24 objectForKey:v29];
        v32 = [v30 queryItemWithName:v29 value:v31];

        [v12 addObject:v32];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v26);
  }

  v33 = [v6 aucType];
  uint64_t v34 = [v33 length];

  if (v34)
  {
    v35 = (void *)MEMORY[0x1E4F290C8];
    v36 = [v6 aucType];
    v37 = [v35 queryItemWithName:@"concernItemAUCType" value:v36];

    [v12 addObject:v37];
  }
  [v43 setQueryItems:v12];
  v38 = [v43 URL];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __50__MPStoreContentReporter_submitReport_completion___block_invoke;
  v44[3] = &unk_1E57F8BC0;
  v46 = v42;
  id v47 = v41;
  id v45 = v38;
  id v39 = v41;
  id v40 = v38;
  [(MPStoreContentReporter *)v42 _performWithBag:v44];
}

void __50__MPStoreContentReporter_submitReport_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MPStoreContentReporter_submitReport_completion___block_invoke_2;
  v4[3] = &unk_1E57F8B98;
  id v5 = *(id *)(a1 + 48);
  id v3 = MPStoreContentReporterURLOperation(v2, 0, v4);
  [*(id *)(*(void *)(a1 + 40) + 8) addOperation:v3];
}

uint64_t __50__MPStoreContentReporter_submitReport_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (MPStoreContentReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPStoreContentReporter;
  v2 = [(MPStoreContentReporter *)&v6 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.MediaPlayer.MPStoreContentReporter.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
  }
  return v2;
}

+ (MPStoreContentReporter)sharedReporter
{
  if (sharedReporter_isDispatched_50940 != -1) {
    dispatch_once(&sharedReporter_isDispatched_50940, &__block_literal_global_50941);
  }
  v2 = (void *)sharedReporter_sharedInstance_50942;

  return (MPStoreContentReporter *)v2;
}

void __40__MPStoreContentReporter_sharedReporter__block_invoke()
{
  v0 = objc_alloc_init(MPStoreContentReporter);
  v1 = (void *)sharedReporter_sharedInstance_50942;
  sharedReporter_sharedInstance_50942 = (uint64_t)v0;
}

@end