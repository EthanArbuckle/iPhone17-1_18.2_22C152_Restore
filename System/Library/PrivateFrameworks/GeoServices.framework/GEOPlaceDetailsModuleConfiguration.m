@interface GEOPlaceDetailsModuleConfiguration
- (GEOPlaceDetailsModuleConfiguration)initWithPlaceInfoModuleConfiguration:(id)a3;
- (NSArray)factoidReferences;
- (int)attributionStyle;
- (int)locationStyle;
@end

@implementation GEOPlaceDetailsModuleConfiguration

- (GEOPlaceDetailsModuleConfiguration)initWithPlaceInfoModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPlaceDetailsModuleConfiguration;
  v6 = [(GEOPlaceDetailsModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_placeInfosModuleConfig, a3);
  }

  return v7;
}

- (int)locationStyle
{
  uint64_t v2 = -[GEOPDPlaceInfosModuleConfiguration locationInfoItem]((id *)&self->_placeInfosModuleConfig->super.super.isa);
  if (v2 && (*(unsigned char *)(v2 + 20) & 1) != 0)
  {
    int v4 = *(_DWORD *)(v2 + 16);

    if (v4 == 1) {
      return 1;
    }
    else {
      return 2 * (v4 == 3);
    }
  }
  else
  {

    return 0;
  }
}

- (NSArray)factoidReferences
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  -[GEOPDPlaceInfosModuleConfiguration factoidInfoItem]((id *)&self->_placeInfosModuleConfig->super.super.isa);
  int v4 = (id *)objc_claimAutoreleasedReturnValue();
  id v5 = -[GEOPDFactoidInfoItem factoidReferences](v4);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [GEOFactoidReference alloc];
        v12 = -[GEOFactoidReference initWithFactoidReference:](v11, "initWithFactoidReference:", v10, (void)v15);
        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (int)attributionStyle
{
  return -[GEOPDPlaceInfosModuleConfiguration attributionType]((uint64_t)self->_placeInfosModuleConfig) == 1;
}

- (void).cxx_destruct
{
}

@end