@interface CRKDirectoryBackedConfigurationSource
- (BOOL)isDirectoryEmpty:(id)a3;
- (CRKDirectoryBackedConfigurationSource)init;
- (CRKDirectoryBackedConfigurationSource)initWithDirectoryURL:(id)a3 fileName:(id)a4;
- (CRKDirectoryBackedConfigurationSource)initWithDirectoryURL:(id)a3 fileName:(id)a4 callbackQueue:(id)a5;
- (void)fetchConfiguration:(id)a3;
- (void)fileBackedConfigurationSource:(id)a3 didDeleteConfigurationAtURL:(id)a4 inDirectory:(id)a5;
- (void)setConfiguration:(id)a3 completion:(id)a4;
@end

@implementation CRKDirectoryBackedConfigurationSource

- (CRKDirectoryBackedConfigurationSource)init
{
  v3 = objc_msgSend(NSURL, "crk_uniqueTemporaryFileURL");
  v4 = [v3 URLByDeletingLastPathComponent];
  v5 = [v3 lastPathComponent];
  v6 = [(CRKDirectoryBackedConfigurationSource *)self initWithDirectoryURL:v4 fileName:v5];

  return v6;
}

- (CRKDirectoryBackedConfigurationSource)initWithDirectoryURL:(id)a3 fileName:(id)a4
{
  return [(CRKDirectoryBackedConfigurationSource *)self initWithDirectoryURL:a3 fileName:a4 callbackQueue:MEMORY[0x263EF83A0]];
}

- (CRKDirectoryBackedConfigurationSource)initWithDirectoryURL:(id)a3 fileName:(id)a4 callbackQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRKDirectoryBackedConfigurationSource;
  v12 = [(CRKDirectoryBackedConfigurationSource *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mDirectoryURL, a3);
    v14 = [(NSURL *)v13->mDirectoryURL URLByAppendingPathComponent:v10];
    v15 = [[CRKFileBackedConfigurationSource alloc] initWithFileURL:v14 callbackQueue:v11];
    mFileBackedSource = v13->mFileBackedSource;
    v13->mFileBackedSource = v15;

    [(CRKFileBackedConfigurationSource *)v13->mFileBackedSource setDelegate:v13];
  }

  return v13;
}

- (void)fetchConfiguration:(id)a3
{
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  mFileBackedSource = self->mFileBackedSource;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CRKDirectoryBackedConfigurationSource_setConfiguration_completion___block_invoke;
  v10[3] = &unk_2646F3EA0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  id v9 = mFileBackedSource;
  [(CRKFileBackedConfigurationSource *)v9 setConfiguration:a3 completion:v10];
}

void __69__CRKDirectoryBackedConfigurationSource_setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fileBackedConfigurationSource:(id)a3 didDeleteConfigurationAtURL:(id)a4 inDirectory:(id)a5
{
  id v6 = a5;
  if ([(CRKDirectoryBackedConfigurationSource *)self isDirectoryEmpty:v6])
  {
    v7 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    char v8 = objc_msgSend(v7, "crk_safeRemoveItemAtURL:error:", v6, &v11);
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      id v10 = _CRKLogGeneral_18();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CRKDirectoryBackedConfigurationSource fileBackedConfigurationSource:didDeleteConfigurationAtURL:inDirectory:](v9);
      }
    }
  }
}

- (BOOL)isDirectoryEmpty:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v11 = 0;
  id v6 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:&v11];

  id v7 = v11;
  if (!v6)
  {
    char v8 = _CRKLogGeneral_18();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CRKDirectoryBackedConfigurationSource isDirectoryEmpty:](v7);
    }
  }
  BOOL v9 = [v6 count] == 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileBackedSource, 0);

  objc_storeStrong((id *)&self->mDirectoryURL, 0);
}

- (void)fileBackedConfigurationSource:(void *)a1 didDeleteConfigurationAtURL:inDirectory:.cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Failed to delete directory after configuration was removed: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)isDirectoryEmpty:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Failed to check if directory is empty: %{public}@", v4, v5, v6, v7, 2u);
}

@end