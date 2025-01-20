@interface FPThreadedCopier
+ (FPThreadedCopier)sharedCopier;
- (BOOL)copy:(id)a3 to:(id)a4 overwriteDestination:(BOOL)a5 progress:(id)a6 error:(id *)a7;
- (BOOL)finishReading:(int)a3 writing:(int)a4 error:(id *)a5;
- (FPThreadedCopier)init;
- (NSMutableArray)buffers;
- (OS_dispatch_queue)writeQueue;
- (OS_dispatch_semaphore)bufferLimitSemaphore;
- (int)beginReading:(id)a3 error:(id *)a4;
- (int)beginWriting:(id)a3 overwriteDestination:(BOOL)a4 error:(id *)a5;
- (int64_t)numberOfInflightCopies;
- (void)beginOperation;
- (void)endOperation;
- (void)setBufferLimitSemaphore:(id)a3;
- (void)setBuffers:(id)a3;
- (void)setNumberOfInflightCopies:(int64_t)a3;
- (void)setWriteQueue:(id)a3;
@end

@implementation FPThreadedCopier

+ (FPThreadedCopier)sharedCopier
{
  if (sharedCopier_once != -1) {
    dispatch_once(&sharedCopier_once, &__block_literal_global_16);
  }
  v2 = (void *)sharedCopier_sharedCopier;

  return (FPThreadedCopier *)v2;
}

uint64_t __32__FPThreadedCopier_sharedCopier__block_invoke()
{
  sharedCopier_sharedCopier = objc_alloc_init(FPThreadedCopier);

  return MEMORY[0x1F41817F8]();
}

- (FPThreadedCopier)init
{
  v9.receiver = self;
  v9.super_class = (Class)FPThreadedCopier;
  v2 = [(FPThreadedCopier *)&v9 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(2);
    bufferLimitSemaphore = v2->_bufferLimitSemaphore;
    v2->_bufferLimitSemaphore = (OS_dispatch_semaphore *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("FPThreadedCopier Writing Queue", v5);
    writeQueue = v2->_writeQueue;
    v2->_writeQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (BOOL)copy:(id)a3 to:(id)a4 overwriteDestination:(BOOL)a5 progress:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = [(FPThreadedCopier *)self beginReading:v13 error:a7];
  if (v16 == -1
    || (uint64_t v17 = v16,
        SEL v40 = a2,
        uint64_t v18 = [(FPThreadedCopier *)self beginWriting:v14 overwriteDestination:v9 error:a7], v18 == -1))
  {
    BOOL v32 = 0;
  }
  else
  {
    uint64_t v19 = v18;
    id v41 = v13;
    id v42 = v14;
    [(FPThreadedCopier *)self beginOperation];
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__10;
    v55 = __Block_byref_object_dispose__10;
    id v56 = 0;
    uint64_t v20 = *MEMORY[0x1E4F28798];
    while (!v52[5])
    {
      if ([v15 isCancelled])
      {
        v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
        goto LABEL_20;
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_bufferLimitSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      if (v52[5])
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_bufferLimitSemaphore);
        break;
      }
      v21 = self;
      objc_sync_enter(v21);
      v22 = [(NSMutableArray *)self->_buffers firstObject];
      if (!v22)
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:v40 object:v21 file:@"FPThreadedCopier.m" lineNumber:81 description:@"No more buffers in queue"];
      }
      [(NSMutableArray *)self->_buffers removeObjectAtIndex:0];
      objc_sync_exit(v21);

      id v23 = v22;
      ssize_t v24 = read(v17, (void *)[v23 mutableBytes], 0x10000uLL);
      ssize_t v25 = v24;
      if (v24 == -1)
      {
        v29 = [MEMORY[0x1E4F28C58] errorWithDomain:v20 code:*__error() userInfo:0];
        v30 = v21;
        objc_sync_enter(v30);
        [(NSMutableArray *)self->_buffers addObject:v23];
        objc_sync_exit(v30);

        dispatch_semaphore_signal((dispatch_semaphore_t)self->_bufferLimitSemaphore);
      }
      else
      {
        if (!v24)
        {
          v33 = v21;
          objc_sync_enter(v33);
          [(NSMutableArray *)self->_buffers addObject:v23];
          objc_sync_exit(v33);

          v34 = [(FPThreadedCopier *)v33 bufferLimitSemaphore];
          dispatch_semaphore_signal(v34);

          break;
        }
        qos_class_t v26 = qos_class_self();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__FPThreadedCopier_copy_to_overwriteDestination_progress_error___block_invoke;
        block[3] = &unk_1E5AF2EE8;
        ssize_t v49 = v25;
        id v27 = v23;
        int v50 = v19;
        id v45 = v27;
        v48 = &v51;
        id v46 = v15;
        v47 = v21;
        dispatch_block_t v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v26, 0, block);
        dispatch_async((dispatch_queue_t)self->_writeQueue, v28);

        v29 = 0;
      }

      if (v29) {
        goto LABEL_20;
      }
    }
    v29 = 0;
