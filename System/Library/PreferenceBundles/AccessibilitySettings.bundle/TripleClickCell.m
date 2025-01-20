@interface TripleClickCell
- (TripleClickCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (unint64_t)accessibilityTraits;
@end

@implementation TripleClickCell

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)TripleClickCell;
  unint64_t v3 = [(TripleClickCell *)&v10 accessibilityTraits];
  v4 = [(TripleClickCell *)self specifier];
  v5 = [v4 propertyForKey:@"AXChecked"];
  unsigned int v6 = [v5 BOOLValue];

  UIAccessibilityTraits v7 = UIAccessibilityTraitSelected;
  if (!v6) {
    UIAccessibilityTraits v7 = 0;
  }
  unint64_t v8 = v7 | v3;

  return v8;
}

- (TripleClickCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TripleClickCell;
  v5 = [(TripleClickCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  unsigned int v6 = v5;
  if (v5)
  {
    UIAccessibilityTraits v7 = [(TripleClickCell *)v5 titleLabel];
    [v7 setNumberOfLines:0];
  }
  return v6;
}

@end