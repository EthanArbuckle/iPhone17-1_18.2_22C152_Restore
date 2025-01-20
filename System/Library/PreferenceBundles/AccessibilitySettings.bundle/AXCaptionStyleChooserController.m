@interface AXCaptionStyleChooserController
- (AXCaptionStyleChooserController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)isPreviewExpanded;
- (BOOL)isStoredColorType:(int)a3 equalWithColors:(id)a4;
- (BOOL)isStoredTransparencyType:(int)a3 equalWithTransparency:(id)a4;
- (NSArray)captionPreviewSpecifiers;
- (NSArray)videoOverrideSpecifiers;
- (__CFString)profileId;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_snapshotWindow:(id)a3 opaque:(BOOL)a4;
- (id)_splitImageAppropriately:(id)a3 statusBar:(id)a4 secondHalfStart:(CGPoint)a5 secondHalfEnd:(CGPoint)a6;
- (id)_videoOverrideText;
- (id)_videoOverridesStyle:(id)a3;
- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4;
- (void)captionPreviewWasTapped:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateTableCheckedSelection:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willResignActive;
@end

@implementation AXCaptionStyleChooserController

- (AXCaptionStyleChooserController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AXCaptionStyleChooserController;
  return [(AXCaptionStyleChooserController *)&v5 initWithNibName:a3 bundle:a4];
}

- (NSArray)captionPreviewSpecifiers
{
  v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 setProperty:@"PreviewCell" forKey:PSKeyNameKey];
  v4 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
  v7[0] = v3;
  v7[1] = v4;
  objc_super v5 = +[NSArray arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (void)updateTableCheckedSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OBJC_IVAR___PSListController__table;
  id v11 = v4;
  v6 = (char *)objc_msgSend(*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table], "numberOfRowsInSection:", objc_msgSend(v4, "section"));
  if ((uint64_t)v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, [v11 section]);
      v10 = [*(id *)&self->AXUISettingsBaseListController_opaque[v5] cellForRowAtIndexPath:v9];
      objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v11));
    }
  }
}

- (void)willResignActive
{
  if ([(AXCaptionStyleChooserController *)self isPreviewExpanded])
  {
    [(AXCaptionStyleChooserController *)self captionPreviewWasTapped:0];
  }
}

- (NSArray)videoOverrideSpecifiers
{
  v3 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:0 edit:0];
  uint64_t v4 = PSIDKey;
  [v3 setProperty:@"VideoOverridesStyleGroup" forKey:PSIDKey];
  uint64_t v5 = [(AXCaptionStyleChooserController *)self _videoOverrideText];
  [v3 setProperty:v5 forKey:PSFooterTextGroupKey];

  v6 = settingsLocString(@"CONTENT_PROVIDED_SWITCH", @"Captioning");
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setVideoOverridesStyle:specifier:" get:"_videoOverridesStyle:" detail:0 cell:6 edit:0];

  [v7 setProperty:@"VideoOverridesStyleSwitch" forKey:v4];
  v10[0] = v3;
  v10[1] = v7;
  v8 = +[NSArray arrayWithObjects:v10 count:2];

  return (NSArray *)v8;
}

- (__CFString)profileId
{
  v2 = [(AXCaptionStyleChooserController *)self parentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = (__CFString *)[v2 profileId];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v7 captionPreviewView];
    [v6 setPreviewDelegate:self];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row] || objc_msgSend(v7, "section"))
  {
    v12.receiver = self;
    v12.super_class = (Class)AXCaptionStyleChooserController;
    [(AXCaptionStyleChooserController *)&v12 tableView:v6 estimatedHeightForRowAtIndexPath:v7];
    double v9 = v8;
  }
  else
  {
    +[AXCaptionPreviewCell previewSize];
    double v9 = v11;
  }

  return v9;
}

- (BOOL)isStoredTransparencyType:(int)a3 equalWithTransparency:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1:
      [(AXCaptionStyleChooserController *)self profileId];
      uint64_t v7 = MACaptionAppearancePrefCopyForegroundOpacity();
      break;
    case 3:
      [(AXCaptionStyleChooserController *)self profileId];
      uint64_t v7 = MACaptionAppearancePrefCopyWindowOpacity();
      break;
    case 2:
      [(AXCaptionStyleChooserController *)self profileId];
      uint64_t v7 = MACaptionAppearancePrefCopyBackgroundOpacity();
      break;
    default:
