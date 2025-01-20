@interface SFCreditCardSeparator
+ (NSString)reuseIdentifier;
- (SFCreditCardSeparator)initWithFrame:(CGRect)a3;
@end

@implementation SFCreditCardSeparator

+ (NSString)reuseIdentifier
{
  return (NSString *)@"CreditCardSeparator";
}

- (SFCreditCardSeparator)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFCreditCardSeparator;
  v3 = -[SFCreditCardSeparator initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(SFCreditCardSeparator *)v3 setBackgroundColor:v4];

    v5 = v3;
  }

  return v3;
}

@end