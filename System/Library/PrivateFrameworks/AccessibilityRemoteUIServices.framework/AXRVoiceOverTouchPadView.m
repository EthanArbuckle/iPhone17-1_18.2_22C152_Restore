@interface AXRVoiceOverTouchPadView
- (AXRVoiceOverTouchPadViewDelegate)delegate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetCurrentGesture:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXRVoiceOverTouchPadView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)AXRLocalizedStringForKey();
}

- (id)accessibilityHint
{
  return (id)AXRLocalizedStringForKey();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F21A10] | *MEMORY[0x263F1CF50];
}

- (void)_accessibilitySetCurrentGesture:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v6 count] >= 3)
  {
    v4 = [v6 objectAtIndex:2];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
    {
      v5 = [(AXRVoiceOverTouchPadView *)self delegate];
      [v5 voiceOverTouchPadView:self didReceiveCommand:v4];
    }
  }
}

- (AXRVoiceOverTouchPadViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXRVoiceOverTouchPadViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end