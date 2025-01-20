@interface UIKitRichTextEditorCoordinator
- (_TtC7SwiftUI30UIKitRichTextEditorCoordinator)init;
- (void)textViewDidChange:(id)a3;
@end

@implementation UIKitRichTextEditorCoordinator

- (void)textViewDidChange:(id)a3
{
  v4 = (UITextView *)a3;
  v5 = self;
  UIKitRichTextEditorCoordinator.textViewDidChange(_:)(v4);
}

- (_TtC7SwiftUI30UIKitRichTextEditorCoordinator)init
{
  result = (_TtC7SwiftUI30UIKitRichTextEditorCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of UIKitRichTextEditor((uint64_t)self + OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_configuration, type metadata accessor for UIKitRichTextEditor);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_textStorage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_textContentStorage));
  outlined consume of RichTextAttributeResolver?(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_attributeResolver), *(void *)&self->_anon_0[OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_attributeResolver], *(void *)&self->textStorage[OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_attributeResolver]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI30UIKitRichTextEditorCoordinator_helper));

  swift_unknownObjectWeakDestroy();
}

@end