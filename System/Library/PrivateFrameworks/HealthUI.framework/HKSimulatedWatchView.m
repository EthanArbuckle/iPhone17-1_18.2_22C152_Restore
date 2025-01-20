@interface HKSimulatedWatchView
- (HKSimulatedWatchView)initWithIconImage:(id)a3 titleText:(id)a4 detailText:(id)a5 tintColor:(id)a6;
- (HKSimulatedWatchView)initWithWatchView:(id)a3;
- (UIView)containerView;
- (UIView)watchScreenView;
- (void)layoutSubviews;
- (void)setContainerView:(id)a3;
- (void)setWatchScreenView:(id)a3;
@end

@implementation HKSimulatedWatchView

- (HKSimulatedWatchView)initWithWatchView:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKSimulatedWatchView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[HKSimulatedWatchView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  if (v10)
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
    containerView = v10->_containerView;
    v10->_containerView = (UIView *)v11;

    objc_storeStrong((id *)&v10->_watchScreenView, a3);
    v13 = (void *)MEMORY[0x1E4FB1818];
    v14 = HKHealthUIFrameworkBundle();
    v15 = [v13 imageNamed:@"simulated_watch" inBundle:v14 compatibleWithTraitCollection:0];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15];
    [(HKSimulatedWatchView *)v10 addSubview:v16];
    [(UIView *)v10->_containerView addSubview:v10->_watchScreenView];
    v17 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v10->_containerView setBackgroundColor:v17];

    [(HKSimulatedWatchView *)v10 addSubview:v10->_containerView];
    [(UIView *)v10->_watchScreenView setContentMode:2];
    [(HKSimulatedWatchView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 size];
    -[UIView hk_constraintAspectRatioFromSize:](v10, "hk_constraintAspectRatioFromSize:");
    objc_msgSend(v16, "hk_alignConstraintsWithView:", v10);
  }
  return v10;
}

- (HKSimulatedWatchView)initWithIconImage:(id)a3 titleText:(id)a4 detailText:(id)a5 tintColor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[HKSimulatedWatchNotificationQuickLookView alloc] initWithIconImage:v13 titleText:v12 detailText:v11 tintColor:v10];

  v15 = [(HKSimulatedWatchView *)self initWithWatchView:v14];
  return v15;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)HKSimulatedWatchView;
  [(HKSimulatedWatchView *)&v20 layoutSubviews];
  [(HKSimulatedWatchView *)self bounds];
  double v4 = v3 * 0.139;
  double v6 = v5 * 0.249;
  double v7 = v3 * 0.724;
  double v8 = v5 * 0.5;
  double v9 = [(HKSimulatedWatchView *)self containerView];
  objc_msgSend(v9, "setFrame:", v4, v6, v7, v8);

  [(UIView *)self->_containerView bounds];
  double MidX = CGRectGetMidX(v21);
  [(UIView *)self->_containerView bounds];
  double MidY = CGRectGetMidY(v22);
  id v12 = [(HKSimulatedWatchView *)self watchScreenView];
  objc_msgSend(v12, "setCenter:", MidX, MidY);

  [(UIView *)self->_containerView frame];
  double v14 = v13 / 156.0;
  [(UIView *)self->_containerView frame];
  double v16 = v15 / 195.0;
  if (v14 < v15 / 195.0) {
    double v16 = v14;
  }
  CGAffineTransformMakeScale(&v19, v16, v16);
  v17 = [(HKSimulatedWatchView *)self watchScreenView];
  CGAffineTransform v18 = v19;
  [v17 setTransform:&v18];
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)watchScreenView
{
  return self->_watchScreenView;
}

- (void)setWatchScreenView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchScreenView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end