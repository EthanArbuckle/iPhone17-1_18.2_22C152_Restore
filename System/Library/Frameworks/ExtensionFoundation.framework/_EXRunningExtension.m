@interface _EXRunningExtension
+ (id)sharedInstance;
+ (void)entryPointFunction;
- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (_EXExtension)extension;
- (_EXExtensionIdentity)extensionIdentity;
- (int)_startWithArguments:(const char *)a3 count:(int)a4;
- (int)startWithArguments:(const char *)a3 count:(int)a4;
- (unint64_t)signpost;
- (void)checkIn;
- (void)didFinishLaunching;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)resume;
- (void)setExtension:(id)a3;
- (void)willFinishLaunching;
@end

@implementation _EXRunningExtension

- (int)startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = _EXSignpostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  if (v8)
  {
    v9 = v7;
    v10 = v9;
    if (v8 != -1 && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "extensionkit-lifecycle", "launch", buf, 2u);
    }
  }
  self->_os_signpost_id_t signpost = v8;
  v11 = [MEMORY[0x1E4F28F80] processInfo];
  v12 = [v11 environment];
  v13 = [v12 objectForKey:@"BSServiceDomains"];

  if (v13)
  {
    v14 = (const char *)[v13 UTF8String];
    v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 length:strlen(v14)];
    id v27 = 0;
    v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:&v27];
    id v17 = v27;
    v18 = _EXDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningExtension startWithArguments:count:]();
    }
  }
  int v19 = [(_EXRunningExtension *)self _startWithArguments:a3 count:v4];
  if (!v19) {
    [(_EXRunningExtension *)self resume];
  }
  v20 = _EXSignpostLog();
  v21 = v20;
  if (self->_signpost && os_signpost_enabled(v20))
  {
    v22 = v21;
    v23 = v22;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v23, OS_SIGNPOST_INTERVAL_END, signpost, "extensionkit-lifecycle", "exit", v26, 2u);
    }
  }
  return v19;
}

- (_EXExtension)extension
{
  return self->_extension;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_runningExtension;

  return v2;
}

- (void)setExtension:(id)a3
{
}

- (void)checkIn
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "Pinging launchd", v2, v3, v4, v5, v6);
}

+ (void)entryPointFunction
{
  if (entryPointFunction_onceToken != -1) {
    dispatch_once(&entryPointFunction_onceToken, &__block_literal_global_7);
  }
  return (void *)entryPointFunction_mainFunction;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  uint8_t v6 = [v7 extractNSXPCConnectionWithConfigurator:&__block_literal_global_38];
  if (![(_EXRunningExtension *)self shouldAcceptXPCConnection:v6]) {
    [v7 invalidate];
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningExtension shouldAcceptXPCConnection:]();
  }

  uint8_t v6 = _EXSignpostLog();
  id v7 = v6;
  if (self->_signpost && os_signpost_enabled(v6))
  {
    os_signpost_id_t v8 = v7;
    v9 = v8;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v9, OS_SIGNPOST_EVENT, signpost, "extensionkit-lifecycle", "-shouldAcceptXPCConnection:", v14, 2u);
    }
  }
  v11 = [(_EXRunningExtension *)self extension];
  char v12 = [v11 shouldAcceptConnection:v4];

  return v12;
}

- (void)didFinishLaunching
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Did finish launching extension: %{public}@", v2, v3, v4, v5, v6);
}

- (void)willFinishLaunching
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Will finish launching extension: %{public}@", v2, v3, v4, v5, v6);
}

