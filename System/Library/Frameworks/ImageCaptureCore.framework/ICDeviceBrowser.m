@interface ICDeviceBrowser
- (BOOL)containsDevice:(id)a3;
- (BOOL)isBrowsing;
- (BOOL)isSuspended;
- (ICAuthorizationStatus)contentsAuthorizationStatus;
- (ICAuthorizationStatus)controlAuthorizationStatus;
- (ICDevice)preferredDevice;
- (ICDeviceTypeMask)browsedDeviceTypeMask;
- (NSArray)devices;
- (NSMutableArray)internalDevices;
- (id)delegate;
- (id)deviceWithRef:(id)a3;
- (id)init;
- (os_unfair_lock_s)devicesLock;
- (unint64_t)internalBrowsedDeviceTypeMask;
- (void)addDevice:(id)a3 moreComing:(BOOL)a4;
- (void)removeDevice:(id)a3 moreGoing:(BOOL)a4;
- (void)requestContentsAuthorizationWithCompletion:(void *)completion;
- (void)requestControlAuthorizationWithCompletion:(void *)completion;
- (void)resetContentsAuthorizationWithCompletion:(void *)completion;
- (void)resetControlAuthorizationWithCompletion:(void *)completion;
- (void)setBrowsedDeviceTypeMask:(ICDeviceTypeMask)browsedDeviceTypeMask;
- (void)setBrowsing:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setDevicesLock:(os_unfair_lock_s)a3;
- (void)setInternalBrowsedDeviceTypeMask:(unint64_t)a3;
- (void)setInternalDevices:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDeviceBrowser

- (void)start
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  v3 = @"ICDeviceBrowser";
  if ((unint64_t)[@"ICDeviceBrowser" length] >= 0x15)
  {
    v4 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = [NSString stringWithFormat:@"🔵 browser start"];
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    int v34 = 136446466;
    uint64_t v35 = [(__CFString *)v7 UTF8String];
    __int16 v36 = 2114;
    v37 = v5;
    _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);
  }
  uint64_t v9 = [(ICDeviceBrowser *)self delegate];
  if (v9)
  {
    v10 = (void *)v9;
    BOOL v11 = [(ICDeviceBrowser *)self isBrowsing];

    if (!v11)
    {
      __ICOSLogCreate();
      v27 = @"ICDeviceBrowser";
      if ((unint64_t)[@"ICDeviceBrowser" length] >= 0x15)
      {
        v28 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
        v27 = [v28 stringByAppendingString:@".."];
      }
      v29 = [NSString stringWithFormat:@"🟢 browser started"];
      v30 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v27;
        v32 = v30;
        uint64_t v33 = [(__CFString *)v31 UTF8String];
        int v34 = 136446466;
        uint64_t v35 = v33;
        __int16 v36 = 2114;
        v37 = v29;
        _os_log_impl(&dword_1BEEFF000, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);
      }
      [(ICDeviceBrowser *)self setBrowsing:1];
      v20 = +[ICCameraDeviceBrowser defaultBrowser];
      [(__CFString *)v20 start:self];
      goto LABEL_24;
    }
  }
  if ([(ICDeviceBrowser *)self isBrowsing])
  {
    __ICOSLogCreate();
    v12 = @"ICDeviceBrowser";
    if ((unint64_t)[@"ICDeviceBrowser" length] >= 0x15)
    {
      v13 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
      v12 = [v13 stringByAppendingString:@".."];
    }
    v14 = [NSString stringWithFormat:@"🟢 browser already started"];
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v12;
      v17 = v15;
      uint64_t v18 = [(__CFString *)v16 UTF8String];
      int v34 = 136446466;
      uint64_t v35 = v18;
      __int16 v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_1BEEFF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);
    }
  }
  v19 = [(ICDeviceBrowser *)self delegate];

  if (!v19)
  {
    __ICOSLogCreate();
    v20 = @"ICDeviceBrowser";
    if ((unint64_t)[@"ICDeviceBrowser" length] >= 0x15)
    {
      v21 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
      v20 = [v21 stringByAppendingString:@".."];
    }
    v22 = [NSString stringWithFormat:@"🔴 browser delegate nil"];
    v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v20;
      v25 = v23;
      uint64_t v26 = [(__CFString *)v24 UTF8String];
      int v34 = 136446466;
      uint64_t v35 = v26;
      __int16 v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_1BEEFF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);
    }
LABEL_24:
  }
}

