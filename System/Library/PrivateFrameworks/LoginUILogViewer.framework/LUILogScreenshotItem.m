@interface LUILogScreenshotItem
- (NSDate)screenshotDate;
- (UIImage)screenshotImage;
- (_NSRange)visibleRange;
- (void)setScreenshotDate:(id)a3;
- (void)setScreenshotImage:(id)a3;
- (void)setVisibleRange:(_NSRange)a3;
@end

@implementation LUILogScreenshotItem

- (UIImage)screenshotImage
{
  return self->_screenshotImage;
}

- (void)setScreenshotImage:(id)a3
{
}

- (_NSRange)visibleRange
{
  NSUInteger length = self->_visibleRange.length;
  NSUInteger location = self->_visibleRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  self->_visibleRange = a3;
}

- (NSDate)screenshotDate
{
  return self->_screenshotDate;
}

- (void)setScreenshotDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotDate, 0);

  objc_storeStrong((id *)&self->_screenshotImage, 0);
}

@end