LABEL_8:
      double v9 = AXCaptionTransparencyDefault(a3);
      double v8 = [v9 objectForKey:@"alpha"];

      goto LABEL_9;
  }
  double v8 = (void *)v7;
  if (!v7) {
    goto LABEL_8;
  }
LABEL_9:
  unsigned __int8 v10 = [v6 isEqual:v8];

  return v10;
}

- (BOOL)isStoredColorType:(int)a3 equalWithColors:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1:
      [(AXCaptionStyleChooserController *)self profileId];
      uint64_t v7 = (CGColor *)MACaptionAppearancePrefCopyForegroundColor();
      break;
    case 3:
      [(AXCaptionStyleChooserController *)self profileId];
      uint64_t v7 = (CGColor *)MACaptionAppearancePrefCopyWindowColor();
      break;
    case 2:
      [(AXCaptionStyleChooserController *)self profileId];
      uint64_t v7 = (CGColor *)MACaptionAppearancePrefCopyBackgroundColor();
      break;
    default:
LABEL_11:
      i = AXCaptionColorDefault(a3);
      goto LABEL_12;
  }
  double v8 = v7;
  if (!v7) {
    goto LABEL_11;
  }
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v7);
  Components = CGColorGetComponents(v8);
  for (i = +[NSMutableArray array];
  {
    double v12 = *Components++;
    v13 = +[NSNumber numberWithDouble:v12];
    [i addObject:v13];
  }
  CFRelease(v8);
LABEL_12:
  BOOL v14 = 0;
  for (unint64_t j = 0; j != 3; ++j)
  {
    v16 = [i objectAtIndexedSubscript:j];
    [v16 floatValue];
    float v18 = v17;

    v19 = [v6 objectAtIndexedSubscript:j];
    [v19 floatValue];
    float v21 = v20;

    if (vabds_f32(v18, v21) > 0.0001) {
      break;
    }
    BOOL v14 = j > 1;
  }

  return v14;
}

- (id)_splitImageAppropriately:(id)a3 statusBar:(id)a4 secondHalfStart:(CGPoint)a5 secondHalfEnd:(CGPoint)a6
{
  double y = a5.y;
  double x = a5.x;
  id v10 = a3;
  id v11 = a4;
  double v12 = +[UIScreen mainScreen];
  [v12 scale];
  double v14 = v13;

  v15 = +[UIScreen mainScreen];
  [v15 bounds];
  double v17 = v16;

  [v10 size];
  double v19 = v18;
  double v21 = v20;
  id v22 = v10;
  v23 = (CGImage *)[v22 CGImage];
  v24 = [(AXCaptionStyleChooserController *)self view];
  v25 = [v24 window];
  v26 = [v25 windowScene];
  v27 = [v26 statusBarManager];
  [v27 statusBarFrame];
  v74.origin.double y = v14 * v28;
  v74.size.height = v14 * 44.0;
  v74.origin.double x = 0.0;
  v74.size.width = v14 * v19;
  v29 = CGImageCreateWithImageInRect(v23, v74);

  v30 = +[UIImage imageWithCGImage:v29 scale:0 orientation:v14];
  CGImageRelease(v29);
  v31 = [(AXCaptionStyleChooserController *)self view];
  v32 = [v31 window];
  v33 = [v32 windowScene];
  v34 = [v33 statusBarManager];
  [v34 statusBarFrame];
  CGFloat v36 = v35 + 44.0;
  v37 = +[UIScreen mainScreen];
  [v37 scale];
  CGFloat v39 = v38;
  v73.width = v19;
  v73.height = v36;
  UIGraphicsBeginImageContextWithOptions(v73, 0, v39);

  objc_msgSend(v11, "drawAtPoint:", 0.0, 0.0);
  v40 = [(AXCaptionStyleChooserController *)self view];
  v41 = [v40 window];
  v42 = [v41 windowScene];
  v43 = [v42 statusBarManager];
  [v43 statusBarFrame];
  objc_msgSend(v30, "drawAtPoint:", 0.0, v44);

  v45 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
  id v46 = v22;
  v47 = (CGImage *)[v46 CGImage];
  v75.origin.double y = y * v14;
  v75.size.height = v14 * (v21 - y);
  v75.origin.double x = 0.0;
  v75.size.width = v14 * v19;
  v48 = CGImageCreateWithImageInRect(v47, v75);
  v49 = +[UIImage imageWithCGImage:v48 scale:0 orientation:v14];
  CGImageRelease(v48);
  v50 = +[UIDevice currentDevice];
  v51 = (char *)[v50 userInterfaceIdiom];

  if (v51 == (unsigned char *)&dword_0 + 1)
  {
    v52 = [(AXCaptionStyleChooserController *)self view];
    v53 = [v52 window];
    v54 = [v53 windowScene];
    v55 = [v54 statusBarManager];
    [v55 statusBarFrame];
    double v57 = v56 + 44.0;

    v58 = +[UIApplication sharedApplication];
    v59 = (char *)[v58 userInterfaceLayoutDirection];

    if (v59 == (unsigned char *)&dword_0 + 1) {
      double v60 = a6.x * v14;
    }
    else {
      double v60 = 0.0;
    }
    if (v59 == (unsigned char *)&dword_0 + 1) {
      double v61 = v17;
    }
    else {
      double v61 = x * v14;
    }
    double v62 = a6.y;
    if (v59 != (unsigned char *)&dword_0 + 1) {
      double v62 = y;
    }
    CGFloat v63 = v14 * (v62 - v57);
    v64 = (CGImage *)[v46 CGImage];
    v76.origin.double x = v60;
    v76.origin.double y = v14 * v57;
    v76.size.width = v61;
    v76.size.height = v63;
    v65 = CGImageCreateWithImageInRect(v64, v76);
    v66 = +[UIImage imageWithCGImage:v65 scale:0 orientation:v14];
    CGImageRelease(v65);
    v71[0] = v45;
    v71[1] = v49;
    v71[2] = v66;
    v67 = +[NSArray arrayWithObjects:v71 count:3];
  }
  else
  {
    v70[0] = v45;
    v70[1] = v49;
    v67 = +[NSArray arrayWithObjects:v70 count:2];
  }

  return v67;
}

