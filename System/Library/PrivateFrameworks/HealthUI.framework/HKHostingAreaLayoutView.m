@interface HKHostingAreaLayoutView
+ (id)colorBackgroundViewHostingView:(id)a3;
+ (id)viewHostingView:(id)a3;
- (BOOL)translatesAutoresizingMaskIntoConstraints;
- (CGSize)intrinsicContentSize;
- (UIView)hostedView;
- (void)setHostedView:(id)a3;
@end

@implementation HKHostingAreaLayoutView

+ (id)viewHostingView:(id)a3
{
  id v3 = a3;
  v4 = [HKHostingAreaLayoutView alloc];
  v5 = -[HKHostingAreaLayoutView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKHostingAreaLayoutView *)v5 setHostedView:v3];

  return v5;
}

+ (id)colorBackgroundViewHostingView:(id)a3
{
  id v3 = [a1 viewHostingView:a3];
  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  return v3;
}

- (BOOL)translatesAutoresizingMaskIntoConstraints
{
  return 0;
}

- (void)setHostedView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedView, a3);
  v4 = [(HKHostingAreaLayoutView *)self hostedView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(HKHostingAreaLayoutView *)self hostedView];
  [(HKHostingAreaLayoutView *)self addSubview:v5];

  v6 = [(HKHostingAreaLayoutView *)self safeAreaLayoutGuide];
  v7 = [v6 topAnchor];
  v8 = [(HKHostingAreaLayoutView *)self hostedView];
  v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [(HKHostingAreaLayoutView *)self safeAreaLayoutGuide];
  v12 = [v11 bottomAnchor];
  v13 = [(HKHostingAreaLayoutView *)self hostedView];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(HKHostingAreaLayoutView *)self safeAreaLayoutGuide];
  v17 = [v16 leadingAnchor];
  v18 = [(HKHostingAreaLayoutView *)self hostedView];
  v19 = [v18 leadingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  id v25 = [(HKHostingAreaLayoutView *)self safeAreaLayoutGuide];
  v21 = [v25 trailingAnchor];
  v22 = [(HKHostingAreaLayoutView *)self hostedView];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4FB30D8];
  v4 = [(HKHostingAreaLayoutView *)self hostedView];
  [v4 intrinsicContentSize];
  double v6 = v5;
  [(HKHostingAreaLayoutView *)self safeAreaInsets];
  double v8 = v6 + v7;
  [(HKHostingAreaLayoutView *)self safeAreaInsets];
  double v10 = v8 + v9;

  double v11 = v3;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void).cxx_destruct
{
}

@end