@interface NSAttributedString(MentionsHelper)
- (void)ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock:()MentionsHelper;
- (void)ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock:()MentionsHelper;
@end

@implementation NSAttributedString(MentionsHelper)

- (void)ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock:()MentionsHelper
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  uint64_t v6 = *MEMORY[0x1E4F6D518];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__NSAttributedString_MentionsHelper__ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke;
  v8[3] = &unk_1E5625F40;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 2, v8);
}

- (void)ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock:()MentionsHelper
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  uint64_t v6 = *MEMORY[0x1E4F6D518];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__NSAttributedString_MentionsHelper__ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke;
  v8[3] = &unk_1E5625F40;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 2, v8);
}

@end