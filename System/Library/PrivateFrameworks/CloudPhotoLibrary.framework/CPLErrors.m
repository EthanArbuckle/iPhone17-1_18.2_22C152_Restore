@interface CPLErrors
+ (id)cplErrorCausedBySharedSyncForError:(id)a3;
+ (id)cplErrorWithCode:(int64_t)a3 description:(id)a4;
+ (id)cplErrorWithCode:(int64_t)a3 description:(id)a4 arguments:(char *)a5;
+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5 arguments:(char *)a6;
+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5 description:(id)a6;
+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5 description:(id)a6 arguments:(char *)a7;
+ (id)errorsForIdentifiers:(id)a3 error:(id)a4;
+ (id)incorrectMachineStateErrorWithReason:(id)a3;
+ (id)incorrectParametersErrorForParameter:(id)a3;
+ (id)invalidClientCacheErrorWithReason:(id)a3;
+ (id)invalidCloudCacheErrorWithReason:(id)a3;
+ (id)invalidDaemonErrorWithConnectionError:(id)a3;
+ (id)invalidScopeErrorWithScopeIdentifier:(id)a3;
+ (id)invalidScopeErrorWithScopeIndex:(int64_t)a3;
+ (id)invalidScopeErrorWithScopedIdentifier:(id)a3;
+ (id)libraryClosedError;
+ (id)libraryDoesNotAutoOpenError;
+ (id)missingError;
+ (id)notImplementedError;
+ (id)operationCancelledError;
+ (id)posixErrorForURL:(id)a3;
+ (id)posixErrorForURL:(id)a3 errorCode:(int)a4;
+ (id)preventWipeErrorWithReason:(id)a3 preventedByUser:(BOOL)a4;
+ (id)readOnlyError;
+ (id)sessionHasBeenDeferredError;
+ (id)tooManyOpenedEnginesError;
+ (id)transportErrorFromTransportError:(id)a3;
+ (id)underlyingErrorWithReason:(id)a3;
+ (id)unknownError;
+ (id)unknownPrimaryScope;
+ (id)unsafeResources:(id)a3 withError:(id)a4 realPrune:(BOOL)a5 resourceStorage:(id)a6;
+ (id)unsafeResources:(id)a3 withError:(id)a4 resourceStorage:(id)a5;
+ (id)versionMismatchError;
@end

@implementation CPLErrors

+ (id)cplErrorCausedBySharedSyncForError:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 userInfo];
  v7 = (void *)[v5 initWithDictionary:v6];

  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"CPLErrorIsCausedBySharedSync"];
  v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = [v4 domain];
  uint64_t v10 = [v4 code];

  v11 = [v8 errorWithDomain:v9 code:v10 userInfo:v7];

  return v11;
}

+ (id)errorsForIdentifiers:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)unsafeResources:(id)a3 withError:(id)a4 realPrune:(BOOL)a5 resourceStorage:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  if (v11)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "notePruningRequestForResource:realPrune:successful:", v18, v7, 0, (void)v20);
          [v12 setObject:v10 forKeyedSubscript:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v12;
}

+ (id)unsafeResources:(id)a3 withError:(id)a4 resourceStorage:(id)a5
{
  return (id)[a1 unsafeResources:a3 withError:a4 realPrune:1 resourceStorage:a5];
}

+ (id)preventWipeErrorWithReason:(id)a3 preventedByUser:(BOOL)a4
{
  BOOL v4 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  else {
    id v6 = @"no reason";
  }
  id v13 = @"CPLErrorResetReason";
  v14[0] = v6;
  BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v10 = @"Automatically prevented";
  if (v4) {
    id v10 = @"User prevented";
  }
  id v11 = [a1 cplErrorWithCode:1014, 0, v9, @"%@ wipe for reason '%@'", v10, v8 underlyingError userInfo description];

  return v11;
}

+ (id)sessionHasBeenDeferredError
{
  return +[CPLErrors cplErrorWithCode:257 description:@"Sync session has been deferred"];
}

