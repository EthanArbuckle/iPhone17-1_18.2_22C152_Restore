@interface FMSharedFileContainer
- (FMSharedFileContainer)init;
- (FMSharedFileContainer)initWithIdentifier:(id)a3;
- (NSURL)url;
- (id)groupContainerURLWithIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation FMSharedFileContainer

- (FMSharedFileContainer)init
{
  return [(FMSharedFileContainer *)self initWithIdentifier:0];
}

- (FMSharedFileContainer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMSharedFileContainer;
  v5 = [(FMSharedFileContainer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(FMSharedFileContainer *)v5 groupContainerURLWithIdentifier:v4];
    [(FMSharedFileContainer *)v6 setUrl:v7];
  }
  return v6;
}

- (id)groupContainerURLWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 1;
  [a3 UTF8String];
  v3 = (void *)container_system_group_path_for_identifier();
  id v4 = LogCategory_SharedFileContainer();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = v3;
      _os_log_impl(&dword_1B2FB9000, v5, OS_LOG_TYPE_INFO, "System group container path is %s", buf, 0xCu);
    }

    v6 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    free(v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FMSharedFileContainer groupContainerURLWithIdentifier:](&v8, v5);
    }

    v6 = 0;
  }
  return v6;
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

- (void)groupContainerURLWithIdentifier:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B2FB9000, a2, OS_LOG_TYPE_ERROR, "Error getting system group container: %llu", (uint8_t *)&v3, 0xCu);
}

@end