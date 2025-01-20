@interface CKNSExtension
- (id)beginMappingID;
- (void)beginMatchingExtensions:(id)a3;
- (void)dealloc;
- (void)endMatchingExtensions;
- (void)setBeginMappingID:(id)a3;
@end

@implementation CKNSExtension

- (void)dealloc
{
  [(CKNSExtension *)self endMatchingExtensions];
  v3.receiver = self;
  v3.super_class = (Class)CKNSExtension;
  [(CKNSExtension *)&v3 dealloc];
}

- (void)beginMatchingExtensions:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_beginMappingID)
  {
    uint64_t v11 = *MEMORY[0x263F07FF8];
    v12[0] = *MEMORY[0x263F0EF58];
    v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v6 = (void *)MEMORY[0x263F08800];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__CKNSExtension_beginMatchingExtensions___block_invoke;
    v9[3] = &unk_2644F1120;
    id v10 = v4;
    v7 = [v6 beginMatchingExtensionsWithAttributes:v5 completion:v9];
    id beginMappingID = self->_beginMappingID;
    self->_id beginMappingID = v7;
  }
}

void __41__CKNSExtension_beginMatchingExtensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CKNSExtension_beginMatchingExtensions___block_invoke_2;
  block[3] = &unk_2644F0578;
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__CKNSExtension_beginMatchingExtensions___block_invoke_2(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!a1[4])
  {
    objc_super v3 = (void *)a1[5];
    if (v3)
    {
      uint64_t v4 = [v3 count];
      id v5 = (void *)a1[5];
      if (v4)
      {
        v17 = a1;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) _plugIn];
              id v12 = [v11 localizedContainingName];

              v13 = [v2 objectForKey:v12];

              if (v13)
              {
                v14 = [v2 objectForKeyedSubscript:v12];
                int v15 = [v14 intValue];

                v16 = [NSNumber numberWithInt:(v15 + 1)];
                [v2 setObject:v16 forKeyedSubscript:v12];
              }
              else
              {
                [v2 setObject:&unk_26D075B00 forKeyedSubscript:v12];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v8);
        }

        a1 = v17;
      }
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)endMatchingExtensions
{
  if (self->_beginMappingID)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id beginMappingID = self->_beginMappingID;
    self->_id beginMappingID = 0;
  }
}

- (id)beginMappingID
{
  return self->_beginMappingID;
}

- (void)setBeginMappingID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end