- (id)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICDeviceBrowser;
  v2 = [(ICDeviceBrowser *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    [(ICDeviceBrowser *)v2 setInternalDevices:v3];

    [(ICDeviceBrowser *)v2 setBrowsedDeviceTypeMask:257];
    v2->_devicesLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v2;
}

- (ICDeviceTypeMask)browsedDeviceTypeMask
{
  return self->_internalBrowsedDeviceTypeMask;
}

- (void)setBrowsedDeviceTypeMask:(ICDeviceTypeMask)browsedDeviceTypeMask
{
  if (self->_internalBrowsedDeviceTypeMask != browsedDeviceTypeMask) {
    self->_internalBrowsedDeviceTypeMask = browsedDeviceTypeMask;
  }
}

- (void)stop
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  __ICOSLogCreate();
  v3 = @"ICDeviceBrowser";
  if ((unint64_t)[@"ICDeviceBrowser" length] >= 0x15)
  {
    v4 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = [NSString stringWithFormat:@"🔵 browser stop"];
  objc_super v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    int v27 = 136446466;
    uint64_t v28 = [(__CFString *)v7 UTF8String];
    __int16 v29 = 2114;
    v30 = v5;
    _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v27, 0x16u);
  }
  BOOL v9 = [(ICDeviceBrowser *)self isBrowsing];
  __ICOSLogCreate();
  unint64_t v10 = [@"ICDeviceBrowser" length];
  if (v9)
  {
    if (v10 >= 0x15)
    {
      BOOL v11 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
      v13 = [v11 stringByAppendingString:@".."];
    }
    else
    {
      v13 = @"ICDeviceBrowser";
    }
    v14 = [NSString stringWithFormat:@"🟢 browser stopped"];
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v13;
      v17 = v15;
      uint64_t v18 = [(__CFString *)v16 UTF8String];
      int v27 = 136446466;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_1BEEFF000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v27, 0x16u);
    }
    [(ICDeviceBrowser *)self setBrowsing:0];
    ICDeviceTypeMask v19 = [(ICDeviceBrowser *)self browsedDeviceTypeMask];
    [(ICDeviceBrowser *)self setBrowsedDeviceTypeMask:0];
    v20 = +[ICCameraDeviceBrowser defaultBrowser];
    [v20 stop:self];

    [(ICDeviceBrowser *)self setBrowsedDeviceTypeMask:v19];
  }
  else
  {
    if (v10 >= 0x15)
    {
      v12 = objc_msgSend(@"ICDeviceBrowser", "substringWithRange:", 0, 18);
      v21 = [v12 stringByAppendingString:@".."];
    }
    else
    {
      v21 = @"ICDeviceBrowser";
    }
    v22 = [NSString stringWithFormat:@"🟢 browser already stopped"];
    v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v21;
      v25 = v23;
      uint64_t v26 = [(__CFString *)v24 UTF8String];
      int v27 = 136446466;
      uint64_t v28 = v26;
      __int16 v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_1BEEFF000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v27, 0x16u);
    }
  }
}

- (NSArray)devices
{
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  v4 = (void *)MEMORY[0x1E4F1C978];
  v5 = [(ICDeviceBrowser *)self internalDevices];
  objc_super v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_devicesLock);

  return (NSArray *)v6;
}

- (ICDevice)preferredDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(ICDeviceBrowser *)self devices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 preferred])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (ICDevice *)v3;
}

- (void)addDevice:(id)a3 moreComing:(BOOL)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_devicesLock);
  v7 = [(ICDeviceBrowser *)self internalDevices];
  [v7 addObject:v6];

  os_unfair_lock_unlock(&self->_devicesLock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ICDeviceBrowser_addDevice_moreComing___block_invoke;
  block[3] = &unk_1E63D7C38;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  ICPerformBlockOnMainThread(block);
}

void __40__ICDeviceBrowser_addDevice_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) willChangeValueForKey:@"devices"];
  [*(id *)(a1 + 32) didChangeValueForKey:@"devices"];
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 deviceBrowser:*(void *)(a1 + 32) didAddDevice:*(void *)(a1 + 40) moreComing:*(unsigned __int8 *)(a1 + 48)];
  }
  __ICOSLogCreate();
  uint64_t v4 = @"Dev Browser";
  if ((unint64_t)[@"Dev Browser" length] >= 0x15)
  {
    v5 = objc_msgSend(@"Dev Browser", "substringWithRange:", 0, 18);
    uint64_t v4 = [v5 stringByAppendingString:@".."];
  }
  id v6 = NSString;
  v7 = [*(id *)(a1 + 40) name];
  id v8 = [v6 stringWithFormat:@"Added: %@", v7];

  long long v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v4;
    BOOL v11 = v9;
    *(_DWORD *)buf = 136446466;
    uint64_t v13 = [(__CFString *)v10 UTF8String];
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (void)removeDevice:(id)a3 moreGoing:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ICDeviceBrowser_removeDevice_moreGoing___block_invoke;
  block[3] = &unk_1E63D7C38;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  ICPerformBlockOnMainThread(block);
}

