@interface MCMXPCMessageSetDataProtection
- (BOOL)isThirdParty;
- (BOOL)retryIfLocked;
- (MCMXPCMessageSetDataProtection)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (int)dataProtectionClass;
@end

@implementation MCMXPCMessageSetDataProtection

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)isThirdParty
{
  return self->_thirdParty;
}

- (MCMXPCMessageSetDataProtection)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageSetDataProtection;
  v9 = [(MCMXPCMessageWithContainerBase *)&v11 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    v9->_thirdParty = xpc_dictionary_get_BOOL(v8, "IsThirdParty");
    v9->_dataProtectionClass = xpc_dictionary_get_int64(v8, "DataProtectionClass");
    v9->_retryIfLocked = xpc_dictionary_get_BOOL(v8, "RetryIfLocked");
  }

  return v9;
}

@end