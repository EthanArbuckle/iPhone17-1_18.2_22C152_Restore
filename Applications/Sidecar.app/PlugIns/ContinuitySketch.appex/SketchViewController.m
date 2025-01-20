@interface SketchViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (SketchViewController)initWithCoder:(id)a3;
- (SketchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UINavigationItem)navigationItem;
- (unint64_t)supportedInterfaceOrientations;
- (void)_textEffectsWindowIsHosted;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)viewDidLoad;
@end

@implementation SketchViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (UINavigationItem)navigationItem
{
  id v2 = sub_100004718();

  return (UINavigationItem *)v2;
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_100004740();
}

- (void)_textEffectsWindowIsHosted
{
  id v2 = self;
  sub_100004D9C();
}

- (void)cancel:(id)a3
{
}

- (void)done:(id)a3
{
}

- (SketchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100006A00();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SketchViewController *)sub_100005634(v5, v7, a4);
}

- (SketchViewController)initWithCoder:(id)a3
{
  return (SketchViewController *)sub_10000580C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end