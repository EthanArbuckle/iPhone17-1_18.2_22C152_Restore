@interface ILMessageFilterQueryResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQueryResponse:(id)a3;
- (ILMessageFilterAction)action;
- (ILMessageFilterQueryResponse)init;
- (ILMessageFilterQueryResponse)initWithCoder:(id)a3;
- (ILMessageFilterSubAction)subAction;
- (NSString)version;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(ILMessageFilterAction)action;
- (void)setSubAction:(ILMessageFilterSubAction)subAction;
- (void)setVersion:(id)a3;
@end

@implementation ILMessageFilterQueryResponse

- (ILMessageFilterQueryResponse)init
{
  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  ILMessageFilterAction v5 = [(ILMessageFilterQueryResponse *)self action];
  ILMessageFilterSubAction v6 = [(ILMessageFilterQueryResponse *)self subAction];
  v7 = [(ILMessageFilterQueryResponse *)self version];
  v8 = [v3 stringWithFormat:@"<%@ %p action=%ld subAction=%ld version=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILMessageFilterQueryResponse *)self isEqualToQueryResponse:v4];

  return v5;
}

- (BOOL)isEqualToQueryResponse:(id)a3
{
  id v4 = a3;
  ILMessageFilterAction v5 = [(ILMessageFilterQueryResponse *)self action];
  if (v5 == [v4 action]
    && (ILMessageFilterSubAction v6 = -[ILMessageFilterQueryResponse subAction](self, "subAction"), v6 == [v4 subAction]))
  {
    uint64_t v7 = [(ILMessageFilterQueryResponse *)self version];
    uint64_t v8 = [v4 version];
    char v9 = (v7 | v8) == 0;
    if (v8) {
      char v9 = [(id)v7 isEqualToString:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  ILMessageFilterAction v3 = [(ILMessageFilterQueryResponse *)self action];
  uint64_t v4 = [(ILMessageFilterQueryResponse *)self subAction] ^ v3;
  ILMessageFilterAction v5 = [(ILMessageFilterQueryResponse *)self version];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterQueryResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  ILMessageFilterAction v5 = [(ILMessageFilterQueryResponse *)self init];
  if (v5)
  {
    unint64_t v6 = NSStringFromSelector(sel_action);
    v5->_action = [v4 decodeIntegerForKey:v6];

    uint64_t v7 = NSStringFromSelector(sel_subAction);
    v5->_subAction = [v4 decodeIntegerForKey:v7];

    uint64_t v8 = objc_opt_class();
    char v9 = NSStringFromSelector(sel_version);
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
    version = v5->_version;
    v5->_version = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ILMessageFilterAction v5 = [(ILMessageFilterQueryResponse *)self action];
  unint64_t v6 = NSStringFromSelector(sel_action);
  [v4 encodeInteger:v5 forKey:v6];

  ILMessageFilterSubAction v7 = [(ILMessageFilterQueryResponse *)self subAction];
  uint64_t v8 = NSStringFromSelector(sel_subAction);
  [v4 encodeInteger:v7 forKey:v8];

  id v10 = [(ILMessageFilterQueryResponse *)self version];
  char v9 = NSStringFromSelector(sel_version);
  [v4 encodeObject:v10 forKey:v9];
}

- (ILMessageFilterAction)action
{
  return self->_action;
}

- (void)setAction:(ILMessageFilterAction)action
{
  self->_action = action;
}

- (ILMessageFilterSubAction)subAction
{
  return self->_subAction;
}

- (void)setSubAction:(ILMessageFilterSubAction)subAction
{
  self->_subAction = subAction;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end