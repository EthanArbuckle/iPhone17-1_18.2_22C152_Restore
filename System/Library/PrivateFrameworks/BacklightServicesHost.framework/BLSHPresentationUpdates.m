@interface BLSHPresentationUpdates
- (BLSHPresentationUpdates)initWithStartDate:(id)a3 updates:(id)a4 nextUpdatesStart:(id)a5;
- (BOOL)isCompleted;
- (BOOL)isValidWithNowDate:(id)a3;
- (NSDate)nextUpdatesStart;
- (id)dequeueAllUpdates;
- (id)dequeueNextUpdate;
- (id)description;
- (id)invalidate;
- (id)peekNextUpdate;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation BLSHPresentationUpdates

- (BLSHPresentationUpdates)initWithStartDate:(id)a3 updates:(id)a4 nextUpdatesStart:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLSHPresentationUpdates;
  v12 = [(BLSHPresentationUpdates *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_startDate, a3);
    uint64_t v14 = [v10 mutableCopy];
    updates = v13->_updates;
    v13->_updates = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v13->_nextUpdatesStart, a5);
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"BLSHPresentationUpdates.m";
  __int16 v16 = 1024;
  int v17 = 37;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BOOL)isCompleted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_updates count] == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableArray *)self->_updates count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dequeueNextUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = [(NSMutableArray *)self->_updates firstObject];
    if (v4) {
      [(NSMutableArray *)self->_updates removeObjectAtIndex:0];
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)dequeueAllUpdates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = (void *)[(NSMutableArray *)self->_updates copy];
  [(NSMutableArray *)self->_updates removeAllObjects];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isValidWithNowDate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated) {
    char v6 = 0;
  }
  else {
    char v6 = objc_msgSend(v4, "bls_isOnOrAfter:andOnOrBefore:", self->_startDate, self->_nextUpdatesStart);
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)peekNextUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_updates count])
  {
    id v4 = [(NSMutableArray *)self->_updates firstObject];
    v5 = [v4 presentationDate];
  }
  else
  {
    v5 = self->_nextUpdatesStart;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_updates count])
  {
    id v4 = [(NSMutableArray *)self->_updates firstObject];
    v5 = [v4 presentationDate];
  }
  else
  {
    v5 = self->_nextUpdatesStart;
  }
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NSDate *)self->_startDate bls_shortLoggingString];
  [v3 appendString:v4 withName:@"start"];

  v5 = [(NSDate *)self->_nextUpdatesStart bls_shortLoggingString];
  [v3 appendString:v5 withName:@"nextStart"];

  char v6 = [(NSMutableArray *)self->_updates bls_boundedDescription];
  [v3 appendString:v6 withName:@"updates"];

  id v7 = (id)[v3 appendBool:self->_invalidated withName:@"invalidated" ifEqualTo:1];
  int v8 = [v3 build];

  return v8;
}

- (NSDate)nextUpdatesStart
{
  return self->_nextUpdatesStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUpdatesStart, 0);
  objc_storeStrong((id *)&self->_updates, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end