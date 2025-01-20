@interface EKEventGenericDetailViewControllerOOPImpl
- (UIColor)oopContentBackgroundColor;
- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithCoder:(id)a3;
- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithHostViewID:(id)a3;
- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4;
- (void)bottomStatusButtonTapped:(int64_t)a3;
- (void)leftBarButtonTapped:(id)a3;
- (void)rightBarButtonTapped:(id)a3;
- (void)setOopContentBackgroundColor:(id)a3;
- (void)viewDidLoad;
@end

@implementation EKEventGenericDetailViewControllerOOPImpl

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithHostViewID:(id)a3
{
  uint64_t v3 = sub_1B411E8C8();
  return (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *)EKEventGenericDetailViewControllerOOPImpl.init(hostViewID:)(v3, v4);
}

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((void *)v5 + 10) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor) = 0;
  id v6 = a4;

  result = (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *)sub_1B411ECC8();
  __break(1u);
  return result;
}

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController) = 0;
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor) = 0;
  id v5 = a3;

  result = (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *)sub_1B411ECC8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B40EC94C();
}

- (UIColor)oopContentBackgroundColor
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setOopContentBackgroundColor:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_1B40EF418(a3);
}

- (void)leftBarButtonTapped:(id)a3
{
}

- (void)rightBarButtonTapped:(id)a3
{
}

- (void)bottomStatusButtonTapped:(int64_t)a3
{
  uint64_t v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  uint64_t v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  if (v4)
  {
    uint64_t v6 = v3[9];
    id v5 = (void *)v3[10];
    uint64_t v7 = v3[7];
    uint64_t v8 = v3[8];
    uint64_t v10 = v3[5];
    uint64_t v9 = v3[6];
    uint64_t v11 = v3[4];
    uint64_t v14 = v3[3];
    uint64_t v12 = v3[2];
    uint64_t v13 = *v3;
    v16 = self;
    sub_1B40ED4F4(v13, v4, v12, v14, v11, v10, v9, v7, v8, v6, v5);
    sub_1B40DBF3C(a3);
    sub_1B40ECB68(v13, v4, v12, v14, v11, v10, v9, v7, v8, v6, v5);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController));
  sub_1B40ECB68(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._toolbarItems
               + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView),
    *(void **)((char *)&self->super._title
             + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
}

@end