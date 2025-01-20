@interface AXSpeechRateSliderTableCell
- (id)newControl;
@end

@implementation AXSpeechRateSliderTableCell

- (id)newControl
{
  v2 = [AXSpeechRateSliderTableCellTickSlider alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;

  return -[AXSpeechRateSliderTableCellTickSlider initWithFrame:](v2, "initWithFrame:", CGRectZero.origin.x, y, width, height);
}

@end