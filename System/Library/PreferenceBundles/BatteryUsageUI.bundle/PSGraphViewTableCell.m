@interface PSGraphViewTableCell
+ (int)graphHeight;
- (BOOL)canReload;
- (NSMutableArray)graphArray;
- (PLBatteryUIMoveableGraphView)graphView;
- (PSGraphViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)activityIndicator;
- (UIScrollView)scrollView;
- (void)generateGraphs;
- (void)layoutSubviews;
- (void)pinch:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setGraphArray:(id)a3;
- (void)setGraphView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation PSGraphViewTableCell

+ (int)graphHeight
{
  return +[PLBatteryUIMoveableGraphView graphHeight];
}

- (UIScrollView)scrollView
{
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    v5 = self->_scrollView;
    self->_scrollView = v4;

    id v6 = [objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:self action:"pinch:"];
    [(UIScrollView *)self->_scrollView addGestureRecognizer:v6];

    scrollView = self->_scrollView;
  }

  return scrollView;
}

- (PLBatteryUIMoveableGraphView)graphView
{
  graphView = self->_graphView;
  if (!graphView)
  {
    v4 = objc_alloc_init(PLBatteryUIMoveableGraphView);
    v5 = self->_graphView;
    self->_graphView = v4;

    graphView = self->_graphView;
  }

  return graphView;
}

- (UIActivityIndicatorView)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:2];
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    -[UIActivityIndicatorView setSize:](self->_activityIndicator, "setSize:", 50.0, 50.0);
    [(PSGraphViewTableCell *)self center];
    -[UIActivityIndicatorView setCenter:](self->_activityIndicator, "setCenter:");
    activityIndicator = self->_activityIndicator;
  }

  return activityIndicator;
}

- (BOOL)canReload
{
  return 0;
}

- (NSMutableArray)graphArray
{
  graphArray = self->_graphArray;
  if (!graphArray)
  {
    v4 = [(PSGraphViewTableCell *)self specifier];
    v5 = [v4 propertyForKey:@"GRAPH_ARRAY"];
    id v6 = self->_graphArray;
    self->_graphArray = v5;

    graphArray = self->_graphArray;
  }

  return graphArray;
}

- (void)setGraphArray:(id)a3
{
  p_graphArray = &self->_graphArray;
  objc_storeStrong((id *)&self->_graphArray, a3);
  id v6 = a3;
  id v7 = [(PSGraphViewTableCell *)self specifier];
  [v7 setProperty:*p_graphArray forKey:@"GRAPH_ARRAY"];
}

- (void)generateGraphs
{
  if (self->graphViewDidChange)
  {
    id v66 = objc_alloc_init((Class)UILabel);
    [v66 setText:@"000%"];
    v3 = +[UIFont systemFontOfSize:11.0];
    [v66 setFont:v3];

    [v66 sizeToFit];
    [v66 setText:@"0%"];
    [v66 setTextAlignment:2];
    [v66 setColor:self->labelColor];
    id v4 = objc_alloc_init((Class)UILabel);
    [v4 setText:@"100%"];
    v5 = +[UIFont systemFontOfSize:11.0];
    [v4 setFont:v5];

    [v4 sizeToFit];
    [v4 setColor:self->labelColor];
    id v6 = objc_alloc_init((Class)UILabel);
    [v6 setText:@"000%"];
    id v7 = +[UIFont systemFontOfSize:11.0];
    [v6 setFont:v7];

    [v6 sizeToFit];
    [v6 setText:@"50%"];
    [v6 setTextAlignment:2];
    [v6 setColor:self->labelColor];
    [(PSGraphViewTableCell *)self frame];
    double v9 = v8 + -40.0;
    [v66 size];
    double v11 = v10;
    [v66 size];
    objc_msgSend(v66, "setFrame:", 1.0, v9, v11, v12);
    [v4 size];
    double v14 = 10.0 - v13 * 0.5;
    [v4 size];
    double v16 = v15;
    [v4 size];
    objc_msgSend(v4, "setFrame:", 1.0, v14, v16, v17);
    [v66 frame];
    double v19 = v18;
    [v4 frame];
    double v21 = v19 - v20;
    [v6 size];
    double v23 = (v22 + v21) * 0.5;
    [v6 size];
    double v25 = v24;
    [v6 size];
    objc_msgSend(v6, "setFrame:", 1.0, v23, v25, v26);
    [(PSGraphViewTableCell *)self addSubview:v66];
    [(PSGraphViewTableCell *)self addSubview:v4];
    [(PSGraphViewTableCell *)self addSubview:v6];
    [v4 size];
    double v28 = v27;
    [(PSGraphViewTableCell *)self frame];
    double v30 = v29 + -10.0 - v28;
    double v31 = (double)(+[PLBatteryUIMoveableGraphView graphHeight]- 20);
    v32 = [(PSGraphViewTableCell *)self graphView];
    objc_msgSend(v32, "setFrame:", 0.0, 0.0, v30, v31);

    v33 = [(PSGraphViewTableCell *)self graphView];
    v34 = [(PSGraphViewTableCell *)self graphArray];
    [v33 setInputData:v34];

    v35 = [(PSGraphViewTableCell *)self backgroundColor];
    v36 = [(PSGraphViewTableCell *)self graphView];
    [v36 setBackgroundColor:v35];

    v37 = [(PSGraphViewTableCell *)self backgroundColor];
    v38 = [(PSGraphViewTableCell *)self graphView];
    [v38 setGraphBackgroundColor:v37];

    labelColor = self->labelColor;
    v40 = [(PSGraphViewTableCell *)self graphView];
    [v40 setLabelColor:labelColor];

    v41 = +[UIColor tableCellBlueTextColor];
    v42 = [(PSGraphViewTableCell *)self graphView];
    [v42 setLineColor:v41];

    v43 = [(PSGraphViewTableCell *)self specifier];
    v44 = [v43 propertyForKey:@"DisplayRange"];

    if (v44 && [v44 isEqualToString:@"PLBatteryUIQueryRangeWeekKey"])
    {
      v45 = [(PSGraphViewTableCell *)self graphView];
      [v45 setDisplayRange:604800.0];
    }
    double v46 = v28 + 3.0;
    [(PSGraphViewTableCell *)self frame];
    double v48 = v47 + -10.0 - v28 + -3.0;
    double v49 = (double)(+[PLBatteryUIMoveableGraphView graphHeight]- 20);
    v50 = [(PSGraphViewTableCell *)self scrollView];
    objc_msgSend(v50, "setFrame:", v46, 10.0, v48, v49);

    v51 = [(PSGraphViewTableCell *)self graphView];
    [v51 size];
    double v53 = v52;
    double v55 = v54;
    v56 = [(PSGraphViewTableCell *)self scrollView];
    objc_msgSend(v56, "setContentSize:", v53, v55);

    v57 = [(PSGraphViewTableCell *)self scrollView];
    v58 = [(PSGraphViewTableCell *)self graphView];
    [v57 addSubview:v58];

    v59 = [(PSGraphViewTableCell *)self scrollView];
    [(PSGraphViewTableCell *)self addSubview:v59];

    v60 = [(PSGraphViewTableCell *)self scrollView];
    v61 = [(PSGraphViewTableCell *)self graphView];
    [v61 size];
    double v63 = v62;
    v64 = [(PSGraphViewTableCell *)self scrollView];
    [v64 frame];
    objc_msgSend(v60, "setContentOffset:animated:", 0, v63 - v65, 0.0);

    self->graphViewDidChange = 0;
  }
}

