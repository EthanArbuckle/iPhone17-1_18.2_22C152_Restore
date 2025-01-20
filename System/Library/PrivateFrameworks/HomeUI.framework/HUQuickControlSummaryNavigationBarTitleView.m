@interface HUQuickControlSummaryNavigationBarTitleView
- (HUQuickControlSummaryNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (HUQuickControlSummaryView)summaryView;
- (NSArray)contentConstraints;
- (UIView)titleView;
- (double)leadingMargin;
- (double)navigationBarMinHeight;
- (double)trailingMargin;
- (void)layoutSubviews;
- (void)setContentConstraints:(id)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setNavigationBarMinHeight:(double)a3;
- (void)setTitleView:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)updateConstraints;
- (void)updateLeadingMargin:(double)a3;
- (void)updateTitleView:(id)a3;
- (void)updateTrailingMargin:(double)a3;
@end

@implementation HUQuickControlSummaryNavigationBarTitleView

- (HUQuickControlSummaryNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlSummaryNavigationBarTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HUQuickControlSummaryView);
    objc_storeStrong((id *)&v3->_titleView, v4);
    [(UIView *)v3->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_titleView setPreservesSuperviewLayoutMargins:1];
    [(HUQuickControlSummaryNavigationBarTitleView *)v3 addSubview:v3->_titleView];
    [(_UINavigationBarTitleView *)v3 setHideStandardTitle:1];
    [(_UINavigationBarTitleView *)v3 setPreferredContentAlignment:1];
    v3->_leadingMargin = 0.0;
    v3->_trailingMargin = 40.0;
    v3->_navigationBarMinHeight = 50.0;
    if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
    {
      [(HUQuickControlSummaryNavigationBarTitleView *)v3 layoutMargins];
      double v6 = v5;
      double v8 = v7;
      [(UIView *)v3->_titleView setLayoutMargins:0.0];
      -[HUQuickControlSummaryNavigationBarTitleView setLayoutMargins:](v3, "setLayoutMargins:", 0.0, v6, 0.0, v8);
    }
  }
  return v3;
}

- (HUQuickControlSummaryView)summaryView
{
  objc_opt_class();
  v3 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return (HUQuickControlSummaryView *)v5;
}

- (void)updateTitleView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  int v6 = [v5 isEqual:v4];

  double v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v13 = 136315394;
      v14 = "-[HUQuickControlSummaryNavigationBarTitleView updateTitleView:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s Not updating titleView because same as before %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      int v13 = 136315394;
      v14 = "-[HUQuickControlSummaryNavigationBarTitleView updateTitleView:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s Updating to new titleView %@", (uint8_t *)&v13, 0x16u);
    }

    v9 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
    [v9 removeFromSuperview];

    [(HUQuickControlSummaryNavigationBarTitleView *)self setTitleView:v4];
    objc_super v10 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
    [v11 setPreservesSuperviewLayoutMargins:1];

    v12 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
    [(HUQuickControlSummaryNavigationBarTitleView *)self addSubview:v12];

    [(HUQuickControlSummaryNavigationBarTitleView *)self updateConstraints];
  }
}

