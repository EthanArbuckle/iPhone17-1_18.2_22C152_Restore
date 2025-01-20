@interface TMAPIClient
+ (TMAPIClient)sharedInstance;
- (BOOL)handleOpenURL:(id)a3;
- (JXHTTPOperationQueue)queue;
- (NSDictionary)customHeaders;
- (NSOperationQueue)defaultCallbackQueue;
- (NSString)OAuthConsumerKey;
- (NSString)OAuthConsumerSecret;
- (NSString)OAuthToken;
- (NSString)OAuthTokenSecret;
- (NSURL)baseURL;
- (TMAPIClient)init;
- (double)timeoutInterval;
- (id)URLWithPath:(id)a3;
- (id)audioRequest:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7;
- (id)blogInfoRequest:(id)a3;
- (id)chatRequest:(id)a3 parameters:(id)a4;
- (id)dashboardRequest:(id)a3;
- (id)deletePostRequest:(id)a3 id:(id)a4;
- (id)draftsRequest:(id)a3 parameters:(id)a4;
- (id)editPostRequest:(id)a3 parameters:(id)a4;
- (id)followRequest:(id)a3;
- (id)followersRequest:(id)a3 parameters:(id)a4;
- (id)followingRequest:(id)a3;
- (id)getRequestWithPath:(id)a3 parameters:(id)a4;
- (id)likeRequest:(id)a3 reblogKey:(id)a4;
- (id)likesRequest:(id)a3;
- (id)likesRequest:(id)a3 parameters:(id)a4;
- (id)linkRequest:(id)a3 parameters:(id)a4;
- (id)multipartBodyForParameters:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6;
- (id)multipartPostRequest:(id)a3 type:(id)a4 parameters:(id)a5 filePathArray:(id)a6 contentTypeArray:(id)a7 fileNameArray:(id)a8;
- (id)photoRequest:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6 parameters:(id)a7;
- (id)postRequest:(id)a3 type:(id)a4 parameters:(id)a5;
- (id)postRequestWithPath:(id)a3 parameters:(id)a4;
- (id)postsRequest:(id)a3 type:(id)a4 parameters:(id)a5;
- (id)queueRequest:(id)a3 parameters:(id)a4;
- (id)quoteRequest:(id)a3 parameters:(id)a4;
- (id)reblogPostRequest:(id)a3 parameters:(id)a4;
- (id)submissionsRequest:(id)a3 parameters:(id)a4;
- (id)taggedRequest:(id)a3 parameters:(id)a4;
- (id)textRequest:(id)a3 parameters:(id)a4;
- (id)unfollowRequest:(id)a3;
- (id)unlikeRequest:(id)a3 reblogKey:(id)a4;
- (id)userInfoRequest;
- (id)videoRequest:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7;
- (void)audio:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7 callback:(id)a8;
- (void)authenticate:(id)a3 urlBlock:(id)a4 callback:(id)a5;
- (void)avatar:(id)a3 size:(unint64_t)a4 callback:(id)a5;
- (void)avatar:(id)a3 size:(unint64_t)a4 queue:(id)a5 callback:(id)a6;
- (void)blogInfo:(id)a3 callback:(id)a4;
- (void)chat:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)dashboard:(id)a3 callback:(id)a4;
- (void)deletePost:(id)a3 id:(id)a4 callback:(id)a5;
- (void)drafts:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)editPost:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)follow:(id)a3 callback:(id)a4;
- (void)followers:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)following:(id)a3 callback:(id)a4;
- (void)like:(id)a3 reblogKey:(id)a4 callback:(id)a5;
- (void)likes:(id)a3 callback:(id)a4;
- (void)likes:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)link:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)photo:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6 parameters:(id)a7 callback:(id)a8;
- (void)post:(id)a3 type:(id)a4 parameters:(id)a5 callback:(id)a6;
- (void)posts:(id)a3 type:(id)a4 parameters:(id)a5 callback:(id)a6;
- (void)queue:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)quote:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)reblogPost:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)sendRequest:(id)a3 callback:(id)a4;
- (void)sendRequest:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)setBaseURL:(id)a3;
- (void)setCustomHeaders:(id)a3;
- (void)setDefaultCallbackQueue:(id)a3;
- (void)setOAuthConsumerKey:(id)a3;
- (void)setOAuthConsumerSecret:(id)a3;
- (void)setOAuthToken:(id)a3;
- (void)setOAuthTokenSecret:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)signRequest:(id)a3 withParameters:(id)a4;
- (void)submissions:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)tagged:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)text:(id)a3 parameters:(id)a4 callback:(id)a5;
- (void)unfollow:(id)a3 callback:(id)a4;
- (void)unlike:(id)a3 reblogKey:(id)a4 callback:(id)a5;
- (void)userInfo:(id)a3;
- (void)video:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7 callback:(id)a8;
- (void)xAuth:(id)a3 password:(id)a4 callback:(id)a5;
@end

