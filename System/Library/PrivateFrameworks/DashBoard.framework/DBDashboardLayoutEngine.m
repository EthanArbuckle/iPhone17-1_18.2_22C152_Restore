@interface DBDashboardLayoutEngine
- (CGRect)areaOfInterestFrameForApplication:(id)a3;
- (CGRect)areaOfInterestWindowFrame;
- (CGRect)cameraWindowFrame;
- (CGRect)climateWindowFrame;
- (CGRect)cornerRadiusViewFrame;
- (CGRect)cornerRadiusWindowFrame;
- (CGRect)mainWindowFrame;
- (CGRect)notificationWindowFrame;
- (CGRect)primaryStatusBarWindowFrame;
- (CGRect)resizeAnimationWindowFrame;
- (CGRect)sceneFrameForApplication:(id)a3;
- (CGRect)secondaryStatusBarWindowFrame;
- (CGRect)statusBarHostSceneFrame;
- (CGRect)statusBarHostWindowFrame;
- (CGRect)wallpaperHostSceneFrame;
- (CGRect)wallpaperHostWindowFrame;
- (CGRect)wallpaperWindowFrame;
- (DBDashboardLayoutEngine)initWithEnvironmentConfiguration:(id)a3;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (UIEdgeInsets)homeViewControllerInsets;
- (UIEdgeInsets)rootViewControllerContentInsets;
- (UIEdgeInsets)statusBarInsets;
- (double)dualStatusBarTotalHorizontalWidth;
- (double)folderViewAdditionalHorizontalInset;
- (double)todayViewAdditionalHorizontalInset;
- (void)setEnvironmentConfiguration:(id)a3;
@end

@implementation DBDashboardLayoutEngine

- (DBDashboardLayoutEngine)initWithEnvironmentConfiguration:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DBDashboardLayoutEngine;
  v6 = [(DBDashboardLayoutEngine *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environmentConfiguration, a3);
    v8 = [v5 displayConfiguration];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v7->_mainWindowFrame.origin.x = v10;
    v7->_mainWindowFrame.origin.y = v12;
    v7->_mainWindowFrame.size.width = v14;
    v7->_mainWindowFrame.size.height = v16;
    v7->_areaOfInterestWindowFrame.origin.x = v10;
    v7->_areaOfInterestWindowFrame.origin.y = v12;
    v7->_areaOfInterestWindowFrame.size.width = v14;
    v7->_areaOfInterestWindowFrame.size.height = v16;
    v7->_statusBarHostWindowFrame.origin.x = v10;
    v7->_statusBarHostWindowFrame.origin.y = v12;
    v7->_statusBarHostWindowFrame.size.width = v14;
    v7->_statusBarHostWindowFrame.size.height = v16;
    v7->_cornerRadiusWindowFrame.origin.x = v10;
    v7->_cornerRadiusWindowFrame.origin.y = v12;
    v7->_cornerRadiusWindowFrame.size.width = v14;
    v7->_cornerRadiusWindowFrame.size.height = v16;
    v7->_resizeAnimationWindowFrame.origin.x = v10;
    v7->_resizeAnimationWindowFrame.origin.y = v12;
    v7->_resizeAnimationWindowFrame.size.width = v14;
    v7->_resizeAnimationWindowFrame.size.height = v16;
    v7->_wallpaperHostWindowFrame.origin.x = v10;
    v7->_wallpaperHostWindowFrame.origin.y = v12;
    v7->_wallpaperHostWindowFrame.size.width = v14;
    v7->_wallpaperHostWindowFrame.size.height = v16;
  }

  return v7;
}

