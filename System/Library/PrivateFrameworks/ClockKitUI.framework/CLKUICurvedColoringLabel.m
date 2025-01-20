@interface CLKUICurvedColoringLabel
- (BOOL)interior;
- (BOOL)isTextTruncated;
- (BOOL)textDefinesTruncation;
- (CGAffineTransform)transformForImage;
- (CGPoint)centerForImage;
- (CGRect)textBoundingRect;
- (CGSize)imageViewOverrideSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKUICurvedColoringLabel)initWithFrame:(CGRect)a3;
- (UIBezierPath)path;
- (UIView)imageView;
- (double)_firstLineBaseline;
- (double)_lastLineBaseline;
- (double)alpha;
- (double)baselineOffset;
- (double)centerAngle;
- (double)circleRadius;
- (double)imagePadding;
- (double)maxAngularWidth;
- (double)maxWidth;
- (id)attributedText;
- (id)font;
- (id)text;
- (id)textColor;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (unint64_t)imagePlacement;
- (void)_setAnimationAlpha:(double)a3;
- (void)_setUpSnapshot;
- (void)getTextCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5;
- (void)invalidateCachedSize;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setAttributedText:(id)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenterAngle:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImagePadding:(double)a3;
- (void)setImagePlacement:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageView:(id)a3 placement:(unint64_t)a4 padding:(double)a5;
- (void)setImageViewOverrideSize:(CGSize)a3;
- (void)setInterior:(BOOL)a3;
- (void)setMaxAngularWidth:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setPath:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextProviderFont:(id)a3;
- (void)setTracking:(double)a3;
- (void)setUsesTextProviderTintColoring:(BOOL)a3;
- (void)sizeToFit;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CLKUICurvedColoringLabel

- (CLKUICurvedColoringLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CLKUICurvedColoringLabel;
  v7 = -[CLKUIColoringLabel initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CLKUICurvedLabel initWithFrame:]([CLKUICurvedLabel alloc], "initWithFrame:", x, y, width, height);
    curvedLabel = v7->_curvedLabel;
    v7->_curvedLabel = v8;

    [(CLKUICurvedColoringLabel *)v7 addSubview:v7->_curvedLabel];
    [(CLKUIColoringLabel *)v7 setUsesTextProviderSize:0];
  }
  return v7;
}

- (double)_lastLineBaseline
{
  [(CLKUICurvedLabel *)self->_curvedLabel _lastLineBaseline];
  return result;
}

- (double)_firstLineBaseline
{
  [(CLKUICurvedLabel *)self->_curvedLabel _firstLineBaseline];
  return result;
}

- (void)setInterior:(BOOL)a3
{
}

- (BOOL)interior
{
  return [(CLKUICurvedLabel *)self->_curvedLabel interior];
}

- (void)setCircleRadius:(double)a3
{
  [(CLKUICurvedLabel *)self->_curvedLabel setCircleRadius:a3];
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearTextWidth];
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (double)circleRadius
{
  [(CLKUICurvedLabel *)self->_curvedLabel circleRadius];
  return result;
}

- (void)setCenterAngle:(double)a3
{
}

- (double)centerAngle
{
  [(CLKUICurvedLabel *)self->_curvedLabel centerAngle];
  return result;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
  id v5 = a3;
  [(CLKUICurvedLabel *)self->_curvedLabel setPath:v5];
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearTextWidth];
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v6, sel_setMaxWidth_);
}

- (void)setUsesTextProviderTintColoring:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CLKUICurvedLabel *)self->_curvedLabel attributedTextProvidesColor] != a3)
  {
    [(CLKUICurvedLabel *)self->_curvedLabel setAttributedTextProvidesColor:v3];
    v5.receiver = self;
    v5.super_class = (Class)CLKUICurvedColoringLabel;
    [(CLKUIColoringLabel *)&v5 setUsesTextProviderTintColoring:v3];
  }
}

- (BOOL)textDefinesTruncation
{
  return 1;
}

