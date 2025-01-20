@interface MKTileOverlayRequesterOp
- (MKTileOverlayRequesterOp)init;
- (OS_dispatch_queue)delegateQueue;
- (_MKOverlayTileRequester)delegate;
- (id)data;
- (uint64_t)key;
- (uint64_t)setKey:(uint64_t)a3;
- (void)_cancel;
- (void)_start;
- (void)cancel;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)start;
@end

@implementation MKTileOverlayRequesterOp

- (MKTileOverlayRequesterOp)init
{
  v8.receiver = self;
  v8.super_class = (Class)MKTileOverlayRequesterOp;
  v2 = [(MKTileOverlayRequesterOp *)&v8 init];
  if (v2)
  {
    if (qword_1E9154350 != -1) {
      dispatch_once(&qword_1E9154350, &__block_literal_global_87_0);
    }
    id v3 = (id)qword_1E9154348;
    uint64_t v4 = geo_dispatch_queue_create_with_target();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)start
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MKTileOverlayRequesterOp_start__block_invoke;
  block[3] = &unk_1E54BA960;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __33__MKTileOverlayRequesterOp_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  unint64_t v3 = (*(unsigned int *)&self->_anon_c[5] | ((unint64_t)(*(unsigned __int16 *)&self->_anon_c[9] | (self->_anon_c[11] << 16)) << 32)) >> 2;
  if (qword_1E9154330 != -1) {
    dispatch_once(&qword_1E9154330, &__block_literal_global_83_0);
  }
  uint64_t v4 = RequesterRegistry::lookup((RequesterRegistry *)qword_1E9154328, v3);
  v5 = v4;
  if (v4)
  {
    int v6 = [v4 isGeometryFlipped];
    int v7 = *(_DWORD *)&self->_anon_c[5];
    unint64_t v8 = *(void *)&self->_key.var0;
    int v9 = (HIDWORD(v8) & 0x3FFFFFF) + (-1 << v8);
    if (v9 + 1 >= 0) {
      uint64_t v10 = (v9 + 1);
    }
    else {
      uint64_t v10 = ~v9;
    }
    if (v6) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = HIDWORD(v8) & 0x3FFFFFF;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __34__MKTileOverlayRequesterOp__start__block_invoke_2;
    v26[3] = &unk_1E54BEC00;
    v26[4] = self;
    v12 = (void (**)(void, void, void))MEMORY[0x18C139AE0](v26);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v14 = v7;
    uint64_t v15 = v8 >> 6;
    uint64_t v16 = v8 & 0x3F;
    unsigned int v17 = (v8 >> 58) | (v14 << 6);
    double v18 = (double)v17;
    if (isKindOfClass)
    {
      id v19 = v5;
      int v20 = self->_anon_c[11];
      int v21 = *(unsigned __int16 *)&self->_anon_c[9];
      if ((unsigned __int16)((unint64_t)(v21 | (v20 << 16)) >> 2) >= (unint64_t)[v19 keyframesCount])
      {
        v23 = [MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:1 userInfo:0];
        ((void (**)(void, void, void *))v12)[2](v12, 0, v23);
      }
      else
      {
        v25[0] = v15;
        v25[1] = v11;
        v25[2] = v16;
        *(double *)&v25[3] = v18;
        objc_msgSend(v19, "loadTileAtPath:keyframeIndex:result:", v25);
      }
    }
    else
    {
      v24[0] = v8 >> 6;
      v24[1] = v11;
      v24[2] = v8 & 0x3F;
      *(double *)&v24[3] = (double)v17;
      [v5 loadTileAtPath:v24 result:v12];
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__MKTileOverlayRequesterOp__start__block_invoke;
    block[3] = &unk_1E54BA960;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __34__MKTileOverlayRequesterOp__start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:1 userInfo:0];
  [WeakRetained _operationFailed:v2 error:v3];
}

void __34__MKTileOverlayRequesterOp__start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(NSObject **)(v7 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MKTileOverlayRequesterOp__start__block_invoke_3;
  block[3] = &unk_1E54BEBD8;
  block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __34__MKTileOverlayRequesterOp__start__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setData:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = WeakRetained;
  if (v2) {
    [WeakRetained _operationFinished:v4];
  }
  else {
    [WeakRetained _operationFailed:v4 error:*(void *)(a1 + 48)];
  }
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MKTileOverlayRequesterOp_cancel__block_invoke;
  block[3] = &unk_1E54BA960;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__MKTileOverlayRequesterOp_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
  if (qword_1E9154330 != -1) {
    dispatch_once(&qword_1E9154330, &__block_literal_global_83_0);
  }
  unint64_t v3 = RequesterRegistry::lookup((RequesterRegistry *)qword_1E9154328, (*(unsigned int *)&self->_anon_c[5] | ((unint64_t)(*(unsigned __int16 *)&self->_anon_c[9] | (self->_anon_c[11] << 16)) << 32)) >> 2);
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 isGeometryFlipped];
    int v6 = *(_DWORD *)&self->_anon_c[5];
    unint64_t v7 = *(void *)&self->_key.var0;
    int v8 = (HIDWORD(v7) & 0x3FFFFFF) + (-1 << v7);
    if (v8 + 1 >= 0) {
      uint64_t v9 = (v8 + 1);
    }
    else {
      uint64_t v9 = ~v8;
    }
    if (v5) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = HIDWORD(v7) & 0x3FFFFFF;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v12 = v6;
    uint64_t v13 = v7 >> 6;
    uint64_t v14 = v7 & 0x3F;
    unsigned int v15 = (v7 >> 58) | (v12 << 6);
    double v16 = (double)v15;
    if (isKindOfClass)
    {
      id v17 = v4;
      int v18 = self->_anon_c[11];
      int v19 = *(unsigned __int16 *)&self->_anon_c[9];
      if ((unsigned __int16)((unint64_t)(v19 | (v18 << 16)) >> 2) < (unint64_t)[v17 keyframesCount])
      {
        v21[0] = v13;
        v21[1] = v10;
        v21[2] = v14;
        *(double *)&v21[3] = v16;
        objc_msgSend(v17, "cancelLoadingTileAtPath:keyframeIndex:", v21);
      }
    }
    else
    {
      v20[0] = v7 >> 6;
      v20[1] = v10;
      v20[2] = v7 & 0x3F;
      *(double *)&v20[3] = (double)v15;
      [v4 _cancelLoadingTileAtPath:v20];
    }
  }
}

- (uint64_t)key
{
  return *(void *)(a1 + 8);
}

- (uint64_t)setKey:(uint64_t)a3
{
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = a4;
  return result;
}

- (_MKOverlayTileRequester)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKOverlayTileRequester *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end