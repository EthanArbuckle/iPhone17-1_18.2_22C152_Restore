@interface IRDataContainer
+ (id)containerForPersona:(id)a3;
+ (id)containerForPrimaryPersona;
- (NSString)persona;
- (NSURL)containerBaseURL;
- (id)_initWithPersona:(id)a3;
- (id)description;
- (int64_t)extensionHandle;
- (void)dealloc;
- (void)setContainerBaseURL:(id)a3;
- (void)setExtensionHandle:(int64_t)a3;
- (void)setPersona:(id)a3;
@end

@implementation IRDataContainer

+ (id)containerForPrimaryPersona
{
  id v2 = objc_alloc((Class)a1);
  v3 = [NSString stringWithUTF8String:*MEMORY[0x263EF80C0]];
  v4 = (void *)[v2 _initWithPersona:v3];

  return v4;
}

+ (id)containerForPersona:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithPersona:v4];

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  v7 = [(IRDataContainer *)self persona];
  [v6 appendFormat:@", persona: %@", v7];

  v8 = [(IRDataContainer *)self containerBaseURL];
  [v6 appendFormat:@", containerBaseURL: %@", v8];

  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IRDataContainer extensionHandle](self, "extensionHandle"));
  [v6 appendFormat:@", extensionHandle: %@", v9];

  [v6 appendString:@">"];

  return v6;
}

- (void)dealloc
{
  [(IRDataContainer *)self extensionHandle];
  sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)IRDataContainer;
  [(IRDataContainer *)&v3 dealloc];
}

- (id)_initWithPersona:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)IRDataContainer;
  v5 = [(IRDataContainer *)&v41 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  [(IRDataContainer *)v5 setPersona:v4];
  if (!container_query_create())
  {
    v16 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRDataContainer _initWithPersona:]((uint64_t)v4, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_22;
  }
  container_query_set_class();
  container_query_operation_set_flags();
  id v7 = v4;
  [v7 UTF8String];
  container_query_set_persona_unique_string();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v23 = (void *)container_error_copy_unlocalized_description();
    v24 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      [(IRDataContainer *)(uint64_t)v7 _initWithPersona:(uint64_t)v23];
    }
    free(v23);
    goto LABEL_21;
  }
  uint64_t v8 = container_copy_sandbox_token();
  if (!v8)
  {
    v25 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRDataContainer _initWithPersona:]((uint64_t)v7, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_21;
  }
  v9 = (void *)v8;
  [(IRDataContainer *)v6 setExtensionHandle:sandbox_extension_consume()];
  free(v9);
  if ([(IRDataContainer *)v6 extensionHandle] < 0)
  {
    v32 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRDataContainer _initWithPersona:].cold.4((uint64_t)v7, v32);
    }
    goto LABEL_21;
  }
  id v10 = (id)[NSString stringWithUTF8String:container_get_path()];
  v11 = NSURL;
  v12 = [NSString stringWithUTF8String:container_get_path()];
  v13 = [v11 fileURLWithPath:v12 isDirectory:1];
  [(IRDataContainer *)v6 setContainerBaseURL:v13];

  v14 = [(IRDataContainer *)v6 containerBaseURL];

  if (!v14)
  {
    v33 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRDataContainer _initWithPersona:].cold.5((uint64_t)v7, v33, v34, v35, v36, v37, v38, v39);
    }
    [(IRDataContainer *)v6 extensionHandle];
    sandbox_extension_release();
LABEL_21:
    container_query_free();
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  container_query_free();
LABEL_8:
  v15 = v6;
LABEL_23:

  return v15;
}

- (NSString)persona
{
  return self->_persona;
}

- (void)setPersona:(id)a3
{
}

- (NSURL)containerBaseURL
{
  return self->_containerBaseURL;
}

- (void)setContainerBaseURL:(id)a3
{
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBaseURL, 0);

  objc_storeStrong((id *)&self->_persona, 0);
}

- (void)_initWithPersona:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initWithPersona:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = NSString;
  v6 = a2;
  id v7 = [v5 stringWithUTF8String:a3];
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_25418E000, v6, OS_LOG_TYPE_ERROR, "#data-container, [ErrorId - container_query_get_single_result error] container_query_get_single_result failed for persona: %@, error: %@", (uint8_t *)&v8, 0x16u);
}

- (void)_initWithPersona:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initWithPersona:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "#data-container, [ErrorId - sandbox_extension_consume] sandbox_extension_consume failed for persona: %@, error: %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

- (void)_initWithPersona:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end