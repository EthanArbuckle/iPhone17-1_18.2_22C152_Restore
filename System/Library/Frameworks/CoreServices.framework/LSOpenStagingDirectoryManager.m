@interface LSOpenStagingDirectoryManager
+ (id)sharedServerInstance;
- (LSOpenStagingDirectoryManager)initWithIOPersonality:(id)a3;
- (id).cxx_construct;
- (id)_locked_stagingDirectoryForKey:(unint64_t)a3;
- (id)_stagingDirectoryForKeyRefreshingIfNecessary:(unint64_t)a3;
- (id)mainDataVolumeStagingURLWithError:(id *)a3;
- (id)stagingDirectoryForCloningFileHandle:(id)a3 error:(id *)a4;
- (id)stagingDirectoryForCloningURL:(id)a3 error:(id *)a4;
- (optional<unsigned)bootstrapBaseStagingDirectoryNode:(id)a3 error:(id *)a4;
- (void)_locked_updatePersonaStagingDirectories;
@end

@implementation LSOpenStagingDirectoryManager

- (optional<unsigned)bootstrapBaseStagingDirectoryNode:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  LOBYTE(v19) = 0;
  LOBYTE(v20) = 0;
  uint64_t v19 = [(LSOpenStagingDirectoryManagerIOPersonality *)self->_ioPersonality stagingDirectoryKeyForNode:v6 error:a4];
  LOBYTE(v20) = v7;
  if (v7)
  {
    id v8 = v6;
    *(void *)buf = 0;
    *(void *)&buf[8] = v8;
    *(_DWORD *)&buf[16] = -1;
    v9 = std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,LaunchServices::OpenStaging::StagingDirectoryInfo>((uint64_t)&self->_stagingDirectoryInfoMap, (unint64_t *)&v19, &v19, (LaunchServices::OpenStaging::StagingDirectoryInfo *)buf);
    char v11 = v10;
    LaunchServices::OpenStaging::StagingDirectoryInfo::~StagingDirectoryInfo((LaunchServices::OpenStaging::StagingDirectoryInfo *)buf);
    if (v11)
    {
      v12 = _LSDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", v19);
        v16 = [v8 URL];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Configured open staging directory for key %@ at %@", buf, 0x16u);
      }
    }
    else
    {
      v12 = _LSDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", v19);
        v14 = [(id)v9[4] URL];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Already have a staging directory for key %@ at %@", buf, 0x16u);
      }
    }
  }
  v17.__val_ = v19;
  BOOL v18 = v20;
  result.__engaged_ = v18;
  result.var0 = v17;
  return result;
}

- (LSOpenStagingDirectoryManager)initWithIOPersonality:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)LSOpenStagingDirectoryManager;
  id v6 = [(LSOpenStagingDirectoryManager *)&v34 init];
  char v7 = v6;
  if (v6)
  {
    p_ioPersonality = (void **)&v6->_ioPersonality;
    objc_storeStrong((id *)&v6->_ioPersonality, a3);
    v7->_personaGeneration = 0;
    if (v7->_mainStagingDirectoryKey.__engaged_) {
      v7->_mainStagingDirectoryKey.__engaged_ = 0;
    }
    v9 = *p_ioPersonality;
    id v33 = 0;
    id v10 = v9;
    char v11 = [v10 mainUserContainerURL];
    v12 = [v10 makeStagingDirectoryNodeInContainer:v11 error:&v33];

    id v13 = v33;
    v14 = v13;
    if (v12)
    {
      id v32 = v13;
      uint64_t v15 = [(LSOpenStagingDirectoryManager *)v7 bootstrapBaseStagingDirectoryNode:v12 error:&v32];
      BOOL v17 = v16;
      id v18 = v32;

      v7->_mainStagingDirectoryKey.var0.__val_ = v15;
      v7->_mainStagingDirectoryKey.__engaged_ = v17;
      if (v17) {
        goto LABEL_12;
      }
      uint64_t v19 = _LSDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.4();
      }
    }
    else
    {
      uint64_t v19 = _LSDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:]();
      }
      id v18 = v14;
    }

LABEL_12:
    BOOL v20 = *p_ioPersonality;
    id v31 = v18;
    id v21 = v20;
    uint64_t v22 = [v21 mainSystemContainerURL];
    v23 = [v21 makeStagingDirectoryNodeInContainer:v22 error:&v31];

    id v24 = v31;
    if (v23)
    {
      id v30 = v24;
      [(LSOpenStagingDirectoryManager *)v7 bootstrapBaseStagingDirectoryNode:v23 error:&v30];
      char v26 = v25;
      id v27 = v30;

      if (v26)
      {
LABEL_20:

        [(LSOpenStagingDirectoryManager *)v7 _locked_updatePersonaStagingDirectories];
        goto LABEL_21;
      }
      v28 = _LSDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:]();
      }
    }
    else
    {
      v28 = _LSDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[LSOpenStagingDirectoryManager initWithIOPersonality:]();
      }
      id v27 = v24;
    }

    goto LABEL_20;
  }
