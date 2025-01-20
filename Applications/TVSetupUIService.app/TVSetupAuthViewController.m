@interface TVSetupAuthViewController
- (_TtC16TVSetupUIService25TVSetupAuthViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSetupAuthViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100005DA0(a3);
}

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000604C(v4);
}

- (_TtC16TVSetupUIService25TVSetupAuthViewController)initWithContentView:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  return [(TVSetupAuthViewController *)&v6 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end