- (int)_startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = [MEMORY[0x1E4F963E8] currentProcess];
  os_signpost_id_t v8 = [v7 hostProcess];

  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v75 = 0u;
  }
  long long v9 = v75;
  *(_OWORD *)self->_hostAuditToken.val = *(_OWORD *)buf;
  *(_OWORD *)&self->_hostAuditToken.val[4] = v9;
  v10 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v70 = _EXDefaultLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      -[_EXRunningExtension _startWithArguments:count:]();
    }
    goto LABEL_80;
  }
  v11 = [[_EXExtensionIdentity alloc] initWithApplicationExtensionRecord:v10];
  objc_storeStrong((id *)&self->_extensionIdentity, v11);
  uint64_t v12 = [(id)objc_opt_class() entryPointFunction];
  if (!v12)
  {
    v30 = _EXDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningExtension _startWithArguments:count:].cold.7(self);
    }
    goto LABEL_28;
  }
  v13 = (uint64_t (*)(uint64_t, const char **))v12;
  v14 = _EXSignpostLog();
  v15 = v14;
  if (self->_signpost && os_signpost_enabled(v14))
  {
    v73 = v11;
    v16 = v8;
    id v17 = v15;
    v18 = v17;
    os_signpost_id_t signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v18, OS_SIGNPOST_EVENT, signpost, "extensionkit-lifecycle", "PRE: swift entry point", buf, 2u);
    }

    os_signpost_id_t v8 = v16;
    v11 = v73;
  }

  int v20 = v13(v4, a3);
  v21 = _EXSignpostLog();
  v22 = v21;
  if (self->_signpost && os_signpost_enabled(v21))
  {
    v23 = v22;
    v24 = v23;
    os_signpost_id_t v25 = self->_signpost;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v24, OS_SIGNPOST_EVENT, v25, "extensionkit-lifecycle", "POST: swift entry point", buf, 2u);
    }
  }
  extension = self->_extension;
  if (!extension)
  {
    id v27 = [(_EXRunningExtension *)self extensionIdentity];
    char v28 = [v27 supportsNSExtensionPlistKeys];

    if ((v28 & 1) == 0)
    {
      v70 = _EXDefaultLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[_EXRunningExtension _startWithArguments:count:].cold.9();
      }
      goto LABEL_80;
    }
    extension = self->_extension;
    if (!extension)
    {
      v30 = _EXDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v68 = [(_EXRunningExtension *)self extension];
        v69 = [v68 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v69;
      }
LABEL_28:

      goto LABEL_29;
    }
  }
  [(_EXExtension *)extension setInternalRep:v11];
  [(_EXExtension *)self->_extension setHasSwiftEntryPoint:1];
  v29 = _EXDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    -[_EXRunningExtension _startWithArguments:count:].cold.8(self);
  }

  if (v20 == 1)
  {
LABEL_29:
    v31 = _EXDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[_EXRunningExtension _startWithArguments:count:].cold.6();
    }

    v32 = [(_EXExtensionIdentity *)self->_extensionIdentity extensionClass];
    if ([(objc_class *)v32 isSubclassOfClass:objc_opt_class()])
    {
      v33 = _EXSignpostLog();
      v34 = v33;
      if (self->_signpost && os_signpost_enabled(v33))
      {
        v35 = v34;
        v36 = v35;
        os_signpost_id_t v37 = self->_signpost;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v39;
          _os_signpost_emit_with_name_impl(&dword_191F29000, v36, OS_SIGNPOST_EVENT, v37, "extensionkit-lifecycle", "PRE: -[%{public}@ init]", buf, 0xCu);
        }
      }

      v40 = (_EXExtension *)objc_alloc_init(v32);
      v41 = self->_extension;
      self->_extension = v40;

      v42 = _EXSignpostLog();
      v43 = v42;
      if (self->_signpost && os_signpost_enabled(v42))
      {
        v44 = v43;
        v45 = v44;
        os_signpost_id_t v46 = self->_signpost;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          v47 = (objc_class *)objc_opt_class();
          v48 = NSStringFromClass(v47);
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v48;
          _os_signpost_emit_with_name_impl(&dword_191F29000, v45, OS_SIGNPOST_EVENT, v46, "extensionkit-lifecycle", "POST: -[%{public}@ init]", buf, 0xCu);
        }
      }

      [(_EXExtension *)self->_extension setInternalRep:v11];
      v49 = self->_extension;
      if (v49)
      {
        uint64_t v50 = [(_EXExtension *)v49 delegateClass];
        if (v50)
        {
          v51 = (objc_class *)v50;
          v52 = _EXSignpostLog();
          v53 = v52;
          if (self->_signpost && os_signpost_enabled(v52))
          {
            v54 = v53;
            v55 = v54;
            os_signpost_id_t v56 = self->_signpost;
            if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
            {
              v57 = NSStringFromClass(v51);
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v57;
              _os_signpost_emit_with_name_impl(&dword_191F29000, v55, OS_SIGNPOST_EVENT, v56, "extensionkit-lifecycle", "PRE: -[%{public}@ init]", buf, 0xCu);
            }
          }

          BOOL v58 = [(_EXExtension *)self->_extension loadDelegate];
          v59 = _EXSignpostLog();
          v60 = v59;
          if (self->_signpost && os_signpost_enabled(v59))
          {
            v61 = v60;
            v62 = v61;
            os_signpost_id_t v63 = self->_signpost;
            if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
            {
              v64 = NSStringFromClass(v51);
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v64;
              _os_signpost_emit_with_name_impl(&dword_191F29000, v62, OS_SIGNPOST_EVENT, v63, "extensionkit-lifecycle", "POST: -[%{public}@ init]", buf, 0xCu);
            }
          }

          if (v58) {
            goto LABEL_66;
          }
        }
        else
        {
          v65 = _EXDefaultLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
            -[_EXRunningExtension _startWithArguments:count:].cold.4();
          }
        }
        v66 = _EXDefaultLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          -[_EXRunningExtension _startWithArguments:count:]();
        }

