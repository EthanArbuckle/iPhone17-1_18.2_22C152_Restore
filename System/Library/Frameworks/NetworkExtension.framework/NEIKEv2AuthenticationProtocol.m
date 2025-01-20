@interface NEIKEv2AuthenticationProtocol
- (BOOL)isDigitalSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonStandard;
- (BOOL)isSecurePassword;
- (BOOL)isSignature;
- (NEIKEv2AuthenticationProtocol)initWithDigitalSignature:(unint64_t)a3;
- (NEIKEv2AuthenticationProtocol)initWithMethod:(unint64_t)a3;
- (NEIKEv2AuthenticationProtocol)initWithNonStandardDigitalSignature:(unint64_t)a3;
- (NEIKEv2AuthenticationProtocol)initWithSecurePassword:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)isECDSA;
- (uint64_t)isRSA;
- (unint64_t)digitalSignatureAlgorithm;
- (unint64_t)hash;
- (unint64_t)method;
- (unint64_t)securePasswordMethod;
@end

@implementation NEIKEv2AuthenticationProtocol

- (unint64_t)securePasswordMethod
{
  return self->_securePasswordMethod;
}

- (unint64_t)digitalSignatureAlgorithm
{
  return self->_digitalSignatureAlgorithm;
}

- (unint64_t)method
{
  return self->_method;
}

- (BOOL)isNonStandard
{
  return self->_isNonStandard;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(NEIKEv2AuthenticationProtocol *)self method] == 14)
  {
    BOOL v5 = [(NEIKEv2AuthenticationProtocol *)self isNonStandard];
    v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    unint64_t v7 = [(NEIKEv2AuthenticationProtocol *)self digitalSignatureAlgorithm];
    if (v5)
    {
      return (id)[v6 initWithNonStandardDigitalSignature:v7];
    }
    else
    {
      return (id)[v6 initWithDigitalSignature:v7];
    }
  }
  else
  {
    unint64_t v9 = [(NEIKEv2AuthenticationProtocol *)self method];
    v10 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    if (v9 == 12)
    {
      unint64_t v11 = [(NEIKEv2AuthenticationProtocol *)self securePasswordMethod];
      return (id)[v10 initWithSecurePassword:v11];
    }
    else
    {
      unint64_t v12 = [(NEIKEv2AuthenticationProtocol *)self method];
      return (id)[v10 initWithMethod:v12];
    }
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(NEIKEv2AuthenticationProtocol *)self method];
  unint64_t v4 = v3 + 10000 * [(NEIKEv2AuthenticationProtocol *)self digitalSignatureAlgorithm];
  unint64_t v5 = v4 + 100000 * [(NEIKEv2AuthenticationProtocol *)self securePasswordMethod];
  BOOL v6 = [(NEIKEv2AuthenticationProtocol *)self isNonStandard];
  uint64_t v7 = 100;
  if (!v6) {
    uint64_t v7 = 0;
  }
  return v5 + v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2AuthenticationProtocol *)self method];
    if (v6 == [v5 method]
      && (unint64_t v7 = [(NEIKEv2AuthenticationProtocol *)self digitalSignatureAlgorithm],
          v7 == [v5 digitalSignatureAlgorithm])
      && (unint64_t v8 = [(NEIKEv2AuthenticationProtocol *)self securePasswordMethod],
          v8 == [v5 securePasswordMethod]))
    {
      BOOL v9 = [(NEIKEv2AuthenticationProtocol *)self isNonStandard];
      int v10 = v9 ^ [v5 isNonStandard] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isSecurePassword
{
  return [(NEIKEv2AuthenticationProtocol *)self method] == 12;
}

- (BOOL)isDigitalSignature
{
  return [(NEIKEv2AuthenticationProtocol *)self method] == 14;
}

- (BOOL)isSignature
{
  unint64_t v2 = [(NEIKEv2AuthenticationProtocol *)self method];
  return (v2 > 0xD) | (0xFFAu >> v2) & 1;
}

- (id)description
{
  if ([(NEIKEv2AuthenticationProtocol *)self method] == 14)
  {
    BOOL v3 = [(NEIKEv2AuthenticationProtocol *)self isNonStandard];
    id v4 = [NSString alloc];
    String = NEIKEv2DigitalSignatureAlgorithmCreateString([(NEIKEv2AuthenticationProtocol *)self digitalSignatureAlgorithm]);
    unint64_t v6 = String;
    if (v3) {
      uint64_t v7 = [v4 initWithFormat:@"DigitalSignatureNonStandard%@", String];
    }
    else {
      uint64_t v7 = [v4 initWithFormat:@"DigitalSignature%@", String];
    }
    goto LABEL_7;
  }
  if ([(NEIKEv2AuthenticationProtocol *)self method] == 12)
  {
    id v8 = [NSString alloc];
    unint64_t v6 = NEIKEv2SecurePasswordMethodCreateString([(NEIKEv2AuthenticationProtocol *)self securePasswordMethod]);
    uint64_t v7 = [v8 initWithFormat:@"SecurePassword%@", v6];
LABEL_7:
    BOOL v9 = (__CFString *)v7;

    goto LABEL_9;
  }
  BOOL v9 = NEIKEv2AuthenticationMethodCreateString([(NEIKEv2AuthenticationProtocol *)self method]);
LABEL_9:

  return v9;
}

- (NEIKEv2AuthenticationProtocol)initWithNonStandardDigitalSignature:(unint64_t)a3
{
  if (a3 - 4 >= 0xFFFFFFFFFFFFFFFELL)
  {
    id v4 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:](self, "initWithDigitalSignature:");
    if (v4) {
      v4->_isNonStandard = 1;
    }
    self = v4;
    BOOL v3 = self;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (NEIKEv2AuthenticationProtocol)initWithSecurePassword:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2AuthenticationProtocol;
  id v4 = [(NEIKEv2AuthenticationProtocol *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_method = 12;
    v4->_securePasswordMethod = a3;
    unint64_t v6 = v4;
  }
  else
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }
  return v5;
}

- (NEIKEv2AuthenticationProtocol)initWithDigitalSignature:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2AuthenticationProtocol;
  id v4 = [(NEIKEv2AuthenticationProtocol *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_method = 14;
    v4->_digitalSignatureAlgorithm = a3;
    unint64_t v6 = v4;
  }
  else
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }
  return v5;
}

