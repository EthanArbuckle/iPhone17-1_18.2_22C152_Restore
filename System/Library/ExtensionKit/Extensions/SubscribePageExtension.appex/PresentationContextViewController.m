@interface PresentationContextViewController
- (_TtC22SubscribePageExtension33PresentationContextViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33PresentationContextViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PresentationContextViewController

- (_TtC22SubscribePageExtension33PresentationContextViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension33PresentationContextViewController_contextViewController) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension33PresentationContextViewController_hasPresentedViewController) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension33PresentationContextViewController_dismissOverride);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension33PresentationContextViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000D14CC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PresentationContextViewController();
  id v4 = v7.receiver;
  [(PresentationContextViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, "presentationController", v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    [v5 _setContainerIgnoresDirectTouchEvents:1];

    id v4 = v6;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000D1688(a3);
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_1000D1D6C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1000D1938(v4, (uint64_t)v6, v7);
  sub_10001A4D0((uint64_t)v6);
}

- (_TtC22SubscribePageExtension33PresentationContextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension33PresentationContextViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33PresentationContextViewController_contextViewController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension33PresentationContextViewController_dismissOverride);

  sub_10001A4D0(v3);
}

@end