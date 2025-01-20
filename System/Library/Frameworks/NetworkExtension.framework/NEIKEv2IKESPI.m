@interface NEIKEv2IKESPI
- (BOOL)isEqual:(id)a3;
- (NEIKEv2IKESPI)init;
- (NEIKEv2IKESPI)initWithValue:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)value;
@end

@implementation NEIKEv2IKESPI

- (unint64_t)value
{
  return self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEIKEv2IKESPI allocWithZone:a3];
  unint64_t v5 = [(NEIKEv2IKESPI *)self value];

  return [(NEIKEv2IKESPI *)v4 initWithValue:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2IKESPI *)self value];
    uint64_t v7 = [v5 value];

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
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%016llX", bswap64(-[NEIKEv2IKESPI value](self, "value")));

  return v2;
}

- (NEIKEv2IKESPI)init
{
  uint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  return [(NEIKEv2IKESPI *)self initWithValue:__buf];
}

- (NEIKEv2IKESPI)initWithValue:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2IKESPI;
  id v4 = [(NEIKEv2SPI *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_value = a3;
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