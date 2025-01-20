@interface GCFuture
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)cancelledFuture;
+ (id)futureOnQueue:(id)a3 withBlock:(id)a4;
+ (id)futureOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5;
+ (id)futureWithBlock:(id)a3;
+ (id)futureWithError:(id)a3;
+ (id)futureWithLabel:(id)a3 block:(id)a4;
+ (id)futureWithLabel:(id)a3 onQueue:(id)a4 block:(id)a5;
+ (id)futureWithOptions:(unsigned int)a3 block:(id)a4;
+ (id)futureWithResult:(id)a3;
- (BOOL)_checkFinished:(BOOL)a3;
- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5;
- (BOOL)isFinished;
- (GCFuture)init;
- (GCFuture)initWithError:(id)a3;
- (GCFuture)initWithResult:(id)a3;
- (NSString)label;
- (id)_init;
- (id)_thenRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9;
- (id)_thenSynchronouslyRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9;
- (id)debugDescription;
- (id)description;
- (id)error;
- (id)initCancelled;
- (id)initOnQueue:(id)a3 withBlock:(id)a4;
- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5;
- (id)result;
- (id)resultIfFinished;
- (id)thenOnQueue:(id)a3 with:(id)a4;
- (id)thenOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 label:(id)a7 block:(id)a8;
- (id)thenOnQueue:(id)a3 withResult:(id)a4;
- (id)thenSynchronouslyOnQueue:(id)a3 with:(id)a4;
- (id)thenSynchronouslyOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 label:(id)a7 block:(id)a8;
- (id)thenSynchronouslyWith:(id)a3;
- (id)thenSynchronouslyWithResult:(id)a3;
- (id)thenWith:(id)a3;
- (id)thenWithResult:(id)a3;
- (int64_t)waitForResult:(id *)a3 error:(id *)a4;
- (int64_t)waitUntilFinished;
- (unint64_t)_creatorFrame;
- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7;
- (void)cancel;
- (void)dealloc;
- (void)failWithError:(void *)a1;
- (void)observeCancellation:(id)a3;
- (void)observeFailure:(id)a3;
- (void)observeFinish:(id)a3;
- (void)observeFinishOnQueue:(id)a3 withBlock:(id)a4;
- (void)observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5;
- (void)observeFinishWithOptions:(unsigned int)a3 block:(id)a4;
- (void)observeSuccess:(id)a3;
- (void)observeSuccessOnQueue:(id)a3 withBlock:(id)a4;
- (void)setLabel:(id)a3;
- (void)succeedWithResult:(void *)a1;
@end

@implementation GCFuture

+ (id)futureWithBlock:(id)a3
{
  id v4 = a3;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  id v5 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], 0, 0, v4);

  return v5;
}

+ (id)futureWithOptions:(unsigned int)a3 block:(id)a4
{
  char v5 = a3;
  id v6 = a4;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v4);
  id v7 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], 0, v5, v6);

  return v7;
}

+ (id)futureWithLabel:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v4);
  id v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], 0, 0, v7);
  [v8 setLabel:v6];

  return v8;
}

+ (id)futureWithLabel:(id)a3 onQueue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v5);
  id v11 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], v9, 0, v10);
  [v11 setLabel:v8];

  return v11;
}

+ (id)futureOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v4);
  id v8 = [(GCFuture *)[_GCAsyncFuture alloc] initOnQueue:v6 withBlock:v7];

  return v8;
}

+ (id)futureOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v5);
  id v10 = [(GCFuture *)[_GCAsyncFuture alloc] initOnQueue:v8 withOptions:v7 block:v9];

  return v10;
}

+ (id)futureWithError:(id)a3
{
  id v4 = a3;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  char v5 = [(GCFuture *)[_GCStaticFuture alloc] initWithError:v4];

  return v5;
}

+ (id)futureWithResult:(id)a3
{
  id v4 = a3;
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  char v5 = [(GCFuture *)[_GCStaticFuture alloc] initWithResult:v4];

  return v5;
}

