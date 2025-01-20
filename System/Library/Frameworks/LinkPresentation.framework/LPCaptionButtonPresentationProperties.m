@interface LPCaptionButtonPresentationProperties
- (BOOL)disabled;
- (LPCaptionButtonCollapsedPresentationProperties)collapsedButton;
- (LPImage)icon;
- (NSArray)actions;
- (NSAttributedString)attributedText;
- (NSNumber)requiresInlineButton;
- (NSString)text;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (double)minimumWidth;
- (id)callback;
- (int64_t)shape;
- (int64_t)type;
- (void)setActions:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCallback:(id)a3;
- (void)setCollapsedButton:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMinimumWidth:(double)a3;
- (void)setRequiresInlineButton:(id)a3;
- (void)setShape:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation LPCaptionButtonPresentationProperties

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)shape
{
  return self->_shape;
}

- (void)setShape:(int64_t)a3
{
  self->_shape = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (LPCaptionButtonCollapsedPresentationProperties)collapsedButton
{
  return self->_collapsedButton;
}

- (void)setCollapsedButton:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (double)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (NSNumber)requiresInlineButton
{
  return self->_requiresInlineButton;
}

- (void)setRequiresInlineButton:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiresInlineButton, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_collapsedButton, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end