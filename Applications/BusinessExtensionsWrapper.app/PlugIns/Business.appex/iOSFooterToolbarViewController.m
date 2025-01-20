@interface iOSFooterToolbarViewController
- (_TtC8Business30iOSFooterToolbarViewController)initWithCoder:(id)a3;
- (_TtC8Business30iOSFooterToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)leftButtonTapped;
- (void)rightButtonTapped;
@end

@implementation iOSFooterToolbarViewController

- (_TtC8Business30iOSFooterToolbarViewController)initWithCoder:(id)a3
{
  *(void *)&self->footerToolbarModel[OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___leftButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___rightButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___buttonItems) = 0;
  id v5 = a3;

  result = (_TtC8Business30iOSFooterToolbarViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)leftButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)rightButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    id v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC8Business30iOSFooterToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business30iOSFooterToolbarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___leftButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30iOSFooterToolbarViewController____lazy_storage___rightButtonItem));

  swift_bridgeObjectRelease();
}

@end