@interface GKMultiplayerActivityReporter
- (GKMultiplayerActivityReporter)init;
- (GKMultiplayerActivityReporter)initWithLocalPlayerID:(id)a3 matchDataDelegate:(id)a4 apiReporter:(id)a5;
- (id)instrumentBestHostElectedHandler:(id)a3 transportContext:(id)a4;
- (id)instrumentClientDelegate:(id)a3 transportContext:(id)a4;
- (id)instrumentErrorHandler:(id)a3 transportContext:(id)a4;
- (void)onDisconnectWithTransportContext:(id)a3;
- (void)onGameplayEndedWithReason:(int64_t)a3 error:(id)a4 transportContext:(id)a5;
- (void)onGameplayStartedWithTransportContext:(id)a3;
- (void)onInviteSentWithApproach:(unint64_t)a3 isHosted:(BOOL)a4 recipients:(id)a5 transportContext:(id)a6;
- (void)onTransportError:(id)a3 transportContext:(id)a4;
@end

@implementation GKMultiplayerActivityReporter

- (GKMultiplayerActivityReporter)initWithLocalPlayerID:(id)a3 matchDataDelegate:(id)a4 apiReporter:(id)a5
{
  uint64_t v7 = sub_1C2E922F8();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  return (GKMultiplayerActivityReporter *)MultiplayerActivityReporter.init(localPlayerID:matchDataDelegate:apiReporter:)(v7, v9, (uint64_t)a4, a5);
}

- (id)instrumentClientDelegate:(id)a3 transportContext:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = (void *)MultiplayerActivityReporter.instrument(clientDelegate:transportContext:)((uint64_t)a3, v7);
  swift_unknownObjectRelease();

  return v9;
}

- (id)instrumentErrorHandler:(id)a3 transportContext:(id)a4
{
  v5 = _Block_copy(a3);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_1C2E1B298;
  }
  else
  {
    uint64_t v6 = 0;
  }
  MultiplayerActivityReporter.instrument(errorHandler:transportContext:)((uint64_t)v5, v6, a4);
  uint64_t v8 = v7;
  sub_1C2E1B288((uint64_t)v5);
  v11[4] = sub_1C2E18A28;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C2E15858;
  v11[3] = &block_descriptor_32;
  uint64_t v9 = _Block_copy(v11);
  swift_release();

  return v9;
}

- (id)instrumentBestHostElectedHandler:(id)a3 transportContext:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  MultiplayerActivityReporter.instrument(bestHostHandler:transportContext:)((uint64_t)sub_1C2E1B7E0, v6, a4);
  uint64_t v8 = v7;
  swift_release();
  v11[4] = sub_1C2E18A98;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C2E15B88;
  v11[3] = &block_descriptor_29;
  uint64_t v9 = _Block_copy(v11);
  swift_release();

  return v9;
}

- (void)onDisconnectWithTransportContext:(id)a3
{
  v4 = (GKTransportContext *)a3;
  v5 = self;
  MultiplayerActivityReporter.onDisconnect(transportContext:)(v4);
}

- (void)onGameplayStartedWithTransportContext:(id)a3
{
  v4 = (GKTransportContext *)a3;
  v5 = self;
  MultiplayerActivityReporter.onGameplayStarted(transportContext:)(v4);
}

- (void)onGameplayEndedWithReason:(int64_t)a3 error:(id)a4 transportContext:(id)a5
{
  id v8 = a5;
  uint64_t v9 = self;
  id v10 = a4;
  MultiplayerActivityReporter.onGameplayEnded(reason:error:transportContext:)(a3, (uint64_t)a4, v8);
}

- (void)onInviteSentWithApproach:(unint64_t)a3 isHosted:(BOOL)a4 recipients:(id)a5 transportContext:(id)a6
{
  sub_1C2E1B24C(0, &qword_1EA338A58);
  uint64_t v10 = sub_1C2E92488();
  id v11 = a6;
  v12 = self;
  MultiplayerActivityReporter.onInviteSent(approach:isHosted:recipients:transportContext:)(a3, a4, v10, v11);

  swift_bridgeObjectRelease();
}

- (void)onTransportError:(id)a3 transportContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  MultiplayerActivityReporter.onTransportError(error:transportContext:)((uint64_t)v9, v6, v8);
}

- (GKMultiplayerActivityReporter)init
{
}

- (void).cxx_destruct
{
  sub_1C2E0D6DC((uint64_t)self + OBJC_IVAR___GKMultiplayerActivityReporter_matchDataDelegate);
  swift_bridgeObjectRelease();

  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GKMultiplayerActivityReporter_stateQueue);
}

@end