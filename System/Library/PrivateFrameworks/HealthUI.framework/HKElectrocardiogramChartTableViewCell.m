@interface HKElectrocardiogramChartTableViewCell
- (CGSize)gridSize;
- (HKElectrocardiogramAxisView)axisView;
- (HKElectrocardiogramChartTableViewCell)initWithGridSize:(CGSize)a3 reuseIdentifier:(id)a4;
- (HKElectrocardiogramChartView)chartView;
- (HKElectrocardiogramInfoView)infoView;
- (UIScrollView)scrollView;
- (void)_setUpScrollViewContent;
- (void)_setUpUI;
- (void)_updateMargins;
- (void)layoutMarginsDidChange;
- (void)setAxisView:(id)a3;
- (void)setChartView:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setScrollView:(id)a3;
@end

@implementation HKElectrocardiogramChartTableViewCell

- (HKElectrocardiogramChartTableViewCell)initWithGridSize:(CGSize)a3 reuseIdentifier:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v26.receiver = self;
  v26.super_class = (Class)HKElectrocardiogramChartTableViewCell;
  v6 = [(HKElectrocardiogramChartTableViewCell *)&v26 initWithStyle:0 reuseIdentifier:a4];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1BE0]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    scrollView = v6->_scrollView;
    v6->_scrollView = (UIScrollView *)v8;

    v10 = -[HKElectrocardiogramChartView initWithGridSize:]([HKElectrocardiogramChartView alloc], "initWithGridSize:", width, height);
    chartView = v6->_chartView;
    v6->_chartView = v10;

    v12 = [HKElectrocardiogramAxisView alloc];
    [(HKElectrocardiogramChartView *)v6->_chartView pointsPerSecond];
    double v14 = v13;
    v15 = [(HKElectrocardiogramChartView *)v6->_chartView gridOptions];
    v16 = [v15 firstObject];
    v17 = [v16 lineColor];
    v18 = [(HKElectrocardiogramChartView *)v6->_chartView gridOptions];
    v19 = [v18 firstObject];
    [v19 lineWidth];
    uint64_t v21 = [(HKElectrocardiogramAxisView *)v12 initWithAxisSpacing:v17 lineColor:v14 lineWidth:v20];
    axisView = v6->_axisView;
    v6->_axisView = (HKElectrocardiogramAxisView *)v21;

    v23 = objc_alloc_init(HKElectrocardiogramInfoView);
    infoView = v6->_infoView;
    v6->_infoView = v23;

    [(HKElectrocardiogramChartTableViewCell *)v6 _setUpUI];
  }
  return v6;
}

