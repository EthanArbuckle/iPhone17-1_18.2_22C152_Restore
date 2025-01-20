@interface WKFormInputSession
- (BOOL)accessoryViewShouldNotShow;
- (BOOL)forceSecureTextEntry;
- (BOOL)isValid;
- (BOOL)requiresStrongPasswordAssistance;
- (NSArray)suggestions;
- (NSSecureCoding)userObject;
- (NSString)accessoryViewCustomButtonTitle;
- (UIView)customInputAccessoryView;
- (UIView)customInputView;
- (WKFormInputSession)initWithContentView:(id)a3 focusedElementInfo:(id)a4 requiresStrongPasswordAssistance:(BOOL)a5;
- (_WKFocusedElementInfo)focusedElementInfo;
- (id).cxx_construct;
- (void)endEditing;
- (void)invalidate;
- (void)reloadFocusedElementContextView;
- (void)setAccessoryViewCustomButtonTitle:(id)a3;
- (void)setAccessoryViewShouldNotShow:(BOOL)a3;
- (void)setCustomInputAccessoryView:(id)a3;
- (void)setCustomInputView:(id)a3;
- (void)setForceSecureTextEntry:(BOOL)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation WKFormInputSession

- (WKFormInputSession)initWithContentView:(id)a3 focusedElementInfo:(id)a4 requiresStrongPasswordAssistance:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)WKFormInputSession;
  v8 = [(WKFormInputSession *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_contentView.m_weakReference, a3);
    if (a4) {
      CFRetain(a4);
    }
    m_ptr = v9->_focusedElementInfo.m_ptr;
    v9->_focusedElementInfo.m_ptr = a4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v9->_requiresStrongPasswordAssistance = a5;
  }
  return v9;
}

- (_WKFocusedElementInfo)focusedElementInfo
{
  return (_WKFocusedElementInfo *)self->_focusedElementInfo.m_ptr;
}

- (NSSecureCoding)userObject
{
  return (NSSecureCoding *)[self->_focusedElementInfo.m_ptr userObject];
}

- (BOOL)isValid
{
  id WeakRetained = objc_loadWeakRetained(&self->_contentView.m_weakReference);
  id v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3 != 0;
}

- (NSString)accessoryViewCustomButtonTitle
{
  v2 = objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "formAccessoryView"), "autoFillButtonItem");

  return (NSString *)[v2 title];
}

- (void)setAccessoryViewCustomButtonTitle:(id)a3
{
  uint64_t v5 = [a3 length];
  p_contentView = &self->_contentView;
  v7 = (void *)[objc_loadWeak(&p_contentView->m_weakReference) formAccessoryView];
  if (v5) {
    v8 = (PAL *)[v7 showAutoFillButtonWithTitle:a3];
  }
  else {
    v8 = (PAL *)[v7 hideAutoFillButton];
  }
  if ((PAL::currentUserInterfaceIdiomIsSmallScreen(v8) & 1) == 0)
  {
    id Weak = objc_loadWeak(&p_contentView->m_weakReference);
    [Weak reloadInputViews];
  }
}

- (BOOL)accessoryViewShouldNotShow
{
  return self->_accessoryViewShouldNotShow;
}

- (void)setAccessoryViewShouldNotShow:(BOOL)a3
{
  if (self->_accessoryViewShouldNotShow != a3)
  {
    self->_accessoryViewShouldNotShow = a3;
    id Weak = objc_loadWeak(&self->_contentView.m_weakReference);
    [Weak reloadInputViews];
  }
}

- (BOOL)forceSecureTextEntry
{
  return self->_forceSecureTextEntry;
}

- (void)setForceSecureTextEntry:(BOOL)a3
{
  if (self->_forceSecureTextEntry != a3)
  {
    self->_forceSecureTextEntry = a3;
    id Weak = objc_loadWeak(&self->_contentView.m_weakReference);
    [Weak reloadInputViews];
  }
}

- (UIView)customInputView
{
  return (UIView *)self->_customInputView.m_ptr;
}

- (void)setCustomInputView:(id)a3
{
  id m_ptr = self->_customInputView.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_customInputView.m_ptr;
    }
    self->_customInputView.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    id Weak = objc_loadWeak(&self->_contentView.m_weakReference);
    [Weak reloadInputViews];
  }
}

- (UIView)customInputAccessoryView
{
  return (UIView *)self->_customInputAccessoryView.m_ptr;
}

- (void)setCustomInputAccessoryView:(id)a3
{
  id m_ptr = self->_customInputAccessoryView.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      id m_ptr = self->_customInputAccessoryView.m_ptr;
    }
    self->_customInputAccessoryView.id m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    id Weak = objc_loadWeak(&self->_contentView.m_weakReference);
    [Weak reloadInputViews];
  }
}

- (void)endEditing
{
  if ([self->_customInputView.m_ptr conformsToProtocol:&unk_1EEAAD8C0])
  {
    id m_ptr = self->_customInputView.m_ptr;
    [m_ptr controlEndEditing];
  }
}

- (NSArray)suggestions
{
  return (NSArray *)self->_suggestions.m_ptr;
}

- (void)setSuggestions:(id)a3
{
  if (self->_suggestions.m_ptr != a3 && (objc_msgSend(a3, "isEqualToArray:") & 1) == 0)
  {
    uint64_t v5 = (void *)[a3 copy];
    id m_ptr = self->_suggestions.m_ptr;
    self->_suggestions.id m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    id Weak = objc_loadWeak(&self->_contentView.m_weakReference);
    [Weak updateTextSuggestionsForInputDelegate];
  }
}

- (BOOL)requiresStrongPasswordAssistance
{
  return self->_requiresStrongPasswordAssistance;
}

- (void)invalidate
{
  p_contentView = &self->_contentView;
  id to = 0;
  objc_moveWeak(&to, &self->_contentView.m_weakReference);
  objc_storeWeak(&p_contentView->m_weakReference, 0);
  [objc_loadWeak(&to) _provideSuggestionsToInputDelegate:0];
  objc_destroyWeak(&to);
}

- (void)reloadFocusedElementContextView
{
  id Weak = objc_loadWeak(&self->_contentView.m_weakReference);

  [Weak reloadContextViewForPresentedListViewController];
}

- (void).cxx_destruct
{
  id m_ptr = self->_suggestions.m_ptr;
  self->_suggestions.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_customInputAccessoryView.m_ptr;
  self->_customInputAccessoryView.id m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_customInputView.m_ptr;
  self->_customInputView.id m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->_focusedElementInfo.m_ptr;
  self->_focusedElementInfo.id m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }

  objc_destroyWeak(&self->_contentView.m_weakReference);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end