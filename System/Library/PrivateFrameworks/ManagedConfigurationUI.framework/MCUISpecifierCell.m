@interface MCUISpecifierCell
+ (int64_t)cellStyle;
- (id)_scriptingInfo;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation MCUISpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MCUISpecifierCell;
  id v4 = a3;
  [(PSTableCell *)&v12 refreshCellContentsWithSpecifier:v4];
  v5 = [(MCUISpecifierCell *)self textLabel];
  v6 = [v4 propertyForKey:*MEMORY[0x1E4F93240]];
  [v5 setText:v6];

  v7 = [(MCUISpecifierCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:*MEMORY[0x1E4F93230]];
  [v7 setText:v8];

  v9 = [v4 propertyForKey:@"MCUIPSExpiredKey"];

  if (v9 && [v9 BOOLValue])
  {
    v10 = [MEMORY[0x1E4F428B8] systemRedColor];
    v11 = [(MCUISpecifierCell *)self textLabel];
    [v11 setTextColor:v10];
  }
}

- (id)_scriptingInfo
{
  v9.receiver = self;
  v9.super_class = (Class)MCUISpecifierCell;
  v3 = [(MCUISpecifierCell *)&v9 _scriptingInfo];
  id v4 = [(MCUISpecifierCell *)self textLabel];
  v5 = [v4 text];

  if (v5)
  {
    v6 = [(MCUISpecifierCell *)self textLabel];
    v7 = [v6 text];
    [v3 setObject:v7 forKey:@"ID"];
  }
  return v3;
}

@end