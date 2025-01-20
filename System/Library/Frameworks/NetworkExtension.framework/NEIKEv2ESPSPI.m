@interface NEIKEv2ESPSPI
- (BOOL)isEqual:(id)a3;
- (NEIKEv2ESPSPI)initWithValue:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)value;
@end

@implementation NEIKEv2ESPSPI

- (unsigned)value
{
  return self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEIKEv2ESPSPI allocWithZone:a3];
  uint64_t v5 = [(NEIKEv2ESPSPI *)self value];

  return [(NEIKEv2ESPSPI *)v4 initWithValue:v5];
}

- (unint64_t)hash
{
  return [(NEIKEv2ESPSPI *)self value];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unsigned int v6 = [(NEIKEv2ESPSPI *)self value];
    int v7 = [v5 value];

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
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%08X", bswap32(-[NEIKEv2ESPSPI value](self, "value")));

  return v2;
}

- (NEIKEv2ESPSPI)initWithValue:(unsigned int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2ESPSPI;
  id v4 = [(NEIKEv2SPI *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    unsigned int v6 = v4;
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