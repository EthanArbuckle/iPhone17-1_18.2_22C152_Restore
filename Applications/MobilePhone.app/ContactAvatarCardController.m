@interface ContactAvatarCardController
- (_TtC11MobilePhone27ContactAvatarCardController)init;
- (id)presentingViewControllerForAvatarCardController:(id)a3;
- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4;
@end

@implementation ContactAvatarCardController

- (id)presentingViewControllerForAvatarCardController:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return Strong;
}

- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = self;
  int64_t v9 = ContactAvatarCardController.avatarCardController(_:presentationResultForLocation:)(v7, x, y);

  return v9;
}

- (_TtC11MobilePhone27ContactAvatarCardController)init
{
  result = (_TtC11MobilePhone27ContactAvatarCardController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR____TtC11MobilePhone27ContactAvatarCardController_tableViewController);
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobilePhone27ContactAvatarCardController____lazy_storage___cardController);
}

@end