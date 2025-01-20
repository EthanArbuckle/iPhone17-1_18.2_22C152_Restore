@interface CPSScaledImageView
- (CGSize)intrinsicContentSize;
- (NSString)textStyleForScaling;
- (void)invalidateIntrinsicContentSize;
- (void)setTextStyleForScaling:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSScaledImageView

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPSScaledImageView;
  id v4 = a3;
  [(CPSScaledImageView *)&v8 traitCollectionDidChange:v4];
  v5 = [(CPSScaledImageView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(CPSScaledImageView *)self invalidateIntrinsicContentSize];
  }
}

- (void)invalidateIntrinsicContentSize
{
  v3.receiver = self;
  v3.super_class = (Class)CPSScaledImageView;
  [(CPSScaledImageView *)&v3 invalidateIntrinsicContentSize];
  self->_needsUpdateScaledImageSize = 1;
}

- (CGSize)intrinsicContentSize
{
  if (self->_needsUpdateScaledImageSize)
  {
    self->_needsUpdateScaledImageSize = 0;
    objc_super v3 = [(CPSScaledImageView *)self image];
    if (v3)
    {
      id v4 = [(CPSScaledImageView *)self traitCollection];
      if (self->_textStyleForScaling) {
        textStyleForScaling = self->_textStyleForScaling;
      }
      else {
        textStyleForScaling = (NSString *)*MEMORY[0x1E4F43870];
      }
      v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:textStyleForScaling compatibleWithTraitCollection:v4];
      [v3 size];
      double v8 = v7;
      objc_msgSend(v6, "_scaledValueForValue:");
      [v6 _scaledValueForValue:v8];
      [v4 displayScale];
      UISizeRoundToScale();
      self->_scaledImageSize.double width = v9;
      self->_scaledImageSize.double height = v10;
    }
    else
    {
      self->_scaledImageSize = (CGSize)*MEMORY[0x1E4F1DB30];
    }
  }
  double width = self->_scaledImageSize.width;
  double height = self->_scaledImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)textStyleForScaling
{
  return self->_textStyleForScaling;
}

- (void)setTextStyleForScaling:(id)a3
{
}

- (void).cxx_destruct
{
}

@end