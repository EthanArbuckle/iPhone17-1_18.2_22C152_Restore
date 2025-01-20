@interface HUDashboardPresentationManager
+ (HUDashboardPresentationManager)sharedManager;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (HUDashboardPresentationManager)init;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)navigationController:(id)a3 didPushItem:(id)a4;
- (void)navigationController:(id)a3 didUpdatePreferredPaletteHeight:(double)a4;
- (void)navigationController:(id)a3 willPresent:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willPushItem:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
@end

@implementation HUDashboardPresentationManager

+ (HUDashboardPresentationManager)sharedManager
{
  if (qword_1EBA45638 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBA45540;

  return (HUDashboardPresentationManager *)v2;
}

- (HUDashboardPresentationManager)init
{
  v3 = (char *)self + OBJC_IVAR___HUDashboardPresentationManager_delegate;
  v4 = (objc_class *)type metadata accessor for DashboardPresentationManager();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(HUDashboardPresentationManager *)&v6 init];
}

- (void)navigationController:(id)a3 willPushItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE590E18(v6, v7);
}

- (void)navigationController:(id)a3 didPushItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE59103C(v6, v7);
}

- (void)navigationController:(id)a3 didUpdatePreferredPaletteHeight:(double)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1BE5911AC(v6, a4);
}

- (void).cxx_destruct
{
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  id v14 = _s6HomeUI28DashboardPresentationManagerC20navigationController_09animationG3For4from2toSo06UIViewG21AnimatedTransitioning_pSgSo012UINavigationG0C_So0oG9OperationVSo0lG0CAOtF_0(v10, a4, v11, v12);

  return v14;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  v8 = (UINavigationController *)a3;
  v9 = (UIViewController *)a4;
  id v10 = self;
  DashboardPresentationManager.navigationController(_:willShow:animated:)(v8, v9, a5);
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)navigationController:(id)a3 willPresent:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_1BE5908C0((uint64_t)v8, (uint64_t)v9, v5);
}

@end