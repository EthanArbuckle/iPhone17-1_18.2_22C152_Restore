@interface MedicationsHistoryViewController
- (_TtC19HealthMedicationsUI32MedicationsHistoryViewController)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI32MedicationsHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MedicationsHistoryViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MedicationsHistoryViewController();
  id v2 = v6.receiver;
  [(MedicationsHistoryViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_systemBlueColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC19HealthMedicationsUI32MedicationsHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1C214A5F0();
    id v6 = a4;
    v7 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationsHistoryViewController();
  v9 = [(MedicationsHistoryViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC19HealthMedicationsUI32MedicationsHistoryViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationsHistoryViewController();
  return [(MedicationsHistoryViewController *)&v5 initWithCoder:a3];
}

@end