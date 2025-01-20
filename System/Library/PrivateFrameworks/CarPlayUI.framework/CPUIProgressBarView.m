@interface CPUIProgressBarView
- (CPUIProgressBarView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)barWidthConstraint;
- (UIColor)barColor;
- (UIColor)trackColor;
- (UIView)overallBarView;
- (UIView)progressBarView;
- (double)progress;
- (void)layoutSubviews;
- (void)setBarColor:(id)a3;
- (void)setBarWidthConstraint:(id)a3;
- (void)setOverallBarView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBarView:(id)a3;
- (void)setTrackColor:(id)a3;
@end

@implementation CPUIProgressBarView

- (CPUIProgressBarView)initWithFrame:(CGRect)a3
{
  v47[8] = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)CPUIProgressBarView;
  v3 = -[CPUIProgressBarView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(CPUIProgressBarView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F82E00]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    overallBarView = v3->_overallBarView;
    v3->_overallBarView = (UIView *)v10;

    v12 = v3->_overallBarView;
    v13 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.200000003];
    [(UIView *)v12 setBackgroundColor:v13];

    v14 = [(UIView *)v3->_overallBarView layer];
    [v14 setMasksToBounds:1];

    [(UIView *)v3->_overallBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIProgressBarView *)v3 addSubview:v3->_overallBarView];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (UIView *)v15;

    v17 = v3->_progressBarView;
    v18 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.5];
    [(UIView *)v17 setBackgroundColor:v18];

    [(UIView *)v3->_progressBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_overallBarView addSubview:v3->_progressBarView];
    v3->_progress = 0.0;
    v19 = [(UIView *)v3->_progressBarView widthAnchor];
    uint64_t v20 = [v19 constraintEqualToConstant:0.0];
    barWidthConstraint = v3->_barWidthConstraint;
    v3->_barWidthConstraint = (NSLayoutConstraint *)v20;

    v36 = (void *)MEMORY[0x263F08938];
    v45 = [(UIView *)v3->_overallBarView leadingAnchor];
    v44 = [(CPUIProgressBarView *)v3 leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v47[0] = v43;
    v42 = [(UIView *)v3->_overallBarView trailingAnchor];
    v41 = [(CPUIProgressBarView *)v3 trailingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v47[1] = v40;
    v39 = [(UIView *)v3->_overallBarView topAnchor];
    v38 = [(CPUIProgressBarView *)v3 topAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v47[2] = v37;
    v35 = [(UIView *)v3->_overallBarView bottomAnchor];
    v34 = [(CPUIProgressBarView *)v3 bottomAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v47[3] = v33;
    v32 = [(UIView *)v3->_progressBarView leadingAnchor];
    v22 = [(UIView *)v3->_overallBarView leadingAnchor];
    v23 = [v32 constraintEqualToAnchor:v22];
    v47[4] = v23;
    v24 = [(UIView *)v3->_progressBarView topAnchor];
    v25 = [(UIView *)v3->_overallBarView topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v47[5] = v26;
    v27 = [(UIView *)v3->_progressBarView bottomAnchor];
    v28 = [(UIView *)v3->_overallBarView bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v47[6] = v29;
    v47[7] = v3->_barWidthConstraint;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:8];
    [v36 activateConstraints:v30];
  }
  return v3;
}

- (UIColor)trackColor
{
  return [(UIView *)self->_overallBarView backgroundColor];
}

- (void)setTrackColor:(id)a3
{
  [(UIView *)self->_overallBarView setBackgroundColor:a3];
  [(CPUIProgressBarView *)self setNeedsDisplay];
}

- (UIColor)barColor
{
  return [(UIView *)self->_progressBarView backgroundColor];
}

- (void)setBarColor:(id)a3
{
  [(UIView *)self->_progressBarView setBackgroundColor:a3];
  [(CPUIProgressBarView *)self setNeedsDisplay];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CPUIProgressBarView;
  [(CPUIProgressBarView *)&v6 layoutSubviews];
  [(CPUIProgressBarView *)self bounds];
  CGFloat v3 = CGRectGetHeight(v7) * 0.5;
  v4 = [(CPUIProgressBarView *)self overallBarView];
  id v5 = [v4 layer];

  [v5 setCornerRadius:v3];
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  [(UIView *)self->_overallBarView frame];
  [(NSLayoutConstraint *)self->_barWidthConstraint setConstant:CGRectGetWidth(v6) * a3];
  [(CPUIProgressBarView *)self setNeedsLayout];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__CPUIProgressBarView_setProgress___block_invoke;
  v5[3] = &unk_26482D398;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:196612 delay:v5 options:0 animations:0.100000001 completion:0.0];
}

uint64_t __35__CPUIProgressBarView_setProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (UIView)overallBarView
{
  return self->_overallBarView;
}

- (void)setOverallBarView:(id)a3
{
}

- (UIView)progressBarView
{
  return self->_progressBarView;
}

- (void)setProgressBarView:(id)a3
{
}

- (NSLayoutConstraint)barWidthConstraint
{
  return self->_barWidthConstraint;
}

- (void)setBarWidthConstraint:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barWidthConstraint, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
  objc_storeStrong((id *)&self->_overallBarView, 0);
}

@end