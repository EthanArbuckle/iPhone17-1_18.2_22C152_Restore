@interface GEOSearchSectionList
+ (id)identifiersWithSearchSections:(id)a3;
- (GEOSearchSectionList)init;
- (GEOSearchSectionList)initWithSearchSectionList:(id)a3 mapsResults:(id)a4;
- (GEOSearchSectionList)initWithSearchSections:(id)a3;
- (NSArray)geoMapItemIdentifiers;
- (NSArray)searchSections;
- (unint64_t)indexOfItemWithIdentifier:(id)a3;
@end

@implementation GEOSearchSectionList

- (GEOSearchSectionList)init
{
  result = (GEOSearchSectionList *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSearchSectionList)initWithSearchSections:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOSearchSectionList;
    v5 = [(GEOSearchSectionList *)&v12 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      searchSections = v5->_searchSections;
      v5->_searchSections = (NSArray *)v6;

      uint64_t v8 = [(id)objc_opt_class() identifiersWithSearchSections:v4];
      geoMapItemIdentifiers = v5->_geoMapItemIdentifiers;
      v5->_geoMapItemIdentifiers = (NSArray *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GEOSearchSectionList)initWithSearchSectionList:(id)a3 mapsResults:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (id *)a3;
  id v7 = a4;
  uint64_t v8 = -[GEOPDSearchSectionList sections](v6);
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v11 = -[GEOPDSearchSectionList sections](v6);
    objc_super v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = -[GEOPDSearchSectionList sections](v6);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          v19 = [GEOSearchSection alloc];
          v20 = -[GEOSearchSection initWithSearchSection:mapsResults:](v19, "initWithSearchSection:mapsResults:", v18, v7, (void)v23);
          if (v20) {
            [v12 addObject:v20];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    self = [(GEOSearchSectionList *)self initWithSearchSections:v12];
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)identifiersWithSearchSections:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v10, "sectionType", (void)v18) == 1)
          {
            v11 = [v10 sectionPlace];
            objc_super v12 = [v11 mapItemIds];
            uint64_t v13 = [v12 count];

            if (v13)
            {
              uint64_t v14 = [v10 sectionPlace];
              uint64_t v15 = [v14 mapItemIds];
              [v4 addObjectsFromArray:v15];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      uint64_t v16 = (void *)[v4 copy];
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (unint64_t)indexOfItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOSearchSectionList *)self geoMapItemIdentifiers];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (NSArray)geoMapItemIdentifiers
{
  return self->_geoMapItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_searchSections, 0);
}

@end