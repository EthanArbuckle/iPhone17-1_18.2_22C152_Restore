@interface PreviewViewController
- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PreviewViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  PreviewViewController.viewDidAppear(_:)(v3);
}

- (void)viewDidLoad
{
  v2 = self;
  PreviewViewController.viewDidLoad()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  PreviewViewController.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *)PreviewViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *)PreviewViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController_previewView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController_captureSession);
}

@end