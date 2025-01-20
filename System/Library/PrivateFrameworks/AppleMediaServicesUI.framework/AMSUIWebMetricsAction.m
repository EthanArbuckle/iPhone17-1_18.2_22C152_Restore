@interface AMSUIWebMetricsAction
- (AMSUIWebMetricsAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)shouldFlush;
- (NSArray)events;
- (id)runAction;
- (void)setEvents:(id)a3;
- (void)setShouldFlush:(BOOL)a3;
@end

@implementation AMSUIWebMetricsAction

- (AMSUIWebMetricsAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebMetricsAction;
  id v40 = a4;
  v37 = -[AMSUIWebAction initWithJSObject:context:](&v45, sel_initWithJSObject_context_, v6);
  if (v37)
  {
    v38 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v7 = [v6 objectForKeyedSubscript:@"events"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v52 count:16];
    id v36 = v6;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      id v39 = v8;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = v13;
          }
          else {
            id v14 = 0;
          }

          if (v14)
          {
            v15 = [[AMSUIWebMetricsEvent alloc] initWithJSObject:v14 context:v40];
            v16 = v15;
            if (v15)
            {
              v17 = [(AMSUIWebMetricsEvent *)v15 account];

              if (!v17)
              {
                v18 = [v6 objectForKeyedSubscript:@"account"];
                v19 = [v40 iTunesAccountFromJSAccount:v18];
                [v16 setAccount:v19];

                v20 = [v16 account];

                if (!v20)
                {
                  v21 = [v6 objectForKeyedSubscript:@"dsid"];
                  v22 = [v40 iTunesAccountFromJSDSID:v21];
                  [v16 setAccount:v22];
                }
              }
              [(NSArray *)v38 addObject:v16];
            }
            else
            {
              v26 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
              if (!v26)
              {
                v26 = [MEMORY[0x263F27CB8] sharedConfig];
              }
              v27 = [v26 OSLogObject];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v28 = objc_opt_class();
                v29 = AMSLogKey();
                *(_DWORD *)buf = 138543874;
                uint64_t v47 = v28;
                __int16 v48 = 2114;
                v49 = v29;
                __int16 v50 = 2112;
                id v51 = v13;
                _os_log_impl(&dword_21C134000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create metrics event from definition: %@", buf, 0x20u);

                id v6 = v36;
              }

              id v8 = v39;
            }
          }
          else
          {
            v16 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
            if (!v16)
            {
              v16 = [MEMORY[0x263F27CB8] sharedConfig];
            }
            v23 = [v16 OSLogObject];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = objc_opt_class();
              v25 = AMSLogKey();
              *(_DWORD *)buf = 138543874;
              uint64_t v47 = v24;
              id v8 = v39;
              __int16 v48 = 2114;
              v49 = v25;
              __int16 v50 = 2112;
              id v51 = v13;
              _os_log_impl(&dword_21C134000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid metrics event: %@", buf, 0x20u);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v10);
    }

    events = v37->_events;
    v37->_events = v38;
    v31 = v38;

    v32 = [v6 objectForKeyedSubscript:@"flush"];
    char v33 = objc_opt_respondsToSelector();

    if (v33) {
      char v34 = [v32 BOOLValue];
    }
    else {
      char v34 = 0;
    }
    v37->_shouldFlush = v34;

    id v6 = v36;
  }

  return v37;
}

- (id)runAction
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebMetricsAction;
  id v3 = [(AMSUIWebAction *)&v21 runAction];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(AMSUIWebMetricsAction *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = [(AMSUIWebAction *)self context];
        uint64_t v11 = [v10 metrics];
        [v11 enqueueEvent:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  if ([(AMSUIWebMetricsAction *)self shouldFlush])
  {
    v12 = [(AMSUIWebAction *)self context];
    id v13 = [v12 metrics];
    id v14 = (id)[v13 flush];
  }
  v15 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
  return v15;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (BOOL)shouldFlush
{
  return self->_shouldFlush;
}

- (void)setShouldFlush:(BOOL)a3
{
  self->_shouldFlush = a3;
}

- (void).cxx_destruct
{
}

@end