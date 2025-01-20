@interface VideoConversionService
+ (id)resourceURLCollectionForDestinationBookmarkDictionary:(id)a3 error:(id *)a4;
+ (void)_forceCrashAfterVideoConversionHangDetectedWithMarker;
+ (void)run;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)optionsRequirePhotosAdjustmentProcessing:(id)a3;
- (MediaConversionQueue)requestQueue;
- (NSXPCListener)listener;
- (VideoConversionService)init;
- (id)connectionTerminationEventHandlerForConnectionIdentifier:(id)a3 eventDescription:(id)a4;
- (void)cancelJobWithIdentifier:(id)a3;
- (void)cancelJobsForConnectionWithIdentifier:(id)a3;
- (void)conversionQueue:(id)a3 cancelCurrentlyProcessingEntry:(id)a4;
- (void)conversionQueue:(id)a3 didCancelQueuedEntry:(id)a4 clientRequests:(id)a5;
- (void)conversionQueue:(id)a3 processNextEntry:(id)a4;
- (void)convertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)echo:(id)a3 reply:(id)a4;
- (void)extractStillImageFromVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)generateGIFForVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)modifyJobWithIdentifier:(id)a3 modifications:(id)a4;
- (void)performConversionOfClass:(Class)a3 forSourceBookmarkDictionary:(id)a4 destinationBookmarkDictionary:(id)a5 options:(id)a6 replyHandler:(id)a7;
- (void)requestStatusWithReply:(id)a3;
- (void)run;
- (void)setListener:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)singlePassConvertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6;
@end

@implementation VideoConversionService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setRequestQueue:(id)a3
{
}

- (MediaConversionQueue)requestQueue
{
  return (MediaConversionQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (id)connectionTerminationEventHandlerForConnectionIdentifier:(id)a3 eventDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100021800;
  v12[3] = &unk_1000417E0;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = objc_retainBlock(v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  uint64_t v5 = +[NSUUID UUID];
  id v6 = [v4 _xpcConnection];
  pid_t pid = xpc_connection_get_pid(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v5;
    __int16 v28 = 1024;
    pid_t v29 = pid;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Connection %{public}@ [%d] accepted", buf, 0x12u);
  }
  CFStringRef v24 = @"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY";
  uint64_t v25 = v5;
  v22 = (void *)v5;
  id v8 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v4 setUserInfo:v8];

  id v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VideoConversionService];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
  [v9 setClasses:v17 forSelector:"convertVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:" argumentIndex:2 ofReply:0];
  [v9 setClasses:v17 forSelector:"extractStillImageFromVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:" argumentIndex:2 ofReply:0];
  [v4 setExportedInterface:v9];
  [v4 setExportedObject:self];
  v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VideoConversionServiceClient];
  [v4 setRemoteObjectInterface:v18];

  v19 = [(VideoConversionService *)self connectionTerminationEventHandlerForConnectionIdentifier:v22 eventDescription:@"interruption"];
  [v4 setInterruptionHandler:v19];

  v20 = [(VideoConversionService *)self connectionTerminationEventHandlerForConnectionIdentifier:v22 eventDescription:@"invalidation"];
  [v4 setInvalidationHandler:v20];

  [v4 resume];
  return 1;
}

- (void)requestStatusWithReply:(id)a3
{
  CFStringRef v7 = @"PAMediaConversionServiceProcessIdentifierKey";
  id v4 = a3;
  uint64_t v5 = +[NSNumber numberWithInt:getpid()];
  id v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v6, 0);
}

- (void)cancelJobsForConnectionWithIdentifier:(id)a3
{
  requestQueue = self->_requestQueue;
  id v4 = [a3 UUIDString];
  [(MediaConversionQueue *)requestQueue cancelRequestsForConnectionIdentifier:v4];
}

- (void)cancelJobWithIdentifier:(id)a3
{
}

