@interface MPStoreLyricsSnippetRequestOperation
- (MPStoreLyricsSnippetURLComponents)snippetURL;
- (id)responseHandler;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSnippetURL:(id)a3;
@end

@implementation MPStoreLyricsSnippetRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_snippetURL, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setSnippetURL:(id)a3
{
}

- (MPStoreLyricsSnippetURLComponents)snippetURL
{
  return self->_snippetURL;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPStoreLyricsSnippetRequestOperation;
  [(MPAsyncOperation *)&v7 finishWithError:v4];
  if (v4)
  {
    v5 = [(MPStoreLyricsSnippetRequestOperation *)self responseHandler];

    if (v5)
    {
      v6 = [(MPStoreLyricsSnippetRequestOperation *)self responseHandler];
      ((void (**)(void, void, id))v6)[2](v6, 0, v4);
    }
  }
}

- (void)execute
{
  v3 = [(MPStoreLyricsSnippetRequestOperation *)self snippetURL];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB8758]);
    v5 = [MEMORY[0x1E4FB87B8] activeAccount];
    v6 = (void *)[v4 initWithIdentity:v5];

    objc_super v7 = [MEMORY[0x1E4FB8788] sharedBagProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke;
    v9[3] = &unk_1E57FA240;
    v9[4] = self;
    [v7 getBagForRequestContext:v6 withCompletionHandler:v9];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsSnippetRequestErrorDomain" code:-3001 userInfo:0];
    [(MPStoreLyricsSnippetRequestOperation *)self finishWithError:v8];
  }
}

void __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  v45[4] = *MEMORY[0x1E4F143B8];
  v3 = [a2 dictionaryForBagKey:*MEMORY[0x1E4FB8520]];
  id v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "ic_stringValueForKey:", @"default");
    if (v5)
    {
      v6 = objc_opt_new();
      [v6 setScheme:@"https"];
      [v6 setHost:v5];
      v43 = v4;
      objc_super v7 = NSString;
      id v8 = [*(id *)(a1 + 32) snippetURL];
      v9 = [v8 countryCode];
      v10 = [*(id *)(a1 + 32) snippetURL];
      v11 = [v7 stringWithFormat:@"/v1/lyrics/%@/snippet/songs/%lld", v9, objc_msgSend(v10, "songAdamID")];
      [v6 setPath:v11];

      v42 = v5;
      v12 = (void *)MEMORY[0x1E4F290C8];
      v13 = NSString;
      v41 = [*(id *)(a1 + 32) snippetURL];
      [v41 startTime];
      v40 = objc_msgSend(v13, "stringWithFormat:", @"%.03f", v14);
      v39 = [v12 queryItemWithName:@"ts" value:v40];
      v45[0] = v39;
      v15 = (void *)MEMORY[0x1E4F290C8];
      v16 = NSString;
      v38 = [*(id *)(a1 + 32) snippetURL];
      [v38 endTime];
      v37 = objc_msgSend(v16, "stringWithFormat:", @"%.03f", v17);
      v18 = [v15 queryItemWithName:@"te" value:v37];
      v45[1] = v18;
      v19 = (void *)MEMORY[0x1E4F290C8];
      v20 = [*(id *)(a1 + 32) snippetURL];
      v21 = [v20 language];
      v22 = [v19 queryItemWithName:@"l" value:v21];
      v45[2] = v22;
      v23 = (void *)MEMORY[0x1E4F290C8];
      v24 = [*(id *)(a1 + 32) snippetURL];
      v25 = [v24 signature];
      v26 = [v23 queryItemWithName:@"tk" value:v25];
      v45[3] = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
      [v6 setQueryItems:v27];

      v28 = (void *)[objc_alloc(MEMORY[0x1E4FB8660]) initWithBlock:&__block_literal_global_16419];
      id v29 = objc_alloc(MEMORY[0x1E4FB8668]);
      v30 = (void *)MEMORY[0x1E4F290D0];
      v31 = [v6 URL];
      v32 = [v30 requestWithURL:v31];
      v33 = (void *)[v29 initWithURLRequest:v32 requestContext:v28];

      v34 = [MEMORY[0x1E4FB87A8] defaultSession];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke_3;
      v44[3] = &unk_1E57F60F0;
      v44[4] = *(void *)(a1 + 32);
      [v34 enqueueDataRequest:v33 withCompletionHandler:v44];

      v5 = v42;
      id v4 = v43;
    }
    else
    {
      v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsSnippetRequestErrorDomain" code:-3002 userInfo:0];
      [*(id *)(a1 + 32) finishWithError:v36];
    }
  }
  else
  {
    v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsSnippetRequestErrorDomain" code:-3002 userInfo:0];
    [*(id *)(a1 + 32) finishWithError:v35];
  }
}

void __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (!a3)
  {
    objc_super v7 = [v5 urlResponse];
    id v8 = [v6 parsedBody];
    if ([v7 statusCode] != 200)
    {
      v15 = *(void **)(a1 + 32);
      v16 = (void *)MEMORY[0x1E4F28C58];
      v21 = @"HTTPStatusCodeKey";
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "statusCode"));
      v22[0] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:@"MPStoreLyricsSnippetRequestErrorDomain" code:-3003 userInfo:v18];
      [v15 finishWithError:v19];

LABEL_11:
      goto LABEL_12;
    }
    if (v8)
    {
      v9 = objc_msgSend(v8, "ic_dictionaryValueForKey:", @"results");
      v10 = [*(id *)(a1 + 32) responseHandler];

      if (!v10)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = [*(id *)(a1 + 32) responseHandler];
      v12 = objc_msgSend(v9, "ic_stringValueForKey:", @"text");
      ((void (**)(void, void *, void))v11)[2](v11, v12, 0);

      v13 = *(void **)(a1 + 32);
      uint64_t v14 = 0;
    }
    else
    {
      v20 = *(void **)(a1 + 32);
      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreLyricsSnippetRequestErrorDomain" code:-3003 userInfo:0];
      v13 = v20;
      uint64_t v14 = v9;
    }
    [v13 finishWithError:v14];
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) finishWithError:a3];
LABEL_12:
}

void __47__MPStoreLyricsSnippetRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v3 = [MEMORY[0x1E4FB85B0] clientInfoForMusicKitRequestWithClientIdentifier:v5 clientVersion:@"1"];
  [v2 setClientInfo:v3];
  id v4 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  [v2 setIdentityStore:v4];
}

@end