@implementation TMAPIClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_defaultCallbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_customHeaders, 0);
  objc_storeStrong((id *)&self->_OAuthTokenSecret, 0);
  objc_storeStrong((id *)&self->_OAuthToken, 0);
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setDefaultCallbackQueue:(id)a3
{
}

- (NSOperationQueue)defaultCallbackQueue
{
  return self->_defaultCallbackQueue;
}

- (void)setQueue:(id)a3
{
}

- (JXHTTPOperationQueue)queue
{
  return self->_queue;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setCustomHeaders:(id)a3
{
}

- (NSDictionary)customHeaders
{
  return self->_customHeaders;
}

- (void)setOAuthTokenSecret:(id)a3
{
}

- (NSString)OAuthTokenSecret
{
  return self->_OAuthTokenSecret;
}

- (void)setOAuthToken:(id)a3
{
}

- (NSString)OAuthToken
{
  return self->_OAuthToken;
}

- (TMAPIClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)TMAPIClient;
  v2 = [(TMAPIClient *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(JXHTTPOperationQueue);
    [(TMAPIClient *)v2 setQueue:v3];

    v4 = [MEMORY[0x263F08A48] mainQueue];
    [(TMAPIClient *)v2 setDefaultCallbackQueue:v4];

    [(TMAPIClient *)v2 setTimeoutInterval:60.0];
    v5 = [NSURL URLWithString:@"https://api.tumblr.com/v2/"];
    [(TMAPIClient *)v2 setBaseURL:v5];
  }
  return v2;
}

- (id)URLWithPath:(id)a3
{
  id v4 = a3;
  v5 = [(TMAPIClient *)self baseURL];
  v6 = [v5 URLByAppendingPathComponent:v4];

  objc_super v7 = [v6 absoluteString];

  return v7;
}

- (void)sendRequest:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__35423;
    v23[4] = __Block_byref_object_dispose__35424;
    id v24 = _Block_copy(v10);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__TMAPIClient_sendRequest_queue_callback___block_invoke;
    v20[3] = &unk_264E5A998;
    id v12 = v9;
    id v21 = v12;
    v22 = v23;
    [v8 setDidFinishLoadingBlock:v20];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __42__TMAPIClient_sendRequest_queue_callback___block_invoke_3;
    v17 = &unk_264E5A998;
    id v18 = v12;
    v19 = v23;
    [v8 setDidFailBlock:&v14];

    _Block_object_dispose(v23, 8);
  }
  v13 = [(TMAPIClient *)self queue];
  [v13 addOperation:v8];
}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 responseJSON];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"meta"];
  if (!v4)
  {
    int v8 = 0;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = [v3 objectForKeyedSubscript:@"meta"];
  objc_super v7 = [v6 objectForKeyedSubscript:@"status"];
  int v8 = [v7 intValue];

  if ((v8 - 200) >= 0x64)
  {
LABEL_5:
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"Request failed" code:v8 userInfo:0];
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_6:
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__TMAPIClient_sendRequest_queue_callback___block_invoke_2;
  v14[3] = &unk_264E5DAA8;
  v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v16 = v9;
  uint64_t v17 = v10;
  id v15 = v3;
  id v12 = v9;
  id v13 = v3;
  [v11 addOperationWithBlock:v14];
}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TMAPIClient_sendRequest_queue_callback___block_invoke_4;
  v7[3] = &unk_264E5EEC0;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 addOperationWithBlock:v7];
}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"response"];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));

  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)sendRequest:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TMAPIClient *)self defaultCallbackQueue];
  [(TMAPIClient *)self sendRequest:v7 queue:v8 callback:v6];
}

