@interface AAUISpyglassSpecifierRowModel
- (NSString)iconName;
- (NSString)title;
- (id)initForSpecifierType:(int64_t)a3;
- (void)setIconName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAUISpyglassSpecifierRowModel

- (id)initForSpecifierType:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)AAUISpyglassSpecifierRowModel;
  v4 = [(AAUISpyglassSpecifierRowModel *)&v20 init];
  if (v4)
  {
    switch(a3)
    {
      case 1:
        v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v6 = [v5 localizedStringForKey:@"SPYGLASS_SPECIFIER_PERSONAL_INFORMATION" value:&stru_26BD39CD8 table:@"Localizable"];
        title = v4->_title;
        v4->_title = (NSString *)v6;

        iconName = v4->_iconName;
        v9 = @"person.text.rectangle.fill";
        goto LABEL_7;
      case 2:
        v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v11 = [v10 localizedStringForKey:@"SPYGLASS_SPECIFIER_SIGNIN_AND_SECURITY" value:&stru_26BD39CD8 table:@"Localizable"];
        v12 = v4->_title;
        v4->_title = (NSString *)v11;

        iconName = v4->_iconName;
        v9 = @"custom.key.fill.shield.fill";
        goto LABEL_7;
      case 3:
        v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v14 = [v13 localizedStringForKey:@"SPYGLASS_SPECIFIER_PAYMENT_AND_SHIPPING" value:&stru_26BD39CD8 table:@"Localizable"];
        v15 = v4->_title;
        v4->_title = (NSString *)v14;

        iconName = v4->_iconName;
        v9 = @"creditcard.fill";
        goto LABEL_7;
      case 4:
        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v17 = [v16 localizedStringForKey:@"SPYGLASS_SPECIFIER_SUBSCRIPTIONS" value:&stru_26BD39CD8 table:@"Localizable"];
        v18 = v4->_title;
        v4->_title = (NSString *)v17;

        iconName = v4->_iconName;
        v9 = @"goforward.plus";
LABEL_7:
        v4->_iconName = &v9->isa;

        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end