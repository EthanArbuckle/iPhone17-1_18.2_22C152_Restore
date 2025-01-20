@interface MPMediaKitContentReporter
+ (MPMediaKitContentReporter)sharedReporter;
- (MPMediaKitContentReporter)init;
- (id)_dictionariesForType:(int64_t)a3;
- (id)_reportConcernBagDictionary;
- (id)contentReportKindStringForType:(int64_t)a3;
- (id)contentReportTypeStringForType:(int64_t)a3;
- (id)contentReporterURLOperation:(id)a3 bodyData:(id)a4 withCompletion:(id)a5;
- (id)reportsForType:(int64_t)a3 contentID:(id)a4 commentText:(id)a5 concernParentItemID:(id)a6 concernParentItemType:(id)a7;
- (id)urlLoadRequestWithRequest:(id)a3 requestContext:(id)a4;
- (void)_performWithBag:(id)a3;
- (void)submitReport:(id)a3 body:(id)a4 completion:(id)a5;
- (void)submitReport:(id)a3 completion:(id)a4;
@end

@implementation MPMediaKitContentReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contentReporterURLOperation, 0);
  objc_storeStrong((id *)&self->contentReportTypeStringForType, 0);
  objc_storeStrong((id *)&self->contentReportKindStringForType, 0);
  objc_storeStrong((id *)&self->_reportConcernBagDictionary, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (id)urlLoadRequestWithRequest:(id)a3 requestContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 clientInfo];
  v8 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v9 = (void *)MEMORY[0x1E4FB85B0];
  v10 = [v7 clientIdentifier];
  v11 = [v7 clientVersion];
  v12 = [v9 clientInfoForMusicKitRequestWithClientIdentifier:v10 clientVersion:v11 bundleIdentifier:v8];

  id v13 = objc_alloc(MEMORY[0x1E4FB8660]);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __70__MPMediaKitContentReporter_urlLoadRequestWithRequest_requestContext___block_invoke;
  v23 = &unk_1E57F85E8;
  id v24 = v12;
  id v25 = v5;
  id v14 = v5;
  id v15 = v12;
  v16 = (void *)[v13 initWithBlock:&v20];
  id v17 = objc_alloc(MEMORY[0x1E4FB8668]);
  v18 = objc_msgSend(v17, "initWithURLRequest:requestContext:", v6, v16, v20, v21, v22, v23);

  return v18;
}

void __70__MPMediaKitContentReporter_urlLoadRequestWithRequest_requestContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setClientInfo:v3];
  id v5 = [*(id *)(a1 + 40) identity];
  [v4 setIdentity:v5];
}

- (id)contentReporterURLOperation:(id)a3 bodyData:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4FB85A0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke;
  v17[3] = &unk_1E57F85C0;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = self;
  id v21 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = (void *)[v11 initWithStartHandler:v17];

  return v15;
}

void __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:*(void *)(a1 + 32)];
  [v4 setHTTPBody:*(void *)(a1 + 40)];
  [v4 setHTTPMethod:@"POST"];
  [v4 addValue:@"application/json" forHTTPHeaderField:*MEMORY[0x1E4FB8418]];
  id v5 = [MEMORY[0x1E4FB85B0] clientInfoForMusicKitRequestWithClientIdentifier:@"com.apple.Music" clientVersion:@"1"];
  id v6 = objc_alloc(MEMORY[0x1E4FB8758]);
  v7 = [MEMORY[0x1E4FB87B8] activeAccount];
  id v8 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v9 = (void *)[v6 initWithIdentity:v7 identityStore:v8 clientInfo:v5];

  id v10 = [*(id *)(a1 + 48) urlLoadRequestWithRequest:v4 requestContext:v9];
  id v11 = [MEMORY[0x1E4FB87A8] defaultSession];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke_2;
  v14[3] = &unk_1E57F8C38;
  id v12 = *(id *)(a1 + 56);
  id v15 = v3;
  id v16 = v12;
  id v13 = v3;
  [v11 enqueueDataRequest:v10 withCompletionHandler:v14];
}

void __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 parsedBodyDictionary];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (id)contentReportTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return &stru_1EE680640;
  }
  else {
    return off_1E57F8668[a3];
  }
}

- (id)contentReportKindStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return &stru_1EE680640;
  }
  else {
    return off_1E57F8638[a3];
  }
}

- (id)_reportConcernBagDictionary
{
  p_reportConcernBagDictionary = &self->_reportConcernBagDictionary;
  reportConcernBagDictionary = self->_reportConcernBagDictionary;
  if (!reportConcernBagDictionary)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__50101;
    id v15 = __Block_byref_object_dispose__50102;
    id v16 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__MPMediaKitContentReporter__reportConcernBagDictionary__block_invoke;
    v8[3] = &unk_1E57F8C10;
    id v10 = &v11;
    id v6 = v5;
    id v9 = v6;
    [(MPMediaKitContentReporter *)self _performWithBag:v8];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)p_reportConcernBagDictionary, (id)v12[5]);

    _Block_object_dispose(&v11, 8);
    reportConcernBagDictionary = *p_reportConcernBagDictionary;
  }

  return reportConcernBagDictionary;
}

void __56__MPMediaKitContentReporter__reportConcernBagDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 dictionaryForBagKey:*MEMORY[0x1E4FB8548]];
  id v5 = v3;
  if (v3)
  {
    id v4 = [v3 objectForKey:@"reportConcern"];
    if (_NSIsNSDictionary()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_dictionariesForType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    id v5 = 0;
  }
  else
  {
    id v3 = off_1E57F8608[a3];
    id v4 = [(MPMediaKitContentReporter *)self _reportConcernBagDictionary];
    id v5 = [v4 objectForKey:v3];
  }

  return v5;
}

