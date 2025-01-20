@interface SCATModernMenuSimpleSheet
- (NSArray)storedMenuItems;
- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItemDictionaryArray:(id)a4;
- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItems:(id)a4;
- (id)makeMenuItemsIfNeeded;
- (void)setStoredMenuItems:(id)a3;
@end

@implementation SCATModernMenuSimpleSheet

- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItemDictionaryArray:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SCATModernMenuSimpleSheet;
  v7 = [(SCATModernMenuSheet *)&v28 initWithMenu:a3];
  if (v7)
  {
    +[NSMutableArray array];
    v23 = id v22 = v6;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      uint64_t v12 = AXSSwitchControlMenuItemEnabledKey;
      uint64_t v13 = AXSSwitchControlMenuItemTypeKey;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "objectForKeyedSubscript:", v12, v22);
          unsigned int v17 = [v16 BOOLValue];

          if (v17)
          {
            v18 = [v15 objectForKeyedSubscript:v13];
            v19 = [(SCATModernMenuSheet *)v7 menu];
            v20 = +[SCATMenuItemFactory menuItemsForItem:v18 menu:v19 delegate:v7];
            [v23 addObjectsFromArray:v20];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    [(SCATModernMenuSimpleSheet *)v7 setStoredMenuItems:v23];
    id v6 = v22;
  }

  return v7;
}

- (SCATModernMenuSimpleSheet)initWithMenu:(id)a3 menuItems:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCATModernMenuSimpleSheet;
  v7 = [(SCATModernMenuSheet *)&v10 initWithMenu:a3];
  id v8 = v7;
  if (v7) {
    [(SCATModernMenuSimpleSheet *)v7 setStoredMenuItems:v6];
  }

  return v8;
}

- (id)makeMenuItemsIfNeeded
{
  return [(SCATModernMenuSimpleSheet *)self storedMenuItems];
}

- (NSArray)storedMenuItems
{
  return self->_storedMenuItems;
}

- (void)setStoredMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end