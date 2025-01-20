@interface _HKXPCAuditToken
+ (id)auditTokenForCurrentTask;
+ (id)signingIdentifierFromAuditToken:(id *)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (NSString)signingIdentifier;
- (_HKXPCAuditToken)initWithAuditToken:(id *)a3;
- (int)processIdentifier;
- (unint64_t)hash;
@end

@implementation _HKXPCAuditToken

- (_HKXPCAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKXPCAuditToken;
  result = [(_HKXPCAuditToken *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (int)processIdentifier
{
  return self->_auditToken.val[5];
}

- (NSString)signingIdentifier
{
  v3 = objc_opt_class();
  long long v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  long long v5 = [v3 signingIdentifierFromAuditToken:v7];

  return (NSString *)v5;
}

+ (id)auditTokenForCurrentTask
{
  id v2 = objc_alloc((Class)a1);
  mach_msg_type_number_t task_info_outCnt = 8;
  memset(v5, 0, sizeof(v5));
  task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)v5, &task_info_outCnt);
  v3 = (void *)[v2 initWithAuditToken:v5];

  return v3;
}

+ (id)signingIdentifierFromAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  long long v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (v4)
  {
    long long v5 = v4;
    *(void *)cf.val = 0;
    objc_super v6 = (__CFString *)SecTaskCopySigningIdentifier(v4, (CFErrorRef *)&cf);
    if (!v6 && *(void *)cf.val)
    {
      _HKInitializeLogging();
      v7 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        +[_HKXPCAuditToken signingIdentifierFromAuditToken:]((uint64_t *)&cf, v7);
      }
      CFRelease(*(CFTypeRef *)cf.val);
    }
    CFRelease(v5);
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[_HKXPCAuditToken signingIdentifierFromAuditToken:](v8);
    }
    objc_super v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(_HKXPCAuditToken *)self processIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (_HKXPCAuditToken *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && *(void *)self->_auditToken.val == *(void *)v4->_auditToken.val
      && *(void *)&self->_auditToken.val[2] == *(void *)&v4->_auditToken.val[2]
      && *(void *)&self->_auditToken.val[4] == *(void *)&v4->_auditToken.val[4]
      && *(void *)&self->_auditToken.val[6] == *(void *)&v4->_auditToken.val[6];
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (void)signingIdentifierFromAuditToken:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Unable to create SecTask for audit token", v1, 2u);
}

+ (void)signingIdentifierFromAuditToken:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Unable to get signing identifier from task: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end