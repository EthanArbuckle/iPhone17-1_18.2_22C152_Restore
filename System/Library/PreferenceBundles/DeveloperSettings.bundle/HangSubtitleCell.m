@interface HangSubtitleCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HangSubtitleCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HangSubtitleCell;
  [(HangSubtitleCell *)&v5 refreshCellContentsWithSpecifier:a3];
  v4 = [(HangSubtitleCell *)self textLabel];
  [v4 setLineBreakMode:5];
}

+ (int64_t)cellStyle
{
  return 3;
}

@end