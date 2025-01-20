@interface CATSocket
- (BOOL)connectToEndPoint:(id)a3 error:(id *)a4;
- (BOOL)delegateShouldAcceptNewSocket:(id)a3;
- (BOOL)listenWithEndPoint:(id)a3 error:(id *)a4;
- (CATEndPoint)localEndPoint;
- (CATEndPoint)remoteEndPoint;
- (CATSocket)init;
- (CATSocket)initWithNativeSocket:(int)a3;
- (CATSocketDelegate)delegate;
- (OS_dispatch_queue)socketQueue;
- (OS_dispatch_queue)userQueue;
- (OS_dispatch_source)socketSource;
- (int)nativeSocket;
- (void)acceptPendingConnection;
- (void)dealloc;
- (void)delegateDidClose;
- (void)delegateDidConnect;
- (void)delegateDidFailWithError:(id)a3;
- (void)delegateDidReceiveData:(id)a3;
- (void)invalidate;
- (void)populateLocalEndPoint;
- (void)populateRemoteEndPoint;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setNativeSocket:(int)a3;
- (void)socketDidCancel;
- (void)socketDidConnect;
- (void)socketDidFailWithError:(id)a3;
- (void)socketDidReceiveData;
- (void)socketDidReceiveEvent;
- (void)socketDidReceiveListeningEvent;
- (void)suspend;
@end

@implementation CATSocket

- (void)setNativeSocket:(int)a3
{
  if ([(CATSocket *)self nativeSocket] != -1)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CATSocket.m", 55, @"%@ cannot call %@ when already connected.", self, v11 object file lineNumber description];
  }
  if (self->mIsInvalid)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CATSocket.m", 56, @"%@ cannot call %@ when already invalidated.", self, v13 object file lineNumber description];
  }
  if (self->_nativeSocket != a3)
  {
    self->_nativeSocket = a3;
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, (dispatch_queue_t)self->_socketQueue);
    socketSource = self->_socketSource;
    self->_socketSource = v6;

    v8 = self->_socketSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __29__CATSocket_setNativeSocket___block_invoke;
    handler[3] = &unk_2641DBE60;
    handler[4] = self;
    dispatch_source_set_cancel_handler(v8, handler);
    v9 = self->_socketSource;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __29__CATSocket_setNativeSocket___block_invoke_2;
    v14[3] = &unk_2641DBE60;
    v14[4] = self;
    dispatch_source_set_event_handler(v9, v14);
    [(CATSocket *)self populateLocalEndPoint];
    if (self->mState != 1) {
      [(CATSocket *)self populateRemoteEndPoint];
    }
  }
}

uint64_t __29__CATSocket_setNativeSocket___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) socketDidCancel];
}

uint64_t __29__CATSocket_setNativeSocket___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) socketDidReceiveEvent];
}

- (int)nativeSocket
{
  return self->_nativeSocket;
}

