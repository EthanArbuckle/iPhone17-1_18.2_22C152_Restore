@interface AMSUIWebEngagementAction
- (AMSUIWebEngagementAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSArray)messagePlacements;
- (NSDictionary)event;
- (NSString)messageServiceType;
- (id)_resultFromMessageResponse:(id)a3;
- (id)runAction;
@end

@implementation AMSUIWebEngagementAction

- (AMSUIWebEngagementAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebEngagementAction;
  v7 = [(AMSUIWebAction *)&v20 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"event"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    event = v7->_event;
    v7->_event = v9;

    v11 = [v6 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (v12)
    {
      v13 = [v12 objectForKeyedSubscript:@"serviceType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }

      messageServiceType = v7->_messageServiceType;
      v7->_messageServiceType = v14;

      v16 = [v12 objectForKeyedSubscript:@"placements"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }

      messagePlacements = v7->_messagePlacements;
      v7->_messagePlacements = v17;
    }
  }

  return v7;
}

- (id)runAction
{
  v27[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F27C28]);
  v4 = [(AMSUIWebEngagementAction *)self messageServiceType];
  if (v4)
  {
    v5 = [(AMSUIWebEngagementAction *)self messagePlacements];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F27C38]);
      v8 = [(AMSUIWebEngagementAction *)self messageServiceType];
      v9 = (void *)MEMORY[0x263EFFA08];
      v10 = [(AMSUIWebEngagementAction *)self messagePlacements];
      v11 = [v9 setWithArray:v10];
      id v12 = (void *)[v7 initWithServiceType:v8 placements:v11];

      v13 = [v3 enqueueMessageEvent:v12];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __37__AMSUIWebEngagementAction_runAction__block_invoke;
      v26[3] = &unk_2643E4D10;
      v26[4] = self;
      v4 = [v13 thenWithBlock:v26];
    }
    else
    {
      v4 = 0;
    }
  }
  v14 = [(AMSUIWebEngagementAction *)self event];

  if (v14)
  {
    v15 = [(AMSUIWebEngagementAction *)self event];
    v16 = [v3 enqueueData:v15];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __37__AMSUIWebEngagementAction_runAction__block_invoke_2;
    v25[3] = &unk_2643E4D38;
    v25[4] = self;
    v17 = [v16 thenWithBlock:v25];
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)MEMORY[0x263F27E10];
  v19 = v4;
  if (!v4)
  {
    v19 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA78]];
  }
  v27[0] = v19;
  objc_super v20 = v17;
  if (!v17)
  {
    objc_super v20 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA78]];
  }
  v27[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v22 = [v18 promiseWithAll:v21];

  if (v17)
  {
    if (v4) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_14;
    }
  }

LABEL_14:
  v23 = [v22 thenWithBlock:&__block_literal_global_21];

  return v23;
}

id __37__AMSUIWebEngagementAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "messageActions", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(a1 + 32) _resultFromMessageResponse:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v11 setObject:v4 forKeyedSubscript:@"messageActions"];
  id v12 = [MEMORY[0x263F27E10] promiseWithResult:v11];

  return v12;
}

id __37__AMSUIWebEngagementAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 actions];
  [v5 setObject:v6 forKeyedSubscript:@"actions"];

  uint64_t v7 = [v4 data];
  [v5 setObject:v7 forKeyedSubscript:@"data"];

  uint64_t v8 = [v4 request];

  v9 = [*(id *)(a1 + 32) context];
  v10 = [v8 generateWebExportWithContext:v9];
  [v5 setObject:v10 forKeyedSubscript:@"engagementRequest"];

  id v11 = [MEMORY[0x263F27E10] promiseWithResult:v5];

  return v11;
}

id __37__AMSUIWebEngagementAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __37__AMSUIWebEngagementAction_runAction__block_invoke_4;
        v12[3] = &unk_2643E3AF0;
        id v13 = v3;
        [v9 enumerateKeysAndObjectsUsingBlock:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x263F27E10] promiseWithResult:v3];

  return v10;
}

uint64_t __37__AMSUIWebEngagementAction_runAction__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (id)_resultFromMessageResponse:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263EFF9A0];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    uint64_t v7 = [v5 fullScreenMessageRequest];
    uint64_t v8 = [v7 makeDialogRequest];
    v9 = [v8 generateWebExport];
    [v6 setObject:v9 forKeyedSubscript:@"dialogRequest"];

    v10 = [v5 engagementRequest];
    id v11 = [(AMSUIWebAction *)self context];
    id v12 = [v10 generateWebExportWithContext:v11];
    [v6 setObject:v12 forKeyedSubscript:@"engagementRequest"];

    id v13 = [v5 serviceType];
    [v6 setObject:v13 forKeyedSubscript:@"serviceType"];

    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v15 = [v5 placements];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__AMSUIWebEngagementAction__resultFromMessageResponse___block_invoke;
    v18[3] = &unk_2643E4D80;
    id v19 = v14;
    id v16 = v14;
    [v15 enumerateKeysAndObjectsUsingBlock:v18];

    [v6 setObject:v16 forKeyedSubscript:@"placements"];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __55__AMSUIWebEngagementAction__resultFromMessageResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 generateWebExport];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (NSDictionary)event
{
  return self->_event;
}

- (NSArray)messagePlacements
{
  return self->_messagePlacements;
}

- (NSString)messageServiceType
{
  return self->_messageServiceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageServiceType, 0);
  objc_storeStrong((id *)&self->_messagePlacements, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end