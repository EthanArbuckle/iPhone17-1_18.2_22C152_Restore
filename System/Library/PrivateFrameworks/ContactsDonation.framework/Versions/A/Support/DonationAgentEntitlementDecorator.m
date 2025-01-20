@interface DonationAgentEntitlementDecorator
- (_TtC21contactsdonationagent33DonationAgentEntitlementDecorator)init;
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

@implementation DonationAgentEntitlementDecorator

- (void)donateMeCardValues:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_10000FA04(v6, (uint64_t)v7, (void (**)(void, void))v5);
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
  sub_10000FBA4(v6, (uint64_t)v7, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)removeDonatedMeCardValuesWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(void *, void, void *))_Block_copy(a4);
  v7 = self;
  if ((sub_10000EF90() & 1) == 0)
  {
    sub_10000F1B4();
    uint64_t v6 = (void *)_convertErrorToNSError(_:)();
    v5[2](v5, 0, v6);

    swift_errorRelease();
  }
  _Block_release(v5);
}

- (void)fetchDonatedMeCard:(id)a3
{
}

- (void)synchronousDonatedMeCard:(id)a3
{
}

- (void)meCardDonations:(id)a3
{
}

- (void)changeFromAccount:(id)a3 toAccount:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10001018C((uint64_t)a3, (uint64_t)a4, (uint64_t)v11, (void (**)(void, void))v8);
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
}

- (_TtC21contactsdonationagent33DonationAgentEntitlementDecorator)init
{
  result = (_TtC21contactsdonationagent33DonationAgentEntitlementDecorator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_errorRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end