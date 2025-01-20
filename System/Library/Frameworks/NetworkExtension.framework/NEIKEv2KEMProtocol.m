@interface NEIKEv2KEMProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2KEMProtocol)initWithMethod:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)method;
@end

@implementation NEIKEv2KEMProtocol

- (unint64_t)method
{
  return self->_method;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEIKEv2KEMProtocol allocWithZone:a3];
  unint64_t v5 = [(NEIKEv2KEMProtocol *)self method];

  return [(NEIKEv2KEMProtocol *)v4 initWithMethod:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2KEMProtocol *)self method];
    uint64_t v7 = [v5 method];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = [(NEIKEv2KEMProtocol *)self method];
  if (v3 < 0x26 && ((0x31803FC027uLL >> v3) & 1) != 0) {
    id v4 = off_1E59903A8[v3];
  }
  else {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%llu]", -[NEIKEv2KEMProtocol method](self, "method"));
  }

  return v4;
}

- (NEIKEv2KEMProtocol)initWithMethod:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2KEMProtocol;
  id v4 = [(NEIKEv2KEMProtocol *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_method = a3;
    unint64_t v6 = v4;
  }
  else
  {
    BOOL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }
  return v5;
}

@end