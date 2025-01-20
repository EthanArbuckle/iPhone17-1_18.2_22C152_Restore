@interface KSFuzzyPinyinPairTableCell
+ (int64_t)cellStyle;
- (KSFuzzyPinyinPairTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation KSFuzzyPinyinPairTableCell

+ (int64_t)cellStyle
{
  return 0;
}

- (KSFuzzyPinyinPairTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)KSFuzzyPinyinPairTableCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4);
  if (v6) {
    -[PSTableCell setChecked:](v6, "setChecked:", objc_msgSend((id)objc_msgSend(a5, "propertyForKey:", *MEMORY[0x263F60308]), "BOOLValue"));
  }
  return v6;
}

@end