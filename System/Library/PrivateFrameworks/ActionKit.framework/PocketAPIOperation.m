@interface PocketAPIOperation
+ (id)decodeForURL:(id)a3;
+ (id)encodeForURL:(id)a3;
+ (id)errorFromXError:(id)a3 withErrorCode:(unint64_t)a4 HTTPStatusCode:(unint64_t)a5;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSDictionary)arguments;
- (NSError)error;
- (NSHTTPURLResponse)response;
- (NSMutableData)data;
- (NSString)APIMethod;
- (NSString)baseURLPath;
- (NSString)description;
- (NSURLConnection)connection;
- (PocketAPI)API;
- (PocketAPIDelegate)delegate;
- (PocketAPIOperation)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pkt_URLRequest;
- (id)pkt_requestArguments;
- (id)responseDictionary;
- (int)HTTPMethod;
- (int)domain;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)connectionFinishedWithError:(id)a3;
- (void)dealloc;
- (void)pkt_connectionFinishedLoading;
- (void)pocketAPI:(id)a3 hadLoginError:(id)a4;
- (void)pocketAPILoggedIn:(id)a3;
- (void)setAPI:(id)a3;
- (void)setAPIMethod:(id)a3;
- (void)setArguments:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomain:(int)a3;
- (void)setHTTPMethod:(int)a3;
- (void)start;
@end

@implementation PocketAPIOperation

- (NSMutableData)data
{
  return self->data;
}

- (NSHTTPURLResponse)response
{
  return self->response;
}

- (NSURLConnection)connection
{
  return self->connection;
}

- (void)setArguments:(id)a3
{
}

- (NSDictionary)arguments
{
  return self->arguments;
}

- (void)setAPIMethod:(id)a3
{
}

- (NSString)APIMethod
{
  return self->APIMethod;
}

- (void)setHTTPMethod:(int)a3
{
  self->HTTPMethod = a3;
}

- (int)HTTPMethod
{
  return self->HTTPMethod;
}

- (void)setDomain:(int)a3
{
  self->domain = a3;
}

- (int)domain
{
  return self->domain;
}

- (NSError)error
{
  return self->error;
}

- (void)setDelegate:(id)a3
{
}

- (PocketAPIDelegate)delegate
{
  return self->delegate;
}

- (void)setAPI:(id)a3
{
}

- (PocketAPI)API
{
  return self->API;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PocketAPIOperation allocWithZone:a3] init];
  [(PocketAPIOperation *)v4 setAPI:[(PocketAPIOperation *)self API]];
  [(PocketAPIOperation *)v4 setDelegate:[(PocketAPIOperation *)self delegate]];
  [(PocketAPIOperation *)v4 setDomain:[(PocketAPIOperation *)self domain]];
  [(PocketAPIOperation *)v4 setHTTPMethod:[(PocketAPIOperation *)self HTTPMethod]];
  [(PocketAPIOperation *)v4 setAPIMethod:[(PocketAPIOperation *)self APIMethod]];
  [(PocketAPIOperation *)v4 setArguments:[(PocketAPIOperation *)self arguments]];
  return v4;
}

- (void)pkt_connectionFinishedLoading
{
  self->finishedLoading = 1;
  [(PocketAPIOperation *)self didChangeValueForKey:@"isFinished"];
  [(PocketAPIOperation *)self didChangeValueForKey:@"isExecuting"];

  self->delegate = 0;
}