LABEL_20:
    if (a7)
    {
      v35 = v29;
      if (v29 || (v35 = (void *)v52[5]) != 0) {
        *a7 = v35;
      }
    }
    id v43 = 0;
    id v14 = v42;
    BOOL v36 = [(FPThreadedCopier *)self finishReading:v17 writing:v19 error:&v43];
    id v37 = v43;
    unint64_t v38 = (unint64_t)v37;
    if (a7 && !v36 && !v29 && !v52[5]) {
      *a7 = v37;
    }
    [(FPThreadedCopier *)self endOperation];
    if (v29) {
      BOOL v32 = 0;
    }
    else {
      BOOL v32 = (v52[5] | v38) == 0;
    }

    _Block_object_dispose(&v51, 8);
    id v13 = v41;
  }

  return v32;
}

void __64__FPThreadedCopier_copy_to_overwriteDestination_progress_error___block_invoke(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = [*(id *)(a1 + 32) mutableBytes];
  if (v2 >= 1)
  {
    v4 = (char *)v3;
    while (1)
    {
      ssize_t v5 = write(*(_DWORD *)(a1 + 72), v4, v2);
      if (v5 == -1) {
        break;
      }
      ssize_t v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + v5);
      v4 += v6;
      v2 -= v6;
      if (v6) {
        BOOL v7 = v2 <= 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7) {
        goto LABEL_11;
      }
    }
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
LABEL_11:
  id v11 = *(id *)(a1 + 48);
  objc_sync_enter(v11);
  v12 = [*(id *)(a1 + 48) buffers];
  [v12 addObject:*(void *)(a1 + 32)];

  objc_sync_exit(v11);
  id v13 = [*(id *)(a1 + 48) bufferLimitSemaphore];
  dispatch_semaphore_signal(v13);
}

- (int)beginReading:(id)a3 error:(id *)a4
{
  int v5 = open((const char *)[a3 fileSystemRepresentation], 33028);
  int v6 = v5;
  if (a4 && v5 == -1)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  }
  return v6;
}

- (int)beginWriting:(id)a3 overwriteDestination:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = (const char *)[a3 fileSystemRepresentation];
  if (v6) {
    int v8 = open(v7, 1797, 384);
  }
  else {
    int v8 = open(v7, 3845, 384);
  }
  int v9 = v8;
  if (a5 && v8 == -1)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  }
  return v9;
}

- (BOOL)finishReading:(int)a3 writing:(int)a4 error:(id *)a5
{
  close(a3);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__10;
  uint64_t v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  writeQueue = self->_writeQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__FPThreadedCopier_finishReading_writing_error___block_invoke;
  v11[3] = &unk_1E5AF2F10;
  int v12 = a4;
  v11[4] = &v13;
  dispatch_sync(writeQueue, v11);
  int v9 = (void *)v14[5];
  if (a5 && v9) {
    *a5 = v9;
  }
  _Block_object_dispose(&v13, 8);

  return v9 == 0;
}

uint64_t __48__FPThreadedCopier_finishReading_writing_error___block_invoke(uint64_t a1)
{
  uint64_t result = close(*(_DWORD *)(a1 + 40));
  if (result == -1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)beginOperation
{
  writeQueue = self->_writeQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__FPThreadedCopier_beginOperation__block_invoke;
  v3[3] = &unk_1E5AF06F0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(writeQueue, v3);
}

void __34__FPThreadedCopier_beginOperation__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (![*(id *)(a1 + 32) numberOfInflightCopies])
  {
    int64_t v2 = [*(id *)(a1 + 32) buffers];

    if (v2)
    {
      int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"FPThreadedCopier.m" lineNumber:203 description:@"self.buffers should be nil"];
    }
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    [*(id *)(a1 + 32) setBuffers:v3];

    char v4 = 1;
    do
    {
      char v5 = v4;
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0x10000];
      BOOL v7 = [*(id *)(a1 + 32) buffers];
      [v7 addObject:v6];

      char v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInflightCopies:", objc_msgSend(*(id *)(a1 + 32), "numberOfInflightCopies") + 1);
  objc_sync_exit(obj);
}

- (void)endOperation
{
  writeQueue = self->_writeQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__FPThreadedCopier_endOperation__block_invoke;
  v3[3] = &unk_1E5AF06F0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(writeQueue, v3);
}

void __32__FPThreadedCopier_endOperation__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInflightCopies:", objc_msgSend(*(id *)(a1 + 32), "numberOfInflightCopies") - 1);
  if (![*(id *)(a1 + 32) numberOfInflightCopies])
  {
    int64_t v2 = [*(id *)(a1 + 32) buffers];

    if (!v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      [v3 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"FPThreadedCopier.m" lineNumber:221 description:@"self.buffers should be non-nil"];
    }
    [*(id *)(a1 + 32) setBuffers:0];
  }
  objc_sync_exit(obj);
}

- (int64_t)numberOfInflightCopies
{
  return self->_numberOfInflightCopies;
}

- (void)setNumberOfInflightCopies:(int64_t)a3
{
  self->_numberOfInflightCopies = a3;
}

- (OS_dispatch_semaphore)bufferLimitSemaphore
{
  return self->_bufferLimitSemaphore;
}

- (void)setBufferLimitSemaphore:(id)a3
{
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_buffers, 0);

  objc_storeStrong((id *)&self->_bufferLimitSemaphore, 0);
}

@end