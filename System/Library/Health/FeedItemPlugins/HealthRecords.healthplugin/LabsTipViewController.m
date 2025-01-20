@interface LabsTipViewController
- (_TtC13HealthRecords21LabsTipViewController)initWithCoder:(id)a3;
- (_TtC13HealthRecords21LabsTipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation LabsTipViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LabsTipViewController();
  id v2 = v8.receiver;
  [(LabsTipViewController *)&v8 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = sub_240859174();
    objc_msgSend(v4, sel_addSubview_, v5);

    sub_2408597FC(v2, 22.0);
    v6 = self;
    sub_24083EDCC(0, &qword_268C91A80);
    v7 = (void *)sub_240954988();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_activateConstraints_, v7);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC13HealthRecords21LabsTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2409547C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC13HealthRecords21LabsTipViewController *)sub_240859BB0(v5, v7, a4);
}

- (_TtC13HealthRecords21LabsTipViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords21LabsTipViewController *)sub_240859DC8(a3);
}

- (void).cxx_destruct
{
  sub_24085A994((uint64_t)self + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController_context);
  sub_24085AB80((uint64_t)self + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController_feedItemData, &qword_268C909C8, MEMORY[0x263F46090]);
  id v3 = (char *)self + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController_headerType;
  uint64_t v4 = sub_240953798();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController____lazy_storage___tipsView);
}

@end