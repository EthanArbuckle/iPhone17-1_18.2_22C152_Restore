@interface SetupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 shouldSetSize:(BOOL)a4;
- (SetupView)initWithFrame:(CGRect)a3;
- (id)_preferenceLabelWithText:(id)a3;
- (id)icon;
- (id)title;
- (void)addStep:(id)a3;
- (void)layoutSubviews;
- (void)setIcon:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SetupView

- (SetupView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SetupView;
  v3 = -[SetupView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(SetupView *)v3 setBackgroundColor:v4];

    [(SetupView *)v3 setAutoresizingMask:2];
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    setupSteps = v3->_setupSteps;
    v3->_setupSteps = v5;

    v7 = [MEMORY[0x263F82438] sharedApplication];
    v3->_layoutDirection = [v7 userInterfaceLayoutDirection];
  }
  return v3;
}

- (id)_preferenceLabelWithText:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = PreferencesTableViewFooterFont();
  [v6 setFont:v7];

  v8 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v6 setTextColor:v8];

  objc_super v9 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v9];

  [v6 setLineBreakMode:0];
  [v6 setNumberOfLines:0];
  [v6 setText:v4];

  return v6;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  title = self->_title;
  id v11 = v4;
  if (title)
  {
    [(UILabel *)title removeFromSuperview];
    v6 = self->_title;
    self->_title = 0;

    id v4 = v11;
  }
  if (v4)
  {
    v7 = [(SetupView *)self _preferenceLabelWithText:v11];
    v8 = self->_title;
    self->_title = v7;

    objc_super v9 = PreferencesTableViewHeaderFont();
    [(UILabel *)self->_title setFont:v9];

    v10 = PreferencesTableViewHeaderColor();
    [(UILabel *)self->_title setTextColor:v10];

    [(SetupView *)self addSubview:self->_title];
  }

  MEMORY[0x270F9A758]();
}

- (id)title
{
  return [(UILabel *)self->_title text];
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  icon = self->_icon;
  id v11 = v4;
  if (icon)
  {
    [(UIImageView *)icon removeFromSuperview];
    v6 = self->_icon;
    self->_icon = 0;

    id v4 = v11;
  }
  if (v4)
  {
    v7 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v11];
    v8 = self->_icon;
    self->_icon = v7;

    [(UIImageView *)self->_icon setContentMode:4];
    objc_super v9 = self->_icon;
    v10 = [MEMORY[0x263F825C8] labelColor];
    [(UIImageView *)v9 setTintColor:v10];

    [(SetupView *)self addSubview:self->_icon];
  }

  MEMORY[0x270F9A758]();
}

- (id)icon
{
  return [(UIImageView *)self->_icon image];
}

- (void)addStep:(id)a3
{
  id v4 = NSString;
  setupSteps = self->_setupSteps;
  id v6 = a3;
  objc_msgSend(v4, "stringWithFormat:", @"STEP_%lu", -[NSMutableArray count](setupSteps, "count") + 1);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:v13 value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  objc_super v9 = [(SetupView *)self _preferenceLabelWithText:v8];

  v10 = [(SetupView *)self _preferenceLabelWithText:v6];

  if (self->_layoutDirection == 1) {
    [v10 setTextAlignment:2];
  }
  id v11 = self->_setupSteps;
  v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v9, v10, 0);
  [(NSMutableArray *)v11 addObject:v12];

  [(SetupView *)self addSubview:v9];
  [(SetupView *)self addSubview:v10];
}

