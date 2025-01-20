@interface DAMailboxFetchMessageRequest
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initRequestForBodyFormat:(int)a3 withMessageID:(id)a4 withBodySizeLimit:(int)a5;
- (int)maxSize;
- (unint64_t)hash;
- (void)setMaxSize:(int)a3;
@end

@implementation DAMailboxFetchMessageRequest

- (id)initRequestForBodyFormat:(int)a3 withMessageID:(id)a4 withBodySizeLimit:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DAMailboxFetchMessageRequest;
  v9 = [(DAMailboxRequest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    [(DAMailboxRequest *)v9 setRequestType:3];
    v11 = (void *)[v8 copy];
    [(DAMailboxRequest *)v10 setMessageID:v11];

    [(DAMailboxRequest *)v10 setBodyFormat:v6];
    [(DAMailboxFetchMessageRequest *)v10 setMaxSize:v5];
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [NSString alloc];
  v4 = [(DAMailboxRequest *)self messageID];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@\n%d\n%d", v4, -[DAMailboxFetchMessageRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat")];

  unint64_t v6 = [v5 hash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(DAMailboxRequest *)self messageID];
    v9 = [v7 messageID];
    if (v8 == v9
      || ([(DAMailboxRequest *)self messageID],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v7 messageID],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int v11 = [v7 maxSize];
      if (v11 == [(DAMailboxFetchMessageRequest *)self maxSize])
      {
        int v12 = [v7 bodyFormat];
        BOOL v10 = v12 == [(DAMailboxRequest *)self bodyFormat];
      }
      else
      {
        BOOL v10 = 0;
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxFetchMessageRequest;
  v4 = [(DAMailboxFetchMessageRequest *)&v8 description];
  uint64_t v5 = [(DAMailboxRequest *)self messageID];
  id v6 = [v3 stringWithFormat:@"%@ messageID \"%@\", maxSize %d, bodyFormat %d", v4, v5, -[DAMailboxFetchMessageRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat")];

  return v6;
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