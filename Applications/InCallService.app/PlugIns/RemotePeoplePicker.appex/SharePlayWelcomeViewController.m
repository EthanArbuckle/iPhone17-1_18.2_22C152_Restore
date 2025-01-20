@interface SharePlayWelcomeViewController
- (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinueButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SharePlayWelcomeViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  id v2 = v3.receiver;
  [(SharePlayWelcomeViewController *)&v3 viewDidLoad];
  sub_10000585C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  id v4 = v7.receiver;
  [(SharePlayWelcomeViewController *)&v7 viewDidAppear:v3];
  if (qword_100010CB0 != -1) {
    swift_once();
  }
  v6 = &type metadata for Bool;
  v5[0] = 0;
  sub_100004BE4((uint64_t)v5);
  sub_1000061AC((uint64_t)v5, &qword_100010DA0);
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  sub_10000571C();
}

- (void)didTapContinueButton
{
  id v2 = self;
  sub_100005B58();
}

- (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = sub_100009D38();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController *)sub_100005C44(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_100009D38();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = sub_100009D38();
  uint64_t v16 = v15;
  return (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController *)sub_100005C44(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = sub_100009D38();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)sub_100009D38();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  return (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController *)sub_100005E20(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  sub_1000061AC((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate], (uint64_t *)&unk_100010F00);

  swift_bridgeObjectRelease();
  BOOL v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_contentViewHeightConstraint];
}

@end