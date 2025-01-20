@interface MPHomeSharingErrorResolver
- (BOOL)_errorIsFairPlayError:(id)a3;
- (MPHomeSharingErrorResolver)initWithKeybagURL:(id)a3 accountID:(unint64_t)a4 accountTokenData:(id)a5;
- (MPHomeSharingErrorResolver)initWithKeybagURL:(id)a3 accountID:(unint64_t)a4 accountTokenData:(id)a5 downloaderAccountID:(unint64_t)a6 downloaderAccountTokenData:(id)a7 familyAccountID:(unint64_t)a8;
- (MPHomeSharingML3DataProvider)dataProvider;
- (void)_performMachineAuthorization;
- (void)_processNextAuthorizationRequest;
- (void)authorizationRequest:(id)a3 didReceiveResponse:(id)a4;
- (void)dealloc;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)resolveError:(id)a3;
- (void)setDataProvider:(id)a3;
@end

@implementation MPHomeSharingErrorResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloaderAccountTokenData, 0);
  objc_storeStrong((id *)&self->_accountTokenData, 0);

  objc_storeStrong((id *)&self->_keybagURL, 0);
}

- (void)setDataProvider:(id)a3
{
}

- (MPHomeSharingML3DataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)_processNextAuthorizationRequest
{
  if ([(NSMutableArray *)self->_requests count])
  {
    v3 = [(NSMutableArray *)self->_requests objectAtIndex:0];
    [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
    [v3 setDelegate:self];
    [v3 start];
    activeRequest = self->_activeRequest;
    self->_activeRequest = (SSAuthorizationRequest *)v3;
  }
  else
  {
    [(MPAVErrorResolver *)self sendDidResolveError:self->_error withResolution:2 * self->_atLeastOneAuthorizationRequestSuccessful];
    activeRequest = self->_error;
    self->_error = 0;
  }
}

- (void)_performMachineAuthorization
{
  id v3 = objc_alloc((Class)getSSAuthorizationRequestClass());
  accountTokenData = self->_accountTokenData;
  v5 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
  id v12 = (id)[v3 initWithAuthorizationToken:accountTokenData accountIdentifier:v5];

  v6 = [(NSURL *)self->_keybagURL path];
  [v12 setKeybagPath:v6];

  [(NSMutableArray *)self->_requests addObject:v12];
  if (self->_downloaderAccountID)
  {
    [v12 setReason:@"family"];
    id v7 = objc_alloc((Class)getSSAuthorizationRequestClass());
    downloaderAccountTokenData = self->_downloaderAccountTokenData;
    v9 = [NSNumber numberWithUnsignedLongLong:self->_downloaderAccountID];
    v10 = (void *)[v7 initWithAuthorizationToken:downloaderAccountTokenData accountIdentifier:v9];

    v11 = [(NSURL *)self->_keybagURL path];
    [v10 setKeybagPath:v11];

    [(NSMutableArray *)self->_requests addObject:v10];
  }
  [(MPHomeSharingErrorResolver *)self _processNextAuthorizationRequest];
}

- (BOOL)_errorIsFairPlayError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  unint64_t v5 = v4 + 49999;
  unint64_t v6 = v4 + 12169;
  if (v4 == -11835)
  {
    id v7 = [v3 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F15AC0]];
  }
  else
  {
    int v8 = 0;
  }
  if (v5 >> 6 < 0x7D || v6 <= 0x13)
  {
    v10 = [v3 domain];
    v8 |= [v10 isEqualToString:*MEMORY[0x1E4F28760]];
  }
  return v8;
}

- (void)requestDidFinish:(id)a3
{
  [(SSAuthorizationRequest *)self->_activeRequest setDelegate:0];
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

  [(MPHomeSharingErrorResolver *)self _processNextAuthorizationRequest];
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  -[SSAuthorizationRequest setDelegate:](self->_activeRequest, "setDelegate:", 0, a4);
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

  [(MPAVErrorResolver *)self sendDidResolveError:self->_error withResolution:0];
  error = self->_error;
  self->_error = 0;
}