- (id)_snapshotWindow:(id)a3 opaque:(BOOL)a4
{
  id v5 = a3;
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v10 = +[UIScreen mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v20.width = v7;
  v20.height = v9;
  UIGraphicsBeginImageContextWithOptions(v20, a4, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.width = v7;
  v21.size.height = v9;
  CGContextClearRect(CurrentContext, v21);
  if (!a4)
  {
    double v14 = +[UIColor whiteColor];
    [v14 setFill];

    v15 = UIGraphicsGetCurrentContext();
    v22.origin.double x = 0.0;
    v22.origin.double y = 0.0;
    v22.size.width = v7;
    v22.size.height = v9;
    CGContextFillRect(v15, v22);
  }
  double v16 = [v5 layer];
  [v16 renderInContext:UIGraphicsGetCurrentContext()];

  double v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (BOOL)isPreviewExpanded
{
  v2 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table];
  v3 = +[NSIndexPath indexPathForRow:0 inSection:0];
  uint64_t v4 = [v2 cellForRowAtIndexPath:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 captionPreviewView];
    unsigned __int8 v6 = [v5 isExpanded];
  }
  else
  {
    NSLog(@"Who was my first cell?");
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)captionPreviewWasTapped:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(AXFullscreenCaptionPreviewViewController);
  [(AXCaptionStyleChooserController *)self presentViewController:v5 animated:v3 completion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AXCaptionStyleChooserController;
  -[AXCaptionStyleChooserController viewWillTransitionToSize:withTransitionCoordinator:](&v4, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __86__AXCaptionStyleChooserController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__table);
  v2 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v4 = [v1 cellForRowAtIndexPath:v2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 layoutSubviews];
    BOOL v3 = [v4 captionPreviewView];
    [v3 updateExpandButtonPosition];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
}

void __55__AXCaptionStyleChooserController_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__table);
  v2 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v4 = [v1 cellForRowAtIndexPath:v2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 layoutSubviews];
    BOOL v3 = [v4 captionPreviewView];
    [v3 updateExpandButtonPosition];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->videoOverrideSpecifiers, 0);
  objc_storeStrong((id *)&self->captionPreviewSpecifiers, 0);
  objc_storeStrong((id *)&self->_padSidePortionImage, 0);
  objc_storeStrong((id *)&self->_bottomHalfSplitImage, 0);
  objc_storeStrong((id *)&self->_topHalfSplitImage, 0);
  objc_storeStrong((id *)&self->_landscapeBlackBackgroundView, 0);

  objc_storeStrong((id *)&self->_fullScreenPreviewWindow, 0);
}

- (id)_videoOverridesStyle:(id)a3
{
  return 0;
}

- (void)_setVideoOverridesStyle:(id)a3 specifier:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)_videoOverrideText
{
  return @"TEXT_HERE";
}

@end