- (void)signRequest:(id)a3 withParameters:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TMSDKUserAgent userAgentHeaderString];
  [v6 setValue:v8 forRequestHeader:@"User-Agent"];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(TMAPIClient *)self customHeaders];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        id v15 = [(TMAPIClient *)self customHeaders];
        id v16 = [v15 objectForKeyedSubscript:v14];
        [v6 setValue:v16 forRequestHeader:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  uint64_t v17 = [v6 requestURL];
  id v18 = [v6 requestMethod];
  v19 = [v6 uniqueString];
  v20 = [(TMAPIClient *)self OAuthConsumerKey];
  id v21 = [(TMAPIClient *)self OAuthConsumerSecret];
  v22 = [(TMAPIClient *)self OAuthToken];
  v23 = [(TMAPIClient *)self OAuthTokenSecret];
  id v24 = +[TMOAuth headerForURL:v17 method:v18 postParameters:v7 nonce:v19 consumerKey:v20 consumerSecret:v21 token:v22 tokenSecret:v23];
  [v6 setValue:v24 forRequestHeader:@"Authorization"];
}

- (id)multipartBodyForParameters:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x263EFF9A0];
  id v13 = a4;
  uint64_t v14 = [v12 dictionaryWithDictionary:a3];
  id v15 = [(TMAPIClient *)self OAuthConsumerKey];
  [v14 setObject:v15 forKeyedSubscript:@"api_key"];

  id v16 = +[JXHTTPMultipartBody withDictionary:v14];
  LOBYTE(self) = (unint64_t)[v13 count] > 1;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__TMAPIClient_multipartBodyForParameters_filePathArray_contentTypeArray_fileNameArray___block_invoke;
  v23[3] = &unk_264E5A9C0;
  id v17 = v16;
  char v27 = (char)self;
  id v24 = v17;
  id v25 = v10;
  id v26 = v11;
  id v18 = v11;
  id v19 = v10;
  [v13 enumerateObjectsUsingBlock:v23];

  v20 = v26;
  id v21 = v17;

  return v21;
}

void __87__TMAPIClient_multipartBodyForParameters_filePathArray_contentTypeArray_fileNameArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  v5 = *(void **)(a1 + 32);
  int v6 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"data[%lu]", a3);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = @"data";
  }
  id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  uint64_t v9 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
  [v5 addFile:v10 forKey:v7 contentType:v8 fileName:v9];

  if (v6) {
}
  }

- (id)multipartPostRequest:(id)a3 type:(id)a4 parameters:(id)a5 filePathArray:(id)a6 contentTypeArray:(id)a7 fileNameArray:(id)a8
{
  uint64_t v14 = (void *)MEMORY[0x263EFF9A0];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  v20 = [v14 dictionaryWithDictionary:a5];
  id v21 = [(TMAPIClient *)self OAuthConsumerKey];
  [v20 setObject:v21 forKeyedSubscript:@"api_key"];

  [v20 setObject:v18 forKeyedSubscript:@"type"];
  v22 = blogPath(@"post", v19);

  v23 = [(TMAPIClient *)self URLWithPath:v22];
  id v24 = +[JXHTTPOperation withURLString:v23];

  [v24 setRequestMethod:@"POST"];
  id v25 = [(TMAPIClient *)self multipartBodyForParameters:v20 filePathArray:v17 contentTypeArray:v16 fileNameArray:v15];

  [v24 setRequestBody:v25];
  [(TMAPIClient *)self timeoutInterval];
  objc_msgSend(v24, "setRequestTimeoutInterval:");
  [(TMAPIClient *)self signRequest:v24 withParameters:v20];

  return v24;
}

