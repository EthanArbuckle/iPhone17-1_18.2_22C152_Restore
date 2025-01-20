@interface BWDeferredDataIntermediate
- (id)description;
- (id)fetchAndRetain:(int *)a3;
- (id)fetchWithCustomClassesAndRetain:(id)a3 err:(int *)a4;
- (int)setArchive:(id)a3;
- (uint64_t)_setURL:(NSObject *)a3 prefetchQueue:;
- (void)dealloc;
@end

@implementation BWDeferredDataIntermediate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredDataIntermediate;
  [(BWDeferredIntermediate *)&v3 dealloc];
}

- (uint64_t)_setURL:(NSObject *)a3 prefetchQueue:
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      if (*(void *)(result + 152) || *(void *)(result + 128))
      {
        FigDebugAssert3();
        return 4294951161;
      }
      else
      {
        *(void *)(result + 128) = [a2 copy];
        if (a3)
        {
          *(unsigned char *)(v3 + 144) = 1;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __52__BWDeferredDataIntermediate__setURL_prefetchQueue___block_invoke;
          block[3] = &unk_1E5C24430;
          block[4] = v3;
          dispatch_async(a3, block);
        }
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return 4294951162;
    }
  }
  return result;
}

uint64_t __52__BWDeferredDataIntermediate__setURL_prefetchQueue___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  v2 = (void *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(*(void *)(a1 + 32) + 128) options:0 error:&v4];
  if (v4) {
    FigDebugAssert3();
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  if (!v4) {
    *(void *)(*(void *)(a1 + 32) + 152) = v2;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 0;
  pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 72));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
}

- (int)setArchive:(id)a3
{
  return -16136;
}

- (id)fetchAndRetain:(int *)a3
{
  return [(BWDeferredDataIntermediate *)self fetchWithCustomClassesAndRetain:0 err:a3];
}

- (id)fetchWithCustomClassesAndRetain:(id)a3 err:(int *)a4
{
  if (a4) {
    *a4 = -16136;
  }
  return 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: tag:%@ data:%@", objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_archive];
}

@end