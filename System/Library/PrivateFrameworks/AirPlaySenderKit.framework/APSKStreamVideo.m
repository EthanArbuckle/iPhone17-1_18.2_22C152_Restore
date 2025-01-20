@interface APSKStreamVideo
- (APSKStreamVideo)init;
- (APSKStreamVideo)initWithDelegate:(id)a3 delegateQueue:(id)a4 options:(id)a5;
- (BOOL)active;
- (int)displayHeight;
- (int)displayRefreshRate;
- (int)displayWidth;
- (int)enqueueFrame:(__CVBuffer *)a3 forTime:(int64_t)a4;
- (void)setDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5;
- (void)setError:(int)a3;
- (void)setFrameSender:(id)a3;
@end

@implementation APSKStreamVideo

- (APSKStreamVideo)init
{
  return [(APSKStreamVideo *)self initWithDelegate:0 delegateQueue:0 options:0];
}

- (APSKStreamVideo)initWithDelegate:(id)a3 delegateQueue:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)APSKStreamVideo;
  v11 = [(APSKStreamVideo *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    p_delegateQueue = (void **)&v12->_delegateQueue;
    objc_storeStrong((id *)&v12->_delegateQueue, a4);
    objc_storeStrong((id *)&v12->_options, a5);
    objc_storeWeak((id *)&v12->_frameSender, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.apskstreamvideo.stateq", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
    if (WeakRetained)
    {
      v17 = *p_delegateQueue;

      if (!v17)
      {
        dispatch_queue_t v18 = dispatch_queue_create("com.apple.apskstreamvideo.delegateq", 0);
        v19 = *p_delegateQueue;
        *p_delegateQueue = v18;
      }
    }
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v12;
}

- (int)enqueueFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_queue_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__APSKStreamVideo_enqueueFrame_forTime___block_invoke;
  v10[3] = &unk_265222480;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(queue, v10);
  v7 = (void *)v12[5];
  if (v7) {
    int v8 = [v7 sendFrame:a3 forTime:a4];
  }
  else {
    int v8 = -6709;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __40__APSKStreamVideo_enqueueFrame_forTime___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  return MEMORY[0x270F9A758]();
}

- (BOOL)active
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__APSKStreamVideo_active__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __25__APSKStreamVideo_active__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = WeakRetained != 0;
}

- (int)displayWidth
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__APSKStreamVideo_displayWidth__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__APSKStreamVideo_displayWidth__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 48);
  return result;
}

- (int)displayHeight
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__APSKStreamVideo_displayHeight__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__APSKStreamVideo_displayHeight__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 52);
  return result;
}

- (int)displayRefreshRate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__APSKStreamVideo_displayRefreshRate__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__APSKStreamVideo_displayRefreshRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 56);
  return result;
}

- (void)setFrameSender:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__APSKStreamVideo_setFrameSender___block_invoke;
  v7[3] = &unk_2652224D0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __34__APSKStreamVideo_setFrameSender___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v4 = WeakRetained;
  if (v2)
  {

    if (v4)
    {
      APSLogErrorAt();
    }
    else
    {
      objc_storeWeak((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 32));
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = *(NSObject **)(v7 + 16);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __34__APSKStreamVideo_setFrameSender___block_invoke_2;
        v14[3] = &unk_2652224A8;
        v14[4] = v7;
        int v9 = v14;
LABEL_16:
        dispatch_async(v8, v9);
      }
    }
  }
  else
  {

    if (v4)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 40) + 40), 0);
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        id v8 = *(NSObject **)(v12 + 16);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __34__APSKStreamVideo_setFrameSender___block_invoke_3;
        block[3] = &unk_2652224A8;
        block[4] = v12;
        int v9 = block;
        goto LABEL_16;
      }
    }
  }
}

void __34__APSKStreamVideo_setFrameSender___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained videoStreamDidStart:*(void *)(a1 + 32)];
}

void __34__APSKStreamVideo_setFrameSender___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained videoStreamDidStop:*(void *)(a1 + 32)];
}

- (void)setError:(int)a3
{
  if (a3)
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __28__APSKStreamVideo_setError___block_invoke;
      block[3] = &unk_2652224F8;
      block[4] = self;
      int v9 = a3;
      dispatch_async(delegateQueue, block);
    }
  }
}

void __28__APSKStreamVideo_setError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained videoStreamDidFail:*(void *)(a1 + 32) withError:*(unsigned int *)(a1 + 40)];
}

- (void)setDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke;
  block[3] = &unk_265222520;
  block[4] = self;
  int v7 = a3;
  int v8 = a4;
  int v9 = a5;
  dispatch_sync(queue, block);
}

void __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 40);
  if (v2[12] != v3 || v2[13] != *(_DWORD *)(a1 + 44) || v2[14] != *(_DWORD *)(a1 + 48))
  {
    v2[12] = v3;
    *(_DWORD *)(*(void *)(a1 + 32) + 52) = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(NSObject **)(v6 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke_2;
      block[3] = &unk_2652224A8;
      block[4] = v6;
      dispatch_async(v7, block);
    }
  }
}

void __54__APSKStreamVideo_setDisplayWidth_height_refreshRate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained videoStreamDisplayInfoDidUpdate:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_frameSender);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end