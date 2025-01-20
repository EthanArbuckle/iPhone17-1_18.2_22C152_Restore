@interface AFUISiriCarPlayShockwaveViewController
- (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController)initWithCoder:(id)a3;
- (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController)initWithSafeAreaInsets:(UIEdgeInsets)a3;
- (void)initializeEdgeLightForRequest:(id)a3;
- (void)playShockwave;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation AFUISiriCarPlayShockwaveViewController

- (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController)initWithSafeAreaInsets:(UIEdgeInsets)a3
{
  return (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController *)AFUISiriCarPlayShockwaveViewController.init(safeAreaInsets:)(a3.top, a3.left, a3.bottom, a3.right);
}

- (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2230EAFF0();
}

- (void)initializeEdgeLightForRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2230EA100(v4);
}

- (void)playShockwave
{
  v2 = self;
  sub_2230EA258();
}

- (void)viewSafeAreaInsetsDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AFUISiriCarPlayShockwaveViewController();
  v2 = (char *)v14.receiver;
  [(AFUISiriCarPlayShockwaveViewController *)&v14 viewSafeAreaInsetsDidChange];
  id v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_safeAreaInsets);
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;

    v13 = &v2[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
    *(void *)v13 = v6;
    *((void *)v13 + 1) = v8;
    *((void *)v13 + 2) = v10;
    *((void *)v13 + 3) = v12;
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2230EA3D8();
}

- (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController));
}

@end