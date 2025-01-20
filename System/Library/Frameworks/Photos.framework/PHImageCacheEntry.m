@interface PHImageCacheEntry
- (BOOL)hasImageRef;
- (BOOL)isCancelled;
- (CGImage)createImageRef;
- (NSDictionary)additionalInfo;
- (PHImageCacheEntry)init;
- (int)imageRequestIDForPopulatingCache;
- (void)_callWaiters:(id)a3 wasCancelled:(BOOL)a4;
- (void)addNotifyHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)populateWithImageRef:(CGImage *)a3 additionalInfo:(id)a4 error:(id)a5 executeBeforeNotifyingWaitersBlock:(id)a6;
- (void)prepareForReuse;
- (void)setImageRequestIDForPopulatingCache:(int)a3;
@end

@implementation PHImageCacheEntry

- (PHImageCacheEntry)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHImageCacheEntry;
  v2 = [(PHImageCacheEntry *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    handlersWaitingOnResult = v3->_handlersWaitingOnResult;
    v3->_handlersWaitingOnResult = (NSMutableArray *)v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlersWaitingOnResult, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setImageRequestIDForPopulatingCache:(int)a3
{
  self->_imageRequestIDForPopulatingCache = a3;
}

- (int)imageRequestIDForPopulatingCache
{
  return self->_imageRequestIDForPopulatingCache;
}

- (void)prepareForReuse
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  additionalInfo = self->_additionalInfo;
  self->_additionalInfo = 0;

  error = self->_error;
  self->_error = 0;

  CGImageRelease(self->_imageRef);
  self->_imageRef = 0;
  self->_isCancelled = 0;
  id v6 = (id)[(NSMutableArray *)self->_handlersWaitingOnResult copy];
  [(NSMutableArray *)self->_handlersWaitingOnResult removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  [(PHImageCacheEntry *)self _callWaiters:v6 wasCancelled:1];
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isCancelled = 1;
  id v4 = (id)[(NSMutableArray *)self->_handlersWaitingOnResult copy];
  [(NSMutableArray *)self->_handlersWaitingOnResult removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  [(PHImageCacheEntry *)self _callWaiters:v4 wasCancelled:1];
}

- (void)populateWithImageRef:(CGImage *)a3 additionalInfo:(id)a4 error:(id)a5 executeBeforeNotifyingWaitersBlock:(id)a6
{
  id v15 = a4;
  id v11 = a5;
  v12 = (void (**)(void))a6;
  os_unfair_lock_lock(&self->_lock);
  BOOL isCancelled = self->_isCancelled;
  if (!self->_isCancelled)
  {
    CGImageRetain(a3);
    CGImageRelease(self->_imageRef);
    self->_imageRef = a3;
    objc_storeStrong((id *)&self->_additionalInfo, a4);
    objc_storeStrong((id *)&self->_error, a5);
  }
  v14 = (void *)[(NSMutableArray *)self->_handlersWaitingOnResult copy];
  [(NSMutableArray *)self->_handlersWaitingOnResult removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  if (v12) {
    v12[2](v12);
  }
  [(PHImageCacheEntry *)self _callWaiters:v14 wasCancelled:isCancelled];
}

- (void)addNotifyHandler:(id)a3
{
  aBlock = (void (**)(id, CGImage *, BOOL, NSError *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_imageRef)
  {
    if (self->_isCancelled) {
      imageRef = 0;
    }
    else {
      imageRef = self->_imageRef;
    }
    BOOL isCancelled = self->_isCancelled;
    goto LABEL_8;
  }
  if (self->_isCancelled)
  {
    imageRef = 0;
    BOOL isCancelled = 1;
LABEL_8:
    aBlock[2](aBlock, imageRef, isCancelled, self->_error);
    goto LABEL_9;
  }
  handlersWaitingOnResult = self->_handlersWaitingOnResult;
  v8 = _Block_copy(aBlock);
  [(NSMutableArray *)handlersWaitingOnResult addObject:v8];

LABEL_9:
  os_unfair_lock_unlock(p_lock);
}

- (void)_callWaiters:(id)a3 wasCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void (**)(void *, CGImage *, BOOL, NSError *))_Block_copy(*(const void **)(*((void *)&v12 + 1) + 8 * v10));
        v11[2](v11, self->_imageRef, v4, self->_error);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)hasImageRef
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_imageRef) {
    BOOL v4 = !self->_isCancelled;
  }
  else {
    BOOL v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (CGImage)createImageRef
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  imageRef = self->_imageRef;
  if (imageRef)
  {
    if (self->_isCancelled) {
      imageRef = 0;
    }
    else {
      CGImageRetain(self->_imageRef);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return imageRef;
}

- (void)dealloc
{
  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PHImageCacheEntry;
  [(PHImageCacheEntry *)&v3 dealloc];
}

@end