- (id)postRequestWithPath:(id)a3 parameters:(id)a4
{
  int v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = [v6 dictionaryWithDictionary:a4];
  uint64_t v9 = [(TMAPIClient *)self OAuthConsumerKey];
  [v8 setObject:v9 forKeyedSubscript:@"api_key"];

  id v10 = [(TMAPIClient *)self URLWithPath:v7];

  id v11 = +[JXHTTPOperation withURLString:v10];

  [v11 setRequestMethod:@"POST"];
  uint64_t v12 = +[JXHTTPFormEncodedBody withDictionary:v8];
  [v11 setRequestBody:v12];

  [(TMAPIClient *)self timeoutInterval];
  objc_msgSend(v11, "setRequestTimeoutInterval:");
  [(TMAPIClient *)self signRequest:v11 withParameters:v8];

  return v11;
}

- (id)getRequestWithPath:(id)a3 parameters:(id)a4
{
  int v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = [v6 dictionaryWithDictionary:a4];
  uint64_t v9 = [(TMAPIClient *)self OAuthConsumerKey];
  [v8 setObject:v9 forKeyedSubscript:@"api_key"];

  id v10 = [(TMAPIClient *)self URLWithPath:v7];

  id v11 = +[JXHTTPOperation withURLString:v10 queryParameters:v8];

  [(TMAPIClient *)self timeoutInterval];
  objc_msgSend(v11, "setRequestTimeoutInterval:");
  [(TMAPIClient *)self signRequest:v11 withParameters:0];

  return v11;
}

- (void)tagged:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self taggedRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)taggedRequest:(id)a3 parameters:(id)a4
{
  int v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  id v8 = [v6 dictionaryWithDictionary:a4];
  [v8 setObject:v7 forKeyedSubscript:@"tag"];

  id v9 = [(TMAPIClient *)self getRequestWithPath:@"tagged" parameters:v8];

  return v9;
}

- (void)audio:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7 callback:(id)a8
{
  id v14 = a8;
  id v15 = [(TMAPIClient *)self audioRequest:a3 filePath:a4 contentType:a5 fileName:a6 parameters:a7];
  [(TMAPIClient *)self sendRequest:v15 callback:v14];
}

