@interface UIButton(ABUIAdditions)
- (id)ab_text;
- (id)ab_textAttributes;
- (void)setAb_text:()ABUIAdditions;
- (void)setAb_textAttributes:()ABUIAdditions;
@end

@implementation UIButton(ABUIAdditions)

- (void)setAb_textAttributes:()ABUIAdditions
{
  id v4 = a3;
  id v5 = [a1 titleLabel];
  objc_msgSend(v5, "setAb_textAttributes:", v4);
}

- (id)ab_textAttributes
{
  v1 = [a1 titleLabel];
  v2 = objc_msgSend(v1, "ab_textAttributes");

  return v2;
}

- (void)setAb_text:()ABUIAdditions
{
  id v4 = a3;
  id v5 = [a1 titleLabel];
  [v5 setText:v4];
}

- (id)ab_text
{
  v1 = [a1 titleLabel];
  v2 = [v1 text];

  return v2;
}

@end