@interface GEOTextItemContainer
- (GEOTextItemContainer)init;
- (GEOTextItemContainer)initWithDisplayConfig:(id)a3 textItems:(id)a4;
- (GEOTextItemContainer)initWithTextItemContainer:(id)a3;
- (GEOTextItemDisplayConfig)displayConfig;
- (NSArray)textItems;
@end

@implementation GEOTextItemContainer

- (GEOTextItemContainer)init
{
  result = (GEOTextItemContainer *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOTextItemContainer)initWithDisplayConfig:(id)a3 textItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOTextItemContainer;
  v9 = [(GEOTextItemContainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayConfig, a3);
    uint64_t v11 = [v8 copy];
    textItems = v10->_textItems;
    v10->_textItems = (NSArray *)v11;
  }
  return v10;
}

- (GEOTextItemContainer)initWithTextItemContainer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v5 = [GEOTextItemDisplayConfig alloc];
  v6 = -[GEOPDTextItemContainer displayConf](v4);
  id v7 = [(GEOTextItemDisplayConfig *)v5 initWithTextItemDisplayConfig:v6];

  id v8 = -[GEOPDTextItemContainer textItems](v4);
  uint64_t v9 = [v8 count];

  v10 = 0;
  if (v9 && v7)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v12 = -[GEOPDTextItemContainer textItems](v4);
    v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v14 = -[GEOPDTextItemContainer textItems](v4);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
          v20 = [GEOTextItem alloc];
          v21 = -[GEOTextItem initWithTextItem:](v20, "initWithTextItem:", v19, (void)v23);
          if (v21) {
            [v13 addObject:v21];
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    self = [(GEOTextItemContainer *)self initWithDisplayConfig:v7 textItems:v13];
    v10 = self;
  }

  return v10;
}

- (GEOTextItemDisplayConfig)displayConfig
{
  return self->_displayConfig;
}

- (NSArray)textItems
{
  return self->_textItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textItems, 0);

  objc_storeStrong((id *)&self->_displayConfig, 0);
}

@end