@interface AKAuthorizationUseDifferentIDButton
- (AKAuthorizationUseDifferentIDButton)initWithCoder:(id)a3;
- (AKAuthorizationUseDifferentIDButton)initWithFrame:(CGRect)a3;
@end

@implementation AKAuthorizationUseDifferentIDButton

- (AKAuthorizationUseDifferentIDButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationUseDifferentIDButton;
  v3 = -[AKAuthorizationUseDifferentIDButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationUseDifferentIDButton;
    [(AKAuthorizationButton *)&v7 setupButton];
    v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(AKAuthorizationUseDifferentIDButton *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (AKAuthorizationUseDifferentIDButton)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationUseDifferentIDButton;
  v3 = [(AKAuthorizationUseDifferentIDButton *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationUseDifferentIDButton;
    [(AKAuthorizationButton *)&v7 setupButton];
    v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(AKAuthorizationUseDifferentIDButton *)v4 setBackgroundColor:v5];
  }
  return v4;
}

@end