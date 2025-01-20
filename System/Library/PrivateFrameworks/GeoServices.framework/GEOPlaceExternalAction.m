@interface GEOPlaceExternalAction
- (BOOL)possiblyHasSupportedIntegrations;
- (GEOPlaceExternalAction)initWithActionData:(id)a3 attributionMap:(id)a4;
- (NSArray)actionProviders;
- (NSOrderedSet)appAdamIds;
- (NSString)actionName;
- (NSString)categoryId;
- (NSString)symbolName;
- (NSString)winningAdamId;
- (id)description;
- (id)partnerActionForPartnerId:(id)a3;
- (void)_setupActionProvidersWithAttributionMap:(id)a3;
@end

@implementation GEOPlaceExternalAction

- (GEOPlaceExternalAction)initWithActionData:(id)a3 attributionMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOPlaceExternalAction;
    v9 = [(GEOPlaceExternalAction *)&v13 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_actionData, a3);
      [(GEOPlaceExternalAction *)v10 _setupActionProvidersWithAttributionMap:v8];
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setupActionProvidersWithAttributionMap:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = -[GEOPDActionData actionLinks]((id *)&self->_actionData->super.super.isa);
  id v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v19 = self;
  id v8 = -[GEOPDActionData actionLinks]((id *)&self->_actionData->super.super.isa);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = [[GEOPlaceExternalActionProvider alloc] initWithActionLink:*(void *)(*((void *)&v20 + 1) + 8 * v12) attributionMap:v4];
        v14 = v13;
        if (v13)
        {
          v15 = [(GEOPlaceExternalActionProvider *)v13 supportedIntegrations];
          uint64_t v16 = [v15 count];

          if (v16) {
            [v7 addObject:v14];
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v17 = [v7 copy];
  actionProviders = v19->_actionProviders;
  v19->_actionProviders = (NSArray *)v17;
}

- (NSString)actionName
{
  return (NSString *)[(GEOPDActionData *)self->_actionData actionName];
}

- (NSString)symbolName
{
  return -[GEOPDActionData actionSymbolImageName]((id *)&self->_actionData->super.super.isa);
}

- (NSString)winningAdamId
{
  return -[GEOPDActionData winningAdamId]((id *)&self->_actionData->super.super.isa);
}

- (id)partnerActionForPartnerId:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_actionProviders;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSOrderedSet)appAdamIds
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  appAdamIds = self->_appAdamIds;
  if (appAdamIds)
  {
    v3 = appAdamIds;
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", -[NSArray count](self->_actionProviders, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_actionProviders;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
          char v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "appAdamId", (void)v18);
          uint64_t v13 = [v12 length];

          if (v13)
          {
            long long v14 = [v11 appAdamId];
            [v5 addObject:v14];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    long long v15 = (NSOrderedSet *)[v5 copy];
    long long v16 = self->_appAdamIds;
    self->_appAdamIds = v15;

    v3 = self->_appAdamIds;
  }

  return v3;
}

- (NSString)categoryId
{
  return -[GEOPDActionData categoryId]((id *)&self->_actionData->super.super.isa);
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GEOPlaceExternalAction *)self actionName];
  id v5 = [(GEOPlaceExternalAction *)self categoryId];
  id v6 = [(GEOPlaceExternalAction *)self appAdamIds];
  uint64_t v7 = [v3 stringWithFormat:@"Action Name: %@, Category ID: %@, Adam IDs: %@", v4, v5, v6];

  return v7;
}

- (BOOL)possiblyHasSupportedIntegrations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_actionProviders;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "supportedIntegrations", (void)v9);
        uint64_t v7 = [v6 count];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)actionProviders
{
  return self->_actionProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionProviders, 0);
  objc_storeStrong((id *)&self->_appAdamIds, 0);

  objc_storeStrong((id *)&self->_actionData, 0);
}

@end