- (void)authorizationRequest:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend(a4, "bodyData", a3);
  if ([v5 length])
  {
    unint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
    id v7 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Token response: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    int v8 = [v6 objectForKey:@"keybag"];
    v9 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 length];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Got keybag data of length: %lu", (uint8_t *)&buf, 0xCu);
    }

    if ([v8 length])
    {
      long long buf = 0uLL;
      uint64_t v36 = 0;
      if (ICFairPlayGetHardwareInfo())
      {
        v11 = [(MPHomeSharingML3DataProvider *)self->_dataProvider uniqueIdentifier];
        id v12 = HSLibraryCacheDirectoryForIdentifier();
        v13 = [v12 stringByAppendingPathComponent:@"Tokens"];

        v14 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v33 = 138543362;
          unint64_t v34 = (unint64_t)v13;
          _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Key storage directory: %{public}@", v33, 0xCu);
        }

        v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v16 = [v15 fileExistsAtPath:v13];

        if ((v16 & 1) == 0)
        {
          v17 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Creating key storage directory...", v33, 2u);
          }

          v18 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v18 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:0];
        }
        int v32 = 0;
        os_log_t v19 = v13;
        int v20 = XtCqEf5X(0, (uint64_t)&buf, [v19 UTF8String], (uint64_t)&v32);
        if (v20)
        {
          int v21 = v20;
          v22 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v33 = 67109120;
            LODWORD(v34) = v21;
            _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Unable to create fp context: %d", v33, 8u);
          }
        }
        else
        {
          if ([v8 length])
          {
            id v23 = v8;
            [v23 bytes];
            [v23 length];
            lCUad();
            int v25 = v24;
            v26 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v25)
            {
              if (v27)
              {
                *(_DWORD *)v33 = 67109120;
                LODWORD(v34) = v25;
                _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Unable to import keybag: %d", v33, 8u);
              }
            }
            else
            {
              if (v27)
              {
                unint64_t accountID = self->_accountID;
                *(_DWORD *)v33 = 134217984;
                unint64_t v34 = accountID;
                _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Keybag and token for account ID %llu imported.", v33, 0xCu);
              }

              self->_atLeastOneAuthorizationRequestSuccessful = 1;
            }
          }
          VLxCLgDpiF(v32);
        }
      }
      else
      {
        os_log_t v19 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Unable to get hw info", v33, 2u);
        }
      }
    }
    v29 = [v6 objectForKey:@"token"];
    v30 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v29 length];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1952E8000, v30, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Got token data of length: %lu", (uint8_t *)&buf, 0xCu);
    }

    if ([v29 length]) {
      [(MPHomeSharingML3DataProvider *)self->_dataProvider setTokenData:v29 forAuthorizedDSID:self->_accountID];
    }
  }
}

- (void)resolveError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 userInfo];
  id v7 = [v6 objectForKey:*MEMORY[0x1E4F28A50]];

  if ([(MPHomeSharingErrorResolver *)self _errorIsFairPlayError:v5])
  {
    objc_storeStrong((id *)&self->_error, a3);
    [(MPHomeSharingErrorResolver *)self _performMachineAuthorization];
  }
  else if ([v7 code] == -16550)
  {
    int v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Reconnecting to HomeSharing Library for error: %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_error, a3);
    v9 = [(MPHomeSharingML3DataProvider *)self->_dataProvider homeSharingLibrary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__MPHomeSharingErrorResolver_resolveError___block_invoke;
    v10[3] = &unk_1E57FA170;
    v10[4] = self;
    [v9 connectWithCompletionHandler:v10];
  }
  else
  {
    [(MPAVErrorResolver *)self sendDidResolveError:v5 withResolution:0];
  }
}

void __43__MPHomeSharingErrorResolver_resolveError___block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 sendDidResolveError:v3[8] withResolution:v4];
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = 0;
}

- (void)dealloc
{
  [(SSAuthorizationRequest *)self->_activeRequest cancel];
  [(SSAuthorizationRequest *)self->_activeRequest setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPHomeSharingErrorResolver;
  [(MPHomeSharingErrorResolver *)&v3 dealloc];
}

- (MPHomeSharingErrorResolver)initWithKeybagURL:(id)a3 accountID:(unint64_t)a4 accountTokenData:(id)a5 downloaderAccountID:(unint64_t)a6 downloaderAccountTokenData:(id)a7 familyAccountID:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (!a4 || ![v15 length]) {
    goto LABEL_9;
  }
  if (a6)
  {
    if (!a8) {
      goto LABEL_10;
    }
    if (![v16 length])
    {
LABEL_9:
      a8 = 0;
      goto LABEL_10;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)MPHomeSharingErrorResolver;
  v17 = [(MPHomeSharingErrorResolver *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    keybagURL = v17->_keybagURL;
    v17->_keybagURL = (NSURL *)v18;

    v17->_unint64_t accountID = a4;
    objc_storeStrong((id *)&v17->_accountTokenData, a5);
    v17->_downloaderAccountID = a6;
    objc_storeStrong((id *)&v17->_downloaderAccountTokenData, a7);
    v17->_familyAccountID = a8;
    uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    requests = v17->_requests;
    v17->_requests = (NSMutableArray *)v20;
  }
  self = v17;
  a8 = (unint64_t)self;
LABEL_10:

  return (MPHomeSharingErrorResolver *)a8;
}

- (MPHomeSharingErrorResolver)initWithKeybagURL:(id)a3 accountID:(unint64_t)a4 accountTokenData:(id)a5
{
  return [(MPHomeSharingErrorResolver *)self initWithKeybagURL:a3 accountID:a4 accountTokenData:a5 downloaderAccountID:0 downloaderAccountTokenData:0 familyAccountID:0];
}

@end