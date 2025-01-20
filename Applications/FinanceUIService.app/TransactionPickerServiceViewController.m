@interface TransactionPickerServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (_TtC16FinanceUIService38TransactionPickerServiceViewController)initWithCoder:(id)a3;
- (_TtC16FinanceUIService38TransactionPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TransactionPickerServiceViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController();
  id v2 = v3.receiver;
  [(TransactionPickerServiceViewController *)&v3 viewDidLoad];
  sub_100005378();
}

+ (id)_remoteViewControllerInterface
{
  id v2 = (void *)static TransactionPickerExportedInterfaces.remoteProtocol()();

  return v2;
}

+ (id)_exportedInterface
{
  id v2 = (void *)static TransactionPickerExportedInterfaces.serviceProtocol()();

  return v2;
}

- (_TtC16FinanceUIService38TransactionPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16FinanceUIService38TransactionPickerServiceViewController *)sub_100006508(v5, v7, a4);
}

- (_TtC16FinanceUIService38TransactionPickerServiceViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  Logger.init(subsystem:category:)();
  *(Class *)((char *)&v5->super.super.super.isa
           + OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController) = 0;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController();
  uint64_t v6 = [(TransactionPickerServiceViewController *)&v8 initWithCoder:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController);
}

@end