+ (id)cancelledFuture
{
  if (+[GCFuture cancelledFuture]::onceToken != -1) {
    dispatch_once(&+[GCFuture cancelledFuture]::onceToken, &__block_literal_global_14);
  }
  v2 = (void *)+[GCFuture cancelledFuture]::CancelledFuture;

  return v2;
}

uint64_t __27__GCFuture_cancelledFuture__block_invoke()
{
  +[GCFuture cancelledFuture]::CancelledFuture = [(GCFuture *)[_GCStaticFuture alloc] initCancelled];

  return MEMORY[0x270F9A758]();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    if (__creatorFrameKey(void)::onceToken != -1) {
      dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
    }
    pthread_setspecific(__creatorFrameKey(void)::key, v3);
    __immutablePlaceholderFuture();
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GCFuture;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (id)alloc
{
  if ((id)objc_opt_class() == a1)
  {
    if (__creatorFrameKey(void)::onceToken != -1) {
      dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
    }
    pthread_setspecific(__creatorFrameKey(void)::key, v2);
    __immutablePlaceholderFuture();
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___GCFuture;
    return objc_msgSendSuper2(&v5, sel_allocWithZone_, 0);
  }
}

- (GCFuture)init
{
  return 0;
}

- (id)_init
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)GCFuture;
    result = objc_msgSendSuper2(&v1, sel_init);
    *((_DWORD *)result + 2) = 0;
    *((unsigned char *)result + 12) = -2;
  }
  return result;
}

- (GCFuture)initWithResult:(id)a3
{
  id v4 = a3;
  objc_super v5 = (GCFuture *)-[_GCStaticFuture _initWithResult:]([_GCStaticFuture alloc], v4);

  return v5;
}

- (GCFuture)initWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = (GCFuture *)-[_GCStaticFuture _initWithError:]([_GCStaticFuture alloc], v4);

  return v5;
}

- (id)initCancelled
{
  inited = -[_GCStaticFuture _initCancelled]([_GCStaticFuture alloc]);

  return inited;
}

- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], v8, v6, v9);

  return v10;
}

- (id)initOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:]([_GCAsyncFuture alloc], v6, 0, v7);

  return v8;
}

