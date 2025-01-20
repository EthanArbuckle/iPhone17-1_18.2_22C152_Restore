@interface CRUAlertCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CRUAlertCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRUAlertCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"CRImageAlertKey", v7.receiver, v7.super_class);

  v6 = [(PSTableCell *)self valueLabel];
  [v6 setAttributedText:v5];
}

@end