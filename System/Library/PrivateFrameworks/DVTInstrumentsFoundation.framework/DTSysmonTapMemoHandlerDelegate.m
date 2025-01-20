@interface DTSysmonTapMemoHandlerDelegate
- (DTSysmonTapMemoHandlerDelegate)init;
- (id)peekAtMemo:(id)a3;
- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4;
- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4;
- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4;
@end

@implementation DTSysmonTapMemoHandlerDelegate

- (DTSysmonTapMemoHandlerDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)DTSysmonTapMemoHandlerDelegate;
  v2 = [(DTSysmonTapMemoHandlerDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordDecoder = v2->_recordDecoder;
    v2->_recordDecoder = (DTSysmonTapRecordDecoder *)v3;
  }
  return v2;
}

- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_23089D6A0;
  v17 = sub_23089D6B0;
  v7 = (void *)MEMORY[0x263F08910];
  v8 = [v5 samples];
  id v18 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

  uint64_t v9 = [ (id) v14[5] bytes];
  uint64_t v10 = [(id)v14[5] length];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_23089D6B8;
  v12[3] = &unk_264B8E278;
  v12[4] = &v13;
  [v6 handleBulkData:v9 size:v10 destructor:v12];
  v11 = objc_opt_new();
  [v11 setKind:1024];
  [v6 sendFrameMessage:v11];

  _Block_object_dispose(&v13, 8);
}

- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [v6 sessionHandler];

  if (v7)
  {
    v8 = objc_opt_new();
    uint64_t v9 = [v11 samples];
    [v8 setSamples:v9];

    [v8 setRecordDecoder:self->_recordDecoder];
    uint64_t v10 = [v6 sessionHandler];
    ((void (**)(void, void *))v10)[2](v10, v8);
  }
}

- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [v6 sessionHandler];

  if (v7)
  {
    v8 = -[DTSysmonRecordEnumerator initWithHeartbeatTime:]([DTSysmonRecordEnumerator alloc], "initWithHeartbeatTime:", [v10 timestamp]);
    [(DTSysmonRecordEnumerator *)v8 setRecordDecoder:self->_recordDecoder];
    uint64_t v9 = [v6 sessionHandler];
    ((void (**)(void, DTSysmonRecordEnumerator *))v9)[2](v9, v8);
  }
}

- (id)peekAtMemo:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 samples];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [v3 samples];
    v8 = [v7 objectAtIndexedSubscript:0];

    uint64_t v9 = [v8 objectForKeyedSubscript:@"StartMachAbsTime"];
    uint64_t v10 = [v9 unsignedLongLongValue];

    id v11 = [NSNumber numberWithUnsignedLongLong:v10];
    [v4 setObject:v11 forKeyedSubscript:@"DTTapRecordingInfo_Timestamp"];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end