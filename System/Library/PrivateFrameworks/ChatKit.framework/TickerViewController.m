@interface TickerViewController
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)init;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation TickerViewController

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TickerViewController();
  return [(TickerViewController *)&v3 initWithNibName:0 bundle:0];
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter) = 0;
  id v5 = a4;

  result = (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter) = 0;
  id v4 = a3;

  result = (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CKDebugTickHUDView());
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(TickerViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for TickerViewController();
  [(TickerViewController *)&v2 viewDidLoad];
}

@end