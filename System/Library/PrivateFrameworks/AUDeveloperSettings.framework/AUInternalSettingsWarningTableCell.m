@interface AUInternalSettingsWarningTableCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AUInternalSettingsWarningTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AUInternalSettingsWarningTableCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "name", v7.receiver, v7.super_class);

  [(PSTableCell *)self setTitle:v5];
  v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.circle.fill"];
  [(PSTableCell *)self setIcon:v6];
}

@end