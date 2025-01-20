@interface EKVirtualConferenceJoinMethod
- (BOOL)isBroadcast;
- (BOOL)isEqual:(id)a3;
- (EKVirtualConferenceJoinMethod)initWithTitle:(id)a3 url:(id)a4;
- (NSString)title;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIsBroadcast:(BOOL)a3;
- (void)setURL:(id)a3;
@end

@implementation EKVirtualConferenceJoinMethod

- (EKVirtualConferenceJoinMethod)initWithTitle:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKVirtualConferenceJoinMethod;
  v8 = [(EKVirtualConferenceJoinMethod *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_URL, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTitle:self->_title url:self->_URL];
  [v4 setIsBroadcast:self->_isBroadcast];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EKVirtualConferenceJoinMethod *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(EKVirtualConferenceJoinMethod *)v5 isBroadcast];
      BOOL v7 = [(EKVirtualConferenceJoinMethod *)self isBroadcast];
      v8 = [(EKVirtualConferenceJoinMethod *)v5 title];
      uint64_t v9 = [(EKVirtualConferenceJoinMethod *)self title];
      if (CalEqualStrings())
      {
        int v10 = v6 ^ v7 ^ 1;
        v11 = [(EKVirtualConferenceJoinMethod *)v5 URL];
        objc_super v12 = [(EKVirtualConferenceJoinMethod *)self URL];
        int v13 = CalEqualObjects() & v10;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (id)description
{
  v2 = NSString;
  title = self->_title;
  URL = self->_URL;
  v5 = [NSNumber numberWithBool:self->_isBroadcast];
  BOOL v6 = [v2 stringWithFormat:@"EKVirtualConferenceJoinMethod title: %@, url: %@, isBroadcast: %@", title, URL, v5];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)isBroadcast
{
  return self->_isBroadcast;
}

- (void)setIsBroadcast:(BOOL)a3
{
  self->_isBroadcast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end