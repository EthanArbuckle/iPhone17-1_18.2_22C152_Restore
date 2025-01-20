@interface PASVSSetupEventPresenter
- (UIViewController)presentingViewController;
- (_TtC14PASViewService24PASVSSetupEventPresenter)init;
- (_TtP14PASViewService22PASViewServiceProtocol_)delegate;
- (void)authCompleted:(CUMessageSession *)a3 completionHandler:(id)a4;
- (void)authRequested;
- (void)proxCardFlowDidDismiss;
- (void)proximitySetupCompletedWithResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)showErrorWithTitle:(id)a3 message:(id)a4;
- (void)showManualPinEntry;
- (void)showPinEntryError;
- (void)showProxCard;
@end

@implementation PASVSSetupEventPresenter

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController));
}

- (void)setPresentingViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController) = (Class)a3;
  id v3 = a3;
}

- (_TtP14PASViewService22PASViewServiceProtocol_)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP14PASViewService22PASViewServiceProtocol_ *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)showProxCard
{
  v2 = self;
  sub_10000B734();
}

- (void)authRequested
{
  v2 = self;
  sub_10000C808();
}

- (void)showManualPinEntry
{
  v2 = self;
  sub_10000CA3C();
}

- (void)showPinEntryError
{
  v2 = self;
  sub_10000D05C();
}

- (void)authCompleted:(CUMessageSession *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100004C0C(&qword_100022310);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100022320;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100022330;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10000E930((uint64_t)v9, (uint64_t)&unk_100022340, (uint64_t)v14);
  swift_release();
}

- (void)showErrorWithTitle:(id)a3 message:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v11 = self;
  sub_10000DD98(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC14PASViewService24PASVSSetupEventPresenter)init
{
  result = (_TtC14PASViewService24PASVSSetupEventPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_presentingViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_sourceViewPresenter));
  swift_bridgeObjectRelease();
  sub_100007E60((uint64_t)self + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_targetDevice, &qword_1000222F0);
  sub_100007E60((uint64_t)self + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_viewDetails, &qword_1000222C0);
  sub_100004C50((uint64_t)self + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_proxyDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter____lazy_storage___proxCardController));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14PASViewService24PASVSSetupEventPresenter_pinEntryController);
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10000ED10();
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10000E570();
}

@end