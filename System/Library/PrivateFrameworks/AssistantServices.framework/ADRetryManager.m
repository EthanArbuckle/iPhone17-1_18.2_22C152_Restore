@interface ADRetryManager
- (BOOL)_canRestartRequest;
- (BOOL)_commandRefsOrIsCurrentRequest:(id)a3;
- (BOOL)commandRefsRestartCommand:(id)a3;
- (BOOL)shouldRetryOnConnectionFailure;
- (NSString)latestMappedRequestId;
- (id)nakedObjectsToRetry;
- (id)objectsToRetry;
- (id)originalRequestId;
- (id)retryRequestId;
- (void)_clearRequestCommands;
- (void)_objectsToRemapFromRefId:(id)a3 toRefId:(id)a4 retryFullRequest:(BOOL)a5 commandsToRetry:(id)a6;
- (void)appendSessionObjectToRequest:(id)a3;
- (void)beginRetryableRequest:(id)a3;
- (void)clearNakedObjects;
- (void)endRetryableRequestForCommand:(id)a3;
- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4;
- (void)setLastReceivedCommand:(id)a3;
- (void)setLatestMappedRequestId:(id)a3;
- (void)setNeedsToRetryNakedObjects;
@end

@implementation ADRetryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestMappedRequestId, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_nakedObjects, 0);
  objc_storeStrong((id *)&self->_requestObjects, 0);
  objc_storeStrong((id *)&self->_restartRequest, 0);
}

- (void)setLatestMappedRequestId:(id)a3
{
}

- (void)clearNakedObjects
{
  self->_needsToRetryNakedObjects = 0;
  self->_nakedObjects = 0;
  _objc_release_x1();
}

- (id)nakedObjectsToRetry
{
  if (self->_needsToRetryNakedObjects) {
    return self->_nakedObjects;
  }
  else {
    return 0;
  }
}

- (void)setNeedsToRetryNakedObjects
{
  self->_needsToRetryNakedObjects = 1;
}

- (NSString)latestMappedRequestId
{
  latestMappedRequestId = self->_latestMappedRequestId;
  if (latestMappedRequestId)
  {
    v3 = latestMappedRequestId;
  }
  else
  {
    v3 = [(ADRetryManager *)self originalRequestId];
  }
  return v3;
}

- (id)retryRequestId
{
  if ([(ADRetryManager *)self _canRestartRequest])
  {
    v3 = [(SARestartRequest *)self->_restartRequest aceId];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)originalRequestId
{
  return [(SARestartRequest *)self->_restartRequest requestId];
}

- (BOOL)commandRefsRestartCommand:(id)a3
{
  restartRequest = self->_restartRequest;
  id v4 = a3;
  v5 = [(SARestartRequest *)restartRequest aceId];
  v6 = [v4 refId];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)objectsToRetry
{
  ++self->_retryCount;
  v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    restartRequest = self->_restartRequest;
    v5 = v3;
    v6 = [(SARestartRequest *)restartRequest lastResponseId];
    int v20 = 136315394;
    v21 = "-[ADRetryManager objectsToRetry]";
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Can restart request if %@", (uint8_t *)&v20, 0x16u);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)-[NSMutableArray count](self->_requestObjects, "count") + 1);
  v8 = v7;
  if (self->_nakedObjects) {
    objc_msgSend(v7, "addObjectsFromArray:");
  }
  if ([(ADRetryManager *)self _canRestartRequest])
  {
    [v8 addObject:self->_restartRequest];
    v9 = [(SARestartRequest *)self->_restartRequest requestId];
    v10 = [(SARestartRequest *)self->_restartRequest aceId];
    [(ADRetryManager *)self _objectsToRemapFromRefId:v9 toRefId:v10 retryFullRequest:0 commandsToRetry:v8];
LABEL_14:

    goto LABEL_15;
  }
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    v21 = "-[ADRetryManager objectsToRetry]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Retrying full request", (uint8_t *)&v20, 0xCu);
  }
  originalRequest = self->_originalRequest;
  if (originalRequest)
  {
    v9 = [(SAServerBoundCommand *)originalRequest aceId];
    latestMappedRequestId = self->_latestMappedRequestId;
    if (!latestMappedRequestId)
    {
      v14 = AFSiriLogContextDaemon;
      BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
      latestMappedRequestId = (NSString *)v9;
      if (v15)
      {
        int v20 = 136315394;
        v21 = "-[ADRetryManager objectsToRetry]";
        __int16 v22 = 2112;
        v23 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s latestMappedRequestId is not set for %@", (uint8_t *)&v20, 0x16u);
        latestMappedRequestId = (NSString *)v9;
      }
    }
    v10 = latestMappedRequestId;
    id v16 = [(SAServerBoundCommand *)self->_originalRequest copy];
    [v16 setAceId:v10];
    [v8 addObject:v16];
    [(ADRetryManager *)self _objectsToRemapFromRefId:v9 toRefId:v10 retryFullRequest:1 commandsToRetry:v8];

    goto LABEL_14;
  }
  if (self->_requestObjects) {
    objc_msgSend(v8, "addObjectsFromArray:");
  }
