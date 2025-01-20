@interface _CGFontCacheKey
- (BOOL)isEqual:(id)a3;
- (NSURL)url;
- (double)opticalSize;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _CGFontCacheKey

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    uint64_t v20 = v9;
    uint64_t v21 = v5;
    uint64_t v22 = v4;
    uint64_t v23 = v3;
    if (a3
      && (uint64_t v13 = objc_opt_class(), v13 == objc_opt_class())
      && (unint64_t hash = self->_hash, hash == [a3 hash]))
    {
      url = self->_url;
      if (url == (NSURL *)[a3 url]
        || (int v16 = -[NSURL isEqual:](self->_url, "isEqual:", [a3 url])) != 0)
      {
        double opticalSize = self->_opticalSize;
        objc_msgSend(a3, "opticalSize", v10, v20, v6, v21, v22, v23, v7, v8);
        LOBYTE(v16) = opticalSize == v18;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSURL)url
{
  return self->_url;
}

- (double)opticalSize
{
  return self->_opticalSize;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CGFontCacheKey;
  [(_CGFontCacheKey *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@/%g", self->_url, *(void *)&self->_opticalSize];
}

@end