- (id)pkt_URLRequest
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSString stringWithFormat:@"https://%@/%@", -[PocketAPIOperation baseURLPath](self, "baseURLPath"), -[PocketAPIOperation APIMethod](self, "APIMethod")];
  id v4 = [(PocketAPIOperation *)self pkt_requestArguments];
  if (!-[PocketAPIOperation HTTPMethod](self, "HTTPMethod") && [v4 count])
  {
    v20 = (void *)v3;
    v5 = (void *)[MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = v4;
    id obj = (id)[v4 allKeys];
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=%@", *(void *)(*((void *)&v22 + 1) + 8 * i), +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * i))))];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }
    if ([v5 count]) {
      uint64_t v3 = [v20 stringByAppendingFormat:@"?%@", objc_msgSend(v5, "componentsJoinedByString:", @"&"];
    }
    else {
      uint64_t v3 = (uint64_t)v20;
    }
    id v4 = v6;
  }
  uint64_t v11 = [NSURL URLWithString:v3];
  v12 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v11];
  [v12 _setNonAppInitiated:1];
  unsigned int v13 = [(PocketAPIOperation *)self HTTPMethod] - 1;
  if (v13 > 2) {
    v14 = @"GET";
  }
  else {
    v14 = off_264E5A4A0[v13];
  }
  [v12 setHTTPMethod:v14];
  [v12 setTimeoutInterval:20.0];
  [v12 setCachePolicy:4];
  Class v15 = NSClassFromString(&cfstr_Nsjsonserializ.isa);
  if (-[PocketAPIOperation HTTPMethod](self, "HTTPMethod") && [v4 count])
  {
    if (v15)
    {
      [v12 addValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
      uint64_t v16 = [(objc_class *)v15 dataWithJSONObject:v4 options:0 error:0];
    }
    else
    {
      objc_msgSend(v12, "addValue:forHTTPHeaderField:", @"application/x-www-form-urlencoded; charset=UTF-8",
        @"Content-Type");
      uint64_t v16 = objc_msgSend((id)objc_msgSend(v4, "pkt_URLEncodedFormString"), "dataUsingEncoding:", 4);
    }
    [v12 setHTTPBody:v16];
  }
  id v17 = [[(PocketAPIOperation *)self API] pkt_userAgent];
  if (v17) {
    [v12 addValue:v17 forHTTPHeaderField:@"User-Agent"];
  }
  if (v15) {
    v18 = @"application/json";
  }
  else {
    v18 = @"application/x-www-form-urlencoded";
  }
  [v12 addValue:v18 forHTTPHeaderField:@"X-Accept"];
  return v12;
}

- (id)pkt_requestArguments
{
  id v3 = (id)[(NSDictionary *)[(PocketAPIOperation *)self arguments] mutableCopy];
  if ([[(PocketAPIOperation *)self API] consumerKey]) {
    objc_msgSend(v3, "setObject:forKey:", -[PocketAPI consumerKey](-[PocketAPIOperation API](self, "API"), "consumerKey"), @"consumer_key");
  }
  id v4 = [[(PocketAPIOperation *)self API] pkt_getToken];
  if (v4) {
    [v3 setObject:v4 forKey:@"access_token"];
  }
  return v3;
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
}

- (void)pocketAPILoggedIn:(id)a3
{
  [(NSOperationQueue *)[[(PocketAPIOperation *)self API] operationQueue] addOperation:(id)[(PocketAPIOperation *)self copy]];
  [(PocketAPIOperation *)self pkt_connectionFinishedLoading];
}

- (void)connectionFinishedWithError:(id)a3
{
  if ([(PocketAPIOperation *)self response]) {
    uint64_t v5 = [(NSHTTPURLResponse *)[(PocketAPIOperation *)self response] statusCode];
  }
  else {
    uint64_t v5 = [a3 code];
  }
  uint64_t v6 = v5;
  BOOL v8 = !self->attemptedRelogin && v5 == 401;
  uint64_t v9 = (int)objc_msgSend(-[NSDictionary objectForKey:](-[NSHTTPURLResponse allHeaderFields](-[PocketAPIOperation response](self, "response"), "allHeaderFields"), "objectForKey:", @"X-Error-Code"), "intValue");
  v10 = [(NSDictionary *)[(NSHTTPURLResponse *)[(PocketAPIOperation *)self response] allHeaderFields] objectForKey:@"X-Error"];
  if (v6 <= 499)
  {
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 199;
    uint64_t v11 = @"There was a server error.";
  }
  if (v9)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = PocketAPIErrorDomain;
    uint64_t v14 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v11, @"localizedDescription", a3, @"HTTPError", 0);
    Class v15 = v12;
    uint64_t v16 = v13;
    uint64_t v17 = v9;
  }
  else if (a3)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = PocketAPIErrorDomain;
    uint64_t v14 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v11, @"localizedDescription", a3, @"HTTPError", 0);
    Class v15 = v18;
    uint64_t v16 = v19;
    uint64_t v17 = v6;
  }
  else
  {
    if (v6 != 403)
    {
      v20 = 0;
      goto LABEL_20;
    }
    Class v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = PocketAPIErrorDomain;
    uint64_t v17 = 403;
    uint64_t v14 = 0;
  }
  v20 = (void *)[v15 errorWithDomain:v16 code:v17 userInfo:v14];
