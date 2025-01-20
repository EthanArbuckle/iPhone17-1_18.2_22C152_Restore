@interface REAudioManagerNotificationListener
- (AVAudioSession)audioSessionToFollow;
- (REAudioManagerNotificationListener)initWithOwner:(void *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)servicesLost:(id)a3;
- (void)servicesReset:(id)a3;
- (void)sessionInterrupted:(id)a3;
- (void)stop;
@end

@implementation REAudioManagerNotificationListener

- (REAudioManagerNotificationListener)initWithOwner:(void *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)REAudioManagerNotificationListener;
  v4 = [(REAudioManagerNotificationListener *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_owner = (AudioSceneService *)a3;
    objc_initWeak(&location, v4);
    v6 = dispatch_get_global_queue(33, 0);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __52__REAudioManagerNotificationListener_initWithOwner___block_invoke;
    v15 = &unk_264BE3388;
    objc_copyWeak(&v16, &location);
    dispatch_async(v6, &v12);

    v7 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v12, v13, v14, v15);
    [v7 addObserver:v5 selector:sel_servicesLost_ name:*MEMORY[0x263F28D78] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v5 selector:sel_servicesReset_ name:*MEMORY[0x263F28D80] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v5 selector:sel_sessionInterrupted_ name:*MEMORY[0x263F28D88] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v5 selector:sel_sessionInterrupted_ name:*MEMORY[0x263F28D60] object:0];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __52__REAudioManagerNotificationListener_initWithOwner___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (void *)MEMORY[0x237DBDCF0]();
    uint64_t v3 = [MEMORY[0x263F28D90] sharedInstance];
    os_unfair_lock_lock(v5 + 6);
    v4 = *(void **)&v5[4]._os_unfair_lock_opaque;
    *(void *)&v5[4]._os_unfair_lock_opaque = v3;

    os_unfair_lock_unlock(v5 + 6);
    WeakRetained = v5;
  }
}

- (AVAudioSession)audioSessionToFollow
{
  p_audioSessionMutex = &self->_audioSessionMutex;
  os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
  v4 = self->_audioSessionToFollow;
  os_unfair_lock_unlock(&p_audioSessionMutex->m_lock);
  return v4;
}

- (void)stop
{
  self->_owner = 0;
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)dealloc
{
  [(REAudioManagerNotificationListener *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)REAudioManagerNotificationListener;
  [(REAudioManagerNotificationListener *)&v3 dealloc];
}

- (void)servicesLost:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  owner = self->_owner;
  if (owner)
  {
    os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
    v6 = self->_audioSessionToFollow;
    os_unfair_lock_unlock(&self->_audioSessionMutex.m_lock);
    v7 = [v4 object];

    v9 = (os_log_t *)re::audioLogObjects(v8);
    v10 = *v9;
    if (v7 == v6)
    {
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233120000, v10, OS_LOG_TYPE_DEFAULT, "AudioManager media services lost notification", buf, 2u);
      }
      uint64_t v13 = (*((void (**)(AudioSceneService *))owner->var0 + 8))(owner);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__REAudioManagerNotificationListener_servicesLost___block_invoke;
      block[3] = &unk_264BE33B0;
      block[4] = self;
      id v15 = v4;
      id v16 = owner;
      dispatch_async(v13, block);
    }
    else
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v4 object];
        *(_DWORD *)buf = 67109120;
        int v18 = [v12 opaqueSessionID];
        _os_log_impl(&dword_233120000, v11, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Ignoring media services lost notification for audio session 0x%x", buf, 8u);
      }
    }
  }
}