+ (id)missingError
{
  return (id)[a1 cplErrorWithCode:2000 description:@"There should be real error here. Please file a radar"];
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5 description:(id)a6 arguments:(char *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13) {
    uint64_t v14 = (void *)[[NSString alloc] initWithFormat:v13 arguments:a7];
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = v15;
  if (v12) {
    [v15 addEntriesFromDictionary:v12];
  }
  if (v14) {
    [v16 setObject:v14 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v11) {
    [v16 setObject:v11 forKey:*MEMORY[0x1E4F28A50]];
  }
  long long v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CloudPhotoLibraryErrorDomain" code:a3 userInfo:v16];

  return v17;
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5 description:(id)a6
{
  id v6 = [a1 cplErrorWithCode:a3 underlyingError:a4 userInfo:a5 description:a6 arguments:&v9];
  return v6;
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5 arguments:(char *)a6
{
  return (id)[a1 cplErrorWithCode:a3 underlyingError:a4 userInfo:0 description:a5 arguments:a6];
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v5 = [a1 cplErrorWithCode:a3 underlyingError:a4 userInfo:0 description:a5 arguments:&v8];
  return v5;
}

+ (id)cplErrorWithCode:(int64_t)a3 description:(id)a4 arguments:(char *)a5
{
  return (id)[a1 cplErrorWithCode:a3 underlyingError:0 userInfo:0 description:a4 arguments:a5];
}

+ (id)cplErrorWithCode:(int64_t)a3 description:(id)a4
{
  BOOL v4 = [a1 cplErrorWithCode:a3 description:a4 arguments:&v7];
  return v4;
}

+ (id)operationCancelledError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
}

+ (id)posixErrorForURL:(id)a3 errorCode:(int)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v25 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = 0;
        _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "Trying to create a POSIX error without any error!", (uint8_t *)&v28, 2u);
      }
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLErrors.m"];
    [v26 handleFailureInMethod:a2 object:a1 file:v27 lineNumber:133 description:@"Trying to create a POSIX error without any error!"];

    abort();
  }
  uint64_t v8 = v7;
  uint64_t v9 = strerror(a4);
  if (v9 && (uint64_t v10 = [[NSString alloc] initWithUTF8String:v9]) != 0)
  {
    id v11 = (void *)v10;
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28798];
    if (v8)
    {
      uint64_t v14 = *MEMORY[0x1E4F289D0];
      v33[0] = *MEMORY[0x1E4F28568];
      v33[1] = v14;
      v34[0] = v10;
      v34[1] = v8;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = v34;
      long long v17 = v33;
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v32 = v10;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = &v32;
      long long v17 = &v31;
      uint64_t v18 = 1;
    }
    long long v23 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
    long long v22 = [v12 errorWithDomain:v13 code:a4 userInfo:v23];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    if (v8)
    {
      uint64_t v29 = *MEMORY[0x1E4F289D0];
      v30 = v8;
      long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      long long v22 = [v19 errorWithDomain:v20 code:a4 userInfo:v21];
    }
    else
    {
      long long v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a4 userInfo:0];
    }
  }

  return v22;
}

+ (id)posixErrorForURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 posixErrorForURL:v4 errorCode:*__error()];

  return v5;
}

+ (id)invalidDaemonErrorWithConnectionError:(id)a3
{
  return +[CPLErrors cplErrorWithCode:110, @"Daemon had a problem and shut down: %@", a3 description];
}

+ (id)invalidCloudCacheErrorWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v8 = @"CPLErrorResetReason";
    id v9 = a3;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    id v5 = [v3 dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v6 = +[CPLErrors cplErrorWithCode:21, 0, v5, @"Cloud cache is invalid: %@", v4, v8, v9, v10 underlyingError userInfo description];
  }
  else
  {
    id v6 = +[CPLErrors cplErrorWithCode:21 description:@"Cloud cache is invalid"];
  }
  return v6;
}

+ (id)invalidClientCacheErrorWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v8 = @"CPLErrorResetReason";
    id v9 = a3;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    id v5 = [v3 dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v6 = +[CPLErrors cplErrorWithCode:20, 0, v5, @"Client cache is invalid: %@", v4, v8, v9, v10 underlyingError userInfo description];
  }
  else
  {
    id v6 = +[CPLErrors cplErrorWithCode:20 description:@"Client cache is invalid"];
  }
  return v6;
}

+ (id)libraryClosedError
{
  return +[CPLErrors cplErrorWithCode:150 description:@"Library is closed"];
}

+ (id)transportErrorFromTransportError:(id)a3
{
  return +[CPLErrors cplErrorWithCode:80, @"Transport returned an error: %@", a3 description];
}

+ (id)readOnlyError
{
  return +[CPLErrors cplErrorWithCode:2001 description:@"Engine is in read-only mode"];
}

+ (id)unknownPrimaryScope
{
  return +[CPLErrors cplErrorWithCode:2001 description:@"Can't find primary scope"];
}

+ (id)invalidScopeErrorWithScopeIndex:(int64_t)a3
{
  return +[CPLErrors cplErrorWithCode:2001, @"Unknown scope index %ld", a3 description];
}

+ (id)invalidScopeErrorWithScopeIdentifier:(id)a3
{
  return +[CPLErrors cplErrorWithCode:2001, @"Invalid scope identifier %@", a3 description];
}

+ (id)invalidScopeErrorWithScopedIdentifier:(id)a3
{
  return +[CPLErrors cplErrorWithCode:2001, @"Unknown scoped identifier in %@", a3 description];
}

+ (id)unknownError
{
  return +[CPLErrors cplErrorWithCode:150 description:@"Unknown error"];
}

+ (id)notImplementedError
{
  return +[CPLErrors cplErrorWithCode:255 description:@"Method not implemented"];
}

+ (id)versionMismatchError
{
  return +[CPLErrors cplErrorWithCode:1 description:@"Version mismatch"];
}

+ (id)tooManyOpenedEnginesError
{
  return +[CPLErrors cplErrorWithCode:5 description:@"Too many opened engines"];
}

+ (id)libraryDoesNotAutoOpenError
{
  return +[CPLErrors cplErrorWithCode:4 description:@"Waiting for client to open library"];
}

+ (id)underlyingErrorWithReason:(id)a3
{
  v3 = [a1 cplErrorWithCode:256 description:a3 arguments:&v6];
  return v3;
}

+ (id)incorrectMachineStateErrorWithReason:(id)a3
{
  v3 = [a1 cplErrorWithCode:100 description:a3 arguments:&v6];
  return v3;
}

+ (id)incorrectParametersErrorForParameter:(id)a3
{
  return +[CPLErrors cplErrorWithCode:50, @"Incorrect parameter: %@", a3 description];
}

@end