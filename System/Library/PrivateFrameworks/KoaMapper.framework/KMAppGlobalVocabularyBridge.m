@interface KMAppGlobalVocabularyBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMAppGlobalVocabularyBridge)init;
- (KMAppGlobalVocabularyBridge)initWithOriginAppId:(id)a3 cascadeItemType:(unsigned __int16)a4 items:(id)a5;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMAppGlobalVocabularyBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = (uint64_t (**)(id, void))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x22A6168F0](v7);
        LODWORD(v11) = v5[2](v5, v11);
        if (!v11)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)originAppId
{
  return self->_appId;
}

- (unsigned)cascadeItemType
{
  return self->_cascadeItemType;
}

- (KMAppGlobalVocabularyBridge)initWithOriginAppId:(id)a3 cascadeItemType:(unsigned __int16)a4 items:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KMAppGlobalVocabularyBridge;
  uint64_t v11 = [(KMAppGlobalVocabularyBridge *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appId, a3);
    v12->_cascadeItemType = a4;
    objc_storeStrong((id *)&v12->_items, a5);
  }

  return v12;
}

- (KMAppGlobalVocabularyBridge)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

@end