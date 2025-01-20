@interface MFSecureMIMEPersonHeaderView
+ (id)_explanationLabelDefaultAttributes;
- (BOOL)editing;
- (BOOL)showsButtons;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFSecureMIMEPersonHeaderView)initWithFrame:(CGRect)a3;
- (MFSecureMIMEPersonHeaderView)initWithFrame:(CGRect)a3 warningLabelTextColor:(id)a4;
- (NSArray)buttons;
- (NSString)explanationText;
- (NSString)secureLabelText;
- (NSString)signedLabelText;
- (NSString)warningLabelText;
- (double)heightOfBottomMargin;
- (double)heightThatFitsButtons;
- (double)heightThatFitsMainLabel:(CGSize)a3;
- (double)heightThatFitsSubview:(id)a3 padding:(double)a4;
- (double)widthForSizingToFitSize:(CGSize)a3;
- (id)_secureLabel;
- (id)_signedLabel;
- (id)_warningLabel;
- (void)_insert:(BOOL)a3 subview:(id)a4;
- (void)_setText:(id)a3 forLabel:(id)a4;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setButtons:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setExplanationText:(id)a3;
- (void)setSecureLabelText:(id)a3;
- (void)setSignedLabelText:(id)a3;
- (void)setWarningLabelText:(id)a3;
@end

@implementation MFSecureMIMEPersonHeaderView

+ (id)_explanationLabelDefaultAttributes
{
  if (_explanationLabelDefaultAttributes_onceToken != -1) {
    dispatch_once(&_explanationLabelDefaultAttributes_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)_explanationLabelDefaultAttributes_defaultAttributes;

  return v2;
}

void __66__MFSecureMIMEPersonHeaderView__explanationLabelDefaultAttributes__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v0 setLineBreakMode:0];
  v5[0] = *MEMORY[0x1E4FB06F8];
  v1 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2960]];
  v6[0] = v1;
  v5[1] = *MEMORY[0x1E4FB0700];
  v2 = [MEMORY[0x1E4FB1618] mailSecureMIMERegularTextColor];
  v5[2] = *MEMORY[0x1E4FB0738];
  v6[1] = v2;
  v6[2] = v0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)_explanationLabelDefaultAttributes_defaultAttributes;
  _explanationLabelDefaultAttributes_defaultAttributes = v3;
}

- (MFSecureMIMEPersonHeaderView)initWithFrame:(CGRect)a3 warningLabelTextColor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MFSecureMIMEPersonHeaderView;
  v10 = -[MFSecureMIMEPersonHeaderView initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(MFSecureMIMEPersonHeaderView *)v10 setAutoresizesSubviews:1];
    [(MFSecureMIMEPersonHeaderView *)v11 setAutoresizingMask:2];
    id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    label = v11->_label;
    v11->_label = (UILabel *)v13;

    v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v11->_label setBackgroundColor:v15];

    [(UILabel *)v11->_label setNumberOfLines:0];
    v16 = [_MFSecureMIMEPersonHeaderLabel alloc];
    v17 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"checkmark.circle.fill", 20);
    v18 = [MEMORY[0x1E4FB1618] mailSecureMIMERegularTextColor];
    uint64_t v19 = [(_MFSecureMIMEPersonHeaderLabel *)v16 initWithImage:v17 text:0 textColor:v18];
    signedLabel = v11->_signedLabel;
    v11->_signedLabel = (UIView *)v19;

    v21 = [_MFSecureMIMEPersonHeaderLabel alloc];
    v22 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"lock.fill", 20);
    v23 = [MEMORY[0x1E4FB1618] mailSecureMIMERegularTextColor];
    uint64_t v24 = [(_MFSecureMIMEPersonHeaderLabel *)v21 initWithImage:v22 text:0 textColor:v23];
    secureLabel = v11->_secureLabel;
    v11->_secureLabel = (UIView *)v24;

    if (v9)
    {
      id v26 = v9;
    }
    else
    {
      id v26 = [MEMORY[0x1E4FB1618] mailSecureMIMEWarningColor];
    }
    v27 = v26;
    v28 = [_MFSecureMIMEPersonHeaderLabel alloc];
    v29 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"questionmark.circle.fill", 20);
    uint64_t v30 = [(_MFSecureMIMEPersonHeaderLabel *)v28 initWithImage:v29 text:0 textColor:v27];
    warningLabel = v11->_warningLabel;
    v11->_warningLabel = (UIView *)v30;
  }
  return v11;
}

