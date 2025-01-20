@interface DisplayFilterPageGridViewController
- (DisplayFilterPageGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSMutableArray)labelHeightConstraints;
- (NSMutableArray)pageHeightConstraints;
- (NSMutableArray)swatchHeightConstraints;
- (NSMutableArray)swatchWidthConstraints;
- (id)_dynamicPreviewView;
- (void)_updateConstraints;
- (void)loadView;
- (void)setLabelHeightConstraints:(id)a3;
- (void)setPageHeight:(double)a3;
- (void)setPageHeightConstraints:(id)a3;
- (void)setSwatchHeightConstraints:(id)a3;
- (void)setSwatchWidthConstraints:(id)a3;
@end

@implementation DisplayFilterPageGridViewController

- (DisplayFilterPageGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)DisplayFilterPageGridViewController;
  v4 = [(DisplayFilterPageGridViewController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    pageHeightConstraints = v4->_pageHeightConstraints;
    v4->_pageHeightConstraints = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    swatchWidthConstraints = v4->_swatchWidthConstraints;
    v4->_swatchWidthConstraints = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    swatchHeightConstraints = v4->_swatchHeightConstraints;
    v4->_swatchHeightConstraints = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    labelHeightConstraints = v4->_labelHeightConstraints;
    v4->_labelHeightConstraints = (NSMutableArray *)v11;
  }
  return v4;
}

- (void)setPageHeight:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DisplayFilterPageGridViewController;
  [(DisplayFilterPageViewController *)&v5 setPageHeight:a3];
  id v4 = [(DisplayFilterPageGridViewController *)self view];
  [(DisplayFilterPageGridViewController *)self _updateConstraints];
}

