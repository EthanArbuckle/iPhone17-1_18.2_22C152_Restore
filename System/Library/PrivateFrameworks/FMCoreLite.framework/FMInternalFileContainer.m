@interface FMInternalFileContainer
- (FMInternalFileContainer)init;
- (NSURL)url;
- (id)internalContainerURL;
- (void)setUrl:(id)a3;
@end

@implementation FMInternalFileContainer

- (FMInternalFileContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMInternalFileContainer;
  v2 = [(FMInternalFileContainer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(FMInternalFileContainer *)v2 internalContainerURL];
    [(FMInternalFileContainer *)v3 setUrl:v4];
  }
  return v3;
}

- (id)internalContainerURL
{
  if (internalContainerURL_onceToken != -1) {
    dispatch_once(&internalContainerURL_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)internalContainerURL_systemContainerPath;
  return v2;
}

void __47__FMInternalFileContainer_internalContainerURL__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 1;
  v0 = (void *)container_system_path_for_identifier();
  v1 = LogCategory_SharedFileContainer();
  v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = v0;
      _os_log_impl(&dword_1B2FB9000, v2, OS_LOG_TYPE_INFO, "System container path is %s", buf, 0xCu);
    }

    uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v0 isDirectory:1 relativeToURL:0];
    v4 = (void *)internalContainerURL_systemContainerPath;
    internalContainerURL_systemContainerPath = v3;

    free(v0);
  }
  else
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __47__FMInternalFileContainer_internalContainerURL__block_invoke_cold_1(&v5, v2);
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__FMInternalFileContainer_internalContainerURL__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B2FB9000, a2, OS_LOG_TYPE_ERROR, "Error getting system container: %llu", (uint8_t *)&v3, 0xCu);
}

@end