- (void)modifyJobWithIdentifier:(id)a3 modifications:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Modify job for request %{public}@: %{public}@", buf, 0x16u);
  }
  requestQueue = self->_requestQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100021E68;
  v12[3] = &unk_1000417B8;
  id v13 = v7;
  id v14 = v8;
  uint64_t v15 = self;
  SEL v16 = a2;
  id v10 = v8;
  id v11 = v7;
  [(MediaConversionQueue *)requestQueue modifyRequestWithIdentifier:v11 changeHandler:v12];
}

- (void)extractStillImageFromVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(VideoConversionService *)self performConversionOfClass:objc_opt_class() forSourceBookmarkDictionary:v13 destinationBookmarkDictionary:v12 options:v11 replyHandler:v10];
}

- (void)singlePassConvertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(VideoConversionService *)self performConversionOfClass:objc_opt_class() forSourceBookmarkDictionary:v13 destinationBookmarkDictionary:v12 options:v11 replyHandler:v10];
}

- (void)generateGIFForVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(VideoConversionService *)self performConversionOfClass:objc_opt_class() forSourceBookmarkDictionary:v13 destinationBookmarkDictionary:v12 options:v11 replyHandler:v10];
}

- (void)convertVideoAtSourceBookmarkDictionary:(id)a3 toDestinationBookmarkDictionary:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(VideoConversionService *)self optionsRequirePhotosAdjustmentProcessing:v11];
  [(VideoConversionService *)self performConversionOfClass:objc_opt_class() forSourceBookmarkDictionary:v13 destinationBookmarkDictionary:v12 options:v11 replyHandler:v10];
}

- (void)echo:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [a3 stringByAppendingString:a3];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)conversionQueue:(id)a3 cancelCurrentlyProcessingEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Request queue issued cancellation of currently processing queue entry %{public}@", (uint8_t *)&v11, 0xCu);
  }
  id v9 = [v8 videoConversionTask];
  if (!v9)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1763 description:@"Unexpected nil conversion task"];
  }
  [v9 cancel];
}

- (void)conversionQueue:(id)a3 processNextEntry:(id)a4
{
  id v37 = a3;
  id v39 = a4;
  v41 = [v39 videoConversionTask];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100022B8C;
  v47[3] = &unk_100041790;
  v49 = &v50;
  dsema = dispatch_semaphore_create(0);
  v48 = dsema;
  [v41 setCompletionHandler:v47];
  id v6 = [v41 options];
  v38 = [v6 objectForKeyedSubscript:@"_unitTestPreConversionDelayKey"];

  if (v38) {
    sleep([v38 intValue]);
  }
  [v41 performConversion];
  while (1)
  {
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    if (!dispatch_semaphore_wait(dsema, v7)) {
      break;
    }
    if ([v41 didDetectHang])
    {
      id v8 = [v39 sourceURLCollection];
      id v9 = [v8 filenameExtensionAndPathHashForRole:@"PAMediaConversionResourceRoleMainResource"];

      id v10 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v11 = [v39 sourceURLCollection];
        id v12 = [v11 logMessageSummary];
        *(_DWORD *)buf = 138543875;
        id v56 = v39;
        __int16 v57 = 2113;
        v58 = v9;
        __int16 v59 = 2114;
        v60 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timeout for %{public}@ with stalled conversion for %{private}@ (%{public}@), forcing exit", buf, 0x20u);
      }
      [(id)objc_opt_class() _forceCrashAfterVideoConversionHangDetectedWithMarker];
    }
  }
  v36 = [v41 error];
  v35 = [v41 resultInformation];
  uint64_t v42 = v51[3];
  id v13 = [v41 resultInformation];
  if (v13) {
    goto LABEL_10;
  }
  id v14 = [v41 error];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1729 description:@"Conversion task finished without output information or error"];
