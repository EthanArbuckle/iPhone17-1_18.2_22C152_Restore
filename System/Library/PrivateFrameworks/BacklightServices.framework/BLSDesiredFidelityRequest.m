@interface BLSDesiredFidelityRequest
- (BLSDesiredFidelityRequest)initWithCompletion:(id)a3;
- (void)completeWithDesiredFidelity:(int64_t)a3;
@end

@implementation BLSDesiredFidelityRequest

- (BLSDesiredFidelityRequest)initWithCompletion:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSDesiredFidelityRequest;
  v5 = [(BLSDesiredFidelityRequest *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = MEMORY[0x1BA99C630](v4);
    id completion = v6->_completion;
    v6->_id completion = (id)v7;
  }
  return v6;
}

- (void)completeWithDesiredFidelity:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_completed = self->_lock_completed;
  self->_BOOL lock_completed = 1;
  uint64_t v7 = (void (**)(void, void))MEMORY[0x1BA99C630](self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  os_unfair_lock_unlock(p_lock);
  if (lock_completed)
  {
    v9 = bls_scenes_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BLSDesiredFidelityRequest completeWithDesiredFidelity:]((uint64_t)self, v9);
    }
  }
  else if (v7)
  {
    v7[2](v7, a3);
  }
}

- (void).cxx_destruct
{
}

- (void)completeWithDesiredFidelity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_ERROR, "%p completeWithDesiredFidelity should only be called once", (uint8_t *)&v2, 0xCu);
}

@end