- (void)dealloc
{
  unsigned int state = self->_state;
  if (state >= 3 && state != 254)
  {
    objc_super v5 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    id v6 = [(GCFuture *)self debugDescription];
    [v5 handleFailureInMethod:a2, self, @"GCFuture.mm", 580, @"Future deallocated without finishing: %@", v6 object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)GCFuture;
  [(GCFuture *)&v7 dealloc];
}

- (unint64_t)_creatorFrame
{
  return 0;
}

- (id)debugDescription
{
  v3 = [(GCFuture *)self label];
  unint64_t v4 = self->_state + 2;
  if (v4 > 4) {
    objc_super v5 = 0;
  }
  else {
    objc_super v5 = off_26BEC5008[v4];
  }
  id v6 = [(GCFuture *)self _creatorFrame];
  id v7 = objc_alloc((Class)&off_26BEEE998);
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = (void *)[v7 initWithFormat:@"<%@ %p", v9, self];

  if (v3) {
    [v10 appendFormat:@" '%@'", v3];
  }
  if (v6)
  {
    if (dladdr(v6, &v16))
    {
      if (v16.dli_fname)
      {
        id v11 = +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:");
        v12 = [v11 componentsSeparatedByString:@"/"];
        v13 = [v12 lastObject];
      }
      else
      {
        v13 = 0;
      }
      if (v16.dli_sname) {
        [v10 appendFormat:@" @0x%lx %@+%zu %s+%zu", v6, v13, v6 - (char *)v16.dli_fbase, v16.dli_sname, v6 - (char *)v16.dli_saddr];
      }
      else {
        [v10 appendFormat:@" @0x%lx %@+%zu", v6, v13, v6 - (char *)v16.dli_fbase];
      }
    }
    else
    {
      objc_msgSend(v10, "appendFormat:", @" @0x%lx", v6);
    }
  }
  [v10 appendFormat:@" [%@]", v5];
  if (self->_state == 1)
  {
    v14 = [*(id *)&self->_flags localizedDescription];
    [v10 appendFormat:@": '%@'", v14];
  }
  [v10 appendString:@">"];

  return v10;
}

- (id)description
{
  v3 = [(GCFuture *)self label];
  unint64_t v4 = [(GCFuture *)self _creatorFrame];
  unint64_t v5 = v4;
  switch(self->_state)
  {
    case 0xFF:
      if (v4 && v3)
      {
        id v11 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v11);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ '%@' @0x%lx [running]>", v7, v3, v5];
        goto LABEL_45;
      }
      if (v4)
      {
        v22 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v22);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ @0x%lx [running]>", v7, v5];
        goto LABEL_45;
      }
      v28 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v28);
      if (v3) {
        +[NSString stringWithFormat:@"<%@ '%@' [running]>", v7, v3];
      }
      else {
        +[NSString stringWithFormat:@"<%@ [running]>", v7];
      }
      goto LABEL_38;
    case 0:
      if (v4 && v3)
      {
        id v9 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v9);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ '%@' @0x%lx [cancelled]>", v7, v3, v5];
        goto LABEL_45;
      }
      if (v4)
      {
        v17 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v17);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ @0x%lx [cancelled]>", v7, v5];
        goto LABEL_45;
      }
      v23 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v23);
      if (v3) {
        +[NSString stringWithFormat:@"<%@ '%@' [cancelled]>", v7, v3];
      }
      else {
        +[NSString stringWithFormat:@"<%@ [cancelled]>", v7];
      }
      goto LABEL_38;
    case 1:
      if (v4 && v3)
      {
        v12 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v12);
        v13 = [*(id *)&self->_flags domain];
        uint64_t v14 = [*(id *)&self->_flags code];
        v15 = [*(id *)&self->_flags localizedDescription];
        uint64_t v16 = +[NSString stringWithFormat:@"<%@ '%@' @0x%lx [failed]: %@/%zu '%@'>", v7, v3, v5, v13, v14, v15];
      }
      else if (v4)
      {
        v19 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v19);
        v13 = [*(id *)&self->_flags domain];
        uint64_t v20 = [*(id *)&self->_flags code];
        v15 = [*(id *)&self->_flags localizedDescription];
        uint64_t v16 = +[NSString stringWithFormat:@"<%@ @0x%lx [failed]: %@/%zu '%@'>", v7, v5, v13, v20, v15];
      }
      else
      {
        v25 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v25);
        v13 = [*(id *)&self->_flags domain];
        uint64_t v26 = [*(id *)&self->_flags code];
        v15 = [*(id *)&self->_flags localizedDescription];
        if (v3) {
          +[NSString stringWithFormat:@"<%@ '%@' [failed]: %@/%zu '%@'>", v7, v3, v13, v26, v15];
        }
        else {
        uint64_t v16 = +[NSString stringWithFormat:@"<%@ [failed]: %@/%zu '%@'>", v7, v13, v26, v15];
        }
      }
      v29 = (void *)v16;

      goto LABEL_46;
    case 2:
      if (v4 && v3)
      {
        id v10 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v10);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ '%@' @0x%lx [succeeded]>", v7, v3, v5];
        goto LABEL_45;
      }
      if (v4)
      {
        v18 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v18);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ @0x%lx [succeeded]>", v7, v5];
        goto LABEL_45;
      }
      v24 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v24);
      if (v3) {
        +[NSString stringWithFormat:@"<%@ '%@' [succeeded]>", v7, v3];
      }
      else {
        +[NSString stringWithFormat:@"<%@ [succeeded]>", v7];
      }
      goto LABEL_38;
    default:
      if (v4 && v3)
      {
        id v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ '%@' @0x%lx [pending]>", v7, v3, v5];
      }
      else if (v4)
      {
        v21 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v21);
        uint64_t v8 = +[NSString stringWithFormat:@"<%@ @0x%lx [pending]>", v7, v5];
      }
      else
      {
        v27 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v27);
        if (v3) {
          +[NSString stringWithFormat:@"<%@ '%@' [pending]>", v7, v3];
        }
        else {
          +[NSString stringWithFormat:@"<%@ [pending]>", v7];
        }
        uint64_t v8 = LABEL_38:;
      }
LABEL_45:
      v29 = (void *)v8;
LABEL_46:

      return v29;
  }
}

