@interface MKPhotoSmallAttributionView
- (CGSize)intrinsicContentSize;
- (MKPhotoSmallAttributionView)initWithMapItem:(id)a3;
- (id)attributionFont;
- (void)layoutSubviews;
@end

@implementation MKPhotoSmallAttributionView

- (id)attributionFont
{
  v2 = +[MKFontManager sharedManager];
  v3 = [v2 smallAttributionFont];

  [v3 pointSize];
  if (v4 > 18.0)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0 weight:*MEMORY[0x1E4F43928]];

    v3 = (void *)v5;
  }

  return v3;
}

- (MKPhotoSmallAttributionView)initWithMapItem:(id)a3
{
  double v4 = objc_msgSend(a3, "_mapkit_preferredFirstPhotoVendor");
  uint64_t v5 = [v4 providerName];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v37.receiver = self;
    v37.super_class = (Class)MKPhotoSmallAttributionView;
    v7 = -[MKPhotoSmallAttributionView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (v7)
    {
      v8 = [_MKUILabel alloc];
      [(MKPhotoSmallAttributionView *)v7 bounds];
      v9 = -[_MKUILabel initWithFrame:](v8, "initWithFrame:");
      v10 = NSString;
      v11 = _MKLocalizedStringFromThisBundle(@"Photos on %@");
      v12 = [v4 providerName];
      v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);
      [(_MKUILabel *)v9 setText:v13];

      v14 = [(MKPhotoSmallAttributionView *)v7 attributionFont];
      [(_MKUILabel *)v9 setFont:v14];

      BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
      double v16 = 0.75;
      if (IsMacCatalyst) {
        double v16 = 0.85;
      }
      v17 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:v16];
      [(_MKUILabel *)v9 setTextColor:v17];

      v18 = [(MKPhotoSmallAttributionView *)v7 traitCollection];
      uint64_t v19 = [v18 userInterfaceIdiom];

      if (v19 == 5)
      {
        v20 = [MEMORY[0x1E4F428B8] whiteColor];
        [(_MKUILabel *)v9 setTextColor:v20];
      }
      v21 = [MEMORY[0x1E4F428B8] clearColor];
      [(_MKUILabel *)v9 setBackgroundColor:v21];

      [(_MKUILabel *)v9 setTextAlignment:1];
      label = v7->_label;
      v7->_label = v9;
      v23 = v9;

      [(_MKUILabel *)v7->_label sizeToFit];
      [(_MKUILabel *)v7->_label frame];
      v7->_labelSize.width = v24;
      v7->_labelSize.height = v25;
      v26 = [(_MKUILabel *)v7->_label font];
      objc_msgSend(v26, "_mapkit_scaledValueForValue:", 12.0);
      v7->_labelSize.width = v7->_labelSize.width + round(v27);

      v28 = [(_MKUILabel *)v7->_label font];
      objc_msgSend(v28, "_mapkit_scaledValueForValue:", 21.0);
      v7->_labelSize.height = round(v29);

      v30 = [MEMORY[0x1E4F43028] photoSmallAttributionVisualEffectView];
      v31 = +[MKSystemController sharedInstance];
      if ([v31 userInterfaceIdiom] == 2) {
        double v32 = 5.0;
      }
      else {
        double v32 = 4.0;
      }

      [(UIView *)v30 _setCornerRadius:1 continuous:15 maskedCorners:v32];
      [(MKPhotoSmallAttributionView *)v7 addSubview:v30];
      v33 = [(UIView *)v30 contentView];
      [v33 addSubview:v23];

      backgroundView = v7->_backgroundView;
      v7->_backgroundView = v30;

      [(MKPhotoSmallAttributionView *)v7 setClipsToBounds:1];
    }
    self = v7;
    v35 = self;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MKPhotoSmallAttributionView;
  [(MKPhotoSmallAttributionView *)&v9 layoutSubviews];
  [(MKPhotoSmallAttributionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double width = self->_labelSize.width;
  double height = self->_labelSize.height;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[_MKUILabel setFrame:](self->_label, "setFrame:", (v4 - width) * 0.5, (v6 - height) * 0.5, width, height);
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(MKPhotoSmallAttributionView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double width = self->_labelSize.width;
  if (v4 == 5)
  {
    double width = width + 4.0;
    double height = self->_labelSize.height + 8.0;
  }
  else
  {
    double height = self->_labelSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end