@interface PocketAPILogin
+ (BOOL)supportsSecureCoding;
- (NSString)accessToken;
- (NSString)requestToken;
- (NSString)uuid;
- (PocketAPI)API;
- (PocketAPILogin)init;
- (PocketAPILogin)initWithAPI:(id)a3 delegate:(id)a4;
- (PocketAPILogin)initWithCoder:(id)a3;
- (id)redirectURL;
- (void)_setRequestToken:(id)a3;
- (void)_setReverseAuth:(BOOL)a3;
- (void)convertRequestTokenToAccessToken;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchRequestToken;
- (void)loginDidFinish:(BOOL)a3;
- (void)loginDidStart;
- (void)pocketAPI:(id)a3 hadLoginError:(id)a4;
- (void)pocketAPI:(id)a3 receivedRequestToken:(id)a4;
- (void)pocketAPILoggedIn:(id)a3;
@end

@implementation PocketAPILogin

- (NSString)accessToken
{
  return self->accessToken;
}

- (NSString)requestToken
{
  return self->requestToken;
}

- (NSString)uuid
{
  return self->uuid;
}

- (PocketAPI)API
{
  return self->API;
}

- (void)loginDidFinish:(BOOL)a3
{
  if (!self->didFinish)
  {
    BOOL v3 = a3;
    self->didFinish = 1;
    if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(PocketAPIDelegate *)self->delegate pocketAPIDidFinishLogin:[(PocketAPILogin *)self API]];
    }
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:PocketAPILoginFinishedNotification object:0];
    if (self->reverseAuth)
    {
      v6 = NSString;
      id v7 = +[PocketAPI pocketAppURLScheme];
      if (v3) {
        v8 = @"success";
      }
      else {
        v8 = @"failed";
      }
      uint64_t v9 = [v6 stringWithFormat:@"%@://reverse/%@/%i", v7, v8, -[PocketAPI appID](-[PocketAPILogin API](self, "API"), "appID")];
      uint64_t v10 = [NSURL URLWithString:v9];
      delegate = self->delegate;
      v12 = [(PocketAPILogin *)self API];
      [(PocketAPIDelegate *)delegate pocketAPI:v12 requestedOpenURL:v10 completionHandler:0];
    }
  }
}

- (void)loginDidStart
{
  if (!self->didStart)
  {
    self->didStart = 1;
    if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(PocketAPIDelegate *)self->delegate pocketAPIDidStartLogin:[(PocketAPILogin *)self API]];
    }
    BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = PocketAPILoginStartedNotification;
    [v3 postNotificationName:v4 object:0];
  }
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(PocketAPIDelegate *)self->delegate pocketAPI:a3 hadLoginError:a4];
  }
  -[PocketAPILogin loginDidFinish:](self, "loginDidFinish:", 0, a4);

  self->delegate = 0;
}

- (void)pocketAPILoggedIn:(id)a3
{
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(PocketAPIDelegate *)self->delegate pocketAPILoggedIn:[(PocketAPILogin *)self API]];
  }
  [(PocketAPILogin *)self loginDidFinish:1];

  self->delegate = 0;
}

- (void)pocketAPI:(id)a3 receivedRequestToken:(id)a4
{
  [(PocketAPILogin *)self _setRequestToken:a4];
  id v6 = +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", objc_msgSend(-[PocketAPILogin redirectURL](self, "redirectURL"), "absoluteString"));
  delegate = self->delegate;
  uint64_t v8 = [NSURL URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"pocket-oauth-v1:///authorize?request_token=%@&redirect_uri=%@", self->requestToken, v6)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke;
  v9[3] = &unk_264E5C978;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = v6;
  [(PocketAPIDelegate *)delegate pocketAPI:a3 requestedOpenURL:v8 completionHandler:v9];
}

void *__49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke(void *result, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = result;
    uint64_t v3 = result[4];
    uint64_t v4 = result[5];
    v5 = *(void **)(v3 + 48);
    uint64_t v6 = [NSURL URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"https://getpocket.com/auth/authorize?request_token=%@&redirect_uri=%@", *(void *)(v3 + 24), result[6])];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke_2;
    v7[3] = &unk_264E571B8;
    long long v8 = *((_OWORD *)v2 + 2);
    return (void *)[v5 pocketAPI:v4 requestedOpenURL:v6 completionHandler:v7];
  }
  return result;
}

