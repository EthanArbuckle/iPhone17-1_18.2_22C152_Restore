@interface HKGraphSeriesConfigurationManager
- (BOOL)configurationContainsDisplayType:(id)a3;
- (HKGraphSeriesConfigurationManager)init;
- (id)_configurationManagerForZoom:(int64_t)a3;
- (id)allDisplayTypes;
- (id)allDisplayTypesForZoom:(int64_t)a3;
- (id)allGraphSeriesForZoom:(int64_t)a3;
- (id)configurationForDisplayType:(id)a3 zoom:(int64_t)a4;
- (id)configurationForGraphSeries:(id)a3 zoom:(int64_t)a4;
- (int64_t)_zoomLevelForGraphZoom:(int64_t)a3;
- (void)addConfiguration:(id)a3 zoom:(int64_t)a4;
- (void)removeConfigurationsForDisplayType:(id)a3;
- (void)reset;
@end

@implementation HKGraphSeriesConfigurationManager

- (HKGraphSeriesConfigurationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKGraphSeriesConfigurationManager;
  v2 = [(HKGraphSeriesConfigurationManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    zoomLevelConfigurationManagers = v2->_zoomLevelConfigurationManagers;
    v2->_zoomLevelConfigurationManagers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addConfiguration:(id)a3 zoom:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(HKGraphSeriesConfigurationManager *)self _zoomLevelForGraphZoom:a4];
  zoomLevelConfigurationManagers = self->_zoomLevelConfigurationManagers;
  v9 = [NSNumber numberWithInteger:v7];
  v10 = [(NSMutableDictionary *)zoomLevelConfigurationManagers objectForKeyedSubscript:v9];

  if (!v10)
  {
    v11 = objc_opt_new();
    v12 = self->_zoomLevelConfigurationManagers;
    v13 = [NSNumber numberWithInteger:v7];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
  }
  v14 = self->_zoomLevelConfigurationManagers;
  id v16 = [NSNumber numberWithInteger:v7];
  v15 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v16];
  [v15 addConfiguration:v6];
}

- (void)removeConfigurationsForDisplayType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NSMutableDictionary *)self->_zoomLevelConfigurationManagers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeConfigurationForDisplayType:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_zoomLevelConfigurationManagers allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) reset];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)configurationForDisplayType:(id)a3 zoom:(int64_t)a4
{
  id v6 = a3;
  long long v7 = [(HKGraphSeriesConfigurationManager *)self _configurationManagerForZoom:a4];
  long long v8 = [v7 configurationForDisplayType:v6];

  return v8;
}

- (id)configurationForGraphSeries:(id)a3 zoom:(int64_t)a4
{
  id v6 = a3;
  long long v7 = [(HKGraphSeriesConfigurationManager *)self _configurationManagerForZoom:a4];
  long long v8 = [v7 configurationForGraphSeries:v6];

  return v8;
}

- (id)allDisplayTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  for (uint64_t i = 2; i != 8; ++i)
  {
    uint64_t v5 = [(HKGraphSeriesConfigurationManager *)self allDisplayTypesForZoom:i];
    [v3 addObjectsFromArray:v5];
  }
  id v6 = [v3 array];

  return v6;
}

- (id)allDisplayTypesForZoom:(int64_t)a3
{
  id v3 = [(HKGraphSeriesConfigurationManager *)self _configurationManagerForZoom:a3];
  uint64_t v4 = [v3 allDisplayTypes];

  return v4;
}

- (id)allGraphSeriesForZoom:(int64_t)a3
{
  id v3 = [(HKGraphSeriesConfigurationManager *)self _configurationManagerForZoom:a3];
  uint64_t v4 = [v3 allGraphSeries];

  return v4;
}

- (BOOL)configurationContainsDisplayType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(HKGraphSeriesConfigurationManager *)self allDisplayTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)_zoomLevelForGraphZoom:(int64_t)a3
{
  int64_t result = 3;
  switch(a3)
  {
    case 0:
      int64_t result = 8;
      break;
    case 1:
      int64_t result = 7;
      break;
    case 2:
      int64_t result = 6;
      break;
    case 3:
      int64_t result = 5;
      break;
    case 4:
      int64_t result = 4;
      break;
    case 6:
      int64_t result = 2;
      break;
    case 7:
      int64_t result = 1;
      break;
    case 8:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"HKGraphSeriesConfigurationManager.m" lineNumber:145 description:@"Invalid zoom level provided"];

      int64_t result = 3;
      break;
    default:
      return result;
  }
  return result;
}

- (id)_configurationManagerForZoom:(int64_t)a3
{
  int64_t v4 = [(HKGraphSeriesConfigurationManager *)self _zoomLevelForGraphZoom:a3];
  zoomLevelConfigurationManagers = self->_zoomLevelConfigurationManagers;
  uint64_t v6 = [NSNumber numberWithInteger:v4];
  uint64_t v7 = [(NSMutableDictionary *)zoomLevelConfigurationManagers objectForKeyedSubscript:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end