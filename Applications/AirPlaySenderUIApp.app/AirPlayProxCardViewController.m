@interface AirPlayProxCardViewController
- (AirPlayProxCardViewController)initWithTitle:(id)a3 subTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 shouldAnimate:(BOOL)a7 actionTitle:(id)a8 bottomSubtitle:(id)a9 completion:(id)a10;
- (BOOL)shouldAnimate;
- (void)setShouldAnimate:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AirPlayProxCardViewController

- (AirPlayProxCardViewController)initWithTitle:(id)a3 subTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 shouldAnimate:(BOOL)a7 actionTitle:(id)a8 bottomSubtitle:(id)a9 completion:(id)a10
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v53 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v56.receiver = self;
  v56.super_class = (Class)AirPlayProxCardViewController;
  v22 = [(AirPlayProxCardViewController *)&v56 initWithContentView:0];
  v23 = v22;
  if (!v22) {
    goto LABEL_16;
  }
  [(AirPlayProxCardViewController *)v22 setTitle:v16];
  [(AirPlayProxCardViewController *)v23 setSubtitle:v17];
  [(AirPlayProxCardViewController *)v23 setDismissalType:3];
  [(AirPlayProxCardViewController *)v23 setShouldAnimate:v11];
  [(AirPlayProxCardViewController *)v23 setBottomTrayTitle:v20];
  v24 = +[UIImageSymbolConfiguration configurationWithPointSize:96.0];
  uint64_t v25 = +[UIImage systemImageNamed:v18 withConfiguration:v24];
  v26 = (void *)v25;
  if (v25)
  {
    v45 = v24;
    id v46 = v21;
    id v47 = v20;
    id v48 = v19;
    id v49 = v18;
    id v50 = v17;
    id v51 = v16;
    v52 = (void *)v25;
    id v27 = [objc_alloc((Class)UIImageView) initWithImage:v25];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v53) {
      [v27 setTintColor:v53];
    }
    v28 = [(AirPlayProxCardViewController *)v23 contentView];
    [v28 addSubview:v27];

    v29 = [(AirPlayProxCardViewController *)v23 contentView];
    v30 = [v29 mainContentGuide];

    v44 = [v27 topAnchor];
    v43 = [v30 topAnchor];
    v42 = [v44 constraintGreaterThanOrEqualToAnchor:v43];
    v57[0] = v42;
    v31 = [v27 centerYAnchor];
    v32 = [v30 centerYAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v57[1] = v33;
    v34 = [v27 centerXAnchor];
    v35 = [v30 centerXAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v57[2] = v36;
    v37 = +[NSArray arrayWithObjects:v57 count:3];
    +[NSLayoutConstraint activateConstraints:v37];

    id v17 = v50;
    id v16 = v51;
    id v19 = v48;
    id v18 = v49;
    id v21 = v46;
    id v20 = v47;
    v24 = v45;
LABEL_6:
    v26 = v52;
    if (dword_10001EBD8 <= 50 && (dword_10001EBD8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_13;
  }
  if (dword_10001EBD8 <= 90)
  {
    v52 = 0;
    if (dword_10001EBD8 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    goto LABEL_6;
  }
LABEL_13:
  if (v21)
  {
    v38 = v26;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100006304;
    v54[3] = &unk_100018748;
    id v55 = v21;
    v39 = +[PRXAction actionWithTitle:v19 style:0 handler:v54];
    id v40 = [(AirPlayProxCardViewController *)v23 addAction:v39];

    v26 = v38;
  }

LABEL_16:
  return v23;
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AirPlayProxCardViewController;
  [(AirPlayProxCardViewController *)&v16 viewDidAppear:a3];
  if ([(AirPlayProxCardViewController *)self shouldAnimate])
  {
    v4 = +[NSSymbolScaleEffect scaleUpEffect];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(AirPlayProxCardViewController *)self contentView];
    v6 = [v5 subviews];

    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 addSymbolEffect:v4];
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

@end