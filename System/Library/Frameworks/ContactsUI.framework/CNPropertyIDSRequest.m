@interface CNPropertyIDSRequest
+ (id)sharedWorkQueue;
- (BOOL)cancelled;
- (CNPropertyIDSRequest)initWithPropertyItems:(id)a3 service:(id)a4 postToMainQueue:(BOOL)a5 resultBlock:(id)a6;
- (NSArray)propertyItems;
- (NSString)listenerID;
- (NSString)service;
- (id)idQueryResultHandler;
- (id)requestResultBlock;
- (void)_requestStatusOnMainQueue:(BOOL)a3;
- (void)cancel;
- (void)cleanupDelegate;
- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4;
- (void)setIdQueryResultHandler:(id)a3;
- (void)setListenerID:(id)a3;
- (void)setPropertyItems:(id)a3;
- (void)setRequestResultBlock:(id)a3;
- (void)setService:(id)a3;
@end

@implementation CNPropertyIDSRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idQueryResultHandler, 0);
  objc_storeStrong(&self->_requestResultBlock, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);

  objc_storeStrong((id *)&self->_propertyItems, 0);
}

- (void)setIdQueryResultHandler:(id)a3
{
}

- (id)idQueryResultHandler
{
  return self->_idQueryResultHandler;
}

- (void)setRequestResultBlock:(id)a3
{
}

- (id)requestResultBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setService:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setListenerID:(id)a3
{
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- (void)setPropertyItems:(id)a3
{
}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (void)_requestStatusOnMainQueue:(BOOL)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v41 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(CNPropertyIDSRequest *)self propertyItems];
  uint64_t v3 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v49 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v7 = [v6 labeledValue];
        v8 = [v7 value];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = (uint64_t (*)(void *, void *, uint64_t))softLinkIDSCopyIDForPhoneNumberWithOptions[0];
          id v10 = v8;
          v11 = [v10 digits];
          v12 = [v10 countryCode];

          v13 = (void *)v9(v11, v12, 1);
          if (!v13) {
            goto LABEL_12;
          }
LABEL_8:
          [v41 setObject:v6 forKeyedSubscript:v13];

          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v8 _appearsToBeEmail])
          {
            v13 = (void *)((uint64_t (*)(void *))softLinkIDSCopyIDForEmailAddress[0])(v8);
            if (v13) {
              goto LABEL_8;
            }
          }
        }
LABEL_12:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v3);
  }

  if ([v41 count])
  {
    v14 = [v41 allKeys];
    v15 = [v14 componentsJoinedByString:@", "];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 126, 6, @"Querying IDS for handles: [%@]", v16, v17, v18, v19, (uint64_t)v15);

    objc_initWeak(&location, self);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke;
    v43[3] = &unk_1E5498190;
    objc_copyWeak(&v45, &location);
    id v20 = v41;
    id v44 = v20;
    BOOL v46 = a3;
    [(CNPropertyIDSRequest *)self setIdQueryResultHandler:v43];
    v21 = [v20 allKeys];
    v22 = [v21 componentsJoinedByString:@", "];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 193, 6, @"Querying IDS for handles: [%@]", v23, v24, v25, v26, (uint64_t)v22);

    v27 = [(objc_class *)getIDSIDQueryControllerClass_22784() sharedInstance];
    v28 = [v20 allKeys];
    v29 = [(CNPropertyIDSRequest *)self service];
    v30 = [(CNPropertyIDSRequest *)self listenerID];
    v31 = [(id)objc_opt_class() sharedWorkQueue];
    v32 = [(CNPropertyIDSRequest *)self idQueryResultHandler];
    char v33 = [v27 refreshIDStatusForDestinations:v28 service:v29 listenerID:v30 queue:v31 completionBlock:v32];

    if ((v33 & 1) == 0) {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 202, 6, @"Failed to query IDS for handles", v34, v35, v36, v37, v38);
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
}