uint64_t __49__PocketAPILogin_pocketAPI_receivedRequestToken___block_invoke_2(uint64_t result, char a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(result + 32);
    uint64_t v3 = *(void *)(result + 40);
    uint64_t v4 = *MEMORY[0x263F07F70];
    uint64_t v5 = *MEMORY[0x263F08320];
    v6[0] = @"Failed to open the Pocket authentication URL.";
    return objc_msgSend(v2, "pocketAPI:hadLoginError:", v3, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v4, 3328, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
  return result;
}

- (void)convertRequestTokenToAccessToken
{
  uint64_t v9 = objc_alloc_init(PocketAPIOperation);
  [(PocketAPIOperation *)v9 setAPI:self->API];
  [(PocketAPIOperation *)v9 setDelegate:self];
  [(PocketAPIOperation *)v9 setDomain:10];
  [(PocketAPIOperation *)v9 setHTTPMethod:1];
  [(PocketAPIOperation *)v9 setAPIMethod:@"authorize"];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages"), "objectAtIndex:", 0);
  uint64_t v4 = (void *)[MEMORY[0x263EFF960] currentLocale];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA18], "systemTimeZone"), "secondsFromGMT") / 60;
  id v7 = NSDictionary;
  long long v8 = [(PocketAPILogin *)self requestToken];
  -[PocketAPIOperation setArguments:](v9, "setArguments:", [v7 dictionaryWithObjectsAndKeys:v8, @"code", v3, @"locale", v5, @"country", objc_msgSend(NSString, "stringWithFormat:", @"%i", v6), @"timezone", 0]);
  [(NSOperationQueue *)self->operationQueue addOperation:v9];
}

- (void)fetchRequestToken
{
  [(PocketAPILogin *)self loginDidStart];
  uint64_t v4 = objc_alloc_init(PocketAPIOperation);
  [(PocketAPIOperation *)v4 setAPI:self->API];
  [(PocketAPIOperation *)v4 setDelegate:self];
  [(PocketAPIOperation *)v4 setDomain:10];
  [(PocketAPIOperation *)v4 setHTTPMethod:1];
  [(PocketAPIOperation *)v4 setAPIMethod:@"request"];
  uint64_t v3 = objc_msgSend(-[PocketAPILogin redirectURL](self, "redirectURL"), "absoluteString");
  -[PocketAPIOperation setArguments:](v4, "setArguments:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", -[PocketAPILogin uuid](self, "uuid"), @"state", v3, @"redirect_uri", 0));
  [(NSOperationQueue *)self->operationQueue addOperation:v4];
}

- (id)redirectURL
{
  v2 = NSURL;
  uint64_t v3 = [NSString stringWithFormat:@"%@:authorizationFinished", -[PocketAPI URLScheme](-[PocketAPILogin API](self, "API"), "URLScheme")];
  return (id)[v2 URLWithString:v3];
}

- (PocketAPILogin)initWithAPI:(id)a3 delegate:(id)a4
{
  uint64_t v6 = [(PocketAPILogin *)self init];
  if (v6)
  {
    id v7 = a3;

    v6->API = (PocketAPI *)a3;
    v6->delegate = (PocketAPIDelegate *)a4;
  }
  return v6;
}

- (PocketAPILogin)init
{
  v5.receiver = self;
  v5.super_class = (Class)PocketAPILogin;
  v2 = [(PocketAPILogin *)&v5 init];
  if (v2)
  {
    v2->operationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v2->API = (PocketAPI *)+[PocketAPI sharedAPI];
    CFUUIDRef v3 = CFUUIDCreate(0);
    v2->uuid = (NSString *)CFUUIDCreateString(0, v3);
    CFRelease(v3);
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->operationQueue waitUntilAllOperationsAreFinished];

  self->operationQueue = 0;
  self->requestToken = 0;

  self->accessToken = 0;
  self->API = 0;

  self->delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPILogin;
  [(PocketAPILogin *)&v3 dealloc];
}

- (void)_setReverseAuth:(BOOL)a3
{
  self->reverseAuth = a3;
}

- (void)_setRequestToken:(id)a3
{
  [(PocketAPILogin *)self willChangeValueForKey:@"requestToken"];
  objc_super v5 = self->requestToken;
  self->requestToken = (NSString *)[a3 copy];
  [(PocketAPILogin *)self didChangeValueForKey:@"requestToken"];
}

- (PocketAPILogin)initWithCoder:(id)a3
{
  uint64_t v4 = [(PocketAPILogin *)self init];
  if (v4)
  {
    v4->requestToken = (NSString *)(id)[a3 decodeObjectForKey:@"requestToken"];
    v4->accessToken = (NSString *)(id)[a3 decodeObjectForKey:@"accessToken"];
    v4->uuid = (NSString *)(id)[a3 decodeObjectForKey:@"uuid"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[PocketAPILogin requestToken](self, "requestToken"), @"requestToken");
  objc_msgSend(a3, "encodeObject:forKey:", -[PocketAPILogin accessToken](self, "accessToken"), @"accessToken");
  objc_super v5 = [(PocketAPILogin *)self uuid];
  [a3 encodeObject:v5 forKey:@"uuid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end