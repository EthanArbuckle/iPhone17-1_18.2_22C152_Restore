@interface ATSocket
+ (BOOL)supportsSecureCoding;
+ (id)createBoundPair:(id)a3[2];
- (ATSocket)init;
- (ATSocket)initWithCoder:(id)a3;
- (BOOL)isOpen;
- (BOOL)open;
- (BOOL)writeAllData:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)queue;
- (id)_flush;
- (id)description;
- (id)flush;
- (id)userInfo;
- (int)_send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6;
- (int)descriptor;
- (int)recv:(char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6;
- (int)send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6;
- (int)transportUpdgradeExceptionCount;
- (int64_t)socketMode;
- (unint64_t)suggestedBufferSize;
- (unsigned)writeBufferSize;
- (void)addDelegate:(id)a3;
- (void)addTransportUpgradeException;
- (void)close;
- (void)closeDescriptor;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)notifyHasDataAvailable:(const char *)a3 length:(int64_t)a4;
- (void)notifySocketDidClose;
- (void)removeDelegate:(id)a3;
- (void)removeTransportUpgradeException;
- (void)setDescriptor:(int)a3;
- (void)setSocketMode:(int64_t)a3;
- (void)setSuggestedBufferSize:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setWriteBufferSize:(unsigned int)a3;
- (void)writeData:(id)a3 withCompletion:(id)a4;
@end

@implementation ATSocket

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (int)transportUpdgradeExceptionCount
{
  return self->_transportUpdgradeExceptionCount;
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDescriptor:(int)a3
{
  self->_descriptor = a3;
}

- (int)descriptor
{
  return self->_descriptor;
}

- (void)setSuggestedBufferSize:(unint64_t)a3
{
  self->_suggestedBufferSize = a3;
}

- (unint64_t)suggestedBufferSize
{
  return self->_suggestedBufferSize;
}

- (void)setSocketMode:(int64_t)a3
{
  self->_socketMode = a3;
}

- (int64_t)socketMode
{
  return self->_socketMode;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v4 = xpc_fd_create(self->_descriptor);
    [v5 encodeXPCObject:v4 forKey:@"fd"];
  }
}

- (ATSocket)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ATSocket *)self init];
    if (v5)
    {
      v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145B0] forKey:@"fd"];
      v5->_descriptor = xpc_fd_dup(v6);
    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_flush
{
  p_writeBuffer = &self->_writeBuffer;
  memset(&v12, 0, sizeof(v12));
  int descriptor = self->_descriptor;
  if (__darwin_check_fd_set_overflow(descriptor, &v12, 0)) {
    *(__int32_t *)((char *)v12.fds_bits + (((unint64_t)descriptor >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << descriptor;
  }
  timeval v11 = (timeval)xmmword_1D9BECE80;
  if (*((_DWORD *)p_writeBuffer + 2))
  {
    unsigned int v5 = 0;
    while (1)
    {
      int v6 = select(*((_DWORD *)p_writeBuffer + 12) + 1, 0, &v12, 0, &v11);
      if (v6)
      {
        if (v6 < 0)
        {
          +[ATInternalError errorWithPosixError:*__error(), @"%@: select write failed", self format];
          v8 = LABEL_12:;
          goto LABEL_13;
        }
        int v7 = send(*((_DWORD *)p_writeBuffer + 12), &(*p_writeBuffer)[v5], *((_DWORD *)p_writeBuffer + 2) - v5, 0);
        if (v7 <= 0)
        {
          +[ATInternalError errorWithPosixError:*__error(), @"%@: send failed", self format];
          goto LABEL_12;
        }
        v8 = 0;
        v5 += v7;
        p_writeBuffer[2] += v7;
      }
      else
      {
        v8 = +[ATInternalError errorWithCode:2, @"%@: select write timed out", self format];
      }
LABEL_13:
      if (v5 >= *((_DWORD *)p_writeBuffer + 2) || v8 != 0) {
        goto LABEL_19;
      }
    }
  }
  v8 = 0;
LABEL_19:
  *((_DWORD *)p_writeBuffer + 2) = 0;

  return v8;
}

- (int)_send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    unsigned int v9 = 0;
    p_writeBuffer = &self->_writeBuffer;
    timeval v11 = &a3[a4];
    while (1)
    {
      uint64_t v12 = *((unsigned int *)p_writeBuffer + 2);
      unsigned int v13 = *((_DWORD *)p_writeBuffer + 14) - v12;
      size_t v14 = a5 - v9 >= v13 ? v13 : a5 - v9;
      memcpy(&(*p_writeBuffer)[v12], &v11[v9], v14);
      unsigned int v15 = *((_DWORD *)p_writeBuffer + 2) + v14;
      *((_DWORD *)p_writeBuffer + 2) = v15;
      if (v15 >= *((_DWORD *)p_writeBuffer + 14))
      {
        uint64_t v16 = [(ATSocket *)self _flush];
        if (v16) {
          break;
        }
      }
      v9 += v14;
      if (v9 >= a5) {
        goto LABEL_11;
      }
    }
    id v18 = (id)v16;
    v19 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = v18;
      _os_log_impl(&dword_1D9BC7000, v19, OS_LOG_TYPE_ERROR, "failed to flush socket. err=%{public}@", (uint8_t *)&v21, 0xCu);
    }

    if (a6)
    {
      id v17 = v18;
      *a6 = v17;
LABEL_17:
      id v18 = v17;
      *a6 = v18;
    }
  }
  else
  {
    unsigned int v9 = 0;
LABEL_11:
    id v17 = 0;
    id v18 = 0;
    if (a6) {
      goto LABEL_17;
    }
  }

  return v9;
}