- (id)audioRequest:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7
{
  v24[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    v24[0] = v13;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = 0;
    if (v14)
    {
LABEL_3:
      id v23 = v14;
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  id v18 = 0;
  if (v15)
  {
LABEL_4:
    id v22 = v15;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    v20 = [(TMAPIClient *)self multipartPostRequest:v12 type:@"audio" parameters:v16 filePathArray:v17 contentTypeArray:v18 fileNameArray:v19];

    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v20 = [(TMAPIClient *)self multipartPostRequest:v12 type:@"audio" parameters:v16 filePathArray:v17 contentTypeArray:v18 fileNameArray:0];
  if (v14) {
LABEL_5:
  }

LABEL_6:
  if (v13) {

  }
  return v20;
}

- (void)video:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7 callback:(id)a8
{
  id v14 = a8;
  id v15 = [(TMAPIClient *)self videoRequest:a3 filePath:a4 contentType:a5 fileName:a6 parameters:a7];
  [(TMAPIClient *)self sendRequest:v15 callback:v14];
}

- (id)videoRequest:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7
{
  v24[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    v24[0] = v13;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = 0;
    if (v14)
    {
LABEL_3:
      id v23 = v14;
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  id v18 = 0;
  if (v15)
  {
LABEL_4:
    id v22 = v15;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    v20 = [(TMAPIClient *)self multipartPostRequest:v12 type:@"video" parameters:v16 filePathArray:v17 contentTypeArray:v18 fileNameArray:v19];

    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v20 = [(TMAPIClient *)self multipartPostRequest:v12 type:@"video" parameters:v16 filePathArray:v17 contentTypeArray:v18 fileNameArray:0];
  if (v14) {
LABEL_5:
  }

LABEL_6:
  if (v13) {

  }
  return v20;
}

- (void)photo:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6 parameters:(id)a7 callback:(id)a8
{
  id v14 = a8;
  id v15 = [(TMAPIClient *)self photoRequest:a3 filePathArray:a4 contentTypeArray:a5 fileNameArray:a6 parameters:a7];
  [(TMAPIClient *)self sendRequest:v15 callback:v14];
}

- (id)photoRequest:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6 parameters:(id)a7
{
  return [(TMAPIClient *)self multipartPostRequest:a3 type:@"photo" parameters:a7 filePathArray:a4 contentTypeArray:a5 fileNameArray:a6];
}

- (void)chat:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self chatRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)chatRequest:(id)a3 parameters:(id)a4
{
  return [(TMAPIClient *)self postRequest:a3 type:@"chat" parameters:a4];
}

- (void)link:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self linkRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)linkRequest:(id)a3 parameters:(id)a4
{
  return [(TMAPIClient *)self postRequest:a3 type:@"link" parameters:a4];
}

- (void)quote:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self quoteRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)quoteRequest:(id)a3 parameters:(id)a4
{
  return [(TMAPIClient *)self postRequest:a3 type:@"quote" parameters:a4];
}

- (void)text:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self textRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)textRequest:(id)a3 parameters:(id)a4
{
  return [(TMAPIClient *)self postRequest:a3 type:@"text" parameters:a4];
}

- (void)deletePost:(id)a3 id:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self deletePostRequest:a3 id:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)deletePostRequest:(id)a3 id:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = blogPath(@"post/delete", a3);
  id v11 = @"id";
  v12[0] = v6;
  id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v9 = [(TMAPIClient *)self postRequestWithPath:v7 parameters:v8];

  return v9;
}

- (void)reblogPost:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self reblogPostRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)reblogPostRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"post/reblog", a3);
  id v8 = [(TMAPIClient *)self postRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)editPost:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self editPostRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)editPostRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"post/edit", a3);
  id v8 = [(TMAPIClient *)self postRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)post:(id)a3 type:(id)a4 parameters:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = [(TMAPIClient *)self postRequest:a3 type:a4 parameters:a5];
  [(TMAPIClient *)self sendRequest:v11 callback:v10];
}

- (id)postRequest:(id)a3 type:(id)a4 parameters:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 dictionaryWithDictionary:a5];
  [v11 setObject:v9 forKeyedSubscript:@"type"];

  id v12 = blogPath(@"post", v10);

  id v13 = [(TMAPIClient *)self postRequestWithPath:v12 parameters:v11];

  return v13;
}

- (void)likes:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self likesRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)likesRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"likes", a3);
  id v8 = [(TMAPIClient *)self getRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)submissions:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self submissionsRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)submissionsRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"posts/submission", a3);
  id v8 = [(TMAPIClient *)self getRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)drafts:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self draftsRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)draftsRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"posts/draft", a3);
  id v8 = [(TMAPIClient *)self getRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)queue:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self queueRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)queueRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"posts/queue", a3);
  id v8 = [(TMAPIClient *)self getRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)posts:(id)a3 type:(id)a4 parameters:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = [(TMAPIClient *)self postsRequest:a3 type:a4 parameters:a5];
  [(TMAPIClient *)self sendRequest:v11 callback:v10];
}