- (void)_setUpUI
{
  v47[7] = *MEMORY[0x1E4F143B8];
  [(HKElectrocardiogramChartTableViewCell *)self _setUpScrollViewContent];
  v3 = [(HKElectrocardiogramChartTableViewCell *)self infoView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  v5 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  [v4 addSubview:v5];

  v6 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  id v7 = [(HKElectrocardiogramChartTableViewCell *)self infoView];
  [v6 addSubview:v7];

  v30 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v44 = [v46 topAnchor];
  v45 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  v43 = [v45 topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:20.0];
  v47[0] = v42;
  v41 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v39 = [v41 bottomAnchor];
  v40 = [(HKElectrocardiogramChartTableViewCell *)self infoView];
  v38 = [v40 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v47[1] = v37;
  v36 = [(HKElectrocardiogramChartTableViewCell *)self infoView];
  v34 = [v36 bottomAnchor];
  v35 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  v33 = [v35 bottomAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v47[2] = v32;
  v31 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v28 = [v31 leftAnchor];
  v29 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  v27 = [v29 leftAnchor];
  objc_super v26 = [v28 constraintEqualToAnchor:v27];
  v47[3] = v26;
  v25 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v23 = [v25 rightAnchor];
  v24 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  v22 = [v24 rightAnchor];
  uint64_t v21 = [v23 constraintEqualToAnchor:v22];
  v47[4] = v21;
  double v20 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  v19 = [v20 layoutMarginsGuide];
  v17 = [v19 leadingAnchor];
  v18 = [(HKElectrocardiogramChartTableViewCell *)self infoView];
  uint64_t v8 = [v18 leadingAnchor];
  v9 = [v17 constraintEqualToAnchor:v8];
  v47[5] = v9;
  v10 = [(HKElectrocardiogramChartTableViewCell *)self infoView];
  v11 = [v10 trailingAnchor];
  v12 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  double v13 = [v12 layoutMarginsGuide];
  double v14 = [v13 trailingAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  v47[6] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:7];
  [v30 activateConstraints:v16];

  [(HKElectrocardiogramChartTableViewCell *)self setSelectionStyle:0];
  [(HKElectrocardiogramChartTableViewCell *)self _updateMargins];
}

- (void)_setUpScrollViewContent
{
  v3 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v4 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  [v3 addSubview:v4];

  v5 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v6 = [(HKElectrocardiogramChartTableViewCell *)self axisView];
  [v5 addSubview:v6];

  id v7 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  [v7 setClipsToBounds:0];

  uint64_t v8 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HKElectrocardiogramChartTableViewCell *)self axisView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  [v11 setShowsHorizontalScrollIndicator:0];

  v12 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  [v12 setShowsVerticalScrollIndicator:0];

  double v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  double v14 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  [v14 setBackgroundColor:v13];

  v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appTintColor");
  v16 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  [v16 setTintColor:v15];

  v17 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  [v17 gridSize];
  double v19 = v18;
  double v20 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  uint64_t v21 = [v20 gridOptions];
  v22 = [v21 firstObject];
  double v23 = v19 * (double)(unint64_t)[v22 unitMultiple];

  v24 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  v25 = [v24 heightAnchor];
  objc_super v26 = [v25 constraintEqualToConstant:v23];
  [v26 setActive:1];

  v27 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  v28 = [v27 topAnchor];
  v29 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v30 = [v29 frameLayoutGuide];
  v31 = [v30 topAnchor];
  v32 = [v28 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  v34 = [v33 leftAnchor];
  v35 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v36 = [v35 contentLayoutGuide];
  v37 = [v36 leftAnchor];
  v38 = [v34 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  v40 = [v39 rightAnchor];
  v41 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v42 = [v41 contentLayoutGuide];
  v43 = [v42 rightAnchor];
  v44 = [v40 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(HKElectrocardiogramChartTableViewCell *)self axisView];
  v46 = [v45 topAnchor];
  v47 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  v48 = [v47 bottomAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v51 = [v50 frameLayoutGuide];
  v52 = [v51 bottomAnchor];
  v53 = [(HKElectrocardiogramChartTableViewCell *)self axisView];
  v54 = [v53 bottomAnchor];
  v55 = [v52 constraintEqualToAnchor:v54];
  [v55 setActive:1];

  v56 = [(HKElectrocardiogramChartTableViewCell *)self axisView];
  v57 = [v56 leftAnchor];
  v58 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v59 = [v58 contentLayoutGuide];
  v60 = [v59 leftAnchor];
  v61 = [v57 constraintEqualToAnchor:v60];
  [v61 setActive:1];

  v62 = [(HKElectrocardiogramChartTableViewCell *)self axisView];
  v63 = [v62 rightAnchor];
  v64 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v65 = [v64 contentLayoutGuide];
  v66 = [v65 rightAnchor];
  v67 = [v63 constraintEqualToAnchor:v66];
  [v67 setActive:1];

  id v74 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v68 = [v74 contentLayoutGuide];
  v69 = [v68 heightAnchor];
  v70 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  v71 = [v70 frameLayoutGuide];
  v72 = [v71 heightAnchor];
  v73 = [v69 constraintEqualToAnchor:v72 multiplier:1.0];
  [v73 setActive:1];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramChartTableViewCell;
  [(HKElectrocardiogramChartTableViewCell *)&v3 layoutMarginsDidChange];
  [(HKElectrocardiogramChartTableViewCell *)self _updateMargins];
}

- (void)_updateMargins
{
  objc_super v3 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  [v8 directionalLayoutMargins];
  double v10 = v9;

  v11 = [(HKElectrocardiogramChartTableViewCell *)self contentView];
  [v11 directionalLayoutMargins];
  double v13 = v12;

  id v14 = [(HKElectrocardiogramChartTableViewCell *)self scrollView];
  objc_msgSend(v14, "setContentInset:", v5, v10, v7, v13);
}

- (CGSize)gridSize
{
  v2 = [(HKElectrocardiogramChartTableViewCell *)self chartView];
  [v2 gridSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (HKElectrocardiogramChartView)chartView
{
  return self->_chartView;
}

- (void)setChartView:(id)a3
{
}

- (HKElectrocardiogramInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (HKElectrocardiogramAxisView)axisView
{
  return self->_axisView;
}

- (void)setAxisView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
}

@end