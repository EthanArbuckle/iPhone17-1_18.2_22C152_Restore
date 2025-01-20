@interface HSAuthorizedDSIDsUpdatesRequest
- (HSAuthorizedDSIDsUpdatesRequest)init;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation HSAuthorizedDSIDsUpdatesRequest

- (id)canonicalResponseForResponse:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = +[HSResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  v5 = +[HSResponseDataParser parseResponseData:v4];

  if ([v5 count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objectForKey:", @"com.apple.itunes.drm-user-id", (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setAuthorizedDSIDs:v6];
  }

  return v3;
}

- (HSAuthorizedDSIDsUpdatesRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)HSAuthorizedDSIDsUpdatesRequest;
  v2 = [(HSRequest *)&v5 initWithAction:@"authorized-dsids-updates"];
  v3 = v2;
  if (v2) {
    [(HSRequest *)v2 setValue:@"1" forArgument:@"revision-number"];
  }
  return v3;
}

@end