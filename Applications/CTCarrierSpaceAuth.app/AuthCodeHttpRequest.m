@interface AuthCodeHttpRequest
- (AuthCodeHttpRequest)initWithBaseURL:(id)a3 clientID:(id)a4;
- (AuthCodeHttpRequest)initWithBaseURL:(id)a3 clientID:(id)a4 redirectURI:(id)a5;
- (NSString)clientID;
- (NSString)iccid;
- (NSString)redirectURI;
- (NSString)scope;
- (NSString)state;
- (NSURL)baseURL;
- (NSURL)url;
- (void)setBaseURL:(id)a3;
- (void)setClientID:(id)a3;
- (void)setIccid:(id)a3;
- (void)setRedirectURI:(id)a3;
- (void)setScope:(id)a3;
- (void)setState:(id)a3;
@end

@implementation AuthCodeHttpRequest

- (AuthCodeHttpRequest)initWithBaseURL:(id)a3 clientID:(id)a4 redirectURI:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AuthCodeHttpRequest;
  result = [(AuthCodeHttpRequest *)&v9 init];
  if (result)
  {
    result->_baseURL = (NSURL *)a3;
    result->_clientID = (NSString *)a4;
    result->_redirectURI = (NSString *)a5;
    result->_iccid = 0;
  }
  return result;
}

- (AuthCodeHttpRequest)initWithBaseURL:(id)a3 clientID:(id)a4
{
  return [(AuthCodeHttpRequest *)self initWithBaseURL:a3 clientID:a4 redirectURI:@"carrierspaceauth://"];
}

- (NSURL)url
{
  v17[0] = @"response_type=code";
  v3 = +[NSString stringWithFormat:@"client_id=%@", self->_clientID];
  v17[1] = v3;
  v4 = +[NSString stringWithFormat:@"redirect_uri=%@", self->_redirectURI];
  v17[2] = v4;
  v5 = +[NSArray arrayWithObjects:v17 count:3];

  v6 = +[NSMutableArray arrayWithArray:v5];
  if (self->_iccid)
  {
    v7 = +[NSString stringWithFormat:@"iccid=%@", self->_iccid];
    [v6 addObject:v7];
  }
  if (self->_scope)
  {
    v8 = +[NSString stringWithFormat:@"scope=%@", self->_scope];
    [v6 addObject:v8];
  }
  if (self->_state)
  {
    objc_super v9 = +[NSString stringWithFormat:@"state=%@", self->_state];
    [v6 addObject:v9];
  }
  v10 = [v6 componentsJoinedByString:@"&"];
  v11 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];

  v13 = [(NSURL *)self->_baseURL absoluteString];
  v14 = +[NSString stringWithFormat:@"%@?%@", v13, v12];

  v15 = +[NSURL URLWithString:v14];

  return (NSURL *)v15;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  self->_baseURL = (NSURL *)a3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  self->_clientID = (NSString *)a3;
}

- (NSString)redirectURI
{
  return self->_redirectURI;
}

- (void)setRedirectURI:(id)a3
{
  self->_redirectURI = (NSString *)a3;
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  self->_iccid = (NSString *)a3;
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  self->_scope = (NSString *)a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  self->_state = (NSString *)a3;
}

@end