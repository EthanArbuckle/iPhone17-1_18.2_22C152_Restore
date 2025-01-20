@interface GKFastSyncTransport
- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4;
- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8;
- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7;
- (GKFastSyncTransport)init;
- (NSData)nearbyConnectionData;
- (id)enrichPeerDictionariesForPlayersConnection:(id)a3;
- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5;
- (void)acceptRelayResponse:(id)a3 playerID:(id)a4;
- (void)chooseBestHostingPlayerWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4;
- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4;
- (void)connectToPlayersWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4;
- (void)disconnectAllWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4;
- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4;
- (void)localConnectionDataWithCompletionHandler:(id)a3;
- (void)preemptRelay:(id)a3;
@end

@implementation GKFastSyncTransport

- (void)connectToPlayersWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4
{
}

- (void)disconnectAllWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4
{
}

- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = self;
  uint64_t v17 = sub_1C2E91A58();
  unint64_t v19 = v18;

  sub_1C2E1B24C(0, &qword_1EA3387D8);
  unint64_t v20 = sub_1C2E92488();

  FastSyncTransport.sendScopedData(_:to:dataMode:dataScope:transportContext:)(v17, v19, v20, a5, a6, (uint64_t)v15);
  swift_bridgeObjectRelease();
  sub_1C2DFD1D4(v17, v19);
  return 1;
}

- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = self;
  uint64_t v14 = sub_1C2E91A58();
  unint64_t v16 = v15;

  FastSyncTransport.sendScopedData(toAll:dataMode:dataScope:transportContext:)(v14, v16, a4, a5, (uint64_t)v12);
  sub_1C2DFD1D4(v14, v16);
  return 1;
}

- (void)chooseBestHostingPlayerWithTransportContext:(GKTransportContext *)a3 completionHandler:(id)a4
{
}

- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5
{
  sub_1C2E922F8();
  sub_1C2E1B24C(0, &qword_1EA3387D8);
  sub_1C2E92488();
  id v7 = a5;
  v8._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v8._countAndFlagsBits;
  FastSyncTransport.voiceChat(withName:players:transportContext:)(v12, v8, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 0;
}

- (GKFastSyncTransport)init
{
}

- (void).cxx_destruct
{
  sub_1C2E0D6DC((uint64_t)self + OBJC_IVAR___GKFastSyncTransport_clientDelegate);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (NSData)nearbyConnectionData
{
  v2 = self;
  FastSyncTransport.nearbyConnectionData.getter();

  v3 = (void *)sub_1C2E91A48();
  sub_1C2DFD1D4(0, 0xC000000000000000);

  return (NSData *)v3;
}

- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.super.super.Class isa = (Class)self;
  Class isa = v10.super.super.isa;
  FastSyncTransport.connect(toGuestPlayer:withHostPlayer:)(v10, v11);

  return 0;
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  GKPlayer v11 = self;
  uint64_t v8 = sub_1C2E91A58();
  unint64_t v10 = v9;

  FastSyncTransport.connect(toNearbyPlayer:withConnectionData:)();
  sub_1C2DFD1D4(v8, v10);
}

- (id)enrichPeerDictionariesForPlayersConnection:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA339220);
  sub_1C2E92488();
  v4 = self;
  FastSyncTransport.enrichPeerDictionaries(forPlayersConnection:)();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1C2E92478();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)localConnectionDataWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;

  sub_1C2E83A20((uint64_t)&unk_1EA339218, v5);
}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  sub_1C2E92228();
  sub_1C2E922F8();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  sub_1C2E92228();

  swift_bridgeObjectRelease();
}

- (void)preemptRelay:(id)a3
{
  sub_1C2E922F8();

  swift_bridgeObjectRelease();
}

@end