@interface MCMResultAcquireSandboxExtensionWithUUID
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultAcquireSandboxExtensionWithUUID)initWithSandboxToken:(const char *)a3 personaUniqueString:(id)a4 url:(id)a5;
- (NSString)personaUniqueString;
- (NSURL)url;
- (const)sandboxToken;
- (void)dealloc;
@end

@implementation MCMResultAcquireSandboxExtensionWithUUID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (NSURL)url
{
  return self->_url;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMResultAcquireSandboxExtensionWithUUID;
  [(MCMResultAcquireSandboxExtensionWithUUID *)&v5 dealloc];
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCMResultAcquireSandboxExtensionWithUUID;
  BOOL v5 = [(MCMResultBase *)&v10 encodeResultOntoReply:v4];
  if (v5)
  {
    uint64_t v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      v7 = [(MCMResultAcquireSandboxExtensionWithUUID *)self personaUniqueString];

      if (v7)
      {
        id v8 = [(MCMResultAcquireSandboxExtensionWithUUID *)self personaUniqueString];
        xpc_dictionary_set_string(v4, "ReplyPersonaUniqueString", (const char *)[v8 UTF8String]);
      }
      xpc_dictionary_set_string(v4, "ReplySandboxToken", [(MCMResultAcquireSandboxExtensionWithUUID *)self sandboxToken]);
    }
  }

  return v5;
}

- (MCMResultAcquireSandboxExtensionWithUUID)initWithSandboxToken:(const char *)a3 personaUniqueString:(id)a4 url:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MCMResultAcquireSandboxExtensionWithUUID;
  uint64_t v11 = [(MCMResultBase *)&v14 init];
  if (v11)
  {
    if (!a3)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11->_sandboxToken = strndup(a3, 0x400uLL);
    objc_storeStrong((id *)&v11->_personaUniqueString, a4);
    objc_storeStrong((id *)&v11->_url, a5);
  }
  v12 = v11;
LABEL_6:

  return v12;
}

@end