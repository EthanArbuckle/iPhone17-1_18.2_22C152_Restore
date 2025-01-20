@interface CoreDAVBulkRequestsItem
+ (id)copyParseRules;
- (BOOL)supportsDelete;
- (BOOL)supportsInsert;
- (BOOL)supportsItemWithNameSpace:(id)a3 name:(id)a4;
- (BOOL)supportsUpdate;
- (CoreDAVBulkRequestsItem)init;
- (CoreDAVLeafItem)maxResourcesItem;
- (CoreDAVLeafItem)maxSizeItem;
- (NSDictionary)dictRepresentation;
- (NSSet)supportedItems;
- (id)description;
- (int64_t)maxResources;
- (int64_t)maxSize;
- (void)addSupportedItem:(id)a3;
- (void)setMaxResourcesItem:(id)a3;
- (void)setMaxSizeItem:(id)a3;
@end

@implementation CoreDAVBulkRequestsItem

- (CoreDAVBulkRequestsItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"http://me.com/_namespace/" andName:@"crud"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkRequestsItem;
  v4 = [(CoreDAVItem *)&v8 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVItem *)self->_maxResourcesItem payloadAsString];
  v6 = [(CoreDAVItem *)self->_maxSizeItem payloadAsString];
  [v3 appendFormat:@"\n  maxResources %@, maxSize %@", v5, v6];

  return v3;
}

- (void)addSupportedItem:(id)a3
{
  id v4 = a3;
  supportedItems = self->_supportedItems;
  id v8 = v4;
  if (!supportedItems)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v7 = self->_supportedItems;
    self->_supportedItems = v6;

    id v4 = v8;
    supportedItems = self->_supportedItems;
  }
  [(NSMutableSet *)supportedItems addObject:v4];
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  id v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v15 = objc_alloc(NSDictionary);
    v6 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"max-resources" objectClass:objc_opt_class() setterMethod:sel_setMaxResourcesItem_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"max-resources"];
    id v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"max-size" objectClass:objc_opt_class() setterMethod:sel_setMaxSizeItem_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"max-size"];
    v10 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"http://me.com/_namespace/" elementName:@"supported" objectClass:objc_opt_class() setterMethod:sel_addSupportedItem_];
    v11 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"supported"];
    v5 = objc_msgSend(v15, "initWithObjectsAndKeys:", v6, v7, v8, v9, v10, v11, 0);

    v12 = +[CoreDAVItem parseRuleCache];
    v13 = NSStringFromClass((Class)a1);
    [v12 setObject:v5 forKey:v13];
  }
  return v5;
}

- (NSDictionary)dictRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[CoreDAVBulkRequestsItem maxResources](self, "maxResources"));
  [v3 setObject:v4 forKey:@"max-resources"];
  v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[CoreDAVBulkRequestsItem maxSize](self, "maxSize"));
  [v3 setObject:v5 forKey:@"max-size"];
  v6 = (void *)[objc_alloc(NSNumber) initWithBool:1];
  if ([(CoreDAVBulkRequestsItem *)self supportsInsert]) {
    [v3 setObject:v6 forKey:@"insert"];
  }
  if ([(CoreDAVBulkRequestsItem *)self supportsUpdate]) {
    [v3 setObject:v6 forKey:@"update"];
  }
  if ([(CoreDAVBulkRequestsItem *)self supportsDelete]) {
    [v3 setObject:v6 forKey:@"delete"];
  }

  return (NSDictionary *)v3;
}

- (int64_t)maxResources
{
  v2 = [(CoreDAVItem *)self->_maxResourcesItem payloadAsString];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)maxSize
{
  v2 = [(CoreDAVItem *)self->_maxSizeItem payloadAsString];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)supportsItemWithNameSpace:(id)a3 name:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(NSMutableSet *)self->_supportedItems count])
  {
    if (![v6 isEqualToString:@"http://me.com/_namespace/"])
    {
      char v27 = 0;
      goto LABEL_36;
    }
    id v21 = v6;
    v22 = v7;
    int v23 = [v7 isEqualToString:@"insert"];
    v24 = [(CoreDAVItem *)self name];
    int v25 = [v24 isEqualToString:@"crud"];
    int v26 = v25;
    if (v23)
    {
      if (v25)
      {
        char v27 = 1;
      }
      else
      {
        v29 = [(CoreDAVItem *)self name];
        char v27 = [v29 isEqualToString:@"simple"];
      }
    }
    else
    {

      if (!v26)
      {
        id v7 = v22;
        if ([v22 isEqualToString:@"delete"])
        {
          v30 = [(CoreDAVItem *)self name];
          char v27 = [v30 isEqualToString:@"crud"];
        }
        else
        {
          char v27 = 0;
        }
        id v6 = v21;
        goto LABEL_36;
      }
      v28 = [(CoreDAVItem *)self name];
      char v27 = [@"crud" isEqualToString:v28];
    }
    id v6 = v21;
    id v7 = v22;
    goto LABEL_36;
  }
  id v32 = v7;
  id v33 = v6;
  id v8 = (void *)[[NSString alloc] initWithCDVNameSpace:v6 andName:v7];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = self->_supportedItems;
  uint64_t v37 = [(NSMutableSet *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v37)
  {
    char v35 = 0;
    uint64_t v36 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v11 = [v10 extraChildItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v39;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              id v17 = [NSString alloc];
              v18 = [v16 nameSpace];
              uint64_t v19 = [v16 name];
              v20 = (void *)[v17 initWithCDVNameSpace:v18 andName:v19];

              LOBYTE(v19) = [v8 isEqualToString:v20];
              if (v19)
              {
                char v35 = 1;
                goto LABEL_17;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v37 = [(NSMutableSet *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v37);
  }
  else
  {
    char v35 = 0;
  }

  char v27 = v35 & 1;
  id v7 = v32;
  id v6 = v33;
LABEL_36:

  return v27;
}

- (BOOL)supportsInsert
{
  return [(CoreDAVBulkRequestsItem *)self supportsItemWithNameSpace:@"http://me.com/_namespace/" name:@"insert"];
}

- (BOOL)supportsUpdate
{
  return [(CoreDAVBulkRequestsItem *)self supportsItemWithNameSpace:@"http://me.com/_namespace/" name:@"update"];
}

- (BOOL)supportsDelete
{
  return [(CoreDAVBulkRequestsItem *)self supportsItemWithNameSpace:@"http://me.com/_namespace/" name:@"delete"];
}

- (CoreDAVLeafItem)maxResourcesItem
{
  return self->_maxResourcesItem;
}

- (void)setMaxResourcesItem:(id)a3
{
}

- (CoreDAVLeafItem)maxSizeItem
{
  return self->_maxSizeItem;
}

- (void)setMaxSizeItem:(id)a3
{
}

- (NSSet)supportedItems
{
  return &self->_supportedItems->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedItems, 0);
  objc_storeStrong((id *)&self->_maxSizeItem, 0);
  objc_storeStrong((id *)&self->_maxResourcesItem, 0);
}

@end