@interface UIView(MUXCrossPlatformOperations)
+ (void)_mapsui_animateWithDuration:()MUXCrossPlatformOperations animations:completion:;
- (BOOL)_mapsui_isRTL;
- (uint64_t)_mapsui_fittingSize;
- (uint64_t)_mapsui_setCardCorner;
- (void)_mapsui_addSelectGestureRecognizerWithTarget:()MUXCrossPlatformOperations action:;
- (void)_mapsui_performImageLoadingTransitionWithAnimations:()MUXCrossPlatformOperations completion:;
@end

@implementation UIView(MUXCrossPlatformOperations)

- (uint64_t)_mapsui_fittingSize
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
}

- (uint64_t)_mapsui_setCardCorner
{
  [a1 setClipsToBounds:1];
  return [a1 _setContinuousCornerRadius:10.0];
}

- (void)_mapsui_performImageLoadingTransitionWithAnimations:()MUXCrossPlatformOperations completion:
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__UIView_MUXCrossPlatformOperations___mapsui_performImageLoadingTransitionWithAnimations_completion___block_invoke;
  v9[3] = &unk_1E5750180;
  id v10 = v6;
  id v8 = v6;
  [v7 transitionWithView:a1 duration:5242882 options:a3 animations:v9 completion:0.3];
}

- (void)_mapsui_addSelectGestureRecognizerWithTarget:()MUXCrossPlatformOperations action:
{
  id v6 = (objc_class *)MEMORY[0x1E4FB1D38];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setAllowedPressTypes:&unk_1EE405120];
  [v8 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
  [v8 addTarget:v7 action:a4];

  [a1 addGestureRecognizer:v8];
}

+ (void)_mapsui_animateWithDuration:()MUXCrossPlatformOperations animations:completion:
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__UIView_MUXCrossPlatformOperations___mapsui_animateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E5750530;
  double v12 = a2;
  id v11 = v8;
  id v9 = v8;
  [a1 animateWithDuration:v10 animations:a5 completion:a2];
}

- (BOOL)_mapsui_isRTL
{
  return [a1 effectiveUserInterfaceLayoutDirection] == 1;
}

@end