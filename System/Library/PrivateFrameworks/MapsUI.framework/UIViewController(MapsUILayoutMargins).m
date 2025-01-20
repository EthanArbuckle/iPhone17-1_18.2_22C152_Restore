@interface UIViewController(MapsUILayoutMargins)
- (id)_mapsui_viewLayoutMarginsDescription;
- (uint64_t)_mapsui_resetViewLayoutMargins;
- (uint64_t)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins;
- (uint64_t)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:;
- (void)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:respectsSystemMinimum:;
@end

@implementation UIViewController(MapsUILayoutMargins)

- (void)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:respectsSystemMinimum:
{
  [a1 setViewRespectsSystemMinimumLayoutMargins:a5];
  id v8 = [a1 view];
  objc_msgSend(v8, "_mapsui_resetLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:", a3, a4);
}

- (uint64_t)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:respectsSystemMinimum:", a3, 0, 0);
}

- (uint64_t)_mapsui_resetViewLayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:respectsSystemMinimum:", 0, 0, 0);
}

- (uint64_t)_mapsui_resetViewLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:
{
  return objc_msgSend(a1, "_mapsui_resetViewLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:respectsSystemMinimum:", a3, a4, 0);
}

- (id)_mapsui_viewLayoutMarginsDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  [v2 appendFormat:@"{\n"];
  v3 = [a1 view];
  [v3 layoutMargins];
  v4 = NSStringFromUIEdgeInsets(v25);
  [v2 appendFormat:@"\tview.layoutMargins: %@,\n", v4];

  v5 = [a1 view];
  [v5 safeAreaInsets];
  v6 = NSStringFromUIEdgeInsets(v26);
  [v2 appendFormat:@"\tview.safeAreaInsets: %@,\n", v6];

  v7 = [a1 view];
  if ([v7 edgesPreservingSuperviewLayoutMargins])
  {
    id v8 = [a1 view];
    uint64_t v9 = [v8 edgesPreservingSuperviewLayoutMargins];

    if (v9 != 15)
    {
      v10 = [a1 view];
      v11 = MUStringFromUIRectEdge([v10 edgesPreservingSuperviewLayoutMargins]);
      [v2 appendFormat:@"\tview.edgesPreservingSuperviewLayoutMargins: (%@),\n", v11];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v10 = [a1 view];
  if ([v10 preservesSuperviewLayoutMargins]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v2 appendFormat:@"\tview.preservesSuperviewLayoutMargins: %@,\n", v12];
LABEL_9:

  v13 = [a1 view];
  if ([v13 edgesInsettingLayoutMarginsFromSafeArea])
  {
    v14 = [a1 view];
    uint64_t v15 = [v14 edgesInsettingLayoutMarginsFromSafeArea];

    if (v15 != 15)
    {
      v16 = [a1 view];
      v17 = MUStringFromUIRectEdge([v16 edgesInsettingLayoutMarginsFromSafeArea]);
      [v2 appendFormat:@"\tview.edgesInsettingLayoutMarginsFromSafeArea: (%@),\n", v17];

      goto LABEL_17;
    }
  }
  else
  {
  }
  v16 = [a1 view];
  if ([v16 insetsLayoutMarginsFromSafeArea]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  [v2 appendFormat:@"\tview.insetsLayoutMarginsFromSafeArea: %@,\n", v18];
LABEL_17:

  if ([a1 viewRespectsSystemMinimumLayoutMargins]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  [v2 appendFormat:@"\tviewRespectsSystemMinimumLayoutMargins: %@,\n", v19];
  [a1 systemMinimumLayoutMargins];
  v20 = NSStringFromDirectionalEdgeInsets(v27);
  [v2 appendFormat:@"\tsystemMinimumLayoutMargins: %@,\n", v20];

  [a1 additionalSafeAreaInsets];
  v21 = NSStringFromUIEdgeInsets(v28);
  [v2 appendFormat:@"\tadditionalSafeAreaInsets: %@,\n", v21];

  [v2 appendFormat:@"}"];
  v22 = (void *)[v2 copy];

  return v22;
}

@end