@interface CoreDAVPrincipalPropertySearchTask
- (BOOL)applyToPrincipalCollectionSet;
- (CoreDAVPrincipalPropertySearchTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4;
- (CoreDAVPrincipalPropertySearchTask)initWithPropertySearches:(id)a3 propertiesToFind:(id)a4 atURL:(id)a5 applyToPrincipalCollectionSet:(BOOL)a6 extraAttributes:(id)a7;
- (NSDictionary)extraAttributes;
- (NSSet)searchItems;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setApplyToPrincipalCollectionSet:(BOOL)a3;
- (void)setExtraAttributes:(id)a3;
- (void)setSearchItems:(id)a3;
@end

@implementation CoreDAVPrincipalPropertySearchTask

- (CoreDAVPrincipalPropertySearchTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CoreDAVPrincipalPropertySearchTask;
  result = [(CoreDAVPropertyFindBaseTask *)&v5 initWithPropertiesToFind:a3 atURL:a4];
  if (result) {
    result->super.super._depth = 2;
  }
  return result;
}

- (CoreDAVPrincipalPropertySearchTask)initWithPropertySearches:(id)a3 propertiesToFind:(id)a4 atURL:(id)a5 applyToPrincipalCollectionSet:(BOOL)a6 extraAttributes:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a7;
  v14 = [(CoreDAVPrincipalPropertySearchTask *)self initWithPropertiesToFind:a4 atURL:a5];
  v15 = v14;
  if (v14)
  {
    [(CoreDAVPrincipalPropertySearchTask *)v14 setSearchItems:v12];
    [(CoreDAVPrincipalPropertySearchTask *)v15 setApplyToPrincipalCollectionSet:v8];
    [(CoreDAVPrincipalPropertySearchTask *)v15 setExtraAttributes:v13];
  }

  return v15;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (id)requestBody
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
  v4 = (void *)[v3 count];

  if (v4)
  {
    objc_super v5 = objc_alloc_init(CoreDAVXMLData);
    v6 = [(CoreDAVPrincipalPropertySearchTask *)self extraAttributes];
    [(CoreDAVXMLData *)v5 startElement:@"principal-property-search" inNamespace:@"DAV:" withAttributes:v6];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v7 = [(CoreDAVPrincipalPropertySearchTask *)self searchItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) write:v5];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [(CoreDAVXMLData *)v5 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
          v18 = [v17 name];
          v19 = [v17 nameSpace];
          [(CoreDAVXMLData *)v5 appendElement:v18 inNamespace:v19 withStringContent:0 withAttributeNamesAndValues:0];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }

    [(CoreDAVXMLData *)v5 endElement:@"prop" inNamespace:@"DAV:"];
    [(CoreDAVXMLData *)v5 endElement:@"principal-property-search" inNamespace:@"DAV:"];
    v4 = [(CoreDAVXMLData *)v5 data];
  }
  return v4;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(CoreDAVPropertyFindBaseTask *)self getTotalFailureError];
  }
  v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVPrincipalPropertySearchTask;
  [(CoreDAVPropertyFindBaseTask *)&v8 finishCoreDAVTaskWithError:v6];
}

- (NSSet)searchItems
{
  return self->_searchItems;
}

- (void)setSearchItems:(id)a3
{
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setExtraAttributes:(id)a3
{
}

- (BOOL)applyToPrincipalCollectionSet
{
  return self->_applyToPrincipalCollectionSet;
}

- (void)setApplyToPrincipalCollectionSet:(BOOL)a3
{
  self->_applyToPrincipalCollectionSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_searchItems, 0);
}

@end