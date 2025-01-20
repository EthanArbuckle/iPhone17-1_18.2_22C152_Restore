@interface CoreDAVPropFindTask
- (CoreDAVPropFindTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 withDepth:(int)a5;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVPropFindTask

- (CoreDAVPropFindTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 withDepth:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"The depth parameter must not be CoreDAVDepthNone.  A value representing an actual depth must be specified." userInfo:0];
    objc_exception_throw(v14);
  }
  v10 = v9;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVPropFindTask;
  v11 = [(CoreDAVPropertyFindBaseTask *)&v15 initWithPropertiesToFind:v8 atURL:v9];
  v12 = v11;
  if (v11) {
    v11->super.super._depth = a5;
  }

  return v12;
}

- (id)httpMethod
{
  return @"PROPFIND";
}

- (id)requestBody
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
  if (v3
    && (v4 = (void *)v3,
        [(CoreDAVPropertyFindBaseTask *)self propertiesToFind],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    v7 = objc_alloc_init(CoreDAVXMLData);
    -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:");
    -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:");
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:1 selector:sel_caseInsensitiveCompare_];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v8, 0);
    v10 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
    v11 = [v10 sortedArrayUsingDescriptors:v9];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v18 = [v17 name];
          v19 = [v17 nameSpace];
          [(CoreDAVXMLData *)v7 appendElement:v18 inNamespace:v19 withStringContent:0 withAttributeNamesAndValues:0];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    [(CoreDAVXMLData *)v7 endElement:@"prop" inNamespace:@"DAV:"];
    [(CoreDAVXMLData *)v7 endElement:@"propfind" inNamespace:@"DAV:"];
    v20 = [(CoreDAVXMLData *)v7 data];
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVTask *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    [(CoreDAVPropertyFindBaseTask *)self updateMultiStatusFromResponse];
    if (v4)
    {
      id v7 = v4;
    }
    else
    {
      id v7 = [(CoreDAVPropertyFindBaseTask *)self getTotalFailureError];
    }
    id v8 = v7;
    id v9 = [(CoreDAVTask *)self delegate];
    v10 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
    v11 = [v10 orderedResponses];
    [v9 propFindTask:self parsedResponses:v11 error:v8];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVPropFindTask;
  [(CoreDAVPropertyFindBaseTask *)&v12 finishCoreDAVTaskWithError:v4];
}

@end