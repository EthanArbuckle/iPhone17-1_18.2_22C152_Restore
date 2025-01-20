@interface PreferencesModalController
- (BOOL)canBecomeFirstResponder;
- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithRootViewController:(id)a3;
- (void)didTapDone;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation PreferencesModalController

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithRootViewController:(id)a3
{
  return (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *)sub_1AF43E6E0(a3);
}

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF43E838();
}

- (BOOL)canBecomeFirstResponder
{
  return OUTLINED_FUNCTION_0_24() & 1;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1AF43E944((int)v7, v8);
}

- (void)didTapDone
{
  v2 = self;
  sub_1AF43EAE8();
}

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (a3)
  {
    swift_getObjCClassMetadata();
    if (!a4) {
      goto LABEL_5;
    }
  }
  else if (!a4)
  {
LABEL_5:
    sub_1AF43EC84();
  }
  swift_getObjCClassMetadata();
  goto LABEL_5;
}

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *)sub_1AF43ED60((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_1AF43ED18);
}

@end