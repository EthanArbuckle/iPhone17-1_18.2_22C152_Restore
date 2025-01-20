@interface CameraSettingsDetailedTableCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CameraSettingsDetailedTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CameraSettingsDetailedTableCell;
  id v4 = a3;
  [(CameraSettingsDetailedTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"CameraSettingsDetailTableCellTextKey", v7.receiver, v7.super_class);

  v6 = [(CameraSettingsDetailedTableCell *)self detailTextLabel];
  [v6 setText:v5];

  [(CameraSettingsDetailedTableCell *)self setNeedsLayout];
}

@end