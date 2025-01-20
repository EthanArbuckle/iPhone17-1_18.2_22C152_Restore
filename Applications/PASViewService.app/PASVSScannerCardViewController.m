@interface PASVSScannerCardViewController
- (_TtC14PASViewService30PASVSScannerCardViewController)initWithScannerEngine:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PASVSScannerCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000FC0C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  v4 = (char *)v5.receiver;
  [(PASVSScannerCardViewController *)&v5 viewWillAppear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC] start];
  [v4 resetConfirmationRing];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  v4 = (char *)v5.receiver;
  [(PASVSScannerCardViewController *)&v5 viewDidDisappear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC] stop];
}

- (_TtC14PASViewService30PASVSScannerCardViewController)initWithScannerEngine:(id)a3
{
  id v3 = a3;
  result = (_TtC14PASViewService30PASVSScannerCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end