- (CGSize)sizeThatFits:(CGSize)a3 shouldSetSize:(BOOL)a4
{
  BOOL v76 = a4;
  double width = a3.width;
  id v5 = self;
  v84[1] = *MEMORY[0x263EF8340];
  [(UIImageView *)self->_icon frame];
  if (width >= v6 + 20.0 + 15.0)
  {
    int64_t layoutDirection = v5->_layoutDirection;
    v86.size.double height = 1.79769313e308;
    v86.origin.double x = 5.0;
    v86.origin.double y = 0.0;
    double v71 = width;
    v86.size.double width = width;
    CGRect v87 = CGRectInset(v86, 10.0, 5.0);
    double x = v87.origin.x;
    double y = v87.origin.y;
    double v12 = v87.size.width;
    double height = v87.size.height;
    icon = v5->_icon;
    if (icon)
    {
      [(UIImageView *)icon frame];
      CGFloat v16 = v15;
      double v17 = x;
      if (layoutDirection == 1)
      {
        [(UIImageView *)v5->_icon frame];
        double v17 = v12 - v18;
      }
      if (v76)
      {
        v88.size.double width = 40.0;
        v88.origin.double x = v17;
        v88.origin.double y = y;
        v88.size.double height = v16;
        CGRect v89 = CGRectIntegral(v88);
        -[UIImageView setFrame:](v5->_icon, "setFrame:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
      }
      if (layoutDirection != 1) {
        double x = v17 + 40.0 + 15.0;
      }
      double v12 = v12 + -40.0 + -15.0;
    }
    title = v5->_title;
    v20 = (uint64_t *)MEMORY[0x263F814F0];
    unint64_t v21 = 0x263EFF000uLL;
    if (title)
    {
      v22 = [(UILabel *)title text];
      uint64_t v83 = *v20;
      v23 = [(UILabel *)v5->_title font];
      v84[0] = v23;
      v24 = [NSDictionary dictionaryWithObjects:v84 forKeys:&v83 count:1];
      objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v12, height);
      double v26 = v25;
      double v28 = v27;

      if (v76)
      {
        double v29 = v12 - v26;
        if (layoutDirection != 1) {
          double v29 = x;
        }
        double v30 = y;
        double v31 = v26;
        double v32 = v28;
        CGRect v90 = CGRectIntegral(*(CGRect *)&v29);
        -[UILabel setFrame:](v5->_title, "setFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
      }
      double y = y + v28 + 5.0;
      double height = height - v28 + -5.0;
    }
    if ([(NSMutableArray *)v5->_setupSteps count])
    {
      double v72 = x;
      int64_t v75 = layoutDirection;
      uint64_t v33 = 0;
      uint64_t v34 = *v20;
      unsigned int v35 = 1;
      double v74 = v12;
      uint64_t v73 = *v20;
      do
      {
        v36 = v5;
        v37 = [(NSMutableArray *)v5->_setupSteps objectAtIndex:v33];
        v38 = [v37 objectAtIndex:0];
        v39 = [v37 objectAtIndex:1];
        v40 = [v38 text];
        uint64_t v81 = v34;
        [v38 font];
        v42 = uint64_t v41 = v34;
        v82 = v42;
        [*(id *)(v21 + 2352) dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        v44 = unint64_t v43 = v21;
        objc_msgSend(v40, "boundingRectWithSize:options:attributes:context:", 0, v44, 0, v12, height);
        double v46 = v45;
        CGFloat v48 = v47;

        if (v75 == 1)
        {
          double v49 = v12 - v46;
          v50 = [v39 text];
          uint64_t v79 = v41;
          v51 = [v39 font];
          v80 = v51;
          v52 = [*(id *)(v43 + 2352) dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          objc_msgSend(v50, "boundingRectWithSize:options:attributes:context:", 1, v52, 0, v12 - v46 + -10.0, height);
          double v54 = v53;
          double v56 = v55;

          double v57 = v49 - v54 + -5.0;
        }
        else
        {
          double v49 = v72;
          double v57 = v72 + v46 + 5.0;
          v58 = [v39 text];
          uint64_t v77 = v41;
          v59 = [v39 font];
          v78 = v59;
          v60 = [*(id *)(v43 + 2352) dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          objc_msgSend(v58, "boundingRectWithSize:options:attributes:context:", 1, v60, 0, v12 - v46 + -5.0, height);
          double v54 = v61;
          double v56 = v62;
        }
        id v5 = v36;
        if (v76)
        {
          v91.origin.double x = v49;
          v91.origin.double y = y;
          v91.size.double width = v46;
          v91.size.double height = v48;
          CGRect v92 = CGRectIntegral(v91);
          objc_msgSend(v38, "setFrame:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
          v93.origin.double x = v57;
          v93.origin.double y = y;
          v93.size.double width = v54;
          v93.size.double height = v56;
          CGRect v94 = CGRectIntegral(v93);
          objc_msgSend(v39, "setFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
        }
        double y = y + v56 + 5.0;
        double height = height - v56 + -5.0;

        uint64_t v33 = v35;
        BOOL v63 = [(NSMutableArray *)v36->_setupSteps count] > (unint64_t)v35++;
        double v12 = v74;
        unint64_t v21 = 0x263EFF000;
        uint64_t v34 = v73;
      }
      while (v63);
    }
    [*(id *)((char *)&v5->super.super.super.isa + v70) frame];
    double v65 = v64;
    [*(id *)((char *)&v5->super.super.super.isa + v70) frame];
    if (y >= v65 + v66) {
      double v67 = y;
    }
    else {
      double v67 = v65 + v66;
    }
    float v68 = v71;
    double v7 = ceilf(v68);
    float v69 = v67 + 5.0;
    double v8 = ceilf(v69);
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SetupView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SetupView;
  [(SetupView *)&v5 layoutSubviews];
  [(SetupView *)self bounds];
  -[SetupView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 1, v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_setupSteps, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end