@interface MonogramInputViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC23MonogramPosterExtension27MonogramInputViewController)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension27MonogramInputViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation MonogramInputViewController

- (_TtC23MonogramPosterExtension27MonogramInputViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField;
  id v6 = objc_allocWithZone((Class)UITextField);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(void *)&self->textField[OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC23MonogramPosterExtension27MonogramInputViewController *)sub_100016610();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MonogramInputViewController();
  id v2 = v3.receiver;
  [(MonogramInputViewController *)&v3 viewDidLoad];
  sub_10000A574();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    id v6 = self;
    id v5 = a3;
    sub_10000AA74();
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000A750(v4);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_100016360();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_10000AD7C(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (_TtC23MonogramPosterExtension27MonogramInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23MonogramPosterExtension27MonogramInputViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_textField));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC23MonogramPosterExtension27MonogramInputViewController_delegate;

  sub_1000042D0((uint64_t)v3);
}

@end