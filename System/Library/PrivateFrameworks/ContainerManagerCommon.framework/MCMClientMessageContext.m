@interface MCMClientMessageContext
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (MCMPOSIXUser)posixUser;
- (MCMUserIdentityCache)userIdentityCache;
- (NSString)personaUniqueString;
- (OS_xpc_object)message;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForCurrentThreadContextWithXPCMessage:(id)a3 userIdentityCache:(id)a4;
- (int)pid;
@end

@implementation MCMClientMessageContext

- (id)initForCurrentThreadContextWithXPCMessage:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCMClientMessageContext;
  v9 = [(MCMClientMessageContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    xpc_dictionary_get_audit_token();
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
    uint64_t v11 = [v8 personaUniqueStringForCurrentContext];
    personaUniqueString = v10->_personaUniqueString;
    v10->_personaUniqueString = (NSString *)v11;
  }
  return v10;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_personaUniqueString, 0);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (int)pid
{
  return container_audit_token_get_pid();
}

- (MCMPOSIXUser)posixUser
{
  v2 = +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", container_audit_token_get_euid(), *(void *)self->_auditToken.val, *(void *)&self->_auditToken.val[2], *(void *)&self->_auditToken.val[4], *(void *)&self->_auditToken.val[6]);

  return (MCMPOSIXUser *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

@end