@interface FPProgressUpdater
- (FPProgressProxy)progress;
- (void)reportProgressUpdate:(int64_t)a3 totalUnitCount:(int64_t)a4 completedFileCount:(int64_t)a5 totalFileCount:(int64_t)a6;
- (void)setProgress:(id)a3;
@end

@implementation FPProgressUpdater

- (void)setProgress:(id)a3
{
}

- (void)reportProgressUpdate:(int64_t)a3 totalUnitCount:(int64_t)a4 completedFileCount:(int64_t)a5 totalFileCount:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);

  if (WeakRetained)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28F90]);
    v13 = [NSNumber numberWithInteger:a6];
    [v12 setFileTotalCount:v13];

    v14 = [NSNumber numberWithInteger:a5];
    [v12 setFileCompletedCount:v14];

    [v12 setTotalUnitCount:a4];
    [v12 setCompletedUnitCount:a3];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__FPProgressUpdater_reportProgressUpdate_totalUnitCount_completedFileCount_totalFileCount___block_invoke;
    v16[3] = &unk_1E5AF0748;
    v16[4] = self;
    id v17 = v12;
    id v15 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v16);
  }
}

void __91__FPProgressUpdater_reportProgressUpdate_totalUnitCount_completedFileCount_totalFileCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained updateWithProgress:*(void *)(a1 + 40)];
}

- (FPProgressProxy)progress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progress);

  return (FPProgressProxy *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end