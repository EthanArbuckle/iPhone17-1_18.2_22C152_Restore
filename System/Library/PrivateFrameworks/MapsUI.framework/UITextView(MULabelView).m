@interface UITextView(MULabelView)
- (double)_hyphenationFactor;
- (uint64_t)allowsDefaultTighteningForTruncation;
- (uint64_t)lineBreakMode;
- (uint64_t)numberOfLines;
- (void)setLineBreakMode:()MULabelView;
- (void)setNumberOfLines:()MULabelView;
@end

@implementation UITextView(MULabelView)

- (uint64_t)numberOfLines
{
  v1 = [a1 textContainer];
  uint64_t v2 = [v1 maximumNumberOfLines];

  return v2;
}

- (void)setNumberOfLines:()MULabelView
{
  id v4 = [a1 textContainer];
  [v4 setMaximumNumberOfLines:a3];
}

- (uint64_t)lineBreakMode
{
  v1 = [a1 textContainer];
  uint64_t v2 = [v1 lineBreakMode];

  return v2;
}

- (void)setLineBreakMode:()MULabelView
{
  id v4 = [a1 textContainer];
  [v4 setLineBreakMode:a3];
}

- (double)_hyphenationFactor
{
  return 0.0;
}

- (uint64_t)allowsDefaultTighteningForTruncation
{
  return 0;
}

@end