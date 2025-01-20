@interface PreferencesListControllerNavigationCoordinator
- (BOOL)listControllerIsOnTopOfNavigationStack:(id)a3 searchTopMostViewControllerChildren:(BOOL)a4;
- (BOOL)listControllerShouldDeselectAfterFormSheetDisappearance:(id)a3 givenRootController:(id)a4;
- (BOOL)listControllerShouldNotDeselectAfterAppearing:(id)a3;
- (_TtC11SettingsApp46PreferencesListControllerNavigationCoordinator)init;
- (id)animationControllerForDismissedController:(id)a3;
- (void)listController:(id)a3 pushViewController:(id)a4 givenRootController:(id)a5 withModalStylePopupStateApplicator:(id)a6 animated:(BOOL)a7;
@end

@implementation PreferencesListControllerNavigationCoordinator

- (BOOL)listControllerShouldDeselectAfterFormSheetDisappearance:(id)a3 givenRootController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1000C1A4C(v6, a4);

  return a4 & 1;
}

- (BOOL)listControllerShouldNotDeselectAfterAppearing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000C2214(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)listController:(id)a3 pushViewController:(id)a4 givenRootController:(id)a5 withModalStylePopupStateApplicator:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  v12 = _Block_copy(a6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  sub_1000C29E0(v14, v15, a5, (uint64_t (*)())sub_1000C4BA8, v13, v7);

  swift_release();
}

- (BOOL)listControllerIsOnTopOfNavigationStack:(id)a3 searchTopMostViewControllerChildren:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = self;
  char v8 = sub_1000C43B4(v6, a4);

  return v8 & 1;
}

- (_TtC11SettingsApp46PreferencesListControllerNavigationCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PreferencesListControllerNavigationCoordinator *)&v3 init];
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000C45FC(v4);
  BOOL v7 = v6;

  return v7;
}

@end