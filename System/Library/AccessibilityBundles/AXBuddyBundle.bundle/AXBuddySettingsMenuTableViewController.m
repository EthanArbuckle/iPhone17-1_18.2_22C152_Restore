@interface AXBuddySettingsMenuTableViewController
- (id)SCATVC;
- (id)createWelcomeControllerWithAXSettingsController:(id)a3 title:(id)a4;
- (id)keyboardSettingsVC;
- (id)speechVC;
- (id)tableSections;
- (id)touchAndReachVC;
- (id)voiceOverVC;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AXBuddySettingsMenuTableViewController

- (void)dealloc
{
  AXUISettingsCleanUpWelcomeControllerTableViewObservations();
  v3.receiver = self;
  v3.super_class = (Class)AXBuddySettingsMenuTableViewController;
  [(AXBuddySettingsMenuTableViewController *)&v3 dealloc];
}

- (id)voiceOverVC
{
  v2 = AXSettingsBundle();
  objc_super v3 = (objc_class *)[v2 classNamed:@"VoiceOverController"];

  id v4 = objc_alloc_init(v3);

  return v4;
}

- (id)speechVC
{
  v2 = AXSettingsBundle();
  objc_super v3 = (objc_class *)[v2 classNamed:@"SpeechController"];

  id v4 = objc_alloc_init(v3);

  return v4;
}

- (id)touchAndReachVC
{
  v2 = AXSettingsBundle();
  objc_super v3 = (objc_class *)[v2 classNamed:@"AXTouchAndReachability"];

  id v4 = objc_alloc_init(v3);

  return v4;
}

- (id)keyboardSettingsVC
{
  v2 = AXSettingsBundle();
  objc_super v3 = (objc_class *)[v2 classNamed:@"AXKeyboardsController"];

  id v4 = objc_alloc_init(v3);

  return v4;
}

- (id)SCATVC
{
  v2 = AXSettingsBundle();
  objc_super v3 = (objc_class *)[v2 classNamed:@"SCATController"];

  id v4 = objc_alloc_init(v3);

  return v4;
}

