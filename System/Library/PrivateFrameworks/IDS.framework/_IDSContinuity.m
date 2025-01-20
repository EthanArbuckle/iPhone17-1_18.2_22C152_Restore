@interface _IDSContinuity
- (_IDSContinuity)initWithDelegate:(id)a3 queue:(id)a4 delegateContext:(id)a5;
- (int64_t)state;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_daemonDied:(id)a3;
- (void)_handleReconnect;
- (void)continuityDidDiscoverType:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5;
- (void)continuityDidFailToStartAdvertisingOfType:(int64_t)a3 withError:(id)a4;
- (void)continuityDidFailToStartScanningForType:(int64_t)a3 withError:(id)a4;
- (void)continuityDidLosePeer:(id)a3;
- (void)continuityDidLosePeer:(id)a3 forType:(int64_t)a4;
- (void)continuityDidStartAdvertisingOfType:(int64_t)a3;
- (void)continuityDidStartScanningForType:(int64_t)a3;
- (void)continuityDidStartTrackingPeer:(id)a3 error:(id)a4;
- (void)continuityDidStartTrackingPeer:(id)a3 forType:(int64_t)a4 error:(id)a5;
- (void)continuityDidStopAdvertisingOfType:(int64_t)a3;
- (void)continuityDidStopAdvertisingOfType:(int64_t)a3 withError:(id)a4;
- (void)continuityDidStopScanningForType:(int64_t)a3;
- (void)continuityDidStopTrackingPeer:(id)a3;
- (void)continuityDidStopTrackingPeer:(id)a3 forType:(int64_t)a4;
- (void)continuityDidUpdateStateToState:(int64_t)a3;
- (void)dealloc;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8;
- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4;
@end

@implementation _IDSContinuity

- (_IDSContinuity)initWithDelegate:(id)a3 queue:(id)a4 delegateContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A4298C();
    }
  }
  if (_IDSRunningInDaemon())
  {
    v14 = +[IDSLogging continuity];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v14);
    }

    v15 = 0;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)_IDSContinuity;
    v16 = [(_IDSContinuity *)&v26 init];
    if (v16)
    {
      v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 addObserver:v16 selector:sel__daemonDied_ name:@"__k_IDSDaemonDidConnectNotification" object:0];

      uint64_t v18 = [MEMORY[0x1E4F59E30] weakRefWithObject:v10];
      id delegateContext = v16->_delegateContext;
      v16->_id delegateContext = (id)v18;

      uint64_t v20 = [MEMORY[0x1E4F59E30] weakRefWithObject:v8];
      delegate = v16->_delegate;
      v16->_delegate = (CUTWeakReference *)v20;

      objc_storeStrong((id *)&v16->_queue, a4);
      v16->_state = 0;
      v22 = +[IDSDaemonController sharedInstance];
      v23 = [v22 listener];
      [v23 addHandler:v16];

      v24 = +[IDSDaemonController sharedInstance];
      [v24 continuityClientInstanceCreated];
    }
    self = v16;
    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  v4 = +[IDSDaemonController sharedInstance];
  v5 = [v4 listener];
  [v5 removeHandler:self];

  v6.receiver = self;
  v6.super_class = (Class)_IDSContinuity;
  [(_IDSContinuity *)&v6 dealloc];
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A42A24();
    }
  }
  int v12 = +[IDSDaemonController sharedInstance];
  [v12 continuityStartAdvertisingOfType:a3 withData:v8 withOptions:v7];
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  v4 = +[IDSInternalQueueController sharedInstance];
  int v5 = [v4 assertQueueIsCurrent];

  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A42ABC();
    }
  }
  id v7 = +[IDSDaemonController sharedInstance];
  [v7 continuityStopAdvertisingOfType:a3];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  int v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A42B54();
    }
  }
  v15 = objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_1EE246928);

  v16 = +[IDSDaemonController sharedInstance];
  [v16 continuityStartScanningForType:a3 withData:v11 mask:v10 peers:v15];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A42BEC();
    }
  }
  int v12 = +[IDSDaemonController sharedInstance];
  [v12 continuityStartScanningForType:a3 withData:v8 mask:v7];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = +[IDSInternalQueueController sharedInstance];
  int v17 = [v16 assertQueueIsCurrent];

  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_191A42C84();
    }
  }
  v19 = objc_msgSend(v13, "__imArrayByApplyingBlock:", &unk_1EE246928);

  uint64_t v20 = +[IDSDaemonController sharedInstance];
  [v20 continuityStartScanningForType:a3 withData:v15 mask:v14 peers:v19 boostedScan:v9 duplicates:v8];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[IDSInternalQueueController sharedInstance];
  int v14 = [v13 assertQueueIsCurrent];

  if (v14)
  {
    id v15 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_191A42D1C();
    }
  }
  v16 = +[IDSDaemonController sharedInstance];
  [v16 continuityStartScanningForType:a3 withData:v12 mask:v11 boostedScan:v8 duplicates:v7];
}

