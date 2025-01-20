@interface CalVirtualConferenceJoinMethod
- (BOOL)isBroadcast;
- (BOOL)isEqual:(id)a3;
- (CalVirtualConferenceJoinMethod)initWithTitle:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5;
- (NSString)title;
- (NSURL)URL;
- (id)description;
@end

@implementation CalVirtualConferenceJoinMethod

- (CalVirtualConferenceJoinMethod)initWithTitle:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalVirtualConferenceJoinMethod;
  v11 = [(CalVirtualConferenceJoinMethod *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_URL, a4);
    v12->_isBroadcast = a5;
  }

  return v12;
}

- (id)description
{
  v3 = [CalDescriptionBuilder alloc];
  v8.receiver = self;
  v8.super_class = (Class)CalVirtualConferenceJoinMethod;
  v4 = [(CalVirtualConferenceJoinMethod *)&v8 description];
  v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  [(CalDescriptionBuilder *)v5 setKey:@"title" withString:self->_title];
  [(CalDescriptionBuilder *)v5 setKey:@"URL" withObject:self->_URL];
  [(CalDescriptionBuilder *)v5 setKey:@"isBroadcast" withBoolean:self->_isBroadcast];
  v6 = [(CalDescriptionBuilder *)v5 build];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CalVirtualConferenceJoinMethod *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      title = self->_title;
      v7 = [(CalVirtualConferenceJoinMethod *)v5 title];
      if (CalEqualStrings(title, v7))
      {
        URL = self->_URL;
        id v9 = [(CalVirtualConferenceJoinMethod *)v5 URL];
        if (CalEqualObjects(URL, v9))
        {
          BOOL isBroadcast = self->_isBroadcast;
          BOOL v11 = isBroadcast == [(CalVirtualConferenceJoinMethod *)v5 isBroadcast];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)isBroadcast
{
  return self->_isBroadcast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end