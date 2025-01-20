@interface HUImageAndTextCell
- (BOOL)prefersSeparatorsHidden;
- (CGSize)imageViewRecommendedSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HFItem)item;
- (HUImageAndTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)contentConstraints;
- (UIImageView)infoImageView;
- (UILayoutGuide)infoImageViewTrailingMarginLayoutGuide;
- (UITextView)messageTextView;
- (void)_resetContentConstraints;
- (void)prepareForReuse;
- (void)setContentConstraints:(id)a3;
- (void)setImageViewRecommendedSize:(CGSize)a3;
- (void)setItem:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUImageAndTextCell

- (HUImageAndTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)HUImageAndTextCell;
  v4 = [(HUImageAndTextCell *)&v34 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = (UITextView *)v5;

    v7 = [(HUImageAndTextCell *)v4 messageTextView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(HUImageAndTextCell *)v4 messageTextView];
    [v8 setEditable:0];

    v9 = [(HUImageAndTextCell *)v4 messageTextView];
    [v9 _setInteractiveTextSelectionDisabled:1];

    v10 = [(HUImageAndTextCell *)v4 messageTextView];
    [v10 setScrollEnabled:0];

    v11 = [(HUImageAndTextCell *)v4 messageTextView];
    v12 = [v11 textContainer];
    [v12 setLineFragmentPadding:0.0];

    v13 = [MEMORY[0x1E4F428B8] clearColor];
    v14 = [(HUImageAndTextCell *)v4 messageTextView];
    [v14 setBackgroundColor:v13];

    double v15 = *MEMORY[0x1E4F437F8];
    double v16 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    v19 = [(HUImageAndTextCell *)v4 messageTextView];
    objc_msgSend(v19, "setTextContainerInset:", v15, v16, v17, v18);

    v20 = [(HUImageAndTextCell *)v4 messageTextView];
    LODWORD(v21) = 1148846080;
    [v20 setContentCompressionResistancePriority:1 forAxis:v21];

    v22 = [(HUImageAndTextCell *)v4 messageTextView];
    LODWORD(v23) = 1132068864;
    [v22 setContentHuggingPriority:1 forAxis:v23];

    v24 = [(HUImageAndTextCell *)v4 contentView];
    v25 = [(HUImageAndTextCell *)v4 messageTextView];
    [v24 addSubview:v25];

    uint64_t v26 = objc_opt_new();
    infoImageViewTrailingMarginLayoutGuide = v4->_infoImageViewTrailingMarginLayoutGuide;
    v4->_infoImageViewTrailingMarginLayoutGuide = (UILayoutGuide *)v26;

    uint64_t v28 = objc_opt_new();
    infoImageView = v4->_infoImageView;
    v4->_infoImageView = (UIImageView *)v28;

    v30 = [(HUImageAndTextCell *)v4 infoImageView];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    v31 = [(HUImageAndTextCell *)v4 contentView];
    v32 = [(HUImageAndTextCell *)v4 infoImageView];
    [v31 addSubview:v32];

    -[HUImageAndTextCell setImageViewRecommendedSize:](v4, "setImageViewRecommendedSize:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    [(HUImageAndTextCell *)v4 setBackgroundColor:0];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUImageAndTextCell;
  [(HUImageAndTextCell *)&v3 prepareForReuse];
  [(HUImageAndTextCell *)self setItem:0];
  -[HUImageAndTextCell setImageViewRecommendedSize:](self, "setImageViewRecommendedSize:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  [(HUImageAndTextCell *)self updateUIWithAnimation:0];
}

- (void)setImageViewRecommendedSize:(CGSize)a3
{
  if (a3.width != self->_imageViewRecommendedSize.width || a3.height != self->_imageViewRecommendedSize.height)
  {
    self->_imageViewRecommendedSize = a3;
    [(HUImageAndTextCell *)self _resetContentConstraints];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4 = [(HUImageAndTextCell *)self item];

  if (v4)
  {
    objc_opt_class();
    uint64_t v5 = [(HUImageAndTextCell *)self item];
    v6 = [v5 latestResults];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    id v25 = [v9 identifier];

    if (v25)
    {
      v10 = HUImageNamed(v25);
    }
    else
    {
      v10 = 0;
    }
    v14 = [(HUImageAndTextCell *)self infoImageView];
    [v14 setImage:v10];

    double v15 = [(HUImageAndTextCell *)self infoImageView];
    [v15 setContentMode:1];

    double v16 = [(HUImageAndTextCell *)self item];
    double v17 = [v16 latestResults];
    double v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

    if ([v18 prefersDynamicString])
    {
      v19 = [(HUImageAndTextCell *)self messageTextView];
      [v19 bounds];
      v22 = objc_msgSend(v18, "dynamicStringForSize:attributes:", MEMORY[0x1E4F1CC08], v20, v21);
      double v23 = [(HUImageAndTextCell *)self messageTextView];
      [v23 setAttributedText:v22];
    }
    else
    {
      v19 = [v18 stringWithAttributes:MEMORY[0x1E4F1CC08]];
      v22 = [(HUImageAndTextCell *)self messageTextView];
      [v22 setAttributedText:v19];
    }

    [(HUImageAndTextCell *)self _resetContentConstraints];
    v24 = [(HUImageAndTextCell *)self messageTextView];
    [v24 invalidateIntrinsicContentSize];

    [(HUImageAndTextCell *)self invalidateIntrinsicContentSize];
  }
  else
  {
    v11 = [(HUImageAndTextCell *)self infoImageView];
    [v11 setImage:0];

    v12 = [(HUImageAndTextCell *)self messageTextView];
    [v12 setAttributedText:0];

    v13 = [(HUImageAndTextCell *)self messageTextView];
    [v13 setText:0];

    [(HUImageAndTextCell *)self _resetContentConstraints];
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(HUImageAndTextCell *)self layoutMargins];
  double v11 = v10;
  [(HUImageAndTextCell *)self layoutMargins];
  double v13 = width - (v11 + v12);
  v14 = [(HUImageAndTextCell *)self infoImageView];
  double v15 = [v14 image];

  if (v15)
  {
    uint64_t v16 = MEMORY[0x1E4F43B98];
    [(HUImageAndTextCell *)self imageViewRecommendedSize];
    if (v18 == *(double *)(MEMORY[0x1E4F1DB10] + 16) && v17 == *(double *)(MEMORY[0x1E4F1DB10] + 24))
    {
      v22 = [(HUImageAndTextCell *)self infoImageView];
      double v23 = [v22 image];
      [v23 size];
      double v21 = v24;
    }
    else
    {
      [(HUImageAndTextCell *)self imageViewRecommendedSize];
      double v21 = v20;
    }
    double height = *(double *)(v16 + 8);
    double v13 = v13 - v21 + -24.0;
  }
  id v25 = [(HUImageAndTextCell *)self messageTextView];
  *(float *)&double v26 = a4;
  *(float *)&double v27 = a5;
  objc_msgSend(v25, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, height, v26, v27);
  double v29 = v28;
  double v31 = v30;

  double v32 = v29;
  double v33 = v31;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (BOOL)prefersSeparatorsHidden
{
  return 1;
}

- (void)_resetContentConstraints
{
  v68[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  v4 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v5 = [(HUImageAndTextCell *)self contentConstraints];
  [v4 deactivateConstraints:v5];

  v6 = objc_opt_new();
  v7 = [(HUImageAndTextCell *)self infoImageView];
  v8 = [v7 image];

  id v9 = [(HUImageAndTextCell *)self contentView];
  double v10 = [(HUImageAndTextCell *)self infoImageViewTrailingMarginLayoutGuide];
  if (v8)
  {
    [v9 addLayoutGuide:v10];

    [(HUImageAndTextCell *)self imageViewRecommendedSize];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __46__HUImageAndTextCell__resetContentConstraints__block_invoke;
    v67[3] = &unk_1E6386458;
    v67[5] = v11;
    v67[6] = v12;
    v67[4] = self;
    v66 = __46__HUImageAndTextCell__resetContentConstraints__block_invoke((uint64_t)v67);
    v65 = [(HUImageAndTextCell *)self infoImageView];
    v63 = [v65 topAnchor];
    v64 = [(HUImageAndTextCell *)self messageTextView];
    v62 = [v64 topAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v68[0] = v61;
    v60 = [(HUImageAndTextCell *)self infoImageView];
    v58 = [v60 leadingAnchor];
    v59 = [(HUImageAndTextCell *)self layoutMarginsGuide];
    v57 = [v59 leadingAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v68[1] = v56;
    v55 = [(HUImageAndTextCell *)self infoImageViewTrailingMarginLayoutGuide];
    v53 = [v55 leadingAnchor];
    v54 = [(HUImageAndTextCell *)self infoImageView];
    v52 = [v54 trailingAnchor];
    v50 = [v53 constraintEqualToAnchor:v52];
    v68[2] = v50;
    double v13 = [(HUImageAndTextCell *)self infoImageViewTrailingMarginLayoutGuide];
    v14 = [v13 widthAnchor];
    double v15 = [v14 constraintEqualToConstant:24.0];
    v68[3] = v15;
    uint64_t v16 = [(HUImageAndTextCell *)self messageTextView];
    double v17 = [v16 leadingAnchor];
    double v18 = [(HUImageAndTextCell *)self infoImageViewTrailingMarginLayoutGuide];
    [v18 trailingAnchor];
    double v20 = v19 = v6;
    double v21 = [v17 constraintEqualToAnchor:v20];
    v68[4] = v21;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];

    v6 = v19;
    unint64_t v3 = 0x1E4F28000;

    [v19 addObjectsFromArray:v51];
    [v19 addObjectsFromArray:v66];
  }
  else
  {
    [v9 removeLayoutGuide:v10];

    v22 = [(HUImageAndTextCell *)self messageTextView];
    double v23 = [v22 leadingAnchor];
    double v24 = [(HUImageAndTextCell *)self layoutMarginsGuide];
    id v25 = [v24 leadingAnchor];
    double v26 = [v23 constraintEqualToAnchor:v25];

    [v6 addObject:v26];
    double v27 = [(HUImageAndTextCell *)self layoutMarginsGuide];
    double v28 = [v27 trailingAnchor];
    double v29 = [(HUImageAndTextCell *)self messageTextView];
    double v30 = [v29 trailingAnchor];
    double v31 = [v28 constraintEqualToAnchor:v30];
    [v6 addObject:v31];
  }
  double v32 = [(HUImageAndTextCell *)self contentView];
  double v33 = [v32 topAnchor];
  objc_super v34 = [(HUImageAndTextCell *)self messageTextView];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v6 addObject:v36];

  v37 = [(HUImageAndTextCell *)self contentView];
  v38 = [v37 bottomAnchor];
  v39 = [(HUImageAndTextCell *)self messageTextView];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v6 addObject:v41];

  v42 = [(HUImageAndTextCell *)self contentView];
  v43 = [v42 layoutMarginsGuide];
  v44 = [v43 trailingAnchor];
  v45 = [(HUImageAndTextCell *)self messageTextView];
  v46 = [v45 trailingAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v6 addObject:v47];

  [(HUImageAndTextCell *)self setContentConstraints:v6];
  v48 = *(void **)(v3 + 3528);
  v49 = [(HUImageAndTextCell *)self contentConstraints];
  [v48 activateConstraints:v49];
}

id __46__HUImageAndTextCell__resetContentConstraints__block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v1 = *(double *)(MEMORY[0x1E4F1DB10] + 16) == *(double *)(a1 + 40)
    && *(double *)(MEMORY[0x1E4F1DB10] + 24) == *(double *)(a1 + 48);
  if (v1
    || ([*(id *)(a1 + 32) infoImageView],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 image],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) infoImageView];
    v6 = [v5 widthAnchor];
    v7 = [v6 constraintEqualToConstant:*(double *)(a1 + 40)];
    v13[0] = v7;
    v8 = [*(id *)(a1 + 32) infoImageView];
    id v9 = [v8 heightAnchor];
    double v10 = [v9 constraintEqualToConstant:*(double *)(a1 + 48)];
    v13[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }

  return v11;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UITextView)messageTextView
{
  return self->_messageTextView;
}

- (CGSize)imageViewRecommendedSize
{
  double width = self->_imageViewRecommendedSize.width;
  double height = self->_imageViewRecommendedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImageView)infoImageView
{
  return self->_infoImageView;
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
}

- (UILayoutGuide)infoImageViewTrailingMarginLayoutGuide
{
  return self->_infoImageViewTrailingMarginLayoutGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoImageViewTrailingMarginLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_infoImageView, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end