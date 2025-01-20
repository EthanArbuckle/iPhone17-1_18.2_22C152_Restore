@interface CPSPausedCardView
+ (id)createPlatterView;
+ (id)titleFont;
- (CGSize)intrinsicContentSize;
- (CPSCardPlatterView)cardPlatterView;
- (CPSPausedCardView)initWithReason:(unint64_t)a3 title:(id)a4 backgroundColor:(id)a5;
- (UIActivityIndicatorView)spinner;
- (UILabel)title;
- (void)setCardPlatterView:(id)a3;
@end

@implementation CPSPausedCardView

- (CPSPausedCardView)initWithReason:(unint64_t)a3 title:(id)a4 backgroundColor:(id)a5
{
  v86[4] = *MEMORY[0x263EF8340];
  v83 = self;
  SEL v82 = a2;
  unint64_t v81 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v79 = 0;
  objc_storeStrong(&v79, a5);
  v5 = v83;
  v83 = 0;
  v78.receiver = v5;
  v78.super_class = (Class)CPSPausedCardView;
  v83 = [(CPSPausedCardView *)&v78 init];
  objc_storeStrong((id *)&v83, v83);
  if (v83)
  {
    id v77 = (id)[(id)objc_opt_class() createPlatterView];
    objc_storeStrong((id *)&v83->_cardPlatterView, v77);
    [(CPSPausedCardView *)v83 addSubview:v77];
    v58 = (void *)MEMORY[0x263F08938];
    id v71 = (id)[v77 leadingAnchor];
    id v70 = (id)[(CPSPausedCardView *)v83 leadingAnchor];
    id v69 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
    v86[0] = v69;
    id v68 = (id)[v77 topAnchor];
    id v67 = (id)[(CPSPausedCardView *)v83 topAnchor];
    id v66 = (id)objc_msgSend(v68, "constraintEqualToAnchor:");
    v86[1] = v66;
    id v65 = (id)[v77 trailingAnchor];
    id v64 = (id)[(CPSPausedCardView *)v83 trailingAnchor];
    id v63 = (id)objc_msgSend(v65, "constraintEqualToAnchor:");
    v86[2] = v63;
    id v62 = (id)[v77 bottomAnchor];
    id v61 = (id)[(CPSPausedCardView *)v83 bottomAnchor];
    id v60 = (id)objc_msgSend(v62, "constraintEqualToAnchor:");
    v86[3] = v60;
    id v59 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:4];
    objc_msgSend(v58, "activateConstraints:");

    id v76 = 0;
    char v75 = 0;
    if (v81 <= 1)
    {
      unint64_t v7 = v81 - 1;
      char v6 = 0;
    }
    else
    {
      unint64_t v7 = v81 - 1;
      char v6 = 1;
    }
    if ((v6 & 1) == 0)
    {
      switch(v7)
      {
        case 0uLL:
          id v8 = CPSLocalizedStringForKey(@"ARRIVED");
          id v9 = v76;
          id v76 = v8;

          char v75 = 0;
          break;
        case 1uLL:
          id v10 = CPSLocalizedStringForKey(@"LOADING");
          id v11 = v76;
          id v76 = v10;

          char v75 = 1;
          break;
        case 2uLL:
          id v12 = CPSLocalizedStringForKey(@"LOCATING");
          id v13 = v76;
          id v76 = v12;

          char v75 = 1;
          break;
        case 3uLL:
          id v14 = CPSLocalizedStringForKey(@"REROUTING");
          id v15 = v76;
          id v76 = v14;

          char v75 = 1;
          break;
        case 4uLL:
          id v16 = CPSLocalizedStringForKey(@"PROCEED_TO_ROUTE");
          id v17 = v76;
          id v76 = v16;

          char v75 = 0;
          break;
        default:
          JUMPOUT(0);
      }
    }
    if (![location length]) {
      objc_storeStrong(&location, v76);
    }
    [(CPSPausedCardView *)v83 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v74 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v74 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v45 = (id)[MEMORY[0x263F1C550] labelColor];
    objc_msgSend(v74, "setTextColor:");

    [v74 setTextAlignment:1];
    id v46 = (id)[(id)objc_opt_class() titleFont];
    objc_msgSend(v74, "setFont:");

    [v74 setText:location];
    [v74 setNumberOfLines:2];
    [v74 setMinimumScaleFactor:0.7];
    [v74 setAdjustsFontSizeToFitWidth:1];
    objc_storeStrong((id *)&v83->_title, v74);
    [v77 addSubview:v74];
    v47 = (void *)MEMORY[0x263F08938];
    id v57 = (id)[v74 leadingAnchor];
    id v56 = (id)[(CPSPausedCardView *)v83 leadingAnchor];
    id v55 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:", 9.0);
    v85[0] = v55;
    id v54 = (id)[v74 trailingAnchor];
    id v53 = (id)[(CPSPausedCardView *)v83 trailingAnchor];
    id v52 = (id)objc_msgSend(v54, "constraintEqualToAnchor:constant:", -9.0);
    v85[1] = v52;
    id v51 = (id)[v74 topAnchor];
    id v50 = (id)[(CPSPausedCardView *)v83 topAnchor];
    id v49 = (id)objc_msgSend(v51, "constraintEqualToAnchor:constant:", 10.0);
    v85[2] = v49;
    id v48 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:3];
    objc_msgSend(v47, "activateConstraints:");

    if (v75)
    {
      id v73 = (id)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
      [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_storeStrong((id *)&v83->_spinner, v73);
      [v77 addSubview:v73];
      v24 = (void *)MEMORY[0x263F08938];
      id v44 = (id)[v73 centerXAnchor];
      id v43 = (id)[(CPSPausedCardView *)v83 centerXAnchor];
      id v42 = (id)objc_msgSend(v44, "constraintEqualToAnchor:");
      v84[0] = v42;
      id v41 = (id)[v73 widthAnchor];
      id v40 = (id)objc_msgSend(v41, "constraintEqualToConstant:");
      v84[1] = v40;
      id v39 = (id)[v73 heightAnchor];
      id v38 = (id)[v39 constraintEqualToConstant:26.0];
      v84[2] = v38;
      id v37 = (id)[v73 leadingAnchor];
      id v36 = (id)[(CPSPausedCardView *)v83 leadingAnchor];
      id v35 = (id)objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:constant:", 9.0);
      v84[3] = v35;
      id v34 = (id)[v73 trailingAnchor];
      id v33 = (id)[(CPSPausedCardView *)v83 trailingAnchor];
      id v32 = (id)objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:constant:", -9.0);
      v84[4] = v32;
      id v31 = (id)[v73 topAnchor];
      id v30 = (id)[v74 lastBaselineAnchor];
      id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", 8.0);
      v84[5] = v29;
      id v28 = (id)[v73 bottomAnchor];
      id v27 = (id)[(CPSPausedCardView *)v83 bottomAnchor];
      id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:", -8.0);
      v84[6] = v26;
      id v25 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:7];
      objc_msgSend(v24, "activateConstraints:");

      [v73 startAnimating];
      objc_storeStrong(&v73, 0);
    }
    else
    {
      v20 = v83;
      id v23 = (id)[v74 bottomAnchor];
      id v22 = (id)[(CPSPausedCardView *)v83 bottomAnchor];
      id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", -10.0);
      -[CPSPausedCardView addConstraint:](v20, "addConstraint:");
    }
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v77, 0);
  }
  v19 = v83;
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v83, 0);
  return v19;
}

- (CGSize)intrinsicContentSize
{
  [(CPSPausedCardView *)self bounds];
  double v10 = CGRectGetWidth(v13) - 18.0;
  id v9 = [(CPSPausedCardView *)self title];
  id v8 = [(UILabel *)v9 text];
  unint64_t v7 = [(CPSPausedCardView *)self title];
  char v6 = [(UILabel *)v7 font];
  id v5 = (id)[(CPSPausedCardView *)self traitCollection];
  [v5 displayScale];
  CPSSizeForText(v8, v6, 0, v10, v2);

  [(CPSPausedCardView *)self bounds];
  CGRectGetWidth(v14);
  CGSizeMake();
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 16.0, *MEMORY[0x263F1D338], a2, a1);
}

+ (id)createPlatterView
{
  v5[2] = a1;
  v5[1] = (id)a2;
  double v2 = [CPSCardPlatterView alloc];
  v5[0] = -[CPSCardPlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v4 = v5[0];
  objc_storeStrong(v5, 0);

  return v4;
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void).cxx_destruct
{
}

@end