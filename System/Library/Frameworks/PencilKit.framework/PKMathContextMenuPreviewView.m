@interface PKMathContextMenuPreviewView
+ (UIFont)footnoteBoldFont;
- (PKMathContextMenuPreviewView)initWithImage:(id)a3 label:(id)a4 attributionImage:(id)a5 lastRefreshDate:(id)a6;
- (double)p_attributionImageHeight;
- (double)p_layoutSubviews;
- (void)layoutSubviews;
@end

@implementation PKMathContextMenuPreviewView

- (PKMathContextMenuPreviewView)initWithImage:(id)a3 label:(id)a4 attributionImage:(id)a5 lastRefreshDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)PKMathContextMenuPreviewView;
  v14 = -[PKMathContextMenuPreviewView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v14)
  {
    if (v10) {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
    }
    else {
      v15 = 0;
    }
    p_imageView = (id *)&v14->_imageView;
    objc_storeStrong((id *)&v14->_imageView, v15);
    if (v10) {

    }
    p_label = (id *)&v14->_label;
    objc_storeStrong((id *)&v14->_label, a4);
    [v11 frame];
    v14->_labelSize.width = v18;
    v14->_labelSize.height = v19;
    if (v13)
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      dateLabel = v14->_dateLabel;
      v14->_dateLabel = v20;

      v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
      [(UILabel *)v14->_dateLabel setFont:v22];

      v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v14->_dateLabel setTextColor:v23];

      [(UILabel *)v14->_dateLabel setTextAlignment:1];
      [(UILabel *)v14->_dateLabel setNumberOfLines:1];
      id v24 = objc_alloc_init(MEMORY[0x1E4F28FE0]);
      [MEMORY[0x1E4F1C9C8] date];
      v26 = id v25 = v11;
      [v24 localizedStringForDate:v13 relativeToDate:v26];
      id v27 = v10;
      id v28 = v12;
      v30 = id v29 = v13;
      [(UILabel *)v14->_dateLabel setText:v30];

      id v13 = v29;
      id v12 = v28;
      id v10 = v27;

      id v11 = v25;
      p_imageView = (id *)&v14->_imageView;
      [(UILabel *)v14->_dateLabel sizeToFit];
    }
    if (v12)
    {
      [v12 size];
      if (v31 > 0.0)
      {
        uint64_t v32 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
        attrImageView = v14->_attrImageView;
        v14->_attrImageView = (UIImageView *)v32;

        [(UIImageView *)v14->_attrImageView setContentMode:0];
      }
    }
    [(PKMathContextMenuPreviewView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v14->_attrImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v14->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    if (*p_imageView) {
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    }
    if (*p_label) {
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    }
    if (v14->_attrImageView) {
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    }
    if (v14->_dateLabel) {
      -[PKMathContextMenuPreviewView addSubview:](v14, "addSubview:");
    }
    double v34 = -[PKMathContextMenuPreviewView p_layoutSubviews]((id *)&v14->super.super.super.isa);
    -[PKMathContextMenuPreviewView setFrame:](v14, "setFrame:", 0.0, 0.0, v34, v35);
  }

  return v14;
}

