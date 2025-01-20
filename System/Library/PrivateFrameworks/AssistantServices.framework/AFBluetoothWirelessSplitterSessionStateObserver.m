@interface AFBluetoothWirelessSplitterSessionStateObserver
- (AFBluetoothWirelessSplitterSessionStateObserver)initWithQueue:(id)a3 delegate:(id)a4;
- (int64_t)state;
- (void)_invalidate;
- (void)_setState:(int64_t)a3;
- (void)dealloc;
- (void)getStateWithCompletion:(id)a3;
- (void)invalidate;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
@end

@implementation AFBluetoothWirelessSplitterSessionStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)state
{
  return self->_state;
}

- (void)_invalidate
{
  notifyObserver = self->_notifyObserver;
  if (notifyObserver)
  {
    [(AFNotifyObserver *)notifyObserver invalidate];
    v4 = self->_notifyObserver;
    self->_notifyObserver = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_setState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    v6 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      if (state > 2) {
        v8 = @"(unknown)";
      }
      else {
        v8 = off_1E59273F0[state];
      }
      v9 = v8;
      if ((unint64_t)a3 > 2) {
        v10 = @"(unknown)";
      }
      else {
        v10 = off_1E59273F0[a3];
      }
      v11 = v10;
      int v13 = 136315650;
      v14 = "-[AFBluetoothWirelessSplitterSessionStateObserver _setState:]";
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s state: %@ -> %@", (uint8_t *)&v13, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained bluetoothWirelessSplitterSessionStateObserver:self didChangeStateFrom:state to:a3];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AFBluetoothWirelessSplitterSessionStateObserver_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __61__AFBluetoothWirelessSplitterSessionStateObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didChangeStateFrom_to___block_invoke;
  v11[3] = &unk_1E592B1A8;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __88__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(result + 32);
  if (v1[3] == *(void *)(result + 40))
  {
    v2 = (void *)result;
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v2[6];
      uint64_t v5 = v2[7];
      int v7 = 136315650;
      id v8 = "-[AFBluetoothWirelessSplitterSessionStateObserver notifyObserver:didChangeStateFrom:to:]_block_invoke";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s fromState = %llu, toState = %llu", (uint8_t *)&v7, 0x20u);
      v1 = (void *)v2[4];
    }
    if (v2[7]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    return [v1 _setState:v6];
  }
  return result;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke;
  block[3] = &unk_1E592B180;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __98__AFBluetoothWirelessSplitterSessionStateObserver_notifyObserver_didReceiveNotificationWithToken___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 24) == *(void *)(a1 + 40))
  {
    v2 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v3 = *(_DWORD *)(a1 + 48);
      int v4 = 136315394;
      uint64_t v5 = "-[AFBluetoothWirelessSplitterSessionStateObserver notifyObserver:didReceiveNotificationWithToken:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = v3;
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s token = %d", (uint8_t *)&v4, 0x12u);
    }
  }
}

- (void)getStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsWirelessSplitter_onceToken != -1) {
      dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_235);
    }
    if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
    {
      queue = self->_queue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __74__AFBluetoothWirelessSplitterSessionStateObserver_getStateWithCompletion___block_invoke;
      v6[3] = &unk_1E592C6E8;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(queue, v6);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __74__AFBluetoothWirelessSplitterSessionStateObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32));
}

- (void)dealloc
{
  [(AFBluetoothWirelessSplitterSessionStateObserver *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFBluetoothWirelessSplitterSessionStateObserver;
  [(AFBluetoothWirelessSplitterSessionStateObserver *)&v3 dealloc];
}

- (AFBluetoothWirelessSplitterSessionStateObserver)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AFBluetoothWirelessSplitterSessionStateObserver;
  __int16 v9 = [(AFBluetoothWirelessSplitterSessionStateObserver *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    if (AFSupportsWirelessSplitter_onceToken != -1) {
      dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_235);
    }
    if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
    {
      int v11 = [[AFNotifyObserver alloc] initWithName:@"com.apple.bluetooth.WirelessSplitterOn" options:1 queue:v7 delegate:v10];
      notifyObserver = v10->_notifyObserver;
      v10->_notifyObserver = v11;

      uint64_t v13 = v10->_notifyObserver;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __74__AFBluetoothWirelessSplitterSessionStateObserver_initWithQueue_delegate___block_invoke;
      v15[3] = &unk_1E592B158;
      v16 = v10;
      [(AFNotifyObserver *)v13 getStateWithCompletion:v15];
    }
  }

  return v10;
}

uint64_t __74__AFBluetoothWirelessSplitterSessionStateObserver_initWithQueue_delegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[AFBluetoothWirelessSplitterSessionStateObserver initWithQueue:delegate:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s initialState = %llu", (uint8_t *)&v7, 0x16u);
  }
  if (a2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  return [*(id *)(a1 + 32) _setState:v5];
}

@end