@interface TVRMDeviceInfo
+ (BOOL)deviceHasRoundedCorners;
+ (BOOL)needsCompactLayoutForCurrentDevice;
+ (BOOL)needsLandscapeOrientationForCurrentDevice;
+ (UIEdgeInsets)contentEdgeInsets;
+ (double)expandedRoundedCornerRadius;
+ (double)heightForCurrentDeviceWithOrientation:(int64_t)a3;
+ (double)widthForCurrentDevice;
@end

@implementation TVRMDeviceInfo

+ (double)heightForCurrentDeviceWithOrientation:(int64_t)a3
{
  CCUIScreenBounds();
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = +[UIDevice currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14)
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      return fmin(CGRectGetHeight(v34) + -128.0, 682.0);
    }
    else
    {
      return 682.0;
    }
  }
  else
  {
    if ([a1 needsLandscapeOrientationForCurrentDevice])
    {
      v33.origin.x = v6;
      v33.origin.y = v8;
      v33.size.width = v10;
      v33.size.height = v12;
      return CGRectGetHeight(v33) + -54.0;
    }
    v16 = +[UIDevice currentDevice];
    if ([v16 userInterfaceIdiom])
    {
    }
    else
    {
      v18 = +[UIScreen mainScreen];
      [v18 bounds];
      double v20 = v19;

      v21 = +[UIScreen mainScreen];
      [v21 bounds];
      double v23 = v22;

      if (v20 < v23) {
        double v20 = v23;
      }

      if (v20 == 812.0) {
        return 539.0;
      }
    }
    v17 = +[UIDevice currentDevice];
    if ([v17 userInterfaceIdiom])
    {
    }
    else
    {
      v24 = +[UIScreen mainScreen];
      [v24 bounds];
      double v26 = v25;

      v27 = +[UIScreen mainScreen];
      [v27 bounds];
      double v29 = v28;

      if (v26 < v29) {
        double v26 = v29;
      }

      if (v26 > 812.0) {
        return 682.0;
      }
    }
    unsigned int v30 = [a1 needsCompactLayoutForCurrentDevice];
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    CGFloat Height = CGRectGetHeight(v35);
    double v32 = Height + -128.0;
    double result = Height + -96.0;
    if (!v30) {
      return v32;
    }
  }
  return result;
}

+ (double)widthForCurrentDevice
{
  CCUIScreenBounds();
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = +[UIDevice currentDevice];
  id v12 = [v11 userInterfaceIdiom];

  if (v12) {
    return 360.0;
  }
  unsigned int v14 = [a1 needsLandscapeOrientationForCurrentDevice];
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  double result = CGRectGetWidth(v15);
  if (v14) {
    return result + -128.0;
  }
  return result;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  double top = UIEdgeInsetsZero.top;
  double bottom = UIEdgeInsetsZero.bottom;
  double v5 = +[UIDevice currentDevice];
  if ([v5 userInterfaceIdiom])
  {
  }
  else
  {
    unsigned __int8 v6 = [a1 needsLandscapeOrientationForCurrentDevice];

    double v7 = 27.0;
    if ((v6 & 1) == 0)
    {
      CGFloat left = 27.0;
      goto LABEL_10;
    }
  }
  CGFloat left = UIEdgeInsetsZero.left;
  double right = UIEdgeInsetsZero.right;
  CGFloat v10 = +[UIDevice currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  if (v11 == (id)1)
  {
    double bottom = 27.0;
    double v7 = 27.0;
  }
  else
  {
    double v7 = right;
  }
  if (v11 == (id)1) {
    double top = 27.0;
  }
LABEL_10:
  double v12 = top;
  double v13 = left;
  double v14 = bottom;
  result.double right = v7;
  result.double bottom = v14;
  result.CGFloat left = v13;
  result.double top = v12;
  return result;
}

+ (BOOL)needsLandscapeOrientationForCurrentDevice
{
  CCUIScreenBounds();
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double v6 = CGRectGetWidth(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v7 = CGRectGetHeight(v14);
  CGFloat v8 = +[UIDevice currentDevice];
  id v9 = [v8 userInterfaceIdiom];
  BOOL v11 = v6 > v7 && v9 == 0;

  return v11;
}

+ (BOOL)needsCompactLayoutForCurrentDevice
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom])
  {
    BOOL v3 = 0;
  }
  else
  {
    CGFloat v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double v6 = v5;

    double v7 = +[UIScreen mainScreen];
    [v7 bounds];
    double v9 = v8;

    if (v6 >= v9) {
      double v10 = v6;
    }
    else {
      double v10 = v9;
    }
    BOOL v3 = v10 == 568.0;
  }

  return v3;
}

+ (BOOL)deviceHasRoundedCorners
{
  return MGGetSInt32Answer() == 2;
}

+ (double)expandedRoundedCornerRadius
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1)
  {
    _CCUIExpandedModuleContinuousCornerRadius();
  }
  else if (+[TVRMDeviceInfo deviceHasRoundedCorners])
  {
    CGFloat v4 = +[UIScreen mainScreen];
    double v5 = [v4 traitCollection];
    [v5 displayCornerRadius];
    double v7 = v6;

    return v7;
  }
  else
  {
    return 0.0;
  }
  return result;
}

@end