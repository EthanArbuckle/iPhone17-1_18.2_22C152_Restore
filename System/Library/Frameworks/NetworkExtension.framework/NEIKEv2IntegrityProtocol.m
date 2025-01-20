@interface NEIKEv2IntegrityProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2IntegrityProtocol)initWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)digestLength;
- (uint64_t)keyLength;
- (unint64_t)type;
@end

@implementation NEIKEv2IntegrityProtocol

- (unint64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEIKEv2IntegrityProtocol allocWithZone:a3];
  unint64_t v5 = [(NEIKEv2IntegrityProtocol *)self type];

  return [(NEIKEv2IntegrityProtocol *)v4 initWithType:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2IntegrityProtocol *)self type];
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
  unint64_t v3 = [(NEIKEv2IntegrityProtocol *)self type];
  if (v3 >= 0xF) {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%llu]", -[NEIKEv2IntegrityProtocol type](self, "type"));
  }
  else {
    id v4 = off_1E5990330[v3];
  }

  return v4;
}

- (NEIKEv2IntegrityProtocol)initWithType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2IntegrityProtocol;
  id v4 = [(NEIKEv2IntegrityProtocol *)&v10 init];
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

- (uint64_t)digestLength
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    unint64_t v2 = [(id)result type] - 1;
    if (v2 < 0xE && ((0x3863u >> v2) & 1) != 0)
    {
      return dword_19DF9D074[v2];
    }
    else
    {
      unint64_t v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4[0] = 67109120;
        v4[1] = [v1 type];
        _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "Unknown Integrity type %u", (uint8_t *)v4, 8u);
      }

      return 20;
    }
  }
  return result;
}

- (uint64_t)keyLength
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    unint64_t v2 = [(id)result type] - 1;
    if (v2 < 0xE && ((0x3863u >> v2) & 1) != 0)
    {
      return dword_19DF9D0AC[v2];
    }
    else
    {
      unint64_t v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4[0] = 67109120;
        v4[1] = [v1 type];
        _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "Unknown Integrity type %u", (uint8_t *)v4, 8u);
      }

      return 20;
    }
  }
  return result;
}

@end