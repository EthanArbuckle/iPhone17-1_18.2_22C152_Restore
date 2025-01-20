@interface NEIKEv2EncryptionProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2EncryptionProtocol)initWithEncryptionType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initWithEncryptionWireType:(char)a3 is256Bit:;
- (uint64_t)blockLength;
- (uint64_t)ivLength;
- (uint64_t)keyLength;
- (unint64_t)hash;
@end

@implementation NEIKEv2EncryptionProtocol

- (NEIKEv2EncryptionProtocol)initWithEncryptionType:(unint64_t)a3
{
  p_super = &self->super;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v4 = 0;
  char v5 = 0;
  char v6 = 0;
  unint64_t v7 = 11;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_17;
    case 2uLL:
      char v4 = 0;
      char v5 = 0;
      char v6 = 0;
      goto LABEL_8;
    case 3uLL:
      char v5 = 0;
      char v6 = 0;
      char v4 = 1;
LABEL_8:
      unint64_t v7 = 12;
      goto LABEL_17;
    case 4uLL:
      char v4 = 0;
      char v5 = 0;
      char v6 = 0;
      goto LABEL_11;
    case 5uLL:
      char v5 = 0;
      char v6 = 0;
      char v4 = 1;
LABEL_11:
      unint64_t v7 = 20;
      goto LABEL_17;
    case 6uLL:
      char v6 = 0;
      char v4 = 1;
      unint64_t v7 = 28;
      char v5 = 1;
      goto LABEL_17;
    case 7uLL:
      char v5 = 0;
      char v4 = 1;
      unint64_t v7 = 31;
      char v6 = 1;
      goto LABEL_17;
    case 8uLL:
      char v4 = 0;
      char v5 = 0;
      char v6 = 0;
      goto LABEL_16;
    case 9uLL:
      char v5 = 0;
      char v6 = 0;
      char v4 = 1;
LABEL_16:
      unint64_t v7 = 30;
LABEL_17:
      v12.receiver = self;
      v12.super_class = (Class)NEIKEv2EncryptionProtocol;
      result = [(NEIKEv2EncryptionProtocol *)&v12 init];
      if (result)
      {
        result->_wireType = v7;
        result->_is256Bit = v4 | v5 | v6;
      }
      else
      {
        p_super = ne_log_obj();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
        }
LABEL_6:

        return 0;
      }
      return result;
    default:
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        String = NEIKEv2EncryptionTypeCreateString(a3);
        *(_DWORD *)buf = 138412290;
        v14 = String;
        _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "Invalid NEIKEv2EncryptionType %@", buf, 0xCu);
      }
      goto LABEL_6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = +[NEIKEv2EncryptionProtocol allocWithZone:a3];
  if (self)
  {
    unint64_t wireType = self->_wireType;
    char is256Bit = self->_is256Bit;
  }
  else
  {
    unint64_t wireType = 0;
    char is256Bit = 0;
  }

  return -[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v4, wireType, is256Bit);
}

- (id)initWithEncryptionWireType:(char)a3 is256Bit:
{
  if (result)
  {
    v10.receiver = result;
    v10.super_class = (Class)NEIKEv2EncryptionProtocol;
    result = objc_msgSendSuper2(&v10, sel_init);
    if (result)
    {
      *((void *)result + 2) = a2;
      BOOL v6 = a2 == 28 || a2 == 31;
      char v7 = (a3 & 1) != 0 || v6;
      *((unsigned char *)result + 8) = v7;
    }
    else
    {
      v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
      }

      return 0;
    }
  }
  return result;
}

- (unint64_t)hash
{
  if (self)
  {
    if (*(unsigned char *)(self + 8)) {
      return *(void *)(self + 16) + 0x10000;
    }
    else {
      return *(void *)(self + 16);
    }
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = v4;
    if (self)
    {
      if (self->_wireType != v5[2])
      {
        LOBYTE(self) = 0;
        goto LABEL_9;
      }
      BOOL is256Bit = self->_is256Bit;
    }
    else
    {
      BOOL is256Bit = 0;
      if (v5[2]) {
        goto LABEL_9;
      }
    }
    LOBYTE(self) = is256Bit ^ ((v5[1] & 1) == 0);
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(self) = 0;
LABEL_10:

  return (char)self;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    String = NEIKEv2EncryptionWireTypeCreateString(self->_wireType);
    char v5 = "";
    if (self->_is256Bit)
    {
      unint64_t wireType = self->_wireType;
      if (wireType != 31 && wireType != 28) {
        char v5 = "_256";
      }
    }
  }
  else
  {
    char v5 = "";
    String = @"Invalid";
  }
  v8 = (void *)[v3 initWithFormat:@"%@%s", String, v5];

  return v8;
}

- (uint64_t)ivLength
{
  if (result)
  {
    if ((*(void *)(result + 16) | 8) == 0x1C) {
      return 8;
    }
    else {
      return -[NEIKEv2EncryptionProtocol blockLength](result);
    }
  }
  return result;
}

- (uint64_t)blockLength
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 16);
    if (v2 > 19)
    {
      if (v2 == 20 || v2 == 28) {
        return 0;
      }
    }
    else
    {
      if ((unint64_t)(v2 - 2) < 2) {
        return 8;
      }
      if (v2 == 12) {
        return 16;
      }
    }
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      String = NEIKEv2EncryptionWireTypeCreateString(*(void *)(v1 + 16));
      int v6 = 138412290;
      char v7 = String;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "Unknown encryption wire type %@", (uint8_t *)&v6, 0xCu);
    }
    return 8;
  }
  return result;
}

- (uint64_t)keyLength
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 16);
    if (v2 <= 19)
    {
      switch(v2)
      {
        case 2:
          return 8;
        case 3:
          return 24;
        case 12:
          BOOL v3 = (*(unsigned char *)(result + 8) & 1) == 0;
          unsigned int v4 = 32;
          unsigned int v5 = 16;
          goto LABEL_15;
      }
    }
    else
    {
      if (v2 <= 29)
      {
        if (v2 != 20)
        {
          if (v2 != 28) {
            goto LABEL_19;
          }
          return 36;
        }
        goto LABEL_14;
      }
      if (v2 == 30)
      {
LABEL_14:
        BOOL v3 = (*(unsigned char *)(result + 8) & 1) == 0;
        unsigned int v4 = 36;
        unsigned int v5 = 20;
LABEL_15:
        if (v3) {
          return v5;
        }
        else {
          return v4;
        }
      }
      if (v2 == 31) {
        return 36;
      }
    }
LABEL_19:
    int v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      String = NEIKEv2EncryptionWireTypeCreateString(*(void *)(v1 + 16));
      int v8 = 138412290;
      v9 = String;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "Unknown encryption wire type %@", (uint8_t *)&v8, 0xCu);
    }
    return 24;
  }
  return result;
}

@end