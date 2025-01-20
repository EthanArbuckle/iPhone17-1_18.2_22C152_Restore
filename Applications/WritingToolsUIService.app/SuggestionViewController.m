@interface SuggestionViewController
- (_TtC21WritingToolsUIService24SuggestionViewController)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService24SuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation SuggestionViewController

- (_TtC21WritingToolsUIService24SuggestionViewController)initWithCoder:(id)a3
{
  result = (_TtC21WritingToolsUIService24SuggestionViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004A78();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC21WritingToolsUIService24SuggestionViewController_preferredContentSizeHandler);
  swift_unknownObjectRetain();
  v6 = self;
  v5([a3 preferredContentSize]);
  swift_unknownObjectRelease();
}

- (_TtC21WritingToolsUIService24SuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21WritingToolsUIService24SuggestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(void **)&self->preferredContentSizeHandler[OBJC_IVAR____TtC21WritingToolsUIService24SuggestionViewController_suggestionView
                                                  + 8];

  swift_release();

  swift_release();
}

@end