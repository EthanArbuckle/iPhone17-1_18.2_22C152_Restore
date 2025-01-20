@interface MacFooterToolbarViewController
- (BOOL)canBecomeFirstResponder;
- (NSArray)keyCommands;
- (_TtC8Business30MacFooterToolbarViewController)initWithCoder:(id)a3;
- (_TtC8Business30MacFooterToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissButtonTapped;
- (void)leftButtonTapped;
- (void)rightButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MacFooterToolbarViewController

- (_TtC8Business30MacFooterToolbarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B7538();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000B5CEC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  id v4 = v5.receiver;
  [(MacFooterToolbarViewController *)&v5 viewDidAppear:v3];
  [v4 becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1000B668C();

  if (v3)
  {
    sub_1000074F8(0, &qword_100100C48);
    v4.super.isa = sub_1000BBBD8().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)leftButtonTapped
{
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    objc_super v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)rightButtonTapped
{
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    objc_super v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)dismissButtonTapped
{
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    objc_super v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC8Business30MacFooterToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business30MacFooterToolbarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton);
}

@end