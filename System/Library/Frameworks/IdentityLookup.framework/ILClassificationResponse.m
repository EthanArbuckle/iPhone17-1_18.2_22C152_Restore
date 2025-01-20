@interface ILClassificationResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (ILClassificationAction)action;
- (ILClassificationResponse)initWithClassificationAction:(ILClassificationAction)action;
- (ILClassificationResponse)initWithCoder:(id)a3;
- (NSDictionary)userInfo;
- (NSString)userString;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setUserString:(NSString *)userString;
@end

@implementation ILClassificationResponse

- (ILClassificationResponse)initWithClassificationAction:(ILClassificationAction)action
{
  v5.receiver = self;
  v5.super_class = (Class)ILClassificationResponse;
  result = [(ILClassificationResponse *)&v5 init];
  if (result) {
    result->_action = action;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  ILClassificationAction v5 = [(ILClassificationResponse *)self action];
  v6 = [(ILClassificationResponse *)self userInfo];
  v7 = [(ILClassificationResponse *)self userString];
  v8 = [v3 stringWithFormat:@"<%@ %p action=%ld, userInfo=%@, userString=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILClassificationResponse *)self isEqualToResponse:v4];

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  ILClassificationAction v5 = [(ILClassificationResponse *)self action];
  if (v5 == [v4 action])
  {
    uint64_t v6 = [(ILClassificationResponse *)self userInfo];
    uint64_t v7 = [v4 userInfo];
    if (v6 | v7 && ![(id)v6 isEqual:v7])
    {
      char v10 = 0;
    }
    else
    {
      uint64_t v8 = [(ILClassificationResponse *)self userString];
      uint64_t v9 = [v4 userString];
      if (v8 | v9) {
        char v10 = [(id)v8 isEqual:v9];
      }
      else {
        char v10 = 1;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  ILClassificationAction v3 = [(ILClassificationResponse *)self action];
  id v4 = [(ILClassificationResponse *)self userInfo];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(ILClassificationResponse *)self userString];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILClassificationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_action);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  unint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = NSStringFromSelector(sel_userInfo);
  v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];

  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(sel_userString);
  v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

  v18 = [(ILClassificationResponse *)self initWithClassificationAction:v6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userInfo, v14);
    objc_storeStrong((id *)&v19->_userString, v17);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ILClassificationAction v5 = [(ILClassificationResponse *)self action];
  uint64_t v6 = NSStringFromSelector(sel_action);
  [v4 encodeInteger:v5 forKey:v6];

  unint64_t v7 = [(ILClassificationResponse *)self userInfo];
  uint64_t v8 = NSStringFromSelector(sel_userInfo);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(ILClassificationResponse *)self userString];
  uint64_t v9 = NSStringFromSelector(sel_userString);
  [v4 encodeObject:v10 forKey:v9];
}

- (ILClassificationAction)action
{
  return self->_action;
}

- (NSString)userString
{
  return self->_userString;
}

- (void)setUserString:(NSString *)userString
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_userString, 0);
}

@end