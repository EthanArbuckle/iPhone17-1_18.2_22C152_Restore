@interface AUInternalSettingsInProgressTableCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AUInternalSettingsInProgressTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AUInternalSettingsInProgressTableCell;
  id v4 = a3;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "name", v9.receiver, v9.super_class);
  [(PSTableCell *)self setTitle:v5];

  v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.clockwise.circle"];
  [(PSTableCell *)self setIcon:v6];
  v7 = [v4 objectForKeyedSubscript:@"AUSettingsProgressActiveUpdate"];

  v8 = [(PSTableCell *)self iconImageView];
  objc_msgSend(v8, "setHidden:", objc_msgSend(v7, "BOOLValue") ^ 1);
}

@end