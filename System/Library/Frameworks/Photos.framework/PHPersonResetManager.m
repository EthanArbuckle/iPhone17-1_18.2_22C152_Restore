@interface PHPersonResetManager
- (PHPersonResetManager)initWithPhotoLibrary:(id)a3;
- (id)progressHandler;
- (id)resetPersonsWithCompletionHandler:(id)a3;
- (id)resetSocialGroupsWithCompletionHandler:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation PHPersonResetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressFollower, 0);
  objc_storeStrong(&self->_progressHandler, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)resetSocialGroupsWithCompletionHandler:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PHPhotoLibrary *)self->_library assetsdClient];
  v7 = [v6 libraryClient];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E58465A8;
  v23[4] = self;
  id v8 = v5;
  id v24 = v8;
  v9 = [v7 resetSocialGroupsWithCompletionHandler:v23];
  if (v9)
  {
    v10 = _Block_copy(self->_progressHandler);
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F8AAE8]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke_2;
      v18[3] = &unk_1E58465D0;
      SEL v22 = a2;
      id v19 = v9;
      v20 = self;
      id v21 = v10;
      v12 = (PLProgressFollower *)[v11 initWithSourceProgress:v19 progressHandler:v18];
      progressFollower = self->_progressFollower;
      self->_progressFollower = v12;
    }
    id v14 = v9;
  }
  else
  {
    if (!v8) {
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"Reset social groups failed: progress is nil";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v16 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v10];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
LABEL_8:

  return v9;
}

void __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = v5;
    a2 = +[PHLibraryScope removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:v6 error:&v11];
    id v7 = v11;

    id v5 = v7;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0;

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, a2, v5);
  }
}

uint64_t __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 completedUnitCount] < 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PHPersonResetManager.m", 104, @"Invalid parameter not satisfying: %@", @"progress.completedUnitCount >= 0" object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) totalUnitCount] < 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PHPersonResetManager.m", 105, @"Invalid parameter not satisfying: %@", @"progress.totalUnitCount >= 0" object file lineNumber description];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [v4 completedUnitCount];
  uint64_t v7 = [v4 totalUnitCount];

  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v8(v5, v6, v7);
}

- (id)resetPersonsWithCompletionHandler:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PHPhotoLibrary *)self->_library assetsdClient];
  uint64_t v7 = [v6 libraryClient];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E58465A8;
  v23[4] = self;
  id v8 = v5;
  id v24 = v8;
  v9 = [v7 resetPersonsWithCompletionHandler:v23];
  if (v9)
  {
    uint64_t v10 = _Block_copy(self->_progressHandler);
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F8AAE8]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke_2;
      v18[3] = &unk_1E58465D0;
      SEL v22 = a2;
      id v19 = v9;
      v20 = self;
      id v21 = v10;
      v12 = (PLProgressFollower *)[v11 initWithSourceProgress:v19 progressHandler:v18];
      progressFollower = self->_progressFollower;
      self->_progressFollower = v12;
    }
    id v14 = v9;
  }
  else
  {
    if (!v8) {
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"Reset persons failed: progress is nil";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v16 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v10];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
LABEL_8:

  return v9;
}

void __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = v5;
    a2 = +[PHLibraryScope removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:v6 error:&v11];
    id v7 = v11;

    id v5 = v7;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0;

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, a2, v5);
  }
}

uint64_t __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 completedUnitCount] < 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PHPersonResetManager.m", 67, @"Invalid parameter not satisfying: %@", @"progress.completedUnitCount >= 0" object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) totalUnitCount] < 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PHPersonResetManager.m", 68, @"Invalid parameter not satisfying: %@", @"progress.totalUnitCount >= 0" object file lineNumber description];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [v4 completedUnitCount];
  uint64_t v7 = [v4 totalUnitCount];

  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v8(v5, v6, v7);
}

- (PHPersonResetManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHPersonResetManager;
  uint64_t v6 = [(PHPersonResetManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_library, a3);
  }

  return v7;
}

@end