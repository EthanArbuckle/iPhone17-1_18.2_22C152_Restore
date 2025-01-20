@interface PreCallConfirmationViewController
- (_TtC15ConversationKit33PreCallConfirmationViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit33PreCallConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PreCallConfirmationViewController

- (_TtC15ConversationKit33PreCallConfirmationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  PreCallConfirmationViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  PreCallConfirmationViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PreCallConfirmationViewController.viewWillAppear(_:)(a3);
}

- (_TtC15ConversationKit33PreCallConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  PreCallConfirmationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_confirmationCancel));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_confirmationCompletion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController____lazy_storage___videoPreview));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController____lazy_storage___buttonsView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController____lazy_storage___statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_callCenter));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_service;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end