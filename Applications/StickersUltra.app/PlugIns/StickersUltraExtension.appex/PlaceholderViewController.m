@interface PlaceholderViewController
- (_TtC22StickersUltraExtension25PlaceholderViewController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension25PlaceholderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PlaceholderViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000703C8();
}

- (_TtC22StickersUltraExtension25PlaceholderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10007A250();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22StickersUltraExtension25PlaceholderViewController *)sub_100070A24(v5, v7, a4);
}

- (_TtC22StickersUltraExtension25PlaceholderViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension25PlaceholderViewController *)sub_100070BC4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension25PlaceholderViewController_textView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension25PlaceholderViewController_backgroundColor));

  swift_unknownObjectRelease();
}

@end