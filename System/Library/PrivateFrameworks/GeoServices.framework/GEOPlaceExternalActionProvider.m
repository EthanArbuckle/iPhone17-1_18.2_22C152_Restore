@interface GEOPlaceExternalActionProvider
- (GEOPlaceExternalActionProvider)initWithActionLink:(id)a3 attributionMap:(id)a4;
- (NSArray)supportedIntegrations;
- (NSString)appAdamId;
- (NSString)identifier;
@end

@implementation GEOPlaceExternalActionProvider

- (GEOPlaceExternalActionProvider)initWithActionLink:(id)a3 attributionMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOPlaceExternalActionProvider;
    v9 = [(GEOPlaceExternalActionProvider *)&v16 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_actionLink, a3);
      objc_storeWeak((id *)&v10->_attributionMap, v8);
      v11 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v12 = [v11 UUIDString];
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v12;
    }
    self = v10;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)supportedIntegrations
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = -[GEOPDActionLink links]((id *)&self->_actionLink->super.super.isa);
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = -[GEOPDActionLink links]((id *)&self->_actionLink->super.super.isa);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    p_attributionMap = &self->_attributionMap;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v12 && -[GEOPDLink linkType](*(void *)(*((void *)&v18 + 1) + 8 * i)) - 1 <= 3)
        {
          v13 = [GEOPlaceExternalActionLink alloc];
          id WeakRetained = objc_loadWeakRetained((id *)p_attributionMap);
          v15 = -[GEOPlaceExternalActionLink initWithLinkData:attributionMap:](v13, "initWithLinkData:attributionMap:", v12, WeakRetained, (void)v18);

          if (v15) {
            [v5 addObject:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  objc_super v16 = (void *)[v5 copy];

  return (NSArray *)v16;
}

- (NSString)appAdamId
{
  return -[GEOPDActionLink appAdamId]((id *)&self->_actionLink->super.super.isa);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_attributionMap);

  objc_storeStrong((id *)&self->_actionLink, 0);
}

@end