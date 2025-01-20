@interface CLKComplicationWidgetMigrationObjectProvider
- (CLKComplicationWidgetMigrationObjectProvider)init;
- (id)itemForAppIdentifier:(id)a3 key:(id)a4;
- (void)enumerateAppIdentifiersWithBlock:(id)a3;
- (void)enumerateItemsForAppIdentifier:(id)a3 withBlock:(id)a4;
- (void)removeItemsForAppIdentifier:(id)a3;
- (void)setItem:(id)a3 forAppIdentifier:(id)a4 key:(id)a5;
@end

@implementation CLKComplicationWidgetMigrationObjectProvider

- (CLKComplicationWidgetMigrationObjectProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationWidgetMigrationObjectProvider;
  v2 = [(CLKComplicationWidgetMigrationObjectProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    itemsByAppIdentifier = v2->_itemsByAppIdentifier;
    v2->_itemsByAppIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)itemForAppIdentifier:(id)a3 key:(id)a4
{
  itemsByAppIdentifier = self->_itemsByAppIdentifier;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)itemsByAppIdentifier objectForKey:a3];
  v8 = [v7 objectForKey:v6];

  return v8;
}

- (void)enumerateAppIdentifiersWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NSMutableDictionary *)self->_itemsByAppIdentifier keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateItemsForAppIdentifier:(id)a3 withBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void, char *))a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_itemsByAppIdentifier objectForKey:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    char v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(v7, "objectEnumerator", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        v6[2](v6, *(void *)(*((void *)&v14 + 1) + 8 * v13), &v18);
        if (v18) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v11) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)removeItemsForAppIdentifier:(id)a3
{
}

- (void)setItem:(id)a3 forAppIdentifier:(id)a4 key:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_itemsByAppIdentifier objectForKey:v8];
  if (!v10)
  {
    uint64_t v10 = objc_opt_new();
    [(NSMutableDictionary *)self->_itemsByAppIdentifier setObject:v10 forKey:v8];
  }
  [v10 setObject:v11 forKey:v9];
}

- (void).cxx_destruct
{
}

@end