- (BOOL)_checkFinished:(BOOL)a3
{
  return 1;
}

- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  switch(a3)
  {
    case -2:
      v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v12 handleFailureInMethod:a2, self, @"GCFuture.mm", 704, @"Attempted to transition to the pending state.\n%@", self object file lineNumber description];
      goto LABEL_14;
    case -1:
      v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v12 handleFailureInMethod:a2, self, @"GCFuture.mm", 708, @"Attempted to transition to the running state.\n%@", self object file lineNumber description];
      goto LABEL_14;
    case 0:
      atomic_store(1u, (unsigned __int8 *)&self->_state + 3);
      if (!v10)
      {
        if (!v9) {
          goto LABEL_15;
        }
        goto LABEL_8;
      }
      v18 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v18 handleFailureInMethod:a2, self, @"GCFuture.mm", 713, @"Attempted to transition to the cancelled state, but provided an error (%@).\n%@", v11, self object file lineNumber description];

      if (v9)
      {
LABEL_8:
        v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
        [v12 handleFailureInMethod:a2, self, @"GCFuture.mm", 714, @"Attempted to transition to the cancelled state, but provided a result (%@).\n%@", v9, self object file lineNumber description];
        goto LABEL_14;
      }
      goto LABEL_15;
    case 1:
      if (v10)
      {
        if (!v9) {
          goto LABEL_15;
        }
        goto LABEL_11;
      }
      v19 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v19 handleFailureInMethod:a2, self, @"GCFuture.mm", 718, @"Attempted to transition to the failed state, but did not provide an error.\n%@", self object file lineNumber description];

      if (v9)
      {
LABEL_11:
        v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
        [v12 handleFailureInMethod:a2, self, @"GCFuture.mm", 719, @"Attempted to transition to the failed state, but provided a result (%@).\n%@", v9, self object file lineNumber description];
        goto LABEL_14;
      }
LABEL_15:
      os_unfair_lock_lock_with_options();
      switch(self->_state)
      {
        case 0xFE:
        case 0xFF:
          self->_unsigned int state = a3;
          if (v9) {
            v13 = v9;
          }
          else {
            v13 = v11;
          }
          objc_storeStrong((id *)&self->_flags, v13);
          __dmb(0xBu);
          os_unfair_lock_unlock(&self->_lock);
          BOOL v14 = 1;
          goto LABEL_27;
        case 1:
          os_unfair_lock_unlock(&self->_lock);
          if (a3 == 2)
          {
            v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
            [v15 handleFailureInMethod:a2, self, @"GCFuture.mm", 760, @"Attempted to transition to the succeeded state from the failed state.\n%@", self object file lineNumber description];
          }
          else
          {
            if (a3 != 1) {
              goto LABEL_26;
            }
            v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
            [v15 handleFailureInMethod:a2, self, @"GCFuture.mm", 761, @"Attempted to transition to the failed state twice.\n%@", self object file lineNumber description];
          }
          goto LABEL_37;
        case 2:
          os_unfair_lock_unlock(&self->_lock);
          if (a3 == 2)
          {
            v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
            [v15 handleFailureInMethod:a2, self, @"GCFuture.mm", 768, @"Attempted to transition to the succeeded state twice.\n%@", self object file lineNumber description];
          }
          else
          {
            if (a3 != 1) {
              goto LABEL_26;
            }
            v15 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
            [v15 handleFailureInMethod:a2, self, @"GCFuture.mm", 769, @"Attempted to transition to the failed state from the succeeded state.\n%@", self object file lineNumber description];
          }
LABEL_37:

LABEL_26:
          BOOL v14 = 0;
LABEL_27:

          return v14;
        default:
          os_unfair_lock_unlock(&self->_lock);
          goto LABEL_26;
      }
    case 2:
      if (v10)
      {
        v17 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
        [v17 handleFailureInMethod:a2, self, @"GCFuture.mm", 723, @"Attempted to transition to the succeeded state, but provided an error (%@).\n%@", v9, self object file lineNumber description];

        if (v9) {
          goto LABEL_15;
        }
      }
      else if (v9)
      {
        goto LABEL_15;
      }
      v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v12 handleFailureInMethod:a2, self, @"GCFuture.mm", 724, @"Attempted to transition to the succeeded state, but did not provide a result.\n%@", self object file lineNumber description];
