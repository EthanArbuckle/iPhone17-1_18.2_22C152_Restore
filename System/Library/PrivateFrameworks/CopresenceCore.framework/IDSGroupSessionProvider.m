@interface IDSGroupSessionProvider
- (NSString)description;
- (_TtC14CopresenceCore23IDSGroupSessionProvider)init;
- (void)dealloc;
- (void)groupSessionDidTerminate:(id)a3;
- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 participantDidJoinGroupWithInfo:(id)a4;
- (void)session:(id)a3 participantDidLeaveGroupWithInfo:(id)a4;
- (void)session:(id)a3 rejectedKeyRecoveryRequestFromURI:(id)a4 reason:(unsigned int)a5;
- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5;
- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4;
- (void)sessiondidReceiveKeyUpdate:(id)a3;
@end

@implementation IDSGroupSessionProvider

- (void)dealloc
{
  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore23IDSGroupSessionProvider_groupSession);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IDSGroupSessionProvider();
  [(IDSGroupSessionProvider *)&v6 dealloc];
}

- (void).cxx_destruct
{
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore23IDSGroupSessionProvider_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore23IDSGroupSessionProvider_service);

  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore23IDSGroupSessionProvider____lazy_storage___userDefaults, (uint64_t *)&demangling cache variable for type metadata for ProtectedStorage?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore23IDSGroupSessionProvider_abcReporter);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore23IDSGroupSessionProvider_powerAssertion);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = IDSGroupSessionProvider.description.getter();
  uint64_t v5 = v4;

  objc_super v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14CopresenceCore23IDSGroupSessionProvider)init
{
  result = (_TtC14CopresenceCore23IDSGroupSessionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  IDSGroupSessionProvider.sessionDidJoinGroup(_:participantUpdate:error:)(v8, v9, a5);
}

- (void)session:(id)a3 participantDidJoinGroupWithInfo:(id)a4
{
}

- (void)session:(id)a3 participantDidLeaveGroupWithInfo:(id)a4
{
}

- (void)groupSessionDidTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  IDSGroupSessionProvider.groupSessionDidTerminate(_:)(v4);
}

- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = self;
  id v10 = a5;
  IDSGroupSessionProvider.groupSessionEnded(_:with:error:)(v8, a4, a5);
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
}

- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  IDSGroupSessionProvider.sessionDidLeaveGroup(_:error:)(v6, a4);
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
}

- (void)session:(id)a3 rejectedKeyRecoveryRequestFromURI:(id)a4 reason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  specialized IDSGroupSessionProvider.session(_:rejectedKeyRecoveryRequestFrom:reason:)(v9, v5);
}

- (void)sessiondidReceiveKeyUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized IDSGroupSessionProvider.sessiondidReceiveKeyUpdate(_:)();
}

- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for IDSGroupSessionActiveParticipant);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = self;
  specialized IDSGroupSessionProvider.session(_:didReceiveActiveLightweightParticipants:success:)(v8, a5);

  swift_bridgeObjectRelease();
}

@end