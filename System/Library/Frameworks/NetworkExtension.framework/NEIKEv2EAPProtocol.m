@interface NEIKEv2EAPProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2EAPProtocol)initWithMethod:(unint64_t)a3;
- (NSDictionary)properties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)method;
- (void)setProperties:(id)a3;
@end

@implementation NEIKEv2EAPProtocol

- (void).cxx_destruct
{
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)method
{
  return self->_method;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[NEIKEv2EAPProtocol allocWithZone:a3] initWithMethod:[(NEIKEv2EAPProtocol *)self method]];
  v5 = [(NEIKEv2EAPProtocol *)self properties];
  v6 = (void *)[v5 copy];
  [(NEIKEv2EAPProtocol *)v4 setProperties:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2EAPProtocol *)self method];
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
  unint64_t v3 = [(NEIKEv2EAPProtocol *)self method];
  if (v3 >= 8) {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%llu]", -[NEIKEv2EAPProtocol method](self, "method"));
  }
  else {
    id v4 = off_1E5990158[v3];
  }

  return v4;
}

- (NEIKEv2EAPProtocol)initWithMethod:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2EAPProtocol;
  id v4 = [(NEIKEv2EAPProtocol *)&v10 init];
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