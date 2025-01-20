@interface MLRSandboxExtensionRequest
- (BOOL)requireWrite;
- (MLRSandboxExtensionRequest)initWithURLs:(id)a3 requireWrite:(BOOL)a4;
- (NSArray)URLs;
- (id)description;
@end

@implementation MLRSandboxExtensionRequest

- (MLRSandboxExtensionRequest)initWithURLs:(id)a3 requireWrite:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLRSandboxExtensionRequest;
  v8 = [(MLRSandboxExtensionRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URLs, a3);
    v9->_requireWrite = a4;
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@(%@, %d)", objc_opt_class(), self->_URLs, self->_requireWrite];
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (BOOL)requireWrite
{
  return self->_requireWrite;
}

- (void).cxx_destruct
{
}

@end