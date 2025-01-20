@interface CKContextSemaphore
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)busy;
- (BOOL)tryAcquireNeedsIncPending:(BOOL)a3;
- (CKContextSemaphore)initWithCoder:(id)a3;
- (id)initSemaphoreForXPCService;
- (int64_t)pending;
- (int64_t)pendingExceptionsCount;
- (int64_t)waitFor:(double)a3;
- (unint64_t)activeGauge;
- (unint64_t)gauge;
- (unint64_t)numAcquired;
- (unint64_t)requestsServed;
- (unint64_t)sharedMemorySize;
- (void)dealloc;
- (void)decPending;
- (void)encodeWithCoder:(id)a3;
- (void)gauge;
- (void)incPending;
- (void)initSemaphoreForXPCService;
- (void)notify;
- (void)notifyAll;
- (void)resetPending;
- (void)setActiveGauge:(unint64_t)a3;
@end

@implementation CKContextSemaphore

- (void)setActiveGauge:(unint64_t)a3
{
}

- (BOOL)tryAcquireNeedsIncPending:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKContextSemaphore *)self busy])
  {
    uint64_t v5 = 0;
    v6 = MEMORY[0x1E4F14500];
    while ([(CKContextSemaphore *)self waitFor:0.1] >= 1)
    {
      uint64_t v7 = mach_absolute_time();
      if (v5)
      {
        if (kMaxTryAcquireTimeNanos) {
          unint64_t v8 = 60000000000;
        }
        else {
          unint64_t v8 = 0;
        }
        if ((v7 - v5) * sTimebaseInfo / dword_1EB470734 > v8)
        {
          BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[CKContextSemaphore tryAcquireNeedsIncPending:](v9, v10, v11, v12, v13, v14, v15, v16);
            LOBYTE(v9) = 0;
          }
          return v9;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_1A45F4000, v6, OS_LOG_TYPE_INFO, "tryAcquire delay", v18, 2u);
        }
      }
      else
      {
        uint64_t v5 = v7;
      }
      if (![(CKContextSemaphore *)self busy]) {
        break;
      }
    }
  }
  if (v3) {
    [(CKContextSemaphore *)self incPending];
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (void)incPending
{
}

- (BOOL)busy
{
  return [(CKContextSemaphore *)self gauge] != 0;
}

- (unint64_t)gauge
{
  unint64_t v2 = atomic_load(&self->_shm->var0);
  int v3 = atomic_load((unsigned int *)&self->_shm->var4);
  if (v3 >= 1)
  {
    unint64_t v5 = atomic_load(&self->_shm->var6);
    uint64_t v6 = (mach_absolute_time() - v5) * sTimebaseInfo / dword_1EB470734;
    unint64_t v7 = 1000000000;
    if (!kMaxPendingTimeNanos) {
      unint64_t v7 = 0;
    }
    if (v6 <= v7)
    {
      v2 += v3;
    }
    else
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v8) {
        [(CKContextSemaphore *)v8 gauge];
      }
      [(CKContextSemaphore *)self resetPending];
      atomic_fetch_add(&self->_shm->var5, 1u);
    }
  }
  return v2;
}

- (void)resetPending
{
}

- (void)gauge
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)notify
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A45F4000, MEMORY[0x1E4F14500], v1, "semaphore_signal failed with %i: %s", v2, v3, v4, v5, v6);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!dword_1EB470734) {
      mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    }
    kMaxTryAcquireTimeNanos = 1;
    kMaxPendingTimeNanos = 1;
  }
}

- (id)initSemaphoreForXPCService
{
  kern_return_t v5;
  mach_error_t v6;
  kern_return_t v7;
  mach_error_t v8;
  CKContextSemaphore *v9;
  void *v10;
  OS_xpc_object *v11;
  OS_xpc_object *shmObject;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *region;
  semaphore_t semaphore;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKContextSemaphore;
  uint64_t v2 = [(CKContextSemaphore *)&v24 init];
  uint64_t v3 = v2;
  if (!v2) {
    goto LABEL_11;
  }
  v2->_shmSize = 40;
  semaphore = 0;
  uint64_t v4 = (vm_map_t *)MEMORY[0x1E4F14960];
  uint64_t v5 = semaphore_create(*MEMORY[0x1E4F14960], &semaphore, 0, 0);
  if (!v5)
  {
    v3->_sema = semaphore;
    v3->_semaOwner = 1;
    region = 0;
    unint64_t v7 = vm_allocate(*v4, (vm_address_t *)&region, 0x28uLL, 1);
    if (v7)
    {
      BOOL v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[CKContextSemaphore initSemaphoreForXPCService](v8);
      }
      goto LABEL_8;
    }
    uint64_t v10 = region;
    v3->_shm = ($DAEF8D68CAA1A328661E3A0179F40554 *)region;
    uint64_t v11 = (OS_xpc_object *)xpc_shmem_create(v10, 0x28uLL);
    if (!v11)
    {
      uint64_t v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v14) {
        [(CKContextSemaphore *)v14 initSemaphoreForXPCService];
      }
      goto LABEL_8;
    }
    shmObject = v3->_shmObject;
    v3->_shmObject = v11;

LABEL_11:
    uint64_t v9 = v3;
    goto LABEL_12;
  }
  uint8_t v6 = v5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[CKContextSemaphore initSemaphoreForXPCService](v6);
  }
