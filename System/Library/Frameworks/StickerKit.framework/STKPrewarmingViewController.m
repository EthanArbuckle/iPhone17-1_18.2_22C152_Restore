@interface STKPrewarmingViewController
- (BOOL)_canShowWhileLocked;
- (STKPrewarmingViewController)initWithCoder:(id)a3;
- (STKPrewarmingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation STKPrewarmingViewController

- (void)viewDidLoad
{
  v2 = self;
  PrewarmingViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v2 = self;
  PrewarmingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle);
}

- (STKPrewarmingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_2453FFB38();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_assertion) = 0;
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle) = 0;
    id v8 = a4;
    a3 = (id)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_assertion) = 0;
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(STKPrewarmingViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (STKPrewarmingViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_assertion) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(STKPrewarmingViewController *)&v7 initWithCoder:a3];
}

@end