- (id)reportsForType:(int64_t)a3 contentID:(id)a4 commentText:(id)a5 concernParentItemID:(id)a6 concernParentItemType:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v26 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(MPMediaKitContentReporter *)self _dictionariesForType:a3];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v21 = [v20 objectForKey:@"label"];
        v22 = [v20 objectForKey:@"id"];
        v23 = objc_alloc_init(MPMediaKitContentReport);
        [(MPMediaKitContentReport *)v23 setConcernItemType:a3];
        [(MPMediaKitContentReport *)v23 setConcernTypeID:v22];
        [(MPMediaKitContentReport *)v23 setDisplayText:v21];
        [(MPMediaKitContentReport *)v23 setCommentText:v26];
        [(MPMediaKitContentReport *)v23 setConcernItemID:v27];
        [(MPMediaKitContentReport *)v23 setParentContentID:v12];
        [(MPMediaKitContentReport *)v23 setParentConcernType:v13];
        [v15 addObject:v23];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  return v15;
}

- (void)_performWithBag:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4FB8758]);
  id v5 = [MEMORY[0x1E4FB87B8] activeAccount];
  id v6 = (void *)[v4 initWithIdentity:v5];

  v7 = [MEMORY[0x1E4FB8788] sharedBagProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MPMediaKitContentReporter__performWithBag___block_invoke;
  v9[3] = &unk_1E57F8BE8;
  id v10 = v3;
  id v8 = v3;
  [v7 getBagForRequestContext:v6 withCompletionHandler:v9];
}

uint64_t __45__MPMediaKitContentReporter__performWithBag___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)submitReport:(id)a3 body:(id)a4 completion:(id)a5
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v36 = a5;
  v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  v44[0] = @"kind";
  uint64_t v11 = -[MPMediaKitContentReporter contentReportKindStringForType:](self, "contentReportKindStringForType:", [v8 concernItemType]);
  v45[0] = v11;
  v44[1] = @"reason";
  id v12 = [v8 concernTypeID];
  v45[1] = v12;
  v44[2] = @"comments";
  uint64_t v13 = [v8 commentText];
  id v14 = (void *)v13;
  id v15 = &stru_1EE680640;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  v45[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
  uint64_t v17 = [v10 dictionaryWithDictionary:v16];

  uint64_t v18 = (void *)MEMORY[0x1E4F1CA60];
  v42[0] = @"id";
  id v19 = [v8 concernItemID];
  v42[1] = @"type";
  v43[0] = v19;
  uint64_t v20 = -[MPMediaKitContentReporter contentReportTypeStringForType:](self, "contentReportTypeStringForType:", [v8 concernItemType]);
  v43[1] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  v22 = [v18 dictionaryWithDictionary:v21];

  v23 = v9;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v9)
  {
    id v25 = v9;
    id v26 = v35;
  }
  else
  {
    uint64_t v27 = [v8 parentContentID];
    id v26 = v35;
    if (v27)
    {
      long long v28 = (void *)v27;
      long long v29 = [v8 parentConcernType];

      if (v29)
      {
        long long v30 = [v8 parentContentID];
        [v24 setObject:v30 forKeyedSubscript:@"id"];

        long long v31 = [v8 parentConcernType];
        [v24 setObject:v31 forKeyedSubscript:@"type"];

        [v35 addObject:v24];
      }
    }
    [v35 addObject:v22];
    v40[0] = @"concern";
    v40[1] = @"contents";
    v41[0] = v17;
    v41[1] = v35;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    id v25 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v32 options:0 error:0];

    v23 = 0;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke;
  v37[3] = &unk_1E57F8BC0;
  v37[4] = self;
  id v38 = v25;
  id v39 = v36;
  id v33 = v36;
  id v34 = v25;
  [(MPMediaKitContentReporter *)self _performWithBag:v37];
}

void __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4FB8530];
  id v4 = a2;
  id v5 = [v4 stringForBagKey:v3];
  id v6 = [v4 dictionaryForBagKey:*MEMORY[0x1E4FB8520]];

  v7 = objc_msgSend(v6, "ic_stringValueForKey:", @"default");
  id v8 = [NSString stringWithFormat:@"https://%@/v1/catalog/%@/concerns", v7, v5];
  id v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke_2;
  v13[3] = &unk_1E57F8B98;
  id v14 = *(id *)(a1 + 48);
  id v12 = [v10 contentReporterURLOperation:v9 bodyData:v11 withCompletion:v13];
  [*(id *)(*(void *)(a1 + 32) + 8) addOperation:v12];
}

uint64_t __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)submitReport:(id)a3 completion:(id)a4
{
}

- (MPMediaKitContentReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPMediaKitContentReporter;
  v2 = [(MPMediaKitContentReporter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.MediaPlayer.MPMediaKitContentReporter.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
  }
  return v2;
}

+ (MPMediaKitContentReporter)sharedReporter
{
  if (sharedReporter_isDispatched != -1) {
    dispatch_once(&sharedReporter_isDispatched, &__block_literal_global_50228);
  }
  v2 = (void *)sharedReporter_sharedInstance;

  return (MPMediaKitContentReporter *)v2;
}

void __43__MPMediaKitContentReporter_sharedReporter__block_invoke()
{
  v0 = objc_alloc_init(MPMediaKitContentReporter);
  v1 = (void *)sharedReporter_sharedInstance;
  sharedReporter_sharedInstance = (uint64_t)v0;
}

@end