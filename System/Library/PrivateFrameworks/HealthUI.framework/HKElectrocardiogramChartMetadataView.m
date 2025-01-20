@interface HKElectrocardiogramChartMetadataView
- (CGSize)gridSize;
- (HKElectrocardiogramAxisView)axisView;
- (HKElectrocardiogramChartMetadataView)initWithGridSize:(CGSize)a3;
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

@implementation HKElectrocardiogramChartMetadataView

- (HKElectrocardiogramChartMetadataView)initWithGridSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v28.receiver = self;
  v28.super_class = (Class)HKElectrocardiogramChartMetadataView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[HKElectrocardiogramChartMetadataView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v5, v6, v7, v8);
    scrollView = v9->_scrollView;
    v9->_scrollView = (UIScrollView *)v10;

    v12 = -[HKElectrocardiogramChartView initWithGridSize:]([HKElectrocardiogramChartView alloc], "initWithGridSize:", width, height);
    chartView = v9->_chartView;
    v9->_chartView = v12;

    v14 = [HKElectrocardiogramAxisView alloc];
    [(HKElectrocardiogramChartView *)v9->_chartView pointsPerSecond];
    double v16 = v15;
    v17 = [(HKElectrocardiogramChartView *)v9->_chartView gridOptions];
    v18 = [v17 firstObject];
    v19 = [v18 lineColor];
    v20 = [(HKElectrocardiogramChartView *)v9->_chartView gridOptions];
    v21 = [v20 firstObject];
    [v21 lineWidth];
    uint64_t v23 = [(HKElectrocardiogramAxisView *)v14 initWithAxisSpacing:v19 lineColor:v16 lineWidth:v22];
    axisView = v9->_axisView;
    v9->_axisView = (HKElectrocardiogramAxisView *)v23;

    v25 = objc_alloc_init(HKElectrocardiogramInfoView);
    infoView = v9->_infoView;
    v9->_infoView = v25;

    [(HKElectrocardiogramChartMetadataView *)v9 _setUpUI];
  }
  return v9;
}