- (CATSocket)init
{
  v9.receiver = self;
  v9.super_class = (Class)CATSocket;
  v2 = [(CATSocket *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_nativeSocket = -1;
    dispatch_queue_t v4 = dispatch_queue_create(0, 0);
    userQueue = v3->_userQueue;
    v3->_userQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create(0, 0);
    socketQueue = v3->_socketQueue;
    v3->_socketQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (CATSocket)initWithNativeSocket:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_queue_t v4 = [(CATSocket *)self init];
  v5 = v4;
  if (v4)
  {
    v4->mState = 3;
    [(CATSocket *)v4 setNativeSocket:v3];
  }
  return v5;
}

- (void)dealloc
{
  if (!self->mIsInvalid)
  {
    dispatch_queue_t v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CATSocket.m", 118, @"%@ cannot dealloc while receiver is still valid.", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)CATSocket;
  [(CATSocket *)&v5 dealloc];
}

- (BOOL)listenWithEndPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  v7 = [(CATSocket *)self socketQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__CATSocket_listenWithEndPoint_error___block_invoke;
  v11[3] = &unk_2641DC3E0;
  v11[4] = self;
  v13 = &v15;
  id v8 = v6;
  id v12 = v8;
  v14 = &v21;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __38__CATSocket_listenWithEndPoint_error___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 12);
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = *MEMORY[0x263F08438];
      uint64_t v5 = 37;
LABEL_6:
      uint64_t v8 = [v3 errorWithDomain:v4 code:v5 userInfo:0];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void *)(v9 + 40);
      *(void *)(v9 + 40) = v8;
      return MEMORY[0x270F9A758](v8, v10);
    }
LABEL_5:
    uint64_t v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F08438];
    uint64_t v5 = 22;
    goto LABEL_6;
  }
  id v6 = [*(id *)(a1 + 40) data];
  unint64_t v7 = [v6 length];

  if (v7 <= 0xF) {
    goto LABEL_5;
  }
  id v11 = [*(id *)(a1 + 40) data];
  id v12 = (const sockaddr *)[v11 bytes];

  uint64_t v13 = socket(v12->sa_family, 1, 6);
  if (v13 == -1)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08438];
    uint64_t v5 = *__error();
    uint64_t v3 = v18;
    uint64_t v4 = v19;
    goto LABEL_6;
  }
  uint64_t v14 = v13;
  int v21 = 1;
  if (setsockopt(v13, 0xFFFF, 4, &v21, 4u) || bind(v14, v12, v12->sa_len) || listen(v14, 16))
  {
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    return close(v14);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 1;
  return [*(id *)(a1 + 32) setNativeSocket:v14];
}

- (BOOL)connectToEndPoint:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATSocket.m", 199, @"Invalid parameter not satisfying: %@", @"endPoint" object file lineNumber description];
  }
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  int v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v8 = [(CATSocket *)self socketQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CATSocket_connectToEndPoint_error___block_invoke;
  block[3] = &unk_2641DC3E0;
  block[4] = self;
  uint64_t v15 = &v17;
  id v9 = v7;
  id v14 = v9;
  uint64_t v16 = &v23;
  dispatch_sync(v8, block);

  if (a4) {
    *a4 = (id) v18[5];
  }
  char v10 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

void __37__CATSocket_connectToEndPoint_error___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 12);
  if (v2)
  {
    if (v2 == 3)
    {
      uint64_t v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = *MEMORY[0x263F08438];
      uint64_t v5 = 37;
      goto LABEL_8;
    }
    if (v2 == 2)
    {
      uint64_t v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v4 = *MEMORY[0x263F08438];
      uint64_t v5 = 36;
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v4 = *MEMORY[0x263F08438];
    uint64_t v5 = 22;
    goto LABEL_8;
  }
  id v6 = [*(id *)(a1 + 40) data];
  unint64_t v7 = [v6 length];

  if (v7 <= 0xF) {
    goto LABEL_6;
  }
  id v11 = [*(id *)(a1 + 40) data];
  uint64_t v12 = [v11 bytes];

  uint64_t v13 = socket(*(unsigned __int8 *)(v12 + 1), 1, 0);
  if (v13 != -1)
  {
    uint64_t v14 = v13;
    int v23 = 1;
    if (setsockopt(v13, 0xFFFF, 4130, &v23, 4u))
    {
      uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      close(v14);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(_DWORD *)(*(void *)(a1 + 32) + 12) = 2;
      [*(id *)(a1 + 32) setNativeSocket:v14];
      id v20 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__CATSocket_connectToEndPoint_error___block_invoke_2;
      block[3] = &unk_2641DC408;
      int v22 = v14;
      block[4] = *(void *)(a1 + 32);
      void block[5] = v12;
      dispatch_async(v20, block);
    }
    return;
  }
  v18 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = *MEMORY[0x263F08438];
  uint64_t v5 = *__error();
  uint64_t v3 = v18;
  uint64_t v4 = v19;
LABEL_8:
  uint64_t v8 = [v3 errorWithDomain:v4 code:v5 userInfo:0];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  MEMORY[0x270F9A758](v8, v10);
}

