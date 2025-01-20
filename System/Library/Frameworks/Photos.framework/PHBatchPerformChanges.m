@interface PHBatchPerformChanges
- (BOOL)_addBatchRangeAtIndex:(unint64_t)a3 toOutError:(id *)a4;
- (BOOL)_hasMoreBatchesAtIndex:(unint64_t)a3;
- (BOOL)_performChangesAndWaitStartingAtIndex:(unint64_t)a3 error:(id *)a4;
- (BOOL)performChangesAndWait:(id *)a3;
- (PHBatchPerformChanges)initWithPhotoLibrary:(id)a3 itemCount:(unint64_t)a4 batchSize:(unint64_t)a5 batchBlock:(id)a6;
- (PHBatchPerformChanges)performChangesWithCompletionHandler:(id)a3;
- (_NSRange)_batchRangeAtIndex:(unint64_t)a3;
- (id)_errorByAddingBatchRangeAtIndex:(unint64_t)a3 tofError:(id)a4;
- (unint64_t)_performBatchAtIndex:(unint64_t)a3;
- (unint64_t)_performBatchAtIndexAndWait:(unint64_t)a3 error:(id *)a4;
- (void)_performChangesStartingAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)_performNextBatchAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
@end

@implementation PHBatchPerformChanges

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchBlock, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (id)_errorByAddingBatchRangeAtIndex:(unint64_t)a3 tofError:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(PHBatchPerformChanges *)self _batchRangeAtIndex:a3];
    uint64_t v9 = v8;
    v10 = [v6 userInfo];
    v11 = (void *)[v10 mutableCopy];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v15 = v13;

    v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v7, v9);
    [v15 setObject:v16 forKeyedSubscript:@"PHBatchPerformChangesRangeErrorKey"];

    v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = [v6 domain];
    v14 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v6, "code"), v15);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_addBatchRangeAtIndex:(unint64_t)a3 toOutError:(id *)a4
{
  if (a4)
  {
    id v5 = [(PHBatchPerformChanges *)self _errorByAddingBatchRangeAtIndex:a3 tofError:*a4];
    *a4 = v5;
  }
  return 0;
}

- (unint64_t)_performBatchAtIndex:(unint64_t)a3
{
  [(PHBatchPerformChanges *)self _batchRangeAtIndex:a3];
  unint64_t v5 = v4;
  id v6 = (void *)MEMORY[0x19F389B10]();
  (*((void (**)(void))self->_batchBlock + 2))();
  return v5;
}

- (_NSRange)_batchRangeAtIndex:(unint64_t)a3
{
  unint64_t itemCount = self->_itemCount;
  if (itemCount <= a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHBatchPerformChanges.m", 136, @"Batch index %tu must be less than item count %tu", a3, self->_itemCount);

    unint64_t itemCount = self->_itemCount;
  }
  unint64_t v6 = itemCount - a3;
  if (self->_batchSize >= v6) {
    NSUInteger batchSize = v6;
  }
  else {
    NSUInteger batchSize = self->_batchSize;
  }
  NSUInteger v8 = a3;
  result.length = batchSize;
  result.location = v8;
  return result;
}

- (BOOL)_hasMoreBatchesAtIndex:(unint64_t)a3
{
  return self->_itemCount > a3;
}

- (void)_performNextBatchAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  library = self->_library;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5847E80;
  v12[4] = self;
  v12[5] = v13;
  v12[6] = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5847ED0;
  id v8 = v6;
  id v10 = v8;
  v11 = v13;
  [(PHPhotoLibrary *)library performChanges:v12 completionHandler:v9];

  _Block_object_dispose(v13, 8);
}

uint64_t __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performBatchAtIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)_performChangesStartingAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if ([(PHBatchPerformChanges *)self _hasMoreBatchesAtIndex:a3])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__PHBatchPerformChanges__performChangesStartingAtIndex_withCompletionHandler___block_invoke;
    v7[3] = &unk_1E5847EA8;
    v7[4] = self;
    id v8 = v6;
    unint64_t v9 = a3;
    [(PHBatchPerformChanges *)self _performNextBatchAtIndex:a3 withCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

void __78__PHBatchPerformChanges__performChangesStartingAtIndex_withCompletionHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1[4];
  if (a2)
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6] + a2;
    [v4 _performChangesStartingAtIndex:v6 withCompletionHandler:v5];
  }
  else
  {
    uint64_t v7 = a1[5];
    id v8 = [v4 _errorByAddingBatchRangeAtIndex:a1[6] tofError:a3];
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v8);
  }
}

- (PHBatchPerformChanges)performChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PHBatchPerformChanges_performChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58484E0;
  id v8 = v4;
  id v5 = v4;
  [(PHBatchPerformChanges *)self _performChangesStartingAtIndex:0 withCompletionHandler:v7];

  return result;
}

uint64_t __61__PHBatchPerformChanges_performChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)_performBatchAtIndexAndWait:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  library = self->_library;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PHBatchPerformChanges__performBatchAtIndexAndWait_error___block_invoke;
  v7[3] = &unk_1E5847E80;
  void v7[4] = self;
  void v7[5] = &v8;
  v7[6] = a3;
  if ([(PHPhotoLibrary *)library performChangesAndWait:v7 error:a4]) {
    unint64_t v5 = v9[3];
  }
  else {
    unint64_t v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __59__PHBatchPerformChanges__performBatchAtIndexAndWait_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performBatchAtIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_performChangesAndWaitStartingAtIndex:(unint64_t)a3 error:(id *)a4
{
  if (!-[PHBatchPerformChanges _hasMoreBatchesAtIndex:](self, "_hasMoreBatchesAtIndex:")) {
    return 1;
  }
  unint64_t v7 = [(PHBatchPerformChanges *)self _performBatchAtIndexAndWait:a3 error:a4];
  if (v7)
  {
    return [(PHBatchPerformChanges *)self _performChangesAndWaitStartingAtIndex:v7 + a3 error:a4];
  }
  else
  {
    [(PHBatchPerformChanges *)self _addBatchRangeAtIndex:a3 toOutError:a4];
    return 0;
  }
}

- (BOOL)performChangesAndWait:(id *)a3
{
  id v8 = 0;
  BOOL v4 = [(PHBatchPerformChanges *)self _performChangesAndWaitStartingAtIndex:0 error:&v8];
  id v5 = v8;
  uint64_t v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return v4;
}

- (PHBatchPerformChanges)initWithPhotoLibrary:(id)a3 itemCount:(unint64_t)a4 batchSize:(unint64_t)a5 batchBlock:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PHBatchPerformChanges;
  id v13 = [(PHBatchPerformChanges *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_library, a3);
    v14->_unint64_t itemCount = a4;
    v14->_NSUInteger batchSize = a5;
    uint64_t v15 = [v12 copy];
    id batchBlock = v14->_batchBlock;
    v14->_id batchBlock = (id)v15;

    v17 = v14;
  }

  return v14;
}

@end