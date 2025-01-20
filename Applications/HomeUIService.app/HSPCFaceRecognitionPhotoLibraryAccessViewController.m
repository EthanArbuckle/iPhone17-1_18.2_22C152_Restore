@interface HSPCFaceRecognitionPhotoLibraryAccessViewController
- (HSPCFaceRecognitionPhotoLibraryAccessViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (id)attributedSubtitle;
- (id)commitConfiguration;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation HSPCFaceRecognitionPhotoLibraryAccessViewController

- (HSPCFaceRecognitionPhotoLibraryAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005ABC8;
  v21[3] = &unk_1000AB468;
  v8 = self;
  v22 = v8;
  v9 = objc_retainBlock(v21);
  v20.receiver = v8;
  v20.super_class = (Class)HSPCFaceRecognitionPhotoLibraryAccessViewController;
  v10 = [(HSPCMVVMShellViewController *)&v20 initWithTableViewStyle:2 moduleCreator:&stru_1000AB440 moduleControllerBuilder:v9];
  v11 = v10;
  if (v10)
  {
    [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v10 setConfig:v7];
    [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 setCoordinator:v6];
    v12 = HULocalizedString();
    [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 setTitle:v12];

    id v13 = [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v11 futureSelector:"commitConfiguration"];
    [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 setSubtitle:@" "];
    v14 = [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 attributedSubtitle];
    v15 = [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 contentView];
    v16 = [v15 subtitleLabel];
    [v16 setAttributedText:v14];

    v17 = [(HSPCFaceRecognitionPhotoLibraryAccessViewController *)v11 contentView];
    v18 = [v17 subtitleLabel];
    [v18 setTextAlignment:4];
  }
  return v11;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0B80];
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return +[NAFuture futureWithNoResult];
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return +[NAFuture futureWithNoResult];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (id)attributedSubtitle
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  objc_super v20 = [v2 fontDescriptorWithSymbolicTraits:32770];

  [v20 pointSize];
  v19 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v20);
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption1];
  v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

  [v4 pointSize];
  v18 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4);
  v5 = HULocalizedString();
  id v6 = +[NSString stringWithFormat:@"\n%@", v5];

  id v7 = objc_opt_new();
  id v8 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v23 = NSFontAttributeName;
  v24 = v19;
  v9 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v10 = [v8 initWithString:v6 attributes:v9];

  v11 = HULocalizedString();
  v12 = +[NSString stringWithFormat:@"\n%@", v11];

  id v13 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v21 = NSFontAttributeName;
  v22 = v18;
  v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v15 = [v13 initWithString:v12 attributes:v14];

  [v7 appendAttributedString:v10];
  [v7 appendAttributedString:v15];
  id v16 = [v7 copy];

  return v16;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end