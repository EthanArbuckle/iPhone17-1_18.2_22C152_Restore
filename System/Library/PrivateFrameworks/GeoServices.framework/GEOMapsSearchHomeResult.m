@interface GEOMapsSearchHomeResult
- (GEOMapsSearchHomeResult)initWithMapsSearchHomeResult:(id)a3 mapsResults:(id)a4;
- (NSArray)sections;
@end

@implementation GEOMapsSearchHomeResult

- (GEOMapsSearchHomeResult)initWithMapsSearchHomeResult:(id)a3 mapsResults:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  if (v6) {
    uint64_t v9 = [v6[2] count];
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = [v8 arrayWithCapacity:v9];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = -[GEOPDMapsSearchHomeResult mapsSearchHomeSections](v6);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [[GEOMapsSearchHomeSection alloc] initWithMapsSearchHomeSection:*(void *)(*((void *)&v23 + 1) + 8 * v15) mapsResults:v7];
        if (v16) {
          [v10 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    v22.receiver = self;
    v22.super_class = (Class)GEOMapsSearchHomeResult;
    v17 = [(GEOMapsSearchHomeResult *)&v22 init];
    if (v17)
    {
      uint64_t v18 = [v10 copy];
      sections = v17->_sections;
      v17->_sections = (NSArray *)v18;
    }
    self = v17;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end