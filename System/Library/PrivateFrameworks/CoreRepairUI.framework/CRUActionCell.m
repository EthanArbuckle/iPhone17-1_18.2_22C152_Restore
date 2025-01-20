@interface CRUActionCell
- (void)handleTapOnLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CRUActionCell

- (void)handleTapOnLabel
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CRUActionCell;
  id v4 = a3;
  [(PSTableCell *)&v13 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"CRImageAlertKey", v13.receiver, v13.super_class);

  v6 = [(PSTableCell *)self valueLabel];
  [v6 setAttributedText:v5];

  v7 = [(PSTableCell *)self valueLabel];
  [v7 setUserInteractionEnabled:1];

  v8 = [(PSTableCell *)self valueLabel];
  v9 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTapOnLabel];
  [v8 addGestureRecognizer:v9];

  v10 = [(PSTableCell *)self titleLabel];
  [v10 setUserInteractionEnabled:1];

  v11 = [(PSTableCell *)self titleLabel];
  v12 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTapOnLabel];
  [v11 addGestureRecognizer:v12];
}

@end