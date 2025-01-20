@interface MKImageTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (MKImageTextAttachment)initWithImage:(id)a3 verticalOffset:(double)a4;
- (double)maxHeight;
- (double)verticalOffset;
- (void)setMaxHeight:(double)a3;
- (void)setVerticalOffset:(double)a3;
@end

@implementation MKImageTextAttachment

- (MKImageTextAttachment)initWithImage:(id)a3 verticalOffset:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKImageTextAttachment;
  v7 = [(MKImageTextAttachment *)&v10 initWithData:0 ofType:0];
  v8 = v7;
  if (v7)
  {
    v7->_verticalOffset = a4;
    [(MKImageTextAttachment *)v7 setImage:v6];
  }

  return v8;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  v7 = [(MKImageTextAttachment *)self image];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  [(MKImageTextAttachment *)self maxHeight];
  if (v12 > 0.0)
  {
    [(MKImageTextAttachment *)self maxHeight];
    if (v13 < v11)
    {
      [(MKImageTextAttachment *)self maxHeight];
      double v9 = v9 / v11 * v14;
      double v11 = v14;
    }
  }
  double verticalOffset = self->_verticalOffset;
  double v16 = 0.0;
  double v17 = v9;
  double v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = verticalOffset;
  result.origin.x = v16;
  return result;
}

- (void)setVerticalOffset:(double)a3
{
  if (self->_verticalOffset != a3) {
    self->_double verticalOffset = a3;
  }
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

@end