LABEL_10:
  }
  v34 = [v41 outputURLCollection];
  SEL v16 = [v41 resultInformation];
  v17 = [v16 objectForKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];
  id v18 = [v41 options];
  __int16 v19 = [v18 objectForKeyedSubscript:@"PAMediaConversionServiceOptionOutputFileTypeKey"];
  id v20 = [v37 markCompletionAndRetrieveClientRequestsForQueueEntry:v39 resultURLCollection:v34 didConvertSuccessfully:v42 == 1 conversionOutputInformation:v35 conversionOutputData:v17 conversionOutputFileType:v19 conversionError:v36];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v44;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v27 = [v25 requestTracker];
        __int16 v28 = v27;
        if (v42 == 1)
        {
          pid_t v29 = [v27 outputInformation];
        }
        else
        {
          pid_t v29 = 0;
        }
        v30 = [v25 videoClientReplyHandler];
        uint64_t v31 = v51[3];
        v32 = [v28 error];
        ((void (**)(void, uint64_t, void *, void *))v30)[2](v30, v31, v29, v32);
      }
      id v22 = [v21 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v22);
  }

  _Block_object_dispose(&v50, 8);
}

- (void)conversionQueue:(id)a3 didCancelQueuedEntry:(id)a4 clientRequests:(id)a5
{
  id v28 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 videoConversionTask];
  id v12 = [v11 status];
  if (v12 != (id)5)
  {
    unint64_t v24 = (unint64_t)v12;
    uint64_t v25 = +[NSAssertionHandler currentHandler];
    if (v24 > 6) {
      v26 = 0;
    }
    else {
      v26 = off_1000414C0[v24];
    }
    uint64_t v27 = v26;
    [v25 handleFailureInMethod:a2, self, @"VideoConversionService.m", 1684, @"Unexpected conversion task status %@ during cancellation of queued task", v27, v28 object file lineNumber description];
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100022E30;
  v33[3] = &unk_100041768;
  id v13 = v9;
  id v34 = v13;
  [v11 setCompletionHandler:v33];
  [v11 cancel];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v18);
        id v21 = [v19 requestTracker];
        id v22 = [v19 videoClientReplyHandler];
        uint64_t v23 = [v21 error];
        ((void (**)(void, uint64_t, void, void *))v22)[2](v22, 4, 0, v23);

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v16);
  }
}

