@interface CKEffectSelectionCollectionViewCell
- (BOOL)canBecomeFirstResponder;
- (CAShapeLayer)selectionLayer;
- (CKEffectSelectionCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UILabel)label;
- (UIVibrancyEffect)titleVibrancyEffect;
- (UIView)shadowView;
- (UIVisualEffectView)titleContainerView;
- (void)configureForEffectIsDark:(BOOL)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleContainerView:(id)a3;
- (void)setTitleVibrancyEffect:(id)a3;
@end

@implementation CKEffectSelectionCollectionViewCell

- (CKEffectSelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v115[4] = *MEMORY[0x1E4F143B8];
  v113.receiver = self;
  v113.super_class = (Class)CKEffectSelectionCollectionViewCell;
  v3 = -[CKEffectSelectionCollectionViewCell initWithFrame:](&v113, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKEffectSelectionCollectionViewCell *)v3 contentView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v8 = [v6 constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:88.0];
    [v8 setActive:1];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v11 = [v9 constraintWithItem:v10 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:103.0];
    [v11 setActive:1];

    id v12 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(CKEffectSelectionCollectionViewCell *)v4 setShadowView:v12];

    v13 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v15 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    [v15 setBackgroundColor:v14];

    v16 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v17 = [v16 layer];
    [v17 setCornerRadius:12.0];

    uint64_t v18 = *MEMORY[0x1E4F39EA8];
    uint64_t v111 = *MEMORY[0x1E4F39EA8];
    v19 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v20 = [v19 layer];
    [v20 setCornerCurve:v18];

    v21 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v22 = [v21 layer];
    [v22 setShadowRadius:2.0];

    v23 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v24 = [v23 layer];
    LODWORD(v25) = 1036831949;
    [v24 setShadowOpacity:v25];

    v26 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v27 = [v26 layer];
    objc_msgSend(v27, "setShadowOffset:", 0.0, 1.0);

    v28 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v29 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    [v28 addSubview:v29];

    v97 = (void *)MEMORY[0x1E4F28DC8];
    v109 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v105 = [v109 topAnchor];
    v107 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v103 = [v107 topAnchor];
    v101 = [v105 constraintEqualToAnchor:v103 constant:8.0];
    v115[0] = v101;
    v99 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v93 = [v99 centerXAnchor];
    v95 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v30 = [v95 centerXAnchor];
    v31 = [v93 constraintEqualToAnchor:v30];
    v115[1] = v31;
    v32 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v33 = [v32 widthAnchor];
    v34 = [v33 constraintEqualToConstant:72.0];
    v115[2] = v34;
    v35 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v36 = [v35 heightAnchor];
    v37 = [v36 constraintEqualToConstant:72.0];
    v115[3] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];
    [v97 activateConstraints:v38];

    id v39 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
    [(CKEffectSelectionCollectionViewCell *)v4 setImageView:v39];

    v40 = [(CKEffectSelectionCollectionViewCell *)v4 imageView];
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

    v41 = [(CKEffectSelectionCollectionViewCell *)v4 imageView];
    v42 = [v41 layer];
    [v42 setCornerRadius:12.0];

    v43 = [(CKEffectSelectionCollectionViewCell *)v4 imageView];
    v44 = [v43 layer];
    [v44 setCornerCurve:v111];

    v45 = [(CKEffectSelectionCollectionViewCell *)v4 imageView];
    v46 = [v45 layer];
    [v46 setMasksToBounds:1];

    v47 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v48 = [(CKEffectSelectionCollectionViewCell *)v4 imageView];
    [v47 addSubview:v48];

    v49 = [(CKEffectSelectionCollectionViewCell *)v4 imageView];
    v50 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    objc_msgSend(v49, "__ck_makeEdgesEqualTo:", v50);

    id v51 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    [(CKEffectSelectionCollectionViewCell *)v4 setSelectionLayer:v51];

    v52 = [(CKEffectSelectionCollectionViewCell *)v4 selectionLayer];
    [v52 setLineWidth:4.0];

    id v53 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v54 = [v53 CGColor];
    v55 = [(CKEffectSelectionCollectionViewCell *)v4 selectionLayer];
    [v55 setFillColor:v54];

    v56 = +[CKUIBehavior sharedBehaviors];
    v57 = [v56 theme];
    id v58 = [v57 appTintColor];
    uint64_t v59 = [v58 CGColor];
    v60 = [(CKEffectSelectionCollectionViewCell *)v4 selectionLayer];
    [v60 setStrokeColor:v59];

    id v61 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(CKEffectSelectionCollectionViewCell *)v4 setLabel:v61];

    v62 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    v63 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_preferredFontForStyle:", *MEMORY[0x1E4F43870]);
    [v62 setFont:v63];

    v64 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v64 setTranslatesAutoresizingMaskIntoConstraints:0];

    v65 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v65 setTextAlignment:1];

    v66 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v67 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v67 setTextColor:v66];

    v68 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v68 setNumberOfLines:0];

    v69 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v69 setLineBreakMode:0];

    v70 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v70 setAdjustsFontSizeToFitWidth:1];

    v112 = [MEMORY[0x1E4F427D8] effectWithStyle:18];
    v110 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v112];
    [(CKEffectSelectionCollectionViewCell *)v4 setTitleVibrancyEffect:v110];
    v71 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v110];
    [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
    v72 = v71;
    v73 = [v71 contentView];
    v74 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    [v73 addSubview:v74];

    [(CKEffectSelectionCollectionViewCell *)v4 setTitleContainerView:v72];
    v75 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v108 = v72;
    [v75 addSubview:v72];

    v76 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    objc_msgSend(v72, "__ck_makeEdgesEqualTo:", v76);

    v90 = (void *)MEMORY[0x1E4F28DC8];
    v106 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    v102 = [v106 topAnchor];
    v104 = [(CKEffectSelectionCollectionViewCell *)v4 shadowView];
    v100 = [v104 bottomAnchor];
    v98 = [v102 constraintEqualToAnchor:v100 constant:8.0];
    v114[0] = v98;
    v96 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    v92 = [v96 centerXAnchor];
    v94 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v91 = [v94 centerXAnchor];
    v89 = [v92 constraintEqualToAnchor:v91];
    v114[1] = v89;
    v88 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    v87 = [v88 widthAnchor];
    v77 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v78 = [v77 widthAnchor];
    v79 = [v87 constraintLessThanOrEqualToAnchor:v78 multiplier:1.0];
    v114[2] = v79;
    v80 = [(CKEffectSelectionCollectionViewCell *)v4 label];
    v81 = [v80 bottomAnchor];
    v82 = [(CKEffectSelectionCollectionViewCell *)v4 contentView];
    v83 = [v82 bottomAnchor];
    v84 = [v81 constraintEqualToAnchor:v83];
    v114[3] = v84;
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:4];
    [v90 activateConstraints:v85];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKEffectSelectionCollectionViewCell;
  -[CKEffectSelectionCollectionViewCell setSelected:](&v9, sel_setSelected_);
  if (v3)
  {
    v5 = [(CKEffectSelectionCollectionViewCell *)self contentView];
    v6 = [v5 layer];
    v7 = [(CKEffectSelectionCollectionViewCell *)self selectionLayer];
    [v6 addSublayer:v7];

    [(CKEffectSelectionCollectionViewCell *)self setNeedsLayout];
    [(CKEffectSelectionCollectionViewCell *)self layoutIfNeeded];
  }
  else
  {
    v8 = [(CKEffectSelectionCollectionViewCell *)self selectionLayer];
    [v8 removeFromSuperlayer];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CKEffectSelectionCollectionViewCell;
  [(CKEffectSelectionCollectionViewCell *)&v17 layoutSubviews];
  BOOL v3 = (void *)MEMORY[0x1E4F427D0];
  v4 = [(CKEffectSelectionCollectionViewCell *)self shadowView];
  [v4 bounds];
  objc_msgSend(v3, "_bezierPathWithPillRect:cornerRadius:");
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 CGPath];
  v7 = [(CKEffectSelectionCollectionViewCell *)self shadowView];
  v8 = [v7 layer];
  [v8 setShadowPath:v6];

  objc_super v9 = [(CKEffectSelectionCollectionViewCell *)self shadowView];
  [v9 frame];
  CGRect v19 = CGRectInset(v18, -2.0, -2.0);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;

  objc_msgSend(MEMORY[0x1E4F427D0], "_bezierPathWithPillRect:cornerRadius:", x, y, width, height, 15.2);
  id v14 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 CGPath];
  v16 = [(CKEffectSelectionCollectionViewCell *)self selectionLayer];
  [v16 setPath:v15];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CKEffectSelectionCollectionViewCell *)self imageView];
  [v5 setImage:v4];
}

- (void)setTitle:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = [v4 defaultParagraphStyle];
  v7 = (void *)[v6 mutableCopy];

  LODWORD(v8) = 1045220557;
  [v7 setHyphenationFactor:v8];
  [v7 setAlignment:1];
  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v13 = *MEMORY[0x1E4FB0738];
  v14[0] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11 = (void *)[v9 initWithString:v5 attributes:v10];

  id v12 = [(CKEffectSelectionCollectionViewCell *)self label];
  [v12 setAttributedText:v11];
}

- (void)configureForEffectIsDark:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v6 = [(CKEffectSelectionCollectionViewCell *)self titleVibrancyEffect];
  }
  else
  {
    id v6 = 0;
  }
  id v5 = [(CKEffectSelectionCollectionViewCell *)self titleContainerView];
  [v5 setEffect:v6];

  if (v3)
  {
  }
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIVisualEffectView)titleContainerView
{
  return self->_titleContainerView;
}

- (void)setTitleContainerView:(id)a3
{
}

- (UIVibrancyEffect)titleVibrancyEffect
{
  return self->_titleVibrancyEffect;
}

- (void)setTitleVibrancyEffect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_selectionLayer, 0);
}

@end