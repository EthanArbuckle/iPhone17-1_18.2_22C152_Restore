@interface AFNotifyObserver
- (AFNotifyObserver)initWithName:(id)a3 options:(unint64_t)a4 queue:(id)a5 delegate:(id)a6;
- (NSString)description;
- (NSString)name;
- (unint64_t)state;
- (void)_handleNotificationWithToken:(int)a3;
- (void)_invalidate;
- (void)_updateStateWithToken:(int)a3;
- (void)dealloc;
- (void)getStateWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation AFNotifyObserver

uint64_t __25__AFNotifyObserver_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (unint64_t)state
{
  unint64_t v2 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if (self->_options)
  {
    queue = self->_queue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __25__AFNotifyObserver_state__block_invoke;
    v5[3] = &unk_1E592C6C0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(queue, v5);
    unint64_t v2 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)_invalidate
{
  int registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_int registrationToken = -1;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_updateStateWithToken:(int)a3
{
  uint64_t state64 = 0;
  if (a3 != -1 && !notify_get_state(a3, &state64)
    || (int registrationToken = self->_registrationToken, registrationToken != -1)
    && !notify_get_state(registrationToken, &state64))
  {
    unint64_t state = self->_state;
    uint64_t v6 = state64;
    if (state != state64)
    {
      self->_unint64_t state = state64;
      if ((*(unsigned char *)&self->_flags & 2) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained notifyObserver:self didChangeStateFrom:state to:v6];
      }
    }
  }
}

- (void)_handleNotificationWithToken:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (*(unsigned char *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained notifyObserver:self didReceiveNotificationWithToken:v3];
  }
  if (self->_options)
  {
    [(AFNotifyObserver *)self _updateStateWithToken:v3];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AFNotifyObserver_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__AFNotifyObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)getStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_options)
    {
      queue = self->_queue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __43__AFNotifyObserver_getStateWithCompletion___block_invoke;
      v7[3] = &unk_1E592C6E8;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(queue, v7);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __43__AFNotifyObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 40));
}

- (void)dealloc
{
  [(AFNotifyObserver *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFNotifyObserver;
  [(AFNotifyObserver *)&v3 dealloc];
}

- (AFNotifyObserver)initWithName:(id)a3 options:(unint64_t)a4 queue:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"AFNotifyObserver.m", 30, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)AFNotifyObserver;
  v14 = [(AFNotifyObserver *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_options = a4;
    objc_storeStrong((id *)&v14->_queue, a5);
    id v17 = objc_storeWeak((id *)&v14->_delegate, v13);
    *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xFE | objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v19 = 2;
    }
    else {
      char v19 = 0;
    }
    *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xFD | v19;

    objc_initWeak(&location, v14);
    queue = v14->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke;
    block[3] = &unk_1E5929F48;
    id v24 = v11;
    v25 = v14;
    objc_copyWeak(v26, &location);
    v26[1] = (id)a4;
    dispatch_async(queue, block);
    objc_destroyWeak(v26);

    objc_destroyWeak(&location);
  }

  return v14;
}

void __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke(uint64_t a1)
{
  int out_token = -1;
  unint64_t v2 = (const char *)[*(id *)(a1 + 32) UTF8String];
  objc_super v3 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke_2;
  v7 = &unk_1E592A778;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  if (!notify_register_dispatch(v2, &out_token, v3, &v4)) {
    *(_DWORD *)(*(void *)(a1 + 40) + 32) = out_token;
  }
  if (*(unsigned char *)(a1 + 56)) {
    objc_msgSend(*(id *)(a1 + 40), "_updateStateWithToken:", out_token, v4, v5, v6, v7);
  }
  objc_destroyWeak(&v8);
}

void __56__AFNotifyObserver_initWithName_options_queue_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNotificationWithToken:a2];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFNotifyObserver;
  uint64_t v4 = [(AFNotifyObserver *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ {name = %@}", v4, self->_name];

  return (NSString *)v5;
}

@end