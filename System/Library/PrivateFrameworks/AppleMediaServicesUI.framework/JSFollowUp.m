@interface JSFollowUp
- (_TtC14amsengagementd10JSFollowUp)init;
- (id)clearFollowUpWithBackingIdentifier:(id)a3;
- (id)clearFollowUpWithIdentifier:(id)a3 :(id)a4;
- (id)pendingFollowUpWithIdentfier:(id)a3 :(id)a4;
- (id)pendingFollowUps:(id)a3;
@end

@implementation JSFollowUp

- (id)clearFollowUpWithBackingIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  v5 = (void *)sub_1000E6854();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)clearFollowUpWithIdentifier:(id)a3 :(id)a4
{
  return sub_1000E8530(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000E6DCC);
}

- (id)pendingFollowUpWithIdentfier:(id)a3 :(id)a4
{
  return sub_1000E8530(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000E7710);
}

- (id)pendingFollowUps:(id)a3
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v4 = self;
  v5 = (void *)sub_1000E85EC();

  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC14amsengagementd10JSFollowUp)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd10JSFollowUp____lazy_storage___dateFormatter));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14amsengagementd10JSFollowUp_accountStore);
}

@end