@interface SGMicrodataDocument
- (NSArray)items;
- (NSDictionary)htmlIds;
- (SGMicrodataDocument)init;
- (id)asJsonLd;
- (id)jsonLdForItem:(id)a3;
- (void)addItem:(id)a3;
- (void)setHtmlIdItemScope:(id)a3 forHtmlId:(id)a4;
@end

@implementation SGMicrodataDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_htmlIds, 0);
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSDictionary)htmlIds
{
  return &self->_htmlIds->super;
}

- (SGMicrodataDocument)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGMicrodataDocument;
  v2 = [(SGMicrodataDocument *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    htmlIds = v2->_htmlIds;
    v2->_htmlIds = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)addItem:(id)a3
{
}

- (void)setHtmlIdItemScope:(id)a3 forHtmlId:(id)a4
{
}

- (id)asJsonLd
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_items;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[SGMicrodataDocument jsonLdForItem:](self, "jsonLdForItem:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)jsonLdForItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27 = self;
  [v4 resolveItemRefsWithDocument:self];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v4 itemType];

  if (v6)
  {
    uint64_t v7 = [v4 itemType];
    uint64_t v8 = [v7 count];

    v9 = [v4 itemType];
    v10 = v9;
    if (v8 == 1) {
      [v9 anyObject];
    }
    else {
    long long v11 = [v9 allObjects];
    }
    [v5 setObject:v11 forKeyedSubscript:@"@type"];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v12 = [v4 itemProps];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v18 = [v17 stringValue];

        if (v18)
        {
          v19 = [v17 stringValue];
          if (!v19) {
            goto LABEL_21;
          }
        }
        else
        {
          v20 = [v17 itemValue];
          v19 = [(SGMicrodataDocument *)v27 jsonLdForItem:v20];

          if (!v19) {
            goto LABEL_21;
          }
        }
        v21 = [v17 propertyName];
        v22 = [v5 objectForKeyedSubscript:v21];

        if (v22)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v22 addObject:v19];
          }
          else
          {
            v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v22, v19, 0);
            v25 = [v17 propertyName];
            [v5 setObject:v24 forKeyedSubscript:v25];
          }
        }
        else
        {
          v23 = [v17 propertyName];
          [v5 setObject:v19 forKeyedSubscript:v23];
        }
LABEL_21:
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  return v5;
}

@end