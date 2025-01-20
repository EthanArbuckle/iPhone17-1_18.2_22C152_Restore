@interface _CPUITopAlignedLabel
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation _CPUITopAlignedLabel

- (void)drawTextInRect:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CPUITopAlignedLabel;
  -[_CPUITopAlignedLabel textRectForBounds:limitedToNumberOfLines:](&v5, sel_textRectForBounds_limitedToNumberOfLines_, [(_CPUITopAlignedLabel *)self numberOfLines], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4.receiver = self;
  v4.super_class = (Class)_CPUITopAlignedLabel;
  -[_CPUITopAlignedLabel drawTextInRect:](&v4, sel_drawTextInRect_);
}

@end