LABEL_21:

  return v7;
}

+ (id)sharedServerInstance
{
  _LSAssertRunningInServer((uint64_t)"+[LSOpenStagingDirectoryManager sharedServerInstance]");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__LSOpenStagingDirectoryManager_sharedServerInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[LSOpenStagingDirectoryManager sharedServerInstance]::onceToken != -1) {
    dispatch_once(&+[LSOpenStagingDirectoryManager sharedServerInstance]::onceToken, block);
  }
  v3 = (void *)+[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance;

  return v3;
}

void __53__LSOpenStagingDirectoryManager_sharedServerInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = objc_alloc_init(LSServerOpenStagingIOPersonality);
  uint64_t v2 = objc_msgSend(v1, "initWithIOPersonality:");
  v3 = (void *)+[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance;
  +[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance = v2;
}

- (void)_locked_updatePersonaStagingDirectories
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_182959000, v1, OS_LOG_TYPE_DEBUG, "Persona generation %llu of staging directory manager is current.", (uint8_t *)&v2, 0xCu);
}

- (id)_locked_stagingDirectoryForKey:(unint64_t)a3
{
  unint64_t v5 = a3;
  uint64_t v3 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::find<unsigned long long>(&self->_stagingDirectoryInfoMap.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
  {
    uint64_t v3 = [v3[4] URL];
  }

  return v3;
}

- (id)_stagingDirectoryForKeyRefreshingIfNecessary:(unint64_t)a3
{
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  [(LSOpenStagingDirectoryManager *)self _locked_updatePersonaStagingDirectories];
  id v6 = [(LSOpenStagingDirectoryManager *)self _locked_stagingDirectoryForKey:a3];
  os_unfair_lock_unlock(p_mutex);

  return v6;
}

- (id)stagingDirectoryForCloningURL:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [[FSNode alloc] initWithURL:v6 flags:0 error:a4];
  uint64_t v8 = [(LSOpenStagingDirectoryManagerIOPersonality *)self->_ioPersonality stagingDirectoryKeyForNode:v7 error:a4];
  if (v9)
  {
    id v10 = [(LSOpenStagingDirectoryManager *)self _stagingDirectoryForKeyRefreshingIfNecessary:v8];
    if (v10) {
      goto LABEL_7;
    }
    uint64_t v11 = [NSString stringWithFormat:@"Could not find open staging directory for URL %@", v6];
    v12 = (void *)v11;
    if (a4)
    {
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v16[0] = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 2, (uint64_t)"-[LSOpenStagingDirectoryManager stagingDirectoryForCloningURL:error:]", 398, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)stagingDirectoryForCloningFileHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(LSOpenStagingDirectoryManagerIOPersonality *)self->_ioPersonality stagingDirectoryKeyForFileHandle:v6 error:a4];
  if (v8)
  {
    uint64_t v9 = [(LSOpenStagingDirectoryManager *)self _stagingDirectoryForKeyRefreshingIfNecessary:v7];
    id v10 = (void *)v9;
    if (a4 && !v9)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 2, (uint64_t)"-[LSOpenStagingDirectoryManager stagingDirectoryForCloningFileHandle:error:]", 410, 0);
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)mainDataVolumeStagingURLWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (!self->_mainStagingDirectoryKey.__engaged_)
  {
    os_unfair_lock_unlock(p_mutex);
    if (!a3) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v10[0] = @"Could not find open staging directory for main data volume?";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 2, (uint64_t)"-[LSOpenStagingDirectoryManager mainDataVolumeStagingURLWithError:]", 428, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  id v6 = [(LSOpenStagingDirectoryManager *)self _locked_stagingDirectoryForKey:self->_mainStagingDirectoryKey.var0.__val_];
  os_unfair_lock_unlock(p_mutex);
  if (v6) {
    goto LABEL_8;
  }
  if (a3) {
    goto LABEL_6;
  }
LABEL_7:
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioPersonality, 0);

  std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::~__hash_table((uint64_t)&self->_stagingDirectoryInfoMap);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 80) = 0;
  return self;
}

- (void)initWithIOPersonality:.cold.1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Could not create and clean main system data volume staging directory: personality %@, error %@");
}

- (void)initWithIOPersonality:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2(&dword_182959000, v0, v1, "Could not find volume identifier for system staging directory node %@: %@");
}

- (void)initWithIOPersonality:.cold.3()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Could not create and clean main user data volume staging directory: personality %@, error %@");
}

- (void)initWithIOPersonality:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2(&dword_182959000, v0, v1, "Could not find volume identifier for main staging directory node %@: %@");
}

@end