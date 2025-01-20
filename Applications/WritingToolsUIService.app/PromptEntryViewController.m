@interface PromptEntryViewController
- (_TtC21WritingToolsUIService25PromptEntryViewController)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService25PromptEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation PromptEntryViewController

- (_TtC21WritingToolsUIService25PromptEntryViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21WritingToolsUIService25PromptEntryViewController_writingToolsDelegate) = 0;
  id v4 = a3;

  result = (_TtC21WritingToolsUIService25PromptEntryViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100099C14();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC21WritingToolsUIService25PromptEntryViewController_preferredContentSizeHandler);
  swift_unknownObjectRetain();
  v6 = self;
  v5([a3 preferredContentSize]);
  swift_unknownObjectRelease();
}

- (_TtC21WritingToolsUIService25PromptEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21WritingToolsUIService25PromptEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10009AFD0((uint64_t)self + OBJC_IVAR____TtC21WritingToolsUIService25PromptEntryViewController_promptEntryView);
  swift_unknownObjectRelease();

  swift_release();
}

@end