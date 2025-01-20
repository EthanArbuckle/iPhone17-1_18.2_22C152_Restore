@interface PKTextInputKeyboardSuppressionPolicyDelegate
- (BOOL)_shouldSuppressAssistantBarForDelegate:(id)a3;
- (BOOL)_shouldSuppressForDelegate:(id)a3;
- (BOOL)_shouldSuppressKeyboardUIForDelegate:(id)a3 checkSource:(BOOL)a4;
- (BOOL)_suppressLocaleIdentifier;
- (BOOL)isFloatingKeyboardVisible;
- (BOOL)isSupportedForTextInputTraits:(id)a3;
- (id)_recognitionLocaleIdentifier;
- (void)setIsFloatingKeyboardVisible:(BOOL)a3;
- (void)set_suppressLocaleIdentifier:(BOOL)a3;
- (void)updateKeyboardSuppressionPolicy;
@end

@implementation PKTextInputKeyboardSuppressionPolicyDelegate

- (void)updateKeyboardSuppressionPolicy
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x1E4FB3088] object:0];
}

- (id)_recognitionLocaleIdentifier
{
  if (self->_isQueryingLocaleIdentifier)
  {
    id v2 = 0;
  }
  else
  {
    self->_isQueryingLocaleIdentifier = 1;
    v4 = +[PKTextInputSettings sharedSettings];
    v5 = [v4 recognitionLocaleIdentifier];
    self->_isQueryingLocaleIdentifier = 0;
    if ([(PKTextInputKeyboardSuppressionPolicyDelegate *)self _suppressLocaleIdentifier]) {
      v6 = 0;
    }
    else {
      v6 = v5;
    }
    id v2 = v6;
  }

  return v2;
}

- (BOOL)_shouldSuppressForDelegate:(id)a3
{
  return [(PKTextInputKeyboardSuppressionPolicyDelegate *)self _shouldSuppressKeyboardUIForDelegate:a3 checkSource:1];
}

- (BOOL)_shouldSuppressAssistantBarForDelegate:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    v8 = +[PKTextInputSettings sharedSettings];
    int v9 = [v8 UCBPaletteEnabled];

    if (v9
      && ![(PKTextInputKeyboardSuppressionPolicyDelegate *)self isFloatingKeyboardVisible])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v4 _responderWindow],
            v10 = objc_claimAutoreleasedReturnValue(),
            BOOL v11 = +[PKToolPicker isActiveToolPickerVisibleForWindow:v10], v10, v11))
      {
        id v12 = v4;
        if ([v12 isStylusDrawingEnabled]) {
          uint64_t v13 = [v12 _isHandwritingToolSelected] ^ 1;
        }
        else {
          uint64_t v13 = 1;
        }
      }
      else
      {
        uint64_t v13 = 1;
      }
      char v17 = [(PKTextInputKeyboardSuppressionPolicyDelegate *)self _shouldSuppressKeyboardUIForDelegate:v4 checkSource:v13];
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  v5 = [v4 _responderWindow];
  BOOL v6 = +[PKToolPicker isActiveToolPickerVisibleForWindow:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v7) = 0;
    if (!v6) {
      goto LABEL_15;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0 {
         || (int v7 = [v4 conformsToProtocol:&unk_1F208B728] ^ 1, !v6))
  }
  {
LABEL_15:
    if (v4)
    {
      char v17 = +[PKTextInputElementsFinder shouldDisableInputAssistantForTextInput:]((uint64_t)PKTextInputElementsFinder, v4);
LABEL_22:
      BOOL v16 = v17;
      goto LABEL_23;
    }
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_23;
  }
  if (v7) {
    goto LABEL_15;
  }
  v14 = [v4 _responderWindow];
  v15 = +[PKToolPicker activeToolPickerForWindow:v14];

  BOOL v16 = -[PKTextInputKeyboardSuppressionPolicyDelegate _shouldSuppressKeyboardUIForDelegate:checkSource:](self, "_shouldSuppressKeyboardUIForDelegate:checkSource:", v4, [v15 _isHandwritingToolSelected] ^ 1);
LABEL_23:

  return v16;
}

- (BOOL)isSupportedForTextInputTraits:(id)a3
{
  return !+[PKTextInputUtilities textInputTraitsAreSecure:a3];
}

- (BOOL)_shouldSuppressKeyboardUIForDelegate:(id)a3 checkSource:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(PKTextInputKeyboardSuppressionPolicyDelegate *)self _recognitionLocaleIdentifier];

  if (!v7) {
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v8 = [v6 _textInputSource] == 3;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!v4) {
      goto LABEL_8;
    }
  }
  if (!v8)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_12;
  }
LABEL_8:
  id v16 = 0;
  BOOL v10 = +[PKTextInputUtilities isResponderSupportedTextInput:v6 outTextInputTraits:&v16];
  id v11 = v16;
  id v12 = [v11 textContentType];
  if (v12)
  {
    uint64_t v13 = [v11 textContentType];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4FB2F70]] ^ 1;
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  BOOL v9 = v10 & v14;
LABEL_12:

  return v9;
}

- (BOOL)_suppressLocaleIdentifier
{
  return self->_suppressLocaleIdentifier;
}

- (void)set_suppressLocaleIdentifier:(BOOL)a3
{
  self->_suppressLocaleIdentifier = a3;
}

- (BOOL)isFloatingKeyboardVisible
{
  return self->isFloatingKeyboardVisible;
}

- (void)setIsFloatingKeyboardVisible:(BOOL)a3
{
  self->isFloatingKeyboardVisible = a3;
}

@end