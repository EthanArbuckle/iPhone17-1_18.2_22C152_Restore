@interface CCUIFlashlightBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (CCUIFlashlightBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_updateGlyphForFlashlightLevel:(unint64_t)a3;
- (void)flashlightLevelDidChange:(unint64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCUIFlashlightBackgroundViewController

- (CCUIFlashlightBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIFlashlightBackgroundViewController;
  v4 = [(CCUIFlashlightBackgroundViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4 && [MEMORY[0x263F796B8] deviceSupportsFlashlight])
  {
    v5 = [MEMORY[0x263F796B8] sharedInstance];
    [v5 addObserver:v4];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIFlashlightBackgroundViewController;
  [(CCUIFlashlightBackgroundViewController *)&v5 viewWillAppear:a3];
  if ([MEMORY[0x263F796B8] deviceSupportsFlashlight])
  {
    v4 = [MEMORY[0x263F796B8] sharedInstance];
    -[CCUIFlashlightBackgroundViewController _updateGlyphForFlashlightLevel:](self, "_updateGlyphForFlashlightLevel:", [v4 level]);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);

  [(CCUIFlashlightBackgroundViewController *)self _updateGlyphForFlashlightLevel:a3];
}

- (void)_updateGlyphForFlashlightLevel:(unint64_t)a3
{
  v4 = @"flashlight.on.fill";
  if (!a3) {
    v4 = @"flashlight.off.fill";
  }
  objc_super v5 = (void *)MEMORY[0x263F1C6C8];
  v6 = v4;
  id v8 = [v5 configurationWithPointSize:3 weight:2 scale:30.0];
  objc_super v7 = [MEMORY[0x263F1C6B0] systemImageNamed:v6 withConfiguration:v8];

  [(CCUICustomContentModuleBackgroundViewController *)self setHeaderGlyphImage:v7 unscaledSymbolPointSize:30.0];
}

@end