- (void)updateLeadingMargin:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(HUQuickControlSummaryNavigationBarTitleView *)self leadingMargin];
  *(float *)&double v5 = v5;
  float v6 = a3;
  float v7 = vabds_f32(*(float *)&v5, v6);
  BOOL v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= 0.00000011921)
  {
    if (v9)
    {
      int v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateLeadingMargin:]";
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating to new leadingMargin %f", (uint8_t *)&v10, 0x16u);
    }

    [(HUQuickControlSummaryNavigationBarTitleView *)self setLeadingMargin:a3];
    [(HUQuickControlSummaryNavigationBarTitleView *)self updateConstraints];
  }
  else
  {
    if (v9)
    {
      int v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateLeadingMargin:]";
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s Not updating leadingMargin %f because same as before", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)updateTrailingMargin:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(HUQuickControlSummaryNavigationBarTitleView *)self trailingMargin];
  *(float *)&double v5 = v5;
  float v6 = a3;
  float v7 = vabds_f32(*(float *)&v5, v6);
  BOOL v8 = HFLogForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= 0.00000011921)
  {
    if (v9)
    {
      int v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateTrailingMargin:]";
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating to new trailingMargin %f", (uint8_t *)&v10, 0x16u);
    }

    [(HUQuickControlSummaryNavigationBarTitleView *)self setTrailingMargin:a3];
    [(HUQuickControlSummaryNavigationBarTitleView *)self updateConstraints];
  }
  else
  {
    if (v9)
    {
      int v10 = 136315394;
      v11 = "-[HUQuickControlSummaryNavigationBarTitleView updateTrailingMargin:]";
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s Not updating trailingMargin %f because same as before", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)updateConstraints
{
  v30[3] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUQuickControlSummaryNavigationBarTitleView;
  [(HUQuickControlSummaryNavigationBarTitleView *)&v29 updateConstraints];
  v3 = [(HUQuickControlSummaryNavigationBarTitleView *)self contentConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    double v5 = [(HUQuickControlSummaryNavigationBarTitleView *)self contentConstraints];
    [v4 deactivateConstraints:v5];
  }
  float v6 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  float v7 = [v6 trailingAnchor];
  BOOL v8 = [(HUQuickControlSummaryNavigationBarTitleView *)self layoutMarginsGuide];
  BOOL v9 = [v8 trailingAnchor];
  [(HUQuickControlSummaryNavigationBarTitleView *)self trailingMargin];
  v11 = [v7 constraintEqualToAnchor:v9 constant:-v10];

  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    __int16 v12 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
    double v13 = [v12 trailingAnchor];
    uint64_t v14 = [(HUQuickControlSummaryNavigationBarTitleView *)self trailingAnchor];
    [(HUQuickControlSummaryNavigationBarTitleView *)self trailingMargin];
    uint64_t v16 = [v13 constraintEqualToAnchor:v14 constant:-v15];

    v11 = (void *)v16;
  }
  v28 = v11;
  uint64_t v17 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  v18 = [v17 leadingAnchor];
  v19 = [(HUQuickControlSummaryNavigationBarTitleView *)self leadingAnchor];
  [(HUQuickControlSummaryNavigationBarTitleView *)self leadingMargin];
  v20 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
  v30[0] = v20;
  v30[1] = v11;
  v21 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  v22 = [v21 topAnchor];
  v23 = [(HUQuickControlSummaryNavigationBarTitleView *)self topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v30[2] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  [(HUQuickControlSummaryNavigationBarTitleView *)self setContentConstraints:v25];

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(HUQuickControlSummaryNavigationBarTitleView *)self contentConstraints];
  [v26 activateConstraints:v27];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlSummaryNavigationBarTitleView;
  [(HUQuickControlSummaryNavigationBarTitleView *)&v13 layoutSubviews];
  char v3 = [MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials];
  [(HUQuickControlSummaryNavigationBarTitleView *)self navigationBarMinHeight];
  double v5 = v4;
  float v6 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  [v6 frame];
  double v8 = v7;
  if ((v3 & 1) == 0)
  {
    [(HUQuickControlSummaryNavigationBarTitleView *)self layoutMargins];
    double v10 = v8 + v9;
    [(HUQuickControlSummaryNavigationBarTitleView *)self layoutMargins];
    double v8 = v10 + v11;
  }

  if (v5 >= v8) {
    double v12 = v5;
  }
  else {
    double v12 = v8;
  }
  [(_UINavigationBarTitleView *)self setHeight:v12];
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  BOOL v4 = !a4;
  id v5 = [(HUQuickControlSummaryNavigationBarTitleView *)self titleView];
  [v5 setHidden:v4];
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (void)setContentConstraints:(id)a3
{
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (double)navigationBarMinHeight
{
  return self->_navigationBarMinHeight;
}

- (void)setNavigationBarMinHeight:(double)a3
{
  self->_navigationBarMinHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConstraints, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

@end