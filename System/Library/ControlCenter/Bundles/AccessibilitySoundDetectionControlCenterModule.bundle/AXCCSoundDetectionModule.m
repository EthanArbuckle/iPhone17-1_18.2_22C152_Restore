@interface AXCCSoundDetectionModule
- (AXCCSoundDetectionModule)init;
- (AXCCSoundDetectionModuleViewController)contentViewController;
- (BOOL)isSelected;
- (CCUIContentModuleContext)contentModuleContext;
- (void)_initializeViewContent;
- (void)expandModule;
- (void)openSoundDetectionSettings;
- (void)setContentModuleContext:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation AXCCSoundDetectionModule

- (AXCCSoundDetectionModule)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXCCSoundDetectionModule;
  v2 = [(AXCCSoundDetectionModule *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2405FE364;
    v6[3] = &unk_2650C6FA8;
    v7 = v2;
    v4 = (void (**)(void))MEMORY[0x2455F0D50](v6);
    if ([MEMORY[0x263F08B88] isMainThread]) {
      v4[2](v4);
    }
    else {
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
  return v3;
}

- (void)_initializeViewContent
{
  v3 = [(CCUIMenuModuleViewController *)[AXCCSoundDetectionModuleViewController alloc] initWithNibName:0 bundle:0];
  contentViewController = self->_contentViewController;
  self->_contentViewController = v3;

  [(AXCCSoundDetectionModuleViewController *)self->_contentViewController setSoundDetectionDelegate:self];
  [(AXCCSoundDetectionModuleViewController *)self->_contentViewController setModule:self];
  v5 = self->_contentViewController;
  v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v8 = [v6 imageNamed:@"SoundDetectionIcon" inBundle:v7];
  [(CCUIMenuModuleViewController *)v5 setGlyphImage:v8];

  v9 = self->_contentViewController;
  v10 = (void *)MEMORY[0x263F1C6B0];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v10 imageNamed:@"SoundDetectionIcon" inBundle:v11];
  [(CCUIButtonModuleViewController *)v9 setSelectedGlyphImage:v12];

  v13 = self->_contentViewController;
  v14 = [MEMORY[0x263F1C550] systemPinkColor];
  [(CCUIButtonModuleViewController *)v13 setSelectedGlyphColor:v14];

  if (![(CCUIButtonModuleViewController *)self->_contentViewController isExpanded])
  {
    BOOL v15 = [(AXCCSoundDetectionModule *)self isSelected];
    v16 = self->_contentViewController;
    [(CCUIButtonModuleViewController *)v16 setSelected:v15];
  }
}

- (void)expandModule
{
  id v2 = [(AXCCSoundDetectionModule *)self contentModuleContext];
  [v2 requestExpandModule];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(AXCCSoundDetectionModule *)self contentModuleContext];
  v4 = (void *)MEMORY[0x263F33CD8];
  if (v3) {
    v5 = @"status.running";
  }
  else {
    v5 = @"status.paused";
  }
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  v7 = sub_2405FE5FC(v5);
  objc_super v8 = [v4 statusUpdateWithMessage:v7 type:v6];
  [v9 enqueueStatusUpdate:v8];
}

- (BOOL)isSelected
{
  id v2 = [MEMORY[0x263F21DA0] sharedInstance];
  BOOL v3 = [v2 soundDetectionState] == 2;

  return v3;
}

- (void)openSoundDetectionSettings
{
  [NSURL URLWithString:@"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(AXCCSoundDetectionModule *)self contentModuleContext];
  [v3 openURL:v4 completionHandler:0];
}

- (AXCCSoundDetectionModuleViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end