@interface AudioAppContentViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC22AudioMessagesExtension29AudioAppContentViewController)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension29AudioAppContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)displayLinkFiredFrom:(id)a3;
- (void)longPressFrom:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AudioAppContentViewController

- (_TtC22AudioMessagesExtension29AudioAppContentViewController)initWithCoder:(id)a3
{
  return (_TtC22AudioMessagesExtension29AudioAppContentViewController *)AudioAppContentViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  AudioAppContentViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  v4 = (char *)v6.receiver;
  [(AudioAppContentViewController *)&v6 viewDidAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink];
  if (v5) {
    objc_msgSend(v5, "setPaused:", 0, v6.receiver, v6.super_class);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  AudioAppContentViewController.viewWillDisappear(_:)(a3);
}

- (void)dealloc
{
  v2 = self;
  AudioAppContentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_logger;
  uint64_t v4 = sub_46730();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_3DC24((uint64_t)self + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_recorder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_ringsContainerView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_helpCalloutView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerFillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_centerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_labelColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_popoverColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_buttonColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_displayLink));
  v5 = (char *)self + OBJC_IVAR____TtC22AudioMessagesExtension29AudioAppContentViewController_controlDelegate;

  sub_3DC24((uint64_t)v5);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  AudioAppContentViewController.willMove(toParent:)(v9);
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioAppContentViewController();
  id v2 = v3.receiver;
  [(AudioAppContentViewController *)&v3 viewWillLayoutSubviews];
  sub_387DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  AudioAppContentViewController.traitCollectionDidChange(_:)(v9);
}

- (void)displayLinkFiredFrom:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_46910();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_399AC();

  sub_316F8((uint64_t)v6);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = AudioAppContentViewController.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (void)longPressFrom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_3BBE4(v4);
}

- (_TtC22AudioMessagesExtension29AudioAppContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22AudioMessagesExtension29AudioAppContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end