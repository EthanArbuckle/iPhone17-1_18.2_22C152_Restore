@interface MFCenteredTextAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (double)height;
- (void)setHeight:(double)a3;
@end

@implementation MFCenteredTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  [(MFCenteredTextAttachment *)self height];
  double v8 = v7;
  v9 = [(MFCenteredTextAttachment *)self image];
  [v9 size];
  double v11 = v10;

  v12 = [(MFCenteredTextAttachment *)self image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  double v17 = 0.0;
  double v18 = v11 * -0.5 + v8 * 0.5;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end