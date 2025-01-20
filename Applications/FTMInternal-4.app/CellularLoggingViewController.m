@interface CellularLoggingViewController
- (_TtC13FTMInternal_429CellularLoggingViewController)initWithCoder:(id)a3;
- (_TtC13FTMInternal_429CellularLoggingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4;
- (void)didChangedChunkFileSliderValue:(id)a3;
- (void)didChangedMaxLogsSlider:(id)a3;
- (void)didTapConfig;
- (void)didTapReset;
- (void)didTapStart;
- (void)didTapStop;
- (void)endAppearanceTransition;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CellularLoggingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10020436C();
}

- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  [(CellularLoggingViewController *)&v6 beginAppearanceTransition:v5 animated:v4];
}

- (void)endAppearanceTransition
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  [(CellularLoggingViewController *)&v2 endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CellularLoggingViewController();
  id v4 = v5.receiver;
  [(CellularLoggingViewController *)&v5 viewWillDisappear:v3];
  if (qword_1002D7B18 != -1) {
    swift_once();
  }
  if (*(unsigned char *)(qword_1002E31C8 + 145) == 1) {
    sub_100204E74();
  }
}

- (void)didTapStart
{
  objc_super v2 = self;
  sub_10020462C();
}

- (void)didTapStop
{
  uint64_t v2 = qword_1002D7B18;
  BOOL v3 = self;
  if (v2 != -1)
  {
    objc_super v6 = v3;
    swift_once();
    BOOL v3 = v6;
  }
  if (*(unsigned char *)(qword_1002E31C8 + 145) == 1)
  {
    objc_super v5 = v3;
    id v4 = sub_100203CF0();
    sub_1001810E4();

    if (qword_1002D7A80 != -1) {
      swift_once();
    }
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    sub_100204E74();
    BOOL v3 = v5;
  }
}

- (void)didTapReset
{
  uint64_t v2 = self;
  sub_10020536C();
}

- (void)didTapConfig
{
  uint64_t v2 = self;
  sub_100205844();
}

- (void)didChangedChunkFileSliderValue:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100205980(v4);
}

- (void)didChangedMaxLogsSlider:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100205C78(v4);
}

- (_TtC13FTMInternal_429CellularLoggingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13FTMInternal_429CellularLoggingViewController *)sub_100207AC0(v5, v7, a4);
}

- (_TtC13FTMInternal_429CellularLoggingViewController)initWithCoder:(id)a3
{
  return (_TtC13FTMInternal_429CellularLoggingViewController *)sub_100207D58(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = qword_1002D7A60;
  id v11 = a3;
  v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  double v13 = *(double *)&qword_1002E3118;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!v7) {
    return 0;
  }
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  id v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_100208AAC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = sub_100209D54();
  swift_unknownObjectRetain();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100209E54();
  swift_unknownObjectRetain();

  return v6;
}

@end