@interface FBAParticipantTableViewController
- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithStyle:(int64_t)a3;
- (_TtP18Feedback_Assistant41FBAParticipantTableViewControllerDelegate_)participantDelegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureWithContentItem:(id)a3;
- (void)dismissSelf;
- (void)setParticipantDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBAParticipantTableViewController

- (_TtP18Feedback_Assistant41FBAParticipantTableViewControllerDelegate_)participantDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18Feedback_Assistant41FBAParticipantTableViewControllerDelegate_ *)Strong;
}

- (void)setParticipantDelegate:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000662DC();
}

- (void)configureWithContentItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10006649C(v4);
}

- (void)dismissSelf
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_displayedParticipants);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_100066B34(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  id v10 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)aBlock - v11;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = self;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, v10, v6);
  aBlock[4] = sub_100067EF0;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000992C4;
  aBlock[3] = &unk_1000F5178;
  v15 = _Block_copy(aBlock);
  v16 = self;
  id v17 = a3;
  swift_release();
  [(FBAParticipantTableViewController *)v16 dismissViewControllerAnimated:1 completion:v15];
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithStyle:(int64_t)a3
{
  return (_TtC18Feedback_Assistant33FBAParticipantTableViewController *)sub_10006737C(a3);
}

- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18Feedback_Assistant33FBAParticipantTableViewController *)sub_1000674A8(v5, v7, a4);
}

- (_TtC18Feedback_Assistant33FBAParticipantTableViewController)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant33FBAParticipantTableViewController *)sub_100067654(a3);
}

- (void).cxx_destruct
{
  sub_100056D7C((uint64_t)self + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_participantDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_assignee));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_originator));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant33FBAParticipantTableViewController_searchController);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100067884(v4);
}

@end