@interface CKMentionsUtilities
+ (BOOL)attributedString:(id)a3 containsConfirmedMentionInRange:(_NSRange)a4;
+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3;
+ (BOOL)metionedHandleMatchesMeCard:(id)a3;
+ (BOOL)range:(_NSRange)a3 containsEmptySelectedRange:(_NSRange)a4;
+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4;
+ (BOOL)range:(_NSRange)a3 isPrefixedWithAtForString:(id)a4;
+ (BOOL)supportsSupplementalLexiconMentions;
+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4;
+ (id)languagesWithoutSpaces;
+ (void)configureAttributedString:(id)a3 automaticMentionAttributeWithOriginalText:(id)a4 entityNode:(id)a5 nodeId:(id)a6 forRange:(_NSRange)a7;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 boldingFont:(BOOL)a5 inRange:(_NSRange)a6;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forConfirmedMentionInRange:(_NSRange)a5 needingAnimation:(BOOL)a6;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forDirectMentionInRange:(_NSRange)a5 forChildNode:(id)a6 nodeId:(id)a7 addingVisualStyling:(BOOL)a8 shouldAddAutoComplete:(BOOL)a9;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forNoMentionInRange:(_NSRange)a5;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forUnconfirmedDirectMention:(id)a5 inRange:(_NSRange)a6 addingVisualStyling:(BOOL)a7;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forUnconfirmedMentionInRange:(_NSRange)a5;
+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 withOriginalText:(id)a5 inRange:(_NSRange)a6;
+ (void)configureAttributedString:(id)a3 withFontColor:(id)a4 forRange:(_NSRange)a5;
+ (void)configureAttributedString:(id)a3 withParagraphStyleInTextView:(id)a4 inRange:(_NSRange)a5;
+ (void)configureAttributedStringForMentionsChecking:(id)a3 excludingRange:(const _NSRange *)a4;
+ (void)hideMentionsInAttributedString:(id)a3 inTextView:(id)a4;
+ (void)removeMentionsAtIndex:(int64_t)a3 onAttributedString:(id)a4 inTextView:(id)a5;
+ (void)replaceAttributedString:(id)a3 withEntity:(id)a4 fromInputText:(id)a5 inRange:(_NSRange)a6 updatingRange:(_NSRange *)a7;
@end

@implementation CKMentionsUtilities

+ (BOOL)supportsSupplementalLexiconMentions
{
  v2 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  v3 = [v2 currentInputMode];
  char v4 = [v3 isExtensionInputMode];

  if (v4) {
    return 0;
  }
  v6 = [MEMORY[0x1E4F42B20] activeInstance];
  if ([v6 predictionFromPreference]) {
    char v7 = UIKeyboardPredictionEnabledForCurrentInputMode();
  }
  else {
    char v7 = 0;
  }

  v8 = NSSelectorFromString(&cfstr_Autocorrection_0.isa);
  v9 = [MEMORY[0x1E4F42B20] activeInstance];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [MEMORY[0x1E4F42B20] activeInstance];
    unsigned __int8 v12 = [v11 v8];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
  v13 = [MEMORY[0x1E4F42B20] activeInstance];
  char v14 = [v13 displaysCandidates];

  return v7 | v12 | v14;
}

+ (BOOL)metionedHandleMatchesMeCard:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F6BBD8];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  char v6 = [v5 metionedHandleMatchesMeCard:v4];

  return v6;
}

+ (BOOL)attributedString:(id)a3 containsConfirmedMentionInRange:(_NSRange)a4
{
  return objc_msgSend(a3, "attribute:existsInRange:", *MEMORY[0x1E4F6D538], a4.location, a4.length);
}

