@interface MKAttributionLabel
- (MKAttributionLabel)initWithFrame:(CGRect)a3;
- (id)_attributesWithStroke:(BOOL)a3;
- (id)_labelTitle;
- (int64_t)displayStyle;
- (unint64_t)mapType;
- (void)_prepareLabel;
- (void)_updateTextColor;
- (void)drawRect:(CGRect)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setMapType:(unint64_t)a3;
- (void)sizeToFit;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKAttributionLabel

- (MKAttributionLabel)initWithFrame:(CGRect)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MKAttributionLabel;
  v3 = -[MKAttributionLabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    [(MKAttributionLabel *)v3 setOpaque:0];
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKAttributionLabel *)v4 setBackgroundColor:v5];

    [(MKAttributionLabel *)v4 setAlpha:0.5];
    v10[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = (id)[(MKAttributionLabel *)v4 registerForTraitChanges:v6 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    v4->_useDarkText = 1;
    [(MKAttributionLabel *)v4 _updateTextColor];
    [(MKAttributionLabel *)v4 _prepareLabel];
  }
  return v4;
}

- (id)_attributesWithStroke:(BOOL)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13[0] = *MEMORY[0x1E4F42508];
    v4 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:9.0];
    v14[0] = v4;
    v13[1] = *MEMORY[0x1E4F42570];
    double v5 = 1.0;
    if (!self->_useDarkText) {
      double v5 = 0.0;
    }
    v6 = [MEMORY[0x1E4F428B8] colorWithWhite:v5 alpha:0.800000012];
    v14[1] = v6;
    v13[2] = *MEMORY[0x1E4F42578];
    id v7 = [NSNumber numberWithDouble:5.0];
    v14[2] = v7;
    v13[3] = *MEMORY[0x1E4F425C8];
    v8 = [NSNumber numberWithDouble:1.0];
    v14[3] = v8;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  }
  else
  {
    v11[0] = *MEMORY[0x1E4F42508];
    v4 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:9.0];
    v12[0] = v4;
    v11[1] = *MEMORY[0x1E4F42510];
    if (self->_useDarkText) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    v6 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    v12[1] = v6;
    v11[2] = *MEMORY[0x1E4F425C8];
    id v7 = [NSNumber numberWithDouble:1.0];
    v12[2] = v7;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  }

  return v9;
}

- (void)_prepareLabel
{
  id v11 = [(MKAttributionLabel *)self _labelTitle];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
  v4 = [(MKAttributionLabel *)self _attributesWithStroke:1];
  objc_msgSend(v3, "setAttributes:range:", v4, 0, objc_msgSend(v3, "length"));

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
  v6 = [(MKAttributionLabel *)self _attributesWithStroke:0];
  objc_msgSend(v5, "setAttributes:range:", v6, 0, objc_msgSend(v3, "length"));

  id v7 = (NSAttributedString *)[v3 copy];
  strokeText = self->_strokeText;
  self->_strokeText = v7;

  objc_super v9 = (NSAttributedString *)[v5 copy];
  innerText = self->_innerText;
  self->_innerText = v9;

  [(MKAttributionLabel *)self invalidateIntrinsicContentSize];
  [(UIView *)self _mapKit_setNeedsDisplay];
}

- (void)setMapType:(unint64_t)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    [(MKAttributionLabel *)self _updateTextColor];
  }
}

- (void)setDisplayStyle:(int64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    [(MKAttributionLabel *)self _prepareLabel];
  }
}

- (id)_labelTitle
{
  int64_t displayStyle = self->_displayStyle;
  if (!displayStyle)
  {
    v3 = @"Legal";
    goto LABEL_5;
  }
  if (displayStyle == 1)
  {
    v3 = @"Map Data";
LABEL_5:
    _MKLocalizedStringFromThisBundle(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v3 = 0;
  v4 = 0;
LABEL_7:
  if ([(__CFString *)v4 isEqualToString:@"<unlocalized>"]) {

  }
  else {
    v3 = v4;
  }

  return v3;
}

- (void)_updateTextColor
{
  BOOL v3 = 0;
  unint64_t mapType = self->_mapType;
  if (mapType - 1 >= 4 && mapType != 107)
  {
    double v5 = [(MKAttributionLabel *)self traitCollection];
    BOOL v3 = [v5 userInterfaceStyle] != 2;
  }
  if (self->_useDarkText != v3)
  {
    self->_useDarkText = v3;
    [(MKAttributionLabel *)self _prepareLabel];
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  v6 = [(MKAttributionLabel *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(MKAttributionLabel *)self _updateTextColor];
  }
}

- (void)sizeToFit
{
  -[NSAttributedString boundingRectWithSize:options:context:](self->_strokeText, "boundingRectWithSize:options:context:", 0, 0, 1000.0, 1000.0);
  -[NSAttributedString boundingRectWithSize:options:context:](self->_innerText, "boundingRectWithSize:options:context:", 0, 0, 1000.0, 1000.0);
  [(MKAttributionLabel *)self frame];
  double v4 = v3;
  [(MKAttributionLabel *)self frame];

  [(MKAttributionLabel *)self setFrame:v4];
}

- (void)drawRect:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKAttributionLabel;
  -[MKAttributionLabel drawRect:](&v6, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  strokeText = self->_strokeText;
  [(MKAttributionLabel *)self bounds];
  -[NSAttributedString drawInRect:](strokeText, "drawInRect:");
  innerText = self->_innerText;
  [(MKAttributionLabel *)self bounds];
  -[NSAttributedString drawInRect:](innerText, "drawInRect:");
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerText, 0);

  objc_storeStrong((id *)&self->_strokeText, 0);
}

@end