@interface CXServiceClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)clientCanAccessSandboxFileURL:(id)a3;
- (BOOL)isConnected;
- (BOOL)isPermittedToUseBluetoothAccessories;
- (BOOL)isPermittedToUsePrivateAPI;
- (BSServiceConnectionHost)connection;
- (CXServiceClient)initWithConnection:(id)a3;
- (CXServiceClientDelegate)delegate;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)localizedName;
- (NSURL)bundleURL;
- (id)description;
- (int)processIdentifier;
- (int64_t)backgroundModeOptions;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation CXServiceClient

- (CXServiceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = [v5 remoteProcess];
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "cx_applicationIdentifier");
    if ([v8 length])
    {
      v9 = objc_msgSend(v7, "cx_applicationRecord");
      if (v9)
      {
        v10 = objc_msgSend(v7, "cx_capabilities");
        uint64_t v11 = objc_msgSend(v9, "cx_backgroundModeOptions");
        char v12 = [v10 containsObject:@"private-provider-api"];
        if ((v12 & 1) != 0 || v11)
        {
          v24.receiver = self;
          v24.super_class = (Class)CXServiceClient;
          v14 = [(CXServiceClient *)&v24 init];
          v15 = v14;
          if (v14)
          {
            v14->_backgroundModeOptions = v11;
            uint64_t v16 = [v9 bundleIdentifier];
            bundleIdentifier = v15->_bundleIdentifier;
            v15->_bundleIdentifier = (NSString *)v16;

            uint64_t v18 = [v9 URL];
            bundleURL = v15->_bundleURL;
            v15->_bundleURL = (NSURL *)v18;

            objc_storeStrong((id *)&v15->_connection, a3);
            objc_storeStrong((id *)&v15->_identifier, v8);
            v20 = [v9 localizedName];
            uint64_t v21 = [v20 copy];
            localizedName = v15->_localizedName;
            v15->_localizedName = (NSString *)v21;

            v15->_permittedToUsePrivateAPI = v12;
          }
          self = v15;
          v13 = self;
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)invalidate
{
  id v2 = [(CXServiceClient *)self connection];
  [v2 invalidate];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v8 = [(CXServiceClient *)self connection];
  v4 = [v8 remoteProcess];
  id v5 = [v4 auditToken];
  v6 = v5;
  if (v5)
  {
    [v5 realToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (BOOL)isConnected
{
  id v2 = [(CXServiceClient *)self connection];
  v3 = [v2 remoteTarget];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4FA99C8], (const void *)*MEMORY[0x1E4F1CFC8]);
  [(CXServiceClient *)self auditToken];
  LOBYTE(self) = TCCAccessCheckAuditToken() != 0;
  CFRelease(Mutable);
  return (char)self;
}

- (int)processIdentifier
{
  id v2 = [(CXServiceClient *)self connection];
  v3 = [v2 remoteProcess];
  int v4 = [v3 pid];

  return v4;
}

- (BOOL)clientCanAccessSandboxFileURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  [(CXServiceClient *)self auditToken];
  if ([v4 isFileURL])
  {
    id v32 = 0;
    char v5 = [v4 checkResourceIsReachableAndReturnError:&v32];
    v6 = v32;
    if (v5)
    {
      id v7 = v4;
      if ([v7 fileSystemRepresentation])
      {
        *(_OWORD *)buf = v33;
        *(_OWORD *)&buf[16] = v34;
        if (!sandbox_check_by_audit_token())
        {
          BOOL v30 = 1;
          goto LABEL_15;
        }
        id v8 = CXDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *__error();
          v10 = __error();
          uint64_t v11 = strerror(*v10);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v9;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v11;
          _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Client sandbox does not have access to the given file! (Error %i: %s)", buf, 0x12u);
        }
      }
      else
      {
        id v8 = CXDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CXServiceClient clientCanAccessSandboxFileURL:]((uint64_t)v7, v8, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    else
    {
      id v8 = CXDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CXServiceClient clientCanAccessSandboxFileURL:]((uint64_t)v6, v8, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    v6 = CXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CXServiceClient clientCanAccessSandboxFileURL:]((uint64_t)v4, v6, v12, v13, v14, v15, v16, v17);
    }
  }
  BOOL v30 = 0;
LABEL_15:

  return v30;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_identifier);
  char v5 = [(CXServiceClient *)self identifier];
  [v3 appendFormat:@" %@=%@", v4, v5];

  [v3 appendFormat:@", "];
  v6 = NSStringFromSelector(sel_isConnected);
  [v3 appendFormat:@" %@=%d", v6, -[CXServiceClient isConnected](self, "isConnected")];

  [v3 appendFormat:@", "];
  id v7 = NSStringFromSelector(sel_processIdentifier);
  [v3 appendFormat:@" %@=%d", v7, -[CXServiceClient processIdentifier](self, "processIdentifier")];

  [v3 appendFormat:@", "];
  id v8 = NSStringFromSelector(sel_isPermittedToUsePublicAPI);
  [v3 appendFormat:@" %@=%d", v8, -[CXServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI")];

  [v3 appendFormat:@", "];
  int v9 = NSStringFromSelector(sel_isPermittedToUsePrivateAPI);
  [v3 appendFormat:@" %@=%d", v9, -[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")];

  [v3 appendString:@">"];

  return v3;
}

- (CXServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXServiceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return self->_permittedToUsePrivateAPI;
}

- (int64_t)backgroundModeOptions
{
  return self->_backgroundModeOptions;
}

- (BSServiceConnectionHost)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)clientCanAccessSandboxFileURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clientCanAccessSandboxFileURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clientCanAccessSandboxFileURL:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end