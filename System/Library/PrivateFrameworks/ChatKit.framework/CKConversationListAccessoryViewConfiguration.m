@interface CKConversationListAccessoryViewConfiguration
- (UIBlurEffect)blurEffect;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)vibrancyStyle;
- (void)setBackgroundColor:(id)a3;
- (void)setBlurEffect:(id)a3;
- (void)setImage:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setVibrancyStyle:(int64_t)a3;
@end

@implementation CKConversationListAccessoryViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CKConversationListAccessoryViewConfiguration allocWithZone:a3] init];
  [(CKConversationListAccessoryViewConfiguration *)v4 setVibrancyStyle:[(CKConversationListAccessoryViewConfiguration *)self vibrancyStyle]];
  v5 = [(CKConversationListAccessoryViewConfiguration *)self blurEffect];
  [(CKConversationListAccessoryViewConfiguration *)v4 setBlurEffect:v5];

  v6 = [(CKConversationListAccessoryViewConfiguration *)self image];
  [(CKConversationListAccessoryViewConfiguration *)v4 setImage:v6];

  v7 = [(CKConversationListAccessoryViewConfiguration *)self backgroundColor];
  [(CKConversationListAccessoryViewConfiguration *)v4 setBackgroundColor:v7];

  v8 = [(CKConversationListAccessoryViewConfiguration *)self tintColor];
  [(CKConversationListAccessoryViewConfiguration *)v4 setTintColor:v8];

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
}

- (int64_t)vibrancyStyle
{
  return self->_vibrancyStyle;
}

- (void)setVibrancyStyle:(int64_t)a3
{
  self->_vibrancyStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end