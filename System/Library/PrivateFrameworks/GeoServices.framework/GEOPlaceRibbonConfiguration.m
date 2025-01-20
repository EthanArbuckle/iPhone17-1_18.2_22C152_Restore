@interface GEOPlaceRibbonConfiguration
- (GEOPlaceRibbonConfiguration)initWithRibbonConfiguration:(id)a3;
- (NSArray)ribbonItems;
- (void)_addAmenityEntryForRibbonItem:(id)a3 toArray:(id)a4;
- (void)_addFactoidEntriesForRibbonItem:(id)a3 toArray:(id)a4;
- (void)_addRegularRibbonEntryForType:(int)a3 toArray:(id)a4;
- (void)_buildRibbonItems;
@end

@implementation GEOPlaceRibbonConfiguration

- (GEOPlaceRibbonConfiguration)initWithRibbonConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPlaceRibbonConfiguration;
  v6 = [(GEOPlaceRibbonConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ribbonConfig, a3);
    [(GEOPlaceRibbonConfiguration *)v7 _buildRibbonItems];
  }

  return v7;
}

- (void)_buildRibbonItems
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = GEOGetPlaceCardLayoutLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Building ribbon items", buf, 2u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = -[GEOPDPlaceRibbonConfiguration ribbonItems]((id *)&self->_ribbonConfig->super.super.isa);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(id **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = -[GEOPDRibbonItem type]((uint64_t)v10);
        switch((int)v11)
        {
          case 0:
            v14 = GEOGetPlaceCardLayoutLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "We have a ribbon type unknown", buf, 2u);
            }
            goto LABEL_22;
          case 1:
          case 2:
          case 4:
          case 5:
          case 7:
          case 8:
          case 9:
            v12 = GEOGetPlaceCardLayoutLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v13 = @"RIBBON_ITEM_TYPE_UNKNOWN";
              if ((v11 - 1) <= 8) {
                v13 = off_1E53E1D50[(int)v11 - 1];
              }
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "Adding normal ribbon item of type %@", buf, 0xCu);
            }

            [(GEOPlaceRibbonConfiguration *)self _addRegularRibbonEntryForType:v11 toArray:v3];
            continue;
          case 3:
            v16 = GEOGetPlaceCardLayoutLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_INFO, "Adding amenities ribbon item", buf, 2u);
            }

            v14 = -[GEOPDRibbonItem amenityRibbonItem](v10);
            [(GEOPlaceRibbonConfiguration *)self _addAmenityEntryForRibbonItem:v14 toArray:v3];
            goto LABEL_22;
          case 6:
            v15 = GEOGetPlaceCardLayoutLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Adding factoid ribbon item", buf, 2u);
            }

            v14 = -[GEOPDRibbonItem factoidRibbonItem](v10);
            [(GEOPlaceRibbonConfiguration *)self _addFactoidEntriesForRibbonItem:v14 toArray:v3];
LABEL_22:

            break;
          default:
            continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }

  v17 = GEOGetPlaceCardLayoutLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_INFO, "End building ribbon items", buf, 2u);
  }

  v18 = (NSArray *)[v3 copy];
  ribbonItems = self->_ribbonItems;
  self->_ribbonItems = v18;
}

- (void)_addFactoidEntriesForRibbonItem:(id)a3 toArray:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[GEOPlaceRibbonItem alloc] initWithFactoidRibbonItem:v6];

  [v5 addObject:v7];
}

- (void)_addRegularRibbonEntryForType:(int)a3 toArray:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [[GEOPlaceRibbonItem alloc] initWithType:v4];
  [v5 addObject:v6];
}

- (void)_addAmenityEntryForRibbonItem:(id)a3 toArray:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[GEOPlaceRibbonItem alloc] initAmenityWithAmenityItem:v6];

  [v5 addObject:v7];
}

- (NSArray)ribbonItems
{
  return self->_ribbonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ribbonItems, 0);

  objc_storeStrong((id *)&self->_ribbonConfig, 0);
}

@end