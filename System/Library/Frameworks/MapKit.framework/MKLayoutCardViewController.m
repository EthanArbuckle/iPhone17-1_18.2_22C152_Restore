@interface MKLayoutCardViewController
- (BOOL)isLayoutDynamic;
- (BOOL)isTransitItem;
- (MKMapItem)mapItem;
- (NSMutableDictionary)cacheModuleType;
- (NSMutableDictionary)cacheVC;
- (id)_cachedViewControllerForModule:(int)a3;
- (id)_createViewControllerForModule:(id)a3;
- (id)_layoutModuleForMapItem;
- (void)_createModuleLayout:(id)a3;
- (void)setCacheModuleType:(id)a3;
- (void)setCacheVC:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation MKLayoutCardViewController

- (BOOL)isTransitItem
{
  v2 = [(MKLayoutCardViewController *)self mapItem];
  char v3 = [v2 _isMapItemTypeTransit];

  return v3;
}

- (BOOL)isLayoutDynamic
{
  v2 = [(MKLayoutCardViewController *)self _layoutModuleForMapItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_layoutModuleForMapItem
{
  if (GEOConfigGetBOOL())
  {
    BOOL v3 = GEOConfigGetArray();
    if (!v3
      || ([MEMORY[0x1E4F64730] moduleLayoutEntryFromArray:v3],
          (v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (GEOConfigGetBOOL())
      {
        v4 = 0;
      }
      else
      {
        v5 = [(MKLayoutCardViewController *)self mapItem];
        v4 = [v5 _placecardLayout];
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_createModuleLayout:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(MKLayoutCardViewController *)self setCacheVC:v5];

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [(MKLayoutCardViewController *)self setCacheModuleType:v6];

  v18 = [(MKLayoutCardViewController *)self _layoutModuleForMapItem];
  [v18 modules];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [(MKLayoutCardViewController *)self _createViewControllerForModule:v11];
        if (v12)
        {
          v13 = [(MKLayoutCardViewController *)self cacheVC];
          v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "type"));
          [v13 setObject:v12 forKeyedSubscript:v14];

          v15 = [(MKLayoutCardViewController *)self cacheModuleType];
          v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
          [v15 setObject:v11 forKeyedSubscript:v16];

          if ([v11 type] == 5)
          {
            v17 = [v4 lastObject];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v17 setBottomHairlineHidden:1];
            }
          }
          [v4 addObject:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

- (id)_cachedViewControllerForModule:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MKLayoutCardViewController *)self cacheVC];
  v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)_createViewControllerForModule:(id)a3
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (NSMutableDictionary)cacheVC
{
  return self->_cacheVC;
}

- (void)setCacheVC:(id)a3
{
}

- (NSMutableDictionary)cacheModuleType
{
  return self->_cacheModuleType;
}

- (void)setCacheModuleType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheModuleType, 0);
  objc_storeStrong((id *)&self->_cacheVC, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end