LABEL_15:
  if ([v8 count]) {
    v17 = v8;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (void)_objectsToRemapFromRefId:(id)a3 toRefId:(id)a4 retryFullRequest:(BOOL)a5 commandsToRetry:(id)a6
{
  BOOL v7 = a5;
  id v28 = a3;
  id v26 = a4;
  id v10 = a6;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_requestObjects;
  id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v30;
    CFStringRef v15 = @"restart request";
    if (v7) {
      CFStringRef v15 = @"for full request";
    }
    CFStringRef v25 = v15;
    if (v28) {
      BOOL v16 = v26 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    int v17 = !v16;
    *(void *)&long long v12 = 136315650;
    long long v24 = v12;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v18);
        int v20 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v24;
          v34 = "-[ADRetryManager _objectsToRemapFromRefId:toRefId:retryFullRequest:commandsToRetry:]";
          __int16 v35 = 2112;
          v36 = v19;
          __int16 v37 = 2112;
          CFStringRef v38 = v25;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s object is %@ %@", buf, 0x20u);
          if (!v7)
          {
LABEL_16:
            if (!objc_msgSend(v19, "siriCore_isRestartable", v24)) {
              goto LABEL_22;
            }
          }
        }
        else if (!v7)
        {
          goto LABEL_16;
        }
        if (v17)
        {
          if (([v26 isEqualToString:v28] & 1) == 0)
          {
            v21 = [v19 refId];
            unsigned int v22 = [v21 isEqualToString:v28];

            if (v22) {
              [v19 setRefId:v26];
            }
          }
        }
        objc_msgSend(v10, "addObject:", v19, v24);
LABEL_22:
        id v18 = (char *)v18 + 1;
      }
      while (v13 != v18);
      id v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      id v13 = v23;
    }
    while (v23);
  }
}

- (BOOL)_canRestartRequest
{
  v2 = [(SARestartRequest *)self->_restartRequest lastResponseId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setLastReceivedCommand:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    BOOL v7 = "-[ADRetryManager setLastReceivedCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(SARestartRequest *)self->_restartRequest setLastResponseId:v4];
}

- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SARestartRequest *)self->_restartRequest requestId];
  v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    id v13 = "-[ADRetryManager endRetryableRequestForCommandAceId:refId:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  if (([v7 isEqualToString:v8] & 1) != 0
    || [v6 isEqualToString:v8])
  {
    [(ADRetryManager *)self _clearRequestCommands];
  }
  id v10 = [(SARestartRequest *)self->_restartRequest aceId];
  unsigned int v11 = [v10 isEqualToString:v7];

  if (v11) {
    [(ADRetryManager *)self _clearRequestCommands];
  }
}

- (void)endRetryableRequestForCommand:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADRetryManager endRetryableRequestForCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (!v4
    || [(ADRetryManager *)self _commandRefsOrIsCurrentRequest:v4]
    || [(ADRetryManager *)self commandRefsRestartCommand:v4])
  {
    [(ADRetryManager *)self _clearRequestCommands];
  }
}

- (BOOL)shouldRetryOnConnectionFailure
{
  return self->_retryCount < 5;
}

- (void)appendSessionObjectToRequest:(id)a3
{
  id v9 = a3;
  if (objc_msgSend(v9, "siriCore_isRetryable"))
  {
    requestObjects = self->_requestObjects;
    if (requestObjects)
    {
      id v5 = v9;
    }
    else
    {
      requestObjects = self->_nakedObjects;
      id v6 = v9;
      if (!requestObjects)
      {
        id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        nakedObjects = self->_nakedObjects;
        self->_nakedObjects = v7;

        id v6 = v9;
        requestObjects = self->_nakedObjects;
      }
      id v5 = v6;
    }
    [(NSMutableArray *)requestObjects addObject:v5];
  }
}

- (void)beginRetryableRequest:(id)a3
{
  id v4 = a3;
  if (self->_restartRequest)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      v19 = "-[ADRetryManager beginRetryableRequest:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Interrupting outstanding request for new request", (uint8_t *)&v18, 0xCu);
    }
    [(ADRetryManager *)self _clearRequestCommands];
  }
  id v6 = objc_alloc_init((Class)SARestartRequest);
  id v7 = SiriCoreUUIDStringCreate();
  [v6 setAceId:v7];
  v8 = [v4 aceId];
  [v6 setRequestId:v8];

  id v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    unsigned int v11 = [v6 aceId];
    int v12 = [v6 requestId];
    int v18 = 136315650;
    v19 = "-[ADRetryManager beginRetryableRequest:]";
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s AceId of RestartRequest is %@ requestId is %@", (uint8_t *)&v18, 0x20u);
  }
  restartRequest = self->_restartRequest;
  self->_restartRequest = (SARestartRequest *)v6;
  id v14 = v6;

  CFStringRef v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  requestObjects = self->_requestObjects;
  self->_requestObjects = v15;

  originalRequest = self->_originalRequest;
  self->_originalRequest = (SAServerBoundCommand *)v4;
}

- (BOOL)_commandRefsOrIsCurrentRequest:(id)a3
{
  restartRequest = self->_restartRequest;
  id v4 = a3;
  id v5 = [(SARestartRequest *)restartRequest requestId];
  id v6 = [v4 refId];
  id v7 = [v4 aceId];

  if ([v6 isEqualToString:v5]) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = [v7 isEqualToString:v5];
  }

  return v8;
}

- (void)_clearRequestCommands
{
  self->_retryCount = 0;
  restartRequest = self->_restartRequest;
  self->_restartRequest = 0;

  requestObjects = self->_requestObjects;
  self->_requestObjects = 0;
}

@end