- (void)stopScanningForType:(int64_t)a3
{
  v4 = +[IDSInternalQueueController sharedInstance];
  int v5 = [v4 assertQueueIsCurrent];

  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A42DB4();
    }
  }
  BOOL v7 = +[IDSDaemonController sharedInstance];
  [v7 continuityStopScanningForType:a3];
}

- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A42E4C();
    }
  }
  BOOL v9 = +[IDSDaemonController sharedInstance];
  int v10 = [v5 UUIDString];

  [v9 continuityStartTrackingPeer:v10 forType:a4];
}

- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A42EE4();
    }
  }
  BOOL v9 = +[IDSDaemonController sharedInstance];
  int v10 = [v5 UUIDString];

  [v9 continuityStopTrackingPeer:v10 forType:a4];
}

- (void)_handleReconnect
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A42F7C();
    }
  }
  self->_state = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191A1A5A0;
  v7[3] = &unk_1E572D6F8;
  v7[4] = self;
  [(_IDSContinuity *)self _callDelegateWithBlock:v7];
  objc_super v6 = +[IDSDaemonController sharedInstance];
  [v6 continuityClientInstanceCreated];
}

- (void)_daemonDied:(id)a3
{
  int v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191A1A698;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[IDSInternalQueueController sharedInstance];
    int v6 = [v5 assertQueueIsCurrent];

    if (v6)
    {
      int v7 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A43014();
      }
    }
    uint64_t v8 = [(CUTWeakReference *)self->_delegate object];
    BOOL v9 = (void *)v8;
    queue = self->_queue;
    if (queue && v8)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_191A1A7C4;
      v11[3] = &unk_1E5729880;
      id v13 = v4;
      id v12 = v9;
      dispatch_async(queue, v11);
    }
  }
}

- (void)continuityDidUpdateStateToState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_191A1A854;
    v3[3] = &unk_1E572D6F8;
    v3[4] = self;
    [(_IDSContinuity *)self _callDelegateWithBlock:v3];
  }
}

- (void)continuityDidStartAdvertisingOfType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_191A1A928;
  v3[3] = &unk_1E572D720;
  v3[4] = self;
  void v3[5] = a3;
  [(_IDSContinuity *)self _callDelegateWithBlock:v3];
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_191A1AA10;
  v3[3] = &unk_1E572D720;
  v3[4] = self;
  void v3[5] = a3;
  [(_IDSContinuity *)self _callDelegateWithBlock:v3];
}

- (void)continuityDidStopAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A1AB28;
  v8[3] = &unk_1E572D748;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(_IDSContinuity *)self _callDelegateWithBlock:v8];
}

- (void)continuityDidFailToStartAdvertisingOfType:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A1AC40;
  v8[3] = &unk_1E572D748;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(_IDSContinuity *)self _callDelegateWithBlock:v8];
}

- (void)continuityDidStartScanningForType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_191A1AD48;
  v3[3] = &unk_1E572D720;
  v3[4] = self;
  void v3[5] = a3;
  [(_IDSContinuity *)self _callDelegateWithBlock:v3];
}

- (void)continuityDidStopScanningForType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_191A1AE30;
  v3[3] = &unk_1E572D720;
  v3[4] = self;
  void v3[5] = a3;
  [(_IDSContinuity *)self _callDelegateWithBlock:v3];
}

- (void)continuityDidFailToStartScanningForType:(int64_t)a3 withError:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A1AF48;
  v8[3] = &unk_1E572D748;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(_IDSContinuity *)self _callDelegateWithBlock:v8];
}

- (void)continuityDidDiscoverType:(int64_t)a3 withData:(id)a4 fromPeer:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191A1B0AC;
  v12[3] = &unk_1E572D770;
  id v13 = v9;
  int v14 = self;
  id v15 = v8;
  int64_t v16 = a3;
  id v10 = v8;
  id v11 = v9;
  [(_IDSContinuity *)self _callDelegateWithBlock:v12];
}

- (void)continuityDidLosePeer:(id)a3
{
}

- (void)continuityDidLosePeer:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A1B1F4;
  v8[3] = &unk_1E572D748;
  id v9 = v6;
  id v10 = self;
  int64_t v11 = a4;
  id v7 = v6;
  [(_IDSContinuity *)self _callDelegateWithBlock:v8];
}

- (void)continuityDidStartTrackingPeer:(id)a3 error:(id)a4
{
}

- (void)continuityDidStartTrackingPeer:(id)a3 forType:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_191A1B368;
  v12[3] = &unk_1E572D770;
  id v13 = v8;
  int v14 = self;
  id v15 = v9;
  int64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  [(_IDSContinuity *)self _callDelegateWithBlock:v12];
}

- (void)continuityDidStopTrackingPeer:(id)a3
{
}

- (void)continuityDidStopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_191A1B4B0;
  v8[3] = &unk_1E572D748;
  id v9 = v6;
  id v10 = self;
  int64_t v11 = a4;
  id v7 = v6;
  [(_IDSContinuity *)self _callDelegateWithBlock:v8];
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong(&self->_delegateContext, 0);
}

@end