@interface NEIKEv2PRFProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2PRFProtocol)initWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)length;
- (unint64_t)type;
- (unsigned)nonceSize;
- (void)ccDigest;
@end

@implementation NEIKEv2PRFProtocol

- (unint64_t)type
{
  return self->_type;
}

- (unsigned)nonceSize
{
  unint64_t v2 = [(NEIKEv2PRFProtocol *)self type];
  if (v2 == 7) {
    unsigned int v3 = 32;
  }
  else {
    unsigned int v3 = 16;
  }
  if (v2 == 6) {
    return 24;
  }
  else {
    return v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(NEIKEv2PRFProtocol *)self type];

  return (id)[v4 initWithType:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2PRFProtocol *)self type];
    uint64_t v7 = [v5 type];

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
  unint64_t v3 = [(NEIKEv2PRFProtocol *)self type];
  if (v3 >= 9) {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%llu]", -[NEIKEv2PRFProtocol type](self, "type"));
  }
  else {
    id v4 = off_1E59902E8[v3];
  }

  return v4;
}

- (NEIKEv2PRFProtocol)initWithType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2PRFProtocol;
  id v4 = [(NEIKEv2PRFProtocol *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_type = a3;
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

- (uint64_t)length
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    unint64_t v2 = [(id)result type] - 1;
    if (v2 < 7 && ((0x73u >> v2) & 1) != 0)
    {
      return dword_19DF9D020[v2];
    }
    else
    {
      unint64_t v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4[0] = 67109120;
        v4[1] = [v1 type];
        _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "Unknown PRF type %u", (uint8_t *)v4, 8u);
      }

      return 20;
    }
  }
  return result;
}

- (void)ccDigest
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    unint64_t v2 = [result type] - 1;
    if (v2 < 7 && ((0x73u >> v2) & 1) != 0)
    {
      return (void *)dword_19DF9D03C[v2];
    }
    else
    {
      unint64_t v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4[0] = 67109120;
        v4[1] = [v1 type];
        _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "Unknown PRF type %u", (uint8_t *)v4, 8u);
      }

      return 0;
    }
  }
  return result;
}

@end