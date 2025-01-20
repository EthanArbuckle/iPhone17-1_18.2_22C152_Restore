@interface CATInitializingIDSServiceConnectionContentInvite
+ (id)instanceWithDictionary:(id)a3;
- (CATInitializingIDSServiceConnectionContentInvite)init;
- (CATInitializingIDSServiceConnectionContentInvite)initWithUserInfo:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSDictionary)userInfo;
- (int64_t)contentType;
@end

@implementation CATInitializingIDSServiceConnectionContentInvite

- (CATInitializingIDSServiceConnectionContentInvite)init
{
  return [(CATInitializingIDSServiceConnectionContentInvite *)self initWithUserInfo:0];
}

- (CATInitializingIDSServiceConnectionContentInvite)initWithUserInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATInitializingIDSServiceConnectionContentInvite;
  v5 = [(CATInitializingIDSServiceConnectionContentInvite *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v6;
  }
  return v5;
}

- (int64_t)contentType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = [(CATInitializingIDSServiceConnectionContentInvite *)self userInfo];
  v5 = (void *)[v4 copy];
  [v3 setObject:v5 forKeyedSubscript:@"UserInfo"];

  uint64_t v6 = (void *)[v3 copy];

  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"UserInfo"];
  v5 = (void *)[objc_alloc((Class)a1) initWithUserInfo:v4];

  return v5;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end