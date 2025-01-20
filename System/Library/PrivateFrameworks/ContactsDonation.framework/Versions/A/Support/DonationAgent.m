@interface DonationAgent
- (_TtC21contactsdonationagent13DonationAgent)init;
- (void)changeFromAccount:(id)a3 toAccount:(id)a4 completionHandler:(id)a5;
- (void)donateMeCardValues:(id)a3 completionHandler:(id)a4;
- (void)fetchDonatedMeCard:(id)a3;
- (void)meCardDonations:(id)a3;
- (void)rejectValueWithDonationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)rejectValuesWithClusterIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllRejectionsWithCompletionHandler:(id)a3;
- (void)removeDonatedMeCardValuesForIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)removeDonatedMeCardValuesWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)synchronousDonatedMeCard:(id)a3;
@end

@implementation DonationAgent

- (void)donateMeCardValues:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_100030EB8(v6, (char *)v7, (void (**)(void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)removeDonatedMeCardValuesForIdentifiers:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_10003119C(v6, (char *)v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)removeDonatedMeCardValuesWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_10003143C(v6, v8, (char *)v9, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)fetchDonatedMeCard:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler);
  uint64_t v7 = self;
  sub_100031B20((uint64_t)"fetchDonatedMeCard:", v6, v7, (void (*)(void))sub_1000107E8, v5);

  swift_release();
}

- (void)synchronousDonatedMeCard:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = self;
  _Block_copy(v4);
  uint64_t v6 = self;
  sub_100031F3C((uint64_t)"synchronousDonatedMeCard:", [v5 immediateScheduler], v6, (void (**)(void, void))v4);
  _Block_release(v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
}

- (void)meCardDonations:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100032358((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)changeFromAccount:(id)a3 toAccount:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100032590(a3, a4, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)rejectValueWithDonationIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)rejectValuesWithClusterIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)removeAllRejectionsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  uint64_t v6 = self;
  [v5 willRemoveAllRejections];
  [v5 didRemoveAllRejections];
  _Block_release(v4);
}

- (_TtC21contactsdonationagent13DonationAgent)init
{
  result = (_TtC21contactsdonationagent13DonationAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_preferencesMonitor));

  sub_100006BA8((uint64_t)self + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_distributedNotificationCenter));
  sub_100006BA8((uint64_t)self + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider);
  sub_100006BA8((uint64_t)self + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_environment);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end