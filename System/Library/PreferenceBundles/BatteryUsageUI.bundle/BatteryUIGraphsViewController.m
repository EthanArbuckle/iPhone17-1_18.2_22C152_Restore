@interface BatteryUIGraphsViewController
- (BOOL)validateDictionary:(id)a3;
- (BatteryUIGraphsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BatteryUsageRadarComposeViewController)radarController;
- (UIActivityIndicatorView)activityIndicator;
- (UIScrollView)rootScrollView;
- (void)didReceiveMemoryWarning;
- (void)reportIssue;
- (void)setActivityIndicator:(id)a3;
- (void)setRadarController:(id)a3;
- (void)setRootScrollView:(id)a3;
- (void)setUpModelingView:(id)a3;
- (void)viewDidLoad;
@end

@implementation BatteryUIGraphsViewController

- (UIActivityIndicatorView)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:2];
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    -[UIActivityIndicatorView setSize:](self->_activityIndicator, "setSize:", 50.0, 50.0);
    v6 = [(BatteryUIGraphsViewController *)self view];
    [v6 center];
    -[UIActivityIndicatorView setCenter:](self->_activityIndicator, "setCenter:");

    activityIndicator = self->_activityIndicator;
  }

  return activityIndicator;
}

- (BatteryUIGraphsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BatteryUIGraphsViewController;
  v4 = [(BatteryUIGraphsViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(BatteryUIGraphsViewController *)v4 setTitle:@"Modeling Details"];
  }
  return v5;
}

- (BOOL)validateDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"ModelData"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setUpModelingView:(id)a3
{
  id v5 = a3;
  if ([(BatteryUIGraphsViewController *)self validateDictionary:v5])
  {
    objc_storeStrong((id *)&self->_currentDictionary, a3);
    v6 = [v5 objectForKeyedSubscript:@"ModelData"];
    id v7 = objc_alloc((Class)UIScrollView);
    v8 = [(BatteryUIGraphsViewController *)self navigationController];
    v9 = [v8 navigationBar];
    [v9 frame];
    double v11 = v10 + 20.0;
    v12 = [(BatteryUIGraphsViewController *)self view];
    [v12 frame];
    double v14 = v13;
    v15 = [(BatteryUIGraphsViewController *)self view];
    [v15 frame];
    double v17 = v16;
    v18 = [(BatteryUIGraphsViewController *)self navigationController];
    v19 = [v18 navigationBar];
    [v19 frame];
    id v21 = objc_msgSend(v7, "initWithFrame:", 0.0, v11, v14, v17 - v20);
    [(BatteryUIGraphsViewController *)self setRootScrollView:v21];

    v22 = [(BatteryUIGraphsViewController *)self view];
    v59 = self;
    v23 = [(BatteryUIGraphsViewController *)self rootScrollView];
    [v22 addSubview:v23];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v6;
    id v24 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    id v58 = v5;
    if (v24)
    {
      id v25 = v24;
      int v26 = 20;
      v27 = &objc_loadWeakRetained_ptr;
      uint64_t v28 = *(void *)v62;
      v29 = self;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v62 != v28) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v32 = objc_alloc((Class)UILabel);
            v33 = [(BatteryUIGraphsViewController *)v29 rootScrollView];
            [v33 frame];
            id v35 = objc_msgSend(v32, "initWithFrame:", 10.0, (double)v26, v34 + -20.0, 20.0);

            v36 = [v31 objectForKeyedSubscript:@"ModelGraphName"];
            [v35 setText:v36];

            [v35 frame];
            objc_msgSend(v35, "sizeThatFits:", v37, v38);
            v39 = [(BatteryUIGraphsViewController *)v29 rootScrollView];
            [v39 addSubview:v35];

            uint64_t v40 = v28;
            v41 = v27;
            v42 = [PLBatteryUIGraphViewInternal alloc];
            v43 = [(BatteryUIGraphsViewController *)v29 rootScrollView];
            [v43 frame];
            double v45 = v44 + -20.0;
            double v46 = (double)+[PLBatteryUIGraphViewInternal graphHeight];
            v47 = [v31 objectForKeyedSubscript:@"ModelGraphArray"];
            v48 = -[PLBatteryUIGraphViewInternal initWithFrame:andData:](v42, "initWithFrame:andData:", v47, 10.0, (double)(v26 + 20), v45, v46);

            v29 = v59;
            v49 = [v31 objectForKeyedSubscript:@"ModelGraphType"];
            -[PLBatteryUIGraphViewInternal setGraphType:](v48, "setGraphType:", [v49 intValue]);

            v50 = [(BatteryUIGraphsViewController *)v59 rootScrollView];
            [v50 addSubview:v48];

            v27 = v41;
            uint64_t v28 = v40;
            v26 += +[PLBatteryUIGraphViewInternal graphHeight]+ 40;
          }
        }
        id v25 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v25);
    }
    else
    {
      int v26 = 20;
      v29 = self;
    }

    v51 = [(BatteryUIGraphsViewController *)v29 rootScrollView];
    [v51 frame];
    double v53 = v52;
    double v54 = (double)v26;
    v55 = [(BatteryUIGraphsViewController *)v29 rootScrollView];
    objc_msgSend(v55, "setContentSize:", v53, v54);

    v56 = [(BatteryUIGraphsViewController *)v29 rootScrollView];
    [v56 setScrollEnabled:1];

    v57 = [(BatteryUIGraphsViewController *)v29 view];
    [v57 setUserInteractionEnabled:1];

    id v5 = v58;
  }
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)BatteryUIGraphsViewController;
  [(BatteryUIGraphsViewController *)&v15 viewDidLoad];
  v3 = [(BatteryUIGraphsViewController *)self view];
  v4 = [(BatteryUIGraphsViewController *)self activityIndicator];
  [v3 addSubview:v4];

  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = +[UIImage imageNamed:@"radar.png" inBundle:v6];
  id v8 = [v5 initWithImage:v7 style:0 target:self action:"reportIssue"];
  v9 = [(BatteryUIGraphsViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  double v10 = [(BatteryUIGraphsViewController *)self view];
  double v11 = +[UIColor whiteColor];
  [v10 setBackgroundColor:v11];

  v12 = [(BatteryUIGraphsViewController *)self activityIndicator];
  [v12 startAnimating];

  double v13 = +[BatteryUsageQueryModule sharedModule];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5950;
  v14[3] = &unk_BE620;
  v14[4] = self;
  [v13 populateBatteryModelsWithCompletion:v14];
}

- (void)reportIssue
{
  v3 = [[BatteryUsageRadarComposeViewController alloc] initWithParentView:self andDictionary:self->_currentDictionary];
  [(BatteryUIGraphsViewController *)self setRadarController:v3];

  id v4 = [(BatteryUIGraphsViewController *)self radarController];
  [v4 showRadarComposeAlert];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)BatteryUIGraphsViewController;
  [(BatteryUIGraphsViewController *)&v2 didReceiveMemoryWarning];
}

- (UIScrollView)rootScrollView
{
  return self->_rootScrollView;
}

- (void)setRootScrollView:(id)a3
{
}

- (void)setActivityIndicator:(id)a3
{
}

- (BatteryUsageRadarComposeViewController)radarController
{
  return self->_radarController;
}

- (void)setRadarController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_rootScrollView, 0);

  objc_storeStrong((id *)&self->_currentDictionary, 0);
}

@end