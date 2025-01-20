@interface ContainerNavigationController
- (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController)init;
- (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ContainerNavigationController

- (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController)init
{
  return (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController *)sub_1AF6BD7F8();
}

- (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6BD868();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF6BDCE4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AF6BDDB8();
}

- (_TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  sub_1AF6BDEEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_735E1C79A365F2F2932EE10C50FF0D3129ContainerNavigationController_contentNavigationController));
}

@end