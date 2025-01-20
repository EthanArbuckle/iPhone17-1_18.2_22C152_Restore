@interface DTKTraceSessionCreator
+ (id)getDefaultedRemotePath:(int *)a3;
- (BOOL)stopWithError:(id *)a3;
- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5;
- (id)_providerTopErrors;
@end

@implementation DTKTraceSessionCreator

- (DTKTraceSessionCreator)initWithFD:(int)a3 configuration:(id)a4 error:(id *)a5
{
  v65[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)DTKTraceSessionCreator;
  v8 = [(DTKTraceSessionCreator *)&v55 init];
  if (!v8) {
    goto LABEL_40;
  }
  v9 = [v7 bitmap];
  if (!v9)
  {
    BOOL v12 = a5 == 0;
LABEL_9:
    uint64_t v16 = ktrace_session_create();
    ktrace_session_set_event_names_enabled();
    ktrace_session_set_default_event_names_enabled();
    ktrace_set_only_do_time_sensitive_postprocess();
    if ([v7 collectionInterval]) {
      [v7 collectionInterval];
    }
    ktrace_set_collection_interval();
    if (!v16) {
      goto LABEL_19;
    }
    v17 = [v7 bitmap];
    if (v17)
    {
      id v18 = [v7 bitmap];
      [v18 bytes];
      uint64_t v19 = ktrace_events_filter_bitmap();
    }
    else
    {
      uint64_t v19 = ktrace_events_all();
    }

    if (v19)
    {
      if (!v12)
      {
        v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v62 = *MEMORY[0x263F08320];
        v21 = [NSString stringWithFormat:@"error: %d", v19];
        v63 = v21;
        v22 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        *a5 = [v20 errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v22];
      }
LABEL_18:
      ktrace_session_destroy();
      goto LABEL_19;
    }
    if ([v7 useExisting])
    {
      uint64_t v24 = ktrace_set_use_existing();
      if (v24)
      {
        if (!v12)
        {
          v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v60 = *MEMORY[0x263F08320];
          v26 = [NSString stringWithFormat:@"error: %d", v24];
          v61 = v26;
          v27 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          *a5 = [v25 errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v27];
        }
        goto LABEL_18;
      }
    }
    else
    {
      v28 = objc_opt_new();
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x3032000000;
      v52 = sub_230887364;
      v53 = sub_230887374;
      id v54 = 0;
      v29 = [v7 providers];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = sub_23088737C;
      v45[3] = &unk_264B8D9B8;
      v47 = &v49;
      uint64_t v48 = v16;
      id v44 = v28;
      id v46 = v44;
      [v29 enumerateKeysAndObjectsUsingBlock:v45];

      uint64_t v30 = v50[5];
      if (v30)
      {
        v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v58 = *MEMORY[0x263F08320];
        v32 = [NSString stringWithFormat:@"Failed to instantiate data providers"];
        v59 = v32;
        v33 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        providerLoggers = [v31 errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:1 userInfo:v33];

        if (!v12) {
          *a5 = providerLoggers;
        }
        ktrace_session_destroy();
      }
      else
      {
        v35 = (NSArray *)v44;
        providerLoggers = v8->_providerLoggers;
        v8->_providerLoggers = v35;
      }

      _Block_object_dispose(&v49, 8);
      if (v30) {
        goto LABEL_19;
      }
    }
    dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
    v37 = v36;
    ktrace_set_completion_handler();
    objc_storeStrong((id *)&v8->_stoppingSemaphore, v36);
    uint64_t started = ktrace_start_writing_fd();
    if (started)
    {
      if (!v12)
      {
        v39 = (void *)MEMORY[0x263F087E8];
        uint64_t v56 = *MEMORY[0x263F08320];
        v40 = [NSString stringWithFormat:@"error: %d", started];
        v57 = v40;
        v41 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        *a5 = [v39 errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v41];
      }
      goto LABEL_19;
    }
    if ([v7 useExisting])
    {
      dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
      if (v8->_ktraceSession) {
        ktrace_session_destroy();
      }
      stoppingSemaphore = v8->_stoppingSemaphore;
      v8->_ktraceSession = 0;
      v8->_stoppingSemaphore = 0;
    }
    v8->_ktraceSession = (ktrace_session *)v16;

LABEL_40:
    v23 = v8;
    goto LABEL_41;
  }
  v10 = [v7 bitmap];
  BOOL v11 = [v10 length] == 0x2000;

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
  v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v64 = *MEMORY[0x263F08320];
  v65[0] = @"Invalid tracing configuration bitmap";
  v15 = [NSDictionary dictionaryWithObjects:v65 forKeys:&v64 count:1];
  *a5 = [v14 errorWithDomain:@"DTKTraceSessionCreator" code:-1 userInfo:v15];

LABEL_19:
  v23 = 0;
LABEL_41:

  return v23;
}

- (id)_providerTopErrors
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_providerLoggers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
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
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)stopWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!self->_ktraceSession) {
    return 1;
  }
  if (!self->_stoppingSemaphore) {
    sub_23093C9D8();
  }
  ktrace_end();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_stoppingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  ktrace_session_destroy();
  self->_ktraceSession = 0;
  uint64_t v5 = [(DTKTraceSessionCreator *)self _providerTopErrors];
  if (![v5 count])
  {

    return 1;
  }
  uint64_t v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) userInfo];
        long long v13 = [v12 objectForKeyedSubscript:@"DVTKtraceSessionProviderName"];

        if (v13) {
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  long long v14 = (void *)MEMORY[0x263F087E8];
  v26[0] = *MEMORY[0x263F08320];
  long long v15 = NSString;
  uint64_t v16 = [v6 allObjects];
  uint64_t v17 = [v16 componentsJoinedByString:@", "];
  id v18 = [v15 stringWithFormat:@"Data Providers emitted errors: %@", v17];
  v26[1] = @"DVTKtraceSessionProviderErrorsArrayKey";
  v27[0] = v18;
  v27[1] = v7;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v20 = [v14 errorWithDomain:@"com.apple.dt.ktrace_recording.provider" code:2 userInfo:v19];

  if (a3) {
    *a3 = v20;
  }

  return 0;
}

+ (id)getDefaultedRemotePath:(int *)a3
{
  if (!a3)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"DTKTraceHelpers.m", 272, @"Invalid parameter not satisfying: %@", @"outFD != nil" object file lineNumber description];
  }
  v4 = NSTemporaryDirectory();
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"instrumentsXXXXXX.ktrace"];

  id v6 = v5;
  id v7 = strdup((const char *)[v6 fileSystemRepresentation]);
  *a3 = mkstemps(v7, 7);
  uint64_t v8 = NSURL;
  uint64_t v9 = [NSString stringWithUTF8String:v7];
  uint64_t v10 = [v8 URLWithString:v9];

  free(v7);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerLoggers, 0);
  objc_storeStrong((id *)&self->_stoppingSemaphore, 0);
}

@end