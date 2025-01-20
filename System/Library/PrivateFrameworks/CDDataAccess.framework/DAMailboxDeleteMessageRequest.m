@interface DAMailboxDeleteMessageRequest
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initRequestWithMessageID:(id)a3;
- (unint64_t)hash;
@end

@implementation DAMailboxDeleteMessageRequest

- (id)initRequestWithMessageID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAMailboxDeleteMessageRequest;
  v5 = [(DAMailboxRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(DAMailboxRequest *)v5 setRequestType:2];
    v7 = (void *)[v4 copy];
    [(DAMailboxRequest *)v6 setMessageID:v7];
  }
  return v6;
}

- (unint64_t)hash
{
  v2 = [(DAMailboxRequest *)self messageID];
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
    v6 = [(DAMailboxRequest *)self messageID];
    v7 = [v5 messageID];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(DAMailboxRequest *)self messageID];
      objc_super v9 = [v5 messageID];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxDeleteMessageRequest;
  id v4 = [(DAMailboxDeleteMessageRequest *)&v8 description];
  id v5 = [(DAMailboxRequest *)self messageID];
  v6 = [v3 stringWithFormat:@"%@ messageID \"%@\"", v4, v5];

  return v6;
}

@end