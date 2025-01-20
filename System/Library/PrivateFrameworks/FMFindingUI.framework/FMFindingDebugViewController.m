@interface FMFindingDebugViewController
- (_TtC11FMFindingUI28FMFindingDebugViewController)initWithCoder:(id)a3;
- (_TtC11FMFindingUI28FMFindingDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)handleWithButton:(id)a3;
- (void)handleWithSlider:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation FMFindingDebugViewController

- (_TtC11FMFindingUI28FMFindingDebugViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D352544();
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for FMFindingDebugViewController();
  v2 = (char *)v14.receiver;
  [(FMFindingDebugViewController *)&v14 viewDidLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_stackView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)handleWithButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D350DFC();
}

- (void)handleWithSlider:(id)a3
{
  double v5 = sub_24D34FC38((uint64_t)v8);
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_delegate, v5))
  {
    id v6 = a3;
    double v7 = self;
    sub_24D39C018((uint64_t)v8);

    swift_unknownObjectRelease();
  }
}

- (_TtC11FMFindingUI28FMFindingDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11FMFindingUI28FMFindingDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_topStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_middleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_autoplayButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_nextStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_prevStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_disconnectedStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_connectingStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_coldStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_warmStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_warmerStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_hotStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_foundStateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_ringFactorSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_ringOpacitySlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_hapticForceSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_dotScaleSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_pulsePeriodSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_saveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_loadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_hideButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_autoplayTimer));
  swift_unknownObjectWeakDestroy();
  id v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI28FMFindingDebugViewController_delegate;
  sub_24D2C6E6C((uint64_t)v3);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_24D39C780();
  uint64_t v6 = sub_24D39CC10();
  id v7 = a3;
  double v8 = self;
  sub_24D3529C0(v6);

  swift_bridgeObjectRelease();
}

@end