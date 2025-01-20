@interface _DisclosureLabel
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)edgeInsets;
- (_DisclosureLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation _DisclosureLabel

- (_DisclosureLabel)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_DisclosureLabel;
  v3 = -[_DisclosureLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
    v5 = [v4 fontDescriptorWithSymbolicTraits:2];
    v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
    [(_DisclosureLabel *)v3 setFont:v6];
    [v6 lineHeight];
    v3->_edgeInsets.top = v7;
    v3->_edgeInsets.left = v7 * 1.2;
    v3->_edgeInsets.bottom = v7;
    v3->_edgeInsets.right = v7 * 1.2;
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v9 = [v8 localizedStringForKey:@"CLINICAL_DOCUMENT_CDA_DISCLOSURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(_DisclosureLabel *)v3 setText:v9];

    [(_DisclosureLabel *)v3 setNumberOfLines:0];
    v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(_DisclosureLabel *)v3 setBackgroundColor:v10];

    v11 = HKHealthKeyColor();
    [(_DisclosureLabel *)v3 setTextColor:v11];
  }
  return v3;
}

- (void)drawTextInRect:(CGRect)a3
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  CGFloat v5 = a3.size.width - (left + self->_edgeInsets.right);
  CGFloat v6 = a3.size.height - (top + self->_edgeInsets.bottom);
  v7.receiver = self;
  v7.super_class = (Class)_DisclosureLabel;
  -[_DisclosureLabel drawTextInRect:](&v7, sel_drawTextInRect_, a3.origin.x + left, a3.origin.y + top, v5, v6);
}

- (CGSize)intrinsicContentSize
{
  v7.receiver = self;
  v7.super_class = (Class)_DisclosureLabel;
  [(_DisclosureLabel *)&v7 intrinsicContentSize];
  double v4 = v3 + self->_edgeInsets.top + self->_edgeInsets.bottom;
  double v6 = v5 + self->_edgeInsets.left + self->_edgeInsets.right;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_DisclosureLabel *)self bounds];
  if (width != v8) {
    [(_DisclosureLabel *)self setNeedsUpdateConstraints];
  }
  v9.receiver = self;
  v9.super_class = (Class)_DisclosureLabel;
  -[_DisclosureLabel setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)updateConstraints
{
  [(_DisclosureLabel *)self bounds];
  double v4 = v3 - self->_edgeInsets.left - self->_edgeInsets.right;
  [(_DisclosureLabel *)self preferredMaxLayoutWidth];
  if (v5 != v4) {
    [(_DisclosureLabel *)self setPreferredMaxLayoutWidth:v4];
  }
  v6.receiver = self;
  v6.super_class = (Class)_DisclosureLabel;
  [(_DisclosureLabel *)&v6 updateConstraints];
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end