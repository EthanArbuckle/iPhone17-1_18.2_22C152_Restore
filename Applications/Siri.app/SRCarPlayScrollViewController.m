@interface SRCarPlayScrollViewController
- (_TtC4Siri29SRCarPlayScrollViewController)initWithCoder:(id)a3;
- (_TtC4Siri29SRCarPlayScrollViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation SRCarPlayScrollViewController

- (_TtC4Siri29SRCarPlayScrollViewController)initWithCoder:(id)a3
{
  result = (_TtC4Siri29SRCarPlayScrollViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  char v3 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive);
  id v4 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayScrollView());
  v5 = self;
  v6 = sub_10009DD58(v3);
  [(SRCarPlayScrollViewController *)v5 setView:v6];
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10009D82C();
}

- (_TtC4Siri29SRCarPlayScrollViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Siri29SRCarPlayScrollViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end