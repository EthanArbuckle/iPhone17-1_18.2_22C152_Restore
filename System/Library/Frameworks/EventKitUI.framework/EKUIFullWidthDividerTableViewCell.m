@interface EKUIFullWidthDividerTableViewCell
- (CGRect)_separatorFrame;
@end

@implementation EKUIFullWidthDividerTableViewCell

- (CGRect)_separatorFrame
{
  v11.receiver = self;
  v11.super_class = (Class)EKUIFullWidthDividerTableViewCell;
  [(EKUIFullWidthDividerTableViewCell *)&v11 _separatorFrame];
  double v4 = v3;
  double v6 = v5;
  [(EKUIFullWidthDividerTableViewCell *)self bounds];
  double v8 = 0.0;
  double v9 = v4;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end