@interface CARSettingsCellSpecifierSection
- (BOOL)hasEqualFooter:(id)a3;
- (BOOL)hasEqualHeader:(id)a3;
- (BOOL)hasEqualSpecifiers:(id)a3;
- (BOOL)isEqualToSpecifierSection:(id)a3;
- (CARSettingsCellSpecifierSection)initWithFooter:(id)a3 specifiers:(id)a4;
- (CARSettingsCellSpecifierSection)initWithSpecifiers:(id)a3;
- (CARSettingsCellSpecifierSection)initWithTitle:(id)a3 footer:(id)a4 specifiers:(id)a5;
- (CARSettingsCellSpecifierSection)initWithTitle:(id)a3 specifiers:(id)a4;
- (NSArray)specifiers;
- (NSString)footer;
- (NSString)title;
@end

@implementation CARSettingsCellSpecifierSection

- (CARSettingsCellSpecifierSection)initWithTitle:(id)a3 specifiers:(id)a4
{
  return [(CARSettingsCellSpecifierSection *)self initWithTitle:a3 footer:0 specifiers:a4];
}

- (CARSettingsCellSpecifierSection)initWithFooter:(id)a3 specifiers:(id)a4
{
  return [(CARSettingsCellSpecifierSection *)self initWithTitle:0 footer:a3 specifiers:a4];
}

- (CARSettingsCellSpecifierSection)initWithSpecifiers:(id)a3
{
  return [(CARSettingsCellSpecifierSection *)self initWithTitle:0 footer:0 specifiers:a3];
}

- (CARSettingsCellSpecifierSection)initWithTitle:(id)a3 footer:(id)a4 specifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CARSettingsCellSpecifierSection;
  v11 = [(CARSettingsCellSpecifierSection *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    title = v11->_title;
    v11->_title = v12;

    v14 = (NSString *)[v9 copy];
    footer = v11->_footer;
    v11->_footer = v14;

    objc_storeStrong((id *)&v11->_specifiers, a5);
  }

  return v11;
}

- (BOOL)isEqualToSpecifierSection:(id)a3
{
  id v4 = a3;
  if ([(CARSettingsCellSpecifierSection *)self hasEqualSpecifiers:v4]
    && [(CARSettingsCellSpecifierSection *)self hasEqualHeader:v4])
  {
    BOOL v5 = [(CARSettingsCellSpecifierSection *)self hasEqualFooter:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasEqualSpecifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CARSettingsCellSpecifierSection *)self specifiers];
  v6 = [v4 specifiers];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

- (BOOL)hasEqualHeader:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CARSettingsCellSpecifierSection *)self title];
  v6 = [v4 title];

  LOBYTE(v4) = BSEqualStrings();
  return (char)v4;
}

- (BOOL)hasEqualFooter:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CARSettingsCellSpecifierSection *)self footer];
  v6 = [v4 footer];

  LOBYTE(v4) = BSEqualStrings();
  return (char)v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)footer
{
  return self->_footer;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_footer, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end