- (id)postsRequest:(id)a3 type:(id)a4 parameters:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = blogPath(@"posts", a3);
  id v11 = v10;
  if (v8)
  {
    uint64_t v12 = [v10 stringByAppendingFormat:@"/%@", v8];

    id v11 = (void *)v12;
  }
  id v13 = [(TMAPIClient *)self getRequestWithPath:v11 parameters:v9];

  return v13;
}

- (void)followers:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self followersRequest:a3 parameters:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)followersRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = blogPath(@"followers", a3);
  id v8 = [(TMAPIClient *)self getRequestWithPath:v7 parameters:v6];

  return v8;
}

- (void)blogInfo:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(TMAPIClient *)self blogInfoRequest:a3];
  [(TMAPIClient *)self sendRequest:v7 callback:v6];
}

- (id)blogInfoRequest:(id)a3
{
  uint64_t v4 = blogPath(@"info", a3);
  v5 = [(TMAPIClient *)self getRequestWithPath:v4 parameters:0];

  return v5;
}

- (void)avatar:(id)a3 size:(unint64_t)a4 queue:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = blogPath(@"avatar", v10);
  id v14 = objc_msgSend(v13, "stringByAppendingFormat:", @"/%ld", a4);
  id v15 = [(TMAPIClient *)self getRequestWithPath:v14 parameters:0];

  if (v12)
  {
    v24[0] = 0;
    v24[1] = v24;
    void v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__35423;
    v24[4] = __Block_byref_object_dispose__35424;
    id v25 = _Block_copy(v12);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke;
    v21[3] = &unk_264E5A998;
    id v16 = v11;
    id v22 = v16;
    id v23 = v24;
    [v15 setDidFinishLoadingBlock:v21];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke_3;
    v18[3] = &unk_264E5A998;
    id v19 = v16;
    v20 = v24;
    [v15 setDidFailBlock:v18];

    _Block_object_dispose(v24, 8);
  }
  id v17 = [(TMAPIClient *)self queue];
  [v17 addOperation:v15];
}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)([v3 responseStatusCode] - 200) > 0x63)
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = [v3 responseStatusCode];

    v5 = [v6 errorWithDomain:@"Request failed" code:v7 userInfo:0];
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [v3 responseData];

    v5 = 0;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke_2;
  v12[3] = &unk_264E5DAA8;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v8;
  id v13 = v4;
  id v10 = v5;
  id v11 = v4;
  [v9 addOperationWithBlock:v12];
}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke_4;
  v7[3] = &unk_264E5EEC0;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 addOperationWithBlock:v7];
}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)avatar:(id)a3 size:(unint64_t)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(TMAPIClient *)self defaultCallbackQueue];
  [(TMAPIClient *)self avatar:v9 size:a4 queue:v10 callback:v8];
}

- (void)unlike:(id)a3 reblogKey:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self unlikeRequest:a3 reblogKey:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)unlikeRequest:(id)a3 reblogKey:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"id";
  v12[1] = @"reblog_key";
  v13[0] = a3;
  v13[1] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v10 = [(TMAPIClient *)self postRequestWithPath:@"user/unlike" parameters:v9];

  return v10;
}

- (void)like:(id)a3 reblogKey:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = [(TMAPIClient *)self likeRequest:a3 reblogKey:a4];
  [(TMAPIClient *)self sendRequest:v9 callback:v8];
}

- (id)likeRequest:(id)a3 reblogKey:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"id";
  v12[1] = @"reblog_key";
  v13[0] = a3;
  v13[1] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v10 = [(TMAPIClient *)self postRequestWithPath:@"user/like" parameters:v9];

  return v10;
}

- (void)unfollow:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(TMAPIClient *)self unfollowRequest:a3];
  [(TMAPIClient *)self sendRequest:v7 callback:v6];
}

- (id)unfollowRequest:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"url";
  uint64_t v4 = fullBlogName(a3);
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [(TMAPIClient *)self postRequestWithPath:@"user/unfollow" parameters:v5];

  return v6;
}

- (void)follow:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(TMAPIClient *)self followRequest:a3];
  [(TMAPIClient *)self sendRequest:v7 callback:v6];
}

