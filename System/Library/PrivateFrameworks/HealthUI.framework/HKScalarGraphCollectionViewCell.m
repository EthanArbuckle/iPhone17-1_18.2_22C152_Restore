@interface HKScalarGraphCollectionViewCell
+ (id)reuseIdentifier;
- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3;
- (HKLollipopController)lollipopController;
- (HKScalarGraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (HKScalarGraphViewController)graphViewController;
- (NSArray)graphSeries;
- (UIView)header;
- (id)seriesSelectionLineColorForGraphView:(id)a3;
- (int64_t)stackCountForGraphView:(id)a3;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphViewDidEndSelection:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setGraphSeries:(id)a3;
- (void)setGraphViewController:(id)a3;
- (void)setHeader:(id)a3;
- (void)setLollipopController:(id)a3;
@end

@implementation HKScalarGraphCollectionViewCell

- (HKScalarGraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKScalarGraphCollectionViewCell;
  v3 = -[HKScalarGraphCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(HKScalarGraphCollectionViewCell *)v3 contentView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HKScalarGraphCollectionViewCell;
  [(HKScalarGraphCollectionViewCell *)&v3 prepareForReuse];
  [(HKScalarGraphCollectionViewCell *)self setGraphSeries:MEMORY[0x1E4F1CBF0]];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HKScalarGraphCollectionViewCell;
  [(HKScalarGraphCollectionViewCell *)&v13 layoutSubviews];
  [(HKScalarGraphCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(HKScalarGraphCollectionViewCell *)self graphViewController];
  v12 = [v11 view];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

+ (id)reuseIdentifier
{
  return @"HKScalarGraphCollectionViewCell";
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor", a3);
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  id v17 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    double v5 = [(HKScalarGraphCollectionViewCell *)self lollipopController];
    int v6 = [v5 isVisible];

    if (v6)
    {
      double v7 = [(HKScalarGraphCollectionViewCell *)self lollipopController];
      [v7 updateWithPointContexts:v17];
    }
    else
    {
      double v8 = [(HKScalarGraphCollectionViewCell *)self header];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      double v7 = [(HKScalarGraphCollectionViewCell *)self lollipopController];
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v17, 1, v10, v12, v14, v16);
    }
  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3 = [(HKScalarGraphCollectionViewCell *)self lollipopController];
  [v3 setInvisibleAnimated:1];
}

- (NSArray)graphSeries
{
  return self->_graphSeries;
}

- (void)setGraphSeries:(id)a3
{
}

- (HKScalarGraphViewController)graphViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graphViewController);
  return (HKScalarGraphViewController *)WeakRetained;
}

- (void)setGraphViewController:(id)a3
{
}

- (HKLollipopController)lollipopController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lollipopController);
  return (HKLollipopController *)WeakRetained;
}

- (void)setLollipopController:(id)a3
{
}

- (UIView)header
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_header);
  return (UIView *)WeakRetained;
}

- (void)setHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_header);
  objc_destroyWeak((id *)&self->_lollipopController);
  objc_destroyWeak((id *)&self->_graphViewController);
  objc_storeStrong((id *)&self->_graphSeries, 0);
}

@end