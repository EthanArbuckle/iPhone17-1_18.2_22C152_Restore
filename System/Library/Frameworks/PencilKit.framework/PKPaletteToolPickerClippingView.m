@interface PKPaletteToolPickerClippingView
- (PKPaletteToolPickerClippingView)init;
- (double)scalingFactor;
- (uint64_t)_updateUI;
- (void)layoutSubviews;
- (void)setScalingFactor:(double)a3;
@end

@implementation PKPaletteToolPickerClippingView

- (PKPaletteToolPickerClippingView)init
{
  v102[4] = *MEMORY[0x1E4F143B8];
  v95.receiver = self;
  v95.super_class = (Class)PKPaletteToolPickerClippingView;
  v2 = [(PKPaletteToolPickerClippingView *)&v95 init];
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v4 = objc_alloc_init(PKPaletteToolPickerBackgroundContentView);
    backgroundContentView = v3->_backgroundContentView;
    v3->_backgroundContentView = v4;

    [(PKPaletteToolPickerBackgroundContentView *)v3->_backgroundContentView setSemanticContentAttribute:3];
    [(PKPaletteToolPickerClippingView *)v3 addSubview:v3->_backgroundContentView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v3->_contentView;
    v3->_contentView = v6;

    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteToolPickerClippingView *)v3 addSubview:v3->_contentView];
    v85 = (void *)MEMORY[0x1E4F28DC8];
    v91 = [(UIView *)v3->_contentView topAnchor];
    v89 = [(PKPaletteToolPickerClippingView *)v3 topAnchor];
    v88 = [v91 constraintEqualToAnchor:v89];
    v102[0] = v88;
    v86 = [(UIView *)v3->_contentView leadingAnchor];
    v8 = [(PKPaletteToolPickerClippingView *)v3 leadingAnchor];
    v9 = [v86 constraintEqualToAnchor:v8];
    v102[1] = v9;
    v10 = [(UIView *)v3->_contentView trailingAnchor];
    v11 = [(PKPaletteToolPickerClippingView *)v3 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v102[2] = v12;
    v13 = [(UIView *)v3->_contentView bottomAnchor];
    v14 = [(PKPaletteToolPickerClippingView *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v102[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:4];
    [v85 activateConstraints:v16];

    v17 = objc_alloc_init(PKPalettePassthroughView);
    contentOverlayView = v3->_contentOverlayView;
    v3->_contentOverlayView = v17;

    [(PKPalettePassthroughView *)v3->_contentOverlayView setSemanticContentAttribute:3];
    [(PKPaletteToolPickerClippingView *)v3 addSubview:v3->_contentOverlayView];
    v3->_layoutAxis = 0;
    v19 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    leadingEdgeView = v3->_leadingEdgeView;
    v3->_leadingEdgeView = v19;

    [(PKPaletteToolPickerClippingEdgeView *)v3->_leadingEdgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPalettePassthroughView *)v3->_contentOverlayView addSubview:v3->_leadingEdgeView];
    v21 = [(PKPaletteToolPickerClippingEdgeView *)v3->_leadingEdgeView widthAnchor];
    v90 = [v21 constraintEqualToConstant:0.0];

    v22 = [(PKPaletteToolPickerClippingEdgeView *)v3->_leadingEdgeView topAnchor];
    v23 = [(PKPalettePassthroughView *)v3->_contentOverlayView topAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    leadingEdgeViewTopConstraint = v3->_leadingEdgeViewTopConstraint;
    v3->_leadingEdgeViewTopConstraint = (NSLayoutConstraint *)v24;

    v92 = (void *)MEMORY[0x1E4F28DC8];
    v101[0] = v3->_leadingEdgeViewTopConstraint;
    v26 = [(PKPaletteToolPickerClippingEdgeView *)v3->_leadingEdgeView leadingAnchor];
    v27 = [(PKPalettePassthroughView *)v3->_contentOverlayView leadingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v101[1] = v28;
    v29 = [(PKPaletteToolPickerClippingEdgeView *)v3->_leadingEdgeView bottomAnchor];
    v30 = [(PKPalettePassthroughView *)v3->_contentOverlayView bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v101[2] = v31;
    v101[3] = v90;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:4];
    [v92 activateConstraints:v32];

    v33 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    trailingEdgeView = v3->_trailingEdgeView;
    v3->_trailingEdgeView = v33;

    [(PKPaletteToolPickerClippingEdgeView *)v3->_trailingEdgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPalettePassthroughView *)v3->_contentOverlayView addSubview:v3->_trailingEdgeView];
    v35 = [(PKPaletteToolPickerClippingEdgeView *)v3->_trailingEdgeView widthAnchor];
    v87 = [v35 constraintEqualToConstant:0.0];

    v36 = [(PKPaletteToolPickerClippingEdgeView *)v3->_trailingEdgeView topAnchor];
    v37 = [(PKPalettePassthroughView *)v3->_contentOverlayView topAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37];
    trailingEdgeViewTopConstraint = v3->_trailingEdgeViewTopConstraint;
    v3->_trailingEdgeViewTopConstraint = (NSLayoutConstraint *)v38;

    v93 = (void *)MEMORY[0x1E4F28DC8];
    v100[0] = v3->_trailingEdgeViewTopConstraint;
    v40 = [(PKPaletteToolPickerClippingEdgeView *)v3->_trailingEdgeView trailingAnchor];
    v41 = [(PKPalettePassthroughView *)v3->_contentOverlayView trailingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v100[1] = v42;
    v43 = [(PKPaletteToolPickerClippingEdgeView *)v3->_trailingEdgeView bottomAnchor];
    v44 = [(PKPalettePassthroughView *)v3->_contentOverlayView bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v100[2] = v45;
    v100[3] = v87;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:4];
    [v93 activateConstraints:v46];

    v47 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    topEdgeView = v3->_topEdgeView;
    v3->_topEdgeView = v47;

    [(PKPaletteToolPickerClippingEdgeView *)v3->_topEdgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPalettePassthroughView *)v3->_contentOverlayView addSubview:v3->_topEdgeView];
    v49 = [(PKPaletteToolPickerClippingEdgeView *)v3->_topEdgeView heightAnchor];
    v94 = [v49 constraintEqualToConstant:0.0];

    v50 = [(PKPaletteToolPickerClippingEdgeView *)v3->_topEdgeView trailingAnchor];
    v51 = [(PKPalettePassthroughView *)v3->_contentOverlayView trailingAnchor];
    uint64_t v52 = [v50 constraintEqualToAnchor:v51];
    topEdgeViewTrailingConstraint = v3->_topEdgeViewTrailingConstraint;
    v3->_topEdgeViewTrailingConstraint = (NSLayoutConstraint *)v52;

    v54 = [(PKPaletteToolPickerClippingEdgeView *)v3->_topEdgeView leadingAnchor];
    v55 = [(PKPalettePassthroughView *)v3->_contentOverlayView leadingAnchor];
    uint64_t v56 = [v54 constraintEqualToAnchor:v55];
    topEdgeViewLeadingConstraint = v3->_topEdgeViewLeadingConstraint;
    v3->_topEdgeViewLeadingConstraint = (NSLayoutConstraint *)v56;

    v58 = (void *)MEMORY[0x1E4F28DC8];
    v59 = [(PKPaletteToolPickerClippingEdgeView *)v3->_topEdgeView topAnchor];
    v60 = [(PKPalettePassthroughView *)v3->_contentOverlayView topAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    v99[0] = v61;
    v99[1] = v3->_topEdgeViewLeadingConstraint;
    v99[2] = v3->_topEdgeViewTrailingConstraint;
    v99[3] = v94;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
    [v58 activateConstraints:v62];

    v63 = objc_alloc_init(PKPaletteToolPickerClippingEdgeView);
    bottomEdgeView = v3->_bottomEdgeView;
    v3->_bottomEdgeView = v63;

    [(PKPaletteToolPickerClippingEdgeView *)v3->_bottomEdgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPalettePassthroughView *)v3->_contentOverlayView addSubview:v3->_bottomEdgeView];
    v65 = [(PKPaletteToolPickerClippingEdgeView *)v3->_bottomEdgeView heightAnchor];
    v66 = [v65 constraintEqualToConstant:0.0];

    v67 = [(PKPaletteToolPickerClippingEdgeView *)v3->_bottomEdgeView trailingAnchor];
    v68 = [(PKPalettePassthroughView *)v3->_contentOverlayView trailingAnchor];
    uint64_t v69 = [v67 constraintEqualToAnchor:v68];
    bottomEdgeViewTrailingConstraint = v3->_bottomEdgeViewTrailingConstraint;
    v3->_bottomEdgeViewTrailingConstraint = (NSLayoutConstraint *)v69;

    v71 = [(PKPaletteToolPickerClippingEdgeView *)v3->_bottomEdgeView leadingAnchor];
    v72 = [(PKPalettePassthroughView *)v3->_contentOverlayView leadingAnchor];
    uint64_t v73 = [v71 constraintEqualToAnchor:v72];
    bottomEdgeViewLeadingConstraint = v3->_bottomEdgeViewLeadingConstraint;
    v3->_bottomEdgeViewLeadingConstraint = (NSLayoutConstraint *)v73;

    v75 = (void *)MEMORY[0x1E4F28DC8];
    v98[0] = v3->_bottomEdgeViewLeadingConstraint;
    v98[1] = v3->_bottomEdgeViewTrailingConstraint;
    v76 = [(PKPaletteToolPickerClippingEdgeView *)v3->_bottomEdgeView bottomAnchor];
    v77 = [(PKPalettePassthroughView *)v3->_contentOverlayView bottomAnchor];
    v78 = [v76 constraintEqualToAnchor:v77];
    v98[2] = v78;
    v98[3] = v66;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:4];
    [v75 activateConstraints:v79];

    v97[0] = v3->_leadingEdgeView;
    v97[1] = v3->_trailingEdgeView;
    v97[2] = v3->_topEdgeView;
    v97[3] = v3->_bottomEdgeView;
    uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:4];
    edgeViews = v3->_edgeViews;
    v3->_edgeViews = (NSArray *)v80;

    v96[0] = v90;
    v96[1] = v87;
    v96[2] = v94;
    v96[3] = v66;
    uint64_t v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:4];
    edgeViewThicknessConstraints = v3->_edgeViewThicknessConstraints;
    v3->_edgeViewThicknessConstraints = (NSArray *)v82;

    -[PKPaletteToolPickerClippingView _updateUI]((uint64_t)v3);
  }
  return v3;
}

