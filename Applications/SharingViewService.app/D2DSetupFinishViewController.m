@interface D2DSetupFinishViewController
- (_TtC18SharingViewService28D2DSetupFinishViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation D2DSetupFinishViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000BD294();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC18SharingViewService28D2DSetupFinishViewController)initWithContentView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupFinishViewController();
  return [(D2DSetupBaseViewController *)&v5 initWithContentView:a3];
}

@end