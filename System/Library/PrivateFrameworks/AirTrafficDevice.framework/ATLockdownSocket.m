@interface ATLockdownSocket
- (ATLockdownSocket)initWithLockdownInfo:(void *)a3;
- (BOOL)isOpen;
- (BOOL)isWifi;
- (BOOL)open;
- (int)recv:(char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6;
- (int)send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6;
- (void)_readLength:(unint64_t)a3;
- (void)close;
- (void)writeData:(id)a3 withCompletion:(id)a4;
@end

@implementation ATLockdownSocket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketRWQueue, 0);

  objc_storeStrong((id *)&self->_recvSource, 0);
}

- (void)_readLength:(unint64_t)a3
{
  if (self->_connection)
  {
    uint64_t v4 = lockdown_recv();
    if (v4 >= 1)
    {
      [(ATSocket *)self notifyHasDataAvailable:self->_readBuffer length:v4];
    }
  }
}

- (int)recv:(char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  unsigned int v11 = 0;
  do
  {
    if (self->_connection) {
      BOOL v12 = v11 >= a5;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      break;
    }
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    int v22 = 0;
    socketRWQueue = self->_socketRWQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__ATLockdownSocket_recv_offset_len_error___block_invoke;
    block[3] = &unk_1E6B88700;
    block[4] = self;
    block[5] = &v19;
    block[6] = a3;
    unsigned int v17 = a4;
    unsigned int v18 = a5;
    dispatch_sync(socketRWQueue, block);
    int v14 = *((_DWORD *)v20 + 6);
    if (v14 <= 0)
    {
      if (a6)
      {
        *a6 = [MEMORY[0x1E4F478C0] errorWithPosixError:*__error(), @"%@: lockdown_recv returned an error: %d", self, *((unsigned int *)v20 + 6) format];
      }
    }
    else
    {
      v11 += v14;
    }
    _Block_object_dispose(&v19, 8);
  }
  while (v14 > 0);
  return v11;
}

uint64_t __42__ATLockdownSocket_recv_offset_len_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 65664);
  if (result)
  {
    uint64_t result = lockdown_recv();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int)send:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  unsigned int v11 = 0;
  do
  {
    if (self->_connection) {
      BOOL v12 = v11 >= a5;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      break;
    }
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    int v22 = 0;
    socketRWQueue = self->_socketRWQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__ATLockdownSocket_send_offset_len_error___block_invoke;
    block[3] = &unk_1E6B88700;
    block[4] = self;
    block[5] = &v19;
    block[6] = a3;
    unsigned int v17 = a4;
    unsigned int v18 = a5;
    dispatch_sync(socketRWQueue, block);
    int v14 = *((_DWORD *)v20 + 6);
    if (v14 <= 0)
    {
      if (a6)
      {
        *a6 = [MEMORY[0x1E4F478C0] errorWithPosixError:*__error(), @"%@: lockdown_send returned an error: %d", self, *((unsigned int *)v20 + 6) format];
      }
    }
    else
    {
      v11 += v14;
    }
    _Block_object_dispose(&v19, 8);
  }
  while (v14 > 0);
  return v11;
}

uint64_t __42__ATLockdownSocket_send_offset_len_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 65664);
  if (result)
  {
    uint64_t result = lockdown_send();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)writeData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATLockdownSocket_writeData_withCompletion___block_invoke;
  block[3] = &unk_1E6B88AC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__ATLockdownSocket_writeData_withCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) bytes];
  uint64_t v4 = [*(id *)(a1 + 40) length];
  id v8 = 0;
  LODWORD(v2) = [v2 send:v3 offset:0 len:v4 error:&v8];
  id v5 = v8;
  uint64_t v6 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 40) length] == (int)v2) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

- (BOOL)isOpen
{
  return self->_connection != 0;
}

- (void)close
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "Closing lockdown socket %{public}@", buf, 0xCu);
  }

  recvSource = self->_recvSource;
  if (recvSource)
  {
    dispatch_source_cancel(recvSource);
    id v5 = self->_recvSource;
    self->_recvSource = 0;
  }
  socketRWQueue = self->_socketRWQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ATLockdownSocket_close__block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_sync(socketRWQueue, block);
}

uint64_t __25__ATLockdownSocket_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v2 + 65664);
  if (result)
  {
    uint64_t result = lockdown_disconnect();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 65664) = 0;
  return result;
}

- (BOOL)open
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4FBA6C8], self->_lockdownInfo);
  v24 = 0;
  int v4 = secure_lockdown_checkin();
  if (v4)
  {
    id v5 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v26 = v4;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "error:%d checking in with lockdown", buf, 8u);
    }
  }
  else
  {
    id v5 = v24;
    uint64_t v6 = _ATLogCategoryiTunesSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int socket = lockdown_get_socket();
      uint64_t securecontext = lockdown_get_securecontext();
      id v9 = "";
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v26 = socket;
      if (!securecontext) {
        id v9 = "out";
      }
      *(_WORD *)&v26[4] = 2080;
      *(void *)&v26[6] = v9;
      __int16 v27 = 2114;
      v28 = v24;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "Checked in with lockdown on socket %d with%s SSL. connectionInfo=%{public}@", buf, 0x1Cu);
    }

    uint64_t v10 = [v24 objectForKey:*MEMORY[0x1E4FBA6D0]];
    uint64_t v11 = [v10 longLongValue];

    self->_isWifiConnection = v11 == 3;
    if ([(ATSocket *)self socketMode] == 1)
    {
      int v12 = lockdown_get_socket();
      dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14478], v12, 0, (dispatch_queue_t)self->_socketRWQueue);
      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __24__ATLockdownSocket_open__block_invoke;
      handler[3] = &unk_1E6B886B0;
      int v14 = v13;
      int v22 = v14;
      objc_copyWeak(&v23, (id *)buf);
      dispatch_source_set_event_handler(v14, handler);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __24__ATLockdownSocket_open__block_invoke_2;
      v19[3] = &unk_1E6B886D8;
      objc_copyWeak(&v20, (id *)buf);
      dispatch_source_set_cancel_handler(v14, v19);
      recvSource = self->_recvSource;
      self->_recvSource = (OS_dispatch_source *)v14;
      v16 = v14;

      dispatch_resume((dispatch_object_t)self->_recvSource);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v23);

      objc_destroyWeak((id *)buf);
    }
  }

  CFRelease(Mutable);
  unsigned int v17 = _ATLogCategoryiTunesSync();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v26 = self;
    _os_log_impl(&dword_1D9A2D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ opened", buf, 0xCu);
  }

  return v4 == 0;
}

void __24__ATLockdownSocket_open__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (dispatch_source_get_data(v2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _readLength:dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32))];
  }
  else
  {
    dispatch_source_cancel(v2);
  }
}

void __24__ATLockdownSocket_open__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifySocketDidClose];
}

- (BOOL)isWifi
{
  return self->_isWifiConnection;
}

- (ATLockdownSocket)initWithLockdownInfo:(void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ATLockdownSocket;
  int v4 = [(ATSocket *)&v11 init];
  id v5 = v4;
  if (v4)
  {
    v4->_lockdownInfo = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.atc-ATMessageLink-worker", 0);
    socketRWQueue = v5->_socketRWQueue;
    v5->_socketRWQueue = (OS_dispatch_queue *)v6;

    id v8 = v5->_socketRWQueue;
    id v9 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v8, v9);
  }
  return v5;
}

@end