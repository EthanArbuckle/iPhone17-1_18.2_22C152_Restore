@interface MCMXPCMessageRepairUserData
- (MCMXPCMessageRepairUserData)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSURL)url;
- (char)sandboxToken;
- (unsigned)disposition;
- (void)dealloc;
@end

@implementation MCMXPCMessageRepairUserData

- (void).cxx_destruct
{
  p_url = &self->_url;

  objc_storeStrong((id *)p_url, 0);
}

- (char)sandboxToken
{
  return self->_sandboxToken;
}

- (NSURL)url
{
  return self->_url;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageRepairUserData;
  [(MCMXPCMessageBase *)&v5 dealloc];
}

- (unsigned)disposition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageRepairUserData;
  unsigned int v2 = [(MCMXPCMessageBase *)&v5 disposition];
  if (v2 == 1)
  {
    id v3 = containermanager_copy_global_configuration();
    unsigned int v2 = [v3 runmode] == 0;
  }
  return v2;
}

- (MCMXPCMessageRepairUserData)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMXPCMessageRepairUserData;
  v9 = [(MCMXPCMessageBase *)&v16 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    string = xpc_dictionary_get_string(v8, "SandboxToken");
    if (string) {
      string = strndup(string, 0x800uLL);
    }
    v9->_sandboxToken = (char *)string;
    url = v9->_url;
    v9->_url = 0;

    v12 = [(MCMXPCMessageBase *)v9 nsStringValueFromXPCObject:v8 key:"Path"];
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:1 relativeToURL:0];
      v14 = v9->_url;
      v9->_url = (NSURL *)v13;
    }
  }

  return v9;
}

@end