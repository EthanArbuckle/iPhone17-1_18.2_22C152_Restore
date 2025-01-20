@interface ViewController
- (BOOL)accessibilityPerformEscape;
- (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController)initWithCoder:(id)a3;
- (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneHandler;
- (void)homeHandler;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)previousHandler;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ViewController

- (void)homeHandler
{
  v2 = self;
  NavigationModel.goHome()();
}

- (void)doneHandler
{
  v2 = self;
  sub_228D85F80();
}

- (void)previousHandler
{
  unsigned __int8 v3 = 1;
  v2 = self;
  sub_228D8A4A0(&v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_228D85F80();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_228D86FD8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ViewController();
  id v4 = v5.receiver;
  [(ViewController *)&v5 viewWillDisappear:v3];
  sub_228D85F80();
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  sub_228D85F80();

  return 1;
}

- (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_228D87738();
}

- (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController_contentView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end