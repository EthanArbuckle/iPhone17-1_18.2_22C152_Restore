@interface CSCoverSheetTransitionsSettings
+ (id)settingsControllerModule;
- (CSCoverSheetFlyInSettings)flyInSettings;
- (CSCoverSheetTransitionSettings)captureExtensionToAppTransitionSettings;
- (CSCoverSheetTransitionSettings)differentWallpaperInitialTransitionSettings;
- (CSCoverSheetTransitionSettings)differentWallpaperSubsequentTransitionSettings;
- (CSCoverSheetTransitionSettings)inactiveOverAppTransitionSettings;
- (CSCoverSheetTransitionSettings)inactiveOverHomescreenTransitionSettings;
- (CSCoverSheetTransitionSettings)overAppTransitionSettings;
- (CSCoverSheetTransitionSettings)overLandscapeTransitionSettings;
- (CSCoverSheetTransitionSettings)sameWallpaperInitialTransitionSettings;
- (CSCoverSheetTransitionSettings)sameWallpaperSubsequentTransitionSettings;
- (double)friction;
- (double)inPlaceFriction;
- (double)inPlaceTension;
- (double)tension;
- (void)setCaptureExtensionToAppTransitionSettings:(id)a3;
- (void)setDefaultValuesForBaseConfiguration;
- (void)setDefaultValuesForBlurOnly;
- (void)setDefaultValuesForFadeAndScale;
- (void)setDefaultValuesForParallaxAndBlur;
- (void)setDefaultValuesForParallaxOnly;
- (void)setDifferentWallpaperInitialTransitionSettings:(id)a3;
- (void)setDifferentWallpaperSubsequentTransitionSettings:(id)a3;
- (void)setFlyInSettings:(id)a3;
- (void)setFriction:(double)a3;
- (void)setInPlaceFriction:(double)a3;
- (void)setInPlaceTension:(double)a3;
- (void)setInactiveOverAppTransitionSettings:(id)a3;
- (void)setInactiveOverHomescreenTransitionSettings:(id)a3;
- (void)setOverAppTransitionSettings:(id)a3;
- (void)setOverLandscapeTransitionSettings:(id)a3;
- (void)setSameWallpaperInitialTransitionSettings:(id)a3;
- (void)setSameWallpaperSubsequentTransitionSettings:(id)a3;
- (void)setTension:(double)a3;
@end

@implementation CSCoverSheetTransitionsSettings

- (void)setDefaultValuesForBaseConfiguration
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  [v3 userInterfaceIdiom];

  [(CSCoverSheetTransitionsSettings *)self setTension:300.0];
  [(CSCoverSheetTransitionsSettings *)self setFriction:34.0];
  [(CSCoverSheetTransitionsSettings *)self setInPlaceTension:61.68503];
  [(CSCoverSheetTransitionsSettings *)self setInPlaceFriction:15.70796];
  v4 = [(CSCoverSheetTransitionsSettings *)self sameWallpaperInitialTransitionSettings];
  [v4 setDefaultValues];
  [v4 setOrientPanelWallpaper:0];
  [v4 setBlursPanel:0];
  [v4 setFloatingLayerAsWallpaperOverlay:1];

  v5 = [(CSCoverSheetTransitionsSettings *)self differentWallpaperInitialTransitionSettings];
  [v5 setDefaultValues];
  [v5 setPanelWallpaper:1];

  v6 = [(CSCoverSheetTransitionsSettings *)self sameWallpaperSubsequentTransitionSettings];
  [v6 setDefaultValues];
  [v6 setOrientPanelWallpaper:0];
  [v6 setFloatingLayerAsWallpaperOverlay:1];

  v7 = [(CSCoverSheetTransitionsSettings *)self differentWallpaperSubsequentTransitionSettings];
  [v7 setDefaultValues];
  [v7 setPanelWallpaper:1];

  v8 = [(CSCoverSheetTransitionsSettings *)self overAppTransitionSettings];
  [v8 setDefaultValues];
  [v8 setPanelWallpaper:1];
  [v8 setFloatingLayerAsWallpaperOverlay:1];
  [v8 setRevealWallpaper:1];
  [v8 setIconsFlyIn:0];

  v9 = [(CSCoverSheetTransitionsSettings *)self captureExtensionToAppTransitionSettings];
  [v9 setDefaultValues];
  [v9 setIconsFlyIn:0];
  [v9 setTransitionStyle:1];
  [v9 setFadesCoverSheetContent:1];
  [v9 setDarkensContent:0];
  [v9 setFadesContent:0];
  [v9 setBlursPanel:0];

  v10 = [(CSCoverSheetTransitionsSettings *)self overLandscapeTransitionSettings];
  [v10 setDefaultValues];
  [v10 setBlursPanel:0];
  [v10 setPanelWallpaper:1];
  [v10 setTrackingWallpaper:1];
  [v10 setRevealWallpaper:1];
  [v10 setFadesContent:0];
  [v10 setIconsFlyIn:0];

  v11 = [(CSCoverSheetTransitionsSettings *)self inactiveOverHomescreenTransitionSettings];
  [v11 setDefaultValues];
  [v11 setTransitionStyle:1];
  [v11 setBlursPanel:0];
  [v11 setBlursBehindCoverSheet:1];
  [v11 setBehindCoverSheetBlurRadius:50.0];
  [v11 setPanelWallpaper:1];
  [v11 setOrientPanelWallpaper:1];
  [v11 setFadePanelWallpaper:1];
  [v11 setFadesContent:0];
  [v11 setFadesCoverSheetContent:1];
  [v11 setFadesCoverSheetContentStart:0.8];
  [v11 setFadesCoverSheetContentEnd:1.0];
  [v11 setAlwaysFadesCoverSheetContent:0];

  v12 = [(CSCoverSheetTransitionsSettings *)self inactiveOverAppTransitionSettings];
  [v12 setDefaultValues];
  v13 = [(CSCoverSheetTransitionsSettings *)self inactiveOverHomescreenTransitionSettings];
  [v12 applySettings:v13];

  [v12 setUsesFixedWallpaperPresentationProgress:1];
  [v12 setFixedWallpaperPresentationProgress:0.0];

  id v14 = [(CSCoverSheetTransitionsSettings *)self flyInSettings];
  [v14 setDefaultValues];
}