- (NEIKEv2AuthenticationProtocol)initWithMethod:(unint64_t)a3
{
  p_super = &self->super;
  if (a3 == 14)
  {
    unint64_t v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "Cannot [NEIKEv2AuthenticationProtocol initWithMethod:DigitalSignature], use initWithDigitalSignature instead";
LABEL_13:
    _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, v7, buf, 2u);
    goto LABEL_8;
  }
  if (a3 == 12)
  {
    unint64_t v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "Cannot [NEIKEv2AuthenticationProtocol initWithMethod:GenericSecurePassword], use initWithSecurePassword instead";
    goto LABEL_13;
  }
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2AuthenticationProtocol;
  result = [(NEIKEv2AuthenticationProtocol *)&v8 init];
  if (result)
  {
    result->_method = a3;
    return result;
  }
  p_super = ne_log_obj();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
  }
LABEL_11:

  return 0;
}

- (uint64_t)isRSA
{
  if (result)
  {
    v1 = (void *)result;
    result = [(id)result method];
    if (result != 1)
    {
      if (result == 14)
      {
        unint64_t v2 = [v1 digitalSignatureAlgorithm];
        if (v2 <= 6 && ((1 << v2) & 0x62) != 0) {
          return 1;
        }
      }
      uint64_t v3 = [v1 method];
      if (v3 == 245) {
        return 1;
      }
      else {
        return v3 == 14 && (unint64_t)([v1 digitalSignatureAlgorithm] - 9) < 3;
      }
    }
  }
  return result;
}

- (uint64_t)isECDSA
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = [(id)result method];
    if ((unint64_t)(v2 - 9) >= 3)
    {
      if (v2 == 14)
      {
        unint64_t v3 = [v1 digitalSignatureAlgorithm];
        if (v3 >= 9) {
          return 0;
        }
        else {
          return (0x184u >> v3) & 1;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end