- (BOOL)optionsRequirePhotosAdjustmentProcessing:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAdjustmentInformationKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)performConversionOfClass:(Class)a3 forSourceBookmarkDictionary:(id)a4 destinationBookmarkDictionary:(id)a5 options:(id)a6 replyHandler:(id)a7
{
  id v13 = a4;
  id v69 = a5;
  id v14 = a6;
  id v15 = a7;
  v71 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
  if (!v71)
  {
    v58 = +[NSAssertionHandler currentHandler];
    [v58 handleFailureInMethod:a2, self, @"VideoConversionService.m", 1537, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }
  id v16 = +[NSXPCConnection currentConnection];
  v66 = [v16 userInfo];
  uint64_t v17 = [v66 objectForKeyedSubscript:@"PAMCS_CONNECTION_USER_INFO_CONNECTION_IDENTIFIER_KEY"];
  id v18 = objc_opt_new();
  v67 = v16;
  [v18 setConnection:v16];
  v68 = (void *)v17;
  [v18 setConnectionIdentifier:v17];
  [v18 setVideoClientReplyHandler:v15];
  __int16 v19 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsProgressKey"];
  objc_msgSend(v18, "setWantsProgress:", objc_msgSend(v19, "BOOLValue"));

  id v20 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"];
  id v21 = [v20 integerValue];

  id v64 = v15;
  if (!v21)
  {
    id v22 = [v14 mutableCopy];
    [v22 setObject:&off_100043ED0 forKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = @"background";
      *(_DWORD *)buf = 138543618;
      v76 = v71;
      __int16 v77 = 2112;
      CFStringRef v78 = @"background";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request %{public}@ does not have a priority, the client should provide one. Defaulting to %@.", buf, 0x16u);
    }
    id v14 = v22;
  }
  unint64_t v24 = [(MediaConversionQueue *)self->_requestQueue nextRequestNumber];
  id v25 = [v14 mutableCopy];
  [v25 setObject:v13 forKeyedSubscript:@"PAMediaConversionServiceSourceBookmarkCollectionKey"];
  v65 = v25;
  unint64_t v60 = v24;
  v70 = [[MediaConversionRequestTracker alloc] initWithRequestOptions:v25 requestNumber:v24];
  objc_msgSend(v18, "setRequestTracker:");
  v26 = [(MediaConversionQueue *)self->_requestQueue queueEntryWithConversionOptions:v14];
  objc_msgSend(v26, "setTaskTypeSupportsDeduplication:", -[objc_class supportsDeduplication](a3, "supportsDeduplication"));
  uint64_t v27 = [v26 identifier];
  id v74 = 0;
  id v28 = +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryFilesDirectoryURLForConversionTaskIdentifier:v27 error:&v74];
  long long v29 = (__CFString *)v74;

  if (v28)
  {
    v61 = a3;
    [v26 setTemporaryFilesParentDirectoryURL:v28];
    [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionWantsResultAsDataKey"];
    long long v31 = v30 = v28;
    unsigned int v32 = [v31 BOOLValue];

    v62 = v30;
    id v63 = v13;
    if (v32)
    {
      v33 = [v30 URLByAppendingPathComponent:v71];
      id v34 = [v33 URLByAppendingPathExtension:@"mov"];

      uint64_t v35 = +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:v34];
    }
    else
    {
      v73 = v29;
      id v34 = [(id)objc_opt_class() resourceURLCollectionForDestinationBookmarkDictionary:v69 error:&v73];
      v38 = v73;

      if (!v34)
      {
        v40 = [(__CFString *)v38 domain];
        if ([v40 isEqualToString:NSCocoaErrorDomain])
        {
          id v41 = [(__CFString *)v38 code];

          v36 = (void (**)(void, void, void, void))v64;
          if (v41 == (id)4)
          {
            [v18 setRequiresDeduplicationAgainstOriginalWithIdenticalOutput:1];
            id v34 = 0;
            uint64_t v35 = 0;
            long long v29 = v38;
            id v13 = v63;
LABEL_22:
            id v37 = v70;

            id v42 = [[v61 alloc] initWithSourceBookmarkDictionary:v13 outputURLCollection:v35 options:v14 requestTracker:v70];
            long long v43 = [v42 sourceURLCollection];
            [v26 setSourceURLCollection:v43];

            uint64_t v44 = [v26 identifier];
            [v42 setIdentifier:v44];

            [v26 setVideoConversionTask:v42];
            [v42 setProgressObserver:v26];
            [v42 didEnqueue];
            requestQueue = self->_requestQueue;
            id v72 = 0;
            LOBYTE(v44) = [(MediaConversionQueue *)requestQueue enqueueEntry:v26 clientRequest:v18 isDuplicateOfOriginalQueueEntry:&v72];
            id v46 = v72;
            v47 = v46;
            __int16 v59 = (void *)v35;
            if (v44)
            {
              if (v46) {
                v48 = v46;
              }
              else {
                v48 = v26;
              }
              id v49 = v48;
              if (!v47) {
                [v42 startProgressUpdateTimerAndMarkStartTime];
              }
              uint64_t v50 = [v14 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                [v49 identifier];
                uint64_t v52 = v51 = v36;
                *(_DWORD *)buf = 134219266;
                v76 = (__CFString *)v60;
                __int16 v77 = 2114;
                CFStringRef v78 = v71;
                __int16 v79 = 2114;
                v80 = v52;
                __int16 v81 = 1024;
                BOOL v82 = v47 != 0;
                __int16 v83 = 2114;
                v84 = v50;
                __int16 v85 = 2114;
                v86 = v68;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received conversion request #%lu %{public}@, attached to conversion task %{public}@, isDuplicate = %d, reason '%{public}@', connection %{public}@", buf, 0x3Au);

                v36 = v51;
                id v37 = v70;
              }
            }
            else
            {
              unsigned int v53 = [v18 requiresDeduplicationAgainstOriginalWithIdenticalOutput];
              BOOL v54 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v53)
              {
                if (v54)
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to enqueue new request, required deduplication failed", buf, 2u);
                }
                NSErrorUserInfoKey v89 = NSDebugDescriptionErrorKey;
                CFStringRef v90 = @"Unable to enqueue new request, required deduplication failed";
                v55 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
                uint64_t v56 = 4;
              }
              else
              {
                if (v54)
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to enqueue new request, unknown reason", buf, 2u);
                }
                NSErrorUserInfoKey v87 = NSDebugDescriptionErrorKey;
                CFStringRef v88 = @"Unable to enqueue new request, unknown reason";
                v55 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
                uint64_t v56 = 0;
              }
              uint64_t v57 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:v56 userInfo:v55];

              v36[2](v36, 2, 0, v57);
              long long v29 = (__CFString *)v57;
            }

LABEL_40:
            id v28 = v62;
            id v13 = v63;
            goto LABEL_41;
          }
        }
        else
        {

          v36 = (void (**)(void, void, void, void))v64;
        }
        id v37 = v70;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v76 = v71;
          __int16 v77 = 2112;
          CFStringRef v78 = v38;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to resolve final destination URLs for %{public}@: %@", buf, 0x16u);
        }
        ((void (**)(void, uint64_t, void, __CFString *))v36)[2](v36, 2, 0, v38);
        long long v29 = v38;
        goto LABEL_40;
      }
      [(MediaConversionRequestTracker *)v70 setDestinationURLCollection:v34];
      if ([v26 taskTypeSupportsDeduplication])
      {
        id v39 = +[PAMediaConversionServiceSharedUtilitiesServiceSide temporaryDestinationURLCollectionForFinalDestinationURLCollection:v34 inParentDirectoryURL:v30];
      }
      else
      {
        id v39 = v34;
        id v34 = v39;
      }
      uint64_t v35 = (uint64_t)v39;
      long long v29 = v38;
      id v13 = v63;
    }
    v36 = (void (**)(void, void, void, void))v64;
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v76 = v71;
    __int16 v77 = 2112;
    CFStringRef v78 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create temporary files directory for request %{public}@: %@", buf, 0x16u);
  }
  v36 = (void (**)(void, void, void, void))v64;
  (*((void (**)(id, uint64_t, void, __CFString *))v64 + 2))(v64, 2, 0, v29);
  id v37 = v70;