void __42__ICDeviceBrowser_removeDevice_moreGoing___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isBrowsing])
  {
    v2 = [*(id *)(a1 + 32) internalDevices];
    int v3 = [v2 containsObject:*(void *)(a1 + 40)];

    if (v3)
    {
      [*(id *)(a1 + 40) cleanupDeviceWithErrorCode:&unk_1F1A2C5E0 completionBlock:0];
      uint64_t v4 = [*(id *)(a1 + 32) delegate];

      if (v4)
      {
        v5 = [*(id *)(a1 + 32) delegate];
        [v5 deviceBrowser:*(void *)(a1 + 32) didRemoveDevice:*(void *)(a1 + 40) moreGoing:*(unsigned __int8 *)(a1 + 48)];
      }
      lock._os_unfair_lock_opaque = [*(id *)(a1 + 32) devicesLock];
      os_unfair_lock_lock(&lock);
      [*(id *)(a1 + 32) willChangeValueForKey:@"devices"];
      id v6 = [*(id *)(a1 + 32) internalDevices];
      [v6 removeObject:*(void *)(a1 + 40)];

      [*(id *)(a1 + 32) didChangeValueForKey:@"devices"];
      os_unfair_lock_unlock(&lock);
      __ICOSLogCreate();
      id v7 = @"Dev Browser";
      if ((unint64_t)[@"Dev Browser" length] >= 0x15)
      {
        id v8 = objc_msgSend(@"Dev Browser", "substringWithRange:", 0, 18);
        id v7 = [v8 stringByAppendingString:@".."];
      }
      id v9 = NSString;
      BOOL v10 = [*(id *)(a1 + 40) name];
      BOOL v11 = [v9 stringWithFormat:@"Removed: %@", v10];

      v12 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v7;
        __int16 v14 = v12;
        uint64_t v15 = [(__CFString *)v13 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v18 = v15;
        __int16 v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)containsDevice:(id)a3
{
  p_devicesLock = &self->_devicesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_devicesLock);
  id v6 = [(ICDeviceBrowser *)self internalDevices];
  char v7 = [v6 containsObject:v5];

  os_unfair_lock_unlock(p_devicesLock);
  return v7;
}

- (id)deviceWithRef:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(ICDeviceBrowser *)self internalDevices];
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v11 = [v10 deviceRef];
        int v12 = [v11 intValue];
        int v13 = [v4 intValue];

        if (v12 == v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_devicesLock);

  return v7;
}

- (ICAuthorizationStatus)contentsAuthorizationStatus
{
  v2 = +[ICPrefManager defaultAuthManager];
  int v3 = [v2 getContentsAuthorizationStatus];

  return (ICAuthorizationStatus)v3;
}

- (void)requestContentsAuthorizationWithCompletion:(void *)completion
{
  int v3 = completion;
  id v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E63D7728;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = +[ICPrefManager defaultAuthManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E63D7B78;
  id v4 = *(id *)(a1 + 32);
  [v2 requestContentsAuthorizationShouldPrompt:1 completion:v3];
}

void __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ICAuthorizationStatus)controlAuthorizationStatus
{
  v2 = +[ICPrefManager defaultAuthManager];
  id v3 = [v2 getControlAuthorizationStatus];

  return (ICAuthorizationStatus)v3;
}

- (void)requestControlAuthorizationWithCompletion:(void *)completion
{
  id v3 = completion;
  id v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E63D7728;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = +[ICPrefManager defaultAuthManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E63D7B78;
  id v4 = *(id *)(a1 + 32);
  [v2 requestControlAuthorizationShouldPrompt:1 completion:v3];
}

void __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetContentsAuthorizationWithCompletion:(void *)completion
{
  id v3 = completion;
  id v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E63D7728;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = +[ICPrefManager defaultAuthManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E63D7B78;
  id v4 = *(id *)(a1 + 32);
  [v2 resetContentsAuthorizationWithCompletion:v3];
}

void __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetControlAuthorizationWithCompletion:(void *)completion
{
  id v3 = completion;
  id v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E63D7728;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = +[ICPrefManager defaultAuthManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E63D7B78;
  id v4 = *(id *)(a1 + 32);
  [v2 resetControlAuthorizationWithCompletion:v3];
}

void __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ICAuthorizationStatus"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (ICDeviceBrowserDelegate *)delegate;
}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (NSMutableArray)internalDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalDevices:(id)a3
{
}

- (unint64_t)internalBrowsedDeviceTypeMask
{
  return self->_internalBrowsedDeviceTypeMask;
}

- (void)setInternalBrowsedDeviceTypeMask:(unint64_t)a3
{
  self->_internalBrowsedDeviceTypeMask = a3;
}

- (os_unfair_lock_s)devicesLock
{
  return self->_devicesLock;
}

- (void)setDevicesLock:(os_unfair_lock_s)a3
{
  self->_devicesLock = a3;
}

- (void).cxx_destruct
{
}

@end