- (void)_updateConstraints
{
  [(DisplayFilterPageViewController *)self pageHeight];
  double v4 = floor(v3 / 6.0);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  objc_super v5 = [(DisplayFilterPageGridViewController *)self swatchWidthConstraints];
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * (void)v9) setConstant:v4 * 6.0 / 3.0];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = [(DisplayFilterPageGridViewController *)self swatchHeightConstraints];
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      objc_super v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)v14) setConstant:v4];
        objc_super v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = [(DisplayFilterPageGridViewController *)self labelHeightConstraints];
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * (void)v19) setConstant:v4];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = [(DisplayFilterPageGridViewController *)self pageHeightConstraints];
  id v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)v24) setConstant:v4 * 6.0];
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (id)_dynamicPreviewView
{
  id v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  id v4 = objc_alloc((Class)UIStackView);
  [v3 bounds];
  id v5 = objc_msgSend(v4, "initWithFrame:");
  [v5 setAxis:1];
  [v5 setSpacing:0.0];
  [v5 setAlignment:4];
  [v5 setAutoresizingMask:18];
  v78 = v5;
  [v3 addSubview:v5];
  [v3 setIsAccessibilityElement:1];
  id v6 = settingsLocString(@"DISPLAY_FILTER_PREVIEW_AX_LABEL", @"Accessibility");
  v77 = v3;
  [v3 setAccessibilityLabel:v6];

  v72 = +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:0.6];
  v97[0] = v72;
  v85 = +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  v97[1] = v85;
  v83 = +[UIColor colorWithRed:0.878431373 green:0.0235294118 blue:0.105882353 alpha:1.0];
  v97[2] = v83;
  v81 = +[NSArray arrayWithObjects:v97 count:3];
  v98[0] = v81;
  v79 = +[UIColor colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:0.6];
  v96[0] = v79;
  v75 = +[UIColor colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
  v96[1] = v75;
  v74 = +[UIColor colorWithRed:0.937254902 green:0.337254902 blue:0.00784313725 alpha:1.0];
  v96[2] = v74;
  v73 = +[NSArray arrayWithObjects:v96 count:3];
  v98[1] = v73;
  v71 = +[UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:0.6];
  v95[0] = v71;
  v70 = +[UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0];
  v95[1] = v70;
  v69 = +[UIColor colorWithRed:0.949019608 green:0.71372549 blue:0.0 alpha:1.0];
  v95[2] = v69;
  v68 = +[NSArray arrayWithObjects:v95 count:3];
  v98[2] = v68;
  v67 = +[UIColor colorWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:0.6];
  v94[0] = v67;
  v66 = +[UIColor colorWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:1.0];
  v94[1] = v66;
  v65 = +[UIColor colorWithRed:0.0 green:0.490196078 blue:0.105882353 alpha:1.0];
  v94[2] = v65;
  v64 = +[NSArray arrayWithObjects:v94 count:3];
  v98[3] = v64;
  id v7 = +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:0.6];
  v93[0] = v7;
  uint64_t v8 = +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  v93[1] = v8;
  uint64_t v9 = +[UIColor colorWithRed:0.0 green:0.250980392 blue:0.866666667 alpha:1.0];
  v93[2] = v9;
  v10 = +[NSArray arrayWithObjects:v93 count:3];
  v98[4] = v10;
  id v11 = +[UIColor colorWithRed:0.8 green:0.607843137 blue:0.882352941 alpha:0.6];
  v92[0] = v11;
  id v12 = +[UIColor colorWithRed:0.8 green:0.607843137 blue:0.882352941 alpha:1.0];
  v92[1] = v12;
  uint64_t v13 = +[UIColor colorWithRed:0.717647059 green:0.0 blue:0.815686275 alpha:1.0];
  v92[2] = v13;
  objc_super v14 = +[NSArray arrayWithObjects:v92 count:3];
  v98[5] = v14;
  v76 = +[NSArray arrayWithObjects:v98 count:6];

  id v15 = [&off_22BED0 count];
  double height = UILayoutFittingCompressedSize.height;
  if (v15)
  {
    id v17 = 0;
    uint64_t v18 = 0;
    do
    {
      v19 = v17;
      v20 = [&off_22BED0 objectAtIndexedSubscript:v18];
      uint64_t v21 = settingsLocString(v20, @"Accessibility");

      uint64_t v86 = v18;
      id v22 = [v76 objectAtIndexedSubscript:v18];
      id v23 = objc_alloc((Class)UIStackView);
      [v77 bounds];
      id v24 = objc_msgSend(v23, "initWithFrame:");
      [v24 setAxis:0];
      [v24 setSpacing:0.0];
      [v24 setAlignment:4];
      [v24 setAutoresizingMask:18];
      [v78 addArrangedSubview:v24];
      id v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 50.0, 10.0);
      id v26 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 50.0, 10.0);
      long long v27 = +[UIFont boldSystemFontOfSize:15.0];
      [v26 setFont:v27];

      v84 = (void *)v21;
      [v26 setText:v21];
      [v25 addSubview:v26];
      [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v28 = v25;
      long long v29 = +[NSLayoutConstraint constraintWithItem:v26 attribute:3 relatedBy:0 toItem:v28 attribute:3 multiplier:1.0 constant:5.0];
      [v28 addConstraint:v29];

      id v30 = v28;
      long long v31 = +[NSLayoutConstraint constraintWithItem:v26 attribute:4 relatedBy:0 toItem:v30 attribute:4 multiplier:1.0 constant:-5.0];
      [v30 addConstraint:v31];

      id v32 = v30;
      long long v33 = +[NSLayoutConstraint constraintWithItem:v26 attribute:5 relatedBy:0 toItem:v32 attribute:5 multiplier:1.0 constant:0.0];
      [v32 addConstraint:v33];

      id v34 = v32;
      v82 = v26;
      long long v35 = +[NSLayoutConstraint constraintWithItem:v26 attribute:6 relatedBy:0 toItem:v34 attribute:6 multiplier:1.0 constant:-10.0];
      [v34 addConstraint:v35];

      objc_msgSend(v34, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      double v37 = v36;
      id v17 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 8, 0, 0, 8, 1.0);

      [v34 addConstraint:v17];
      long long v38 = [(DisplayFilterPageGridViewController *)self labelHeightConstraints];
      [v38 addObject:v17];

      v80 = v34;
      [v24 addArrangedSubview:v34];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v39 = v22;
      id v40 = [v39 countByEnumeratingWithState:&v87 objects:v91 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v88;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v88 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v87 + 1) + 8 * i);
            id v45 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v37, v37);
            [v45 setBackgroundColor:v44];
            [v24 addArrangedSubview:v45];
            v46 = +[NSLayoutConstraint constraintWithItem:v45 attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:v37];

            [v45 addConstraint:v46];
            v47 = [(DisplayFilterPageGridViewController *)self swatchWidthConstraints];
            [v47 addObject:v46];

            id v17 = +[NSLayoutConstraint constraintWithItem:v45 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:v37];

            [v45 addConstraint:v17];
            v48 = [(DisplayFilterPageGridViewController *)self swatchHeightConstraints];
            [v48 addObject:v17];
          }
          id v41 = [v39 countByEnumeratingWithState:&v87 objects:v91 count:16];
        }
        while (v41);
      }

      uint64_t v18 = v86 + 1;
    }
    while (v86 + 1 < (unint64_t)[&off_22BED0 count]);
  }
  objc_msgSend(v78, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
  double v50 = v49;
  [v77 frame];
  [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v51 = v77;
  v52 = +[NSLayoutConstraint constraintWithItem:v78 attribute:3 relatedBy:0 toItem:v51 attribute:3 multiplier:1.0 constant:0.0];
  [v51 addConstraint:v52];

  id v53 = v51;
  v54 = +[NSLayoutConstraint constraintWithItem:v78 attribute:4 relatedBy:0 toItem:v53 attribute:4 multiplier:1.0 constant:0.0];
  [v53 addConstraint:v54];

  id v55 = v53;
  v56 = +[NSLayoutConstraint constraintWithItem:v78 attribute:5 relatedBy:0 toItem:v55 attribute:5 multiplier:1.0 constant:0.0];
  [v55 addConstraint:v56];

  id v57 = v55;
  v58 = +[NSLayoutConstraint constraintWithItem:v78 attribute:6 relatedBy:0 toItem:v57 attribute:6 multiplier:1.0 constant:0.0];
  [v57 addConstraint:v58];

  v59 = +[NSLayoutConstraint constraintWithItem:v57 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:v50];
  [v57 addConstraint:v59];
  v60 = [(DisplayFilterPageGridViewController *)self pageHeightConstraints];
  [v60 addObject:v59];

  v61 = +[NSLayoutConstraint constraintWithItem:v78 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:v50];

  [v78 addConstraint:v61];
  v62 = [(DisplayFilterPageGridViewController *)self pageHeightConstraints];
  [v62 addObject:v61];

  return v57;
}

- (void)loadView
{
  id v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 600.0, 600.0);
  [(DisplayFilterPageGridViewController *)self setView:v3];
  id v4 = [(DisplayFilterPageGridViewController *)self _dynamicPreviewView];
  [v3 addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = v3;
  id v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v6];

  id v8 = v5;
  id v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:v8 attribute:10 multiplier:1.0 constant:0.0];
  [v8 addConstraint:v7];
}

- (NSMutableArray)pageHeightConstraints
{
  return self->_pageHeightConstraints;
}

- (void)setPageHeightConstraints:(id)a3
{
}

- (NSMutableArray)swatchHeightConstraints
{
  return self->_swatchHeightConstraints;
}

- (void)setSwatchHeightConstraints:(id)a3
{
}

- (NSMutableArray)labelHeightConstraints
{
  return self->_labelHeightConstraints;
}

- (void)setLabelHeightConstraints:(id)a3
{
}

- (NSMutableArray)swatchWidthConstraints
{
  return self->_swatchWidthConstraints;
}

- (void)setSwatchWidthConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchWidthConstraints, 0);
  objc_storeStrong((id *)&self->_labelHeightConstraints, 0);
  objc_storeStrong((id *)&self->_swatchHeightConstraints, 0);

  objc_storeStrong((id *)&self->_pageHeightConstraints, 0);
}

@end