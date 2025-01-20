@interface CSModalViewControllerBase
+ (Class)viewClass;
- (BOOL)isPortrait;
- (id)view;
- (id)viewIfLoaded;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationType;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSModalViewControllerBase

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)CSModalViewControllerBase;
  v2 = [(CSModalViewControllerBase *)&v4 view];

  return v2;
}

- (id)viewIfLoaded
{
  v4.receiver = self;
  v4.super_class = (Class)CSModalViewControllerBase;
  v2 = [(CSModalViewControllerBase *)&v4 viewIfLoaded];

  return v2;
}

- (void)viewDidLoad
{
  v3 = [(CSModalViewControllerBase *)self view];
  [(CSCoverSheetViewControllerBase *)self registerView:v3 forRole:2];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  [v7 setDelegate:self];
  v8.receiver = self;
  v8.super_class = (Class)CSModalViewControllerBase;
  [(CSCoverSheetViewControllerBase *)&v8 viewDidLoad];
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CSModalViewControllerBase;
  [(CSCoverSheetViewControllerBase *)&v40 aggregateAppearance:v4];
  id v5 = [(CSModalViewControllerBase *)self view];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v8 = v7;
    }
    else {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = v8;

  if (v9 && [v9 showsDateView])
  {
    v10 = objc_opt_new();
    v11 = [v10 priority:40];
    v12 = v11;
    uint64_t v13 = 0;
  }
  else
  {
    v10 = objc_opt_new();
    v11 = [v10 priority:40];
    v12 = v11;
    uint64_t v13 = 1;
  }
  v14 = [v11 hidden:v13];
  v15 = [v14 vibrantAndCentered:1];
  [v4 addComponent:v15];

  v16 = +[CSComponent backgroundContent];
  v17 = [v16 priority:40];
  v18 = [v17 hidden:1];
  [v4 addComponent:v18];

  v19 = +[CSComponent pageContent];
  v20 = [v19 priority:40];
  v21 = [v20 hidden:1];
  [v4 addComponent:v21];

  v22 = +[CSComponent pageControl];
  v23 = [v22 priority:40];
  v24 = [v23 hidden:1];
  [v4 addComponent:v24];

  v25 = objc_opt_new();
  v26 = [v25 priority:40];
  v27 = [v26 hidden:0];
  v28 = [v27 fakeStatusBar:0];
  [v4 addComponent:v28];

  v29 = +[CSComponent quickActions];
  v30 = [v29 priority:40];
  v31 = [v30 hidden:1];
  [v4 addComponent:v31];

  v32 = objc_opt_new();
  v33 = [v32 priority:40];
  v34 = [NSNumber numberWithInteger:7];
  v35 = [v33 style:v34];
  [v4 addComponent:v35];

  v36 = CSGetLegibilitySettingsForBackgroundStyle(7);
  [v4 setLegibilitySettings:v36];

  v37 = objc_opt_new();
  v38 = [v37 priority:40];
  v39 = [v38 shouldRenderInline:1];
  [v4 addComponent:v39];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSModalViewControllerBase;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "addRestrictedCapabilities:", 130, v4.receiver, v4.super_class);
}

- (int64_t)presentationStyle
{
  return 2;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 500;
}

- (BOOL)isPortrait
{
  return (unint64_t)([(CSModalViewControllerBase *)self interfaceOrientation] - 1) < 2;
}

@end