void __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained cancelled] & 1) == 0)
  {
    uint64_t v5 = [v3 count];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 132, 6, @"Received %u IDS responses", v6, v7, v8, v9, v5);
    v40 = [MEMORY[0x1E4F1CA48] array];
    v39 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = [v3 allKeys];
    uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
          uint64_t v16 = [WeakRetained propertyItems];
          int v17 = [v16 containsObject:v15];

          if (v17)
          {
            uint64_t v18 = [v3 objectForKeyedSubscript:v14];
            uint64_t v19 = [v18 integerValue];

            if (v19 == 1)
            {
              id v20 = [WeakRetained service];
              _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 142, 6, @"%@: IDS %@ valid", v21, v22, v23, v24, (uint64_t)v20);

              [v40 addObject:v15];
            }
            else
            {
              uint64_t v25 = WeakRetained;
              uint64_t v26 = a1;
              id v27 = v3;
              v28 = [v3 objectForKeyedSubscript:v14];
              uint64_t v29 = [v28 integerValue];

              v30 = v25;
              uint64_t v31 = [v25 service];
              uint64_t v36 = (void *)v31;
              if (v29 == 2)
              {
                _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 145, 6, @"%@: IDS %@ invalid", v32, v33, v34, v35, v31);

                [v39 addObject:v15];
              }
              else
              {
                _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyIDSRequest.m", 148, 6, @"%@: IDS %@ unknown", v32, v33, v34, v35, v31);
              }
              id v3 = v27;
              a1 = v26;
              id WeakRetained = v30;
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v11);
    }

    if ([v40 count] || objc_msgSend(v39, "count"))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke_2;
      aBlock[3] = &unk_1E549B800;
      aBlock[4] = WeakRetained;
      id v43 = v40;
      id v44 = v39;
      uint64_t v37 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v38 = v37;
      if (*(unsigned char *)(a1 + 48)) {
        dispatch_async(MEMORY[0x1E4F14428], v37);
      }
      else {
        v37[2](v37);
      }
    }
  }
  [WeakRetained cleanupDelegate];
}

uint64_t __50__CNPropertyIDSRequest__requestStatusOnMainQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) requestResultBlock];
  if (([*(id *)(a1 + 32) cancelled] & 1) == 0 && v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }

  return MEMORY[0x1F4181870]();
}

- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(CNPropertyIDSRequest *)self service];
  int v8 = [v6 isEqualToString:v7];

  uint64_t v9 = v12;
  if (v8)
  {
    uint64_t v10 = [(CNPropertyIDSRequest *)self idQueryResultHandler];
    uint64_t v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v12);
    }

    uint64_t v9 = v12;
  }
}

- (BOOL)cancelled
{
  v2 = [(CNPropertyIDSRequest *)self requestResultBlock];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)cancel
{
  BOOL v3 = [(id)objc_opt_class() sharedWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CNPropertyIDSRequest_cancel__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(v3, block);

  [(CNPropertyIDSRequest *)self setRequestResultBlock:0];
  [(CNPropertyIDSRequest *)self setIdQueryResultHandler:0];
}

uint64_t __30__CNPropertyIDSRequest_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupDelegate];
}

- (void)cleanupDelegate
{
  id v5 = [(objc_class *)getIDSIDQueryControllerClass_22784() sharedInstance];
  BOOL v3 = [(CNPropertyIDSRequest *)self service];
  uint64_t v4 = [(CNPropertyIDSRequest *)self listenerID];
  [v5 removeDelegate:self forService:v3 listenerID:v4];
}

- (CNPropertyIDSRequest)initWithPropertyItems:(id)a3 service:(id)a4 postToMainQueue:(BOOL)a5 resultBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNPropertyIDSRequest;
  v13 = [(CNPropertyIDSRequest *)&v21 init];
  uint64_t v14 = v13;
  if (v13)
  {
    [(CNPropertyIDSRequest *)v13 setPropertyItems:v10];
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"CNPropertyIDSRequestListenerID_%lx", v14);
    [(CNPropertyIDSRequest *)v14 setListenerID:v15];

    [(CNPropertyIDSRequest *)v14 setService:v11];
    [(CNPropertyIDSRequest *)v14 setRequestResultBlock:v12];
    uint64_t v16 = [(id)objc_opt_class() sharedWorkQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__CNPropertyIDSRequest_initWithPropertyItems_service_postToMainQueue_resultBlock___block_invoke;
    block[3] = &unk_1E5499510;
    uint64_t v19 = v14;
    BOOL v20 = a5;
    dispatch_async(v16, block);
  }
  return v14;
}

void __82__CNPropertyIDSRequest_initWithPropertyItems_service_postToMainQueue_resultBlock___block_invoke(uint64_t a1)
{
  id v6 = [(objc_class *)getIDSIDQueryControllerClass_22784() sharedInstance];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 service];
  uint64_t v4 = [*(id *)(a1 + 32) listenerID];
  id v5 = [(id)objc_opt_class() sharedWorkQueue];
  [v6 addDelegate:v2 forService:v3 listenerID:v4 queue:v5];

  [*(id *)(a1 + 32) _requestStatusOnMainQueue:*(unsigned __int8 *)(a1 + 40)];
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken != -1) {
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_22829);
  }
  v2 = (void *)sharedWorkQueue_sharedQueue;

  return v2;
}

void __39__CNPropertyIDSRequest_sharedWorkQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.contacts.ContactsUI.CNPropertyIDSRequest.workQueue", v2);
  v1 = (void *)sharedWorkQueue_sharedQueue;
  sharedWorkQueue_sharedQueue = (uint64_t)v0;
}

@end