@interface _GKURLRequestDictionaryKey
+ (id)keyWithRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSURLRequest)request;
- (_GKURLRequestDictionaryKey)initWithRequest:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setRequest:(id)a3;
@end

@implementation _GKURLRequestDictionaryKey

- (_GKURLRequestDictionaryKey)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GKURLRequestDictionaryKey;
  v5 = [(_GKURLRequestDictionaryKey *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    request = v5->_request;
    v5->_request = (NSURLRequest *)v6;
  }
  return v5;
}

+ (id)keyWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRequest:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(NSURLRequest *)self->_request URL];
  v7 = [v6 absoluteString];
  v8 = [v3 stringWithFormat:@"<%@ %p> %@ %@", v4, self, v5, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 request];
    uint64_t v6 = [v5 URL];
    v7 = [(NSURLRequest *)self->_request URL];
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      objc_super v9 = [(NSURLRequest *)self->_request HTTPMethod];
      v10 = [(NSURLRequest *)self->_request HTTPMethod];
      if (v9 == v10 || [v9 isEqual:v10])
      {
        v11 = [v5 allHTTPHeaderFields];
        v12 = [(NSURLRequest *)self->_request allHTTPHeaderFields];
        if (v11 == v12 || [v11 isEqual:v12])
        {
          v13 = [v5 HTTPBody];
          v14 = [(NSURLRequest *)self->_request HTTPBody];
          BOOL v15 = v13 == v14 || [v13 isEqual:v14];
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(NSURLRequest *)self->_request URL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end