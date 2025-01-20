@interface CPSDeveloperSettingsController
- (void)viewDidLoad;
@end

@implementation CPSDeveloperSettingsController

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)CPSDeveloperSettingsController;
  [(CPSDeveloperSettingsController *)&v39 viewDidLoad];
  uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
  v5 = [*(id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__specifier] identifier];
  unsigned int v6 = [v5 isEqualToString:@"APP_CLIPS_LOCAL_EXPERIENCES"];

  if (v6)
  {
    v7 = objc_alloc_init(CPSDeveloperSettingsLocalOverrideController);
    goto LABEL_8;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_9;
  }
  v8 = [*(id *)&self->PSViewController_opaque[v4] identifier];
  unsigned int v9 = [v8 isEqualToString:@"APP_CLIPS_DIAGNOSTICS"];

  if (v9)
  {
    v7 = +[DeveloperDiagnosticsViewControllerFactory appClipsDeveloperDiagnosticsViewController];
    goto LABEL_8;
  }
  v10 = [*(id *)&self->PSViewController_opaque[v4] identifier];
  unsigned int v11 = [v10 isEqualToString:@"UNIVERSAL_LINKS_DIAGNOSTICS"];

  if (!v11)
  {
LABEL_9:
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CPSDeveloperSettingsController.m", 30, @"Invalid specifier: %@", *(void *)&self->PSViewController_opaque[v4] object file lineNumber description];

    v12 = 0;
    goto LABEL_10;
  }
  v7 = +[DeveloperDiagnosticsViewControllerFactory universalLinksDeveloperDiagnosticsViewController];
LABEL_8:
  v12 = v7;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_10:
  v14 = [*(id *)&self->PSViewController_opaque[v4] name];
  [(CPSDeveloperSettingsController *)self setTitle:v14];

  [(CPSDeveloperSettingsController *)self addChildViewController:v12];
  v15 = [(CPSDeveloperSettingsController *)self view];
  v16 = [(CPSDeveloperSettingsLocalOverrideController *)v12 view];
  [v15 addSubview:v16];

  [(CPSDeveloperSettingsLocalOverrideController *)v12 didMoveToParentViewController:self];
  v17 = [(CPSDeveloperSettingsLocalOverrideController *)v12 view];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = [(CPSDeveloperSettingsLocalOverrideController *)v12 view];
  v36 = [v38 centerXAnchor];
  v37 = [(CPSDeveloperSettingsController *)self view];
  v35 = [v37 centerXAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v40[0] = v34;
  v33 = [(CPSDeveloperSettingsLocalOverrideController *)v12 view];
  v31 = [v33 centerYAnchor];
  v32 = [(CPSDeveloperSettingsController *)self view];
  v30 = [v32 centerYAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v40[1] = v29;
  v28 = [(CPSDeveloperSettingsLocalOverrideController *)v12 view];
  v27 = [v28 widthAnchor];
  v18 = [(CPSDeveloperSettingsController *)self view];
  v19 = [v18 widthAnchor];
  v20 = [v27 constraintEqualToAnchor:v19];
  v40[2] = v20;
  v21 = [(CPSDeveloperSettingsLocalOverrideController *)v12 view];
  v22 = [v21 heightAnchor];
  v23 = [(CPSDeveloperSettingsController *)self view];
  v24 = [v23 heightAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v40[3] = v25;
  v26 = +[NSArray arrayWithObjects:v40 count:4];
  +[NSLayoutConstraint activateConstraints:v26];
}

@end