LABEL_14:

      goto LABEL_15;
    default:
      v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v12 handleFailureInMethod:a2, self, @"GCFuture.mm", 728, @"Attempted to transition to an invalid state (%ld).\n%@", a3, self object file lineNumber description];
      goto LABEL_14;
  }
}

- (void)succeedWithResult:(void *)a1
{
  id v3 = a2;
  if (a1) {
    [a1 _setState:2 result:v3 error:0];
  }
}

- (void)failWithError:(void *)a1
{
  id v3 = a2;
  if (a1) {
    [a1 _setState:1 result:0 error:v3];
  }
}

- (void)cancel
{
}

- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7
{
  char v10 = a4;
  v13 = a3;
  id v14 = a7;
  if (!v14)
  {
    v25 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 796, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  if (![(GCFuture *)self _checkFinished:0])
  {
    uint64_t v26 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 797, @"Subclass must implement %s", sel_getName(a2));
  }
  uint64_t state = self->_state;
  if (state == 2) {
    id v16 = *(id *)&self->_flags;
  }
  else {
    id v16 = 0;
  }
  if (self->_state == 1) {
    id v17 = *(id *)&self->_flags;
  }
  else {
    id v17 = 0;
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = __78__GCFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke;
  aBlock[3] = &unk_26BEC4D90;
  id v30 = v14;
  uint64_t v31 = state;
  if ((v10 & 4) != 0) {
    dispatch_block_flags_t v18 = v10 & 2 | 0x24;
  }
  else {
    dispatch_block_flags_t v18 = (unint64_t)(v10 & 2);
  }
  id v28 = v16;
  id v29 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v14;
  v22 = _Block_copy(aBlock);
  if (v13)
  {
    if (a5 && v18)
    {
      dispatch_block_t v23 = dispatch_block_create_with_qos_class(v18, (dispatch_qos_class_t)a5, a6, v22);
    }
    else
    {
      if (!v18)
      {
LABEL_22:
        dispatch_async(v13, v22);
        goto LABEL_23;
      }
      dispatch_block_t v23 = dispatch_block_create(v18, v22);
    }
    dispatch_block_t v24 = v23;

    v22 = v24;
    goto LABEL_22;
  }
  dispatch_block_perform(v18, v22);
LABEL_23:
}

uint64_t __78__GCFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke(uint64_t a1)
{
  return __GCFUTURE_IS_CALLING_OUT_TO_AN_OBSERVER__(*(void *)(a1 + 48));
}

- (void)observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
}

- (void)observeFinishOnQueue:(id)a3 withBlock:(id)a4
{
}

- (void)observeFinishWithOptions:(unsigned int)a3 block:(id)a4
{
}

- (void)observeFinish:(id)a3
{
}

- (void)observeSuccess:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __27__GCFuture_observeSuccess___block_invoke;
  v5[3] = &unk_26BEC4DB8;
  id v6 = a3;
  id v4 = v6;
  [(GCFuture *)self observeFinish:v5];
}

void __27__GCFuture_observeSuccess___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)observeSuccessOnQueue:(id)a3 withBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__GCFuture_observeSuccessOnQueue_withBlock___block_invoke;
  v7[3] = &unk_26BEC4DB8;
  id v8 = a4;
  id v6 = v8;
  [(GCFuture *)self observeFinishOnQueue:a3 withBlock:v7];
}

void __44__GCFuture_observeSuccessOnQueue_withBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)observeFailure:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __27__GCFuture_observeFailure___block_invoke;
  v5[3] = &unk_26BEC4DB8;
  id v6 = a3;
  id v4 = v6;
  [(GCFuture *)self observeFinish:v5];
}

void __27__GCFuture_observeFailure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2 == 1) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)observeCancellation:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __32__GCFuture_observeCancellation___block_invoke;
  v5[3] = &unk_26BEC4DB8;
  id v6 = a3;
  id v4 = v6;
  [(GCFuture *)self observeFinish:v5];
}