- (void)setWriteBufferSize:(unsigned int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__ATSocket_setWriteBufferSize___block_invoke;
  v4[3] = &unk_1E6B8C2E8;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

void __31__ATSocket_setWriteBufferSize___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 40) != *(_DWORD *)(*(void *)(a1 + 32) + 65616))
  {
    v2 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(a1 + 40);
      int v9 = 67109120;
      LODWORD(v10) = v3;
      _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "setting writeBufferSize=%u", (uint8_t *)&v9, 8u);
    }

    if ([*(id *)(a1 + 32) isOpen]
      && ([*(id *)(a1 + 32) _flush], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unsigned int v5 = (void *)v4;
      int v6 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_ERROR, "failed to flush socket. err=%{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 65616) = *(_DWORD *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 65560);
      if (v8)
      {
        free(v8);
        uint64_t v7 = *(void *)(a1 + 32);
      }
      *(void *)(*(void *)(a1 + 32) + 65560) = malloc_type_malloc(*(unsigned int *)(v7 + 65616), 0xED64CD1FuLL);
    }
  }
}

- (void)removeTransportUpgradeException
{
  int transportUpdgradeExceptionCount = self->_transportUpdgradeExceptionCount;
  BOOL v3 = __OFSUB__(transportUpdgradeExceptionCount, 1);
  int v4 = transportUpdgradeExceptionCount - 1;
  if (v4 < 0 == v3) {
    self->_int transportUpdgradeExceptionCount = v4;
  }
}

- (void)addTransportUpgradeException
{
}

- (void)notifyHasDataAvailable:(const char *)a3 length:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = (void *)[(NSMutableArray *)v6->_delegates copy];
  objc_sync_exit(v6);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v12, "socket:hasDataAvailable:length:", v6, a3, a4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)notifySocketDidClose
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(NSMutableArray *)v2->_delegates copy];
  objc_sync_exit(v2);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "socketDidClose:", v2, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)flush
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__519;
  long long v10 = __Block_byref_object_dispose__520;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __17__ATSocket_flush__block_invoke;
  v5[3] = &unk_1E6B8C490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __17__ATSocket_flush__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _flush];

  return MEMORY[0x1F41817F8]();
}

