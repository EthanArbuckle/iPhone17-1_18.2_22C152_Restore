@interface DOCSuggestionsTableViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (NSArray)keyCommands;
- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)init;
- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)keyCommandCancelSelection;
- (void)keyCommandConfirmSelection;
- (void)keyCommandMoveSelectionDown;
- (void)keyCommandMoveSelectionUp;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DOCSuggestionsTableViewController

- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)init
{
  return (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController *)sub_10024F504();
}

- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)initWithCoder:(id)a3
{
  *(void *)&self->suggestionsTableViewDelegate[OBJC_IVAR____TtC18DocumentAppIntents33DOCSuggestionsTableViewController_suggestionsTableViewDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents33DOCSuggestionsTableViewController_suggestions) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents33DOCSuggestionsTableViewController_sortedSuggestions) = (Class)_swiftEmptyArrayStorage;
  id v5 = a3;

  result = (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController *)sub_1004F6110();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for DOCSuggestionsTableView());
  v4 = self;
  id v5 = objc_msgSend(v3, "initWithFrame:style:", 0, 0.0, 0.0, 0.0, 0.0);
  [(DOCSuggestionsTableViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10024F774();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_10024FA7C();

  return v3 & 1;
}

- (NSArray)keyCommands
{
  if (sub_100251B54())
  {
    sub_100032070(0, (unint64_t *)&unk_10065F2C0);
    v2.super.isa = sub_1004F47D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)keyCommandMoveSelectionUp
{
  NSArray v2 = self;
  sub_10025015C(-1, 1, 1);
}

- (void)keyCommandMoveSelectionDown
{
  NSArray v2 = self;
  sub_10025015C(1, 1, 1);
}

- (void)keyCommandConfirmSelection
{
  NSArray v2 = self;
  sub_10024FE80();
}

- (void)keyCommandCancelSelection
{
  NSArray v2 = self;
  sub_10025015C(0, 2, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004F1860();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F17F0();
  id v10 = a3;
  v11 = self;
  sub_100250D64();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18DocumentAppIntents33DOCSuggestionsTableViewController_suggestions);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_1004F6130();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004F1860();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F17F0();
  id v10 = a3;
  v11 = self;
  sub_100251050(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18DocumentAppIntents33DOCSuggestionsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents33DOCSuggestionsTableViewController_suggestionsTableViewDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end