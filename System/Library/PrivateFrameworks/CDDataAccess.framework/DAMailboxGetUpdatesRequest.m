@interface DAMailboxGetUpdatesRequest
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initRequestForBodyFormat:(int)a3 withBodySizeLimit:(int)a4;
- (int)maxSize;
- (unint64_t)hash;
- (void)setMaxSize:(int)a3;
@end

@implementation DAMailboxGetUpdatesRequest

- (id)initRequestForBodyFormat:(int)a3 withBodySizeLimit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)DAMailboxGetUpdatesRequest;
  v6 = [(DAMailboxRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(DAMailboxRequest *)v6 setRequestType:1];
    [(DAMailboxGetUpdatesRequest *)v7 setMaxSize:v4];
    [(DAMailboxRequest *)v7 setBodyFormat:v5];
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d\n%d", -[DAMailboxGetUpdatesRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 maxSize];
    if (v6 == [(DAMailboxGetUpdatesRequest *)self maxSize])
    {
      int v7 = [v5 bodyFormat];
      BOOL v8 = v7 == [(DAMailboxRequest *)self bodyFormat];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)DAMailboxGetUpdatesRequest;
  id v4 = [(DAMailboxGetUpdatesRequest *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ maxSize %d, bodyFormat %d", v4, -[DAMailboxGetUpdatesRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat")];

  return v5;
}

- (int)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int)a3
{
  self->_maxSize = a3;
}

@end