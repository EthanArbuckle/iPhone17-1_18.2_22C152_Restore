@interface LensFilteringViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport27LensFilteringViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport27LensFilteringViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation LensFilteringViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport27LensFilteringViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport27LensFilteringViewController *)sub_2357AEE88(v5, v7, a4);
}

- (_TtC16MagnifierSupport27LensFilteringViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport27LensFilteringViewController_brightness) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport27LensFilteringViewController_contrast) = (Class)0x3FF0000000000000;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport27LensFilteringViewController_colorFilter) = 12;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LensFilteringViewController();
  return [(LensFilteringViewController *)&v5 initWithCoder:a3];
}

@end