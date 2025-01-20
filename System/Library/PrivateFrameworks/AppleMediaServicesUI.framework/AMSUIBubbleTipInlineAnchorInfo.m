@interface AMSUIBubbleTipInlineAnchorInfo
- (AMSUIBubbleTipInlineAnchorInfo)initWithArrowDirection:(unint64_t)a3 arrowOffset:(double)a4;
- (AMSUIBubbleTipInlineAnchorInfo)initWithArrowDirection:(unint64_t)a3 relativeArrowOffset:(double)a4;
- (double)arrowOffset;
- (double)relativeArrowOffset;
- (unint64_t)arrowDirection;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setArrowOffset:(double)a3;
- (void)setRelativeArrowOffset:(double)a3;
@end

@implementation AMSUIBubbleTipInlineAnchorInfo

- (AMSUIBubbleTipInlineAnchorInfo)initWithArrowDirection:(unint64_t)a3 arrowOffset:(double)a4
{
  result = [(AMSUIBubbleTipInlineAnchorInfo *)self init];
  if (result)
  {
    result->_arrowDirection = a3;
    result->_arrowOffset = a4;
    result->_relativeArrowOffset = 2.22507386e-308;
  }
  return result;
}

- (AMSUIBubbleTipInlineAnchorInfo)initWithArrowDirection:(unint64_t)a3 relativeArrowOffset:(double)a4
{
  result = [(AMSUIBubbleTipInlineAnchorInfo *)self init];
  if (result)
  {
    result->_arrowDirection = a3;
    result->_arrowOffset = 2.22507386e-308;
    result->_relativeArrowOffset = a4;
  }
  return result;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirection = a3;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (void)setArrowOffset:(double)a3
{
  self->_arrowOffset = a3;
}

- (double)relativeArrowOffset
{
  return self->_relativeArrowOffset;
}

- (void)setRelativeArrowOffset:(double)a3
{
  self->_relativeArrowOffset = a3;
}

@end