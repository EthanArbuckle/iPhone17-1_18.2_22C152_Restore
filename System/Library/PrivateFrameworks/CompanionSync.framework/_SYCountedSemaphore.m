@interface _SYCountedSemaphore
- (BOOL)_waitSemaphoreWithTimeout:(double)a3;
- (BOOL)waitWithTimeout:(double)a3;
- (_SYCountedSemaphore)init;
- (_SYCountedSemaphore)initWithCount:(int64_t)a3;
- (void)_ensureSemaphore;
- (void)_signalSemaphore;
- (void)invalidate;
- (void)signal;
@end

@implementation _SYCountedSemaphore

- (_SYCountedSemaphore)init
{
  return [(_SYCountedSemaphore *)self initWithCount:1];
}

- (_SYCountedSemaphore)initWithCount:(int64_t)a3
{
  unsigned int v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SYCountedSemaphore;
  v4 = [(_SYCountedSemaphore *)&v8 init];
  v5 = v4;
  if (v4)
  {
    atomic_store(v3, (unsigned int *)&v4->_count);
    v6 = v4;
  }

  return v5;
}

- (void)invalidate
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21C7C9000, v3, v4, "Error destroying Mach semaphore: %d (%{public}s)", v5, v6, v7, v8, v9);
}

- (void)_ensureSemaphore
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21C7C9000, v3, v4, "Failed to create semaphore! %d (%{public}s)", v5, v6, v7, v8, v9);
}

- (BOOL)waitWithTimeout:(double)a3
{
  return (int)atomic_fetch_add_explicit(&self->_count, 0xFFFFFFFF, memory_order_acquire) > 0
      || [(_SYCountedSemaphore *)self _waitSemaphoreWithTimeout:a3];
}

- (void)signal
{
  if ((atomic_fetch_add_explicit(&self->_count, 1u, memory_order_release) & 0x80000000) != 0) {
    [(_SYCountedSemaphore *)self _signalSemaphore];
  }
}

- (BOOL)_waitSemaphoreWithTimeout:(double)a3
{
  kern_return_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  mach_timespec_t v21;

  atomic_load((unsigned int *)&self->_signals);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if (v3)
  {
LABEL_32:
    LOBYTE(v18) = 0;
    return v18;
  }
  unint64_t v6 = (unint64_t)(a3 * 1000000000.0);
  while (1)
  {
    uint64_t v7 = atomic_load((unsigned int *)&self->_signals);
    while (v7)
    {
      uint64_t v8 = v7;
      atomic_compare_exchange_strong_explicit(&self->_signals, (unsigned int *)&v8, v7 - 1, memory_order_relaxed, memory_order_relaxed);
      BOOL v9 = v8 == v7;
      uint64_t v7 = v8;
      if (v9)
      {
        LOBYTE(v18) = 1;
        return v18;
      }
    }
    [(_SYCountedSemaphore *)self _ensureSemaphore];
    if (a3 >= 0.0)
    {
      if (a3 != 0.0)
      {
        if (v6 == -1) {
          goto LABEL_9;
        }
        if (v6)
        {
          do
          {
            semaphore_t v15 = atomic_load(&self->_sem_port);
            v21.tv_sec = v6 / 0x3B9ACA00;
            v21.tv_nsec = v6 % 0x3B9ACA00;
            v16 = semaphore_timedwait(v15, v21);
          }
          while (v16 == 14);
          if (!v16) {
            goto LABEL_11;
          }
          if (v16 != 49)
          {
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            v17 = (void *)_sync_log_facilities;
            v18 = os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_FAULT);
            if (v18)
            {
              -[_SYCountedSemaphore _waitSemaphoreWithTimeout:](v17);
              goto LABEL_32;
            }
            return v18;
          }
        }
      }
      uint64_t v13 = atomic_load((unsigned int *)&self->_count);
      while ((v13 & 0x80000000) != 0)
      {
        uint64_t v14 = v13;
        atomic_compare_exchange_strong_explicit(&self->_count, (unsigned int *)&v14, v13 + 1, memory_order_relaxed, memory_order_relaxed);
        BOOL v9 = v14 == v13;
        uint64_t v13 = v14;
        if (v9) {
          goto LABEL_32;
        }
      }
    }
    do
    {
LABEL_9:
      uint64_t v10 = atomic_load(&self->_sem_port);
      int v11 = MEMORY[0x21D4B1AA0](v10);
    }
    while (v11 == 14);
    if (v11) {
      break;
    }
LABEL_11:
    LOBYTE(v18) = 0;
    unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_invalidated);
    if (v12) {
      return v18;
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v19 = (void *)_sync_log_facilities;
  v18 = os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_FAULT);
  if (v18)
  {
    -[_SYCountedSemaphore _waitSemaphoreWithTimeout:](v19);
    goto LABEL_32;
  }
  return v18;
}

- (void)_signalSemaphore
{
  atomic_fetch_add_explicit(&self->_signals, 1u, memory_order_relaxed);
  [(_SYCountedSemaphore *)self _ensureSemaphore];
  uint64_t v3 = atomic_load(&self->_sem_port);
  if (MEMORY[0x21D4B1A70](v3)) {
    _os_assumes_log();
  }
}

- (void)_waitSemaphoreWithTimeout:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21C7C9000, v3, v4, "Error draining semaphore: %d (%{public}s)", v5, v6, v7, v8, v9);
}

- (void)_waitSemaphoreWithTimeout:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_21C7C9000, v3, v4, "Failed to wait on semaphore, but it didn't time out or abort: %d (%{public}s)", v5, v6, v7, v8, v9);
}

@end