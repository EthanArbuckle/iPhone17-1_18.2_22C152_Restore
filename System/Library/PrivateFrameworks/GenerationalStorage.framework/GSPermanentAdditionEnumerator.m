@interface GSPermanentAdditionEnumerator
- (GSPermanentAdditionEnumerator)initWithStorage:(id)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 ordering:(int)a7;
- (NSError)error;
- (id)nextObject;
- (void)_fetchNextBatch;
- (void)dealloc;
@end

@implementation GSPermanentAdditionEnumerator

- (GSPermanentAdditionEnumerator)initWithStorage:(id)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 ordering:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GSPermanentAdditionEnumerator;
  v15 = [(GSPermanentAdditionEnumerator *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storage, a3);
    objc_storeStrong((id *)&v16->_nameSpace, a4);
    v16->_withOptions = a5;
    v16->_withoutOptions = a6;
    uint64_t v17 = +[GSDaemonProxySync proxy];
    proxy = v16->_proxy;
    v16->_proxy = (GSDaemonProxySync *)v17;

    id token = v16->_token;
    v20 = &unk_1F37C2D10;
    if (a7 == -1) {
      v20 = &unk_1F37C2CF8;
    }
    v16->_id token = v20;

    [(GSPermanentAdditionEnumerator *)v16 _fetchNextBatch];
  }

  return v16;
}

- (void)dealloc
{
  id v3 = [(GSDaemonProxySync *)self->_proxy result];
  v4.receiver = self;
  v4.super_class = (Class)GSPermanentAdditionEnumerator;
  [(GSPermanentAdditionEnumerator *)&v4 dealloc];
}

- (void)_fetchNextBatch
{
  proxy = self->_proxy;
  int64_t v4 = [(GSPermanentStorage *)self->_storage remoteID];
  nameSpace = self->_nameSpace;
  unint64_t withOptions = self->_withOptions;
  unint64_t withoutOptions = self->_withoutOptions;
  id token = self->_token;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__GSPermanentAdditionEnumerator__fetchNextBatch__block_invoke;
  v9[3] = &unk_1E6C9F188;
  v9[4] = self;
  [(GSDaemonProxySync *)proxy listAdditionsOfStorage:v4 nameSpace:nameSpace withOptions:withOptions withoutOptions:withoutOptions andEnumerationState:token completionHandler:v9];
}

void __48__GSPermanentAdditionEnumerator__fetchNextBatch__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12) {
    [*(id *)(*(void *)(a1 + 32) + 8) setPubExtension:v12];
  }
  if (v13) {
    [*(id *)(*(void *)(a1 + 32) + 8) setPrivExtension:v13];
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v11)
  {
    id v24 = v15;
    id v25 = v14;
    id v26 = v13;
    objc_storeStrong((id *)(v16 + 72), a5);
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [[GSAddition alloc] _initWithStorage:*(void *)(*(void *)(a1 + 32) + 8) andDictionary:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          [v17 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }

    id v15 = v24;
    [*(id *)(*(void *)(a1 + 32) + 56) handleObjResult:v17 error:v24];

    id v13 = v26;
    id v14 = v25;
  }
  else
  {
    [*(id *)(v16 + 56) handleObjResult:0 error:v15];
  }
}

- (id)nextObject
{
  if (self->_error) {
    goto LABEL_2;
  }
  if (self->_proxy)
  {
    unint64_t pos = self->_pos;
    if (pos >= [(NSArray *)self->_array count])
    {
      v8 = [(GSDaemonProxySync *)self->_proxy result];
      array = self->_array;
      self->_array = v8;

      v10 = [(GSDaemonProxySync *)self->_proxy error];
      self->_unint64_t pos = 0;
      if (v10)
      {
        error = self->_error;
        self->_error = v10;

        goto LABEL_2;
      }
      if (self->_token)
      {
        [(GSPermanentAdditionEnumerator *)self _fetchNextBatch];
      }
      else
      {
        proxy = self->_proxy;
        self->_proxy = 0;
      }
    }
  }
  unint64_t v6 = self->_pos;
  if (v6 >= [(NSArray *)self->_array count])
  {
LABEL_2:
    v2 = 0;
    goto LABEL_3;
  }
  v7 = self->_array;
  ++self->_pos;
  v2 = -[NSArray objectAtIndex:](v7, "objectAtIndex:");
LABEL_3:
  return v2;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end