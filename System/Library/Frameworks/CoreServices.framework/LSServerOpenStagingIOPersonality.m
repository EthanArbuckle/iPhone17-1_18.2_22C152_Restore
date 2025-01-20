@interface LSServerOpenStagingIOPersonality
- (id)mainSystemContainerURL;
- (id)mainUserContainerURL;
- (id)makeStagingDirectoryNodeInContainer:(id)a3 error:(id *)a4;
- (optional<LaunchServices::StagingDirectoryInfo>)stagingDirectoryInfoForPersonaUniqueString:(SEL)a3 error:(id)a4;
- (optional<unsigned)stagingDirectoryKeyForFileHandle:(id)a3 error:(id *)a4;
- (optional<unsigned)stagingDirectoryKeyForNode:(id)a3 error:(id *)a4;
@end

@implementation LSServerOpenStagingIOPersonality

- (id)mainUserContainerURL
{
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();

  return (id)[SharedInstance userContainerURL];
}

- (id)mainSystemContainerURL
{
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();

  return (id)[SharedInstance systemContainerURL];
}

- (id)makeStagingDirectoryNodeInContainer:(id)a3 error:(id *)a4
{
  v5 = makeStagingDirectoryURLInContainer(a3);
  if (v5)
  {
    id v9 = 0;
    v6 = [[FSNode alloc] initWithURL:v5 flags:8 error:&v9];
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
    v6 = 0;
  }

  if (a4 && !v6) {
    *a4 = v7;
  }

  return v6;
}

- (optional<LaunchServices::StagingDirectoryInfo>)stagingDirectoryInfoForPersonaUniqueString:(SEL)a3 error:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v22 = v7;
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  container_query_create();
  container_query_set_class();
  [v7 UTF8String];
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v15 = (void *)container_error_copy_unlocalized_description();
    v10 = (void *)[[NSString alloc] initWithUTF8String:v15];
    free(v15);
    LODWORD(v15) = container_error_get_posix_errno();
    v25 = @"ContainerErrorDescription";
    v26[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], (int)v15, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]", 126, v11);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  uint64_t path = container_get_path();
  if (path)
  {
    id v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:](path, v9);
    }

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
    v11 = makeStagingDirectoryURLInContainer(v10);
    if (v11)
    {
      uint64_t v21 = -1;
      v12 = (void *)container_copy_sandbox_token();
      if (v12)
      {
        uint64_t v21 = sandbox_extension_consume();
        if (v21 < 0)
        {
          uint64_t v16 = *__error();
          v17 = _LSDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:](v16, v17);
          }

          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], v16, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]", 142, 0);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          free(v12);
          goto LABEL_20;
        }
        free(v12);
      }
      id v19 = 0;
      v13 = [[FSNode alloc] initWithURL:v11 flags:8 error:&v19];
      id v14 = v19;
      v20 = v13;
      if (v13)
      {
        std::optional<LaunchServices::OpenStaging::StagingDirectoryInfo>::emplace[abi:nn180100]<NSString * {__strong}&,FSNode * {__strong}&,long long &,void>((LaunchServices::OpenStaging::StagingDirectoryInfo *)retstr, &v22, (void **)&v20, &v21);
      }
      if (!retstr->var1 && (v21 & 0x8000000000000000) == 0) {
        sandbox_extension_release();
      }
    }
    else
    {
      id v14 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v23 = *MEMORY[0x1E4F28228];
  v24 = @"No path in container";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 96, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]", 158, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  if (a5 && !retstr->var1) {
    *a5 = v14;
  }

  return result;
}

- (optional<unsigned)stagingDirectoryKeyForNode:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v15 = 0;
  int v6 = [v5 getFileSystemRepresentation:v16 error:&v15];
  id v7 = v15;
  if (v6)
  {
    if (!statfs(v16, &v17))
    {
      unint64_t v10 = v17.f_fsid.val[0] & 0xFFFFFFFFFFFFFF00;
      uint64_t v12 = LOBYTE(v17.f_fsid.val[0]);
      uint64_t v11 = 1;
      goto LABEL_8;
    }
    v8 = __error();
    uint64_t v9 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v8, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryKeyForNode:error:]", 194, 0);

    id v7 = (id)v9;
  }
  if (a4)
  {
    id v7 = v7;
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    *a4 = v7;
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
LABEL_8:

  v13.__val_ = v12 | v10;
  BOOL v14 = v11;
  result.__engaged_ = v14;
  result.var0 = v13;
  return result;
}

- (optional<unsigned)stagingDirectoryKeyForFileHandle:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (fstatfs([v5 fileDescriptor], &v13))
  {
    int v6 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v6, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryKeyForFileHandle:error:]", 211, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      id v7 = v7;
      unint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      *a4 = v7;
    }
    else
    {
      unint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  else
  {
    id v7 = 0;
    unint64_t v8 = v13.f_fsid.val[0] & 0xFFFFFFFFFFFFFF00;
    uint64_t v10 = LOBYTE(v13.f_fsid.val[0]);
    uint64_t v9 = 1;
  }

  v11.__val_ = v10 | v8;
  BOOL v12 = v9;
  result.__engaged_ = v12;
  result.var0 = v11;
  return result;
}

- (void)stagingDirectoryInfoForPersonaUniqueString:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  v3 = "-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to consume container sandbox token, errno = %{darwin.errno}d", (uint8_t *)&v2, 0x12u);
}

- (void)stagingDirectoryInfoForPersonaUniqueString:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446467;
  v3 = "-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]";
  __int16 v4 = 2081;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: got user container URL %{private}s from containermanagerd", (uint8_t *)&v2, 0x16u);
}

@end