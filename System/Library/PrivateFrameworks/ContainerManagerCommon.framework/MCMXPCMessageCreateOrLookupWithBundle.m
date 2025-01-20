@interface MCMXPCMessageCreateOrLookupWithBundle
- (BOOL)createIfNecessary;
- (BOOL)issueSandboxExtension;
- (BOOL)transient;
- (MCMXPCMessageCreateOrLookupWithBundle)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (const)sandboxToken;
@end

@implementation MCMXPCMessageCreateOrLookupWithBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableURL, 0);

  objc_storeStrong((id *)&self->_bundleURL, 0);
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (BOOL)issueSandboxExtension
{
  return self->_issueSandboxExtension;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (MCMXPCMessageCreateOrLookupWithBundle)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MCMXPCMessageCreateOrLookupWithBundle;
  v9 = [(MCMXPCMessageBase *)&v25 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    char uint64 = xpc_dictionary_get_uint64(v8, "Flags");
    v9->_createIfNecessary = uint64 & 1;
    v9->_transient = (uint64 & 2) != 0;
    v9->_issueSandboxExtension = (uint64 & 8) != 0;
    v9->_sandboxToken = xpc_dictionary_get_string(v8, "SandboxToken");
    v11 = [(MCMXPCMessageBase *)v9 nsStringValueFromXPCObject:v8 key:"BundlePath"];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:1 relativeToURL:0];
      bundleURL = v9->_bundleURL;
      v9->_bundleURL = (NSURL *)v12;

      uint64_t v14 = [(MCMXPCMessageBase *)v9 nsStringValueFromXPCObject:v8 key:"ExecutablePath"];
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0 relativeToURL:0];
        executableURL = v9->_executableURL;
        v9->_executableURL = (NSURL *)v16;

        v18 = [(NSURL *)v9->_executableURL path];
        v19 = [(NSURL *)v9->_bundleURL path];
        char v20 = [v18 hasPrefix:v19];

        if (v20)
        {

          goto LABEL_11;
        }
        v21 = container_log_handle_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = [(NSURL *)v9->_executableURL path];
          v24 = [(NSURL *)v9->_bundleURL path];
          *(_DWORD *)buf = 138412546;
          v27 = v23;
          __int16 v28 = 2112;
          v29 = v24;
          _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Executable path [%@] is not inside bundle path [%@]", buf, 0x16u);
        }
      }
    }

    v9 = 0;
    if (a5) {
      *a5 = 10;
    }
  }
LABEL_11:

  return v9;
}

@end