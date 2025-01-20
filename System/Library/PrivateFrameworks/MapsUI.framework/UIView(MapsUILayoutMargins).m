@interface UIView(MapsUILayoutMargins)
- (id)_mapsui_layoutMarginsDescription;
- (id)_mapsui_preservedLayoutMarginsDescription;
- (id)_mapsui_recursiveLayoutMarginsDescription;
- (uint64_t)_mapsui_resetLayoutMargins;
- (uint64_t)_mapsui_resetLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins;
- (uint64_t)_mapsui_resetLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:;
@end

@implementation UIView(MapsUILayoutMargins)

- (uint64_t)_mapsui_resetLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:", a3, 0);
}

- (uint64_t)_mapsui_resetLayoutMarginsWithPreservesSuperview:()MapsUILayoutMargins insetsFromSafeArea:
{
  objc_msgSend(a1, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  if ([a1 preservesSuperviewLayoutMargins] != a3) {
    [a1 setPreservesSuperviewLayoutMargins:a3];
  }
  uint64_t result = [a1 insetsLayoutMarginsFromSafeArea];
  if (result != a4)
  {
    return [a1 setInsetsLayoutMarginsFromSafeArea:a4];
  }
  return result;
}

- (uint64_t)_mapsui_resetLayoutMargins
{
  return objc_msgSend(a1, "_mapsui_resetLayoutMarginsWithPreservesSuperview:insetsFromSafeArea:", 0, 0);
}

- (id)_mapsui_layoutMarginsDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  [v2 appendFormat:@"{\n"];
  [a1 layoutMargins];
  v3 = NSStringFromUIEdgeInsets(v12);
  [v2 appendFormat:@"\tlayoutMargins: %@,\n", v3];

  [a1 safeAreaInsets];
  v4 = NSStringFromUIEdgeInsets(v13);
  [v2 appendFormat:@"\tsafeAreaInsets: %@,\n", v4];

  if ([a1 edgesPreservingSuperviewLayoutMargins]
    && [a1 edgesPreservingSuperviewLayoutMargins] != 15)
  {
    v6 = MUStringFromUIRectEdge([a1 edgesPreservingSuperviewLayoutMargins]);
    [v2 appendFormat:@"\tedgesPreservingSuperviewLayoutMargins: (%@),\n", v6];
  }
  else
  {
    if ([a1 preservesSuperviewLayoutMargins]) {
      v5 = @"YES";
    }
    else {
      v5 = @"NO";
    }
    [v2 appendFormat:@"\tpreservesSuperviewLayoutMargins: %@,\n", v5];
  }
  if ([a1 edgesInsettingLayoutMarginsFromSafeArea]
    && [a1 edgesInsettingLayoutMarginsFromSafeArea] != 15)
  {
    v8 = MUStringFromUIRectEdge([a1 edgesInsettingLayoutMarginsFromSafeArea]);
    [v2 appendFormat:@"\tedgesInsettingLayoutMarginsFromSafeArea: (%@),\n", v8];
  }
  else
  {
    if ([a1 insetsLayoutMarginsFromSafeArea]) {
      v7 = @"YES";
    }
    else {
      v7 = @"NO";
    }
    [v2 appendFormat:@"\tinsetsLayoutMarginsFromSafeArea: %@,\n", v7];
  }
  [v2 appendFormat:@"}"];
  v9 = (void *)[v2 copy];

  return v9;
}

- (id)_mapsui_preservedLayoutMarginsDescription
{
  id v1 = a1;
  v2 = NSString;
  v3 = objc_msgSend(v1, "_mapsui_layoutMarginsDescription");
  v4 = [v2 stringWithFormat:@"%@\n%@", v1, v3];

  uint64_t v5 = [v1 superview];
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      int v7 = [v1 preservesSuperviewLayoutMargins];

      if (!v7) {
        break;
      }
      v8 = [v1 superview];

      v9 = NSString;
      v10 = objc_msgSend(v8, "_mapsui_layoutMarginsDescription");
      v11 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  * "];
      UIEdgeInsets v12 = [v9 stringWithFormat:@"%@\n%@\n  * %@", v8, v10, v11];

      v6 = [v8 superview];
      v4 = v12;
      id v1 = v8;
      if (!v6) {
        goto LABEL_7;
      }
    }
  }
  v8 = v1;
  UIEdgeInsets v12 = v4;
LABEL_7:

  return v12;
}

- (id)_mapsui_recursiveLayoutMarginsDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = objc_msgSend(a1, "_mapsui_layoutMarginsDescription");
  v4 = [v2 stringWithFormat:@"%@\n%@", a1, v3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a1 subviews];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      v9 = v4;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        int v11 = [v10 preservesSuperviewLayoutMargins];
        UIEdgeInsets v12 = @"|";
        if (v11) {
          UIEdgeInsets v12 = @"*";
        }
        UIEdgeInsets v13 = NSString;
        v14 = v12;
        v15 = objc_msgSend(v10, "_mapsui_recursiveLayoutMarginsDescription");
        v16 = [NSString stringWithFormat:@"\n  %@ ", v14];
        v17 = [v15 stringByReplacingOccurrencesOfString:@"\n" withString:v16];
        v4 = [v13 stringWithFormat:@"%@\n  %@ %@", v9, v14, v17];

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

@end