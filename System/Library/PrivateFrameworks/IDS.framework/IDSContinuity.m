@interface IDSContinuity
- (IDSContinuity)initWithDelegate:(id)a3 queue:(id)a4;
- (int64_t)state;
- (void)dealloc;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7 boostedScan:(BOOL)a8;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7 boostedScan:(BOOL)a8 duplicates:(BOOL)a9;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6 boostedScan:(BOOL)a7;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 peers:(id)a5 withOptions:(id)a6;
- (void)startScanningForType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5;
- (void)startTrackingPeer:(id)a3;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
- (void)stopTrackingPeer:(id)a3;
@end

@implementation IDSContinuity

- (IDSContinuity)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsNotCurrent];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2A62C(v10);
    }
  }
  if (_IDSRunningInDaemon())
  {
    v11 = +[IDSLogging continuity];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v11);
    }

    v12 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)IDSContinuity;
    v13 = [(IDSContinuity *)&v20 init];
    if (v13)
    {
      v14 = +[IDSInternalQueueController sharedInstance];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_191919558;
      v16[3] = &unk_1E5728DA8;
      v17 = v13;
      id v18 = v6;
      id v19 = v7;
      [v14 performBlock:v16];
    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_191918620;
  v6[4] = sub_191918530;
  id v7 = (_IDSContinuity *)0xAAAAAAAAAAAAAAAALL;
  id v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1919196DC;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSContinuity;
  [(IDSContinuity *)&v4 dealloc];
}

- (int64_t)state
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919197F0;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = +[IDSInternalQueueController sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191919910;
  v13[3] = &unk_1E5728E20;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  [v10 performBlock:v13];
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919199C0;
  v6[3] = &unk_1E5728E48;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performBlock:v6];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 peers:(id)a5 withOptions:(id)a6
{
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5
{
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_191919AF4;
  v18[3] = &unk_1E5728E70;
  id v21 = v13;
  int64_t v22 = a3;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v14 performBlock:v18];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_191919BF4;
  v14[3] = &unk_1E5728E20;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  int64_t v17 = a3;
  id v12 = v10;
  id v13 = v9;
  [v11 performBlock:v14];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7 boostedScan:(BOOL)a8
{
  LOBYTE(v8) = 0;
  [(IDSContinuity *)self startScanningForType:a3 withData:a4 mask:a5 peers:a6 withOptions:a7 boostedScan:a8 duplicates:v8];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6 boostedScan:(BOOL)a7
{
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 withOptions:(id)a7 boostedScan:(BOOL)a8 duplicates:(BOOL)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  int64_t v17 = +[IDSInternalQueueController sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_191919D58;
  v21[3] = &unk_1E5728E98;
  id v24 = v16;
  int64_t v25 = a3;
  v21[4] = self;
  id v22 = v14;
  id v23 = v15;
  BOOL v26 = a8;
  BOOL v27 = a9;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 performBlock:v21];
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 withOptions:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = +[IDSInternalQueueController sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_191919E78;
  v18[3] = &unk_1E5728EC0;
  v18[4] = self;
  id v19 = v13;
  id v20 = v14;
  int64_t v21 = a3;
  BOOL v22 = a7;
  BOOL v23 = a8;
  id v16 = v14;
  id v17 = v13;
  [v15 performBlock:v18];
}

- (void)stopScanningForType:(int64_t)a3
{
  v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191919F30;
  v6[3] = &unk_1E5728E48;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performBlock:v6];
}

- (void)startTrackingPeer:(id)a3
{
  v3 = +[IDSLogging continuity];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_191A2A6E0(v3);
  }
}

- (void)stopTrackingPeer:(id)a3
{
  v3 = +[IDSLogging continuity];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_191A2A764(v3);
  }
}

- (void).cxx_destruct
{
}

@end