@interface GKConnection
+ (BOOL)isRelayEnabled;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)externalAddressForCDXSelfConnectionData:(id)a3;
+ (id)externalAddressForSelfConnectionData:(id)a3;
- (BOOL)convertParticipantID:(id)a3 toPeerID:(id *)a4;
- (BOOL)convertPeerID:(id)a3 toParticipantID:(id *)a4;
- (GKConnection)initWithParticipantID:(id)a3;
- (OpaqueGCKSession)gckSession;
- (id)eventDelegate;
- (id)getLocalConnectionDataForLocalGaming;
- (id)networkStatistics;
- (id)networkStatisticsDictionaryForGCKStats:(void *)a3;
- (opaqueRTCReporting)reportingAgent;
- (unsigned)gckPID;
- (void)cancelConnectParticipant:(id)a3;
- (void)connect;
- (void)connectParticipantsWithConnectionData:(id)a3 withSessionInfo:(id)a4;
- (void)getLocalConnectionDataWithCompletionHandler:(id)a3;
- (void)initiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6;
- (void)preRelease;
- (void)setEventDelegate:(id)a3;
- (void)setParticipantID:(id)a3 forPeerID:(id)a4;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)updateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6;
@end

@implementation GKConnection

+ (id)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if (self == a1) {
    v4 = (objc_class *)self;
  }
  return NSAllocateObject(v4, 0, a3);
}

- (GKConnection)initWithParticipantID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  [(GKConnection *)&v4 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)preRelease
{
  v2.receiver = self;
  v2.super_class = (Class)GKConnection;
  [(GKConnection *)&v2 doesNotRecognizeSelector:a2];
}

- (OpaqueGCKSession)gckSession
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (opaqueRTCReporting)reportingAgent
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
}

- (void)setEventDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
}

- (id)eventDelegate
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (unsigned)gckPID
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)connect
{
  v2.receiver = self;
  v2.super_class = (Class)GKConnection;
  [(GKConnection *)&v2 doesNotRecognizeSelector:a2];
}

- (void)getLocalConnectionDataWithCompletionHandler:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
}

- (BOOL)convertParticipantID:(id)a3 toPeerID:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v5, sel_doesNotRecognizeSelector_, a2, a4);
  return 0;
}

- (BOOL)convertPeerID:(id)a3 toParticipantID:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v5, sel_doesNotRecognizeSelector_, a2, a4);
  return 0;
}

- (void)setParticipantID:(id)a3 forPeerID:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (void)connectParticipantsWithConnectionData:(id)a3 withSessionInfo:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2, a4);
}

- (void)initiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  v6.receiver = self;
  v6.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v6, sel_doesNotRecognizeSelector_, a2, a4, a5, a6);
}

- (void)updateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  v6.receiver = self;
  v6.super_class = (Class)GKConnection;
  -[GKConnection doesNotRecognizeSelector:](&v6, sel_doesNotRecognizeSelector_, a2, a4, a5, a6);
}

- (void)cancelConnectParticipant:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
}

- (id)networkStatisticsDictionaryForGCKStats:(void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKConnection;
  [(GKConnection *)&v4 doesNotRecognizeSelector:a2];
  return 0;
}

- (id)networkStatistics
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (id)getLocalConnectionDataForLocalGaming
{
  v3.receiver = self;
  v3.super_class = (Class)GKConnection;
  [(GKConnection *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

+ (id)externalAddressForSelfConnectionData:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 5, 4);
}

+ (id)externalAddressForCDXSelfConnectionData:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 1, 4);
}

+ (BOOL)isRelayEnabled
{
  if ((isRelayEnabled_relayEnabledCached & 1) == 0)
  {
    isRelayEnabled_relayEnabled = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"GeckoDisableRelay"), "BOOLValue") ^ 1;
    isRelayEnabled_relayEnabledCached = 1;
    if ((int)*MEMORY[0x263F21080] > 6 || *MEMORY[0x263F21090] != 0) {
      VRTraceVariable_();
    }
  }
  return isRelayEnabled_relayEnabled;
}

@end