- (void)setDefaultValuesForParallaxOnly
{
  [(CSCoverSheetTransitionsSettings *)self setDefaultValuesForBaseConfiguration];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"differentWallpaperInitialTransitionSettings.blursPanel"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"differentWallpaperInitialTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperInitialTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"differentWallpaperInitialTransitionSettings.trackingWallpaperParallaxFactor"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.trackingWallpaperParallaxFactor"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"overAppTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"overAppTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"overAppTransitionSettings.trackingWallpaperParallaxFactor"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaper"];

  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.fadesContent"];
}

- (void)setDefaultValuesForBlurOnly
{
  [(CSCoverSheetTransitionsSettings *)self setDefaultValuesForBaseConfiguration];
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"differentWallpaperInitialTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperInitialTransitionSettings.panelWallpaper"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"differentWallpaperInitialTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaperEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperInitialTransitionSettings.contentFadeStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A668 forKeyPath:@"differentWallpaperInitialTransitionSettings.contentFadeEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.contentFadeStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A668 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.contentFadeEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"overAppTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaperEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A678 forKeyPath:@"overAppTransitionSettings.contentFadeStart"];

  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A678 forKeyPath:@"overAppTransitionSettings.contentFadeEnd"];
}

- (void)setDefaultValuesForParallaxAndBlur
{
  [(CSCoverSheetTransitionsSettings *)self setDefaultValuesForBaseConfiguration];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"differentWallpaperInitialTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperInitialTransitionSettings.panelWallpaper"];
  v5 = NSNumber;
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    BOOL v8 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v8 = [v2 userInterfaceIdiom] == 1;
  }
  v9 = [v5 numberWithInt:v8];
  [(CSCoverSheetTransitionsSettings *)self setValue:v9 forKeyPath:@"differentWallpaperInitialTransitionSettings.trackingWallpaper"];

  if ((v7 & 1) == 0) {
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"differentWallpaperInitialTransitionSettings.trackingWallpaperParallaxFactor"];
  }
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadePanelWallpaperEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v10 forKeyPath:@"differentWallpaperInitialTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperInitialTransitionSettings.contentFadeStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A668 forKeyPath:@"differentWallpaperInitialTransitionSettings.contentFadeEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v10 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v10 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.panelWallpaper"];
  v11 = NSNumber;
  int v12 = __sb__runningInSpringBoard();
  char v13 = v12;
  if (v12)
  {
    BOOL v14 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v14 = [v2 userInterfaceIdiom] == 1;
  }
  v15 = [v11 numberWithInt:v14];
  [(CSCoverSheetTransitionsSettings *)self setValue:v15 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.trackingWallpaper"];

  if ((v13 & 1) == 0) {
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.trackingWallpaperParallaxFactor"];
  }
  uint64_t v16 = MEMORY[0x1E4F1CC38];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v16 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.contentFadeStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A668 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.contentFadeEnd"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v16 forKeyPath:@"overAppTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v16 forKeyPath:@"overAppTransitionSettings.panelWallpaper"];
  v17 = NSNumber;
  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    BOOL v20 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v20 = [v2 userInterfaceIdiom] == 1;
  }
  v21 = [v17 numberWithInt:v20];
  [(CSCoverSheetTransitionsSettings *)self setValue:v21 forKeyPath:@"overAppTransitionSettings.trackingWallpaper"];

  if ((v19 & 1) == 0) {
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"overAppTransitionSettings.trackingWallpaperParallaxFactor"];
  }
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"overAppTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaperEnd"];
  uint64_t v22 = MEMORY[0x1E4F1CC28];

  [(CSCoverSheetTransitionsSettings *)self setValue:v22 forKeyPath:@"overAppTransitionSettings.fadesContent"];
}

