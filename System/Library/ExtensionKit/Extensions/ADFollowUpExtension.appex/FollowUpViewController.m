@interface FollowUpViewController
- (_TtC19ADFollowUpExtension22FollowUpViewController)init;
- (_TtC19ADFollowUpExtension22FollowUpViewController)initWithCoder:(id)a3;
- (_TtC19ADFollowUpExtension22FollowUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FollowUpViewController

- (_TtC19ADFollowUpExtension22FollowUpViewController)init
{
  return (_TtC19ADFollowUpExtension22FollowUpViewController *)sub_1000133E4();
}

- (_TtC19ADFollowUpExtension22FollowUpViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100016DD0();
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FollowUpViewController();
  [(FollowUpViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10001359C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FollowUpViewController();
  id v4 = v5.receiver;
  [(FollowUpViewController *)&v5 viewWillDisappear:v3];
  objc_msgSend(v4, "finishProcessing", v5.receiver, v5.super_class);
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  v8 = (uint64_t (*)(void))_Block_copy(a5);
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v8 = (uint64_t (*)(void))sub_1000172A8;
  }
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100016F00(a3, v8);
  sub_100017260((uint64_t)v8);
}

- (_TtC19ADFollowUpExtension22FollowUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC19ADFollowUpExtension22FollowUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100012EA8((uint64_t)&self->FLExtensionViewController_opaque[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpIdentifier], &qword_1000208C0);
  sub_100012EA8((uint64_t)&self->FLExtensionViewController_opaque[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext], &qword_1000208A8);
}

@end