LABEL_20:
  self->error = (NSError *)v20;
  if ([(PocketAPIOperation *)self delegate])
  {
    [(PocketAPIOperation *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(PocketAPIDelegate *)[(PocketAPIOperation *)self delegate] pocketAPI:[(PocketAPIOperation *)self API] receivedResponse:[(PocketAPIOperation *)self responseDictionary] forAPIMethod:[(PocketAPIOperation *)self APIMethod] error:a3];
    }
  }
  if (v8)
  {
    [[(PocketAPIOperation *)self API] loginWithDelegate:self];
    self->attemptedRelogin = 1;
    return;
  }
  if (v6 == 403) {
    [[(PocketAPIOperation *)self API] logout];
  }
  error = self->error;
  long long v22 = [(PocketAPIOperation *)self APIMethod];
  if (!error)
  {
    if ([(NSString *)v22 isEqualToString:@"auth"])
    {
      uint64_t v27 = [(PocketAPIOperation *)self API];
      id v28 = [(NSDictionary *)[(PocketAPIOperation *)self arguments] objectForKey:@"username"];
      id v29 = [(NSDictionary *)[(PocketAPIOperation *)self arguments] objectForKey:@"token"];
      v30 = v27;
      id v31 = v28;
    }
    else
    {
      if ([(NSString *)[(PocketAPIOperation *)self APIMethod] isEqualToString:@"add"])
      {
        if ([(PocketAPIOperation *)self delegate])
        {
          [(PocketAPIOperation *)self delegate];
          if (objc_opt_respondsToSelector())
          {
            id v32 = [(NSDictionary *)[(PocketAPIOperation *)self arguments] objectForKey:@"url"];
            if (v32) {
              uint64_t v33 = [NSURL URLWithString:v32];
            }
            else {
              uint64_t v33 = 0;
            }
            [(PocketAPIDelegate *)[(PocketAPIOperation *)self delegate] pocketAPI:[(PocketAPIOperation *)self API] savedURL:v33];
          }
        }
        goto LABEL_62;
      }
      if ([(NSString *)[(PocketAPIOperation *)self APIMethod] isEqualToString:@"request"])
      {
        -[PocketAPIDelegate pocketAPI:receivedRequestToken:](-[PocketAPIOperation delegate](self, "delegate"), "pocketAPI:receivedRequestToken:", -[PocketAPIOperation API](self, "API"), objc_msgSend(-[PocketAPIOperation responseDictionary](self, "responseDictionary"), "objectForKey:", @"code"));
        goto LABEL_62;
      }
      if (![(NSString *)[(PocketAPIOperation *)self APIMethod] isEqualToString:@"authorize"]&& ![(NSString *)[(PocketAPIOperation *)self APIMethod] isEqualToString:@"oauth/authorize"])
      {
        goto LABEL_62;
      }
      id v36 = [(PocketAPIOperation *)self responseDictionary];
      id v37 = (id)[v36 objectForKey:@"username"];
      if ((!v37 || v37 == (id)[MEMORY[0x263EFF9D0] null])
        && objc_msgSend(-[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", @"grant_type"), "isEqualToString:", @"credentials"))
      {
        id v37 = [(NSDictionary *)[(PocketAPIOperation *)self arguments] objectForKey:@"username"];
      }
      uint64_t v38 = [v36 objectForKey:@"access_token"];
      if (v37 == (id)[MEMORY[0x263EFF9D0] null] && v38 == objc_msgSend(MEMORY[0x263EFF9D0], "null"))
      {
        v39 = [(PocketAPIOperation *)self delegate];
        v40 = [(PocketAPIOperation *)self API];
        long long v25 = (NSError *)[MEMORY[0x263F087E8] errorWithDomain:@"PocketAPI" code:404 userInfo:0];
        v26 = v39;
        long long v24 = v40;
        goto LABEL_33;
      }
      v30 = [(PocketAPIOperation *)self API];
      id v31 = v37;
      id v29 = (id)v38;
    }
    [(PocketAPI *)v30 pkt_loggedInWithUsername:v31 token:v29];
    if ([(PocketAPIOperation *)self delegate])
    {
      [(PocketAPIOperation *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(PocketAPIDelegate *)[(PocketAPIOperation *)self delegate] pocketAPILoggedIn:[(PocketAPIOperation *)self API]];
      }
    }
    goto LABEL_62;
  }
  if ([(NSString *)v22 rangeOfString:@"auth"] == 0x7FFFFFFFFFFFFFFFLL
    && ![(NSString *)[(PocketAPIOperation *)self APIMethod] isEqualToString:@"request"])
  {
    if ([(NSString *)[(PocketAPIOperation *)self APIMethod] isEqualToString:@"add"])
    {
      if ([(PocketAPIOperation *)self delegate])
      {
        [(PocketAPIOperation *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          v34 = [(PocketAPIOperation *)self delegate];
          v35 = [(PocketAPIOperation *)self API];
          -[PocketAPIDelegate pocketAPI:failedToSaveURL:error:](v34, "pocketAPI:failedToSaveURL:error:", v35, objc_msgSend(NSURL, "URLWithString:", -[NSDictionary objectForKey:](-[PocketAPIOperation arguments](self, "arguments"), "objectForKey:", @"url")), self->error);
        }
      }
    }
    goto LABEL_62;
  }
  if ([(PocketAPIOperation *)self delegate])
  {
    [(PocketAPIOperation *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      long long v23 = [(PocketAPIOperation *)self delegate];
      long long v24 = [(PocketAPIOperation *)self API];
      long long v25 = self->error;
      v26 = v23;
LABEL_33:
      [(PocketAPIDelegate *)v26 pocketAPI:v24 hadLoginError:v25];
    }
  }
LABEL_62:
  [(PocketAPIOperation *)self pkt_connectionFinishedLoading];
}

- (void)connectionDidFinishLoading:(id)a3
{
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v5 = (NSHTTPURLResponse *)a4;
  self->response = v5;
  if ([(NSHTTPURLResponse *)v5 statusCode] == 200)
  {
    self->data = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:0];
  }
  else if ([(NSDictionary *)[(NSHTTPURLResponse *)self->response allHeaderFields] objectForKey:@"X-Error"])
  {
    [(NSURLConnection *)self->connection cancel];
    id v6 = [(NSDictionary *)[(NSHTTPURLResponse *)self->response allHeaderFields] objectForKey:@"X-Error"];
    if (v6) {
      uint64_t v7 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x263F08320], 0);
    }
    else {
      uint64_t v7 = 0;
    }
    connection = self->connection;
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"PocketSDK", -[NSHTTPURLResponse statusCode](self->response, "statusCode"), v7);
    [(PocketAPIOperation *)self connection:connection didFailWithError:v9];
  }
}

