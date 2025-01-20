@interface UIView(MKAdditions)
+ (id)_mapkit_currentAnimationTimingFunction;
+ (uint64_t)_mapkit_currentAnimationDuration;
+ (uint64_t)_mapkit_shouldAdoptImplicitAnimationParameters;
- (BOOL)_mapkit_hasPointerInteraction;
- (BOOL)_mapkit_isDarkModeEnabled;
- (double)_mapkit_translateRect:()MKAdditions ifNeededFromSingleEdge:;
- (double)_mapkit_userInterfaceOnlySafeAreaInsets;
- (id)_mapkit_currentPointerInteraction;
- (void)_mapkit_addPointerInteraction;
- (void)_mapkit_addPointerInteractionWithDelegate:()MKAdditions;
- (void)_mapkit_removePointerInteraction;
@end

@implementation UIView(MKAdditions)

+ (uint64_t)_mapkit_shouldAdoptImplicitAnimationParameters
{
  uint64_t result = [MEMORY[0x1E4F42FF0] _isInAnimationBlock];
  if (result)
  {
    v1 = (void *)MEMORY[0x1E4F42FF0];
    return [v1 areAnimationsEnabled];
  }
  return result;
}

+ (id)_mapkit_currentAnimationTimingFunction
{
  unint64_t v0 = [MEMORY[0x1E4F42FF0] _currentAnimationCurve];
  if (v0 > 3) {
    v1 = (void *)MEMORY[0x1E4F3A480];
  }
  else {
    v1 = (void *)qword_1E54B8D10[v0];
  }
  v2 = [MEMORY[0x1E4F39C10] functionWithName:*v1];

  return v2;
}

+ (uint64_t)_mapkit_currentAnimationDuration
{
  return [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
}

- (BOOL)_mapkit_isDarkModeEnabled
{
  v1 = [a1 traitCollection];
  BOOL v2 = [v1 userInterfaceStyle] == 2;

  return v2;
}

- (double)_mapkit_userInterfaceOnlySafeAreaInsets
{
  id v1 = a1;
  BOOL v2 = v1;
  while (1)
  {
    v3 = [MEMORY[0x1E4F42FF8] viewControllerForView:v2];
    v4 = v3;
    if (v3) {
      break;
    }
    uint64_t v5 = [v2 superview];

    BOOL v2 = (void *)v5;
    if (!v5)
    {
      double v6 = 0.0;
      goto LABEL_24;
    }
  }
  v7 = [v3 navigationController];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 navigationBar];
    v10 = v9;
    double v11 = 0.0;
    double v6 = 0.0;
    if (v9 && ([v9 isHidden] & 1) == 0)
    {
      [v10 bounds];
      objc_msgSend(v1, "convertRect:fromView:", v10);
      double MaxY = CGRectGetMaxY(v35);
      if (MaxY >= 0.0) {
        double v6 = MaxY;
      }
      else {
        double v6 = 0.0;
      }
    }
    v13 = [v8 toolbar];
    v14 = v13;
    if (v13)
    {
      if (([v13 isHidden] & 1) == 0)
      {
        [v14 bounds];
        objc_msgSend(v1, "convertRect:fromView:", v14);
        double MinY = CGRectGetMinY(v36);
        [v1 bounds];
        if (CGRectGetMaxY(v37) - MinY >= 0.0)
        {
          [v1 bounds];
          double v11 = CGRectGetMaxY(v38) - MinY;
        }
      }
    }
  }
  else
  {
    double v11 = 0.0;
    double v6 = 0.0;
  }
  v16 = [v4 tabBarController];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 tabBar];
    v19 = v18;
    if (v18)
    {
      if (([v18 isHidden] & 1) == 0)
      {
        [v19 bounds];
        objc_msgSend(v1, "convertRect:fromView:", v19);
        double v20 = CGRectGetMinY(v39);
        [v1 bounds];
        if (v11 <= CGRectGetMaxY(v40) - v20)
        {
          [v1 bounds];
          CGRectGetMaxY(v41);
        }
      }
    }
  }
LABEL_24:
  v21 = [v1 window];
  v22 = [v21 windowScene];
  v23 = [v22 statusBarManager];
  [v23 statusBarFrame];
  objc_msgSend(v1, "convertRect:fromView:", 0);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  if (v31 > 0.0)
  {
    v32 = [v1 window];
    objc_msgSend(v1, "convertRect:fromView:", v32, v25, v27, v29, v31);
    double v33 = CGRectGetMaxY(v42);

    if (v6 <= v33) {
      double v6 = v33;
    }
  }

  return v6;
}

- (double)_mapkit_translateRect:()MKAdditions ifNeededFromSingleEdge:
{
  [a1 bounds];
  double v49 = v14;
  double v50 = v13;
  double v51 = v15;
  double v52 = v16;
  v17 = [a1 window];
  [v17 safeAreaInsets];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  [a1 safeAreaInsets];
  if (v19 >= v26) {
    double v30 = 0.0;
  }
  else {
    double v30 = v26;
  }
  if (v21 >= v27) {
    double v31 = 0.0;
  }
  else {
    double v31 = v27;
  }
  if (v23 >= v28) {
    double v32 = 0.0;
  }
  else {
    double v32 = v28;
  }
  if (v25 >= v29) {
    double v33 = 0.0;
  }
  else {
    double v33 = v29;
  }
  switch(a7)
  {
    case 1:
    case 4:
      objc_msgSend(a1, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 0, a2, a3, a4, a5);
      double v37 = a5;
      goto LABEL_18;
    case 2:
      CGRect v38 = a1;
      double v39 = a2;
      double v40 = a3;
      double v41 = a4;
      double v42 = a5;
      uint64_t v43 = 10;
      goto LABEL_17;
    case 8:
      CGRect v38 = a1;
      double v39 = a2;
      double v40 = a3;
      double v41 = a4;
      double v42 = a5;
      uint64_t v43 = 5;
LABEL_17:
      objc_msgSend(v38, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", v43, 0, v39, v40, v41, v42);
      double v36 = a4;
LABEL_18:
      v54.origin.double x = v50 + v31;
      v54.origin.y = v49 + v30;
      v54.size.double width = v51 - (v31 + v33);
      v54.size.double height = v52 - (v30 + v32);
      CGRect v53 = CGRectIntersection(*(CGRect *)&v34, v54);
      double x = v53.origin.x;
      double width = v53.size.width;
      double height = v53.size.height;
      if (!CGRectIsNull(v53) && (width < a4 || height < a5)) {
        return *MEMORY[0x1E4F1DB20];
      }
      return x;
    default:
      id v48 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Only one edge can be specified." userInfo:0];
      objc_exception_throw(v48);
  }
}

- (BOOL)_mapkit_hasPointerInteraction
{
  id v1 = objc_msgSend(a1, "_mapkit_currentPointerInteraction");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)_mapkit_currentPointerInteraction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = objc_msgSend(a1, "interactions", 0);
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (void)_mapkit_addPointerInteraction
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42CA0]);
  [a1 addInteraction:v2];
}

- (void)_mapkit_addPointerInteractionWithDelegate:()MKAdditions
{
  v4 = (objc_class *)MEMORY[0x1E4F42CA0];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithDelegate:v5];

  [a1 addInteraction:v6];
}

- (void)_mapkit_removePointerInteraction
{
  id v2 = objc_msgSend(a1, "_mapkit_currentPointerInteraction");
  if (v2)
  {
    uint64_t v3 = v2;
    [a1 removeInteraction:v2];
    id v2 = v3;
  }
}

@end