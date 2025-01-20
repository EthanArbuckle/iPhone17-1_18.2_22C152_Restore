@interface CMSContentFailure
- (CMSContentFailure)initWithError:(id)a3;
- (CMSContentFailure)initWithError:(id)a3 url:(id)a4;
- (CMSContentFailure)initWithServiceError:(id)a3 url:(id)a4;
- (NSError)error;
- (NSURL)URL;
- (id)cmsCoded;
- (void)setError:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CMSContentFailure

- (CMSContentFailure)initWithError:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSContentFailure;
  v8 = [(CMSContentFailure *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URL, a4);
    uint64_t v10 = +[CMSServiceError serviceErrorFromCause:v6];
    if (!v10)
    {
      v12 = 0;
      goto LABEL_6;
    }
    error = v9->_error;
    v9->_error = (NSError *)v10;
  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (CMSContentFailure)initWithError:(id)a3
{
  return [(CMSContentFailure *)self initWithError:a3 url:0];
}

- (CMSContentFailure)initWithServiceError:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSContentFailure;
  v9 = [(CMSContentFailure *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v7 domain];
    int v11 = [v10 isEqualToString:@"com.apple.sirikitcloudmedia.errorDomain"];

    if (!v11)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_error, a3);
    objc_storeStrong((id *)&v9->_URL, a4);
  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (id)cmsCoded
{
  v16[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  v4 = [(NSURL *)self->_URL absoluteString];
  [v3 cmsSetOptionalObject:v4 forKey:@"url"];

  v5 = [(NSError *)self->_error domain];
  [v3 cmsSetOptionalObject:v5 forKey:@"errorDomain"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](self->_error, "code"));
  [v3 cmsSetOptionalObject:v6 forKey:@"errorCode"];

  id v7 = [(NSError *)self->_error underlyingErrors];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(NSError *)self->_error underlyingErrors];
    uint64_t v10 = [v9 firstObject];

    v15[0] = @"errorCode";
    int v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
    v15[1] = @"errorDomain";
    v16[0] = v11;
    v12 = [v10 domain];
    v16[1] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    [v3 setObject:v13 forKeyedSubscript:@"underlyingError"];
  }
  return v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end