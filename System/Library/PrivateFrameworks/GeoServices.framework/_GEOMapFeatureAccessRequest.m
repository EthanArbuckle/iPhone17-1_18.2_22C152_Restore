@interface _GEOMapFeatureAccessRequest
- (GEOTileLoader)tileLoader;
- (_GEOMapFeatureAccessRequest)initWithTileLoader:(id)a3;
- (void)addTileRequest:(id)a3;
- (void)cancel;
@end

@implementation _GEOMapFeatureAccessRequest

- (_GEOMapFeatureAccessRequest)initWithTileLoader:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapFeatureAccessRequest;
  v6 = [(_GEOMapFeatureAccessRequest *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tileLoader, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    clientIdentifiers = v7->_clientIdentifiers;
    v7->_clientIdentifiers = (NSMutableArray *)v8;

    uint64_t v10 = geo_isolater_create();
    clientIdentifiersIsolater = v7->_clientIdentifiersIsolater;
    v7->_clientIdentifiersIsolater = (geo_isolater *)v10;
  }
  return v7;
}

- (void)addTileRequest:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    geo_isolate_sync();
  }
}

- (void)cancel
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__70;
  v21 = __Block_byref_object_dispose__70;
  id v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __37___GEOMapFeatureAccessRequest_cancel__block_invoke;
  v14 = &unk_1E53D89C0;
  v15 = self;
  v16 = &v17;
  geo_isolate_sync();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v18[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[GEOTileLoader cancelAllForClient:](self->_tileLoader, "cancelAllForClient:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v23 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v17, 8);
}

- (GEOTileLoader)tileLoader
{
  return self->_tileLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifiersIsolater, 0);
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);

  objc_storeStrong((id *)&self->_tileLoader, 0);
}

@end