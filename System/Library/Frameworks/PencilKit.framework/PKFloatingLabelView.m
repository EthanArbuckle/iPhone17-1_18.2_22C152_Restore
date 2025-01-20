@interface PKFloatingLabelView
+ (PKFloatingLabelView)floatingLabelViewWithAttributedString:(uint64_t)a3 font:(void *)a4 location:(void *)a5 traitCollection:(void *)a6;
+ (id)attributedStringFromString:(void *)a3 font:;
+ (id)defaultFloatingLabelFont;
+ (id)floatingLabelViewWithString:(uint64_t)a3 font:(void *)a4 location:(void *)a5 traitCollection:(void *)a6;
@end

@implementation PKFloatingLabelView

+ (id)defaultFloatingLabelFont
{
  self;
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  v2 = [v0 fontDescriptor];
  v3 = [v2 fontDescriptorWithSymbolicTraits:2];
  [v0 pointSize];
  v4 = objc_msgSend(v1, "fontWithDescriptor:size:", v3);

  return v4;
}

+ (id)attributedStringFromString:(void *)a3 font:
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if ([v4 length])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v7 = *MEMORY[0x1E4FB0700];
    v12[0] = *MEMORY[0x1E4FB06F8];
    v12[1] = v7;
    v13[0] = v5;
    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v13[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v10 = (void *)[v6 initWithString:v4 attributes:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)floatingLabelViewWithString:(uint64_t)a3 font:(void *)a4 location:(void *)a5 traitCollection:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = self;
  if (!v11)
  {
    +[PKFloatingLabelView defaultFloatingLabelFont]();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = +[PKFloatingLabelView attributedStringFromString:font:](v13, v10, v11);
  v15 = +[PKFloatingLabelView floatingLabelViewWithAttributedString:v13 font:v14 location:v11 traitCollection:v12];

  return v15;
}

+ (PKFloatingLabelView)floatingLabelViewWithAttributedString:(uint64_t)a3 font:(void *)a4 location:(void *)a5 traitCollection:(void *)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  self;
  id v12 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  uint64_t v13 = [v11 string];
  v14 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v15 = [v13 componentsSeparatedByCharactersInSet:v14];
  uint64_t v16 = [v15 count];

  [v12 setNumberOfLines:v16];
  [v12 setAttributedText:v11];

  double v51 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v52 = *MEMORY[0x1E4F1DB30];
  objc_msgSend(v12, "sizeThatFits:");
  double v18 = v17;
  double v20 = v19;
  [v10 pointSize];
  double v22 = fmax((v21 + 16.0) * 0.5, 16.0);
  [v10 descender];
  double v24 = v23;

  id v25 = v9;
  id v26 = v12;
  self;
  v27 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v27];
  [v28 _setContinuousCornerRadius:v22];
  [v28 setClipsToBounds:1];
  v29 = objc_alloc_init(PKFloatingLabelView);
  [(PKFloatingLabelView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v30 = [MEMORY[0x1E4FB1618] systemGray5Color];
  uint64_t v31 = [v30 CGColor];
  v32 = [(PKFloatingLabelView *)v29 layer];
  [v32 setBorderColor:v31];

  [v25 displayScale];
  if (v33 <= 1.0) {
    double v34 = 1.0;
  }
  else {
    double v34 = 1.0 / v33;
  }
  v35 = [(PKFloatingLabelView *)v29 layer];
  [v35 setBorderWidth:v34];

  [(PKFloatingLabelView *)v29 _setContinuousCornerRadius:v22];
  v55.origin.x = a1 - v18 * 0.5;
  v55.origin.y = a2 - v20 * 0.5;
  v55.size.width = v18;
  v55.size.height = v20;
  CGRect v56 = CGRectInset(v55, -16.0, 0.0);
  double v36 = v56.size.height + 16.0;
  double v37 = -(v56.size.height + 16.0);
  if (v56.origin.y <= v36) {
    double v37 = v36;
  }
  -[PKFloatingLabelView setFrame:](v29, "setFrame:", v56.origin.x, v56.origin.y + v37, v56.size.width, v36);
  objc_msgSend(v26, "setFrame:", 16.0, v36 - (v20 + 12.0 + v24), v18, v20);
  [(PKFloatingLabelView *)v29 bounds];
  objc_msgSend(v28, "setFrame:");
  [(PKFloatingLabelView *)v29 addSubview:v28];
  [(PKFloatingLabelView *)v29 addSubview:v26];

  uint64_t v38 = [v25 userInterfaceStyle];
  if (v38 != 2)
  {
    id v39 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
    uint64_t v40 = [v39 CGColor];
    v41 = [(PKFloatingLabelView *)v29 layer];
    [v41 setShadowColor:v40];

    v42 = [(PKFloatingLabelView *)v29 layer];
    [v42 setShadowRadius:20.0];

    v43 = [(PKFloatingLabelView *)v29 layer];
    LODWORD(v44) = 1041865114;
    [v43 setShadowOpacity:v44];

    v45 = [(PKFloatingLabelView *)v29 layer];
    objc_msgSend(v45, "setShadowOffset:", v52, v51);

    v46 = (void *)MEMORY[0x1E4FB14C0];
    [(PKFloatingLabelView *)v29 bounds];
    objc_msgSend(v46, "bezierPathWithRoundedRect:cornerRadius:");
    id v47 = objc_claimAutoreleasedReturnValue();
    uint64_t v48 = [v47 CGPath];
    v49 = [(PKFloatingLabelView *)v29 layer];
    [v49 setShadowPath:v48];
  }

  return v29;
}

@end