void __51__REAudioManagerNotificationListener_servicesLost___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = *(void (**)(void))(**(void **)(a1 + 48) + 136);
    v2();
  }
  else
  {
    objc_super v3 = *re::audioLogObjects((re *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_233120000, v3, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Media services interrupted, but engine was shutdown. %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)servicesReset:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  owner = self->_owner;
  if (owner)
  {
    os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
    uint64_t v6 = self->_audioSessionToFollow;
    os_unfair_lock_unlock(&self->_audioSessionMutex.m_lock);
    uint64_t v7 = [v4 object];

    v9 = (os_log_t *)re::audioLogObjects(v8);
    v10 = *v9;
    if (v7 == v6)
    {
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233120000, v10, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioManager media services reset notification.", buf, 2u);
      }
      uint64_t v13 = (*((void (**)(AudioSceneService *))owner->var0 + 8))(owner);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__REAudioManagerNotificationListener_servicesReset___block_invoke;
      block[3] = &unk_264BE33B0;
      block[4] = self;
      id v15 = v4;
      id v16 = owner;
      dispatch_async(v13, block);
    }
    else
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v4 object];
        *(_DWORD *)buf = 67109120;
        int v18 = [v12 opaqueSessionID];
        _os_log_impl(&dword_233120000, v11, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Ignoring media services reset notification for audio session 0x%x", buf, 8u);
      }
    }
  }
}

void __52__REAudioManagerNotificationListener_servicesReset___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = *(void (**)(void))(**(void **)(a1 + 48) + 136);
    v2();
  }
  else
  {
    objc_super v3 = *re::audioLogObjects((re *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_233120000, v3, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Media services restored, but engine was shutdown. %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)sessionInterrupted:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
  int v5 = self->_audioSessionToFollow;
  os_unfair_lock_unlock(&self->_audioSessionMutex.m_lock);
  uint64_t v6 = [v4 name];
  if ([v6 isEqualToString:*MEMORY[0x263F28D60]])
  {
    uint64_t v7 = [v4 object];

    if (v7 != v5)
    {
      v9 = (id)*re::audioLogObjects(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v4 object];
        *(_DWORD *)buf = 138412546;
        id v18 = v4;
        __int16 v19 = 1024;
        int v20 = [v10 opaqueSessionID];
        _os_log_impl(&dword_233120000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring interruption notification %@ for audio session 0x%x", buf, 0x12u);
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  v11 = *re::audioLogObjects(v8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_233120000, v11, OS_LOG_TYPE_DEFAULT, "Session interrupted %@", buf, 0xCu);
  }
  owner = self->_owner;
  if (owner)
  {
    uint64_t v13 = (*((void (**)(AudioSceneService *))owner->var0 + 8))(self->_owner);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__REAudioManagerNotificationListener_sessionInterrupted___block_invoke;
    block[3] = &unk_264BE33B0;
    block[4] = self;
    id v15 = v4;
    id v16 = owner;
    dispatch_async(v13, block);
  }
LABEL_11:
}

void __57__REAudioManagerNotificationListener_sessionInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = [*(id *)(a1 + 40) name];
    int v3 = [v2 isEqualToString:*MEMORY[0x263F28D60]];

    if (!v3) {
      goto LABEL_5;
    }
    int v5 = [*(id *)(a1 + 40) userInfo];
    uint64_t v6 = [v5 valueForKey:*MEMORY[0x263F28D70]];
    int v7 = [v6 intValue];

    v8 = [*(id *)(a1 + 40) userInfo];
    v9 = [v8 valueForKey:*MEMORY[0x263F28D68]];
    char v10 = [v9 intValue];

    if (!v7 && (v10 & 1) != 0)
    {
LABEL_5:
      v11 = *re::audioLogObjects(v4);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_233120000, v11, OS_LOG_TYPE_DEFAULT, "Resetting session and engine", (uint8_t *)&v14, 2u);
      }
      (*(void (**)(void, void))(**(void **)(a1 + 48) + 136))(*(void *)(a1 + 48), 0);
    }
  }
  else
  {
    uint64_t v12 = *re::audioLogObjects((re *)a1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_233120000, v12, OS_LOG_TYPE_DEFAULT, "Session interrupted, but engine was shutdown. %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end