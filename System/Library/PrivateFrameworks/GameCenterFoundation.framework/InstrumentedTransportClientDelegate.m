@interface InstrumentedTransportClientDelegate
- (void)connectionDidChangeWithState:(int)a3 playerID:(id)a4;
- (void)connectionDidFailWithError:(id)a3;
- (void)relayDidReceivePushData:(id)a3 completionHandler:(id)a4;
- (void)transportDidFailWithError:(id)a3;
- (void)transportDidReceivePacket:(id)a3 fromPlayerID:(id)a4 remoteRecipientID:(id)a5;
- (void)transportDidUpdateWithInfo:(id)a3;
@end

@implementation InstrumentedTransportClientDelegate

- (void)connectionDidChangeWithState:(int)a3 playerID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  sub_1C2E922F8();
  swift_retain();
  sub_1C2E18AC0(v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)connectionDidFailWithError:(id)a3
{
}

- (void)relayDidReceivePushData:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1C2E92228();
  _Block_copy(v5);
  swift_retain();
  sub_1C2E18C20(v6, (uint64_t)self, (void (**)(void, void))v5);
  _Block_release(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)transportDidFailWithError:(id)a3
{
}

- (void)transportDidReceivePacket:(id)a3 fromPlayerID:(id)a4 remoteRecipientID:(id)a5
{
  uint64_t v7 = sub_1C2E922F8();
  uint64_t v9 = v8;
  if (a5)
  {
    uint64_t v10 = sub_1C2E922F8();
    a5 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v12 = a3;
  swift_retain();
  sub_1C2E19014((uint64_t)v12, v7, v9, v10, a5);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)transportDidUpdateWithInfo:(id)a3
{
  sub_1C2E92228();
  swift_retain();
  sub_1C2E19194();
  swift_release();

  swift_bridgeObjectRelease();
}

@end