+ (void)replaceAttributedString:(id)a3 withEntity:(id)a4 fromInputText:(id)a5 inRange:(_NSRange)a6 updatingRange:(_NSRange *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v17 = a3;
  id v12 = a5;
  id v13 = a4;
  char v14 = [v13 mentionsHandleID];
  v15 = [v13 displayNameMatchingInputText:v12];

  if ([v15 length])
  {
    objc_msgSend(v17, "replaceCharactersInRange:withString:", location, length, v15);
    uint64_t v16 = [v15 length];
    a7->NSUInteger location = location;
    a7->NSUInteger length = v16;
  }
  else
  {
    NSUInteger location = a7->location;
    uint64_t v16 = a7->length;
  }
  objc_msgSend(v17, "addAttribute:value:range:", *MEMORY[0x1E4F6D538], v14, location, v16);
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 withOriginalText:(id)a5 inRange:(_NSRange)a6
{
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 boldingFont:(BOOL)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v8 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v11 font];
  id v13 = [v12 fontDescriptor];
  int v14 = [v13 symbolicTraits];

  if (v8) {
    int v15 = 2;
  }
  else {
    int v15 = 0;
  }
  uint64_t v16 = v14 & 0xFFFFFFFD | v15;
  id v17 = [v11 font];
  v18 = [v17 fontDescriptor];
  v19 = [v18 fontDescriptorWithSymbolicTraits:v16];

  v20 = (void *)MEMORY[0x1E4FB08E0];
  v21 = [v11 font];

  [v21 pointSize];
  v22 = objc_msgSend(v20, "fontWithDescriptor:size:", v19);

  if (v10 && v22 && length)
  {
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v22, location, length);
  }
  else
  {
    v23 = IMLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24.NSUInteger location = location;
      v24.NSUInteger length = length;
      +[CKMentionsUtilities configureAttributedString:inTextView:boldingFont:inRange:]((uint64_t)v22, v24, v23);
    }
  }
}

+ (void)configureAttributedString:(id)a3 withFontColor:(id)a4 forRange:(_NSRange)a5
{
}

+ (void)configureAttributedString:(id)a3 withParagraphStyleInTextView:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  BOOL v8 = [a4 typingAttributes];
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];

  if (v10) {
    objc_msgSend(v11, "addAttribute:value:range:", v9, v10, location, length);
  }
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forConfirmedMentionInRange:(_NSRange)a5 needingAnimation:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v19 = a3;
  id v11 = a4;
  objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4F6D508], &stru_1EDE4CA38, location, length);
  objc_msgSend(v19, "removeAttribute:range:", *MEMORY[0x1E4F6D550], location, length);
  objc_msgSend(v19, "removeAttribute:range:", *MEMORY[0x1E4F6D518], location, length);
  id v12 = +[CKUIBehavior sharedBehaviors];
  id v13 = [v12 theme];
  int v14 = [v13 entryFieldConfirmedMentionColor];

  if (v6)
  {
    int v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];

    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4F6D510], v16, location, length);
  }
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v19, v11, 1, location, length);
  objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v19, v14, location, length);
  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v19, v11, location, length);
  id v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v18 = [v17 isExpressiveTextEnabled];

  if (v18 && [v11 allowsTextAnimations])
  {
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 2, 3, location, length);
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 4, 3, location, length);
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 8, 3, location, length);
    objc_msgSend(v19, "ck_removeTextStyle:options:range:", 1, 1, location, length);
  }
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forNoMentionInRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v9 = *MEMORY[0x1E4F6D510];
  id v10 = a4;
  id v14 = a3;
  objc_msgSend(v14, "removeAttribute:range:", v9, location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E4F6D508], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E4F6D538], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E4F6D540], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E4F6D548], location, length);
  objc_msgSend(v14, "removeAttribute:range:", *MEMORY[0x1E4F6D550], location, length);
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v14, v10, 0, location, length);
  id v11 = +[CKUIBehavior sharedBehaviors];
  id v12 = [v11 theme];
  id v13 = [v12 entryFieldTextColor];
  objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v14, v13, location, length);

  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v14, v10, location, length);
}

+ (void)hideMentionsInAttributedString:(id)a3 inTextView:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = [v18 length];
  BOOL v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isExpressiveTextEnabled];

  id v10 = (void *)MEMORY[0x1E4F6D508];
  id v11 = (void *)MEMORY[0x1E4F6D510];
  if (!v9
    || ![v6 allowsTextAnimations]
    || (char v12 = objc_msgSend(a1, "attributedString:containsConfirmedMentionInRange:", v18, 0, v7),
        char v13 = objc_msgSend(v18, "attribute:existsInRange:", *v10, 0, v7),
        int v14 = objc_msgSend(v18, "attribute:existsInRange:", *v11, 0, v7),
        (v12 & 1) != 0)
    || (v13 & 1) != 0
    || v14)
  {
    objc_msgSend(v18, "removeAttribute:range:", *v10, 0, v7);
    objc_msgSend(v18, "removeAttribute:range:", *v11, 0, v7);
    objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v18, v6, 0, 0, v7);
    int v15 = +[CKUIBehavior sharedBehaviors];
    uint64_t v16 = [v15 theme];
    id v17 = [v16 entryFieldTextColor];
    objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v18, v17, 0, v7);

    objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v18, v6, 0, v7);
  }
}

