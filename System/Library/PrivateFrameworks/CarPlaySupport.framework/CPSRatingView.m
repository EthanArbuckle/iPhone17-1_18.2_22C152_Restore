@interface CPSRatingView
- (CGSize)intrinsicContentSize;
- (CPSRatingView)initWithInformationItem:(id)a3 layout:(int64_t)a4;
- (UIStackView)stackView;
- (void)setStackView:(id)a3;
@end

@implementation CPSRatingView

- (CPSRatingView)initWithInformationItem:(id)a3 layout:(int64_t)a4
{
  v53[4] = *MEMORY[0x263EF8340];
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v50 = a4;
  v4 = v52;
  v52 = 0;
  v49.receiver = v4;
  v49.super_class = (Class)CPSRatingView;
  v52 = -[CPSRatingView initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_storeStrong((id *)&v52, v52);
  if (v52)
  {
    BOOL v48 = v50 == 1;
    id v5 = objc_alloc(MEMORY[0x263F1C9B8]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    stackView = v52->_stackView;
    v52->_stackView = (UIStackView *)v6;

    [(UIStackView *)v52->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v52->_stackView setAlignment:1];
    -[UIStackView setDistribution:](v52->_stackView, "setDistribution:");
    [(UIStackView *)v52->_stackView setAxis:0];
    id v39 = (id)[(CPSRatingView *)v52 traitCollection];
    id v47 = (id)CPUIImageStarRatingEmpty();

    id v40 = (id)[location[0] rating];
    [v40 floatValue];
    uint64_t v41 = (uint64_t)(float)(v8 * 2.0);

    uint64_t v46 = v41;
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v36 = i;
      id v37 = (id)[location[0] maximumRating];
      [v37 floatValue];
      BOOL v38 = v36 >= (uint64_t)(float)(v9 * 2.0);

      if (v38) {
        break;
      }
      if (i % 2 == 1)
      {
        if (i < v46)
        {
          id v35 = (id)[(CPSRatingView *)v52 traitCollection];
          id v10 = (id)CPUIImageStarRatingFull();
          id v11 = v47;
          id v47 = v10;
        }
        id v12 = objc_alloc(MEMORY[0x263F1C6D0]);
        id v44 = (id)[v12 initWithImage:v47];
        objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 0);
        LODWORD(v13) = 1148846080;
        [v44 setContentHuggingPriority:1 forAxis:v13];
        id v33 = (id)[MEMORY[0x263F1C550] systemYellowColor];
        objc_msgSend(v44, "setTintColor:");

        [(UIStackView *)v52->_stackView addArrangedSubview:v44];
        id v34 = (id)[(CPSRatingView *)v52 traitCollection];
        id v14 = (id)CPUIImageStarRatingEmpty();
        id v15 = v47;
        id v47 = v14;

        objc_storeStrong(&v44, 0);
      }
      else if (i < v46)
      {
        id v32 = (id)[(CPSRatingView *)v52 traitCollection];
        id v16 = (id)CPUIImageStarRatingHalf();
        id v17 = v47;
        id v47 = v16;
      }
    }
    [(CPSRatingView *)v52 addSubview:v52->_stackView];
    id v31 = (id)[(UIStackView *)v52->_stackView leadingAnchor];
    id v30 = (id)[(CPSRatingView *)v52 leadingAnchor];
    id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v53[0] = v29;
    id v28 = (id)[(UIStackView *)v52->_stackView topAnchor];
    id v27 = (id)[(CPSRatingView *)v52 topAnchor];
    id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v53[1] = v26;
    id v25 = (id)[(UIStackView *)v52->_stackView centerYAnchor];
    id v24 = (id)[(CPSRatingView *)v52 centerYAnchor];
    id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v53[2] = v23;
    id v22 = (id)[(CPSRatingView *)v52 widthAnchor];
    id v21 = (id)[(UIStackView *)v52->_stackView widthAnchor];
    id v20 = (id)objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:");
    v53[3] = v20;
    id v43 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];

    [MEMORY[0x263F08938] activateConstraints:v43];
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v47, 0);
  }
  v19 = v52;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v52, 0);
  return v19;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v6 = [(CPSRatingView *)self stackView];
  [(UIStackView *)v6 frame];
  double v7 = v2;
  double v8 = v3;

  double v5 = v8;
  double v4 = v7;
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end