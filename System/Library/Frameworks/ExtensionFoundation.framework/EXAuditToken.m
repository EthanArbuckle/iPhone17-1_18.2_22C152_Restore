@interface EXAuditToken
+ ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForCurrentProcess;
+ (BOOL)auditToken:(id *)a3 hasRequiredEntitlements:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)auditToken:(id *)a3 entitlementValue:(id)a4 ofClass:(Class)a5;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (EXAuditToken)initWithAuditToken:(id *)a3;
- (EXAuditToken)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EXAuditToken

+ ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForCurrentProcess
{
  if (_EXAuditTokenForCurrentProcess_once != -1) {
    dispatch_once(&_EXAuditTokenForCurrentProcess_once, &__block_literal_global_6);
  }
  long long v4 = *(_OWORD *)(_EXAuditTokenForCurrentProcess_result + 16);
  *(_OWORD *)retstr->var0 = *(_OWORD *)_EXAuditTokenForCurrentProcess_result;
  *(_OWORD *)&retstr->var0[4] = v4;
  return result;
}

+ (BOOL)auditToken:(id *)a3 hasRequiredEntitlements:(id)a4 error:(id *)a5
{
  return _EXAuditTokenHasRequiredEntitlements(a3, a4, a5);
}

+ (id)auditToken:(id *)a3 entitlementValue:(id)a4 ofClass:(Class)a5
{
  return _EXAuditTokenGetEntitlementValue((uint64_t)a3, a4);
}

- (EXAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EXAuditToken;
  result = [(EXAuditToken *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (EXAuditToken)initWithCoder:(id)a3
{
  uint64_t v9 = 0;
  long long v4 = (_OWORD *)[a3 decodeBytesForKey:@"auditToken" returnedLength:&v9];
  long long v5 = 0;
  if (v4 && v9 == 32)
  {
    long long v6 = v4[1];
    v8[0] = *v4;
    v8[1] = v6;
    self = [(EXAuditToken *)self initWithAuditToken:v8];
    long long v5 = self;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v5;
  return (id)[v4 initWithAuditToken:v7];
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (EXAuditToken *)a3;
  if (v4) {
    BOOL v8 = self == v4
  }
      || *(void *)self->_auditToken.val == *(void *)v4->_auditToken.val
      && *(void *)&self->_auditToken.val[2] == *(void *)&v4->_auditToken.val[2]
      && *(void *)&self->_auditToken.val[4] == *(void *)&v4->_auditToken.val[4]
      && *(void *)&self->_auditToken.val[6] == *(void *)&v4->_auditToken.val[6];
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  long long v3 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v7.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v7.val[4] = v3;
  int v4 = audit_token_to_pidversion(&v7);
  long long v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v7.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v7.val[4] = v5;
  return audit_token_to_pid(&v7) ^ v4;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

@end