void __37__CATSocket_connectToEndPoint_error___block_invoke_2(uint64_t a1)
{
  int v2 = connect(*(_DWORD *)(a1 + 48), *(const sockaddr **)(a1 + 40), **(unsigned __int8 **)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    [v3 socketDidFailWithError:v4];
  }
  else
  {
    [v3 socketDidConnect];
  }
}

- (void)resume
{
  uint64_t v3 = [(CATSocket *)self socketQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__CATSocket_resume__block_invoke;
  block[3] = &unk_2641DBE60;
  block[4] = self;
  dispatch_async(v3, block);
}

void __19__CATSocket_resume__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) socketSource];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) socketSource];
    dispatch_resume(v3);
  }
}

- (void)suspend
{
  uint64_t v3 = [(CATSocket *)self socketQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__CATSocket_suspend__block_invoke;
  block[3] = &unk_2641DBE60;
  block[4] = self;
  dispatch_async(v3, block);
}

void __20__CATSocket_suspend__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) socketSource];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) socketSource];
    dispatch_suspend(v3);
  }
}

- (void)invalidate
{
  uint64_t v3 = [(CATSocket *)self socketQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__CATSocket_invalidate__block_invoke;
  block[3] = &unk_2641DBE60;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __23__CATSocket_invalidate__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned char **)(a1 + 32);
  if (!v2[8])
  {
    uint64_t v3 = [v2 socketSource];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) socketSource];
      dispatch_source_cancel(v4);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
}

- (void)socketDidReceiveEvent
{
  if (self->mState == 1) {
    [(CATSocket *)self socketDidReceiveListeningEvent];
  }
  else {
    [(CATSocket *)self socketDidReceiveData];
  }
}

- (void)socketDidReceiveListeningEvent
{
  uint64_t v3 = [(CATSocket *)self socketSource];
  uintptr_t data = dispatch_source_get_data(v3);

  for (; data; --data)
    [(CATSocket *)self acceptPendingConnection];
}

- (void)acceptPendingConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v6 = __error();
  unint64_t v7 = strerror(*v6);
  int v8 = *__error();
  int v9 = 138413058;
  uint64_t v10 = a1;
  __int16 v11 = 1024;
  int v12 = a3;
  __int16 v13 = 2080;
  uint64_t v14 = v7;
  __int16 v15 = 1024;
  int v16 = v8;
  _os_log_error_impl(&dword_213B7F000, v5, OS_LOG_TYPE_ERROR, "%@ failed accepting from socket (%d): %s (%i)", (uint8_t *)&v9, 0x22u);
}

uint64_t __36__CATSocket_acceptPendingConnection__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) delegateShouldAcceptNewSocket:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 invalidate];
  }
  return result;
}

- (void)socketDidReceiveData
{
  uint64_t v3 = [(CATSocket *)self socketSource];
  uintptr_t data = dispatch_source_get_data(v3);

  if (data)
  {
    uint64_t v5 = [MEMORY[0x263EFF990] dataWithLength:data];
    int v6 = [(CATSocket *)self nativeSocket];
    id v7 = v5;
    ssize_t v8 = read(v6, (void *)[v7 mutableBytes], data);
    if (v8 == -1)
    {
      if (*__error() != 35 && *__error() != 4)
      {
        __int16 v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
        [(CATSocket *)self socketDidFailWithError:v11];

        [(CATSocket *)self invalidate];
        goto LABEL_11;
      }
    }
    else if (!v8)
    {
      int v9 = [(CATSocket *)self socketSource];
      dispatch_source_cancel(v9);

LABEL_11:
      return;
    }
    uint64_t v10 = [(CATSocket *)self userQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__CATSocket_socketDidReceiveData__block_invoke;
    block[3] = &unk_2641DC000;
    block[4] = self;
    id v14 = v7;
    dispatch_async(v10, block);

    goto LABEL_11;
  }
  int v12 = [(CATSocket *)self socketSource];
  dispatch_source_cancel(v12);
}

void __33__CATSocket_socketDidReceiveData__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 delegateDidReceiveData:v2];
}

