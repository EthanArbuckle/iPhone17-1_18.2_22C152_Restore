@interface CKCompositionBuilderContext
- (BOOL)canUseRichTextAttributes;
- (BOOL)conversationSupportsInlineAdaptiveImageGlyphs;
- (BOOL)isInLockdownMode;
- (BOOL)isPastingAfterBracketCharacter;
- (BOOL)supportsExpressiveText;
- (BOOL)wantsInlinedRichLinks;
- (_TtC7ChatKit27CKCompositionBuilderContext)init;
- (void)setCanUseRichTextAttributes:(BOOL)a3;
- (void)setConversationSupportsInlineAdaptiveImageGlyphs:(BOOL)a3;
- (void)setIsInLockdownMode:(BOOL)a3;
- (void)setIsPastingAfterBracketCharacter:(BOOL)a3;
- (void)setSupportsExpressiveText:(BOOL)a3;
@end

@implementation CKCompositionBuilderContext

- (BOOL)isInLockdownMode
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInLockdownMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isPastingAfterBracketCharacter
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPastingAfterBracketCharacter:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)supportsExpressiveText
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_supportsExpressiveText;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsExpressiveText:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_supportsExpressiveText;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)conversationSupportsInlineAdaptiveImageGlyphs
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_conversationSupportsInlineAdaptiveImageGlyphs;
  swift_beginAccess();
  return *v2;
}

- (void)setConversationSupportsInlineAdaptiveImageGlyphs:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_conversationSupportsInlineAdaptiveImageGlyphs;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)canUseRichTextAttributes
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_canUseRichTextAttributes;
  swift_beginAccess();
  return *v2;
}

- (void)setCanUseRichTextAttributes:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_canUseRichTextAttributes;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)wantsInlinedRichLinks
{
  v2 = self;
  char v3 = sub_18F65B3E4();

  return v3 & 1;
}

- (_TtC7ChatKit27CKCompositionBuilderContext)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isInLockdownMode) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_isPastingAfterBracketCharacter) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_supportsExpressiveText) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_conversationSupportsInlineAdaptiveImageGlyphs) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit27CKCompositionBuilderContext_canUseRichTextAttributes) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKCompositionBuilderContext();
  return [(CKCompositionBuilderContext *)&v3 init];
}

@end