@interface AXEmojiConversionCandidateElement
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)selectEmoji:(id)a3;
- (CKMessageEntryTextViewAccessibility)textView;
- (NSString)candidateString;
- (NSString)conversionLanguage;
- (_NSRange)candidateRange;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)candidateEmojiArray;
- (id)candidateEmojiList;
- (id)currentEmoji;
- (unint64_t)currentIndex;
- (void)setCandidateEmojiList:(id)a3;
- (void)setCandidateRange:(_NSRange)a3;
- (void)setCandidateString:(id)a3;
- (void)setConversionLanguage:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation AXEmojiConversionCandidateElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return self->_candidateString;
}

- (id)candidateEmojiArray
{
  v2 = [(AXEmojiConversionCandidateElement *)self candidateEmojiList];
  v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"emojiTokenArray"];

  return v4;
}

- (id)accessibilityHint
{
  v3 = [(AXEmojiConversionCandidateElement *)self candidateEmojiArray];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(AXEmojiConversionCandidateElement *)self candidateEmojiArray];
    v6 = [v5 firstObject];
    v7 = [v6 safeValueForKey:@"string"];

    v8 = NSString;
    v9 = accessibilityLocalizedString(@"emoji.replace.with.single");
    v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
  }
  else
  {
    v10 = accessibilityLocalizedString(@"emoji.replace.with.multiple");
  }

  return v10;
}

- (BOOL)accessibilityActivate
{
  v3 = [(AXEmojiConversionCandidateElement *)self candidateEmojiArray];
  uint64_t v4 = [v3 count];

  textView = self->_textView;
  if (v4 == 1)
  {
    [(CKMessageEntryTextViewAccessibility *)textView _axReplaceEmojiWithElement:self];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self->_textView);
  }
  else
  {
    [(CKMessageEntryTextViewAccessibility *)textView _axShowOverlayWithEmojiElement:self];
  }
  return 1;
}

- (id)currentEmoji
{
  unint64_t currentIndex = self->_currentIndex;
  uint64_t v4 = [(AXEmojiConversionCandidateElement *)self candidateEmojiArray];
  unint64_t v5 = [v4 count];

  if (currentIndex >= v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = [(AXEmojiConversionCandidateElement *)self candidateEmojiArray];
    v7 = [v6 objectAtIndexedSubscript:self->_currentIndex];
  }

  return v7;
}

- (BOOL)selectEmoji:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AXEmojiConversionCandidateElement *)self candidateEmojiArray];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    self->_unint64_t currentIndex = v6;
  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (CKMessageEntryTextViewAccessibility)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSString)candidateString
{
  return self->_candidateString;
}

- (void)setCandidateString:(id)a3
{
}

- (_NSRange)candidateRange
{
  p_candidateRange = &self->_candidateRange;
  NSUInteger location = self->_candidateRange.location;
  NSUInteger length = p_candidateRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCandidateRange:(_NSRange)a3
{
  self->_candidateRange = a3;
}

- (id)candidateEmojiList
{
  return self->_candidateEmojiList;
}

- (void)setCandidateEmojiList:(id)a3
{
}

- (NSString)conversionLanguage
{
  return self->_conversionLanguage;
}

- (void)setConversionLanguage:(id)a3
{
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionLanguage, 0);
  objc_storeStrong(&self->_candidateEmojiList, 0);
  objc_storeStrong((id *)&self->_candidateString, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end