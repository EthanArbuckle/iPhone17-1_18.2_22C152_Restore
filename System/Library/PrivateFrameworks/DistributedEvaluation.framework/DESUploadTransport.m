@interface DESUploadTransport
+ (BOOL)supportsSecureCoding;
- (BOOL)dediscoRoute;
- (BOOL)originRoute;
- (BOOL)parsecRoute;
- (DESUploadTransport)initWithCoder:(id)a3;
- (DESUploadTransport)initWithDediscoRoute:(BOOL)a3 originRoute:(BOOL)a4 parsecRoute:(BOOL)a5 postBackBaseURL:(id)a6;
- (DESUploadTransport)initWithPolicy:(id)a3 recipe:(id)a4;
- (NSURL)postBackBaseURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DESUploadTransport

- (DESUploadTransport)initWithPolicy:(id)a3 recipe:(id)a4
{
  v5 = 0;
  if (a3 && a4)
  {
    id v7 = a3;
    if ([a4 transportIsDedisco])
    {
      uint64_t v8 = [v7 dediscoReturnRouteEnabled];
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v9 = [v7 originReturnRouteEnabled];
      uint64_t v10 = [v7 parsecReturnRouteEnabled];
      uint64_t v8 = 0;
    }
    v11 = [v7 postbackBaseURL];

    self = [(DESUploadTransport *)self initWithDediscoRoute:v8 originRoute:v9 parsecRoute:v10 postBackBaseURL:v11];
    v5 = self;
  }

  return v5;
}

- (DESUploadTransport)initWithDediscoRoute:(BOOL)a3 originRoute:(BOOL)a4 parsecRoute:(BOOL)a5 postBackBaseURL:(id)a6
{
  BOOL v9 = a3;
  id v11 = a6;
  if (a4 || a5 || v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)DESUploadTransport;
    v13 = [(DESUploadTransport *)&v16 init];
    v14 = v13;
    if (v13)
    {
      v13->_dediscoRoute = v9;
      v13->_originRoute = a4;
      v13->_parsecRoute = a5;
      objc_storeStrong((id *)&v13->_postBackBaseURL, a6);
    }
    self = v14;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(DESUploadTransport *)self originRoute];
  BOOL v7 = [(DESUploadTransport *)self parsecRoute];
  BOOL v8 = [(DESUploadTransport *)self dediscoRoute];
  BOOL v9 = [(DESUploadTransport *)self postBackBaseURL];
  uint64_t v10 = [v3 stringWithFormat:@"%@(origin=%d, parsec=%d, dedisco=%d, %@)", v5, v6, v7, v8, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeBool:self->_dediscoRoute forKey:@"dediscoRoute"];
  [v5 encodeBool:self->_originRoute forKey:@"originRoute"];
  [v5 encodeBool:self->_parsecRoute forKey:@"parsecRoute"];
  postBackBaseURL = self->_postBackBaseURL;
  if (postBackBaseURL) {
    [v5 encodeObject:postBackBaseURL forKey:@"postBackBaseURL"];
  }
}

- (DESUploadTransport)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"dediscoRoute"];
  uint64_t v6 = [v4 decodeBoolForKey:@"originRoute"];
  uint64_t v7 = [v4 decodeBoolForKey:@"parsecRoute"];
  BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postBackBaseURL"];

  BOOL v9 = [(DESUploadTransport *)self initWithDediscoRoute:v5 originRoute:v6 parsecRoute:v7 postBackBaseURL:v8];
  return v9;
}

- (BOOL)originRoute
{
  return self->_originRoute;
}

- (BOOL)parsecRoute
{
  return self->_parsecRoute;
}

- (BOOL)dediscoRoute
{
  return self->_dediscoRoute;
}

- (NSURL)postBackBaseURL
{
  return self->_postBackBaseURL;
}

- (void).cxx_destruct
{
}

@end