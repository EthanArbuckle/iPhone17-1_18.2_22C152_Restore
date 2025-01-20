@interface SatelliteSMSServiceSession
- (BOOL)shouldExcludeChatFromRelay:(id)a3;
- (SatelliteSMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)connectedServicesChanged:(int64_t)a3;
- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)sendMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6;
- (void)stateChanged:(id)a3;
@end

@implementation SatelliteSMSServiceSession

- (SatelliteSMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (SatelliteSMSServiceSession *)SatelliteSMSServiceSession.init(account:service:replicatingFor:)(v7, v8, a5);
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  SatelliteSMSServiceSession.calculateReachability(with:responseHandler:)(v6, a4);

  swift_unknownObjectRelease();
}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return 1;
}

- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  sub_10470();
  sub_10470();
  v5 = self;
  id v6 = self;
  NSString v7 = sub_10460();
  NSString v8 = sub_10460();
  LODWORD(v5) = [v5 IMMMSMaxRecipientsForPhoneNumber:v7 simID:v8];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (int)v5;
}

- (void)sendMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6
{
  int v6 = a6;
  v10 = (void *)sub_10470();
  v12 = v11;
  id v13 = a3;
  id v14 = a5;
  v15 = self;
  SatelliteSMSServiceSession.sendMessage(from:forChat:chat:style:)(v13, v10, v12, (uint64_t)v14, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_7C9C(v4);
}

- (void)connectedServicesChanged:(int64_t)a3
{
  id v4 = self;
  sub_7FD0(a3);
}

- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5
{
  NSString v8 = _Block_copy(a5);
  if (a4) {
    sub_10440();
  }
  _Block_copy(v8);
  swift_unknownObjectRetain();
  id v9 = self;
  sub_BCD0(a3, (char *)v9, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)networkMonitorDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  SatelliteSMSServiceSession.networkMonitorDidUpdate(_:)(v4);
}

@end