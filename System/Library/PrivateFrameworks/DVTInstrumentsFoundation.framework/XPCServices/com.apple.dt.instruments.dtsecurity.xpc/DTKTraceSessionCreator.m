@interface DTKTraceSessionCreator
+ (id)getDefaultedRemotePath:(int *)a3;
- (BOOL)stopWithError:(id *)a3;
- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5;
- (id)_providerTopErrors;
@end

@implementation DTKTraceSessionCreator

- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)DTKTraceSessionCreator;
  v8 = [(DTKTraceSessionCreator *)&v50 init];
  if (!v8) {
    goto LABEL_40;
  }
  v9 = [v7 bitmap];
  if (!v9)
  {
    BOOL v12 = a5 == 0;
LABEL_9:
    uint64_t v15 = ktrace_session_create();
    ktrace_session_set_event_names_enabled();
    ktrace_session_set_default_event_names_enabled();
    ktrace_set_only_do_time_sensitive_postprocess();
    if ([v7 collectionInterval]) {
      [v7 collectionInterval];
    }
    ktrace_set_collection_interval();
    if (!v15) {
      goto LABEL_19;
    }
    v16 = [v7 bitmap];
    if (v16)
    {
      id v17 = [v7 bitmap];
      [v17 bytes];
      uint64_t v18 = ktrace_events_filter_bitmap();
    }
    else
    {
      uint64_t v18 = ktrace_events_all();
    }

    if (v18)
    {
      if (!v12)
      {
        NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
        v19 = +[NSString stringWithFormat:@"error: %d", v18];
        v58 = v19;
        v20 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        *a5 = +[NSError errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v20];
      }
LABEL_18:
      ktrace_session_destroy();
      goto LABEL_19;
    }
    if ([v7 useExisting])
    {
      uint64_t v22 = ktrace_set_use_existing();
      if (v22)
      {
        if (!v12)
        {
          NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
          v23 = +[NSString stringWithFormat:@"error: %d", v22];
          v56 = v23;
          v24 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          *a5 = +[NSError errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v24];
        }
        goto LABEL_18;
      }
    }
    else
    {
      v25 = objc_opt_new();
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x3032000000;
      v47 = sub_100004710;
      v48 = sub_100004720;
      id v49 = 0;
      v26 = [v7 providers];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100004728;
      v40[3] = &unk_100014B00;
      v42 = &v44;
      uint64_t v43 = v15;
      id v39 = v25;
      id v41 = v39;
      [v26 enumerateKeysAndObjectsUsingBlock:v40];

      uint64_t v27 = v45[5];
      if (v27)
      {
        NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
        v28 = +[NSString stringWithFormat:@"Failed to instantiate data providers"];
        v54 = v28;
        v29 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        providerLoggers = +[NSError errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:1 userInfo:v29];

        if (!v12) {
          *a5 = providerLoggers;
        }
        ktrace_session_destroy();
      }
      else
      {
        v31 = (NSArray *)v39;
        providerLoggers = v8->_providerLoggers;
        v8->_providerLoggers = v31;
      }

      _Block_object_dispose(&v44, 8);
      if (v27) {
        goto LABEL_19;
      }
    }
    dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
    v33 = v32;
    ktrace_set_completion_handler();
    objc_storeStrong((id *)&v8->_stoppingSemaphore, v32);
    uint64_t started = ktrace_start_writing_fd();
    if (started)
    {
      if (!v12)
      {
        NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
        v35 = +[NSString stringWithFormat:@"error: %d", started];
        v52 = v35;
        v36 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        *a5 = +[NSError errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v36];
      }
      goto LABEL_19;
    }
    if ([v7 useExisting])
    {
      dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      if (v8->_ktraceSession) {
        ktrace_session_destroy();
      }
      stoppingSemaphore = v8->_stoppingSemaphore;
      v8->_ktraceSession = 0;
      v8->_stoppingSemaphore = 0;
    }
    v8->_ktraceSession = (ktrace_session *)v15;

LABEL_40:
    v21 = v8;
    goto LABEL_41;
  }
  v10 = [v7 bitmap];
  BOOL v11 = [v10 length] == (id)0x2000;

  BOOL v12 = a5 == 0;
  if (a5) {
    char v13 = v11;
  }
  else {
    char v13 = 1;
  }
  if (v13) {
    goto LABEL_9;
  }
  NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
  CFStringRef v60 = @"Invalid tracing configuration bitmap";
  v14 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  *a5 = +[NSError errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v14];

LABEL_19:
  v21 = 0;
LABEL_41:

  return v21;
}

- (id)_providerTopErrors
{
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_providerLoggers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) errors:v12];
        if ([v9 count])
        {
          v10 = [v9 firstObject];
          [v3 addObject:v10];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)stopWithError:(id *)a3
{
  if (!self->_ktraceSession) {
    return 1;
  }
  if (!self->_stoppingSemaphore) {
    sub_10000E0C0();
  }
  ktrace_end();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_stoppingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  ktrace_session_destroy();
  self->_ktraceSession = 0;
  id v5 = [(DTKTraceSessionCreator *)self _providerTopErrors];
  if (![v5 count])
  {

    return 1;
  }
  id v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) userInfo];
        long long v13 = [v12 objectForKeyedSubscript:@"DVTKtraceSessionProviderName"];

        if (v13) {
          [v6 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }

  v24[0] = NSLocalizedDescriptionKey;
  long long v14 = [v6 allObjects];
  long long v15 = [v14 componentsJoinedByString:@", "];
  v16 = +[NSString stringWithFormat:@"Data Providers emitted errors: %@", v15];
  v24[1] = @"DVTKtraceSessionProviderErrorsArrayKey";
  v25[0] = v16;
  v25[1] = v7;
  id v17 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  uint64_t v18 = +[NSError errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:2 userInfo:v17];

  if (a3) {
    *a3 = v18;
  }

  return 0;
}

+ (id)getDefaultedRemotePath:(int *)a3
{
  if (!a3)
  {
    long long v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"DTKTraceHelpers.m", 272, @"Invalid parameter not satisfying: %@", @"outFD != nil" object file lineNumber description];
  }
  v4 = NSTemporaryDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"instrumentsXXXXXX.ktrace"];

  id v6 = v5;
  id v7 = strdup((const char *)[v6 fileSystemRepresentation]);
  *a3 = mkstemps(v7, 7);
  id v8 = +[NSString stringWithUTF8String:v7];
  id v9 = +[NSURL URLWithString:v8];

  free(v7);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerLoggers, 0);
  objc_storeStrong((id *)&self->_stoppingSemaphore, 0);
}

@end