- (MFSecureMIMEPersonHeaderView)initWithFrame:(CGRect)a3
{
  return -[MFSecureMIMEPersonHeaderView initWithFrame:warningLabelTextColor:](self, "initWithFrame:warningLabelTextColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSignedLabelText:(id)a3
{
  id v5 = a3;
  v4 = [(MFSecureMIMEPersonHeaderView *)self _signedLabel];
  [(MFSecureMIMEPersonHeaderView *)self _setText:v5 forLabel:v4];
}

- (NSString)signedLabelText
{
  v2 = [(MFSecureMIMEPersonHeaderView *)self _signedLabel];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSecureLabelText:(id)a3
{
  id v5 = a3;
  v4 = [(MFSecureMIMEPersonHeaderView *)self _secureLabel];
  [(MFSecureMIMEPersonHeaderView *)self _setText:v5 forLabel:v4];
}

- (NSString)secureLabelText
{
  v2 = [(MFSecureMIMEPersonHeaderView *)self _secureLabel];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setWarningLabelText:(id)a3
{
  id v5 = a3;
  v4 = [(MFSecureMIMEPersonHeaderView *)self _warningLabel];
  [(MFSecureMIMEPersonHeaderView *)self _setText:v5 forLabel:v4];
}

- (NSString)warningLabelText
{
  v2 = [(MFSecureMIMEPersonHeaderView *)self _warningLabel];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setExplanationText:(id)a3
{
  v8 = (__CFString *)a3;
  [(MFSecureMIMEPersonHeaderView *)self _insert:v8 != 0 subview:self->_label];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v8) {
    id v5 = v8;
  }
  else {
    id v5 = &stru_1F0817A00;
  }
  v6 = [(id)objc_opt_class() _explanationLabelDefaultAttributes];
  v7 = (void *)[v4 initWithString:v5 attributes:v6];

  [(UILabel *)self->_label setAttributedText:v7];
  [(MFSecureMIMEPersonHeaderView *)self invalidateIntrinsicContentSize];
  [(MFSecureMIMEPersonHeaderView *)self setNeedsLayout];
}

- (NSString)explanationText
{
  return [(UILabel *)self->_label text];
}

- (void)setButtons:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  buttons = self->_buttons;
  if (buttons == v4)
  {
    if ([(NSArray *)v4 isEqual:v4]) {
      goto LABEL_12;
    }
    buttons = self->_buttons;
  }
  [(NSArray *)buttons makeObjectsPerformSelector:sel_removeFromSuperview];
  v6 = (NSArray *)[(NSArray *)v4 copy];
  v7 = self->_buttons;
  self->_buttons = v6;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v8 = v4;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        -[MFSecureMIMEPersonHeaderView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(MFSecureMIMEPersonHeaderView *)self setNeedsLayout];
LABEL_12:
}

- (void)setEditing:(BOOL)a3
{
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xFE | a3;
}

- (BOOL)editing
{
  return *((unsigned char *)self + 448) & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(MFSecureMIMEPersonHeaderView *)self heightThatFitsSubview:self->_signedLabel padding:5.0];
  double v7 = v6 + 10.0;
  [(MFSecureMIMEPersonHeaderView *)self heightThatFitsSubview:self->_secureLabel padding:5.0];
  double v9 = v7 + v8;
  [(MFSecureMIMEPersonHeaderView *)self heightThatFitsSubview:self->_warningLabel padding:5.0];
  double v11 = v9 + v10;
  -[MFSecureMIMEPersonHeaderView heightThatFitsMainLabel:](self, "heightThatFitsMainLabel:", width, height);
  double v13 = v11 + v12;
  [(MFSecureMIMEPersonHeaderView *)self heightThatFitsButtons];
  double v15 = v13 + v14;
  [(MFSecureMIMEPersonHeaderView *)self heightOfBottomMargin];
  double v17 = v15 + v16;
  double v18 = width;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (double)heightThatFitsSubview:(id)a3 padding:(double)a4
{
  id v5 = a3;
  double v6 = [v5 superview];

  if (v6)
  {
    [v5 bounds];
    objc_msgSend(v5, "sizeThatFits:", v7, v8);
    double v10 = v9 + a4;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)heightThatFitsMainLabel:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(UILabel *)self->_label superview];

  if (!v6) {
    return 0.0;
  }
  -[MFSecureMIMEPersonHeaderView widthForSizingToFitSize:](self, "widthForSizingToFitSize:", width, height);
  double v8 = v7;
  double v9 = [(MFSecureMIMEPersonHeaderView *)self superview];
  [v9 layoutMargins];
  double v11 = v8 - v10;

  double v12 = [(UILabel *)self->_label attributedText];
  objc_msgSend(v12, "boundingRectWithSize:options:context:", 1, 0, v11, 0.0);

  UICeilToViewScale();
  return v13 + 12.0;
}

- (double)widthForSizingToFitSize:(CGSize)a3
{
  if (a3.width >= 0.0) {
    double width = a3.width;
  }
  else {
    double width = 0.0;
  }
  if (width == 0.0)
  {
    id v5 = [(MFSecureMIMEPersonHeaderView *)self superview];

    if (v5)
    {
      double v6 = [(MFSecureMIMEPersonHeaderView *)self superview];
      [v6 bounds];
      double v8 = v7;
      double v9 = [(MFSecureMIMEPersonHeaderView *)self superview];
      [v9 layoutMargins];
      double width = v8 - v10;

      if (width < 0.0) {
        double width = 0.0;
      }
    }
  }
  double result = 320.0;
  if (width != 0.0) {
    return width;
  }
  return result;
}

- (double)heightThatFitsButtons
{
  BOOL v3 = [(MFSecureMIMEPersonHeaderView *)self showsButtons];
  double result = 0.0;
  if (v3) {
    return (float)((float)[(NSArray *)self->_buttons count] * 49.0);
  }
  return result;
}

- (double)heightOfBottomMargin
{
  BOOL v2 = [(MFSecureMIMEPersonHeaderView *)self showsButtons];
  double result = 10.0;
  if (v2) {
    return 6.0;
  }
  return result;
}

- (BOOL)showsButtons
{
  return (*((unsigned char *)self + 448) & 1) == 0 && [(NSArray *)self->_buttons count] != 0;
}

- (CGSize)intrinsicContentSize
{
  [(MFSecureMIMEPersonHeaderView *)self bounds];

  -[MFSecureMIMEPersonHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [(MFSecureMIMEPersonHeaderView *)self bounds];
  double v4 = v3;
  double v5 = [(UIView *)self->_signedLabel superview];

  if (v5)
  {
    double v6 = self->_signedLabel;
    [(UIView *)v6 sizeToFit];
    [(UIView *)v6 frame];
    -[UIView setFrame:](v6, "setFrame:", 0.0, 10.0, v4);
    UIRoundToViewScale();
    double MaxY = v7;

    double v9 = 5.0;
  }
  else
  {
    double MaxY = 0.0;
    double v9 = 10.0;
  }
  double v10 = [(UIView *)self->_secureLabel superview];

  if (v10)
  {
    double v11 = self->_secureLabel;
    [(UIView *)v11 sizeToFit];
    [(UIView *)v11 frame];
    -[UIView setFrame:](v11, "setFrame:", 0.0, v9 + MaxY, v4);
    UIRoundToViewScale();
    double MaxY = v12;

    double v9 = 5.0;
  }
  double v13 = [(UIView *)self->_warningLabel superview];

  if (v13)
  {
    double v14 = self->_warningLabel;
    [(UIView *)v14 sizeToFit];
    [(UIView *)v14 frame];
    -[UIView setFrame:](v14, "setFrame:", 0.0, v9 + MaxY, v4);
    UIRoundToViewScale();
    double MaxY = v15;
  }
  double v16 = [(UILabel *)self->_label superview];

  if (v16)
  {
    double v17 = [(MFSecureMIMEPersonHeaderView *)self superview];
    [v17 layoutMargins];
    double v19 = v18;

    v20 = [(UILabel *)self->_label attributedText];
    CGFloat v21 = v4 - v19;
    objc_msgSend(v20, "boundingRectWithSize:options:context:", 1, 0, v21, 0.0);

    [(UILabel *)self->_label frame];
    CGFloat v22 = MaxY + 12.0;
    UICeilToViewScale();
    CGFloat v24 = v23;
    -[UILabel setFrame:](self->_label, "setFrame:", 0.0, v22, v21, v23);
    v38.origin.double x = 0.0;
    v38.origin.double y = v22;
    v38.size.double width = v21;
    v38.size.double height = v24;
    double MaxY = CGRectGetMaxY(v38);
  }
  if ([(NSArray *)self->_buttons count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v25 = self->_buttons;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v25);
          }
          v29 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          objc_msgSend(v29, "frame", (void)v32);
          CGFloat v30 = MaxY + 6.0;
          objc_msgSend(v29, "setFrame:", 0.0, v30, v4, 43.0);
          v39.origin.double x = 0.0;
          v39.origin.double y = v30;
          v39.size.double width = v4;
          v39.size.double height = 43.0;
          double MaxY = CGRectGetMaxY(v39);
          if (*((unsigned char *)self + 448)) {
            double v31 = 0.0;
          }
          else {
            double v31 = 1.0;
          }
          [v29 setAlpha:v31];
          [v29 setUserInteractionEnabled:(*((unsigned char *)self + 448) & 1) == 0];
        }
        uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v26);
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFSecureMIMEPersonHeaderView *)self bounds];
  if (width != v8) {
    [(MFSecureMIMEPersonHeaderView *)self invalidateIntrinsicContentSize];
  }
  v9.receiver = self;
  v9.super_class = (Class)MFSecureMIMEPersonHeaderView;
  -[MFSecureMIMEPersonHeaderView setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)_setText:(id)a3 forLabel:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MFSecureMIMEPersonHeaderView *)self _insert:v7 != 0 subview:v6];
  [v6 setText:v7];
  [(MFSecureMIMEPersonHeaderView *)self setNeedsLayout];
}

- (void)_insert:(BOOL)a3 subview:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = [v8 superview];
  id v7 = v6;
  if (v4)
  {
    if (v6 != self) {
      [(MFSecureMIMEPersonHeaderView *)self addSubview:v8];
    }
  }
  else if (v6)
  {
    [v8 removeFromSuperview];
  }
}

- (id)_signedLabel
{
  return self->_signedLabel;
}

- (id)_secureLabel
{
  return self->_secureLabel;
}

- (id)_warningLabel
{
  return self->_warningLabel;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_warningLabel, 0);
  objc_storeStrong((id *)&self->_secureLabel, 0);

  objc_storeStrong((id *)&self->_signedLabel, 0);
}

@end