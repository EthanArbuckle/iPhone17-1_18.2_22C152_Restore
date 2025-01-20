@interface ASCredentialRequestButton
- (NSString)buttonText;
- (UILabel)titleLabel;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)setButtonText:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ASCredentialRequestButton

- (NSString)buttonText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setButtonText:(id)a3
{
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  [(ASCredentialRequestButton *)self removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  [(ASCredentialRequestButton *)self addTarget:v6 action:a4 forControlEvents:64];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end