@interface ACSENetworkRequestController
- (ACSENetworkRequestController)initWithSession:(id)a3;
- (ACSENetworkRequestController)initWithSession:(id)a3 numberOfSecondsBetweenRetries:(id)a4;
- (void)executeRequest:(id)a3 acceptedStatusCodes:(id)a4 completion:(id)a5;
@end

@implementation ACSENetworkRequestController

- (ACSENetworkRequestController)initWithSession:(id)a3
{
  return [(ACSENetworkRequestController *)self initWithSession:a3 numberOfSecondsBetweenRetries:&unk_26FB3FB20];
}

- (ACSENetworkRequestController)initWithSession:(id)a3 numberOfSecondsBetweenRetries:(id)a4
{
  v6 = (NSURLSession *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)ACSENetworkRequestController;
  v8 = [(ACSENetworkRequestController *)&v13 init];
  session = v8->_session;
  v8->_session = v6;
  v10 = v6;

  numberOfSecondsBetweenRetries = v8->_numberOfSecondsBetweenRetries;
  v8->_numberOfSecondsBetweenRetries = v7;

  return v8;
}

- (void)executeRequest:(id)a3 acceptedStatusCodes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[(NSArray *)self->_numberOfSecondsBetweenRetries copy];
  objc_initWeak(&location, self);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  v12 = [ACSERetryController alloc];
  NSUInteger v13 = [(NSArray *)self->_numberOfSecondsBetweenRetries count];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke;
  v20[3] = &unk_265202460;
  objc_copyWeak(&v26, &location);
  id v14 = v10;
  id v24 = v14;
  v25 = &v27;
  id v15 = v8;
  id v21 = v15;
  id v16 = v9;
  id v22 = v16;
  id v17 = v11;
  id v23 = v17;
  uint64_t v18 = [(ACSERetryController *)v12 initWithMaxNumberOfRetries:v13 block:v20];
  v19 = (void *)v28[5];
  v28[5] = v18;

  [(id)v28[5] executeBlock];
  _Block_object_dispose(&v27, 8);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((void *)WeakRetained + 1);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke_2;
    id v16 = &unk_265202438;
    uint64_t v5 = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    id v19 = v6;
    uint64_t v20 = v7;
    id v18 = *(id *)(a1 + 48);
    id v8 = [v4 dataTaskWithRequest:v5 completionHandler:&v13];
    objc_msgSend(v8, "resume", v13, v14, v15, v16);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [MEMORY[0x263F087E8] forACSEError:0];
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, v10);

    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

void __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "statusCode"));
  LODWORD(v10) = [v10 containsObject:v11];

  if (v10) {
    goto LABEL_2;
  }
  if ([v9 statusCode] == 429 || objc_msgSend(v9, "statusCode") == 503)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = [MEMORY[0x263F087E8] forACSEError:1];
    (*(void (**)(uint64_t, id, id, void *))(v12 + 16))(v12, v19, v9, v13);

    goto LABEL_6;
  }
  unint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) numberOfAttempts] - 1;
  if (v16 >= [*(id *)(a1 + 40) count])
  {
LABEL_2:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_6:
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    goto LABEL_7;
  }
  id v17 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v16];
  uint64_t v18 = [v17 unsignedIntegerValue];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) retryAfterSeconds:v18];
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSecondsBetweenRetries, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end