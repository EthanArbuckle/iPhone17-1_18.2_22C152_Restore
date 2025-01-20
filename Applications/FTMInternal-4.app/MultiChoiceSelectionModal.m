@interface MultiChoiceSelectionModal
- (_TtC13FTMInternal_425MultiChoiceSelectionModal)initWithCoder:(id)a3;
- (_TtC13FTMInternal_425MultiChoiceSelectionModal)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapDismiss:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MultiChoiceSelectionModal

- (_TtC13FTMInternal_425MultiChoiceSelectionModal)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal____lazy_storage___tableView) = 0;
  *(void *)&self->$__lazy_storage_$_tableView[OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_dismissButton;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1001A57B4();

  result = (_TtC13FTMInternal_425MultiChoiceSelectionModal *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MultiChoiceSelectionModal();
  id v2 = v3.receiver;
  [(MultiChoiceSelectionModal *)&v3 viewDidLoad];
  sub_1001A5B4C();
}

- (void)didTapDismiss:(id)a3
{
  id v5 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 initWithStyle:1];
  [v8 impactOccurred];
  [(MultiChoiceSelectionModal *)v7 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC13FTMInternal_425MultiChoiceSelectionModal)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13FTMInternal_425MultiChoiceSelectionModal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal____lazy_storage___tableView));
  swift_bridgeObjectRelease();
  sub_10015E120((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_dismissButton);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 75.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1001A6380(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_425MultiChoiceSelectionModal_tableViewData))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)sub_1001A6690(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

@end