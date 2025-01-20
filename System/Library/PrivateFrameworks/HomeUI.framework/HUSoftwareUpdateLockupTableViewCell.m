@interface HUSoftwareUpdateLockupTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (Class)lockupViewClass;
@end

@implementation HUSoftwareUpdateLockupTableViewCell

- (Class)lockupViewClass
{
  return (Class)objc_opt_class();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v10 = [(HULockupTableViewCell *)self lockupView];
  [v10 layoutIfNeeded];

  v15.receiver = self;
  v15.super_class = (Class)HUSoftwareUpdateLockupTableViewCell;
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  -[HUSoftwareUpdateLockupTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v15, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  result.double height = v14;
  result.double width = v13;
  return result;
}

@end