+ (void)configureAttributedStringForMentionsChecking:(id)a3 excludingRange:(const _NSRange *)a4
{
  id v6 = a3;
  id v25 = v6;
  if (a4 && (NSUInteger location = a4->location, a4->location != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v16 = [v6 length];
    if (location >= v16) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = location;
    }
    NSUInteger v18 = a4->length + a4->location;
    unint64_t v19 = [v25 length];
    if (v18 >= v19) {
      NSUInteger v18 = v19;
    }
    uint64_t v20 = [v25 length] - v18;
    uint64_t v21 = *MEMORY[0x1E4F6D508];
    objc_msgSend(v25, "removeAttribute:range:", *MEMORY[0x1E4F6D508], 0, v17);
    objc_msgSend(v25, "removeAttribute:range:", v21, v18, v20);
    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 theme];
    NSRange v24 = [v23 entryFieldTextColor];
    objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v25, v24, 0, v17);

    BOOL v8 = +[CKUIBehavior sharedBehaviors];
    int v9 = [v8 theme];
    id v10 = [v9 entryFieldTextColor];
    id v12 = a1;
    id v13 = v25;
    int v14 = v10;
    NSUInteger v15 = v18;
    uint64_t v11 = v20;
  }
  else
  {
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4F6D508], 0, objc_msgSend(v6, "length"));
    BOOL v8 = +[CKUIBehavior sharedBehaviors];
    int v9 = [v8 theme];
    id v10 = [v9 entryFieldTextColor];
    uint64_t v11 = [v25 length];
    id v12 = a1;
    id v13 = v25;
    int v14 = v10;
    NSUInteger v15 = 0;
  }
  objc_msgSend(v12, "configureAttributedString:withFontColor:forRange:", v13, v14, v15, v11);
}

+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger location = a4.location;
  }
  else {
    NSUInteger location = a3.location;
  }
  NSUInteger v5 = a4.location + a4.length - location;
  result.NSUInteger length = v5;
  result.NSUInteger location = location;
  return result;
}

+ (BOOL)range:(_NSRange)a3 isPrefixedWithAtForString:(id)a4
{
  int64_t location = a3.location;
  id v5 = a4;
  id v6 = v5;
  BOOL v7 = location < 1;
  unint64_t v8 = location - 1;
  BOOL v9 = !v7 && v8 < [v5 length] && objc_msgSend(v6, "characterAtIndex:", v8) == 64;

  return v9;
}

+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  unint64_t v8 = v7;
  uint64_t v9 = location + length;
  if (v9 < 0 || v9 >= (unint64_t)[v7 length]) {
    char v10 = 0;
  }
  else {
    char v10 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v8, "characterAtIndex:", v9));
  }

  return v10;
}

+ (BOOL)range:(_NSRange)a3 containsEmptySelectedRange:(_NSRange)a4
{
  BOOL v4 = a4.location <= a3.location + a3.length;
  if (a4.location < a3.location) {
    BOOL v4 = 0;
  }
  if (!a3.length) {
    BOOL v4 = 0;
  }
  return !a4.length && v4;
}

+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v4 characterIsMember:v3])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    char v5 = [v6 characterIsMember:v3];
  }
  return v5;
}

