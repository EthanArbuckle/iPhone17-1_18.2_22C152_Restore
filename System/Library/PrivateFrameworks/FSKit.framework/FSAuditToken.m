@interface FSAuditToken
+ ($115C4C562B26FF47E01F9F4EA65B5887)getOurToken;
+ (BOOL)supportsSecureCoding;
+ (id)token;
+ (id)tokenWithData:(id)a3;
+ (id)tokenWithToken:(id *)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token;
- (BOOL)isOurUID;
- (FSAuditToken)init;
- (FSAuditToken)initWithCoder:(id)a3;
- (FSAuditToken)initWithToken:(id *)a3;
- (FSAuditToken)tokenWithRuid:(unsigned int)a3;
- (int)pid;
- (int)pidversion;
- (unsigned)egid;
- (unsigned)euid;
- (unsigned)rgid;
- (unsigned)ruid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FSAuditToken

+ ($115C4C562B26FF47E01F9F4EA65B5887)getOurToken
{
  if (getOurToken_onceToken != -1) {
    dispatch_once(&getOurToken_onceToken, &__block_literal_global_6);
  }
  long long v4 = unk_2698924A0;
  *(_OWORD *)retstr->var0 = getOurToken_ourToken;
  *(_OWORD *)&retstr->var0[4] = v4;
  return result;
}

uint64_t __27__FSAuditToken_getOurToken__block_invoke()
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x263EF8960], 0xFu, (task_info_t)getOurToken_ourToken, &task_info_outCnt))
  {
    v0 = fskit_std_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      LOWORD(v2.val[0]) = 0;
      _os_log_impl(&dword_24DDB2000, v0, OS_LOG_TYPE_INFO, "Error getting our own audit token", (uint8_t *)&v2, 2u);
    }
  }
  audit_token_t v2 = *(audit_token_t *)getOurToken_ourToken;
  audit_token_to_pid(&v2);
  audit_token_t v2 = *(audit_token_t *)getOurToken_ourToken;
  audit_token_to_pidversion(&v2);
  audit_token_t v2 = *(audit_token_t *)getOurToken_ourToken;
  uint64_t result = audit_token_to_ruid(&v2);
  ourUID = result;
  didSetup = 1;
  return result;
}

- (FSAuditToken)initWithToken:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FSAuditToken;
  long long v4 = [(FSAuditToken *)&v8 init];
  v5 = (FSAuditToken *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)a3->var0;
    *(_OWORD *)(v4 + 24) = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v4 + 8) = v6;
    if ((didSetup & 1) == 0) {
      [(id)objc_opt_class() getOurToken];
    }
  }
  return v5;
}

- (FSAuditToken)init
{
  long long v5 = 0u;
  long long v6 = 0u;
  v3 = objc_opt_class();
  if (v3)
  {
    objc_msgSend(v3, "getOurToken", v5, v6);
  }
  else
  {
    long long v5 = 0u;
    long long v6 = 0u;
  }
  return [(FSAuditToken *)self initWithToken:&v5];
}

+ (id)token
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)tokenWithToken:(id *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithToken:a3];
  return v3;
}

+ (id)tokenWithData:(id)a3
{
  id v4 = a3;
  if ([v4 length] == 32) {
    long long v5 = objc_msgSend(objc_alloc((Class)a1), "initWithToken:", objc_msgSend(v4, "bytes"));
  }
  else {
    long long v5 = 0;
  }

  return v5;
}

- (FSAuditToken)tokenWithRuid:(unsigned int)a3
{
  id v4 = (_DWORD *)[objc_alloc((Class)objc_opt_class()) initWithToken:&self->_token];
  v4[5] = a3;
  return (FSAuditToken *)v4;
}

- (unsigned)euid
{
  long long v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_euid(&v4);
}

- (unsigned)egid
{
  long long v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_egid(&v4);
}

- (unsigned)ruid
{
  long long v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_ruid(&v4);
}

- (unsigned)rgid
{
  long long v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_rgid(&v4);
}

- (int)pid
{
  long long v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

- (int)pidversion
{
  long long v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pidversion(&v4);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FSAuditToken)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)FSAuditToken;
  long long v5 = [(FSAuditToken *)&v9 init];
  if (v5)
  {
    long long v6 = (long long *)[v4 decodeBytesForKey:@"FSAuditToken.token" returnedLength:&v10];
    if (v10 == 32)
    {
      long long v7 = *v6;
      *(_OWORD *)(v5 + 24) = v6[1];
      *(_OWORD *)(v5 + 8) = v7;
    }
    else
    {

      long long v5 = 0;
    }
    if ((didSetup & 1) == 0) {
      [(id)objc_opt_class() getOurToken];
    }
  }

  return (FSAuditToken *)v5;
}

- (BOOL)isOurUID
{
  unsigned int v2 = [(FSAuditToken *)self ruid];
  return v2 == ourUID;
}

@end