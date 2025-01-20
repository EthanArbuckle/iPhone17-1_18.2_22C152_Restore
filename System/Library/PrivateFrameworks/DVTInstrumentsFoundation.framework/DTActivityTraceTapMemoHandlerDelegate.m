@interface DTActivityTraceTapMemoHandlerDelegate
- (id)peekAtMemo:(id)a3;
- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4;
- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4;
- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4;
@end

@implementation DTActivityTraceTapMemoHandlerDelegate

- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v7 = v5;
  uint64_t v8 = [v7 getBufferWithLength:&v13];
  if (v13)
  {
    uint64_t v9 = v8;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_2308D0AD0;
    v11[4] = sub_2308D0AE0;
    id v12 = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_2308D0AE8;
    v10[3] = &unk_264B8E278;
    v10[4] = v11;
    [v6 handleBulkData:v9 size:v13 destructor:v10];
    _Block_object_dispose(v11, 8);
  }
  if ([v7 finalMemo]) {
    [v6 sendHeartbeatTime:[v7 lastMachContinuousTimeSeen]];
  }
}

- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5 = a3;
  id v6 = [a4 memoHandler];
  v6[2](v6, v5);
}

- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5 = a3;
  id v6 = [a4 memoHandler];
  v6[2](v6, v5);
}

- (id)peekAtMemo:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

@end