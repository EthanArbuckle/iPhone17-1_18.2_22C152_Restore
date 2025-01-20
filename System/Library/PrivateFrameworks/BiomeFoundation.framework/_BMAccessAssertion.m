@interface _BMAccessAssertion
- (BMAccessDescriptor)descriptor;
- (BMResourceContainer)container;
- (NSString)path;
- (_BMAccessAssertion)initWithDescriptor:(id)a3 extensionToken:(id)a4 container:(id)a5 path:(id)a6;
- (void)dealloc;
@end

@implementation _BMAccessAssertion

- (BMResourceContainer)container
{
  return self->_container;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a1;
  if (a2 == -1)
  {
    v6 = __error();
    v7 = strerror(*v6);
  }
  else
  {
    v7 = "no error";
  }
  int v8 = 134218498;
  uint64_t v9 = v5;
  __int16 v10 = 1024;
  int v11 = a2;
  __int16 v12 = 2082;
  v13 = v7;
  _os_log_debug_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_DEBUG, "sandbox_extension_release(%lld) = %d, %{public}s", (uint8_t *)&v8, 0x1Cu);
}

- (_BMAccessAssertion)initWithDescriptor:(id)a3 extensionToken:(id)a4 container:(id)a5 path:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_BMAccessAssertion;
  v15 = [(_BMAccessAssertion *)&v27 init];
  if (!v15) {
    goto LABEL_8;
  }
  v16 = __biome_log_for_category(6);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = BMAccessModePrintableDescription([v11 mode]);
    v18 = [v11 resource];
    *(_DWORD *)buf = 138543618;
    v29 = v17;
    __int16 v30 = 2114;
    v31 = v18;
    _os_log_impl(&dword_1B30A0000, v16, OS_LOG_TYPE_INFO, "Consuming sandbox extension token for %{public}@ access to %{public}@", buf, 0x16u);
  }
  id v19 = v12;
  [v19 bytes];
  uint64_t v20 = sandbox_extension_consume();
  v21 = __biome_log_for_category(6);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[_BMAccessAssertion initWithDescriptor:extensionToken:container:path:](v19, v20, v21);
  }

  if (v20 != -1)
  {
    objc_storeStrong((id *)&v15->_descriptor, a3);
    v15->_handle = v20;
    uint64_t v22 = [v14 copy];
    path = v15->_path;
    v15->_path = (NSString *)v22;

    objc_storeStrong((id *)&v15->_container, a5);
LABEL_8:
    v24 = v15;
    goto LABEL_12;
  }
  v25 = __biome_log_for_category(6);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[_BMAccessAssertion initWithDescriptor:extensionToken:container:path:](v11);
  }

  v24 = 0;
LABEL_12:

  return v24;
}

- (BMAccessDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (NSString)path
{
  return self->_path;
}

- (void)initWithDescriptor:(void *)a1 extensionToken:container:path:.cold.1(void *a1)
{
  v2 = BMAccessModePrintableDescription([a1 mode]);
  v3 = [a1 resource];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3(&dword_1B30A0000, v4, v5, "Failed to consume sandbox extension token for %{public}@ access to %{public}@", v6, v7, v8, v9, v10);
}

- (void)initWithDescriptor:(NSObject *)a3 extensionToken:container:path:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 bytes];
  if (a2 == -1)
  {
    uint64_t v6 = __error();
    uint64_t v7 = strerror(*v6);
  }
  else
  {
    uint64_t v7 = "no error";
  }
  int v8 = 134218498;
  uint64_t v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  __int16 v12 = 2082;
  id v13 = v7;
  _os_log_debug_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_DEBUG, "sandbox_extension_consume(%p) = %lld, %{public}s", (uint8_t *)&v8, 0x20u);
}

@end