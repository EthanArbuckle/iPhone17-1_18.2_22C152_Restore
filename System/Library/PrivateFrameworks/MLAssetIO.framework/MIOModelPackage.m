@interface MIOModelPackage
+ (BOOL)_upgradeModelSpecificationAtURL:(id)a3 packageURL:(id)a4 error:(id *)a5;
+ (id)upgradeModelSpecificationAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (MIOModelPackage)initWithModelPackageAtURL:(id)a3 error:(id *)p_isa;
- (NSURL)specificationURL;
- (void)setSpecificationURL:(id)a3;
@end

@implementation MIOModelPackage

+ (id)upgradeModelSpecificationAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v8 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    v13 = [v8 lastPathComponent];
    id v14 = [v13 stringByDeletingPathExtension];

    v15 = [v9 URLByAppendingPathComponent:v14 isDirectory:1];
    v16 = [v15 URLByAppendingPathExtension:@"mlpackage"];

    v17 = [v16 path];
    int v18 = [v10 fileExistsAtPath:v17];

    if (!v18)
    {
      v29 = +[MIOModelUtils URLForNewlyCreatedWorkingDirectoryAppropriateForURL:v9 error:a5];
      v30 = v29;
      if (v29)
      {
        v31 = [v29 URLByAppendingPathComponent:v14 isDirectory:1];
        v32 = [v31 URLByAppendingPathExtension:@"mlpackage"];

        if (([a1 _upgradeModelSpecificationAtURL:v8 packageURL:v32 error:a5] & 1) != 0
          && ([v10 replaceItemAtURL:v16 withItemAtURL:v32 backupItemName:0 options:0 resultingItemURL:0 error:a5] & 1) != 0)
        {
          [v10 removeItemAtURL:v30 error:0];
          a5 = v16;
        }
        else
        {
          [v10 removeItemAtURL:v30 error:0];
          a5 = 0;
        }
      }
      else
      {
        a5 = 0;
      }

      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v19 = [v16 path];
      +[MIOModelPackage upgradeModelSpecificationAtURL:toURL:error:]([v19 UTF8String], (uint64_t)v38, v19);
    }
    if (!a5) {
      goto LABEL_20;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v21 = NSString;
    id v22 = [v16 path];
    v23 = objc_msgSend(v21, "stringWithFormat:", @"Model package already exists at %s", objc_msgSend(v22, "UTF8String"));
    v35 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    *a5 = [v20 errorWithDomain:@"com.apple.mlassetio" code:2 userInfo:v24];

LABEL_11:
    a5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v25 = [v8 path];
    +[MIOModelPackage upgradeModelSpecificationAtURL:toURL:error:]([v25 UTF8String], (uint64_t)v38, v25);
  }
  if (a5)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v27 = NSString;
    id v14 = [v8 path];
    v16 = objc_msgSend(v27, "stringWithFormat:", @"Model does not exists at %s", objc_msgSend(v14, "UTF8String"));
    v37 = v16;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    *a5 = [v26 errorWithDomain:@"com.apple.mlassetio" code:1 userInfo:v28];

    goto LABEL_11;
  }
LABEL_21:

  return a5;
}

+ (BOOL)_upgradeModelSpecificationAtURL:(id)a3 packageURL:(id)a4 error:(id *)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  MEMORY[0x1E0198E60]();
  [v6 lastPathComponent];
  objc_claimAutoreleasedReturnValue();
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
  MPL::ModelPackage::ModelPackage((uint64_t)v10, __p, 1u, 0);
}

- (MIOModelPackage)initWithModelPackageAtURL:(id)a3 error:(id *)p_isa
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)MIOModelPackage;
    if ([(MIOModelPackage *)&v18 init])
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v6 fileSystemRepresentation]);
      MPL::ModelPackage::ModelPackage((uint64_t)v17, (char *)&__p, 0, 1);
    }
    self = (MIOModelPackage *)0;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v10 = [v6 path];
      -[MIOModelPackage initWithModelPackageAtURL:error:]([v10 UTF8String], (uint64_t)&__p, v10);
    }
    if (p_isa)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      char v12 = NSString;
      id v13 = [v6 path];
      id v14 = objc_msgSend(v12, "stringWithFormat:", @"Model package does not exist at %s", objc_msgSend(v13, "UTF8String"));
      v21[0] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *p_isa = [v11 errorWithDomain:@"com.apple.mlassetio" code:1 userInfo:v15];

      p_isa = 0;
    }
  }

  return (MIOModelPackage *)p_isa;
}

- (NSURL)specificationURL
{
  return self->_specificationURL;
}

- (void)setSpecificationURL:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)upgradeModelSpecificationAtURL:(uint64_t)a1 toURL:(uint64_t)a2 error:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1DC036000, MEMORY[0x1E4F14500], (uint64_t)a3, "Model package already exists at %s", (uint8_t *)a2);
}

+ (void)upgradeModelSpecificationAtURL:(uint64_t)a1 toURL:(uint64_t)a2 error:(void *)a3 .cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1DC036000, MEMORY[0x1E4F14500], (uint64_t)a3, "Model does not exists at %s", (uint8_t *)a2);
}

+ (void)_upgradeModelSpecificationAtURL:(uint64_t)a1 packageURL:error:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v3 = 136315138;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_0_0(&dword_1DC036000, MEMORY[0x1E4F14500], v2, "Failed to create model package. Error: %s", (uint8_t *)&v3);
}

- (void)initWithModelPackageAtURL:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to extract root model from model package at %@. Error: %s", (uint8_t *)&v4, 0x16u);
}

- (void)initWithModelPackageAtURL:(void *)a3 error:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1DC036000, MEMORY[0x1E4F14500], (uint64_t)a3, "Model package does not exist at %s", (uint8_t *)a2);
}

@end