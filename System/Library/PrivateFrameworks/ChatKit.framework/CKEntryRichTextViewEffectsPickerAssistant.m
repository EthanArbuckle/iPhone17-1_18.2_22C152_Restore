@interface CKEntryRichTextViewEffectsPickerAssistant
- (BOOL)shouldSkipNextAdjustingOfTypingAttributes;
- (CKEntryRichTextViewEffectsPickerAssistant)init;
- (CKEntryRichTextViewEffectsPickerAssistant)initWithTextView:(id)a3;
- (void)adjustTypingAttributesIfNeededForReplacement:(id)a3 inRange:(_NSRange)a4;
- (void)removeTypingAttributesAdjustments;
- (void)selectSentenceAtCaretIfPossible;
- (void)selectWordAtCaretIfPossible;
- (void)setShouldSkipNextAdjustingOfTypingAttributes:(BOOL)a3;
@end

@implementation CKEntryRichTextViewEffectsPickerAssistant

- (CKEntryRichTextViewEffectsPickerAssistant)initWithTextView:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR___CKEntryRichTextViewEffectsPickerAssistant_shouldSkipNextAdjustingOfTypingAttributes) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EntryRichTextViewEffectsPickerAssistant();
  return [(CKEntryRichTextViewEffectsPickerAssistant *)&v5 init];
}

- (void).cxx_destruct
{
}

- (BOOL)shouldSkipNextAdjustingOfTypingAttributes
{
  v2 = (BOOL *)self + OBJC_IVAR___CKEntryRichTextViewEffectsPickerAssistant_shouldSkipNextAdjustingOfTypingAttributes;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldSkipNextAdjustingOfTypingAttributes:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKEntryRichTextViewEffectsPickerAssistant_shouldSkipNextAdjustingOfTypingAttributes;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)selectSentenceAtCaretIfPossible
{
  v2 = self;
  sub_18F59BEE0();
}

- (void)selectWordAtCaretIfPossible
{
  v2 = self;
  sub_18F59C5CC();
}

- (void)adjustTypingAttributesIfNeededForReplacement:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = sub_18F7B97E0();
  unint64_t v9 = v8;
  v10 = self;
  sub_18F59C754(v7, v9, location, length, 1);

  swift_bridgeObjectRelease();
}

- (void)removeTypingAttributesAdjustments
{
  v2 = self;
  sub_18F59D9C0();
}

- (CKEntryRichTextViewEffectsPickerAssistant)init
{
  result = (CKEntryRichTextViewEffectsPickerAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end