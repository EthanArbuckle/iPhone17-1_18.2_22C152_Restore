@interface UIView(GKAdditions)
- (double)_gkPopoverPresentationArea;
- (double)_gkPopoverPresentationInsets;
- (uint64_t)_gkDisableDefaultFocusEffect;
- (void)_gkAddStandardFadeTransition;
- (void)_gkEnumerateSubviewsUsingBlock:()GKAdditions;
- (void)_gkPerformWithoutAnimationWhenRotating:()GKAdditions;
@end

@implementation UIView(GKAdditions)

- (void)_gkEnumerateSubviewsUsingBlock:()GKAdditions
{
  id v4 = a3;
  v5 = [a1 subviews];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__UIView_GKAdditions___gkEnumerateSubviewsUsingBlock___block_invoke;
  v7[3] = &unk_26478A188;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)_gkAddStandardFadeTransition
{
  id v4 = [MEMORY[0x263F15910] animation];
  [v4 setType:*MEMORY[0x263F15FD8]];
  [v4 setDuration:0.3];
  v2 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  [v4 setTimingFunction:v2];

  [v4 setFillMode:*MEMORY[0x263F15AA8]];
  v3 = [a1 layer];
  [v3 addAnimation:v4 forKey:0];
}

- (uint64_t)_gkDisableDefaultFocusEffect
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a1 setFocusEffect:0];
  }
  return result;
}

- (double)_gkPopoverPresentationArea
{
  [a1 _gkPopoverPresentationRect];
  double v3 = v2;
  [a1 _gkPopoverPresentationInsets];
  return v3 + v4;
}

- (double)_gkPopoverPresentationInsets
{
  return 10.0;
}

- (void)_gkPerformWithoutAnimationWhenRotating:()GKAdditions
{
  id v6 = a3;
  double v4 = [a1 window];
  int v5 = [v4 isRotating];

  if (v5) {
    [(id)objc_opt_class() performWithoutAnimation:v6];
  }
  else {
    v6[2]();
  }
}

@end