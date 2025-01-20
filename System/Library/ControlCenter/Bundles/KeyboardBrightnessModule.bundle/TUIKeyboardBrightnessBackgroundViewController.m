@interface TUIKeyboardBrightnessBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (TUIKeyboardBrightnessBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation TUIKeyboardBrightnessBackgroundViewController

- (TUIKeyboardBrightnessBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)TUIKeyboardBrightnessBackgroundViewController;
  v4 = [(TUIKeyboardBrightnessBackgroundViewController *)&v23 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (void *)MEMORY[0x263F1C6B0];
    v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    v11 = objc_msgSend_bundleForClass_(v6, v8, v7, v9, v10);
    v14 = objc_msgSend_imageNamed_inBundle_(v5, v12, @"KeyboardBrightness", (uint64_t)v11, v13);

    v18 = objc_msgSend_imageWithRenderingMode_(v14, v15, 2, v16, v17);

    objc_msgSend_setHeaderGlyphImage_(v4, v19, (uint64_t)v18, v20, v21);
  }
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end