- (void)socketDidConnect
{
  self->mState = 3;
  [(CATSocket *)self populateRemoteEndPoint];
  uint64_t v3 = [(CATSocket *)self userQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__CATSocket_socketDidConnect__block_invoke;
  block[3] = &unk_2641DBE60;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__CATSocket_socketDidConnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegateDidConnect];
}

- (void)socketDidCancel
{
  close(self->_nativeSocket);
  self->_nativeSocket = -1;
  socketSource = self->_socketSource;
  self->_socketSource = 0;

  if ((self->mState | 2) == 3)
  {
    self->mState = 5;
    id v4 = [(CATSocket *)self userQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__CATSocket_socketDidCancel__block_invoke;
    block[3] = &unk_2641DBE60;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __28__CATSocket_socketDidCancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegateDidClose];
}

- (void)socketDidFailWithError:(id)a3
{
  id v4 = a3;
  self->mState = 4;
  uint64_t v5 = [(CATSocket *)self userQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__CATSocket_socketDidFailWithError___block_invoke;
  v7[3] = &unk_2641DC000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __36__CATSocket_socketDidFailWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegateDidFailWithError:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)populateLocalEndPoint
{
  socklen_t v8 = 16;
  getsockname(self->_nativeSocket, 0, &v8);
  if (v8)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
    int nativeSocket = self->_nativeSocket;
    id v5 = v3;
    getsockname(nativeSocket, (sockaddr *)[v5 mutableBytes], &v8);
    id v6 = [[CATEndPoint alloc] initWithData:v5];
    localEndPoint = self->_localEndPoint;
    self->_localEndPoint = v6;
  }
}

- (void)populateRemoteEndPoint
{
  socklen_t v8 = 16;
  getpeername(self->_nativeSocket, 0, &v8);
  if (v8)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
    int nativeSocket = self->_nativeSocket;
    id v5 = v3;
    getpeername(nativeSocket, (sockaddr *)[v5 mutableBytes], &v8);
    id v6 = [[CATEndPoint alloc] initWithData:v5];
    remoteEndPoint = self->_remoteEndPoint;
    self->_remoteEndPoint = v6;
  }
}

- (BOOL)delegateShouldAcceptNewSocket:(id)a3
{
  id v4 = a3;
  id v5 = [(CATSocket *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CATSocket *)self delegate];
    char v8 = [v7 socket:self shouldAcceptNewSocket:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)delegateDidReceiveData:(id)a3
{
  id v8 = a3;
  id v4 = [(CATSocket *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CATSocket *)self delegate];
    id v7 = (void *)[v8 copy];
    [v6 socket:self didReceiveData:v7];
  }
}

- (void)delegateDidClose
{
  uint64_t v3 = [(CATSocket *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CATSocket *)self delegate];
    [v5 socketDidClose:self];
  }
}

- (void)delegateDidConnect
{
  uint64_t v3 = [(CATSocket *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CATSocket *)self delegate];
    [v5 socketDidConnect:self];
  }
}

- (void)delegateDidFailWithError:(id)a3
{
  id v7 = a3;
  char v4 = [(CATSocket *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CATSocket *)self delegate];
    [v6 socket:self didFailWithError:v7];
  }
}

- (CATSocketDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATSocketDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CATEndPoint)localEndPoint
{
  return self->_localEndPoint;
}

- (CATEndPoint)remoteEndPoint
{
  return self->_remoteEndPoint;
}

- (OS_dispatch_source)socketSource
{
  return self->_socketSource;
}

- (OS_dispatch_queue)socketQueue
{
  return self->_socketQueue;
}

- (OS_dispatch_queue)userQueue
{
  return self->_userQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueue, 0);
  objc_storeStrong((id *)&self->_socketQueue, 0);
  objc_storeStrong((id *)&self->_socketSource, 0);
  objc_storeStrong((id *)&self->_remoteEndPoint, 0);
  objc_storeStrong((id *)&self->_localEndPoint, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end