uint64_t __32__GCFuture_observeCancellation___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (BOOL)isFinished
{
  return [(GCFuture *)self _checkFinished:0];
}

- (id)resultIfFinished
{
  if ([(GCFuture *)self _checkFinished:0] && self->_state == 2) {
    id v3 = *(id *)&self->_flags;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (int64_t)waitUntilFinished
{
  return self->_state;
}

- (int64_t)waitForResult:(id *)a3 error:(id *)a4
{
  [(GCFuture *)self _checkFinished:1];
  int64_t state = self->_state;
  if (self->_state)
  {
    if (state == 1)
    {
      if (a4) {
        *a4 = *(id *)&self->_flags;
      }
    }
    else if (a3)
    {
      if (state == 2) {
        id v8 = *(id *)&self->_flags;
      }
      else {
        id v8 = 0;
      }
      *a3 = v8;
    }
  }
  return state;
}

- (id)error
{
  [(GCFuture *)self _checkFinished:1];
  if (self->_state == 1) {
    id v3 = *(id *)&self->_flags;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)result
{
  [(GCFuture *)self _checkFinished:1];
  if (self->_state == 2) {
    id v3 = *(id *)&self->_flags;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_thenRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9
{
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  if (!v18)
  {
    dispatch_block_t v24 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 940, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  id v19 = [_GCAsyncFuture alloc];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke;
  v25[3] = &unk_26BEC4E30;
  v25[4] = self;
  id v20 = v16;
  unsigned int v30 = a5;
  unsigned int v31 = a6;
  int v32 = a7;
  id v26 = v20;
  int64_t v28 = a3;
  id v21 = v18;
  id v27 = v21;
  SEL v29 = a2;
  id v22 = [(GCFuture *)v19 initOnQueue:0 withOptions:0 block:v25];

  return v22;
}

void __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  uint64_t v7 = *(unsigned int *)(a1 + 76);
  uint64_t v8 = *(unsigned int *)(a1 + 80);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2;
  v13[3] = &unk_26BEC4E08;
  id v9 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  v13[4] = v4;
  id v14 = v3;
  id v10 = v9;
  uint64_t v11 = *(void *)(a1 + 64);
  id v15 = v10;
  uint64_t v17 = v11;
  id v12 = v3;
  [v4 observeFinishOnQueue:v5 withOptions:v6 qosClass:v7 relativePriority:v8 block:v13];
}

void __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10 == 2)
  {
    if (a2 == 2) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if (v10 == 1)
  {
    if (a2 == 1) {
      goto LABEL_9;
    }
LABEL_12:
    id v12 = [*(id *)(a1 + 40) future];
    [v12 _setState:a2 result:v7 error:v8];

    goto LABEL_13;
  }
  if (!v10 && a2) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!v11)
  {
    v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"GCFuture.mm" lineNumber:972 description:@"Assertion failed: next != nullptr"];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3;
  v14[3] = &unk_26BEC4DE0;
  id v15 = *(id *)(a1 + 40);
  [v11 observeFinish:v14];

LABEL_13:
}

void __90__GCFuture__thenRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) future];
  [v8 _setState:a2 result:v9 error:v7];
}

- (id)_thenSynchronouslyRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9
{
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  if (!v18)
  {
    dispatch_block_t v24 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 988, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  id v19 = [_GCAsyncFuture alloc];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke;
  v25[3] = &unk_26BEC4E80;
  v25[4] = self;
  id v20 = v16;
  unsigned int v29 = a5;
  unsigned int v30 = a6;
  int v31 = a7;
  id v26 = v20;
  int64_t v28 = a3;
  id v21 = v18;
  id v27 = v21;
  id v22 = [(GCFuture *)v19 initOnQueue:0 withOptions:0 block:v25];

  return v22;
}

void __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 64);
  uint64_t v7 = *(unsigned int *)(a1 + 68);
  uint64_t v8 = *(unsigned int *)(a1 + 72);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2;
  v11[3] = &unk_26BEC4E58;
  id v9 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  v11[4] = v4;
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  [v4 observeFinishOnQueue:v5 withOptions:v6 qosClass:v7 relativePriority:v8 block:v11];
}

