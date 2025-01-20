@interface PKWelcomeController
+ (void)resetEducationPane;
- (PKTiledView)tiledView;
- (PKWelcomeController)initWithTiledView:(id)a3;
- (void)didEnterBackground;
- (void)handwritingEducationDoneButtonPressed:(id)a3;
- (void)setTiledView:(id)a3;
- (void)showPencilEducationPane;
- (void)toolPickerDidShow;
- (void)welcomeControllerButtonDidPress:(id)a3;
@end

@implementation PKWelcomeController

- (PKWelcomeController)initWithTiledView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKWelcomeController;
  id v3 = a3;
  v4 = [(PKWelcomeController *)&v8 init];
  objc_storeWeak((id *)&v4->_tiledView, v3);

  v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v8.receiver, v8.super_class);
  [v5 addObserver:v4 selector:sel_toolPickerDidShow name:@"PKToolPickerDidShowNotification" object:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:v4 selector:sel_didEnterBackground name:*MEMORY[0x1E4FB2640] object:0];

  return v4;
}

- (void)didEnterBackground
{
  LOBYTE(_MergedGlobals_156) = 0;
}

- (void)toolPickerDidShow
{
  +[PKHandwritingEducationPaneSettings sharedInstance]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingEducationPaneSettings userHasDrawn](v2);
}

- (void)showPencilEducationPane
{
  if ((_MergedGlobals_156 & 1) == 0 && !HIBYTE(_MergedGlobals_156))
  {
    LOBYTE(_MergedGlobals_156) = 1;
    id v3 = +[PKHandwritingEducationPaneSettings sharedInstance]();
    BOOL User = -[PKHandwritingEducationPaneSettings isCurrentSystemVersionEqualToLastUserDrawn]((uint64_t)v3);

    if (User)
    {
      v5 = +[PKHandwritingEducationPaneSettings sharedInstance]();
      char v6 = -[PKHandwritingEducationPaneSettings hasSeenPane]((uint64_t)v5);

      if (PKIsPadDevice()
        && CHGetPersonalizedSynthesisSupportState() >= 3
        && PKCurrentAppSupportsRefinement()
        && (int v7 = [(id)objc_opt_class() hasAutoRefineLocaleEnabled], (v6 & 1) == 0)
        && v7)
      {
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        objc_super v8 = (void *)qword_1EB3C6240;
        uint64_t v38 = qword_1EB3C6240;
        if (!qword_1EB3C6240)
        {
          uint64_t v30 = MEMORY[0x1E4F143A8];
          uint64_t v31 = 3221225472;
          v32 = __getPNPWelcomeControllerClass_block_invoke;
          v33 = &unk_1E64C5478;
          v34 = &v35;
          __getPNPWelcomeControllerClass_block_invoke((uint64_t)&v30);
          objc_super v8 = (void *)v36[3];
        }
        id v9 = v8;
        _Block_object_dispose(&v35, 8);
        v10 = [v9 controllerWithType:8 buttonType:0 deviceType:0 delegate:self];
        v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v10];
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2050000000;
        v12 = (void *)qword_1EB3C6248;
        uint64_t v38 = qword_1EB3C6248;
        if (!qword_1EB3C6248)
        {
          uint64_t v30 = MEMORY[0x1E4F143A8];
          uint64_t v31 = 3221225472;
          v32 = __getPNPWizardViewControllerClass_block_invoke;
          v33 = &unk_1E64C5478;
          v34 = &v35;
          __getPNPWizardViewControllerClass_block_invoke((uint64_t)&v30);
          v12 = (void *)v36[3];
        }
        id v13 = v12;
        _Block_object_dispose(&v35, 8);
        [v13 preferredContentSize];
        double v15 = v14;
        double v17 = v16;
        v18 = [v11 view];
        v19 = [v18 widthAnchor];
        v20 = [v19 constraintEqualToConstant:v15];
        [v20 setActive:1];

        v21 = [v11 view];
        v22 = [v21 heightAnchor];
        v23 = [v22 constraintEqualToConstant:v17];
        [v23 setActive:1];

        v24 = [v11 view];
        v25 = [v24 layer];
        [v25 setCornerRadius:16.0];

        [v11 setModalPresentationStyle:2];
        v26 = [(PKWelcomeController *)self tiledView];
        v27 = [v26 window];
        v28 = [v27 rootViewController];
        [v28 presentModalViewController:v11 withTransition:3];

        v29 = +[PKHandwritingEducationPaneSettings sharedInstance]();
        -[PKHandwritingEducationPaneSettings setHasSeenPane:]((uint64_t)v29, 1);

        HIBYTE(_MergedGlobals_156) = 1;
      }
      else
      {
        HIBYTE(_MergedGlobals_156) = v6;
      }
    }
  }
}

+ (void)resetEducationPane
{
  +[PKSettingsDaemon setAutoRefineEnabled:0];
  id v2 = +[PKHandwritingEducationPaneSettings sharedInstance]();
  -[PKHandwritingEducationPaneSettings setHasSeenPane:]((uint64_t)v2, 0);

  _MergedGlobals_156 = 0;
}

- (void)handwritingEducationDoneButtonPressed:(id)a3
{
  id v5 = [(PKWelcomeController *)self tiledView];
  id v3 = [v5 window];
  v4 = [v3 rootViewController];
  [v4 dismissModalViewControllerWithTransition:7];
}

- (void)welcomeControllerButtonDidPress:(id)a3
{
  id v5 = [(PKWelcomeController *)self tiledView];
  id v3 = [v5 window];
  v4 = [v3 rootViewController];
  [v4 dismissModalViewControllerWithTransition:7];
}

- (PKTiledView)tiledView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);

  return (PKTiledView *)WeakRetained;
}

- (void)setTiledView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end