- (void)_setUpUI
{
  v39[7] = *MEMORY[0x1E4F143B8];
  [(HKElectrocardiogramChartMetadataView *)self _setUpScrollViewContent];
  v3 = [(HKElectrocardiogramChartMetadataView *)self infoView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  [(HKElectrocardiogramChartMetadataView *)self addSubview:v4];

  double v5 = [(HKElectrocardiogramChartMetadataView *)self infoView];
  [(HKElectrocardiogramChartMetadataView *)self addSubview:v5];

  v25 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v37 = [v38 topAnchor];
  v36 = [(HKElectrocardiogramChartMetadataView *)self topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v39[0] = v35;
  v34 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v32 = [v34 bottomAnchor];
  v33 = [(HKElectrocardiogramChartMetadataView *)self infoView];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v39[1] = v30;
  v29 = [(HKElectrocardiogramChartMetadataView *)self infoView];
  objc_super v28 = [v29 bottomAnchor];
  v27 = [(HKElectrocardiogramChartMetadataView *)self bottomAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v39[2] = v26;
  v24 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  uint64_t v23 = [v24 leftAnchor];
  double v22 = [(HKElectrocardiogramChartMetadataView *)self leftAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v39[3] = v21;
  v20 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v19 = [v20 rightAnchor];
  v18 = [(HKElectrocardiogramChartMetadataView *)self rightAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v39[4] = v17;
  double v16 = [(HKElectrocardiogramChartMetadataView *)self layoutMarginsGuide];
  double v15 = [v16 leadingAnchor];
  double v6 = [(HKElectrocardiogramChartMetadataView *)self infoView];
  double v7 = [v6 leadingAnchor];
  double v8 = [v15 constraintEqualToAnchor:v7];
  v39[5] = v8;
  v9 = [(HKElectrocardiogramChartMetadataView *)self infoView];
  uint64_t v10 = [v9 trailingAnchor];
  v11 = [(HKElectrocardiogramChartMetadataView *)self layoutMarginsGuide];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v39[6] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
  [v25 activateConstraints:v14];

  [(HKElectrocardiogramChartMetadataView *)self _updateMargins];
}

- (void)_setUpScrollViewContent
{
  v3 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v4 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  [v3 addSubview:v4];

  double v5 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  double v6 = [(HKElectrocardiogramChartMetadataView *)self axisView];
  [v5 addSubview:v6];

  double v7 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  [v7 setClipsToBounds:0];

  double v8 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v10 = [(HKElectrocardiogramChartMetadataView *)self axisView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  [v11 setShowsHorizontalScrollIndicator:0];

  v12 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  [v12 setShowsVerticalScrollIndicator:0];

  v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v14 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  [v14 setBackgroundColor:v13];

  id v75 = +[HKDisplayCategory categoryWithID:11];
  double v15 = [v75 color];
  double v16 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  [v16 setTintColor:v15];

  v17 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  [v17 gridSize];
  double v19 = v18;
  v20 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  v21 = [v20 gridOptions];
  double v22 = [v21 firstObject];
  double v23 = v19 * (double)(unint64_t)[v22 unitMultiple];

  v24 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  v25 = [v24 heightAnchor];
  v26 = [v25 constraintEqualToConstant:v23];
  [v26 setActive:1];

  v27 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  objc_super v28 = [v27 topAnchor];
  v29 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v30 = [v29 frameLayoutGuide];
  v31 = [v30 topAnchor];
  v32 = [v28 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  v34 = [v33 leftAnchor];
  v35 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v36 = [v35 contentLayoutGuide];
  v37 = [v36 leftAnchor];
  v38 = [v34 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  v40 = [v39 rightAnchor];
  v41 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v42 = [v41 contentLayoutGuide];
  v43 = [v42 rightAnchor];
  v44 = [v40 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(HKElectrocardiogramChartMetadataView *)self axisView];
  v46 = [v45 topAnchor];
  v47 = [(HKElectrocardiogramChartMetadataView *)self chartView];
  v48 = [v47 bottomAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v51 = [v50 frameLayoutGuide];
  v52 = [v51 bottomAnchor];
  v53 = [(HKElectrocardiogramChartMetadataView *)self axisView];
  v54 = [v53 bottomAnchor];
  v55 = [v52 constraintEqualToAnchor:v54];
  [v55 setActive:1];

  v56 = [(HKElectrocardiogramChartMetadataView *)self axisView];
  v57 = [v56 leftAnchor];
  v58 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v59 = [v58 contentLayoutGuide];
  v60 = [v59 leftAnchor];
  v61 = [v57 constraintEqualToAnchor:v60];
  [v61 setActive:1];

  v62 = [(HKElectrocardiogramChartMetadataView *)self axisView];
  v63 = [v62 rightAnchor];
  v64 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v65 = [v64 contentLayoutGuide];
  v66 = [v65 rightAnchor];
  v67 = [v63 constraintEqualToAnchor:v66];
  [v67 setActive:1];

  v68 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v69 = [v68 contentLayoutGuide];
  v70 = [v69 heightAnchor];
  v71 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  v72 = [v71 frameLayoutGuide];
  v73 = [v72 heightAnchor];
  v74 = [v70 constraintEqualToAnchor:v73 multiplier:1.0];
  [v74 setActive:1];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramChartMetadataView;
  [(HKElectrocardiogramChartMetadataView *)&v3 layoutMarginsDidChange];
  [(HKElectrocardiogramChartMetadataView *)self _updateMargins];
}

- (void)_updateMargins
{
  objc_super v3 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;

  [(HKElectrocardiogramChartMetadataView *)self directionalLayoutMargins];
  double v9 = v8;
  [(HKElectrocardiogramChartMetadataView *)self directionalLayoutMargins];
  double v11 = v10;
  id v12 = [(HKElectrocardiogramChartMetadataView *)self scrollView];
  objc_msgSend(v12, "setContentInset:", v5, v9, v7, v11);
}

- (CGSize)gridSize
{
  v2 = [(HKElectrocardiogramChartMetadataView *)self chartView];
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