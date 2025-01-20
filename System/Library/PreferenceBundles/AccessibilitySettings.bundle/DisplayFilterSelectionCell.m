@interface DisplayFilterSelectionCell
+ (int64_t)cellStyle;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DisplayFilterSelectionCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(DisplayFilterSelectionCell *)self textLabel];
  [v5 setText:v4];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(DisplayFilterSelectionCell *)self detailTextLabel];
  [v5 setText:v4];
}

@end