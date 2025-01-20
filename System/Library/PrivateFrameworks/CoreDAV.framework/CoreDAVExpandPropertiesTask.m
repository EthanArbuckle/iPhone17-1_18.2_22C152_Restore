@interface CoreDAVExpandPropertiesTask
- (CoreDAVExpandPropertiesTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 expandedName:(id)a5 expandedNameSpace:(id)a6;
- (NSMutableSet)propertiesToExpand;
- (id)description;
- (id)httpMethod;
- (id)parseHints;
- (id)requestBody;
- (void)addPropertyToExpandWithPropertiesToFind:(id)a3 expandedName:(id)a4 expandedNameSpace:(id)a5;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setPropertiesToExpand:(id)a3;
@end

@implementation CoreDAVExpandPropertiesTask

- (CoreDAVExpandPropertiesTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 expandedName:(id)a5 expandedNameSpace:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVExpandPropertiesTask;
  v13 = [(CoreDAVPropertyFindBaseTask *)&v16 initWithPropertiesToFind:0 atURL:a4];
  if (v13)
  {
    v14 = [MEMORY[0x263EFF9C0] set];
    [(CoreDAVExpandPropertiesTask *)v13 setPropertiesToExpand:v14];

    [(CoreDAVExpandPropertiesTask *)v13 addPropertyToExpandWithPropertiesToFind:v10 expandedName:v11 expandedNameSpace:v12];
  }

  return v13;
}

- (void)addPropertyToExpandWithPropertiesToFind:(id)a3 expandedName:(id)a4 expandedNameSpace:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [[CoreDAVExpandProperty alloc] initWithPropertiesToFind:v10 expandedName:v9 expandedNameSpace:v8];

  id v11 = [(CoreDAVExpandPropertiesTask *)self propertiesToExpand];
  [v11 addObject:v12];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVExpandPropertiesTask;
  v4 = [(CoreDAVPropertyFindBaseTask *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVExpandPropertiesTask *)self propertiesToExpand];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of properties to expand: [%lu]", objc_msgSend(v5, "count"));

  return v3;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (id)requestBody
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(CoreDAVXMLData);
  v4 = [(CoreDAVExpandPropertiesTask *)self propertiesToExpand];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    -[CoreDAVXMLData startElement:inNamespace:withAttributes:](v3, "startElement:inNamespace:withAttributes:");
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(CoreDAVExpandPropertiesTask *)self propertiesToExpand];
    uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v6;
          objc_super v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
          id v8 = [v7 expandedName];
          id v9 = [v7 expandedNameSpace];
          id v10 = v3;
          [(CoreDAVXMLData *)v3 startElement:@"property", @"DAV:", @"name", v8, @"namespace", v9, 0 inNamespace withAttributeNamesAndValues];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v11 = [v7 propertiesToFind];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v26 != v14) {
                  objc_enumerationMutation(v11);
                }
                objc_super v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                v17 = [v16 name];
                v18 = [v16 nameSpace];
                [(CoreDAVXMLData *)v10 appendElement:@"property", @"DAV:", 0, @"name", v17, @"namespace", v18, 0 inNamespace withStringContent withAttributeNamesAndValues];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v13);
          }

          id v3 = v10;
          [(CoreDAVXMLData *)v10 endElement:@"property" inNamespace:@"DAV:"];
          uint64_t v6 = v24 + 1;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }

    [(CoreDAVXMLData *)v3 endElement:@"expand-property" inNamespace:@"DAV:"];
  }
  v19 = [(CoreDAVXMLData *)v3 data];

  return v19;
}

- (id)parseHints
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v29 = self;
  id obj = [(CoreDAVExpandPropertiesTask *)self propertiesToExpand];
  uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v44;
    do
    {
      v4 = 0;
      do
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = v4;
        uint64_t v5 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v4);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v6 = [v5 propertiesToFind];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v40 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              uint64_t v12 = NSString;
              uint64_t v13 = [v11 nameSpace];
              uint64_t v14 = [v11 name];
              v15 = [v12 CDVStringWithNameSpace:v13 andName:v14];

              [v3 setObject:v11 forKey:v15];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v8);
        }

        v4 = v33 + 1;
      }
      while (v33 + 1 != (char *)v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v32);
  }

  objc_super v16 = (void *)MEMORY[0x263EFF9C0];
  v17 = [v3 allValues];
  v18 = [v16 setWithArray:v17];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v34 = [(CoreDAVExpandPropertiesTask *)v29 propertiesToExpand];
  uint64_t v19 = [v34 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v34);
        }
        uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v24 = [CoreDAVItemParserMapping alloc];
        long long v25 = [v23 expandedNameSpace];
        long long v26 = [v23 expandedName];
        long long v27 = [(CoreDAVItemParserMapping *)v24 initWithNameSpace:v25 name:v26 parseClass:objc_opt_class()];

        [v18 addObject:v27];
      }
      uint64_t v20 = [v34 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v20);
  }

  return v18;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(CoreDAVPropertyFindBaseTask *)self getTotalFailureError];
  }
  uint64_t v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVExpandPropertiesTask;
  [(CoreDAVPropertyFindBaseTask *)&v8 finishCoreDAVTaskWithError:v6];
}

- (NSMutableSet)propertiesToExpand
{
  return self->_propertiesToExpand;
}

- (void)setPropertiesToExpand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end