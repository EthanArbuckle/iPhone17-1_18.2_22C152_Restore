@interface ANAnnouncementStatePublisher
- (ANAnnouncementStatePublisher)init;
- (BOOL)_setName:(id)a3;
- (BOOL)_setState:(unint64_t)a3 withToken:(int)a4;
- (void)_publishState:(unint64_t)a3 name:(id)a4;
- (void)_register;
- (void)_unregister;
- (void)dealloc;
- (void)invalidate;
- (void)publishState:(unint64_t)a3 name:(id)a4;
@end

@implementation ANAnnouncementStatePublisher

- (void)dealloc
{
  [(ANAnnouncementStatePublisher *)self _unregister];
  name = self->_name;
  if (name)
  {
    free(name);
    self->_name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ANAnnouncementStatePublisher;
  [(ANAnnouncementStatePublisher *)&v4 dealloc];
}

- (ANAnnouncementStatePublisher)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANAnnouncementStatePublisher;
  v2 = [(ANAnnouncementStatePublisher *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.announce.statePublisherQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)publishState:(unint64_t)a3 name:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ANAnnouncementStatePublisher_publishState_name___block_invoke;
  v9[3] = &unk_1E6BCEFC0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __50__ANAnnouncementStatePublisher_publishState_name___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _publishState:*(void *)(a1 + 48) name:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ANAnnouncementStatePublisher_invalidate__block_invoke;
  block[3] = &unk_1E6BCE238;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__ANAnnouncementStatePublisher_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregister];
}

- (void)_publishState:(unint64_t)a3 name:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(ANAnnouncementStatePublisher *)self _setName:v6])
  {
    [(ANAnnouncementStatePublisher *)self _register];
    if (self->_registrationToken != -1
      && -[ANAnnouncementStatePublisher _setState:withToken:](self, "_setState:withToken:", a3))
    {
      notify_post(self->_name);
      v7 = ANLogHandleAnnouncementStatePublisher();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412802;
        id v10 = &stru_1F34A0E10;
        __int16 v11 = 2048;
        unint64_t v12 = a3;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Publish state: %lu for name: %@", (uint8_t *)&v9, 0x20u);
      }
    }
    [(ANAnnouncementStatePublisher *)self _unregister];
  }
  else
  {
    id v8 = ANLogHandleAnnouncementStatePublisher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      id v10 = &stru_1F34A0E10;
      __int16 v11 = 2112;
      unint64_t v12 = (unint64_t)v6;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_ERROR, "%@Error while setting name: %@.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)_setName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ANAnnouncementStatePublisher *)self _unregister];
  name = self->_name;
  if (name)
  {
    free(name);
    self->_name = 0;
  }
  size_t v6 = [v4 maximumLengthOfBytesUsingEncoding:4] + 1;
  v7 = (char *)malloc_type_malloc(v6, 0x9A4CF87DuLL);
  self->_name = v7;
  char v8 = [v4 getCString:v7 maxLength:v6 encoding:4];
  if ((v8 & 1) == 0)
  {
    int v9 = ANLogHandleAnnouncementStatePublisher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      unint64_t v12 = &stru_1F34A0E10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_ERROR, "%@Unable to get C string of name from %@.", (uint8_t *)&v11, 0x16u);
    }
  }
  return v8;
}

- (BOOL)_setState:(unint64_t)a3 withToken:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint32_t v7 = notify_set_state(a4, a3);
  if (v7)
  {
    char v8 = ANLogHandleAnnouncementStatePublisher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      int v12 = 138413314;
      __int16 v13 = &stru_1F34A0E10;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2080;
      v17 = name;
      __int16 v18 = 1024;
      int v19 = a4;
      __int16 v20 = 1024;
      uint32_t v21 = v7;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_ERROR, "%@Failed to set state to %lu of %s with token %d (status = %u).", (uint8_t *)&v12, 0x2Cu);
    }

    id v10 = +[ANAnalytics shared];
    [v10 error:5014];
  }
  return v7 == 0;
}

- (void)_register
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_registrationToken == -1)
  {
    int out_token = -1;
    uint32_t v3 = notify_register_check(self->_name, &out_token);
    if (v3)
    {
      uint32_t v4 = v3;
      v5 = ANLogHandleAnnouncementStatePublisher();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412802;
        int v11 = &stru_1F34A0E10;
        __int16 v12 = 2080;
        __int16 v13 = name;
        __int16 v14 = 1024;
        int v15 = v4;
        _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_ERROR, "%@Failed to get registration token of %s (status = %u).", buf, 0x1Cu);
      }

      uint32_t v7 = +[ANAnalytics shared];
      [v7 error:5015];
    }
    else
    {
      self->_registrationToken = out_token;
      uint32_t v7 = ANLogHandleAnnouncementStatePublisher();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        char v8 = self->_name;
        *(_DWORD *)buf = 138412802;
        int v11 = &stru_1F34A0E10;
        __int16 v12 = 2080;
        __int16 v13 = v8;
        __int16 v14 = 1024;
        int v15 = out_token;
        _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Registration token of %s is %d.", buf, 0x1Cu);
      }
    }
  }
}

- (void)_unregister
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_int registrationToken = -1;
    uint32_t v4 = ANLogHandleAnnouncementStatePublisher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      int v6 = 138412546;
      uint32_t v7 = &stru_1F34A0E10;
      __int16 v8 = 2080;
      int v9 = name;
      _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Registration token of %s is invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
}

@end