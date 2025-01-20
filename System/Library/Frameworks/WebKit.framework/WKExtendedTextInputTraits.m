@interface WKExtendedTextInputTraits
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)isSecureTextEntry;
- (BOOL)isSingleLineDocument;
- (BOOL)isTypingAdaptationEnabled;
- (NSString)textContentType;
- (UIColor)insertionPointColor;
- (UIColor)selectionHandleColor;
- (UIColor)selectionHighlightColor;
- (UITextInputPasswordRules)passwordRules;
- (WKExtendedTextInputTraits)init;
- (id).cxx_construct;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)inlinePredictionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)smartDashesType;
- (int64_t)smartInsertDeleteType;
- (int64_t)smartQuotesType;
- (int64_t)spellCheckingType;
- (void)restoreDefaultValues;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setEnablesReturnKeyAutomatically:(BOOL)a3;
- (void)setInlinePredictionType:(int64_t)a3;
- (void)setInsertionPointColor:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPasswordRules:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectionColorsToMatchTintColor:(id)a3;
- (void)setSelectionHandleColor:(id)a3;
- (void)setSelectionHighlightColor:(id)a3;
- (void)setSingleLineDocument:(BOOL)a3;
- (void)setSmartDashesType:(int64_t)a3;
- (void)setSmartInsertDeleteType:(int64_t)a3;
- (void)setSmartQuotesType:(int64_t)a3;
- (void)setSpellCheckingType:(int64_t)a3;
- (void)setTextContentType:(id)a3;
- (void)setTypingAdaptationEnabled:(BOOL)a3;
@end

@implementation WKExtendedTextInputTraits

- (void)setTextContentType:(id)a3
{
  v4 = (void *)[a3 copy];
  m_ptr = self->_textContentType.m_ptr;
  self->_textContentType.m_ptr = v4;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (UIColor)insertionPointColor
{
  return (UIColor *)self->_insertionPointColor.m_ptr;
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)setSelectionHighlightColor:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_selectionHighlightColor.m_ptr;
  self->_selectionHighlightColor.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)setSelectionColorsToMatchTintColor:(id)a3
{
  if (a3)
  {
    id v5 = (id)[MEMORY[0x1E4F428B8] systemBlueColor];
    if (v5 == a3) {
      id v6 = 0;
    }
    else {
      id v6 = a3;
    }
    [(WKExtendedTextInputTraits *)self setInsertionPointColor:v6];
    [(WKExtendedTextInputTraits *)self setSelectionHandleColor:v6];
    if (v5 != a3)
    {
      uint64_t v7 = [a3 colorWithAlphaComponent:0.2];
      goto LABEL_9;
    }
  }
  else
  {
    -[WKExtendedTextInputTraits setInsertionPointColor:](self, "setInsertionPointColor:");
    [(WKExtendedTextInputTraits *)self setSelectionHandleColor:0];
  }
  uint64_t v7 = 0;
LABEL_9:

  [(WKExtendedTextInputTraits *)self setSelectionHighlightColor:v7];
}

- (void)restoreDefaultValues
{
  [(WKExtendedTextInputTraits *)self setTypingAdaptationEnabled:1];
  [(WKExtendedTextInputTraits *)self setInlinePredictionType:0];
  [(WKExtendedTextInputTraits *)self setAutocapitalizationType:2];
  [(WKExtendedTextInputTraits *)self setAutocorrectionType:0];
  [(WKExtendedTextInputTraits *)self setSpellCheckingType:0];
  [(WKExtendedTextInputTraits *)self setSmartQuotesType:0];
  [(WKExtendedTextInputTraits *)self setSmartDashesType:0];
  [(WKExtendedTextInputTraits *)self setKeyboardType:0];
  [(WKExtendedTextInputTraits *)self setKeyboardAppearance:0];
  [(WKExtendedTextInputTraits *)self setReturnKeyType:0];
  [(WKExtendedTextInputTraits *)self setSecureTextEntry:0];
  [(WKExtendedTextInputTraits *)self setSingleLineDocument:0];
  [(WKExtendedTextInputTraits *)self setTextContentType:0];
  [(WKExtendedTextInputTraits *)self setPasswordRules:0];
  [(WKExtendedTextInputTraits *)self setSmartInsertDeleteType:0];
  [(WKExtendedTextInputTraits *)self setEnablesReturnKeyAutomatically:0];
  [(WKExtendedTextInputTraits *)self setInsertionPointColor:0];
  [(WKExtendedTextInputTraits *)self setSelectionHandleColor:0];

  [(WKExtendedTextInputTraits *)self setSelectionHighlightColor:0];
}

