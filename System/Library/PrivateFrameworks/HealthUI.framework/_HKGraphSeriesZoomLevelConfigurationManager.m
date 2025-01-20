@interface _HKGraphSeriesZoomLevelConfigurationManager
- (NSMutableArray)graphSeriesInOrderAdded;
- (NSMutableDictionary)displayTypeIdentifierToConfiguration;
- (NSMutableDictionary)graphSeriesUUIDToConfiguration;
- (_HKGraphSeriesZoomLevelConfigurationManager)init;
- (id)_displayTypeIdentifierForDisplayType:(id)a3;
- (id)allDisplayTypes;
- (id)allGraphSeries;
- (id)configurationForDisplayType:(id)a3;
- (id)configurationForGraphSeries:(id)a3;
- (void)addConfiguration:(id)a3;
- (void)removeConfigurationForDisplayType:(id)a3;
- (void)reset;
- (void)setDisplayTypeIdentifierToConfiguration:(id)a3;
- (void)setGraphSeriesInOrderAdded:(id)a3;
- (void)setGraphSeriesUUIDToConfiguration:(id)a3;
@end

@implementation _HKGraphSeriesZoomLevelConfigurationManager

- (_HKGraphSeriesZoomLevelConfigurationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)_HKGraphSeriesZoomLevelConfigurationManager;
  v2 = [(_HKGraphSeriesZoomLevelConfigurationManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayTypeIdentifierToConfiguration = v2->_displayTypeIdentifierToConfiguration;
    v2->_displayTypeIdentifierToConfiguration = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    graphSeriesUUIDToConfiguration = v2->_graphSeriesUUIDToConfiguration;
    v2->_graphSeriesUUIDToConfiguration = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    graphSeriesInOrderAdded = v2->_graphSeriesInOrderAdded;
    v2->_graphSeriesInOrderAdded = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)addConfiguration:(id)a3
{
  displayTypeIdentifierToConfiguration = self->_displayTypeIdentifierToConfiguration;
  id v5 = a3;
  v6 = [v5 displayType];
  uint64_t v7 = [(_HKGraphSeriesZoomLevelConfigurationManager *)self _displayTypeIdentifierForDisplayType:v6];
  [(NSMutableDictionary *)displayTypeIdentifierToConfiguration setObject:v5 forKey:v7];

  graphSeriesUUIDToConfiguration = self->_graphSeriesUUIDToConfiguration;
  v9 = [v5 graphSeries];
  objc_super v10 = [v9 UUID];
  [(NSMutableDictionary *)graphSeriesUUIDToConfiguration setObject:v5 forKey:v10];

  graphSeriesInOrderAdded = self->_graphSeriesInOrderAdded;
  id v12 = [v5 graphSeries];

  [(NSMutableArray *)graphSeriesInOrderAdded addObject:v12];
}

- (void)removeConfigurationForDisplayType:(id)a3
{
  id v4 = a3;
  id v12 = [(_HKGraphSeriesZoomLevelConfigurationManager *)self configurationForDisplayType:v4];
  displayTypeIdentifierToConfiguration = self->_displayTypeIdentifierToConfiguration;
  v6 = [(_HKGraphSeriesZoomLevelConfigurationManager *)self _displayTypeIdentifierForDisplayType:v4];

  [(NSMutableDictionary *)displayTypeIdentifierToConfiguration removeObjectForKey:v6];
  if (v12)
  {
    graphSeriesUUIDToConfiguration = self->_graphSeriesUUIDToConfiguration;
    v8 = [v12 graphSeries];
    v9 = [v8 UUID];
    [(NSMutableDictionary *)graphSeriesUUIDToConfiguration removeObjectForKey:v9];

    graphSeriesInOrderAdded = self->_graphSeriesInOrderAdded;
    v11 = [v12 graphSeries];
    [(NSMutableArray *)graphSeriesInOrderAdded removeObject:v11];
  }
}

- (void)reset
{
  [(NSMutableDictionary *)self->_displayTypeIdentifierToConfiguration removeAllObjects];
  [(NSMutableDictionary *)self->_graphSeriesUUIDToConfiguration removeAllObjects];
  graphSeriesInOrderAdded = self->_graphSeriesInOrderAdded;
  [(NSMutableArray *)graphSeriesInOrderAdded removeAllObjects];
}

- (id)configurationForDisplayType:(id)a3
{
  displayTypeIdentifierToConfiguration = self->_displayTypeIdentifierToConfiguration;
  id v4 = [(_HKGraphSeriesZoomLevelConfigurationManager *)self _displayTypeIdentifierForDisplayType:a3];
  id v5 = [(NSMutableDictionary *)displayTypeIdentifierToConfiguration objectForKey:v4];

  return v5;
}

- (id)configurationForGraphSeries:(id)a3
{
  graphSeriesUUIDToConfiguration = self->_graphSeriesUUIDToConfiguration;
  id v4 = [a3 UUID];
  id v5 = [(NSMutableDictionary *)graphSeriesUUIDToConfiguration objectForKey:v4];

  return v5;
}

- (id)allDisplayTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_graphSeriesInOrderAdded;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[_HKGraphSeriesZoomLevelConfigurationManager configurationForGraphSeries:](self, "configurationForGraphSeries:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        objc_super v10 = [v9 displayType];
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allGraphSeries
{
  return self->_graphSeriesInOrderAdded;
}

- (id)_displayTypeIdentifierForDisplayType:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 displayTypeIdentifier];
  return (id)[v3 numberWithInteger:v4];
}

- (NSMutableDictionary)displayTypeIdentifierToConfiguration
{
  return self->_displayTypeIdentifierToConfiguration;
}

- (void)setDisplayTypeIdentifierToConfiguration:(id)a3
{
}

- (NSMutableDictionary)graphSeriesUUIDToConfiguration
{
  return self->_graphSeriesUUIDToConfiguration;
}

- (void)setGraphSeriesUUIDToConfiguration:(id)a3
{
}

- (NSMutableArray)graphSeriesInOrderAdded
{
  return self->_graphSeriesInOrderAdded;
}

- (void)setGraphSeriesInOrderAdded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphSeriesInOrderAdded, 0);
  objc_storeStrong((id *)&self->_graphSeriesUUIDToConfiguration, 0);
  objc_storeStrong((id *)&self->_displayTypeIdentifierToConfiguration, 0);
}

@end