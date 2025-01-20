@interface GEOMiniBrowseCategories
- (GEOMiniBrowseCategories)initWithMiniPDBrowseCategories:(id)a3 topChildNames:(id)a4;
- (NSArray)categoriesStyleAttributes;
- (NSArray)topChildNames;
@end

@implementation GEOMiniBrowseCategories

- (GEOMiniBrowseCategories)initWithMiniPDBrowseCategories:(id)a3 topChildNames:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)GEOMiniBrowseCategories;
  v8 = [(GEOMiniBrowseCategories *)&v26 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = -[GEOPDMiniBrowseCategory styleAttributes](*(id **)(*((void *)&v22 + 1) + 8 * i));
          if (v15)
          {
            v16 = [[GEOFeatureStyleAttributes alloc] initWithPlaceDataStyleAttributes:v15];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [v9 copy];
    categoriesStyleAttributes = v8->_categoriesStyleAttributes;
    v8->_categoriesStyleAttributes = (NSArray *)v17;

    objc_storeStrong((id *)&v8->_topChildNames, a4);
    v19 = v8;

    id v6 = v21;
  }

  return v8;
}

- (NSArray)categoriesStyleAttributes
{
  return self->_categoriesStyleAttributes;
}

- (NSArray)topChildNames
{
  return self->_topChildNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topChildNames, 0);

  objc_storeStrong((id *)&self->_categoriesStyleAttributes, 0);
}

@end