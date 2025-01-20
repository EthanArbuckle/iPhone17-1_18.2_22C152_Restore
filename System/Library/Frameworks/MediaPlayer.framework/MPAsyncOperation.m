@interface MPAsyncOperation
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (ICUserIdentity)userIdentity;
- (MPAsyncOperation)init;
- (NSError)error;
- (void)cancel;
- (void)execute;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)setUserIdentity:(id)a3;
- (void)start;
@end

@implementation MPAsyncOperation

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (MPAsyncOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPAsyncOperation;
  result = [(MPAsyncOperation *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (ICUserIdentity)userIdentity
{
  userIdentity = self->_userIdentity;
  if (userIdentity)
  {
    objc_super v3 = userIdentity;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (NSError)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_error;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)execute
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"MPAsyncOperation.m", 84, @"Subclass %@ must implement -%@ defined in %@.", v6, v7, @"[MPAsyncOperation class]" object file lineNumber description];
  }
}

- (void)cancel
{
  [(MPAsyncOperation *)self willChangeValueForKey:@"isCancelled"];
  os_unfair_lock_lock(&self->_lock);
  self->_cancelled = 1;
  os_unfair_lock_unlock(&self->_lock);

  [(MPAsyncOperation *)self didChangeValueForKey:@"isCancelled"];
}

- (void)start
{
  [(MPAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  os_unfair_lock_lock(&self->_lock);
  self->_executing = 1;
  os_unfair_lock_unlock(&self->_lock);
  [(MPAsyncOperation *)self didChangeValueForKey:@"isExecuting"];

  [(MPAsyncOperation *)self execute];
}

- (void)finishWithError:(id)a3
{
  uint64_t v4 = (NSError *)a3;
  [(MPAsyncOperation *)self willChangeValueForKey:@"error"];
  [(MPAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  [(MPAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  os_unfair_lock_lock(&self->_lock);
  error = self->_error;
  self->_error = v4;

  self->_executing = 0;
  self->_finished = 1;
  os_unfair_lock_unlock(&self->_lock);
  [(MPAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
  [(MPAsyncOperation *)self didChangeValueForKey:@"isFinished"];

  [(MPAsyncOperation *)self didChangeValueForKey:@"error"];
}

- (void)setUserIdentity:(id)a3
{
  uint64_t v4 = (ICUserIdentity *)a3;
  userIdentity = self->_userIdentity;
  v10 = v4;
  if (userIdentity != v4)
  {
    v6 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    char v7 = [(ICUserIdentity *)userIdentity isEqualToIdentity:v10 inStore:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = (ICUserIdentity *)[(ICUserIdentity *)v10 copy];
      v9 = self->_userIdentity;
      self->_userIdentity = v8;
    }
  }
}

- (void)finish
{
}

@end