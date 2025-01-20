@interface SHAMSPaginatedEndpointRequester
- (SHAMSEndpointRequester)endpointRequester;
- (SHAMSPaginatedEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4;
- (void)invalidate;
- (void)performRequests:(id)a3 completionHandler:(id)a4;
- (void)setEndpointRequester:(id)a3;
@end

@implementation SHAMSPaginatedEndpointRequester

- (SHAMSPaginatedEndpointRequester)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHAMSPaginatedEndpointRequester;
  v7 = [(SHAMSPaginatedEndpointRequester *)&v11 init];
  if (v7)
  {
    v8 = [[SHAMSEndpointRequester alloc] initWithClientIdentifier:v6 clientType:a4];
    endpointRequester = v7->_endpointRequester;
    v7->_endpointRequester = v8;
  }
  return v7;
}

- (void)performRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_group_create();
  if (v8)
  {
    v21 = v7;
    queue = dispatch_queue_create("com.apple.ShazamKit.PaginatedEndpointRequester", 0);
    v9 = dispatch_semaphore_create(5);
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v6;
    id obj = v6;
    id v11 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          dispatch_group_enter(v8);
          dispatch_time_t v16 = dispatch_time(0, 30000000000);
          dispatch_semaphore_wait(v9, v16);
          v17 = [(SHAMSPaginatedEndpointRequester *)self endpointRequester];
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100043D18;
          v28[3] = &unk_100075FC0;
          v29 = queue;
          id v30 = v10;
          v31 = v8;
          v32 = v9;
          [v17 performRequest:v15 withReply:v28];
        }
        id v12 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v12);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043DE4;
    block[3] = &unk_100075088;
    id v7 = v21;
    id v26 = v10;
    id v27 = v21;
    id v18 = v10;
    v19 = queue;
    dispatch_group_notify(v8, queue, block);

    id v6 = v22;
  }
  else
  {
    v20 = sh_log_object();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to create dispatch group for paginated network request", buf, 2u);
    }

    NSErrorUserInfoKey v39 = NSDebugDescriptionErrorKey;
    CFStringRef v40 = @"Failed to start paginated network request";
    v19 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v9 = +[SHError errorWithCode:500 underlyingError:0 keyOverrides:v19];
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v9);
  }
}

- (void)invalidate
{
  id v2 = [(SHAMSPaginatedEndpointRequester *)self endpointRequester];
  [v2 invalidate];
}

- (SHAMSEndpointRequester)endpointRequester
{
  return self->_endpointRequester;
}

- (void)setEndpointRequester:(id)a3
{
}

- (void).cxx_destruct
{
}

@end