void __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  unint64_t v10 = *(void *)(a1 + 56);
  if (v10 > 2 || v10 == a2)
  {
    if (!a2) {
      [*(id *)(a1 + 40) cancel];
    }
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = [*(id *)(a1 + 40) future];
    id v20 = v12;
    id v15 = (*(void (**)(uint64_t, uint64_t, id, uint64_t, id *))(v13 + 16))(v13, a2, v7, (uint64_t)v14 + 15, &v20);
    id v16 = v20;

    id v17 = [*(id *)(a1 + 40) future];
    LOBYTE(v12) = atomic_load_explicit(v17 + 15, memory_order_acquire);

    if (v12)
    {
      id v18 = [*(id *)(a1 + 40) future];
      [v18 _setState:0 result:0 error:0];
    }
    else if (v15)
    {
      id v18 = [*(id *)(a1 + 40) future];
      [v18 _setState:2 result:v15 error:0];
    }
    else
    {
      if (!v16) {
        __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1();
      }
      id v18 = [*(id *)(a1 + 40) future];
      [v18 _setState:1 result:0 error:v16];
    }
  }
  else
  {
    id v19 = [*(id *)(a1 + 40) future];
    [v19 _setState:a2 result:v7 error:v8];
  }
}

- (id)thenOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 label:(id)a7 block:(id)a8
{
  id v8 = [(GCFuture *)self _thenRequiringState:-128 onQueue:a3 withOptions:*(void *)&a4 qosClass:*(void *)&a5 relativePriority:*(void *)&a6 label:a7 block:a8];

  return v8;
}

- (id)thenWith:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v10 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1039, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  uint64_t v6 = [_GCAsyncFuture alloc];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __21__GCFuture_thenWith___block_invoke;
  v11[3] = &unk_26BEC4ED0;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  SEL v13 = a2;
  id v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v6, 0, 0, v11);

  return v8;
}

void __21__GCFuture_thenWith___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __21__GCFuture_thenWith___block_invoke_2;
  v8[3] = &unk_26BEC4EA8;
  v8[4] = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v9 = v3;
  id v7 = v3;
  [v4 observeFinish:v8];
}

void __21__GCFuture_thenWith___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!v3)
  {
    id v4 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v4 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"GCFuture.mm" lineNumber:1048 description:@"Assertion failed: next != nullptr"];
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __21__GCFuture_thenWith___block_invoke_3;
  v5[3] = &unk_26BEC4DE0;
  id v6 = *(id *)(a1 + 40);
  [v3 observeFinish:v5];
}

void __21__GCFuture_thenWith___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) future];
  [v8 _setState:a2 result:v9 error:v7];
}

- (id)thenWithResult:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1057, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  id v6 = [_GCAsyncFuture alloc];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __27__GCFuture_thenWithResult___block_invoke;
  v11[3] = &unk_26BEC4ED0;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  SEL v13 = a2;
  id v8 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v6, 0, 0, v11);

  return v8;
}

void __27__GCFuture_thenWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __27__GCFuture_thenWithResult___block_invoke_2;
  v8[3] = &unk_26BEC4E58;
  v8[4] = v4;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v4 observeFinish:v8];
}

void __27__GCFuture_thenWithResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  if (a2 == 2)
  {
    id v10 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!v10)
    {
      uint64_t v11 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v11 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"GCFuture.mm" lineNumber:1074 description:@"Assertion failed: next != nullptr"];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __27__GCFuture_thenWithResult___block_invoke_3;
    v12[3] = &unk_26BEC4DE0;
    id v13 = *(id *)(a1 + 40);
    [v10 observeFinish:v12];
  }
  else if (a2 == 1)
  {
    [*(id *)(a1 + 40) failWithError:v8];
  }
  else
  {
    [*(id *)(a1 + 40) cancel];
  }
}

void __27__GCFuture_thenWithResult___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) future];
  [v8 _setState:a2 result:v9 error:v7];
}

- (id)thenOnQueue:(id)a3 with:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v14 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1088, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  id v9 = [_GCAsyncFuture alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __29__GCFuture_thenOnQueue_with___block_invoke;
  v15[3] = &unk_26BEC4EF8;
  v15[4] = self;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  SEL v18 = a2;
  id v12 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v9, 0, 0, v15);

  return v12;
}

