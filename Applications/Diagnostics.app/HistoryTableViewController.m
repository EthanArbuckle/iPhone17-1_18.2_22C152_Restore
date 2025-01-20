@interface HistoryTableViewController
- (_TtC11Diagnostics26HistoryTableViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics26HistoryTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)donePressed;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HistoryTableViewController

- (_TtC11Diagnostics26HistoryTableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000EC3E8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000EB240(a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1000EB368(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (_TtC11Diagnostics26HistoryTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11Diagnostics26HistoryTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView);
}

- (void)donePressed
{
  v0 = (void *)qword_100183500;
  if (qword_100183500)
  {
    type metadata accessor for SelfServiceDestinationPickerViewController();
    if (!swift_dynamicCastClass())
    {
      id v6 = v0;
      goto LABEL_17;
    }
  }
  if (qword_100182750 != -1) {
    swift_once();
  }
  id v1 = [(id)qword_10018A380 viewControllers];
  sub_10003C374(0, (unint64_t *)&qword_100183670);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v3)
    {
LABEL_7:
      unint64_t v4 = v3 - 1;
      if (__OFSUB__(v3, 1))
      {
        __break(1u);
      }
      else if ((v2 & 0xC000000000000001) == 0)
      {
        if ((v4 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v4 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v5 = *(id *)(v2 + 8 * v4 + 32);
LABEL_12:
          id v7 = v5;
          swift_bridgeObjectRelease();
          id v6 = v7;
          goto LABEL_17;
        }
        __break(1u);
        goto LABEL_24;
      }
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_100182748 != -1) {
LABEL_24:
  }
    swift_once();
  id v6 = (id)qword_10018A370;
LABEL_17:
  id v8 = v6;
  [v6 dismissViewControllerAnimated:1 completion:0];
}

@end