@interface PushRawMessage
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PushRawMessage

- (BOOL)isEqual:(id)a3
{
  v4 = (PushRawMessage *)a3;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self)
      {
        if (self->_topic == v5->_topic
          && ((timestamp = self->_timestamp, timestamp == v6->_timestamp)
           || -[NSDate isEqual:](timestamp, "isEqual:")))
        {
          userInfo = self->_userInfo;
          if (userInfo == v6->_userInfo) {
            LOBYTE(self) = 1;
          }
          else {
            LOBYTE(self) = -[NSDictionary isEqual:](userInfo, "isEqual:");
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSDictionary *)self->_userInfo hash];
}

- (id)description
{
  id v3 = [(NSDictionary *)self->_userInfo mutableCopy];
  if (!+[NSJSONSerialization isValidJSONObject:v3]
    || (+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 0, 0), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0)|| (v5 = (void *)v4, v6 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4], v5, !v6))
  {
    id v6 = [v3 description];
  }
  unint64_t v7 = self->_topic - 1;
  if (v7 > 2) {
    CFStringRef v8 = @"Invalid";
  }
  else {
    CFStringRef v8 = off_100529DC8[v7];
  }
  v9 = +[NSString stringWithFormat:@"(%@) %@: %@", v8, self->_timestamp, v6];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end