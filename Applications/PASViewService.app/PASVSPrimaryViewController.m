@interface PASVSPrimaryViewController
- (_TtC14PASViewService26PASVSPrimaryViewController)initWithCoder:(id)a3;
- (_TtC14PASViewService26PASVSPrimaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PASVSPrimaryViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_1000155A4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100011164(a3, v6, v7);
  sub_10001555C((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASVSPrimaryViewController();
  id v4 = v5.receiver;
  [(PASVSPrimaryViewController *)&v5 viewDidAppear:v3];
  sub_100012E34();
}

- (void)didInvalidateForRemoteAlert
{
  v2 = self;
  sub_1000139A8("PASVSPrimaryViewController didInvalidateForRemoteAlert");
}

- (_TtC14PASViewService26PASVSPrimaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC14PASViewService26PASVSPrimaryViewController *)sub_100013BE4(v5, v7, a4);
}

- (_TtC14PASViewService26PASVSPrimaryViewController)initWithCoder:(id)a3
{
  return (_TtC14PASViewService26PASVSPrimaryViewController *)sub_100013DA8(a3);
}

- (void).cxx_destruct
{
  sub_100007E60((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice], &qword_1000222F0);
  swift_release();
  sub_1000147EC(*(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult], *(void *)&self->device[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult], *(void *)&self->targetDevice[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult]);
  swift_release();
  swift_release();
  sub_1000156EC(*(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension], *(void **)&self->device[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension]);
  sub_100007E60((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails], &qword_100022580);
}

@end