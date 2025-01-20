@interface SGMetricsDissector
- (BOOL)_shouldSampleMessage;
- (SGMetricsDissector)initWithEntityStore:(id)a3;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGMetricsDissector

- (void).cxx_destruct
{
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30 = self;
  if ([(SGMetricsDissector *)self _shouldSampleMessage])
  {
    v11 = [v8 sender];
    v12 = [v11 handles];
    if (![v12 count])
    {

LABEL_16:
      goto LABEL_17;
    }
    v13 = [v8 recipients];

    if (v13)
    {
      v14 = [v9 duplicateKey];
      v11 = [v14 bundleId];

      if (v11)
      {
        char v15 = [v8 isSent];
        uint64_t v16 = MEMORY[0x1CB79B230]();
        v17 = (void *)v16;
        if (v15)
        {
          context = (void *)v16;
          id v29 = v10;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          v18 = [v8 recipients];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = [*(id *)(*((void *)&v31 + 1) + 8 * i) handles];
                v24 = [v23 objectAtIndexedSubscript:0];
                +[SGMetricsHelper recordConversationTurnWithDetail:v24 received:0 throughApp:v11 withStore:v30->_store];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
            }
            while (v20);
          }

          id v10 = v29;
        }
        else
        {
          v25 = [v8 sender];
          v26 = [v25 handles];
          v27 = [v26 objectAtIndexedSubscript:0];
          +[SGMetricsHelper recordConversationTurnWithDetail:v27 received:1 throughApp:v11 withStore:v30->_store];
        }
      }
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  if ([(SGMetricsDissector *)self _shouldSampleMessage])
  {
    uint64_t v12 = [v8 from];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [v8 to];

      if (v14)
      {
        char v15 = [v9 duplicateKey];
        uint64_t v16 = [v15 bundleId];

        if (v16)
        {
          if ([v8 isSent])
          {
            id v27 = v10;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id obj = [v8 to];
            uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v30 != v19) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  v22 = (void *)MEMORY[0x1CB79B230]();
                  v23 = [v21 emailAddress];
                  +[SGMetricsHelper recordConversationTurnWithDetail:v23 received:0 throughApp:v16 withStore:v11->_store];
                }
                uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
              }
              while (v18);
            }

            id v10 = v27;
          }
          else
          {
            v24 = (void *)MEMORY[0x1CB79B230]();
            v25 = [v8 from];
            v26 = [v25 emailAddress];
            +[SGMetricsHelper recordConversationTurnWithDetail:v26 received:1 throughApp:v16 withStore:v11->_store];
          }
        }
      }
    }
  }
}

- (BOOL)_shouldSampleMessage
{
  v2 = (void *)MEMORY[0x1CB79B230](self, a2);
  BOOL v3 = (float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) <= 0.00001;
  return v3;
}

- (SGMetricsDissector)initWithEntityStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMetricsDissector;
  v6 = [(SGMetricsDissector *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

@end