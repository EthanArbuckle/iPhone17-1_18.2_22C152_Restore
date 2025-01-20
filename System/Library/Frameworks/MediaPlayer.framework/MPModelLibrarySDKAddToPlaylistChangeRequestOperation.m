@interface MPModelLibrarySDKAddToPlaylistChangeRequestOperation
- (MPModelLibrarySDKAddToPlaylistChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibrarySDKAddToPlaylistChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibrarySDKAddToPlaylistChangeRequest)request
{
  return self->_request;
}

- (void)execute
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MPModelLibrarySDKAddToPlaylistChangeRequestOperation *)self request];
  v4 = [v3 productID];
  char v5 = [v3 isCloudID];
  v6 = [v3 playlist];
  v7 = [(MPAsyncOperation *)self userIdentity];
  v8 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v7];

  if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    if (([v6 userEditableComponents] & 1) == 0)
    {
      if (self->_responseHandler)
      {
        v9 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
        v10 = [v9 localizedStringForKey:@"NOT_SUPPORTED" value:&stru_1EE680640 table:@"MediaPlayer"];

        if (v10)
        {
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v39 = v10;
          v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        }
        else
        {
          v11 = 0;
        }
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = 5;
LABEL_23:
        v29 = [v27 errorWithDomain:@"MPErrorDomain" code:v28 userInfo:v11];
        (*((void (**)(void))self->_responseHandler + 2))();

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    v13 = [v8 libraryDataProvider];
    if (v5)
    {
      if (objc_opt_respondsToSelector())
      {
        v14 = [v6 identifiers];
        v15 = [v14 library];
        uint64_t v16 = [v15 persistentID];

        uint64_t v17 = [v4 longLongValue];
        if (v17)
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke_2;
          v32[3] = &unk_1E57F9B00;
          v32[4] = self;
          objc_msgSend(v13, "sdk_addItemWithSagaIdentifier:toPlaylistWithIdentifier:completionBlock:", v17, v16, v32);
LABEL_31:

          goto LABEL_32;
        }
        if (self->_responseHandler)
        {
          v30 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
          v22 = [v30 localizedStringForKey:@"NOT_SUPPORTED" value:&stru_1EE680640 table:@"MediaPlayer"];

          if (v22)
          {
            uint64_t v36 = *MEMORY[0x1E4F28568];
            v37 = v22;
            v23 = (void *)MEMORY[0x1E4F1C9E8];
            v24 = &v37;
            v25 = &v36;
            goto LABEL_18;
          }
          goto LABEL_28;
        }
        goto LABEL_30;
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      v18 = [v6 identifiers];
      v19 = [v18 library];
      uint64_t v20 = [v19 persistentID];

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke;
      v33[3] = &unk_1E57F9B00;
      v33[4] = self;
      objc_msgSend(v13, "sdk_addItemWithOpaqueIdentifier:toPlaylistWithIdentifier:completionBlock:", v4, v20, v33);
      goto LABEL_31;
    }
    if (self->_responseHandler)
    {
      v21 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
      v22 = [v21 localizedStringForKey:@"NOT_SUPPORTED" value:&stru_1EE680640 table:@"MediaPlayer"];

      if (v22)
      {
        uint64_t v34 = *MEMORY[0x1E4F28568];
        v35 = v22;
        v23 = (void *)MEMORY[0x1E4F1C9E8];
        v24 = &v35;
        v25 = &v34;
LABEL_18:
        v26 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
LABEL_29:
        v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:5 userInfo:v26];
        (*((void (**)(void))self->_responseHandler + 2))();

        goto LABEL_30;
      }
LABEL_28:
      v26 = 0;
      goto LABEL_29;
    }
LABEL_30:
    [(MPAsyncOperation *)self finish];
    goto LABEL_31;
  }
  if (self->_responseHandler)
  {
    v12 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    v10 = [v12 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1EE680640 table:@"MediaPlayer"];

    if ([v10 length])
    {
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v41[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    }
    else
    {
      v11 = 0;
    }
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = 1;
    goto LABEL_23;
  }
LABEL_24:
  [(MPAsyncOperation *)self finish];
LABEL_32:
}

void __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4[35])
  {
    if (v3)
    {
      char v5 = [v3 domain];
      char v6 = [v5 isEqualToString:@"MPErrorDomain"];

      if ((v6 & 1) == 0)
      {
        v7 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
        v8 = [v7 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];

        if (v8)
        {
          uint64_t v11 = *MEMORY[0x1E4F28568];
          v12[0] = v8;
          v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        }
        else
        {
          v9 = 0;
        }
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:0 userInfo:v9];

        id v3 = (id)v10;
      }
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 280) + 16))();
    v4 = *(void **)(a1 + 32);
  }
  [v4 finishWithError:v3];
}

void __63__MPModelLibrarySDKAddToPlaylistChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4[35])
  {
    if (v3)
    {
      char v5 = [v3 domain];
      char v6 = [v5 isEqualToString:@"MPErrorDomain"];

      if ((v6 & 1) == 0)
      {
        v7 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
        v8 = [v7 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];

        if (v8)
        {
          uint64_t v11 = *MEMORY[0x1E4F28568];
          v12[0] = v8;
          v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        }
        else
        {
          v9 = 0;
        }
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:0 userInfo:v9];

        id v3 = (id)v10;
      }
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 280) + 16))();
    v4 = *(void **)(a1 + 32);
  }
  [v4 finish];
}

@end