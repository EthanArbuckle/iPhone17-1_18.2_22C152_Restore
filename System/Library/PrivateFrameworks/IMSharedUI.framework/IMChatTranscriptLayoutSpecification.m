@interface IMChatTranscriptLayoutSpecification
- (BOOL)isEqual:(id)a3;
- (CGSize)layoutBoundsSize;
- (double)bottomMargin;
- (double)largeVerticalItemSpacing;
- (double)leadingMargin;
- (double)maximumBubbleWidth;
- (double)mediumVerticalItemSpacing;
- (double)smallVerticalItemSpacing;
- (double)topMargin;
- (double)trailingMargin;
- (double)zeroVerticalItemSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setBottomMargin:(double)a3;
- (void)setLargeVerticalItemSpacing:(double)a3;
- (void)setLayoutBoundsSize:(CGSize)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setMaximumBubbleWidth:(double)a3;
- (void)setMediumVerticalItemSpacing:(double)a3;
- (void)setSmallVerticalItemSpacing:(double)a3;
- (void)setTopMargin:(double)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setZeroVerticalItemSpacing:(double)a3;
@end

@implementation IMChatTranscriptLayoutSpecification

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p, layoutBoundsSize: {%.1f, %.1f}", v4, self, *(void *)&self->_layoutBoundsSize.width, *(void *)&self->_layoutBoundsSize.height);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (IMChatTranscriptLayoutSpecification *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_layoutBoundsSize.width == v5[10] && self->_layoutBoundsSize.height == v5[11];
      BOOL v7 = v6
        && self->_maximumBubbleWidth == v5[1]
        && self->_topMargin == v5[2]
        && self->_bottomMargin == v5[3]
        && self->_leadingMargin == v5[4]
        && self->_trailingMargin == v5[5]
        && self->_smallVerticalItemSpacing == v5[7]
        && self->_mediumVerticalItemSpacing == v5[8]
        && self->_largeVerticalItemSpacing == v5[9]
        && self->_zeroVerticalItemSpacing == v5[6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t height = (unint64_t)self->_layoutBoundsSize.height;
  if (height <= 1) {
    unint64_t height = 1;
  }
  v3 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, (unint64_t)self->_layoutBoundsSize.width % height);
  unint64_t v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(IMChatTranscriptLayoutSpecification);
  *((void *)result + 1) = *(void *)&self->_maximumBubbleWidth;
  *((_OWORD *)result + 5) = self->_layoutBoundsSize;
  *((void *)result + 2) = *(void *)&self->_topMargin;
  *((void *)result + 3) = *(void *)&self->_bottomMargin;
  *((void *)result + 4) = *(void *)&self->_leadingMargin;
  *((void *)result + 5) = *(void *)&self->_trailingMargin;
  *((void *)result + 7) = *(void *)&self->_smallVerticalItemSpacing;
  *((void *)result + 8) = *(void *)&self->_mediumVerticalItemSpacing;
  *((void *)result + 9) = *(void *)&self->_largeVerticalItemSpacing;
  *((void *)result + 6) = *(void *)&self->_zeroVerticalItemSpacing;
  return result;
}

- (CGSize)layoutBoundsSize
{
  double width = self->_layoutBoundsSize.width;
  double height = self->_layoutBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLayoutBoundsSize:(CGSize)a3
{
  self->_layoutBoundsSize = a3;
}

- (double)maximumBubbleWidth
{
  return self->_maximumBubbleWidth;
}

- (void)setMaximumBubbleWidth:(double)a3
{
  self->_maximumBubbleWidth = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (double)zeroVerticalItemSpacing
{
  return self->_zeroVerticalItemSpacing;
}

- (void)setZeroVerticalItemSpacing:(double)a3
{
  self->_zeroVerticalItemSpacing = a3;
}

- (double)smallVerticalItemSpacing
{
  return self->_smallVerticalItemSpacing;
}

- (void)setSmallVerticalItemSpacing:(double)a3
{
  self->_smallVerticalItemSpacing = a3;
}

- (double)mediumVerticalItemSpacing
{
  return self->_mediumVerticalItemSpacing;
}

- (void)setMediumVerticalItemSpacing:(double)a3
{
  self->_mediumVerticalItemSpacing = a3;
}

- (double)largeVerticalItemSpacing
{
  return self->_largeVerticalItemSpacing;
}

- (void)setLargeVerticalItemSpacing:(double)a3
{
  self->_largeVerticalItemSpacing = a3;
}

@end