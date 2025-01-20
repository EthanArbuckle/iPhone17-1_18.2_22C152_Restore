@interface IDSEndpointResolverComponent
- (IDSEndpointResolverComponent)initWithQueryCache:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSEndpointResolverComponent

- (IDSEndpointResolverComponent)initWithQueryCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSEndpointResolverComponent;
  v6 = [(IDSEndpointResolverComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peerIDManager, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [v4 uris];
  id v7 = [v6 count];

  if (v7)
  {
    if ([v4 alwaysSkipSelf]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    if ([v4 alwaysIncludeSelf]) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = v8;
    }
    peerIDManager = self->_peerIDManager;
    v11 = [v4 uris];
    v12 = [v4 fromID];
    v13 = [v4 service];
    v14 = +[IDSURI URIWithPrefixedURI:v12 withServiceLoggingHint:v13];
    v15 = [v4 service];
    v16 = [v4 fromIdentity];
    v17 = -[IDSPeerIDManager endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:](peerIDManager, "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:", v11, v14, v15, v16, v9, [v4 disallowQueryRefresh] ^ 1);

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          v24 = objc_msgSend(v18, "objectForKey:", v23, 0);
          id v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v32;
            do
            {
              for (j = 0; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v32 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v5 addObject:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)];
              }
              id v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v26);
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v20);
    }
  }
  [v4 setEndpoints:v5];
  v29 = +[CUTUnsafePromise fulfilledPromiseWithValue:v4];

  return v29;
}

- (void).cxx_destruct
{
}

@end