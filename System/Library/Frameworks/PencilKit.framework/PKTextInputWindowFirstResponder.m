@interface PKTextInputWindowFirstResponder
- (BOOL)disableInputAssistant;
- (BOOL)hasScribbleInteraction;
- (BOOL)isEditableTextInput;
- (BOOL)isEditableTextInputWithPencilTextInputSource;
- (BOOL)isNotesHandwritingResponder;
- (BOOL)isPencilTextInputSource;
- (BOOL)isVisible;
- (PKTextInputWindowFirstResponder)initWithIsVisible:(BOOL)a3 isEditableTextInput:(BOOL)a4 hasScribbleInteraction:(BOOL)a5 textInputSource:(int64_t)a6 inputAssistantItem:(id)a7;
- (UITextInputAssistantItem)inputAssistantItem;
- (int64_t)textInputSource;
- (void)setDisableInputAssistant:(BOOL)a3;
- (void)setNotesHandwritingResponder:(BOOL)a3;
@end

@implementation PKTextInputWindowFirstResponder

- (PKTextInputWindowFirstResponder)initWithIsVisible:(BOOL)a3 isEditableTextInput:(BOOL)a4 hasScribbleInteraction:(BOOL)a5 textInputSource:(int64_t)a6 inputAssistantItem:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)PKTextInputWindowFirstResponder;
  v14 = [(PKTextInputWindowFirstResponder *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_isVisible = a3;
    v14->_editableTextInput = a4;
    v14->_hasScribbleInteraction = a5;
    v14->_textInputSource = a6;
    objc_storeStrong((id *)&v14->_inputAssistantItem, a7);
  }

  return v15;
}

- (BOOL)isPencilTextInputSource
{
  return self->_textInputSource == 3;
}

- (BOOL)isEditableTextInputWithPencilTextInputSource
{
  BOOL v3 = [(PKTextInputWindowFirstResponder *)self isPencilTextInputSource];
  if (v3)
  {
    LOBYTE(v3) = [(PKTextInputWindowFirstResponder *)self isEditableTextInput];
  }
  return v3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (int64_t)textInputSource
{
  return self->_textInputSource;
}

- (BOOL)isEditableTextInput
{
  return self->_editableTextInput;
}

- (BOOL)hasScribbleInteraction
{
  return self->_hasScribbleInteraction;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return self->_inputAssistantItem;
}

- (BOOL)disableInputAssistant
{
  return self->_disableInputAssistant;
}

- (void)setDisableInputAssistant:(BOOL)a3
{
  self->_disableInputAssistant = a3;
}

- (BOOL)isNotesHandwritingResponder
{
  return self->_notesHandwritingResponder;
}

- (void)setNotesHandwritingResponder:(BOOL)a3
{
  self->_notesHandwritingResponder = a3;
}

- (void).cxx_destruct
{
}

@end