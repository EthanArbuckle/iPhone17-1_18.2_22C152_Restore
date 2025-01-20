@interface UITraitCollection(MailUI)
- (BOOL)mf_traitDifferenceAffectsTextLayout:()MailUI;
- (double)mf_leadingEdgeToBackButtonText;
@end

@implementation UITraitCollection(MailUI)

- (BOOL)mf_traitDifferenceAffectsTextLayout:()MailUI
{
  id v4 = a3;
  uint64_t v5 = [a1 layoutDirection];
  if (v5 != [v4 layoutDirection]) {
    goto LABEL_8;
  }
  [a1 displayScale];
  double v7 = v6;
  [v4 displayScale];
  if (v7 != v8) {
    goto LABEL_8;
  }
  uint64_t v9 = [a1 horizontalSizeClass];
  if (v9 != [v4 horizontalSizeClass]) {
    goto LABEL_8;
  }
  uint64_t v10 = [a1 verticalSizeClass];
  if (v10 != [v4 verticalSizeClass]) {
    goto LABEL_8;
  }
  v11 = [a1 preferredContentSizeCategory];
  v12 = [v4 preferredContentSizeCategory];

  if (v11 == v12 && (uint64_t v13 = [a1 legibilityWeight], v13 == objc_msgSend(v4, "legibilityWeight")))
  {
    uint64_t v14 = [a1 _splitViewControllerContext];
    BOOL v15 = v14 != [v4 _splitViewControllerContext];
  }
  else
  {
LABEL_8:
    BOOL v15 = 1;
  }

  return v15;
}

- (double)mf_leadingEdgeToBackButtonText
{
  if ([a1 verticalSizeClass] == 1) {
    v1 = @"UINavigationBarBackIndicatorLandscape";
  }
  else {
    v1 = @"UINavigationBarBackIndicatorDefault";
  }
  v2 = [MEMORY[0x1E4FB1818] kitImageNamed:v1];
  [v2 size];
  double v4 = v3 + -8.0 + 6.0;

  return v4;
}

@end