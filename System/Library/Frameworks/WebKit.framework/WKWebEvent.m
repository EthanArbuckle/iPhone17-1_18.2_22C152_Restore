@interface WKWebEvent
- (UIEvent)uiEvent;
- (WKWebEvent)initWithEvent:(id)a3;
- (id).cxx_construct;
@end

@implementation WKWebEvent

- (WKWebEvent)initWithEvent:(id)a3
{
  if (_MergedGlobals_258 != 1)
  {
    qword_1E93CF830 = (uint64_t)NSClassFromString(&cfstr_Uiphysicalkeyb.isa);
    _MergedGlobals_258 = 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 _hidEvent])
  {
    __int16 v5 = [a3 _keyCode];
    unsigned int v6 = [a3 _inputFlags];
    uint64_t v7 = [a3 _gsModifierFlags];
    a3 = (id)[a3 _cloneEvent];
  }
  else
  {
    if (a3) {
      CFRetain(a3);
    }
    __int16 v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0;
  }
  if ([a3 _isKeyDown]) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 5;
  }
  [a3 timestamp];
  double v10 = v9;
  uint64_t v11 = [a3 _modifiedInput];
  uint64_t v12 = [a3 _unmodifiedInput];
  v18.receiver = self;
  v18.super_class = (Class)WKWebEvent;
  BYTE2(v17) = objc_msgSend((id)objc_msgSend(a3, "_modifiedInput"), "isEqualToString:", @"\t");
  LOWORD(v17) = v5;
  v13 = -[WebEvent initWithKeyEventType:timeStamp:characters:charactersIgnoringModifiers:modifiers:isRepeating:withFlags:withInputManagerHint:keyCode:isTabKey:](&v18, sel_initWithKeyEventType_timeStamp_characters_charactersIgnoringModifiers_modifiers_isRepeating_withFlags_withInputManagerHint_keyCode_isTabKey_, v8, v11, v12, v7, v6 & 1, v6, v10, 0, v17);
  v14 = v13;
  if (!v13)
  {
    if (!a3) {
      return v14;
    }
    goto LABEL_14;
  }
  m_ptr = v13->_uiEvent.m_ptr;
  v13->_uiEvent.m_ptr = a3;
  a3 = m_ptr;
  if (m_ptr) {
LABEL_14:
  }
    CFRelease(a3);
  return v14;
}

- (UIEvent)uiEvent
{
  return (UIEvent *)self->_uiEvent.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_uiEvent.m_ptr;
  self->_uiEvent.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  return self;
}

@end