@interface HKGraphViewRendererVirtualMarginConfiguration
- (HKGraphViewRendererVirtualMarginConfiguration)initWithVirtualLeftMarginWidth:(double)a3 virtualRightMarginWidth:(double)a4 virtualLeftMarginStyle:(int64_t)a5 virtualRightMarginStyle:(int64_t)a6;
- (double)virtualLeftMarginWidth;
- (double)virtualRightMarginWidth;
- (int64_t)virtualLeftMarginStyle;
- (int64_t)virtualRightMarginStyle;
@end

@implementation HKGraphViewRendererVirtualMarginConfiguration

- (HKGraphViewRendererVirtualMarginConfiguration)initWithVirtualLeftMarginWidth:(double)a3 virtualRightMarginWidth:(double)a4 virtualLeftMarginStyle:(int64_t)a5 virtualRightMarginStyle:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HKGraphViewRendererVirtualMarginConfiguration;
  result = [(HKGraphViewRendererVirtualMarginConfiguration *)&v11 init];
  if (result)
  {
    result->_virtualLeftMarginWidth = a3;
    result->_virtualRightMarginWidth = a4;
    result->_virtualLeftMarginStyle = a5;
    result->_virtualRightMarginStyle = a6;
  }
  return result;
}

- (double)virtualLeftMarginWidth
{
  return self->_virtualLeftMarginWidth;
}

- (double)virtualRightMarginWidth
{
  return self->_virtualRightMarginWidth;
}

- (int64_t)virtualLeftMarginStyle
{
  return self->_virtualLeftMarginStyle;
}

- (int64_t)virtualRightMarginStyle
{
  return self->_virtualRightMarginStyle;
}

@end