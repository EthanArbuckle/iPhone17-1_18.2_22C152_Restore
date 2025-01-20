@interface PushMessage
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PushMessage

- (BOOL)isEqual:(id)a3
{
  v4 = (PushMessage *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v6 = 0;
    if (self && (isKindOfClass & 1) != 0) {
      BOOL v6 = [(NSDictionary *)self->_userInfo isEqualToDictionary:v4->_userInfo];
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSDictionary *)self->_userInfo hash];
}

- (id)description
{
  id v3 = [(NSDictionary *)self->_userInfo mutableCopy];
  v4 = [v3 objectForKeyedSubscript:@"0"];
  if (v4)
  {
    v5 = AMSHashIfNeeded();
    [v3 setObject:v5 forKeyedSubscript:@"0"];
  }
  if (!+[NSJSONSerialization isValidJSONObject:v3]
    || (+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 0, 0), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)|| (v7 = (void *)v6, v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4], v7, !v8))
  {
    id v8 = [v3 description];
  }
  v9 = +[NSString stringWithFormat:@"%@: %@", self->_timestamp, v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end