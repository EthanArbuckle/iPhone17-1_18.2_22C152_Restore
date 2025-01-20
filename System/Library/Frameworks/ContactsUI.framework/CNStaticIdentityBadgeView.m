@interface CNStaticIdentityBadgeView
+ (id)sealLockImage;
- (CNStaticIdentityBadgeView)init;
@end

@implementation CNStaticIdentityBadgeView

- (CNStaticIdentityBadgeView)init
{
  v14.receiver = self;
  v14.super_class = (Class)CNStaticIdentityBadgeView;
  v2 = [(CNStaticIdentityBadgeView *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    v4 = +[CNStaticIdentityBadgeView sealLockImage];
    v5 = (void *)[v3 initWithImage:v4];

    LODWORD(v6) = 1111752704;
    [v5 setContentCompressionResistancePriority:1 forAxis:v6];
    [v5 setContentMode:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v8 = CNContactsUIBundle();
    v9 = [v8 localizedStringForKey:@"STATIC_IDENTITY_BADGE_TEXT" value:&stru_1ED8AC728 table:@"Localized-NARWHAL"];
    [v7 setText:v9];

    v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [v7 setFont:v10];

    v11 = +[CNUIColorRepository contactCardStaticIdentityBadgeGlyphColor];
    [v7 setTextColor:v11];

    [(CNStaticIdentityBadgeView *)v2 addArrangedSubview:v5];
    [(CNStaticIdentityBadgeView *)v2 addArrangedSubview:v7];
    [(CNStaticIdentityBadgeView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNStaticIdentityBadgeView *)v2 setAxis:0];
    [(CNStaticIdentityBadgeView *)v2 setAlignment:5];
    [(CNStaticIdentityBadgeView *)v2 setDistribution:2];
    [(CNStaticIdentityBadgeView *)v2 setSpacing:0.0];
    v12 = v2;
  }
  return v2;
}

+ (id)sealLockImage
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB1830];
  id v3 = +[CNUIColorRepository contactCardStaticIdentityBadgeGlyphColor];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [v2 configurationWithPaletteColors:v4];

  double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill" withConfiguration:v5];

  return v6;
}

@end