LABEL_66:
        int v20 = 0;
        goto LABEL_67;
      }
      v70 = _EXDefaultLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[_EXRunningExtension _startWithArguments:count:]();
      }
    }
    else
    {
      v70 = _EXDefaultLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[_EXRunningExtension _startWithArguments:count:].cold.5(v32, v70);
      }
    }
LABEL_80:

    v71 = (_EXRunningExtension *)abort_with_reason();
    [(_EXRunningExtension *)v71 resume];
  }
LABEL_67:

  return v20;
}

- (void)resume
{
  [(_EXRunningExtension *)self checkIn];
  [(_EXRunningExtension *)self willFinishLaunching];
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x1E4F50BC0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29___EXRunningExtension_resume__block_invoke;
  v5[3] = &unk_1E573CB90;
  objc_copyWeak(&v6, &location);
  [v3 listenerWithConfigurator:v5];
  [(id)objc_claimAutoreleasedReturnValue() activate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___EXRunningExtension_resume__block_invoke_2;
  block[3] = &unk_1E573CBB8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [MEMORY[0x1E4F50BE8] activateXPCService];
  __break(1u);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return [(_EXRunningExtension *)self shouldAcceptXPCConnection:a4];
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_getProperty(self, a2, 16, 1);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  objc_copyStruct(retstr, &self->_hostAuditToken, 32, 1, 0);
  return result;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentity, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)_startWithArguments:count:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = "record && [record isKindOfClass:LSApplicationExtensionRecord.class]";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  int v4 = 164;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_191F29000, v1, OS_LOG_TYPE_ERROR, "%s - %s:%d: Invalid bundle record for current process: %@", (uint8_t *)&v2, 0x26u);
}

- (void)_startWithArguments:count:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "_extension";
  OUTLINED_FUNCTION_5();
  int v2 = v0;
  OUTLINED_FUNCTION_1();
  int v4 = 219;
  _os_log_error_impl(&dword_191F29000, v1, OS_LOG_TYPE_ERROR, "%s - %s:%d: Unexpected nil EXExtension instance", (uint8_t *)&v2, 0x1Cu);
}

- (void)_startWithArguments:count:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "No extension delegate specified, that's ok.", v2, v3, v4, v5, v6);
}

- (void)_startWithArguments:count:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "No value for 'EXAppExtensionDelegateClass' found, extension delegate is not specified", v2, v3, v4, v5, v6);
}

- (void)_startWithArguments:(objc_class *)a1 count:(NSObject *)a2 .cold.5(objc_class *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromClass(a1);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v7 = 136316162;
  os_signpost_id_t v8 = "[extensionClass isSubclassOfClass:_EXExtension.class]";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  int v9 = 211;
  __int16 v10 = 2114;
  v11 = v3;
  __int16 v12 = 2114;
  uint64_t v13 = v6;
  _os_log_error_impl(&dword_191F29000, a2, OS_LOG_TYPE_ERROR, "%s - %s:%d: Extension class '%{public}@' must be a subclass of '%{public}@'", (uint8_t *)&v7, 0x30u);
}

- (void)_startWithArguments:count:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "Falling back to delegate class lookup.", v2, v3, v4, v5, v6);
}

- (void)_startWithArguments:(void *)a1 count:.cold.7(void *a1)
{
  uint64_t v1 = [a1 extension];
  uint64_t v2 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_191F29000, v3, v4, "SwiftUI: Unable to find entry point function for extension with bundle ID '%{public}@'.", v5, v6, v7, v8, v9);
}

- (void)_startWithArguments:(void *)a1 count:.cold.8(void *a1)
{
  uint64_t v1 = [a1 extension];
  uint64_t v2 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_191F29000, v3, v4, "SwiftUI: Initialized extension with bundle ID '%{public}@'.", v5, v6, v7, v8, v9);
}

- (void)_startWithArguments:count:.cold.9()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "_extension || self.extensionIdentity.supportsNSExtensionPlistKeys";
  OUTLINED_FUNCTION_5();
  int v2 = v0;
  OUTLINED_FUNCTION_1();
  int v4 = 181;
  _os_log_error_impl(&dword_191F29000, v1, OS_LOG_TYPE_ERROR, "%s - %s:%d: Unexpected nil EXExtension instance", (uint8_t *)&v2, 0x1Cu);
}

- (void)startWithArguments:count:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Services: %@", v2, v3, v4, v5, v6);
}

- (void)shouldAcceptXPCConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Incoming service level XPC connection: %{public}@", v2, v3, v4, v5, v6);
}

@end