- (int)recv:(char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  p_totalBytesReceived = &self->_totalBytesReceived;
  memset(&v20, 0, sizeof(v20));
  int descriptor = self->_descriptor;
  if (__darwin_check_fd_set_overflow(descriptor, &v20, 0)) {
    *(__int32_t *)((char *)v20.fds_bits + (((unint64_t)descriptor >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << descriptor;
  }
  timeval v19 = (timeval)xmmword_1D9BECE90;
  if (a5)
  {
    unsigned int v13 = 0;
    while (1)
    {
      int v14 = select(*((_DWORD *)p_totalBytesReceived + 6) + 1, &v20, 0, 0, &v19);
      if (v14)
      {
        if (v14 < 0)
        {
          +[ATInternalError errorWithPosixError:*__error(), @"%@: select read failed", self format];
        }
        else
        {
          int v15 = recv(*((_DWORD *)p_totalBytesReceived + 6), &a3[a4 + v13], a5 - v13, 0);
          if (v15 > 0)
          {
            long long v16 = 0;
            v13 += v15;
            *p_totalBytesReceived += v15;
            goto LABEL_14;
          }
          +[ATInternalError errorWithPosixError:*__error(), @"%@: recv failed", self format];
        uint64_t v17 = };
      }
      else
      {
        uint64_t v17 = +[ATInternalError errorWithCode:2, @"%@: select read timed out", self format];
      }
      long long v16 = (void *)v17;
LABEL_14:
      if (v13 >= a5 || v16) {
        goto LABEL_18;
      }
    }
  }
  long long v16 = 0;
  unsigned int v13 = 0;
LABEL_18:
  if (a6) {
    *a6 = v16;
  }

  return v13;
}

- (int)send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__519;
  uint64_t v18 = __Block_byref_object_dispose__520;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ATSocket_send_offset_len_error___block_invoke;
  block[3] = &unk_1E6B8BE10;
  block[4] = self;
  block[5] = &v20;
  unsigned int v12 = a4;
  unsigned int v13 = a5;
  block[6] = &v14;
  block[7] = a3;
  dispatch_sync(queue, block);
  if (a6)
  {
    uint64_t v8 = (void *)v15[5];
    if (v8) {
      *a6 = v8;
    }
  }
  int v9 = *((_DWORD *)v21 + 6);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __34__ATSocket_send_offset_len_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(a1 + 68);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  int v7 = [v2 _send:v5 offset:v3 len:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
}

- (void)writeData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ATSocket_writeData_withCompletion___block_invoke;
  block[3] = &unk_1E6B8C640;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __37__ATSocket_writeData_withCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isOpen])
  {
    uint64_t v2 = [*(id *)(a1 + 40) length];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) bytes];
    uint64_t v5 = [*(id *)(a1 + 40) length];
    id v9 = 0;
    LODWORD(v4) = [v3 _send:v4 offset:0 len:v5 error:&v9];
    id v6 = v9;
    if (v2 != (int)v4) {
      [*(id *)(a1 + 32) close];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = +[ATInternalError errorWithCode:3 format:@"socket closed"];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (BOOL)writeAllData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__519;
  uint64_t v18 = __Block_byref_object_dispose__520;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ATSocket_writeAllData_error___block_invoke;
  block[3] = &unk_1E6B8C528;
  block[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v14;
  dispatch_sync(queue, block);
  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __31__ATSocket_writeAllData_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isOpen])
  {
    uint64_t v2 = [*(id *)(a1 + 40) length];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) bytes];
    uint64_t v5 = [*(id *)(a1 + 40) length];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    LODWORD(v3) = [v3 _send:v4 offset:0 len:v5 error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    if (v2 != (int)v3) {
      [*(id *)(a1 + 32) close];
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[ATInternalError errorWithCode:3 format:@"socket closed"];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)isOpen
{
  return self->_descriptor != 0;
}

- (void)closeDescriptor
{
  self->_int descriptor = 0;
}

- (void)close
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_totalBytesSent = &self->_totalBytesSent;
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = *p_totalBytesSent;
    unint64_t v6 = p_totalBytesSent[1];
    int v10 = 138543874;
    id v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = v5;
    __int16 v14 = 2048;
    unint64_t v15 = v6;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: closing. totalBytesSent=%llu, totalReceived=%llu", (uint8_t *)&v10, 0x20u);
  }

  CPSetPowerAssertionWithIdentifier();
  if ([(id)p_totalBytesSent[3] isValid]) {
    [(id)p_totalBytesSent[3] invalidate];
  }
  uint64_t v7 = (void *)p_totalBytesSent[3];
  p_totalBytesSent[3] = 0;

  source = self->_source;
  if (source)
  {
    dispatch_source_cancel(source);
    BOOL v9 = self->_source;
    self->_source = 0;
  }
  [(ATSocket *)self closeDescriptor];
  [(ATSocket *)self notifySocketDidClose];
}

