@interface IDSEndpointSubscription
- (IDSEndpointSubscription)initWithServiceIdentifier:(id)a3 localURI:(id)a4 subscribedURIs:(id)a5 queue:(id)a6;
- (IDSURI)localURI;
- (NSArray)subscribedURIs;
- (NSMutableDictionary)endpointMap;
- (NSString)peerIDManagerToken;
- (NSString)serviceIdentifier;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)peerIDManager;
- (id)resolvedEndpoints;
- (id)resolvedEndpointsDidUpdateHandler;
- (void)_noteSourceDidDiscoverEndpointMap:(id)a3 forLocalURI:(id)a4;
- (void)_registerEndpointQueryCompletionBlock;
- (void)_signalDidUpdateEndpoints;
- (void)dealloc;
- (void)initializeWithCompletion:(id)a3;
- (void)setEndpointMap:(id)a3;
- (void)setResolvedEndpointsDidUpdateHandler:(id)a3;
@end

@implementation IDSEndpointSubscription

- (IDSEndpointSubscription)initWithServiceIdentifier:(id)a3 localURI:(id)a4 subscribedURIs:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IDSEndpointSubscription;
  v15 = [(IDSEndpointSubscription *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a6);
    objc_storeStrong((id *)&v16->_serviceIdentifier, a3);
    objc_storeStrong((id *)&v16->_localURI, a4);
    objc_storeStrong((id *)&v16->_subscribedURIs, a5);
    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    endpointMap = v16->_endpointMap;
    v16->_endpointMap = v17;

    uint64_t v19 = +[NSString stringGUID];
    peerIDManagerToken = v16->_peerIDManagerToken;
    v16->_peerIDManagerToken = (NSString *)v19;
  }
  return v16;
}

- (void)dealloc
{
  v3 = +[IDSPeerIDManager sharedInstance];
  [v3 removeEndpointQueryCompletionBlockForToken:self->_peerIDManagerToken];

  v4.receiver = self;
  v4.super_class = (Class)IDSEndpointSubscription;
  [(IDSEndpointSubscription *)&v4 dealloc];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(IDSEndpointSubscription *)self serviceIdentifier];
  v5 = [(IDSEndpointSubscription *)self localURI];
  v6 = [(IDSEndpointSubscription *)self subscribedURIs];
  v7 = +[NSString stringWithFormat:@"<%@: %p serviceIdentifier: %@, localURI: %@, subscribedURIs: %@>", v3, self, v4, v5, v6];

  return v7;
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (void)initializeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(IDSEndpointSubscription *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[IDSFoundationLog query];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initializing endpoint subscription {self: %@}", buf, 0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = [(IDSEndpointSubscription *)self peerIDManager];
  v8 = [(IDSEndpointSubscription *)self subscribedURIs];
  v9 = [(IDSEndpointSubscription *)self serviceIdentifier];
  v10 = [(IDSEndpointSubscription *)self localURI];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100026C88;
  v13[3] = &unk_10097E900;
  objc_copyWeak(&v15, (id *)buf);
  v13[4] = self;
  id v11 = v4;
  id v14 = v11;
  id v12 = [(IDSEndpointSubscription *)self queue];
  [v7 endpointsForURIs:v8 serviceIdentifier:v9 localURI:v10 completion:v13 queue:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (id)resolvedEndpoints
{
  uint64_t v3 = [(IDSEndpointSubscription *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(IDSEndpointSubscription *)self endpointMap];
  v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)_registerEndpointQueryCompletionBlock
{
  uint64_t v3 = [(IDSEndpointSubscription *)self queue];
  dispatch_assert_queue_V2(v3);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = [(IDSEndpointSubscription *)self peerIDManager];
  objc_copyWeak(&v8, &location);
  v5 = [(IDSEndpointSubscription *)self peerIDManagerToken];
  v6 = [(IDSEndpointSubscription *)self queue];
  [v4 addEndpointQueryCompletionBlock:&v7 forToken:v5 queue:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_noteSourceDidDiscoverEndpointMap:(id)a3 forLocalURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSEndpointSubscription *)self queue];
  dispatch_assert_queue_V2(v8);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (!v10)
  {

    goto LABEL_23;
  }
  id v11 = v10;
  char v22 = 0;
  uint64_t v12 = *(void *)v24;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      if (v7)
      {
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (v14)
        {
          long long v15 = [(IDSEndpointSubscription *)self localURI];
          if ([v7 isEqual:v15])
          {
            v16 = [(IDSEndpointSubscription *)self subscribedURIs];
            unsigned int v17 = [v16 containsObject:v14];

            if (!v17) {
              continue;
            }
            long long v15 = [v9 objectForKeyedSubscript:v14];
            id v18 = v15;
            if (!v15)
            {
              id v18 = objc_alloc_init((Class)NSArray);
              v21 = v18;
            }
            uint64_t v19 = [(IDSEndpointSubscription *)self endpointMap];
            [v19 setObject:v18 forKeyedSubscript:v14];

            if (!v15) {
            char v22 = 1;
            }
          }
        }
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
  }
  while (v11);

  if (v22)
  {
    v20 = +[IDSFoundationLog query];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Endpoints subscription source did discover relevant endpoints {self: %@, localURI: %@@, endpointMap: %@}", buf, 0x20u);
    }

    [(IDSEndpointSubscription *)self _signalDidUpdateEndpoints];
  }
LABEL_23:
}

- (void)_signalDidUpdateEndpoints
{
  uint64_t v3 = [(IDSEndpointSubscription *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IDSEndpointSubscription *)self resolvedEndpointsDidUpdateHandler];

  if (v4)
  {
    id v6 = [(IDSEndpointSubscription *)self resolvedEndpointsDidUpdateHandler];
    v5 = [(IDSEndpointSubscription *)self resolvedEndpoints];
    v6[2](v6, v5);
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (IDSURI)localURI
{
  return self->_localURI;
}

- (NSArray)subscribedURIs
{
  return self->_subscribedURIs;
}

- (id)resolvedEndpointsDidUpdateHandler
{
  return self->_resolvedEndpointsDidUpdateHandler;
}

- (void)setResolvedEndpointsDidUpdateHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)endpointMap
{
  return self->_endpointMap;
}

- (void)setEndpointMap:(id)a3
{
}

- (NSString)peerIDManagerToken
{
  return self->_peerIDManagerToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerIDManagerToken, 0);
  objc_storeStrong((id *)&self->_endpointMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_resolvedEndpointsDidUpdateHandler, 0);
  objc_storeStrong((id *)&self->_subscribedURIs, 0);
  objc_storeStrong((id *)&self->_localURI, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end