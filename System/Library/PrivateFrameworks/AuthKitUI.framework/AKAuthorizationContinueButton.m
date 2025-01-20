@interface AKAuthorizationContinueButton
- (AKAuthorizationContinueButton)initWithCoder:(id)a3;
- (AKAuthorizationContinueButton)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AKAuthorizationContinueButton

- (AKAuthorizationContinueButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContinueButton;
  v3 = -[AKAuthorizationContinueButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationContinueButton;
    [(AKAuthorizationButton *)&v7 setupButton];
    v5 = +[AKAuthorizationAppearance continueButtonDefaultColor];
    [(AKAuthorizationContinueButton *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (AKAuthorizationContinueButton)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContinueButton;
  v3 = [(AKAuthorizationContinueButton *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationContinueButton;
    [(AKAuthorizationButton *)&v7 setupButton];
    v5 = +[AKAuthorizationAppearance continueButtonDefaultColor];
    [(AKAuthorizationContinueButton *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AKAuthorizationContinueButton *)self isHighlighted] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AKAuthorizationContinueButton;
    [(AKAuthorizationContinueButton *)&v6 setHighlighted:v3];
    if (v3) {
      +[AKAuthorizationAppearance continueButtonHighlightedColor];
    }
    else {
    v5 = +[AKAuthorizationAppearance continueButtonDefaultColor];
    }
    [(AKAuthorizationContinueButton *)self setBackgroundColor:v5];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AKAuthorizationContinueButton *)self isEnabled] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AKAuthorizationContinueButton;
    [(AKAuthorizationContinueButton *)&v6 setEnabled:v3];
    if (v3) {
      +[AKAuthorizationAppearance continueButtonDefaultColor];
    }
    else {
    v5 = +[AKAuthorizationAppearance continueButtonDisabledColor];
    }
    [(AKAuthorizationContinueButton *)self setBackgroundColor:v5];
  }
}

@end