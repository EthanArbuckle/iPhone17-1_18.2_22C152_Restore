@interface ProxCardKitTestFeaturesViewController
- (ProxCardKitTestFeaturesViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ProxCardKitTestFeaturesViewController

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)ProxCardKitTestFeaturesViewController;
  [(ProxCardKitTestFeaturesViewController *)&v27 viewDidLoad];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:72.0];
  v4 = +[UIImage systemImageNamed:@"list.bullet" withConfiguration:v3];
  [(ProxCardKitTestFeaturesViewController *)self setFeatureImage:v4];

  id location = 0;
  objc_initWeak(&location, self);
  v5 = +[UIImage systemImageNamed:@"lock.fill"];
  v6 = +[UIColor systemGreenColor];
  v7 = +[PRXFeature featureWithTitle:@"Lorem" detailText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit." icon:v5 tintColor:v6];
  id v8 = [(ProxCardKitTestFeaturesViewController *)self addFeature:v7];

  v9 = +[UIImage systemImageNamed:@"zzz"];
  v10 = +[UIColor systemPurpleColor];
  v11 = +[PRXFeature featureWithTitle:@"Ipsum" detailText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit." icon:v9 tintColor:v10];
  id v12 = [(ProxCardKitTestFeaturesViewController *)self addFeature:v11];

  id v13 = objc_alloc((Class)PRXFeature);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10012A4BC;
  v24[3] = &unk_1001A1468;
  objc_copyWeak(&v25, &location);
  id v14 = [v13 initWithTitle:@"Dolor", @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 0, 0, v24 detailText icon tintColor valueChangedBlock];
  [v14 setOn:0];
  id v15 = [(ProxCardKitTestFeaturesViewController *)self addFeature:v14];
  v16 = +[UIImage systemImageNamed:@"house.fill"];
  v17 = +[UIColor systemOrangeColor];
  v18 = +[PRXFeature optionalFeatureWithTitle:@"Amet" detailText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit." icon:v16 tintColor:v17 valueChangedBlock:&stru_1001A14A8];
  id v19 = [(ProxCardKitTestFeaturesViewController *)self addFeature:v18];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10012A544;
  v22[3] = &unk_1001A19A0;
  objc_copyWeak(&v23, &location);
  v20 = +[PRXAction actionWithTitle:@"Next" style:0 handler:v22];
  id v21 = [(ProxCardKitTestFeaturesViewController *)self addAction:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (ProxCardKitTestFeaturesViewController)initWithContentView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ProxCardKitTestFeaturesViewController;
  v3 = [(ProxCardKitTestFeaturesViewController *)&v7 initWithContentView:a3];
  v4 = v3;
  if (v3)
  {
    [(ProxCardKitTestFeaturesViewController *)v3 setDismissalType:3];
    [(ProxCardKitTestFeaturesViewController *)v4 setTitle:@"ProxCardKit Test"];
    v5 = v4;
  }

  return v4;
}

@end