- (BOOL)open
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_powerAssertionIdentifier = &self->_powerAssertionIdentifier;
  uint64_t v4 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [(ATSocket *)self socketMode];
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: opening with mode %d", buf, 0x12u);
  }

  int v5 = *((_DWORD *)p_powerAssertionIdentifier + 4);
  if (v5)
  {
    CPSetPowerAssertionWithIdentifier();
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F77A28]) initWithName:*p_powerAssertionIdentifier pid:getpid() subsystem:@"com.apple.atc.ATSocket" reason:2 flags:1];
    uint64_t v7 = p_powerAssertionIdentifier[1];
    p_powerAssertionIdentifier[1] = (NSString *)v6;

    if ([(ATSocket *)self socketMode] == 1)
    {
      id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], *((int *)p_powerAssertionIdentifier + 4), 0, (dispatch_queue_t)p_powerAssertionIdentifier[6]);
      source = self->_source;
      self->_source = v8;

      int v10 = fcntl(*((_DWORD *)p_powerAssertionIdentifier + 4), 3);
      fcntl(*((_DWORD *)p_powerAssertionIdentifier + 4), 4, v10 & 0xFFFFFFFB);
      int v18 = 1;
      setsockopt(*((_DWORD *)p_powerAssertionIdentifier + 4), 0xFFFF, 1, &v18, 4u);
      *(_OWORD *)buf = xmmword_1D9BECE80;
      setsockopt(*((_DWORD *)p_powerAssertionIdentifier + 4), 0xFFFF, 4101, buf, 0x10u);
      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_source);
      id v11 = self->_source;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __16__ATSocket_open__block_invoke;
      handler[3] = &unk_1E6B8BDE8;
      objc_copyWeak(&v14, &location);
      handler[4] = self;
      objc_copyWeak(&v15, &from);
      dispatch_source_set_event_handler(v11, handler);
      dispatch_resume((dispatch_object_t)self->_source);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  return v5 != 0;
}

void __16__ATSocket_open__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    ssize_t v3 = read(*(_DWORD *)(*(void *)(a1 + 32) + 65608), (void *)(*(void *)(a1 + 32) + 24), 0x10000uLL);
    ssize_t v4 = v3;
    if (v3 < 1)
    {
      int v5 = *__error();
      uint64_t v6 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = *(_DWORD *)(v7 + 65608);
        int v11 = 138544386;
        uint64_t v12 = v7;
        __int16 v13 = 2048;
        ssize_t v14 = v4;
        __int16 v15 = 1024;
        int v16 = v8;
        __int16 v17 = 2080;
        int v18 = strerror(v5);
        __int16 v19 = 1024;
        int v20 = v5;
        _os_log_impl(&dword_1D9BC7000, v6, OS_LOG_TYPE_ERROR, "%{public}@: read failed. bytesRead=%zd, fd=%d, err=%s (%d)", (uint8_t *)&v11, 0x2Cu);
      }

      BOOL v9 = objc_loadWeakRetained((id *)(a1 + 48));
      int v10 = v9;
      if (v9) {
        dispatch_source_cancel(v9);
      }
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 65584) += v3;
      [WeakRetained notifyHasDataAvailable:*(void *)(a1 + 32) + 24 length:v3];
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  ssize_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_delegates removeObject:v5];
  objc_sync_exit(v4);
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  ssize_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_delegates addObject:v5];
  objc_sync_exit(v4);
}

- (id)description
{
  ssize_t v3 = NSString;
  ssize_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p, fd=%d>", v5, self, self->_descriptor];

  return v6;
}

- (void)dealloc
{
  p_writeBuffer = &self->_writeBuffer;
  writeBuffer = self->_writeBuffer;
  if (writeBuffer)
  {
    free(writeBuffer);
    *p_writeBuffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ATSocket;
  [(ATSocket *)&v5 dealloc];
}

- (ATSocket)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATSocket;
  uint64_t v2 = [(ATSocket *)&v14 init];
  ssize_t v3 = v2;
  if (v2)
  {
    p_writeBuffer = &v2->_writeBuffer;
    uint64_t v5 = [NSString stringWithFormat:@"com.apple.atc.%@", v2];
    powerAssertionIdentifier = v3->_powerAssertionIdentifier;
    v3->_powerAssertionIdentifier = (NSString *)v5;

    *(_OWORD *)&v3->_socketMode = xmmword_1D9BECEA0;
    uint64_t v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    dispatch_queue_t v9 = dispatch_queue_create(Name, 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    delegates = v3->_delegates;
    v3->_delegates = (NSMutableArray *)v11;

    *p_writeBuffer = 0;
    v3->_int transportUpdgradeExceptionCount = 0;
    v3->_writeBufferSize = 0;
    [(ATSocket *)v3 setWriteBufferSize:0x8000];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createBoundPair:(id)a3[2]
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (socketpair(1, 1, 0, v11))
  {
    ssize_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(ATSocket);
    uint64_t v6 = objc_alloc_init(ATSocket);
    [(ATSocket *)v5 setDescriptor:v11[0]];
    [(ATSocket *)v6 setDescriptor:v11[1]];
    id v7 = *a3;
    *a3 = v5;
    int v8 = v5;

    id v9 = a3[1];
    a3[1] = v6;

    ssize_t v4 = 0;
  }

  return v4;
}

@end