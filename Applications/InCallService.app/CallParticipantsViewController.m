@interface CallParticipantsViewController
- (_TtC13InCallService30CallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3;
- (_TtC13InCallService30CallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3 contactsCache:(id)a4;
- (id)currentCallGroups;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CallParticipantsViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10016CD38(a3);
}

- (id)currentCallGroups
{
  v2 = self;
  sub_10016D06C();

  sub_10016D2D0();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (_TtC13InCallService30CallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v4 = a3;
  return (_TtC13InCallService30CallParticipantsViewController *)sub_10016D14C(a3);
}

- (_TtC13InCallService30CallParticipantsViewController)initWithCallDisplayStyleManager:(id)a3 contactsCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  return (_TtC13InCallService30CallParticipantsViewController *)sub_10016D1CC(a3, a4);
}

@end