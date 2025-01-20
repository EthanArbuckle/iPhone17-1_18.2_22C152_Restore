@interface XPCDispatcher
- (void)cancelSessionWithContext:(id)a3 session:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)checkInWithCompletionHandler:(id)a3;
- (void)endSessionWithContext:(id)a3 session:(id)a4 completionHandler:(id)a5;
- (void)getCurrentSessionWithCompletionHandler:(id)a3;
- (void)getDownlinkMutedWithCompletionHandler:(id)a3;
- (void)getUplinkMutedForCurrentSessionWithCompletionHandler:(id)a3;
- (void)getUplinkMutedWithCompletionHandler:(id)a3;
- (void)loadDevicesWithContext:(id)a3 completionHandler:(id)a4;
- (void)registerAudioPowerWithContext:(id)a3 completionHandler:(id)a4;
- (void)requestStateForDevice:(id)a3 completionHandler:(id)a4;
- (void)setDownlinkMuted:(BOOL)a3 completionHandler:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 completionHandler:(id)a4;
- (void)setUplinkMutedForCurrentSession:(BOOL)a3 completionHandler:(id)a4;
- (void)startSessionWithContext:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)updateState:(int64_t)a3 reason:(id)a4 completionHandler:(id)a5;
@end

@implementation XPCDispatcher

- (void)checkInWithCompletionHandler:(id)a3
{
}

- (void)cancelSessionWithContext:(id)a3 session:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v13 = a3;
  id v11 = a4;
  swift_retain();
  id v12 = a5;
  sub_24D067294(v13, v11, a5, (uint64_t)sub_24D06CD98, v10);
  swift_release();

  swift_release();
}

- (void)startSessionWithContext:(id)a3 request:(id)a4 completionHandler:(id)a5
{
}

- (void)endSessionWithContext:(id)a3 session:(id)a4 completionHandler:(id)a5
{
}

- (void)getCurrentSessionWithCompletionHandler:(id)a3
{
}

- (void)setUplinkMutedForCurrentSession:(BOOL)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_retain();
  sub_24D06847C(a3, (uint64_t)self, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_release();
}

- (void)getUplinkMutedForCurrentSessionWithCompletionHandler:(id)a3
{
}

- (void)loadDevicesWithContext:(id)a3 completionHandler:(id)a4
{
}

- (void)registerAudioPowerWithContext:(id)a3 completionHandler:(id)a4
{
}

- (void)updateState:(int64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_24D0F05A0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  swift_retain();
  sub_24D06A48C(a3, v8, v10, (uint64_t)self, (void (**)(void, void))v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)requestStateForDevice:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_24D06B008(v7, (uint64_t)sub_24D06C488, v6);
  swift_release();
  swift_release();
}

- (void)setUplinkMuted:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)setDownlinkMuted:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)getUplinkMutedWithCompletionHandler:(id)a3
{
}

- (void)getDownlinkMutedWithCompletionHandler:(id)a3
{
}

@end