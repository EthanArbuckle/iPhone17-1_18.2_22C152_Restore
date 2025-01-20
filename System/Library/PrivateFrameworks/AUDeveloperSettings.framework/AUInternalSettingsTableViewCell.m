@interface AUInternalSettingsTableViewCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation AUInternalSettingsTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AUInternalSettingsTableViewCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F602D0], v7.receiver, v7.super_class);

  [(PSTableCell *)self setTitle:v5];
  v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark"];
  [(PSTableCell *)self setIcon:v6];

  [(AUInternalSettingsTableViewCell *)self setAccessoryType:4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v5 = [(PSTableCell *)self iconImageView];
  [v5 setHidden:!v4];
}

@end