@interface AccessPointRootViewController
- (_TtC12GameCenterUI29AccessPointRootViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29AccessPointRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation AccessPointRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = sub_1AF3E40FC();

  return (unint64_t)v3;
}

- (_TtC12GameCenterUI29AccessPointRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AF7AE0E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC12GameCenterUI29AccessPointRootViewController *)sub_1AF3E4198(v5, v7, a4);
}

- (_TtC12GameCenterUI29AccessPointRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC12GameCenterUI29AccessPointRootViewController *)sub_1AF3E4378(v3, v4, (uint64_t (*)(uint64_t))type metadata accessor for AccessPointRootViewController);
}

@end