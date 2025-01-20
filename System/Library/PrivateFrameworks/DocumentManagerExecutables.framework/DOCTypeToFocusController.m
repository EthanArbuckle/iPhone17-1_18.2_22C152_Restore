@interface DOCTypeToFocusController
- (BOOL)hasText;
- (UITextInputAssistantItem)inputAssistantItem;
- (UIView)inputView;
- (_TtC26DocumentManagerExecutables24DOCTypeToFocusController)init;
- (int64_t)autocorrectionType;
- (void)insertText:(id)a3;
- (void)typingTimeout;
@end

@implementation DOCTypeToFocusController

- (_TtC26DocumentManagerExecutables24DOCTypeToFocusController)init
{
  return (_TtC26DocumentManagerExecutables24DOCTypeToFocusController *)DOCTypeToFocusController.init()();
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D18]), sel_init);

  return (UITextInputAssistantItem *)v2;
}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4 = sub_22BE92CD8();
  uint64_t v6 = v5;
  v7 = self;
  sub_22BE786D8(v4, v6);

  swift_bridgeObjectRelease();
}

- (UIView)inputView
{
  uint64_t v2 = qword_2684868D0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = (UIView *)(id)qword_268488490;

  return v4;
}

- (void)typingTimeout
{
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputBuffer);
  swift_beginAccess();
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  uint64_t v4 = self;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(Class *)((char *)&v4->super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout);
  *(Class *)((char *)&v4->super.super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout) = 0;
}

- (void).cxx_destruct
{
  sub_22BE69F64((uint64_t)self + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputView);
}

@end