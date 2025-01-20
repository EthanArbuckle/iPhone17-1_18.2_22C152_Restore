@interface AXUIScrollSpeedSlider
- (id)newControl;
@end

@implementation AXUIScrollSpeedSlider

- (id)newControl
{
  v2 = [AXUIScrollSpeedTableCellTickSlider alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;

  return -[AXUIScrollSpeedTableCellTickSlider initWithFrame:](v2, "initWithFrame:", CGRectZero.origin.x, y, width, height);
}

@end