- (UIEdgeInsets)rootViewControllerContentInsets
{
  v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v3 currentSafeViewAreaFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(DBDashboardLayoutEngine *)self mainWindowFrame];
  CGFloat v13 = v12;
  CGFloat rect = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  CGFloat rect_16 = CGRectGetMinY(v30);
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  CGFloat rect_8 = CGRectGetMinX(v31);
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v17;
  v32.size.height = v19;
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  double v21 = MaxY - CGRectGetMaxY(v33);
  v34.origin.x = rect;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  double v23 = MaxX - CGRectGetMaxX(v35);
  double v25 = rect_8;
  double v24 = rect_16;
  double v26 = v21;
  result.right = v23;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (UIEdgeInsets)homeViewControllerInsets
{
  v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v4 = [v3 hasDualStatusBar];

  if (v4)
  {
LABEL_2:
    double v5 = *MEMORY[0x263F834E8];
    double v6 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v7 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v8 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  else
  {
    CGFloat v9 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    uint64_t v10 = [v9 currentStatusBarEdge];

    switch(v10)
    {
      case 0:
      case 2:
        CGFloat v11 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
        int v12 = [v11 isRightHandDrive];

        double v5 = 0.0;
        if (v12) {
          double v6 = 0.0;
        }
        else {
          double v6 = 45.0;
        }
        if (v12) {
          double v8 = 45.0;
        }
        else {
          double v8 = 0.0;
        }
        double v7 = 0.0;
        break;
      case 1:
        double v7 = 45.0;
        double v6 = 0.0;
        double v5 = 0.0;
        goto LABEL_13;
      case 3:
        double v5 = 45.0;
        double v6 = 0.0;
        double v7 = 0.0;
LABEL_13:
        double v8 = 0.0;
        break;
      default:
        goto LABEL_2;
    }
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGRect)sceneFrameForApplication:(id)a3
{
  id v4 = a3;
  double v5 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v5 currentSafeViewAreaFrame];
  double v7 = v6;
  double v9 = v8;

  LODWORD(v5) = [v4 presentsFullScreen];
  if (v5)
  {
    uint64_t v10 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    CGFloat v11 = [v10 displayConfiguration];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v7 = v16;
    double v9 = v17;
  }
  else
  {
    double v13 = *MEMORY[0x263F00148];
    double v15 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v18 = v13;
  double v19 = v15;
  double v20 = v7;
  double v21 = v9;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)statusBarInsets
{
  v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v4 = [v3 hasDualStatusBar];

  if (v4)
  {
    double v5 = 45.0;
    double v6 = 0.0;
    double v7 = 45.0;
    double v8 = 0.0;
  }
  else
  {
    double v8 = *MEMORY[0x263F834E8];
    double v7 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
    double v9 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    uint64_t v10 = [v9 currentStatusBarEdge];

    if (v10 == 1)
    {
      double v6 = v6 + 45.0;
    }
    else
    {
      CGFloat v11 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
      uint64_t v12 = [v11 currentStatusBarEdge];

      if (v12 == 3)
      {
        double v8 = v8 + 45.0;
      }
      else
      {
        double v13 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
        int v14 = [v13 isRightHandDrive];

        if (v14) {
          double v5 = v5 + 45.0;
        }
        else {
          double v7 = v7 + 45.0;
        }
      }
    }
  }
  double v15 = v8;
  double v16 = v7;
  double v17 = v6;
  double v18 = v5;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGRect)areaOfInterestFrameForApplication:(id)a3
{
  int v4 = [a3 presentsFullScreen];
  double v5 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  double v6 = v5;
  if (v4)
  {
    double v7 = [v5 displayConfiguration];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    [v5 currentViewAreaFrame];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)statusBarHostSceneFrame
{
  v2 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v2 currentSafeViewAreaFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)primaryStatusBarWindowFrame
{
  double v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v3 currentSafeViewAreaFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  uint64_t v13 = [v12 currentStatusBarEdge];

  if (v13 != 1)
  {
    double v18 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    uint64_t v19 = [v18 currentStatusBarEdge];

    if (v19 == 3)
    {
      v28.origin.x = v5;
      v28.origin.y = v7;
      v28.size.width = v9;
      v28.size.height = v11;
      CGFloat Width = CGRectGetWidth(v28);
      CGFloat Height = 45.0;
    }
    else
    {
      double v20 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
      int v21 = [v20 isRightHandDrive];

      if (v21)
      {
        v29.origin.x = v5;
        v29.origin.y = v7;
        v29.size.width = v9;
        v29.size.height = v11;
        CGFloat Width = 45.0;
        double v17 = CGRectGetWidth(v29) - 45.0;
        v30.origin.x = v5;
        v30.origin.y = v7;
        v30.size.width = v9;
        v30.size.height = v11;
        CGFloat Height = CGRectGetHeight(v30);
LABEL_9:
        double v15 = 0.0;
        goto LABEL_10;
      }
      CGFloat Width = 45.0;
      v31.origin.x = v5;
      v31.origin.y = v7;
      v31.size.width = v9;
      v31.size.height = v11;
      CGFloat Height = CGRectGetHeight(v31);
    }
    double v17 = 0.0;
    goto LABEL_9;
  }
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGFloat Height = 45.0;
  double v15 = CGRectGetHeight(v26) - 45.0;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  CGFloat Width = CGRectGetWidth(v27);
  double v17 = 0.0;
LABEL_10:
  double v22 = v17;
  double v23 = v15;
  double v24 = Width;
  double v25 = Height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)secondaryStatusBarWindowFrame
{
  double v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  char v4 = [v3 hasDualStatusBar];

  if (v4)
  {
    CGFloat v5 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    [v5 currentSafeViewAreaFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    double v14 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    LODWORD(v5) = [v14 isRightHandDrive];

    if (v5)
    {
      *(double *)&uint64_t v15 = 45.0;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      double Height = CGRectGetHeight(v21);
      double v17 = 0.0;
    }
    else
    {
      v22.origin.x = v7;
      v22.origin.y = v9;
      v22.size.width = v11;
      v22.size.height = v13;
      *(double *)&uint64_t v15 = 45.0;
      double v17 = CGRectGetWidth(v22) - 45.0;
      v23.origin.x = v7;
      v23.origin.y = v9;
      v23.size.width = v11;
      v23.size.height = v13;
      double Height = CGRectGetHeight(v23);
    }
    double v18 = 0.0;
  }
  else
  {
    double v17 = *MEMORY[0x263F001A8];
    double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
    uint64_t v15 = *(uint64_t *)(MEMORY[0x263F001A8] + 16);
    double Height = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v19 = v17;
  double v20 = *(double *)&v15;
  result.size.height = Height;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (double)dualStatusBarTotalHorizontalWidth
{
  v2 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v3 = [v2 hasDualStatusBar];

  double result = 45.0 + 45.0;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (CGRect)climateWindowFrame
{
  int v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v4 = [v3 hasPhysicalControlBars];

  CGFloat v5 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  double v6 = v5;
  if (v4) {
    [v5 currentViewAreaFrame];
  }
  else {
    [v5 currentSafeViewAreaFrame];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)cameraWindowFrame
{
  v2 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v2 currentSafeViewAreaFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)cornerRadiusViewFrame
{
  v2 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v2 currentSafeViewAreaFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)notificationWindowFrame
{
  double v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  [v3 currentSafeViewAreaFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v13 = [v12 hasDualStatusBar];

  if (v13)
  {
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    double MinX = CGRectGetMinX(v28) + 45.0;
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    double MinY = CGRectGetMinY(v29);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    double Width = CGRectGetWidth(v30) + 45.0 * -2.0;
  }
  else
  {
    double v18 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    uint64_t v19 = [v18 currentStatusBarEdge];

    if (v19 == 1)
    {
      v32.origin.x = v5;
      v32.origin.y = v7;
      v32.size.width = v9;
      v32.size.height = v11;
      double MinX = CGRectGetMinX(v32);
      v33.origin.x = v5;
      v33.origin.y = v7;
      v33.size.width = v9;
      v33.size.height = v11;
      double MinY = CGRectGetMinY(v33);
      v34.origin.x = v5;
      v34.origin.y = v7;
      v34.size.width = v9;
      v34.size.height = v11;
      double Width = CGRectGetWidth(v34);
      v35.origin.x = v5;
      v35.origin.y = v7;
      v35.size.width = v9;
      v35.size.height = v11;
      double Height = CGRectGetHeight(v35) - 45.0;
      goto LABEL_8;
    }
    double v20 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    uint64_t v21 = [v20 currentStatusBarEdge];

    if (v21 == 3)
    {
      v36.origin.x = v5;
      v36.origin.y = v7;
      v36.size.width = v9;
      v36.size.height = v11;
      double MinX = CGRectGetMinX(v36);
      v37.origin.x = v5;
      v37.origin.y = v7;
      v37.size.width = v9;
      v37.size.height = v11;
      double MinY = CGRectGetMinY(v37) + 45.0;
      v38.origin.x = v5;
      v38.origin.y = v7;
      v38.size.width = v9;
      v38.size.height = v11;
      double Width = CGRectGetWidth(v38);
      v39.origin.x = v5;
      v39.origin.y = v7;
      v39.size.width = v9;
      v39.size.height = v11;
      double Height = CGRectGetHeight(v39) - 45.0;
      goto LABEL_8;
    }
    double v25 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
    int v26 = [v25 isRightHandDrive];

    v40.origin.x = v5;
    v40.origin.y = v7;
    v40.size.width = v9;
    v40.size.height = v11;
    double v27 = CGRectGetMinX(v40);
    double MinX = v27;
    if (!v26) {
      double MinX = v27 + 45.0;
    }
    v41.origin.x = v5;
    v41.origin.y = v7;
    v41.size.width = v9;
    v41.size.height = v11;
    double MinY = CGRectGetMinY(v41);
    v42.origin.x = v5;
    v42.origin.y = v7;
    v42.size.width = v9;
    v42.size.height = v11;
    double Width = CGRectGetWidth(v42) - 45.0;
  }
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  double Height = CGRectGetHeight(v31);
LABEL_8:
  double v22 = MinX;
  double v23 = MinY;
  double v24 = Width;
  result.size.height = Height;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)wallpaperHostSceneFrame
{
  double v3 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v4 = [v3 currentViewAreaSupportsUIOutsideSafeArea];

  CGFloat v5 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  double v6 = v5;
  if (v4) {
    [v5 currentViewAreaFrame];
  }
  else {
    [v5 currentSafeViewAreaFrame];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)wallpaperWindowFrame
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  [(DBDashboardLayoutEngine *)self wallpaperHostSceneFrame];
  double v6 = v2;
  double v7 = v3;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)todayViewAdditionalHorizontalInset
{
  double v2 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v3 = [v2 hasDualStatusBar];

  double result = 45.0 + 12.0;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (double)folderViewAdditionalHorizontalInset
{
  double v2 = [(DBDashboardLayoutEngine *)self environmentConfiguration];
  int v3 = [v2 hasDualStatusBar];

  double result = 45.0;
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (CGRect)mainWindowFrame
{
  double x = self->_mainWindowFrame.origin.x;
  double y = self->_mainWindowFrame.origin.y;
  double width = self->_mainWindowFrame.size.width;
  double height = self->_mainWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)areaOfInterestWindowFrame
{
  double x = self->_areaOfInterestWindowFrame.origin.x;
  double y = self->_areaOfInterestWindowFrame.origin.y;
  double width = self->_areaOfInterestWindowFrame.size.width;
  double height = self->_areaOfInterestWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)statusBarHostWindowFrame
{
  double x = self->_statusBarHostWindowFrame.origin.x;
  double y = self->_statusBarHostWindowFrame.origin.y;
  double width = self->_statusBarHostWindowFrame.size.width;
  double height = self->_statusBarHostWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)cornerRadiusWindowFrame
{
  double x = self->_cornerRadiusWindowFrame.origin.x;
  double y = self->_cornerRadiusWindowFrame.origin.y;
  double width = self->_cornerRadiusWindowFrame.size.width;
  double height = self->_cornerRadiusWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)resizeAnimationWindowFrame
{
  double x = self->_resizeAnimationWindowFrame.origin.x;
  double y = self->_resizeAnimationWindowFrame.origin.y;
  double width = self->_resizeAnimationWindowFrame.size.width;
  double height = self->_resizeAnimationWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)wallpaperHostWindowFrame
{
  double x = self->_wallpaperHostWindowFrame.origin.x;
  double y = self->_wallpaperHostWindowFrame.origin.y;
  double width = self->_wallpaperHostWindowFrame.size.width;
  double height = self->_wallpaperHostWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end