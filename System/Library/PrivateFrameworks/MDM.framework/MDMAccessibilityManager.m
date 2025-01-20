@interface MDMAccessibilityManager
+ (id)sharedInstance;
- (BOOL)boldTextEnabled;
- (BOOL)grayscaleEnabled;
- (BOOL)increaseContrastEnabled;
- (BOOL)isValidTextSize:(int64_t)a3;
- (BOOL)reduceMotionEnabled;
- (BOOL)reduceTransparencyEnabled;
- (BOOL)touchAccommodationsEnabled;
- (BOOL)voiceOverEnabled;
- (BOOL)zoomEnabled;
- (int64_t)textSize;
- (void)setBoldTextEnabled:(BOOL)a3;
- (void)setGrayscaleEnabled:(BOOL)a3;
- (void)setIncreaseContrastEnabled:(BOOL)a3;
- (void)setReduceMotionEnabled:(BOOL)a3;
- (void)setReduceTransparencyEnabled:(BOOL)a3;
- (void)setTextSize:(int64_t)a3;
- (void)setTouchAccommodationsEnabled:(BOOL)a3;
- (void)setVoiceOverEnabled:(BOOL)a3;
- (void)setZoomEnabled:(BOOL)a3;
@end

@implementation MDMAccessibilityManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __41__MDMAccessibilityManager_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)boldTextEnabled
{
  return _AXSEnhanceTextLegibilityEnabled() != 0;
}

- (void)setBoldTextEnabled:(BOOL)a3
{
}

- (BOOL)increaseContrastEnabled
{
  return _AXDarkenSystemColors() != 0;
}

- (void)setIncreaseContrastEnabled:(BOOL)a3
{
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

- (void)setReduceMotionEnabled:(BOOL)a3
{
}

- (BOOL)reduceTransparencyEnabled
{
  return _AXSEnhanceBackgroundContrastEnabled() != 0;
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
}

- (BOOL)touchAccommodationsEnabled
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  char v3 = [v2 touchAccommodationsEnabled];

  return v3;
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F22938] sharedInstance];
  [v4 setTouchAccommodationsEnabled:v3];
}

- (BOOL)voiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

- (void)setVoiceOverEnabled:(BOOL)a3
{
}

- (BOOL)zoomEnabled
{
  return _AXSZoomTouchEnabled() != 0;
}

- (void)setZoomEnabled:(BOOL)a3
{
}

- (int64_t)textSize
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = -1;
  v2 = (void *)_AXSCopyPreferredContentSizeCategoryName();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__MDMAccessibilityManager_textSize__block_invoke;
  v6[3] = &unk_264B9D130;
  id v3 = v2;
  id v7 = v3;
  v8 = &v9;
  [&unk_26E553C38 enumerateObjectsUsingBlock:v6];
  int64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __35__MDMAccessibilityManager_textSize__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)setTextSize:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (-[MDMAccessibilityManager isValidTextSize:](self, "isValidTextSize:"))
  {
    id v8 = [&unk_26E553C38 objectAtIndexedSubscript:a3];
    _AXSSetPreferredContentSizeCategoryName();
  }
  else
  {
    int64_t v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      __int16 v11 = 1024;
      int v12 = a3;
      _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_ERROR, "%{public}@ text size is out of range (%d)", buf, 0x12u);
    }
  }
}

- (BOOL)isValidTextSize:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && [&unk_26E553C38 count] >= (unint64_t)a3;
}

- (BOOL)grayscaleEnabled
{
  return self->_grayscaleEnabled;
}

- (void)setGrayscaleEnabled:(BOOL)a3
{
  self->_grayscaleEnabled = a3;
}

@end