- (void)setTypingAdaptationEnabled:(BOOL)a3
{
  self->_typingAdaptationEnabled = a3;
}

- (void)setSelectionHandleColor:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_selectionHandleColor.m_ptr;
  self->_selectionHandleColor.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)setInsertionPointColor:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_insertionPointColor.m_ptr;
  self->_insertionPointColor.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (void)setSpellCheckingType:(int64_t)a3
{
  self->_spellCheckingType = a3;
}

- (void)setSmartQuotesType:(int64_t)a3
{
  self->_smartQuotesType = a3;
}

- (void)setSmartInsertDeleteType:(int64_t)a3
{
  self->_smartInsertDeleteType = a3;
}

- (void)setSmartDashesType:(int64_t)a3
{
  self->_smartDashesType = a3;
}

- (void)setSingleLineDocument:(BOOL)a3
{
  self->_singleLineDocument = a3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (void)setPasswordRules:(id)a3
{
  v4 = (void *)[a3 copy];
  m_ptr = self->_passwordRules.m_ptr;
  self->_passwordRules.m_ptr = v4;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (void)setInlinePredictionType:(int64_t)a3
{
  self->_inlinePredictionType = a3;
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  self->_enablesReturnKeyAutomatically = a3;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (WKExtendedTextInputTraits)init
{
  v5.receiver = self;
  v5.super_class = (Class)WKExtendedTextInputTraits;
  v2 = [(WKExtendedTextInputTraits *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(WKExtendedTextInputTraits *)v2 setTypingAdaptationEnabled:1];
    [(WKExtendedTextInputTraits *)v3 setAutocapitalizationType:2];
  }
  return v3;
}

- (UITextInputPasswordRules)passwordRules
{
  v2 = (void *)CFMakeCollectable((CFTypeRef)[self->_passwordRules.m_ptr copy]);

  return (UITextInputPasswordRules *)v2;
}

- (NSString)textContentType
{
  v2 = (void *)CFMakeCollectable((CFTypeRef)[self->_textContentType.m_ptr copy]);

  return (NSString *)v2;
}

- (UIColor)selectionHandleColor
{
  return (UIColor *)self->_selectionHandleColor.m_ptr;
}

- (UIColor)selectionHighlightColor
{
  return (UIColor *)self->_selectionHighlightColor.m_ptr;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (int64_t)spellCheckingType
{
  return self->_spellCheckingType;
}

- (int64_t)smartQuotesType
{
  return self->_smartQuotesType;
}

- (int64_t)smartDashesType
{
  return self->_smartDashesType;
}

- (int64_t)inlinePredictionType
{
  return self->_inlinePredictionType;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (BOOL)isSingleLineDocument
{
  return self->_singleLineDocument;
}

- (BOOL)isTypingAdaptationEnabled
{
  return self->_typingAdaptationEnabled;
}

- (int64_t)smartInsertDeleteType
{
  return self->_smartInsertDeleteType;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return self->_enablesReturnKeyAutomatically;
}

- (void).cxx_destruct
{
  m_ptr = self->_passwordRules.m_ptr;
  self->_passwordRules.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_selectionHighlightColor.m_ptr;
  self->_selectionHighlightColor.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  objc_super v5 = self->_selectionHandleColor.m_ptr;
  self->_selectionHandleColor.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  id v6 = self->_insertionPointColor.m_ptr;
  self->_insertionPointColor.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = self->_textContentType.m_ptr;
  self->_textContentType.m_ptr = 0;
  if (v7)
  {
    CFRelease(v7);
  }
}

@end