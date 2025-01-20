@interface RichTextWrapper.TextFieldDelegate
- (_TtCV28AccessibilitySharedUISupport15RichTextWrapper17TextFieldDelegate)init;
- (void)textViewDidChange:(id)a3;
@end

@implementation RichTextWrapper.TextFieldDelegate

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_228E08950(v4);
}

- (_TtCV28AccessibilitySharedUISupport15RichTextWrapper17TextFieldDelegate)init
{
  result = (_TtCV28AccessibilitySharedUISupport15RichTextWrapper17TextFieldDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->_currentPhrase[OBJC_IVAR____TtCV28AccessibilitySharedUISupport15RichTextWrapper17TextFieldDelegate__currentPhrase
                                          + 8]);
  swift_release();
  swift_release();
}

@end