- (PSGraphViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PSGraphViewTableCell;
  id v4 = [(PSGraphViewTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(PSGraphViewTableCell *)v4 setBackgroundColor:v5];

    uint64_t v6 = +[UIColor blackColor];
    labelColor = v4->labelColor;
    v4->labelColor = (UIColor *)v6;

    uint64_t v8 = [(PSGraphViewTableCell *)v4 backgroundColor];
    graphColor = v4->graphColor;
    v4->graphColor = (UIColor *)v8;

    graphArray = v4->_graphArray;
    v4->_graphArray = 0;

    v4->waitingForData = 0;
    v4->graphViewDidChange = 1;
    [(PSGraphViewTableCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PSGraphViewTableCell;
  [(PSGraphViewTableCell *)&v3 layoutSubviews];
  if (!self->waitingForData) {
    [(PSGraphViewTableCell *)self generateGraphs];
  }
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSGraphViewTableCell;
  [(PSGraphViewTableCell *)&v9 setSpecifier:a3];
  id v4 = [(PSGraphViewTableCell *)self graphArray];

  if (!v4)
  {
    self->waitingForData = 1;
    v5 = [(PSGraphViewTableCell *)self activityIndicator];
    [(PSGraphViewTableCell *)self addSubview:v5];

    uint64_t v6 = [(PSGraphViewTableCell *)self activityIndicator];
    [v6 startAnimating];

    id v7 = +[BatteryUsageQueryModule sharedModule];
    [v7 setGraphNames:&off_CA6F8];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_26C10;
    v8[3] = &unk_BE620;
    v8[4] = self;
    [v7 populateBatteryModelsWithCompletion:v8];
  }
}

- (void)pinch:(id)a3
{
  id v33 = a3;
  if ((unint64_t)[v33 numberOfTouches] >= 2)
  {
    id v4 = [(PSGraphViewTableCell *)self graphView];
    [v33 locationOfTouch:0 inView:v4];
    double v6 = v5;

    id v7 = [(PSGraphViewTableCell *)self graphView];
    [v33 locationOfTouch:1 inView:v7];
    double v9 = v8;

    double v10 = v6 + (v9 - v6) * 0.5;
    double v11 = [(PSGraphViewTableCell *)self graphView];
    [v11 size];
    double v13 = v10 / v12;

    double v14 = [(PSGraphViewTableCell *)self scrollView];
    [v14 contentOffset];
    double v16 = v10 - v15;

    self->graphViewDidChange = 1;
    double v17 = [(PSGraphViewTableCell *)self graphView];
    [v17 displayRange];
    double v19 = v18;
    [v33 scale];
    double v21 = v19 / v20;
    double v22 = [(PSGraphViewTableCell *)self graphView];
    [v22 setDisplayRange:v21];

    double v23 = [(PSGraphViewTableCell *)self graphView];
    [v23 size];
    double v25 = v24;
    double v27 = v26;
    double v28 = [(PSGraphViewTableCell *)self scrollView];
    objc_msgSend(v28, "setContentSize:", v25, v27);

    double v29 = [(PSGraphViewTableCell *)self graphView];
    [v29 size];
    double v31 = v13 * v30;

    v32 = [(PSGraphViewTableCell *)self scrollView];
    objc_msgSend(v32, "setContentOffset:animated:", 0, v31 - v16, 0.0);

    [v33 setScale:1.0];
  }
}

- (void)setScrollView:(id)a3
{
}

- (void)setGraphView:(id)a3
{
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->graphColor, 0);
  objc_storeStrong((id *)&self->labelColor, 0);

  objc_storeStrong((id *)&self->_graphArray, 0);
}

@end