- (id)responseDictionary
{
  id v3 = [(NSDictionary *)[(NSHTTPURLResponse *)[(PocketAPIOperation *)self response] allHeaderFields] objectForKey:@"Content-Type"];
  if ([v3 isEqualToString:@"application/json"])
  {
    Class v4 = NSClassFromString(&cfstr_Nsjsonserializ.isa);
    uint64_t v5 = [(PocketAPIOperation *)self data];
    return (id)[(objc_class *)v4 JSONObjectWithData:v5 options:0 error:0];
  }
  else if ([v3 rangeOfString:@"application/x-www-form-urlencode"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  else
  {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithData:encoding:", -[PocketAPIOperation data](self, "data"), 4);
    BOOL v8 = NSDictionary;
    return (id)objc_msgSend(v8, "pkt_dictionaryByParsingURLEncodedFormString:", v7);
  }
}

- (NSString)baseURLPath
{
  if ([(PocketAPIOperation *)self domain] == 10) {
    return (NSString *)@"getpocket.com/v3/oauth";
  }
  else {
    return (NSString *)@"getpocket.com/v3";
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p https://%@/%@ %@>", objc_opt_class(), self, -[PocketAPIOperation baseURLPath](self, "baseURLPath"), -[PocketAPIOperation APIMethod](self, "APIMethod"), -[PocketAPIOperation arguments](self, "arguments")];
}

- (void)dealloc
{
  self->API = 0;
  self->delegate = 0;

  self->APIMethod = 0;
  self->arguments = 0;

  self->connection = 0;
  self->response = 0;

  self->data = 0;
  self->error = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPIOperation;
  [(PocketAPIOperation *)&v3 dealloc];
}

- (PocketAPIOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)PocketAPIOperation;
  result = [(PocketAPIOperation *)&v3 init];
  if (result) {
    result->domain = 0;
  }
  return result;
}

- (BOOL)isFinished
{
  return self->finishedLoading;
}

- (BOOL)isExecuting
{
  return !self->finishedLoading;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  self->finishedLoading = 0;
  if ([[(PocketAPIOperation *)self API] isLoggedIn]
    || [(NSString *)self->APIMethod isEqualToString:@"request"]
    || [(NSString *)self->APIMethod isEqualToString:@"authorize"]
    || [(NSString *)self->APIMethod isEqualToString:@"oauth/authorize"])
  {
    id v3 = [(PocketAPIOperation *)self pkt_URLRequest];
    Class v4 = (NSURLConnection *)[objc_alloc(MEMORY[0x263EFC608]) initWithRequest:v3 delegate:self startImmediately:0];
    self->connection = v4;
    uint64_t v5 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(NSURLConnection *)v4 scheduleInRunLoop:v5 forMode:*MEMORY[0x263EFF588]];
    connection = self->connection;
    [(NSURLConnection *)connection start];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:PocketAPIErrorDomain code:401 userInfo:0];
    [(PocketAPIOperation *)self connectionFinishedWithError:v7];
  }
}

+ (id)errorFromXError:(id)a3 withErrorCode:(unint64_t)a4 HTTPStatusCode:(unint64_t)a5
{
  return 0;
}

+ (id)decodeForURL:(id)a3
{
  return (id)[a3 stringByRemovingPercentEncoding];
}

+ (id)encodeForURL:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"!*'();:@&=+$,/?%#[]"),
         "invertedSet");
  return (id)[a3 stringByAddingPercentEncodingWithAllowedCharacters:v4];
}

@end