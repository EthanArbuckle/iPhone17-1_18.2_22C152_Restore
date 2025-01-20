@interface GEOMapsHomeResult
- (GEOMapsHomeResult)initWithMapsHomeResult:(id)a3 mapsResults:(id)a4;
- (NSArray)sections;
@end

@implementation GEOMapsHomeResult

- (NSArray)sections
{
  return self->_sections;
}

- (GEOMapsHomeResult)initWithMapsHomeResult:(id)a3 mapsResults:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)GEOMapsHomeResult;
  v8 = [(GEOMapsHomeResult *)&v27 init];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CA48];
    if (v6) {
      uint64_t v10 = [v6[2] count];
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = [v9 arrayWithCapacity:v10];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = -[GEOPDMapsHomeResult mapsHomeSections](v6);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
          v18 = [GEOMapsHomeSection alloc];
          v19 = -[GEOMapsHomeSection initWithMapsHomeSection:mapsResults:](v18, "initWithMapsHomeSection:mapsResults:", v17, v7, (void)v23);
          if (v19) {
            [v11 addObject:v19];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [v11 copy];
    sections = v8->_sections;
    v8->_sections = (NSArray *)v20;
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end