- (void)setDefaultValuesForFadeAndScale
{
  [(CSCoverSheetTransitionsSettings *)self setDefaultValuesForBaseConfiguration];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC28] forKeyPath:@"sameWallpaperSubsequentTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.panelWallpaper"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(CSCoverSheetTransitionsSettings *)self setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"sameWallpaperSubsequentTransitionSettings.scaleWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.darkensContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.orientPanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"sameWallpaperSubsequentTransitionSettings.fadesCoverSheetContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.scaleWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadesContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.darkensContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"differentWallpaperSubsequentTransitionSettings.fadesCoverSheetContent"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.blursPanel"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"overAppTransitionSettings.panelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"overAppTransitionSettings.trackingWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A638 forKeyPath:@"overAppTransitionSettings.trackingWallpaperParallaxFactor"];
  [(CSCoverSheetTransitionsSettings *)self setValue:v4 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaper"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A648 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaperStart"];
  [(CSCoverSheetTransitionsSettings *)self setValue:&unk_1F306A658 forKeyPath:@"overAppTransitionSettings.fadePanelWallpaperEnd"];

  [(CSCoverSheetTransitionsSettings *)self setValue:v3 forKeyPath:@"overAppTransitionSettings.fadesContent"];
}

+ (id)settingsControllerModule
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v40 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tension" valueKeyPath:@"tension"];
  v39 = [MEMORY[0x1E4F94148] rowWithTitle:@"Friction" valueKeyPath:@"friction"];
  v38 = [MEMORY[0x1E4F94148] rowWithTitle:@"In-Place Tension" valueKeyPath:@"inPlaceTension"];
  v37 = [MEMORY[0x1E4F94148] rowWithTitle:@"In-Place Friction" valueKeyPath:@"inPlaceFriction"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v48[0] = v40;
  v48[1] = v39;
  v48[2] = v38;
  v48[3] = v37;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
  v35 = [v2 sectionWithRows:v3];

  v36 = [MEMORY[0x1E4F94130] rowWithTitle:@"Fly In" childSettingsKeyPath:@"flyInSettings"];
  uint64_t v4 = (void *)MEMORY[0x1E4F94160];
  v47 = v36;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v33 = [v4 sectionWithRows:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke;
  v41[3] = &unk_1E6AD8A90;
  id v42 = &unk_1F306B1D0;
  id v43 = v6;
  id v34 = v6;
  [&unk_1F306B1B8 enumerateObjectsUsingBlock:v41];
  v32 = [MEMORY[0x1E4F94160] sectionWithRows:v34];
  char v7 = (void *)MEMORY[0x1E4F940F8];
  BOOL v8 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_1];
  v31 = [v7 rowWithTitle:@"Parallax Only" action:v8];

  v9 = (void *)MEMORY[0x1E4F940F8];
  uint64_t v10 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_236];
  v30 = [v9 rowWithTitle:@"Blur Only" action:v10];

  v11 = (void *)MEMORY[0x1E4F940F8];
  int v12 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_241];
  char v13 = [v11 rowWithTitle:@"Parallax And Blur" action:v12];

  BOOL v14 = (void *)MEMORY[0x1E4F940F8];
  v15 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_246];
  uint64_t v16 = [v14 rowWithTitle:@"Fade and Scale" action:v15];

  v17 = (void *)MEMORY[0x1E4F94160];
  v46[0] = v31;
  v46[1] = v30;
  v46[2] = v13;
  v46[3] = v16;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
  char v19 = [v17 sectionWithRows:v18 title:@"Presets"];

  BOOL v20 = (void *)MEMORY[0x1E4F94160];
  v21 = (void *)MEMORY[0x1E4F940F8];
  uint64_t v22 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v23 = [v21 rowWithTitle:@"Restore Defaults" action:v22];
  v45 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v25 = [v20 sectionWithRows:v24];

  v26 = (void *)MEMORY[0x1E4F94160];
  v44[0] = v35;
  v44[1] = v33;
  v44[2] = v32;
  v44[3] = v19;
  v44[4] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];
  v28 = [v26 moduleWithTitle:@"CoverSheet Transitions" contents:v27];

  return v28;
}

