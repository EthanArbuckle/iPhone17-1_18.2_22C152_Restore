@interface MGRemoteQueryClientHandlerQuery
+ (id)handlerWithQuery:(id)a3 forGroupsQueryAgent:(id)a4;
- (BOOL)seenInitialResponse;
- (BOOL)validateResponse:(id)a3;
- (MGGroupsMediator)groupsMediator;
- (MGOutstandingQuery)query;
- (NSString)description;
- (id)_initWithQuery:(id)a3 groupsQueryAgent:(id)a4;
- (id)handleCompleteResponse:(id)a3 jsonPayload:(id)a4;
- (void)prepareURL:(id)a3;
- (void)setSeenInitialResponse:(BOOL)a3;
@end

@implementation MGRemoteQueryClientHandlerQuery

+ (id)handlerWithQuery:(id)a3 forGroupsQueryAgent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithQuery:v7 groupsQueryAgent:v6];

  return v8;
}

- (id)_initWithQuery:(id)a3 groupsQueryAgent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MGRemoteQueryClientHandlerQuery;
  v9 = [(MGRemoteQueryClientHandlerQuery *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_seenInitialResponse = 0;
    v11 = [[MGGroupsMediator alloc] initWithGroupsQueryAgent:v8];
    groupsMediator = v10->_groupsMediator;
    v10->_groupsMediator = v11;
  }
  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MGRemoteQueryClientHandlerQuery *)self query];
  id v7 = [v6 identifier];
  id v8 = [(MGRemoteQueryClientHandlerQuery *)self groupsMediator];
  v9 = [v3 stringWithFormat:@"<%@: %p, _query = %@, _mediator = %p>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (void)prepareURL:(id)a3
{
  id v11 = a3;
  [v11 setPath:0x26DD64598];
  v4 = [v11 queryItems];
  v5 = (void *)[v4 mutableCopy];

  if (!v5) {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  }
  id v6 = (void *)MEMORY[0x263F08BD0];
  id v7 = [(MGRemoteQueryClientHandlerQuery *)self query];
  id v8 = [v7 predicate];
  v9 = [v8 predicateFormat];
  v10 = [v6 queryItemWithName:0x26DD645D8 value:v9];
  [v5 addObject:v10];

  [v11 setQueryItems:v5];
}

- (BOOL)validateResponse:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MGRemoteQueryClientHandlerQuery *)self seenInitialResponse];
  id v6 = [NSString stringWithUTF8String:*MEMORY[0x263F14540]];
  id v7 = [v4 valueForHTTPHeaderField:v6];

  if (v5)
  {
    char v8 = [@"application/json; charset=utf8" isEqual:v7];
  }
  else
  {
    char v8 = [v7 hasPrefix:@"multipart/x-mixed-replace;"];
    [(MGRemoteQueryClientHandlerQuery *)self setSeenInitialResponse:1];
  }

  return v8;
}

- (id)handleCompleteResponse:(id)a3 jsonPayload:(id)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  BOOL v5 = +[MGRemoteQueryReply rq_instanceFromCoded:a4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 error];
    if (v7)
    {
      char v8 = MGLogForCategory(6);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v43 = self;
        __int16 v44 = 2112;
        uint64_t v45 = 0;
        _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p client handler received error in query reply %@", buf, 0x16u);
      }

      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *MEMORY[0x263F08438];
      uint64_t v50 = *MEMORY[0x263F08608];
      v51[0] = v7;
      id v11 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
      v12 = [v9 errorWithDomain:v10 code:104 userInfo:v11];

      id v13 = v12;
    }
    else
    {
      v15 = [v6 groups];
      v16 = [(MGRemoteQueryClientHandlerQuery *)self groupsMediator];
      v17 = MGLogForCategory(6);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v43 = self;
        __int16 v44 = 2048;
        uint64_t v45 = [v15 count];
        __int16 v46 = 2048;
        v47 = v16;
        __int16 v48 = 2112;
        v49 = v15;
        _os_log_impl(&dword_229257000, v17, OS_LOG_TYPE_DEFAULT, "%p client handler receiving %lu groups into %p: %@", buf, 0x2Au);
      }

      v18 = [v16 currentGroups];
      v19 = [v16 startActivityWithName:@"Remote Query"];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v20 = [v18 allValues];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v37 != v23) {
              objc_enumerationMutation(v20);
            }
            [v16 removeGroup:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v22);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v25 = v15;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v33 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            objc_msgSend(v30, "rq_setSourcedRemotely:", 1, (void)v32);
            [v16 addGroup:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v27);
      }

      [v16 endActivity:v19];
      id v13 = 0;
    }
  }
  else
  {
    objc_super v14 = MGLogForCategory(6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v43 = self;
      _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p client handler received malformed query payload content", buf, 0xCu);
    }

    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:94 userInfo:0];
  }

  return v13;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (BOOL)seenInitialResponse
{
  return self->_seenInitialResponse;
}

- (void)setSeenInitialResponse:(BOOL)a3
{
  self->_seenInitialResponse = a3;
}

- (MGGroupsMediator)groupsMediator
{
  return self->_groupsMediator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsMediator, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end