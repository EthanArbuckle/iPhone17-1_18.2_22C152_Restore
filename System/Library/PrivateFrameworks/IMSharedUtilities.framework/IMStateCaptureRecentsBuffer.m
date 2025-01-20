@interface IMStateCaptureRecentsBuffer
- (IMStateCaptureRecentsBuffer)initWithTitle:(id)a3 maximumNumberOfTrackedObjects:(unint64_t)a4 queue:(id)a5;
- (NSPointerArray)trackedObjects;
- (NSString)title;
- (unint64_t)handles;
- (unint64_t)maximumNumberOfTrackedObjects;
- (unint64_t)nextInsertionIndex;
- (void)dealloc;
- (void)promoteRecentObject:(id)a3;
- (void)registerStateCaptureBlockWithQueue:(id)a3;
- (void)setHandles:(unint64_t *)a3;
- (void)setNextInsertionIndex:(unint64_t)a3;
- (void)setTrackedObjects:(id)a3;
@end

@implementation IMStateCaptureRecentsBuffer

- (IMStateCaptureRecentsBuffer)initWithTitle:(id)a3 maximumNumberOfTrackedObjects:(unint64_t)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IMStateCaptureRecentsBuffer;
  v10 = [(IMStateCaptureRecentsBuffer *)&v18 init];
  v11 = v10;
  if (v10)
  {
    unint64_t v12 = 5;
    if (a4 < 5) {
      unint64_t v12 = a4;
    }
    v10->_maximumNumberOfTrackedObjects = v12;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    trackedObjects = v11->_trackedObjects;
    v11->_trackedObjects = (NSPointerArray *)v13;

    v11->_handles = (unint64_t *)malloc_type_calloc(v11->_maximumNumberOfTrackedObjects, 8uLL, 0x100004000313F17uLL);
    uint64_t v15 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v15;

    [(IMStateCaptureRecentsBuffer *)v11 registerStateCaptureBlockWithQueue:v9];
  }

  return v11;
}

- (void)dealloc
{
  handles = self->_handles;
  if (handles)
  {
    unint64_t maximumNumberOfTrackedObjects = self->_maximumNumberOfTrackedObjects;
    if (maximumNumberOfTrackedObjects)
    {
      for (unint64_t i = 0; i < maximumNumberOfTrackedObjects; ++i)
      {
        if (self->_handles[i])
        {
          os_state_remove_handler();
          unint64_t maximumNumberOfTrackedObjects = self->_maximumNumberOfTrackedObjects;
        }
      }
      handles = self->_handles;
    }
    free(handles);
  }
  v6.receiver = self;
  v6.super_class = (Class)IMStateCaptureRecentsBuffer;
  [(IMStateCaptureRecentsBuffer *)&v6 dealloc];
}

- (void)promoteRecentObject:(id)a3
{
  [(NSPointerArray *)self->_trackedObjects insertPointer:a3 atIndex:self->_nextInsertionIndex];
  unint64_t nextInsertionIndex = self->_nextInsertionIndex;
  if (self->_maximumNumberOfTrackedObjects != 1) {
    ++nextInsertionIndex;
  }
  self->_unint64_t nextInsertionIndex = nextInsertionIndex;
}

- (void)registerStateCaptureBlockWithQueue:(id)a3
{
  id v4 = a3;
  if (v4 || (dispatch_get_global_queue(-32768, 0), (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id location = 0;
    objc_initWeak(&location, self);
    if (self->_maximumNumberOfTrackedObjects)
    {
      unint64_t v5 = 0;
      do
      {
        objc_copyWeak(&v6, &location);
        int v7 = v5;
        self->_handles[v5] = os_state_add_handler();
        objc_destroyWeak(&v6);
        ++v5;
      }
      while (self->_maximumNumberOfTrackedObjects > v5);
    }
    objc_destroyWeak(&location);
  }
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)maximumNumberOfTrackedObjects
{
  return self->_maximumNumberOfTrackedObjects;
}

- (unint64_t)nextInsertionIndex
{
  return self->_nextInsertionIndex;
}

- (void)setNextInsertionIndex:(unint64_t)a3
{
  self->_unint64_t nextInsertionIndex = a3;
}

- (NSPointerArray)trackedObjects
{
  return self->_trackedObjects;
}

- (void)setTrackedObjects:(id)a3
{
}

- (unint64_t)handles
{
  return self->_handles;
}

- (void)setHandles:(unint64_t *)a3
{
  self->_handles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedObjects, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end