- (double)p_layoutSubviews
{
  if (!a1) {
    return 0.0;
  }
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 pointSize];
  double v4 = v3;

  double v5 = v4 * 0.5;
  v6 = [a1[51] image];
  [v6 size];
  double v8 = v7;
  double v10 = v9;

  id v11 = (double *)MEMORY[0x1E4F1DAD8];
  [a1[52] frame];
  objc_msgSend(a1[52], "setFrame:");
  [a1[54] sizeToFit];
  id v12 = a1[53];
  if (v12)
  {
    id v13 = [v12 image];
    [v13 size];
    double v15 = v14;
    double v17 = v16;

    double v18 = -[PKMathContextMenuPreviewView p_attributionImageHeight]();
    objc_msgSend(a1[53], "setFrame:", 0.0, 0.0, v18 * (v15 / v17), v18);
  }
  double v19 = v5 + 2.0;
  double v21 = *v11;
  double v20 = v11[1];
  id v22 = a1[51];
  if (v22)
  {
    id v23 = a1[53];
    if (v23)
    {
      double v64 = v11[1];
      id v24 = a1[54];
      [v23 bounds];
      double v27 = v26;
      if (v24)
      {
        id v28 = &OBJC_IVAR___PKMathContextMenuPreviewView__dateLabel;
        [a1[54] bounds];
        if (v27 >= v29) {
          double v30 = v27;
        }
        else {
          double v30 = v29;
        }
        [a1[53] bounds];
        double v32 = v31;
        [a1[54] bounds];
        double v34 = v32 + v33 + 48.0;
        double v63 = v10 + v30 + 4.0;
        double v35 = 0.0;
        if (v10 > v19 + v19) {
          double v35 = v19 + -2.0;
        }
        double v36 = v10 - v35;
        if (v34 <= v8)
        {
          double v37 = v8;
        }
        else
        {
          double v21 = (v34 - v8) * 0.5;
          double v37 = v34;
        }
        double v38 = v36 + 4.0;
        objc_msgSend(a1[53], "bounds", *(void *)&v63);
        double v40 = v39;
        [a1[53] bounds];
        objc_msgSend(a1[53], "setFrame:", 12.0, v38, v40);
        [a1[54] bounds];
        double v42 = v41;
        double v44 = v43;
        double v45 = -[PKMathContextMenuPreviewView p_attributionImageHeight]() * -0.15;
        double v48 = v37 - v42 + -12.0;
      }
      else
      {
        double v58 = v25 + 24.0;
        double v59 = 0.0;
        if (v10 > v19 + v19) {
          double v59 = v19 + -2.0;
        }
        double v38 = v10 - v59;
        if (v58 > v8) {
          double v48 = 12.0;
        }
        else {
          double v48 = (v8 - v58) * 0.5 + 12.0;
        }
        if (v58 <= v8)
        {
          double v37 = v8;
        }
        else
        {
          double v21 = (v58 - v8) * 0.5;
          double v37 = v58;
        }
        id v28 = &OBJC_IVAR___PKMathContextMenuPreviewView__attrImageView;
        objc_msgSend(a1[53], "bounds", v10 + v26 + 8.0);
        double v42 = v60;
        double v44 = v61;
        double v45 = 4.0;
      }
      double v54 = v38 + v45;
LABEL_45:
      objc_msgSend(*(id *)((char *)a1 + *v28), "setFrame:", v48, v54, v42, v44, v46, v47);
      id v22 = a1[51];
      double v20 = v64;
      goto LABEL_46;
    }
  }
  id v49 = a1[52];
  if (v49)
  {
    double v64 = v11[1];
    [v49 bounds];
    double v42 = v50;
    double v51 = v50 + 24.0;
    double v52 = v19 + -2.0;
    double v44 = v19 + -2.0 + v53;
    if (v10 <= v19 + v19) {
      double v52 = 0.0;
    }
    double v54 = v10 - v52;
    id v55 = a1[51];
    double v46 = v44 + v19 * 2.0;
    double v47 = (v8 - v51) * 0.5;
    double v56 = (v51 - v8) * 0.5;
    if (v51 <= v8) {
      double v56 = v21;
    }
    else {
      double v47 = 12.0;
    }
    if (v51 > v8) {
      double v57 = v50 + 24.0;
    }
    else {
      double v57 = v8;
    }
    id v28 = &OBJC_IVAR___PKMathContextMenuPreviewView__label;
    if (v55) {
      double v48 = v47;
    }
    else {
      double v48 = 0.0;
    }
    if (v55) {
      double v21 = v56;
    }
    else {
      double v54 = v19;
    }
    if (v55) {
      double v37 = v57;
    }
    else {
      double v37 = v50 + 24.0;
    }
    goto LABEL_45;
  }
  double v37 = v8;
LABEL_46:
  objc_msgSend(v22, "setFrame:", v21, v20, v8, v10);
  return v37;
}

+ (UIFont)footnoteBoldFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  double v3 = (void *)MEMORY[0x1E4FB08E0];
  double v4 = [v2 fontDescriptor];
  double v5 = [v4 fontDescriptorWithSymbolicTraits:2];
  [v2 pointSize];
  v6 = objc_msgSend(v3, "fontWithDescriptor:size:", v5);

  return (UIFont *)v6;
}

- (double)p_attributionImageHeight
{
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v0 pointSize];
  double v2 = v1;

  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKMathContextMenuPreviewView;
  [(PKMathContextMenuPreviewView *)&v3 layoutSubviews];
  -[PKMathContextMenuPreviewView p_layoutSubviews]((id *)&self->super.super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_attrImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end