LABEL_41:
}

- (void)run
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.photos.VideoConversionService"];
  [(VideoConversionService *)self setListener:v3];

  BOOL v4 = [(VideoConversionService *)self listener];
  [v4 setDelegate:self];

  uint64_t v5 = [(VideoConversionService *)self listener];
  [v5 resume];

  dispatch_main();
}

- (VideoConversionService)init
{
  v6.receiver = self;
  v6.super_class = (Class)VideoConversionService;
  v2 = [(VideoConversionService *)&v6 init];
  if (v2)
  {
    id v3 = [[MediaConversionQueue alloc] initWithDelegate:v2];
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;
  }
  return v2;
}

+ (void)_forceCrashAfterVideoConversionHangDetectedWithMarker
{
}

+ (id)resourceURLCollectionForDestinationBookmarkDictionary:(id)a3 error:(id *)a4
{
  uint64_t v5 = +[PAMediaConversionServiceResourceURLCollection collectionForBookmarkDataDictionaryRepresentation:a3 accessProvider:0 error:a4];
  objc_super v6 = v5;
  if (v5)
  {
    id v10 = 0;
    unsigned __int8 v7 = [v5 removeExistingEmptyFilesWithError:&v10];
    id v8 = v10;
    if (v7) {
      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to remove destination URL: %@", buf, 0xCu);
      if (!a4) {
        goto LABEL_6;
      }
    }
    else if (!a4)
    {
LABEL_6:

      objc_super v6 = 0;
      goto LABEL_8;
    }
    *a4 = v8;
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_8:

  return v6;
}

+ (void)run
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 run];
}

@end