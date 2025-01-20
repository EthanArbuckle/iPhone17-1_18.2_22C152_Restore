@interface QuestionnaireOnlyViewController
- (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation QuestionnaireOnlyViewController

- (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController)initWithCoder:(id)a3
{
  result = (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000BF058();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC21WritingToolsUIService31QuestionnaireOnlyViewController_preferredContentSizeHandler);
  swift_unknownObjectRetain();
  v6 = self;
  v5([a3 preferredContentSize]);
  swift_unknownObjectRelease();
}

- (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end