- (BOOL)isTextTruncated
{
  return [(CLKUICurvedLabel *)self->_curvedLabel isTextTruncated];
}

- (double)maxWidth
{
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearWidth];
  return result;
}

- (void)setMaxAngularWidth:(double)a3
{
  [(CLKUICurvedLabel *)self->_curvedLabel setMaxAngularWidth:a3];
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearTextWidth];
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (double)maxAngularWidth
{
  [(CLKUICurvedLabel *)self->_curvedLabel maxAngularWidth];
  return result;
}

- (void)setTextColor:(id)a3
{
}

- (id)textColor
{
  return [(CLKUICurvedLabel *)self->_curvedLabel textColor];
}

- (void)setAlpha:(double)a3
{
}

- (double)alpha
{
  [(CLKUICurvedLabel *)self->_curvedLabel alpha];
  return result;
}

- (void)setNumberOfLines:(int64_t)a3
{
}

- (int64_t)numberOfLines
{
  return [(CLKUICurvedLabel *)self->_curvedLabel numberOfLines];
}

- (void)setAttributedText:(id)a3
{
}

- (id)attributedText
{
  return [(CLKUICurvedLabel *)self->_curvedLabel attributedText];
}

- (void)setText:(id)a3
{
}

- (id)text
{
  return [(CLKUICurvedLabel *)self->_curvedLabel text];
}

- (void)setFont:(id)a3
{
  curvedLabel = self->_curvedLabel;
  id v5 = a3;
  [(CLKUICurvedLabel *)curvedLabel setFont:v5];
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedColoringLabel;
  [(CLKUIColoringLabel *)&v6 setFont:v5];
}

- (id)font
{
  return [(CLKUICurvedLabel *)self->_curvedLabel font];
}

- (void)setTextProviderFont:(id)a3
{
  [(CLKUICurvedColoringLabel *)self setFont:a3];
  [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
}

- (void)setTracking:(double)a3
{
  -[CLKUICurvedLabel setTracking:](self->_curvedLabel, "setTracking:");
  v5.receiver = self;
  v5.super_class = (Class)CLKUICurvedColoringLabel;
  [(CLKUIColoringLabel *)&v5 setTracking:a3];
}

- (void)setBaselineOffset:(double)a3
{
  -[CLKUICurvedLabel setBaselineOffset:](self->_curvedLabel, "setBaselineOffset:");
  if (self->_baselineOffset != a3)
  {
    self->_baselineOffset = a3;
    [(CLKUIColoringLabel *)self _requeryTextProviderAndNotify:0];
  }
}

- (void)setImagePlacement:(unint64_t)a3
{
}

- (unint64_t)imagePlacement
{
  return [(CLKUICurvedLabel *)self->_curvedLabel imagePlacement];
}

- (void)setImagePadding:(double)a3
{
  [(CLKUICurvedLabel *)self->_curvedLabel setImagePadding:a3];
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearTextWidth];
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (double)imagePadding
{
  [(CLKUICurvedLabel *)self->_curvedLabel imagePadding];
  return result;
}

- (void)setImageView:(id)a3
{
  [(CLKUICurvedLabel *)self->_curvedLabel setImageView:a3];
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearTextWidth];
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v4, sel_setMaxWidth_);
}

- (UIView)imageView
{
  return [(CLKUICurvedLabel *)self->_curvedLabel imageView];
}

- (void)setImageView:(id)a3 placement:(unint64_t)a4 padding:(double)a5
{
  [(CLKUICurvedLabel *)self->_curvedLabel setImageView:a3 placement:a4 padding:a5];
  [(CLKUICurvedLabel *)self->_curvedLabel maxLinearTextWidth];
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedColoringLabel;
  -[CLKUIColoringLabel setMaxWidth:](&v6, sel_setMaxWidth_);
}