- (id)createWelcomeControllerWithAXSettingsController:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AXSettingsBundle();
  v8 = (objc_class *)[v7 classNamed:v5];

  if (v8)
  {
    id v9 = objc_alloc_init(v8);
    AXUISettingsCreateWelcomeController();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = AXLogSettings();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8AC8((uint64_t)v5, v11);
    }

    id v10 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v6 detailText:0 icon:0 contentLayout:3];
  }

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((AXUISettingsHandleWelcomeControllerTableViewUpdate() & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)AXBuddySettingsMenuTableViewController;
    [(AXBuddySettingsMenuTableViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)tableSections
{
  objc_initWeak(&location, self);
  v2 = objc_alloc_init(AXBuddySettingsTitleItem);
  v91 = v2;
  v48 = +[NSArray arrayWithObjects:&v91 count:1];

  v46 = [[AXBuddySettingsTableSection alloc] initWithName:0 subitems:v48];
  objc_super v3 = [AXBuddySettingsLargeVCPushItem alloc];
  v66 = settingsLocString(@"VOICEOVER_TITLE", @"Accessibility");
  v68 = AXSettingsBundle();
  uint64_t v4 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v64 = +[UIImage imageNamed:@"VoiceOver" inBundle:v68 compatibleWithTraitCollection:v4];
  v45 = (void *)v4;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_60D0;
  v85[3] = &unk_C310;
  objc_copyWeak(&v86, &location);
  v62 = [(AXBuddySettingsVCPushItem *)v3 initWithName:v66 image:v64 viewControllerInstantiator:v85];
  v90[0] = v62;
  id v5 = [AXBuddySettingsLargeVCPushItem alloc];
  settingsLocString(@"ZOOM_TITLE", @"Accessibility");
  v55 = (id *)objc_claimAutoreleasedReturnValue();
  v60 = AXSettingsBundle();
  v58 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v56 = +[UIImage imageNamed:@"Zoom" inBundle:v60 compatibleWithTraitCollection:v58];
  uint64_t v6 = +[UIColor colorWithRed:0.290196078 green:0.290196078 blue:0.290196078 alpha:1.0];
  AXUIIconImageWithBackgroundForImage();
  v54 = (id *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v6;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_6154;
  v83[3] = &unk_C310;
  objc_copyWeak(&v84, &location);
  v53 = [(AXBuddySettingsVCPushItem *)v5 initWithName:v55 image:v54 viewControllerInstantiator:v83];
  v90[1] = v53;
  v7 = [AXBuddySettingsLargeVCPushItem alloc];
  v51 = settingsLocString(@"DISPLAY_AND_TEXT", @"Accessibility");
  v52 = AXSettingsBundle();
  uint64_t v8 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v50 = +[UIImage imageNamed:@"Text Size" inBundle:v52 compatibleWithTraitCollection:v8];
  v43 = (void *)v8;
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_61D8;
  v81[3] = &unk_C310;
  objc_copyWeak(&v82, &location);
  v49 = [(AXBuddySettingsVCPushItem *)v7 initWithName:v51 image:v50 viewControllerInstantiator:v81];
  v90[2] = v49;
  id v9 = [AXBuddySettingsLargeVCPushItem alloc];
  id v10 = settingsLocString(@"MOTION_TITLE", @"Accessibility");
  id v11 = AXSettingsBundle();
  id v12 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  objc_super v13 = +[UIImage imageNamed:@"Motion" inBundle:v11 compatibleWithTraitCollection:v12];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_625C;
  v79[3] = &unk_C310;
  objc_copyWeak(&v80, &location);
  v14 = [(AXBuddySettingsVCPushItem *)v9 initWithName:v10 image:v13 viewControllerInstantiator:v79];
  v90[3] = v14;
  v15 = [AXBuddySettingsLargeVCPushItem alloc];
  v16 = settingsLocString(@"SPEECH_TITLE", @"Accessibility");
  v17 = AXSettingsBundle();
  v18 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v19 = +[UIImage imageNamed:@"Speech" inBundle:v17 compatibleWithTraitCollection:v18];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_62E0;
  v77[3] = &unk_C310;
  objc_copyWeak(&v78, &location);
  v20 = [(AXBuddySettingsVCPushItem *)v15 initWithName:v16 image:v19 viewControllerInstantiator:v77];
  v90[4] = v20;
  v47 = +[NSArray arrayWithObjects:v90 count:5];

  v21 = [AXBuddySettingsTableSection alloc];
  v22 = settingsLocString(@"VISION", @"Accessibility");
  v61 = [(AXBuddySettingsTableSection *)v21 initWithName:v22 subitems:v47];

  v23 = [AXBuddySettingsLargeVCPushItem alloc];
  v69 = settingsLocString(@"TOUCH", @"Accessibility");
  uint64_t v24 = AXSettingsBundle();
  uint64_t v25 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v67 = +[UIImage imageNamed:@"Touch" inBundle:v24 compatibleWithTraitCollection:v25];
  v57 = (void *)v24;
  v59 = (void *)v25;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_6364;
  v75[3] = &unk_C310;
  objc_copyWeak(&v76, &location);
  v65 = [(AXBuddySettingsVCPushItem *)v23 initWithName:v69 image:v67 viewControllerInstantiator:v75];
  v89[0] = v65;
  v26 = [AXBuddySettingsLargeVCPushItem alloc];
  v63 = AXBuddyBundleLocString(@"SWITCH_CONTROL_TITLE");
  v27 = AXSettingsBundle();
  v28 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v29 = +[UIImage imageNamed:@"SwitchControl" inBundle:v27 compatibleWithTraitCollection:v28];
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_63E8;
  v73[3] = &unk_C310;
  objc_copyWeak(&v74, &location);
  v30 = [(AXBuddySettingsVCPushItem *)v26 initWithName:v63 image:v29 viewControllerInstantiator:v73];
  v89[1] = v30;
  v31 = [AXBuddySettingsLargeVCPushItem alloc];
  v32 = settingsLocString(@"KEYBOARDS", @"Accessibility");
  v33 = AXSettingsBundle();
  v34 = [(AXBuddySettingsMenuTableViewController *)self traitCollection];
  v35 = +[UIImage imageNamed:@"Keyboards" inBundle:v33 compatibleWithTraitCollection:v34];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_6464;
  v71[3] = &unk_C310;
  objc_copyWeak(&v72, &location);
  v36 = [(AXBuddySettingsVCPushItem *)v31 initWithName:v32 image:v35 viewControllerInstantiator:v71];
  v89[2] = v36;
  v37 = +[NSArray arrayWithObjects:v89 count:3];

  v38 = [AXBuddySettingsTableSection alloc];
  v39 = settingsLocString(@"MOBILITY_HEADING", @"Accessibility");
  v40 = [(AXBuddySettingsTableSection *)v38 initWithName:v39 subitems:v37];

  v88[0] = v46;
  v88[1] = v61;
  v88[2] = v40;
  v41 = +[NSArray arrayWithObjects:v88 count:3];

  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&v76);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);

  objc_destroyWeak(&location);

  return v41;
}

@end