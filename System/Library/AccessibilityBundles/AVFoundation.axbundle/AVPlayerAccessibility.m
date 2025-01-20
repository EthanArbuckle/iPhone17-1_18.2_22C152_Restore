@interface AVPlayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVPlayerAccessibility)init;
- (void)_accessibilityAsyncObserveAVPlayerIfNeeded;
- (void)_advanceCurrentItemAccordingToFigPlaybackItem:(OpaqueFigPlaybackItem *)a3;
- (void)willChangeValueForKey:(id)a3;
@end

@implementation AVPlayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayer", @"_advanceCurrentItemAccordingToFigPlaybackItem:", "v", "^{OpaqueFigPlaybackItem=}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayer", @"actionAtItemEnd", "q", 0);
}

- (void)_advanceCurrentItemAccordingToFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerAccessibility;
  [(AVPlayerAccessibility *)&v3 _advanceCurrentItemAccordingToFigPlaybackItem:a3];
}

- (AVPlayerAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerAccessibility;
  v2 = [(AVPlayerAccessibility *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(AVPlayerAccessibility *)v2 _accessibilityAsyncObserveAVPlayerIfNeeded];
  }

  return v3;
}

- (void)willChangeValueForKey:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVPlayerAccessibility;
  id v4 = a3;
  [(AVPlayerAccessibility *)&v6 willChangeValueForKey:v4];
  int v5 = objc_msgSend(v4, "isEqualToString:", @"currentItem", v6.receiver, v6.super_class);

  if (v5) {
    [(AVPlayerAccessibility *)self _accessibilityAsyncObserveAVPlayerIfNeeded];
  }
}

- (void)_accessibilityAsyncObserveAVPlayerIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerAccessibility__accessibilityAsyncObserveAVPlayerIfNeeded__block_invoke;
  block[3] = &unk_2651013B8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__AVPlayerAccessibility__accessibilityAsyncObserveAVPlayerIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (UIAccessibilityIsVoiceOverRunning()
    || (+[AXAVFoundationMediaDescriptionManager sharedManager](AXAVFoundationMediaDescriptionManager, "sharedManager"), v2 = objc_claimAutoreleasedReturnValue(), int v3 = [v2 isVoiceOverInTheTripleClickMenu], v2, v3))
  {
    id v4 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
      v7 = +[AXAVFoundationMediaDescriptionManager sharedManager];
      int v12 = 134218496;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      BOOL v15 = IsVoiceOverRunning;
      __int16 v16 = 2048;
      uint64_t v17 = [v7 isVoiceOverInTheTripleClickMenu];
      _os_log_impl(&dword_241E8C000, v4, OS_LOG_TYPE_DEFAULT, "AX will begin observing player=%p because UIAccessibilityIsVoiceOverRunning=%ld or isVoiceOverInTheTripleClickMenu=%ld", (uint8_t *)&v12, 0x20u);
    }
    if (([*(id *)(a1 + 32) _accessibilityBoolValueForKey:@"AXBeganObservingKey"] & 1) == 0)
    {
      v8 = +[AXAVFoundationMediaDescriptionManager sharedManager];
      uint64_t v9 = [v8 beginObservingPlayer:*(void *)(a1 + 32)];

      [*(id *)(a1 + 32) _accessibilitySetBoolValue:v9 forKey:@"AXBeganObservingKey"];
    }
  }
  else
  {
    v10 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_impl(&dword_241E8C000, v10, OS_LOG_TYPE_DEFAULT, "AX will not begin observing player=%p because UIAccessibilityIsVoiceOverRunning=0 and isVoiceOverInTheTripleClickMenu=0", (uint8_t *)&v12, 0xCu);
    }
  }
}

@end