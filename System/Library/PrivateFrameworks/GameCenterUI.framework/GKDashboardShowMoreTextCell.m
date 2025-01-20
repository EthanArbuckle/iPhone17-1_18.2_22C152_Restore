@interface GKDashboardShowMoreTextCell
+ (CGSize)defaultSize;
- (UILabel)label;
- (void)awakeFromNib;
- (void)setLabel:(id)a3;
@end

@implementation GKDashboardShowMoreTextCell

+ (CGSize)defaultSize
{
  double v2 = 42.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)awakeFromNib
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardShowMoreTextCell;
  [(GKRectShadowCell *)&v6 awakeFromNib];
  double v3 = GKGameCenterUIFrameworkBundle();
  v4 = GKGetLocalizedStringFromTableInBundle();
  v5 = [(GKDashboardShowMoreTextCell *)self label];
  [v5 setText:v4];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  self->_label = (UILabel *)a3;
}

@end