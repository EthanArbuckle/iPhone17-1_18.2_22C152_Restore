@interface MKEmptyTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)result glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (MKEmptyTextAttachment)initWithWidth:(double)a3;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
@end

@implementation MKEmptyTextAttachment

- (MKEmptyTextAttachment)initWithWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKEmptyTextAttachment;
  result = [(MKEmptyTextAttachment *)&v5 initWithData:0 ofType:0];
  if (result) {
    result->_width = a3;
  }
  return result;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)result glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double width = self->_width;
  double v7 = 0.0;
  double v8 = 0.0;
  result.size.double width = width;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

@end