LABEL_8:
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (CKContextSemaphore)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKContextSemaphore;
  uint64_t v5 = [(CKContextSemaphore *)&v15 init];
  if (!v5) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5->_semaOwner = 0;
    id v6 = v4;
    unint64_t v7 = [v6 decodeIntegerForKey:@"shm_size"];
    v5->_shmSize = v7;
    if (v7 <= 0x27)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[CKContextSemaphore initWithCoder:]((uint64_t *)&v5->_shmSize);
      }
LABEL_10:

      goto LABEL_11;
    }
    BOOL v8 = [v6 decodeXPCObjectForKey:@"semaphore_obj"];
    v5->_sema = xpc_mach_send_copy_right();
    uint64_t v9 = [v6 decodeXPCObjectOfType:MEMORY[0x1E4F145E8] forKey:@"shm_obj"];
    shmObject = v5->_shmObject;
    v5->_shmObject = (OS_xpc_object *)v9;

    size_t v11 = xpc_shmem_map(v5->_shmObject, (void **)&v5->_shm);
    uint64_t v12 = v11;
    if (v11 < v5->_shmSize)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[CKContextSemaphore initWithCoder:]((uint64_t *)&v5->_shmSize, v12);
      }

      goto LABEL_10;
    }
    v5->_shmSize = v11;

LABEL_13:
    uint64_t v13 = v5;
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

- (void)dealloc
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A45F4000, MEMORY[0x1E4F14500], v1, "vm_deallocate failed with %i: %s", v2, v3, v4, v5, v6);
}

- (unint64_t)sharedMemorySize
{
  return self->_shmSize;
}

- (unint64_t)activeGauge
{
  return atomic_load(&self->_shm->var0);
}

- (int64_t)pending
{
  return (int)atomic_load((unsigned int *)&self->_shm->var4);
}

- (void)decPending
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "pending count turned negative; oldVal=%ld",
    (uint8_t *)&v1,
    0xCu);
}

- (int64_t)pendingExceptionsCount
{
  return (int)atomic_load((unsigned int *)&self->_shm->var5);
}

- (unint64_t)numAcquired
{
  return atomic_load(&self->_shm->var7);
}

- (unint64_t)requestsServed
{
  return atomic_load(&self->_shm->var1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)xpc_mach_send_create();
  unint64_t shmSize = self->_shmSize;
  id v7 = v4;
  [v7 encodeInteger:shmSize forKey:@"shm_size"];
  [v7 encodeXPCObject:v5 forKey:@"semaphore_obj"];
  [v7 encodeXPCObject:self->_shmObject forKey:@"shm_obj"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)notifyAll
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A45F4000, MEMORY[0x1E4F14500], v1, "semaphore_signal_all failed with %i: %s", v2, v3, v4, v5, v6);
}

- (int64_t)waitFor:(double)a3
{
  kern_return_t v7;
  mach_error_t v8;
  int64_t result;
  _DWORD v10[2];
  __int16 v11;
  char *v12;
  uint64_t v13;

  uint64_t v13 = *MEMORY[0x1E4F143B8];
  float v3 = floor(a3);
  uint64_t v4 = v3;
  uint64_t v5 = &off_1A4605000;
  LODWORD(v5) = llround((a3 - (double)v4) * 1000000000.0);
  mach_timespec_t v6 = (mach_timespec_t)(v4 | ((void)v5 << 32));
  id v7 = semaphore_timedwait(self->_sema, v6);
  BOOL v8 = v7;
  if (v7 > 36)
  {
    if (v7 == 37 || v7 == 42)
    {
LABEL_8:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109378;
        v10[1] = v8;
        size_t v11 = 2080;
        uint64_t v12 = mach_error_string(v8);
        _os_log_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "semaphore_timedwait returned %i: %s", (uint8_t *)v10, 0x12u);
      }
    }
    else
    {
      if (v7 == 49) {
        return 1;
      }
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[CKContextSemaphore waitFor:](v8);
      }
    }
    return -1;
  }
  else
  {
    switch(v7)
    {
      case 9:
        goto LABEL_8;
      case 10:
      case 14:
        return 1;
      case 11:
      case 12:
      case 13:
      case 15:
      case 16:
      case 17:
        goto LABEL_12;
      case 18:
        result = -2;
        break;
      default:
        if (v7) {
          goto LABEL_12;
        }
        result = 0;
        break;
    }
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)initSemaphoreForXPCService
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A45F4000, MEMORY[0x1E4F14500], v1, "semaphore_create failed with %i: %s", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v2 = 134218240;
  uint64_t v3 = v1;
  __int16 v4 = 2048;
  uint64_t v5 = 40;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "shmSize too small: %lu vs %lu", (uint8_t *)&v2, 0x16u);
}

- (void)initWithCoder:(uint64_t *)a1 .cold.2(uint64_t *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "mapped shmSize too small: %zu vs. expected %zu", (uint8_t *)&v3, 0x16u);
}

- (void)waitFor:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A45F4000, MEMORY[0x1E4F14500], v1, "semaphore_timedwait failed with %i: %s", v2, v3, v4, v5, v6);
}

- (void)tryAcquireNeedsIncPending:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end