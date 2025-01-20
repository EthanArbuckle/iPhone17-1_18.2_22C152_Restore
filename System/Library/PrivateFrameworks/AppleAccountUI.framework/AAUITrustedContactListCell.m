@interface AAUITrustedContactListCell
+ (id)specifierForContact:(id)a3 loadAction:(SEL)a4 target:(id)a5;
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AAUITrustedContactListCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AAUITrustedContactListCell;
  [(PSTableCell *)&v20 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"contactGrayed"];
  int v6 = [v5 BOOLValue];

  v7 = [(AAUITrustedContactListCell *)self textLabel];
  if (v6) {
    [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  else {
  v8 = [MEMORY[0x263F825C8] labelColor];
  }
  [v7 setTextColor:v8];

  v9 = [(AAUITrustedContactListCell *)self textLabel];
  v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v9 setFont:v10];

  v11 = [(AAUITrustedContactListCell *)self textLabel];
  v12 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v11 setText:v12];

  v13 = [(AAUITrustedContactListCell *)self detailTextLabel];
  v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v13 setFont:v14];

  v15 = [(AAUITrustedContactListCell *)self detailTextLabel];
  v16 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v15 setTextColor:v16];

  v17 = [(AAUITrustedContactListCell *)self detailTextLabel];
  v18 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
  [v17 setText:v18];

  v19 = [(AAUITrustedContactListCell *)self imageView];
  [v19 setContentMode:1];

  [(AAUITrustedContactListCell *)self setNeedsLayout];
}

+ (id)specifierForContact:(id)a3 loadAction:(SEL)a4 target:(id)a5
{
  v7 = (void *)MEMORY[0x263F5FC40];
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 displayName];
  v11 = [v7 preferenceSpecifierNamed:v10 target:v8 set:0 get:0 detail:0 cell:2 edit:0];

  v12 = [v9 displayName];
  [v11 setProperty:v12 forKey:*MEMORY[0x263F602D0]];

  v13 = [v9 detailsText];
  [v11 setProperty:v13 forKey:*MEMORY[0x263F602C8]];

  [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v14 = +[AAUITrustedContactsImageProvider imageForLocalContact:v9];
  [v11 setProperty:v14 forKey:*MEMORY[0x263F60140]];

  [v11 setControllerLoadAction:a4];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "shouldGrayOutContactRow"));
  [v11 setProperty:v15 forKey:@"contactGrayed"];

  v16 = NSNumber;
  v17 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);
  double v19 = *MEMORY[0x263F839B8];
  if (!IsAccessibilityCategory) {
    double v19 = 60.0;
  }
  objc_super v20 = [v16 numberWithDouble:v19];
  [v11 setProperty:v20 forKey:*MEMORY[0x263F602A8]];

  [v11 setUserInfo:v9];
  return v11;
}

@end