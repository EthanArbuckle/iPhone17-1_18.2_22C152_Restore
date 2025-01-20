@interface BLNotificationMessage
- (BLNotificationMessage)initWithUserInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessage:(id)a3;
- (NSDictionary)userInfo;
- (NSNumber)accountID;
- (NSURL)actionURL;
- (id)description;
- (id)valueForUserInfoKey:(id)a3;
- (int64_t)_integerValueForKey:(id)a3 defaultValue:(int64_t)a4;
- (int64_t)actionType;
- (unint64_t)hash;
@end

@implementation BLNotificationMessage

- (BLNotificationMessage)initWithUserInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLNotificationMessage;
  v5 = [(BLNotificationMessage *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    userInfo = v5->_userInfo;
    v5->_userInfo = v6;
  }
  return v5;
}

- (NSNumber)accountID
{
  int64_t v2 = [(BLNotificationMessage *)self _integerValueForKey:@"0" defaultValue:0x7FFFFFFFFFFFFFFFLL];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[NSNumber numberWithInteger:v2];
  }

  return (NSNumber *)v3;
}

- (int64_t)actionType
{
  return [(BLNotificationMessage *)self _integerValueForKey:@"1" defaultValue:-1];
}

- (NSURL)actionURL
{
  objc_opt_class();
  v3 = [(BLNotificationMessage *)self valueForUserInfoKey:@"3"];
  id v4 = BUDynamicCast();

  if ([v4 length])
  {
    v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (BOOL)isEqualToMessage:(id)a3
{
  id v4 = a3;
  v5 = [(BLNotificationMessage *)self userInfo];
  v6 = [v4 userInfo];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (id)valueForUserInfoKey:(id)a3
{
  id v4 = a3;
  v5 = [(BLNotificationMessage *)self userInfo];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLNotificationMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BLNotificationMessage *)self isEqualToMessage:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v2 = [(BLNotificationMessage *)self userInfo];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  int64_t v2 = [(BLNotificationMessage *)self userInfo];
  id v3 = [v2 mutableCopy];

  id v4 = [v3 objectForKeyedSubscript:@"0"];
  if (v4)
  {
    BOOL v5 = AMSHashIfNeeded();
    [v3 setObject:v5 forKeyedSubscript:@"0"];
  }
  if (!+[NSJSONSerialization isValidJSONObject:v3]
    || (+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 0, 0), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)|| (v7 = (void *)v6, v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4], v7, !v8))
  {
    id v8 = [v3 description];
  }

  return v8;
}

- (int64_t)_integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  BOOL v5 = [(BLNotificationMessage *)self valueForUserInfoKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = (int64_t)[v5 integerValue];
  }

  return a4;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end