- (void)invalidateCachedSize
{
  [(CLKUICurvedLabel *)self->_curvedLabel invalidateCachedSize];
  v3.receiver = self;
  v3.super_class = (Class)CLKUICurvedColoringLabel;
  [(CLKUIColoringLabel *)&v3 invalidateCachedSize];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUICurvedColoringLabel;
  [(CLKUIColoringLabel *)&v4 traitCollectionDidChange:a3];
  [(CLKUICurvedColoringLabel *)self invalidateCachedSize];
}

- (void)layoutSubviews
{
  [(CLKUICurvedColoringLabel *)self bounds];
  curvedLabel = self->_curvedLabel;
  -[CLKUICurvedLabel setFrame:](curvedLabel, "setFrame:");
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CLKUICurvedColoringLabel *)self frame];
  if ((CLKRectEqualsRect() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLKUICurvedColoringLabel;
    -[CLKUICurvedColoringLabel setFrame:](&v8, sel_setFrame_, x, y, width, height);
    [(CLKUICurvedColoringLabel *)self setNeedsLayout];
    [(CLKUICurvedColoringLabel *)self layoutBelowIfNeeded];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CLKUICurvedColoringLabel *)self bounds];
  if ((CLKRectEqualsRect() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLKUICurvedColoringLabel;
    -[CLKUIColoringLabel setBounds:](&v8, sel_setBounds_, x, y, width, height);
    [(CLKUICurvedColoringLabel *)self setNeedsLayout];
    [(CLKUICurvedColoringLabel *)self layoutBelowIfNeeded];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[CLKUICurvedLabel setTextAlignment:](self->_curvedLabel, "setTextAlignment:");
}

- (void)sizeToFit
{
  [(CLKUICurvedColoringLabel *)self transform];
  if (CGAffineTransformIsIdentity(&v19))
  {
    [(CLKUICurvedColoringLabel *)self frame];
    double v4 = v3;
    double v6 = v5;
    -[CLKUICurvedColoringLabel sizeThatFits:](self, "sizeThatFits:", v7, v8);
    -[CLKUICurvedColoringLabel setFrame:](self, "setFrame:", v4, v6, v9, v10);
  }
  else
  {
    [(CLKUICurvedColoringLabel *)self bounds];
    double v12 = v11;
    double v14 = v13;
    -[CLKUICurvedColoringLabel sizeThatFits:](self, "sizeThatFits:", v15, v16);
    -[CLKUICurvedColoringLabel setBounds:](self, "setBounds:", v12, v14, v17, v18);
  }
  [(CLKUICurvedColoringLabel *)self setNeedsLayout];
  [(CLKUICurvedColoringLabel *)self layoutBelowIfNeeded];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CLKUICurvedLabel sizeThatFits:](self->_curvedLabel, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGRect)textBoundingRect
{
  [(CLKUICurvedLabel *)self->_curvedLabel textBoundingRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)getTextCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5
{
}

- (void)_setUpSnapshot
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  [(CLKUICurvedColoringLabel *)self transform];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CLKUICurvedColoringLabel *)self setTransform:v8];
  double v4 = [(CLKUICurvedColoringLabel *)self snapshotViewAfterScreenUpdates:0];
  snapshot = self->super._snapshot;
  self->super._snapshot = v4;

  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  [(CLKUICurvedColoringLabel *)self setTransform:v7];
  v6[0] = v9;
  v6[1] = v10;
  v6[2] = v11;
  [(UIView *)self->super._snapshot setTransform:v6];
}

- (void)_setAnimationAlpha:(double)a3
{
}

- (void)setImageViewOverrideSize:(CGSize)a3
{
}

- (CGSize)imageViewOverrideSize
{
  [(CLKUICurvedLabel *)self->_curvedLabel imageViewOverrideSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGAffineTransform)transformForImage
{
  CGSize result = (CGAffineTransform *)self->_curvedLabel;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transformForImage];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGPoint)centerForImage
{
  [(CLKUICurvedLabel *)self->_curvedLabel centerForImage];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_curvedLabel, 0);
}

@end