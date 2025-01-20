@interface HMMTRAttributeReportDistributor
- (BOOL)allAttributesReported;
- (HMMTRAttributeReportDistributor)init;
- (NSMutableDictionary)receivers;
- (id)registerHandlerForAttributePath:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)allAttributesNotReady;
- (void)allAttributesReady;
- (void)deregisterHandlerForAttributePath:(id)a3 registry:(id)a4;
- (void)distributeAttributeReport:(id)a3;
- (void)setAllAttributesReported:(BOOL)a3;
@end

@implementation HMMTRAttributeReportDistributor

- (void).cxx_destruct
{
}

- (void)setAllAttributesReported:(BOOL)a3
{
  self->_allAttributesReported = a3;
}

- (BOOL)allAttributesReported
{
  return self->_allAttributesReported;
}

- (NSMutableDictionary)receivers
{
  return self->_receivers;
}

- (void)allAttributesNotReady
{
}

- (void)allAttributesReady
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(HMMTRAttributeReportDistributor *)self setAllAttributesReported:1];
  v3 = [(HMMTRAttributeReportDistributor *)self receivers];
  v4 = (void *)[v3 copy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v4;
  uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        v6 = objc_msgSend(obj, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * i), v15);
        v7 = (void *)[v6 copy];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              v14 = [v13 queue];
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __53__HMMTRAttributeReportDistributor_allAttributesReady__block_invoke;
              block[3] = &unk_265378638;
              block[4] = v13;
              dispatch_async(v14, block);
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }
}

void __53__HMMTRAttributeReportDistributor_allAttributesReady__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) receiver];
  v1[2](v1, 0);
}

- (void)distributeAttributeReport:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMMTRAttributeReportDistributor *)self receivers];
    uint64_t v9 = [v8 objectForKeyedSubscript:v7];
    uint64_t v10 = (void *)[v9 copy];

    if (v10)
    {
      v18 = v10;
      id v19 = v7;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v17 = objc_msgSend(v16, "queue", v18, v19);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __61__HMMTRAttributeReportDistributor_distributeAttributeReport___block_invoke;
            block[3] = &unk_265376E98;
            block[4] = v16;
            id v21 = v4;
            dispatch_async(v17, block);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v13);
      }

      uint64_t v10 = v18;
      id v7 = v19;
    }
  }
}

void __61__HMMTRAttributeReportDistributor_distributeAttributeReport___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) receiver];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)deregisterHandlerForAttributePath:(id)a3 registry:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(HMMTRAttributeReportDistributor *)self receivers];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8) {
    [v8 removeObject:v9];
  }
}

- (id)registerHandlerForAttributePath:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(HMMTRAttributeReportDistributor *)self receivers];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    uint64_t v14 = [(HMMTRAttributeReportDistributor *)self receivers];
    [v14 setObject:v13 forKeyedSubscript:v8];
  }
  uint64_t v15 = [[HMMTRAttributeReportDistributorRegistry alloc] initWithQueue:v10 receiver:v9];

  uint64_t v16 = [(HMMTRAttributeReportDistributor *)self receivers];
  v17 = [v16 objectForKeyedSubscript:v8];
  [v17 addObject:v15];

  if ([(HMMTRAttributeReportDistributor *)self allAttributesReported]) {
    [(HMMTRAttributeReportDistributor *)self allAttributesReady];
  }

  return v15;
}

- (HMMTRAttributeReportDistributor)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMTRAttributeReportDistributor;
  v2 = [(HMMTRAttributeReportDistributor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    receivers = v2->_receivers;
    v2->_receivers = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end