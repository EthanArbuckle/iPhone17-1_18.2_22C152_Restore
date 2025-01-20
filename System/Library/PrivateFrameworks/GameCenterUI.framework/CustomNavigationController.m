@interface CustomNavigationController
- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithRootViewController:(id)a3;
- (void)donePressed:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation CustomNavigationController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF4B745C();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1AF4B792C((uint64_t)v7, v8);
}

- (void)donePressed:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AF7AEB60();
  swift_unknownObjectRelease();
  sub_1AF4B79C0();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AF4B7A8C(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AF4B7A8C(ObjCClassMetadata, v6);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AF4B7BA0(a3);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AF4B7C4C(v5, v7, a4);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AF4B7D78(a3);
}

- (void).cxx_destruct
{
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController_dismissHandler));

  swift_release();
}

@end