void __29__GCFuture_thenOnQueue_with___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __29__GCFuture_thenOnQueue_with___block_invoke_2;
  v9[3] = &unk_26BEC4EA8;
  v9[4] = v4;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v11 = v6;
  uint64_t v12 = v7;
  id v10 = v3;
  id v8 = v3;
  [v4 observeFinishOnQueue:v5 withBlock:v9];
}

void __29__GCFuture_thenOnQueue_with___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!v3)
  {
    id v4 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v4 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"GCFuture.mm" lineNumber:1097 description:@"Assertion failed: next != nullptr"];
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __29__GCFuture_thenOnQueue_with___block_invoke_3;
  v5[3] = &unk_26BEC4DE0;
  id v6 = *(id *)(a1 + 40);
  [v3 observeFinish:v5];
}

void __29__GCFuture_thenOnQueue_with___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) future];
  [v8 _setState:a2 result:v9 error:v7];
}

- (id)thenOnQueue:(id)a3 withResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v14 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1106, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  id v9 = [_GCAsyncFuture alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __35__GCFuture_thenOnQueue_withResult___block_invoke;
  v15[3] = &unk_26BEC4EF8;
  v15[4] = self;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  SEL v18 = a2;
  id v12 = -[_GCAsyncFuture _initOnQueue:withOptions:block:](v9, 0, 0, v15);

  return v12;
}

void __35__GCFuture_thenOnQueue_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __35__GCFuture_thenOnQueue_withResult___block_invoke_2;
  v9[3] = &unk_26BEC4E58;
  v9[4] = v4;
  id v10 = v3;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v4 observeFinishOnQueue:v5 withBlock:v9];
}

void __35__GCFuture_thenOnQueue_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  if (a2 == 2)
  {
    id v10 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!v10)
    {
      id v11 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v11 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"GCFuture.mm" lineNumber:1123 description:@"Assertion failed: next != nullptr"];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __35__GCFuture_thenOnQueue_withResult___block_invoke_3;
    v12[3] = &unk_26BEC4DE0;
    id v13 = *(id *)(a1 + 40);
    [v10 observeFinish:v12];
  }
  else if (a2 == 1)
  {
    [*(id *)(a1 + 40) failWithError:v8];
  }
  else
  {
    [*(id *)(a1 + 40) cancel];
  }
}

void __35__GCFuture_thenOnQueue_withResult___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) future];
  [v8 _setState:a2 result:v9 error:v7];
}

- (id)thenSynchronouslyOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 label:(id)a7 block:(id)a8
{
  id v8 = [(GCFuture *)self _thenSynchronouslyRequiringState:-128 onQueue:a3 withOptions:*(void *)&a4 qosClass:*(void *)&a5 relativePriority:*(void *)&a6 label:a7 block:a8];

  return v8;
}

- (id)thenSynchronouslyOnQueue:(id)a3 with:(id)a4
{
  id v4 = [(GCFuture *)self _thenSynchronouslyRequiringState:-128 onQueue:a3 withOptions:0 qosClass:0 relativePriority:0 label:0 block:a4];

  return v4;
}

- (id)thenSynchronouslyWith:(id)a3
{
  id v3 = [(GCFuture *)self _thenSynchronouslyRequiringState:-128 onQueue:0 withOptions:0 qosClass:0 relativePriority:0 label:0 block:a3];

  return v3;
}

- (id)thenSynchronouslyWithResult:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __40__GCFuture_thenSynchronouslyWithResult___block_invoke;
  v7[3] = &unk_26BEC4F20;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = [(GCFuture *)self _thenSynchronouslyRequiringState:-128 onQueue:0 withOptions:0 qosClass:0 relativePriority:0 label:0 block:v7];

  return v5;
}

id __40__GCFuture_thenSynchronouslyWithResult___block_invoke(uint64_t a1)
{
  objc_super v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v1;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultOrError, 0);

  objc_storeStrong((id *)&self->_flags, 0);
}

void __103__GCFuture__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but block did not return a result or an error.";
  __break(1u);
}

@end