@interface _MFSecureMIMEPersonHeaderLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (_MFSecureMIMEPersonHeaderLabel)initWithImage:(id)a3 text:(id)a4 textColor:(id)a5;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation _MFSecureMIMEPersonHeaderLabel

- (_MFSecureMIMEPersonHeaderLabel)initWithImage:(id)a3 text:(id)a4 textColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_MFSecureMIMEPersonHeaderLabel;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = -[_MFSecureMIMEPersonHeaderLabel initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    [(_MFSecureMIMEPersonHeaderLabel *)v15 setAutoresizesSubviews:1];
    [(_MFSecureMIMEPersonHeaderLabel *)v16 setAutoresizingMask:2];
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(_MFSecureMIMEPersonHeaderLabel *)v16 setBackgroundColor:v17];

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
    imageView = v16->_imageView;
    v16->_imageView = (UIImageView *)v18;

    [(_MFSecureMIMEPersonHeaderLabel *)v16 addSubview:v16->_imageView];
    v20 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:1];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    label = v16->_label;
    v16->_label = (UILabel *)v21;

    v23 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v16->_label setBackgroundColor:v23];

    [(UILabel *)v16->_label setText:v9];
    [(UILabel *)v16->_label setTextColor:v10];
    v24 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v20 size:0.0];
    [(UILabel *)v16->_label setFont:v24];

    [(_MFSecureMIMEPersonHeaderLabel *)v16 addSubview:v16->_label];
  }

  return v16;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  -[UILabel setText:](self->_label, "setText:");
  [(_MFSecureMIMEPersonHeaderLabel *)self setNeedsLayout];
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  imageView = self->_imageView;
  [(UIImageView *)imageView bounds];
  -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", v6, v7);
  double v9 = v8;
  id v10 = [(UILabel *)self->_label text];
  double v11 = [(UILabel *)self->_label font];
  objc_msgSend(v10, "_legacy_sizeWithFont:", v11);
  double v13 = v12;

  if (v9 >= v13) {
    double v14 = v9;
  }
  else {
    double v14 = v13;
  }
  double v15 = width;
  result.height = v14;
  result.CGFloat width = v15;
  return result;
}

- (void)layoutSubviews
{
  [(_MFSecureMIMEPersonHeaderLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_imageView sizeToFit];
  [(UIImageView *)self->_imageView frame];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, (v6 - v7) * 0.5);
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label frame];
  [(_MFSecureMIMEPersonHeaderLabel *)self bounds];
  double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  UIRectCenteredYInRectScale();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  label = self->_label;
  if (v14 <= v4 - v10) {
    double v18 = v14;
  }
  else {
    double v18 = v4 - v10;
  }

  -[UILabel setFrame:](label, "setFrame:", v10, v12, v18, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end