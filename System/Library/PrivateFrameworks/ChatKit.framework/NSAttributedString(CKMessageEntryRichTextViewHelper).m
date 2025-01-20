@interface NSAttributedString(CKMessageEntryRichTextViewHelper)
- (void)ck_enumerateAllMentionAnimationIdentifiersUsingBlock:()CKMessageEntryRichTextViewHelper;
@end

@implementation NSAttributedString(CKMessageEntryRichTextViewHelper)

- (void)ck_enumerateAllMentionAnimationIdentifiersUsingBlock:()CKMessageEntryRichTextViewHelper
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F6D510];
  uint64_t v6 = [a1 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__NSAttributedString_CKMessageEntryRichTextViewHelper__ck_enumerateAllMentionAnimationIdentifiersUsingBlock___block_invoke;
  v8[3] = &unk_1E5625F40;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 2, v8);
}

@end