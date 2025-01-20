@interface BKSettingsSpinnerCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation BKSettingsSpinnerCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSettingsSpinnerCell;
  [(BKSettingsSpinnerCell *)&v5 refreshCellContentsWithSpecifier:a3];
  v4 = +[UIColor clearColor];
  [(BKSettingsSpinnerCell *)self setBackgroundColor:v4];

  [(BKSettingsSpinnerCell *)self setNeedsLayout];
}

@end