void __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  }
  id v6 = [MEMORY[0x1E4F94130] rowWithTitle:v5 childSettingsKeyPath:v7];
  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 settings];
  [v3 setDefaultValuesForParallaxOnly];

  return 1;
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 settings];
  [v3 setDefaultValuesForBlurOnly];

  return 1;
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 settings];
  [v3 setDefaultValuesForParallaxAndBlur];

  return 1;
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 settings];
  [v3 setDefaultValuesForFadeAndScale];

  return 1;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (CSCoverSheetFlyInSettings)flyInSettings
{
  return self->_flyInSettings;
}

- (void)setFlyInSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)sameWallpaperInitialTransitionSettings
{
  return self->_sameWallpaperInitialTransitionSettings;
}

- (void)setSameWallpaperInitialTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)differentWallpaperInitialTransitionSettings
{
  return self->_differentWallpaperInitialTransitionSettings;
}

- (void)setDifferentWallpaperInitialTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)sameWallpaperSubsequentTransitionSettings
{
  return self->_sameWallpaperSubsequentTransitionSettings;
}

- (void)setSameWallpaperSubsequentTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)differentWallpaperSubsequentTransitionSettings
{
  return self->_differentWallpaperSubsequentTransitionSettings;
}

- (void)setDifferentWallpaperSubsequentTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)overAppTransitionSettings
{
  return self->_overAppTransitionSettings;
}

- (void)setOverAppTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)captureExtensionToAppTransitionSettings
{
  return self->_captureExtensionToAppTransitionSettings;
}

- (void)setCaptureExtensionToAppTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)overLandscapeTransitionSettings
{
  return self->_overLandscapeTransitionSettings;
}

- (void)setOverLandscapeTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)inactiveOverAppTransitionSettings
{
  return self->_inactiveOverAppTransitionSettings;
}

- (void)setInactiveOverAppTransitionSettings:(id)a3
{
}

- (CSCoverSheetTransitionSettings)inactiveOverHomescreenTransitionSettings
{
  return self->_inactiveOverHomescreenTransitionSettings;
}

- (void)setInactiveOverHomescreenTransitionSettings:(id)a3
{
}

- (double)inPlaceTension
{
  return self->_inPlaceTension;
}

- (void)setInPlaceTension:(double)a3
{
  self->_inPlaceTension = a3;
}

- (double)inPlaceFriction
{
  return self->_inPlaceFriction;
}

- (void)setInPlaceFriction:(double)a3
{
  self->_inPlaceFriction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveOverHomescreenTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inactiveOverAppTransitionSettings, 0);
  objc_storeStrong((id *)&self->_overLandscapeTransitionSettings, 0);
  objc_storeStrong((id *)&self->_captureExtensionToAppTransitionSettings, 0);
  objc_storeStrong((id *)&self->_overAppTransitionSettings, 0);
  objc_storeStrong((id *)&self->_differentWallpaperSubsequentTransitionSettings, 0);
  objc_storeStrong((id *)&self->_sameWallpaperSubsequentTransitionSettings, 0);
  objc_storeStrong((id *)&self->_differentWallpaperInitialTransitionSettings, 0);
  objc_storeStrong((id *)&self->_sameWallpaperInitialTransitionSettings, 0);

  objc_storeStrong((id *)&self->_flyInSettings, 0);
}

@end