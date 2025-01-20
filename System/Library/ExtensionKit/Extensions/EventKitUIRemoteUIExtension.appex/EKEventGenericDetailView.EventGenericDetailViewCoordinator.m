@interface EKEventGenericDetailView.EventGenericDetailViewCoordinator
- (_TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator)init;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)viewController:(id)a3 didChangeBottomStatusButtons:(id)a4;
- (void)viewController:(id)a3 didChangeLeftBarButtons:(id)a4 rightBarButtons:(id)a5;
@end

@implementation EKEventGenericDetailView.EventGenericDetailViewCoordinator

- (void)viewController:(id)a3 didChangeBottomStatusButtons:(id)a4
{
  sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
  uint64_t v5 = sub_10001F888();
  v6 = *(void (**)(uint64_t))&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                        + 56];
  if (v6)
  {
    id v7 = a3;
    v8 = self;
    sub_10000DA20((uint64_t)v6);
    v6(v5);
    sub_1000047A0((uint64_t)v6);
  }
  else
  {
    id v9 = a3;
    v10 = self;
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }

  swift_bridgeObjectRelease();
}

- (void)viewController:(id)a3 didChangeLeftBarButtons:(id)a4 rightBarButtons:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_10001F888();
    if (a5)
    {
LABEL_3:
      uint64_t v8 = sub_10001F888();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  id v9 = *(void (**)(uint64_t, uint64_t))&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                                 + 40];
  if (v9)
  {
    id v10 = a3;
    v11 = self;
    sub_10000DA20((uint64_t)v9);
    v9(v7, v8);
    sub_1000047A0((uint64_t)v9);
  }
  else
  {
    id v12 = a3;
    v13 = self;
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    uint64_t v7 = sub_10001F304;
  }
  id v8 = a3;
  id v9 = self;
  sub_10001E47C(v8);
  sub_1000047A0((uint64_t)v7);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10001E84C((uint64_t)v5);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v6 = sub_10001EC38;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = self;
  sub_10001EAC4((void (*)(uint64_t))v6);
  sub_1000047A0((uint64_t)v6);
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  v3 = *(void (**)(void, void, void))&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                                       + 24];
  if (v3)
  {
    v4 = self;
    sub_10000DA20((uint64_t)v3);
    v3(0, 0, 0);
    sub_1000047A0((uint64_t)v3);
  }
  else
  {
    id v5 = self;
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
}

- (_TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator)init
{
  result = (_TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                   + 8];
  uint64_t v4 = *(void *)&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                   + 24];
  uint64_t v5 = *(void *)&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                   + 40];
  uint64_t v6 = *(void *)&self->genericView[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                   + 56];
  swift_release();
  sub_1000047A0(v3);
  sub_1000047A0(v4);
  sub_1000047A0(v5);
  sub_1000047A0(v6);
  uint64_t v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager);
}

@end