@interface CoverSheetBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (MRUArtworkView)artworkView;
- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)layout;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)loadView;
- (void)setArtworkVisible:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CoverSheetBackgroundViewController

- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap;
  *(void *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap;
  *(void *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap;
  *(void *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  id v8 = a3;

  result = (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  type metadata accessor for CoverSheetBackgroundView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = [v3 init];
  [(CoverSheetBackgroundViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000ED50();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10000EF24(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10000F438(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[CoverSheetBackgroundViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = (double *)swift_allocObject();
  *((void *)v8 + 2) = v7;
  v8[3] = width;
  v8[4] = height;
  v11[4] = sub_10000FFFC;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000F59C;
  v11[3] = &unk_100049B70;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000F738((uint64_t)a3);
}

- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001015C((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController);
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_10000DC0C((uint64_t)a4);
  swift_unknownObjectRelease();
}

- (int64_t)layout
{
  return 0;
}

- (MRUArtworkView)artworkView
{
  v2 = self;
  id v3 = [(CoverSheetBackgroundViewController *)v2 view];
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for CoverSheetBackgroundView();
    uint64_t v5 = swift_dynamicCastClass();
    if (v5)
    {
      id v6 = (MRUArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)(v5
                                                                     + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView));

      return v6;
    }
  }
  result = (MRUArtworkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setArtworkVisible:(BOOL)a3
{
  id v4 = self;
  id v6 = [(CoverSheetBackgroundViewController *)v4 view];
  if (!v6) {
    goto LABEL_7;
  }
  type metadata accessor for CoverSheetBackgroundView();
  uint64_t v5 = swift_dynamicCastClass();
  if (!v5)
  {

LABEL_7:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  *(unsigned char *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) = a3;
  sub_1000091C4();
}

@end