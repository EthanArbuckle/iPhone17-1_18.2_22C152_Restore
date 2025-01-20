@interface ScheduledMessageMembershipObserver
- (_TtC12IMDaemonCore34ScheduledMessageMembershipObserver)init;
- (void)dealloc;
- (void)handleChatParticipantsDidChange:(id)a3;
@end

@implementation ScheduledMessageMembershipObserver

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, @"__kIMDChatParticipantsDidChangeNotification", 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ScheduledMessageMembershipObserver();
  [(ScheduledMessageMembershipObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12IMDaemonCore34ScheduledMessageMembershipObserver_chatRegistry);
}

- (void)handleChatParticipantsDidChange:(id)a3
{
  uint64_t v4 = sub_1D99062E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D99062B0();
  v8 = self;
  sub_1D98CD338();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC12IMDaemonCore34ScheduledMessageMembershipObserver)init
{
  result = (_TtC12IMDaemonCore34ScheduledMessageMembershipObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end