- (uint64_t)_updateUI
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 408);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 544);
    if (*(void *)(v2 + 448) == v3
      || (*(void *)(v2 + 448) = v3,
          -[PKPaletteToolPickerBackgroundContentView _updateUI](v2),
          (uint64_t v2 = *(void *)(v1 + 408)) != 0))
    {
      int v4 = *(unsigned __int8 *)(v1 + 521);
      if (*(unsigned __int8 *)(v2 + 441) == v4
        || (*(unsigned char *)(v2 + 441) = v4,
            -[PKPaletteToolPickerBackgroundContentView _updateUI](v2),
            (uint64_t v2 = *(void *)(v1 + 408)) != 0))
      {
        int v5 = *(unsigned __int8 *)(v1 + 522);
        if (*(unsigned __int8 *)(v2 + 442) == v5
          || (*(unsigned char *)(v2 + 442) = v5,
              -[PKPaletteToolPickerBackgroundContentView _updateUI](v2),
              (uint64_t v2 = *(void *)(v1 + 408)) != 0))
        {
          int v6 = *(unsigned __int8 *)(v1 + 520);
          if (*(unsigned __int8 *)(v2 + 440) != v6)
          {
            *(unsigned char *)(v2 + 440) = v6;
            -[PKPaletteToolPickerBackgroundContentView _updateUI](v2);
          }
        }
      }
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = *(id *)(v1 + 456);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if (v12)
        {
          uint64_t v13 = *(void *)(v1 + 544);
          if (*(void *)(v12 + 424) != v13)
          {
            *(void *)(v12 + 424) = v13;
            -[PKPaletteToolPickerClippingEdgeView _updateUI](v12);
          }
          int v14 = *(unsigned __int8 *)(v1 + 520);
          if (*(unsigned __int8 *)(v12 + 416) != v14)
          {
            *(unsigned char *)(v12 + 416) = v14;
            -[PKPaletteToolPickerClippingEdgeView _updateUI](v12);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v9);
  }

  uint64_t v15 = *(void *)(v1 + 544);
  if (!v15)
  {
    [*(id *)(v1 + 424) setHidden:*(unsigned char *)(v1 + 521) == 0];
    [*(id *)(v1 + 432) setHidden:*(unsigned char *)(v1 + 522) == 0];
    goto LABEL_27;
  }
  [*(id *)(v1 + 424) setHidden:1];
  [*(id *)(v1 + 432) setHidden:1];
  if (v15 != 1)
  {
LABEL_27:
    BOOL v16 = 1;
    [*(id *)(v1 + 440) setHidden:1];
    goto LABEL_28;
  }
  [*(id *)(v1 + 440) setHidden:*(unsigned __int8 *)(v1 + 521) == 0];
  BOOL v16 = *(unsigned char *)(v1 + 522) == 0;
LABEL_28:
  [*(id *)(v1 + 448) setHidden:v16];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *(id *)(v1 + 464);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        objc_msgSend((id)v1, "scalingFactor", (void)v31);
        UIRoundToViewScale();
        objc_msgSend(v22, "setConstant:");
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v19);
  }

  [(id)v1 scalingFactor];
  double v24 = v23;
  double v25 = -(v23 * 6.0);
  double v26 = 0.0;
  if (v15) {
    double v27 = 0.0;
  }
  else {
    double v27 = -(v23 * 6.0);
  }
  objc_msgSend(*(id *)(v1 + 472), "setConstant:", v27, (void)v31);
  [*(id *)(v1 + 480) setConstant:v27];
  if (v15 == 1)
  {
    double v26 = v24 * 6.0;
    if (*(unsigned char *)(v1 + 520)) {
      double v28 = 0.0;
    }
    else {
      double v28 = v24 * 6.0;
    }
    [*(id *)(v1 + 496) setConstant:v28];
    if (*(unsigned char *)(v1 + 520)) {
      double v26 = 0.0;
    }
  }
  else
  {
    [*(id *)(v1 + 496) setConstant:0.0];
  }
  [*(id *)(v1 + 512) setConstant:v26];
  if (*(unsigned char *)(v1 + 520)) {
    double v29 = v25;
  }
  else {
    double v29 = 0.0;
  }
  [*(id *)(v1 + 488) setConstant:v29];
  if (*(unsigned char *)(v1 + 520)) {
    double v30 = v25;
  }
  else {
    double v30 = 0.0;
  }
  return [*(id *)(v1 + 504) setConstant:v30];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolPickerClippingView;
  [(PKPaletteToolPickerClippingView *)&v3 layoutSubviews];
  [(PKPaletteToolPickerClippingView *)self bounds];
  -[PKPaletteToolPickerBackgroundContentView setFrame:](self->_backgroundContentView, "setFrame:");
  [(PKPaletteToolPickerClippingView *)self bounds];
  -[PKPalettePassthroughView setFrame:](self->_contentOverlayView, "setFrame:");
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    -[PKPaletteToolPickerClippingView _updateUI]((uint64_t)self);
  }
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bottomEdgeViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomEdgeViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topEdgeViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topEdgeViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingEdgeViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_leadingEdgeViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_edgeViewThicknessConstraints, 0);
  objc_storeStrong((id *)&self->_edgeViews, 0);
  objc_storeStrong((id *)&self->_bottomEdgeView, 0);
  objc_storeStrong((id *)&self->_topEdgeView, 0);
  objc_storeStrong((id *)&self->_trailingEdgeView, 0);
  objc_storeStrong((id *)&self->_leadingEdgeView, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);

  objc_storeStrong((id *)&self->_backgroundContentView, 0);
}

@end