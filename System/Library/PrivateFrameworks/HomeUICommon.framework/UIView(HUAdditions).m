@interface UIView(HUAdditions)
+ (void)hu_enableAnimations:()HUAdditions forBlock:;
- (BOOL)hu_isHomeAffordancePresent;
- (__CFString)hu_contentModeString;
- (uint64_t)hu_autoSizeByConstrainingWidth:()HUAdditions;
- (uint64_t)hu_isDescendantOfPickerView;
- (uint64_t)hu_setFramePreservingTransform:()HUAdditions;
- (void)hu_traverseViewHierarchy:()HUAdditions;
@end

@implementation UIView(HUAdditions)

- (uint64_t)hu_setFramePreservingTransform:()HUAdditions
{
  objc_msgSend(a1, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  double MidX = CGRectGetMidX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  double MidY = CGRectGetMidY(v15);
  return objc_msgSend(a1, "setCenter:", MidX, MidY);
}

- (void)hu_traverseViewHierarchy:()HUAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a1, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v4[2](v4, v10);
        objc_msgSend(v10, "hu_traverseViewHierarchy:", v4);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (uint64_t)hu_autoSizeByConstrainingWidth:()HUAdditions
{
  LODWORD(a4) = 1148846080;
  LODWORD(a5) = 1112014848;
  objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a2, *(double *)(MEMORY[0x263F1D490] + 8), a4, a5);
  [a1 frame];
  double v7 = v6;
  [a1 frame];
  return [a1 setFrame:v7];
}

+ (void)hu_enableAnimations:()HUAdditions forBlock:
{
  double v6 = a4;
  uint64_t v5 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
  if (v5) {
    [MEMORY[0x263F1CB60] setAnimationsEnabled:a3];
  }
  v6[2]();
  [MEMORY[0x263F1CB60] setAnimationsEnabled:v5];
}

- (BOOL)hu_isHomeAffordancePresent
{
  v1 = [a1 window];
  [v1 safeAreaInsets];
  BOOL v3 = v2 > 0.0;

  return v3;
}

- (uint64_t)hu_isDescendantOfPickerView
{
  id v1 = a1;
  if (v1)
  {
    double v2 = v1;
    do
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        break;
      }
      uint64_t v4 = [v2 superview];

      double v2 = (void *)v4;
    }
    while (v4);
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (__CFString)hu_contentModeString
{
  uint64_t v1 = [a1 contentMode];
  if ((unint64_t)(v1 - 1) > 0xB) {
    return @"ScaleToFill";
  }
  else {
    return off_265381158[v1 - 1];
  }
}

@end