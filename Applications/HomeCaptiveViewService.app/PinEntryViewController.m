@interface PinEntryViewController
- (_TtC22HomeCaptiveViewService22PinEntryViewController)initWithContentView:(id)a3;
- (void)didCompleteTextEntry:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PinEntryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000AC7C();
}

- (void)didCompleteTextEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000B688();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PinEntryViewController();
  id v4 = v5.receiver;
  [(PinEntryViewController *)&v5 viewWillDisappear:v3];
  [v4 hideActivityIndicator];
}

- (_TtC22HomeCaptiveViewService22PinEntryViewController)initWithContentView:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PinEntryViewController();
  return [(PinEntryViewController *)&v6 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end