+ (void)configureAttributedString:(id)a3 automaticMentionAttributeWithOriginalText:(id)a4 entityNode:(id)a5 nodeId:(id)a6 forRange:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v25 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  NSUInteger v15 = [v14 string];
  unint64_t v16 = objc_msgSend(v15, "substringWithRange:", location, length);

  unint64_t v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v18 = [v17 isTextKit2Enabled];

  if (v18)
  {
    unint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v25)
    {
      uint64_t v20 = (void *)[v25 copy];
      [(CKMentionAutoCompleteAttribute *)v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F6D530]];
    }
    if (v16)
    {
      uint64_t v21 = (void *)[v16 copy];
      [(CKMentionAutoCompleteAttribute *)v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F6D520]];
    }
    if (v13)
    {
      v22 = [v13 keys];
      [(CKMentionAutoCompleteAttribute *)v19 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6D528]];
    }
    uint64_t v23 = *MEMORY[0x1E4F6D518];
    uint64_t v24 = [(CKMentionAutoCompleteAttribute *)v19 copy];
    objc_msgSend(v14, "addAttribute:value:range:", v23, v24, location, length);

    id v14 = (id)v24;
  }
  else
  {
    unint64_t v19 = [[CKMentionAutoCompleteAttribute alloc] initWithMentionEntityNode:v12 originalText:v25 displayText:v16];
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E4F6D518], v19, location, length);
  }
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forDirectMentionInRange:(_NSRange)a5 forChildNode:(id)a6 nodeId:(id)a7 addingVisualStyling:(BOOL)a8 shouldAddAutoComplete:(BOOL)a9
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v22 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a4;
  int v18 = [v22 string];
  unint64_t v19 = objc_msgSend(v18, "substringWithRange:", location, length);

  NSUInteger v20 = location - 1;
  NSUInteger v21 = length + 1;
  objc_msgSend(a1, "configureAttributedString:inTextView:forUnconfirmedDirectMention:inRange:addingVisualStyling:", v22, v17, v19, v20, v21, a8);

  if (a9) {
    objc_msgSend(a1, "configureAttributedString:automaticMentionAttributeWithOriginalText:entityNode:nodeId:forRange:", v22, v19, v15, v16, v20, v21);
  }
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forUnconfirmedDirectMention:(id)a5 inRange:(_NSRange)a6 addingVisualStyling:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v20 = a3;
  id v13 = a5;
  id v14 = a4;
  id v15 = [v20 string];
  id v16 = objc_msgSend(v15, "substringWithRange:", location, length);

  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E4F6D508], v16, location, length);
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E4F6D550], v13, location, length);

  objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x1E4F6D538], location, length);
  objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x1E4F6D540], location, length);
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v20, v14, 0, location, length);
  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v20, v14, location, length);

  if (v7)
  {
    id v17 = +[CKUIBehavior sharedBehaviors];
    int v18 = [v17 theme];
    unint64_t v19 = [v18 entryFieldUnconfirmedMentionColor];
    objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v20, v19, location, length);
  }
}

+ (void)removeMentionsAtIndex:(int64_t)a3 onAttributedString:(id)a4 inTextView:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((a3 & 0x8000000000000000) == 0 && [v8 length] > (unint64_t)a3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    char v10 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F6D508], a3, &v11, 0, objc_msgSend(v8, "length"));

    if (v10) {
      objc_msgSend(a1, "configureAttributedString:inTextView:forNoMentionInRange:", v8, v9, v11, v12);
    }
  }
}

+ (void)configureAttributedString:(id)a3 inTextView:(id)a4 forUnconfirmedMentionInRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 string];
  objc_msgSend(v11, "substringWithRange:", location, length);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4F6D508], v15, location, length);
  objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x1E4F6D538], location, length);
  objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x1E4F6D540], location, length);
  objc_msgSend(a1, "configureAttributedString:inTextView:boldingFont:inRange:", v10, v9, 0, location, length);
  objc_msgSend(a1, "configureAttributedString:withParagraphStyleInTextView:inRange:", v10, v9, location, length);

  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  id v13 = [v12 theme];
  id v14 = [v13 entryFieldUnconfirmedMentionColor];
  objc_msgSend(a1, "configureAttributedString:withFontColor:forRange:", v10, v14, location, length);
}

+ (id)languagesWithoutSpaces
{
  if (languagesWithoutSpaces_once != -1) {
    dispatch_once(&languagesWithoutSpaces_once, &__block_literal_global_153);
  }
  v2 = (void *)languagesWithoutSpaces_sLanguages;

  return v2;
}

void __45__CKMentionsUtilities_languagesWithoutSpaces__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zh", @"yue", @"ja", @"th", 0);
  v1 = (void *)languagesWithoutSpaces_sLanguages;
  languagesWithoutSpaces_sLanguages = v0;
}

+ (void)configureAttributedString:(NSObject *)a3 inTextView:boldingFont:inRange:.cold.1(uint64_t a1, NSRange range, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = NSStringFromRange(range);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "Attempted to call addAttribute with value:%@ for range:%@", (uint8_t *)&v6, 0x16u);
}

@end