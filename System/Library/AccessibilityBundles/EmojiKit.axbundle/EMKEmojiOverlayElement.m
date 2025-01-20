@interface EMKEmojiOverlayElement
- (_NSRange)rowRange;
- (unint64_t)accessibilityTraits;
- (void)setRowRange:(_NSRange)a3;
@end

@implementation EMKEmojiOverlayElement

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (_NSRange)rowRange
{
  p_rowRange = &self->_rowRange;
  NSUInteger location = self->_rowRange.location;
  NSUInteger length = p_rowRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRowRange:(_NSRange)a3
{
  self->_rowRange = a3;
}

@end