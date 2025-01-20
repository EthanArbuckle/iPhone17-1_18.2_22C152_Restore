@interface CHUISControlToggleViewModel
- (BOOL)hasError;
- (BOOL)isDisabled;
- (BOOL)isRedacted;
- (BOOL)state;
- (CHUISControlIconView)iconView;
- (CHUISControlToggleOption)offOption;
- (CHUISControlToggleOption)onOption;
- (CHUISControlToggleViewModel)initWithIconView:(id)a3;
- (NSString)accessibilityIdentifier;
- (NSString)currentValue;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)currentTint;
- (UIImage)icon;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setCurrentTint:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconView:(id)a3;
- (void)setOffOption:(id)a3;
- (void)setOnOption:(id)a3;
- (void)setRedacted:(BOOL)a3;
- (void)setState:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CHUISControlToggleViewModel

- (CHUISControlToggleViewModel)initWithIconView:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHUISControlToggleViewModel;
  v6 = [(CHUISControlToggleViewModel *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    objc_storeStrong((id *)&v6->_iconView, a3);
    v8 = objc_alloc_init(CHUISControlToggleOption);
    onOption = v7->_onOption;
    v7->_onOption = v8;

    v10 = objc_alloc_init(CHUISControlToggleOption);
    offOption = v7->_offOption;
    v7->_offOption = v10;
  }
  return v7;
}

- (BOOL)state
{
  return self->_state;
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
}

- (UIColor)currentTint
{
  return self->_currentTint;
}

- (void)setCurrentTint:(id)a3
{
}

- (CHUISControlToggleOption)onOption
{
  return self->_onOption;
}

- (void)setOnOption:(id)a3
{
}

- (CHUISControlToggleOption)offOption
{
  return self->_offOption;
}

- (void)setOffOption:(id)a3
{
}

- (BOOL)isRedacted
{
  return self->_redacted;
}

- (void)setRedacted:(BOOL)a3
{
  self->_redacted = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (CHUISControlIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_offOption, 0);
  objc_storeStrong((id *)&self->_onOption, 0);
  objc_storeStrong((id *)&self->_currentTint, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end