- (id)followRequest:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"url";
  uint64_t v4 = fullBlogName(a3);
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [(TMAPIClient *)self postRequestWithPath:@"user/follow" parameters:v5];

  return v6;
}

- (void)following:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(TMAPIClient *)self followingRequest:a3];
  [(TMAPIClient *)self sendRequest:v7 callback:v6];
}

- (id)followingRequest:(id)a3
{
  return [(TMAPIClient *)self getRequestWithPath:@"user/following" parameters:a3];
}

- (void)likes:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(TMAPIClient *)self likesRequest:a3];
  [(TMAPIClient *)self sendRequest:v7 callback:v6];
}

- (id)likesRequest:(id)a3
{
  return [(TMAPIClient *)self getRequestWithPath:@"user/likes" parameters:a3];
}

- (void)dashboard:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(TMAPIClient *)self dashboardRequest:a3];
  [(TMAPIClient *)self sendRequest:v7 callback:v6];
}

- (id)dashboardRequest:(id)a3
{
  return [(TMAPIClient *)self getRequestWithPath:@"user/dashboard" parameters:a3];
}

- (void)userInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(TMAPIClient *)self userInfoRequest];
  [(TMAPIClient *)self sendRequest:v5 callback:v4];
}

- (id)userInfoRequest
{
  return [(TMAPIClient *)self getRequestWithPath:@"user/info" parameters:0];
}

- (NSString)OAuthConsumerSecret
{
  uint64_t v2 = +[TMTumblrAuthenticator sharedInstance];
  id v3 = [v2 OAuthConsumerSecret];

  return (NSString *)v3;
}

- (void)setOAuthConsumerSecret:(id)a3
{
  id v3 = a3;
  id v4 = +[TMTumblrAuthenticator sharedInstance];
  [v4 setOAuthConsumerSecret:v3];
}

- (NSString)OAuthConsumerKey
{
  uint64_t v2 = +[TMTumblrAuthenticator sharedInstance];
  id v3 = [v2 OAuthConsumerKey];

  return (NSString *)v3;
}

- (void)setOAuthConsumerKey:(id)a3
{
  id v3 = a3;
  id v4 = +[TMTumblrAuthenticator sharedInstance];
  [v4 setOAuthConsumerKey:v3];
}

- (void)xAuth:(id)a3 password:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[TMTumblrAuthenticator sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__TMAPIClient_xAuth_password_callback___block_invoke;
  void v13[3] = &unk_264E5A970;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 xAuth:v10 password:v9 callback:v13];
}

void __39__TMAPIClient_xAuth_password_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v9 = a4;
  id v8 = a3;
  [v7 setOAuthToken:a2];
  [*(id *)(a1 + 32) setOAuthTokenSecret:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)handleOpenURL:(id)a3
{
  id v3 = a3;
  id v4 = +[TMTumblrAuthenticator sharedInstance];
  char v5 = [v4 handleOpenURL:v3];

  return v5;
}

- (void)authenticate:(id)a3 urlBlock:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[TMTumblrAuthenticator sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__TMAPIClient_authenticate_urlBlock_callback___block_invoke;
  void v13[3] = &unk_264E5A970;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 authenticate:v10 urlBlock:v9 callback:v13];
}

void __46__TMAPIClient_authenticate_urlBlock_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v9 = a4;
  id v8 = a3;
  [v7 setOAuthToken:a2];
  [*(id *)(a1 + 32) setOAuthTokenSecret:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (TMAPIClient)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__TMAPIClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate_35583 != -1) {
    dispatch_once(&sharedInstance_predicate_35583, block);
  }
  uint64_t v2 = (void *)sharedInstance_instance_35584;
  return (TMAPIClient *)v2;
}

void __29__TMAPIClient_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)sharedInstance_instance_35584;
  sharedInstance_instance_35584 = (uint64_t)v1;
}

@end