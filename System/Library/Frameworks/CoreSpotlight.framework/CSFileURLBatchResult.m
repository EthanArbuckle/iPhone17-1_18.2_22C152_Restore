@interface CSFileURLBatchResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSFileURLBatchResult)initWithCoder:(id)a3;
- (CSFileURLBatchResult)initWithFileURL:(id)a3 andError:(id)a4;
- (NSError)error;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSFileURLBatchResult

- (CSFileURLBatchResult)initWithFileURL:(id)a3 andError:(id)a4
{
  v6 = (NSURL *)a3;
  v7 = (NSError *)a4;
  url = self->_url;
  self->_url = v6;
  v9 = v6;

  error = self->_error;
  self->_error = v7;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v6 = a3;
  v5 = +[CSCoder encodeURLPreservingSecurityScope:url];
  [v6 encodeObject:v5 forKey:@"urlDataKey"];

  [v6 encodeObject:self->_error forKey:@"errorKey"];
}

- (CSFileURLBatchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSFileURLBatchResult;
  v5 = [(CSFileURLBatchResult *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"urlDataKey"];
    uint64_t v7 = +[CSDecoder decodeURLPreservingSecurityScope:v6];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"errorKey"];
    error = v5->_error;
    v5->_error = (NSError *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSFileURLBatchResult alloc];
  url = self->_url;
  error = self->_error;

  return [(CSFileURLBatchResult *)v4 initWithFileURL:url andError:error];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    url = self->_url;
    uint64_t v7 = [v5 url];
    if ([(NSURL *)url isEqual:v7])
    {
      error = self->_error;
      uint64_t v9 = [v5 error];
      char v10 = [(NSError *)error isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end