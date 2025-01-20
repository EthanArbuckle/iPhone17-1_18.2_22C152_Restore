const char *sub_1D834D010()
{
  void *v0;
  const char *result;

  if (!*v0) {
    return "InactiveMicModeSelection";
  }
  if (*v0 == 1) {
    return "PrivacyAttributionInSwiftUI";
  }
  result = (const char *)sub_1D8382288();
  __break(1u);
  return result;
}

const char *sub_1D834D098()
{
  return "ControlCenter";
}

void sub_1D834D104(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for Feature(uint64_t a1)
{
}

unint64_t sub_1D834D160()
{
  unint64_t result = qword_1EA88B2A0;
  if (!qword_1EA88B2A0)
  {
    type metadata accessor for Feature(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA88B2A0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void __CCUIPortraitGridLayoutSideMargin_block_invoke()
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1)
  {
    v5.origin.x = CCUIReferenceScreenBounds();
    BOOL v2 = CGRectGetWidth(v5) < 1024.0;
    double v3 = 60.0;
    double v4 = 50.0;
  }
  else
  {
    if (SBFEffectiveHomeButtonType() != 2)
    {
      double v3 = 44.0;
      goto LABEL_9;
    }
    v6.origin.x = CCUIReferenceScreenBounds();
    BOOL v2 = CGRectGetWidth(v6) < 414.0;
    double v3 = 46.0;
    double v4 = 38.0;
  }
  if (v2) {
    double v3 = v4;
  }
LABEL_9:
  CCUIPortraitGridLayoutSideMargin_margin = *(void *)&v3;
}

void __CCUIPortraitMainListGridGeometryInfo_block_invoke()
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1)
  {
    double v2 = 10.0;
    double v3 = 66.0;
  }
  else
  {
    if (CCUIPortraitGridLayoutSideMargin_onceToken != -1) {
      dispatch_once(&CCUIPortraitGridLayoutSideMargin_onceToken, &__block_literal_global_23);
    }
    double v4 = *(double *)&CCUIPortraitGridLayoutSideMargin_margin;
    v7.origin.x = CCUIReferenceScreenBounds();
    CGFloat v5 = CGRectGetWidth(v7) + v4 * -2.0;
    CGRect v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];

    double v3 = round(v5 / 4.66176471);
    UIFloorToScale();
  }
  CCUIPortraitMainListGridGeometryInfo_gridGeometryInfo_0 = *(void *)&v3;
  CCUIPortraitMainListGridGeometryInfo_gridGeometryInfo_1 = *(void *)&v2;
}

void __CCUIReferenceScreenBounds_block_invoke()
{
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 _referenceBounds];
  CCUIReferenceScreenBounds___referenceScreenBounds_0 = v0;
  CCUIReferenceScreenBounds___referenceScreenBounds_1 = v1;
  CCUIReferenceScreenBounds___referenceScreenBounds_2 = v2;
  CCUIReferenceScreenBounds___referenceScreenBounds_3 = v3;
}

double CCUIExpandedModuleEdgeInsets()
{
  char ShouldBePortrait = CCUILayoutShouldBePortrait(0);
  return CCUILayoutEdgeInsetsForcePortrait(ShouldBePortrait);
}

CGFloat CCUISliderExpandedContentModuleHeight()
{
  if (CCUISliderExpandedContentModuleHeight_onceToken != -1) {
    dispatch_once(&CCUISliderExpandedContentModuleHeight_onceToken, &__block_literal_global_14);
  }
  CGFloat result = CCUIMaximumExpandedContentModuleHeight();
  if (result >= *(double *)&CCUISliderExpandedContentModuleHeight_height) {
    return *(double *)&CCUISliderExpandedContentModuleHeight_height;
  }
  return result;
}

double CCUIDefaultExpandedContentModuleWidth()
{
  CCUILayoutEdgeInsetsForcePortrait(1);
  return CCUIDefaultExpandedContentModuleFullWidth() - v0 - v1;
}

double CCUIDefaultExpandedContentModuleFullWidth()
{
  double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1)
  {
    CCUILayoutEdgeInsetsForcePortrait(1);
    double v3 = v2;
    double v5 = v4;
    double v6 = CCUIPortraitMainListGridGeometryInfo();
    CCUIPortraitMainListGridGeometryInfo();
    return v5 + v3 + v7 * 3.0 + v6 * 4.0;
  }
  else
  {
    BOOL ShouldBePortrait = CCUILayoutShouldBePortrait(0);
    double v10 = CCUIScreenBounds();
    if (ShouldBePortrait)
    {
      return CGRectGetWidth(*(CGRect *)&v10);
    }
    else
    {
      return CGRectGetHeight(*(CGRect *)&v10);
    }
  }
}

CGFloat CCUIMaximumExpandedContentModuleHeight()
{
  char ShouldBePortrait = CCUILayoutShouldBePortrait(0);
  double v1 = CCUILayoutEdgeInsetsForcePortrait(ShouldBePortrait);
  double v3 = v2;
  v5.origin.x = CCUIScreenBounds();
  return CGRectGetHeight(v5) - v1 - v3;
}

BOOL CCUILayoutShouldBePortrait(void *a1)
{
  double v1 = [a1 window];
  [v1 bounds];
  double v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  if (CGRectIsEmpty(v15))
  {
    double v3 = CCUIScreenBounds();
    CGFloat v5 = v10;
    CGFloat v7 = v11;
    CGFloat v9 = v12;
  }
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  double Height = CGRectGetHeight(v16);
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  return Height > CGRectGetWidth(v17);
}

double CCUIScreenBounds()
{
  uint64_t v0 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
  switch(v0)
  {
    case 1:
      double v1 = 0.0;
      break;
    case 3:
      double v1 = 1.57079633;
      break;
    case 4:
      double v1 = -1.57079633;
      break;
    default:
      double v1 = 3.14159265;
      if (v0 != 2) {
        double v1 = 0.0;
      }
      break;
  }
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeRotation(&v4, v1);
  v5.origin.x = CCUIReferenceScreenBounds();
  CGAffineTransform v3 = v4;
  CGRectApplyAffineTransform(v5, &v3);
  UIRectIntegralWithScale();
  return *MEMORY[0x1E4F1DAD8];
}

double CCUILayoutEdgeInsetsForcePortrait(char a1)
{
  if ((a1 & 1) != 0 || CCUILayoutShouldBePortrait(0))
  {
    v15.origin.x = CCUIReferenceScreenBounds();
    double Width = CGRectGetWidth(v15);
    if (Width < 1024.0
      || ([MEMORY[0x1E4FB16C8] currentDevice],
          double v1 = objc_claimAutoreleasedReturnValue(),
          [v1 userInterfaceIdiom] != 1)
      || (double v6 = 27.0, SBFEffectiveHomeButtonType() == 2))
    {
      v16.origin.x = CCUIReferenceScreenBounds();
      double v7 = CGRectGetWidth(v16);
      if (v7 < 1024.0
        || ([MEMORY[0x1E4FB16C8] currentDevice],
            double v2 = objc_claimAutoreleasedReturnValue(),
            [v2 userInterfaceIdiom] != 1)
        || SBFEffectiveHomeButtonType() != 2)
      {
        v17.origin.x = CCUIReferenceScreenBounds();
        double v8 = CGRectGetWidth(v17);
        if (v8 < 834.0
          || ([MEMORY[0x1E4FB16C8] currentDevice],
              CGAffineTransform v3 = objc_claimAutoreleasedReturnValue(),
              [v3 userInterfaceIdiom] != 1)
          || (double v6 = 20.0, SBFEffectiveHomeButtonType() != 2))
        {
          v18.origin.x = CCUIReferenceScreenBounds();
          double v9 = CGRectGetWidth(v18);
          if (v9 < 834.0
            || ([MEMORY[0x1E4FB16C8] currentDevice],
                CGAffineTransform v4 = objc_claimAutoreleasedReturnValue(),
                [v4 userInterfaceIdiom] != 1)
            || (double v6 = 20.0, SBFEffectiveHomeButtonType() == 2))
          {
            double v10 = [MEMORY[0x1E4FB16C8] currentDevice];
            double v6 = 20.0;
            if ([v10 userInterfaceIdiom] == 1) {
              goto LABEL_56;
            }
            v19.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v19) >= 430.0)
            {
              double v6 = 64.0;
              goto LABEL_56;
            }
            v20.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v20) >= 428.0)
            {
              double v6 = 64.0;
              goto LABEL_56;
            }
            v21.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v21) >= 414.0 && SBFEffectiveHomeButtonType() == 2
              || (v22.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v22) >= 414.0))
            {
              double v6 = 64.0;
              goto LABEL_56;
            }
            v23.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v23) >= 393.0
              || (v24.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v24) >= 390.0)
              || (v25.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v25) >= 375.0)
              && SBFEffectiveHomeButtonType() == 2)
            {
              double v6 = 64.0;
              goto LABEL_56;
            }
            v37.origin.x = CCUIReferenceScreenBounds();
            BOOL v12 = CGRectGetWidth(v37) < 375.0;
            double v13 = 64.0;
            double v14 = 56.0;
            goto LABEL_68;
          }
          goto LABEL_57;
        }
        goto LABEL_59;
      }
LABEL_32:

      double v6 = 27.0;
      if (Width < 1024.0) {
        return v6;
      }
    }
LABEL_63:

    return v6;
  }
  v26.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v26);
  if (Width >= 1024.0)
  {
    double v1 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v1 userInterfaceIdiom] == 1)
    {
      double v6 = 27.0;
      if (SBFEffectiveHomeButtonType() != 2) {
        goto LABEL_63;
      }
    }
  }
  v27.origin.x = CCUIReferenceScreenBounds();
  double v7 = CGRectGetWidth(v27);
  if (v7 >= 1024.0)
  {
    double v2 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2) {
      goto LABEL_32;
    }
  }
  v28.origin.x = CCUIReferenceScreenBounds();
  double v8 = CGRectGetWidth(v28);
  if (v8 < 834.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        CGAffineTransform v3 = objc_claimAutoreleasedReturnValue(),
        [v3 userInterfaceIdiom] != 1)
    || (double v6 = 20.0, SBFEffectiveHomeButtonType() != 2))
  {
    v29.origin.x = CCUIReferenceScreenBounds();
    double v9 = CGRectGetWidth(v29);
    if (v9 < 834.0
      || ([MEMORY[0x1E4FB16C8] currentDevice],
          CGAffineTransform v4 = objc_claimAutoreleasedReturnValue(),
          [v4 userInterfaceIdiom] != 1)
      || (double v6 = 20.0, SBFEffectiveHomeButtonType() == 2))
    {
      double v10 = [MEMORY[0x1E4FB16C8] currentDevice];
      double v6 = 20.0;
      if ([v10 userInterfaceIdiom] == 1) {
        goto LABEL_56;
      }
      v30.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v30) >= 430.0)
      {
        double v6 = 37.0;
        goto LABEL_56;
      }
      v31.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v31) >= 428.0)
      {
        double v6 = 36.0;
        goto LABEL_56;
      }
      v32.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v32) >= 414.0 && SBFEffectiveHomeButtonType() == 2
        || (v33.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v33) >= 414.0))
      {
        double v6 = 34.0;
        goto LABEL_56;
      }
      v34.origin.x = CCUIReferenceScreenBounds();
      double v6 = 30.0;
      if (CGRectGetWidth(v34) >= 393.0 || (v35.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v35) >= 390.0))
      {
LABEL_56:

        if (v9 < 834.0) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      v36.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v36) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
      {
        double v6 = 27.0;
        goto LABEL_56;
      }
      v38.origin.x = CCUIReferenceScreenBounds();
      BOOL v12 = CGRectGetWidth(v38) < 375.0;
      double v13 = 27.0;
      double v14 = 16.0;
LABEL_68:
      if (v12) {
        double v6 = v14;
      }
      else {
        double v6 = v13;
      }
      goto LABEL_56;
    }
LABEL_57:

LABEL_58:
    if (v8 < 834.0) {
      goto LABEL_60;
    }
  }
LABEL_59:

LABEL_60:
  if (v7 >= 1024.0) {

  }
  if (Width >= 1024.0) {
    goto LABEL_63;
  }
  return v6;
}

double CCUIReferenceScreenBounds()
{
  if (CCUIReferenceScreenBounds_onceToken != -1) {
    dispatch_once(&CCUIReferenceScreenBounds_onceToken, &__block_literal_global);
  }
  return *(double *)&CCUIReferenceScreenBounds___referenceScreenBounds_0;
}

double CCUIPortraitMainListGridGeometryInfo()
{
  if (CCUIPortraitMainListGridGeometryInfo_onceToken != -1) {
    dispatch_once(&CCUIPortraitMainListGridGeometryInfo_onceToken, &__block_literal_global_5);
  }
  return *(double *)&CCUIPortraitMainListGridGeometryInfo_gridGeometryInfo_0;
}

double CCUIEdgeInsetsRTLSwap(double a1)
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 userInterfaceLayoutDirection];
  CGAffineTransform v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 userInterfaceLayoutDirection];

  return a1;
}

BOOL CCUIFeatureEnabled(uint64_t a1)
{
  return +[CCUIFeatures isFeatureEnabled:a1];
}

double CCUISliderExpandedContentModuleWidth()
{
  if (CCUISliderExpandedContentModuleWidth_onceToken != -1) {
    dispatch_once(&CCUISliderExpandedContentModuleWidth_onceToken, &__block_literal_global_12);
  }
  return *(double *)&CCUISliderExpandedContentModuleWidth_width;
}

uint64_t CCUISignpostImpulse(NSObject *a1)
{
  if (os_signpost_enabled(a1))
  {
    *(_WORD *)CGAffineTransform v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D834A000, a1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "signpost", " enableTelemetry=YES ", v3, 2u);
  }
  return kdebug_trace();
}

CGAffineTransform *CCUIAffineTransformBetweenInterfaceOrientations@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v3 = 0.0;
  double v4 = 0.0;
  if (a2 != 1)
  {
    if (a2 == 3)
    {
      double v4 = 1.57079633;
    }
    else if (a2 == 4)
    {
      double v4 = -1.57079633;
    }
    else
    {
      double v4 = 3.14159265;
      if (a2 != 2) {
        double v4 = 0.0;
      }
    }
  }
  if (a1 != 1)
  {
    if (a1 == 3)
    {
      double v3 = 1.57079633;
    }
    else if (a1 == 4)
    {
      double v3 = -1.57079633;
    }
    else
    {
      double v3 = 3.14159265;
      if (a1 != 2) {
        double v3 = 0.0;
      }
    }
  }
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  return CGAffineTransformMakeRotation((CGAffineTransform *)a3, v4 - v3);
}

double CCUIScreenSafeAreaInsets()
{
  if (CCUIScreenSafeAreaInsets_onceToken[0] != -1) {
    dispatch_once(CCUIScreenSafeAreaInsets_onceToken, &__block_literal_global_2);
  }
  return *(double *)&CCUIScreenSafeAreaInsets___screenSafeAreaInsets_0;
}

void __CCUIScreenSafeAreaInsets_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v6 = [v0 _keyWindowForScreen:v1];

  [v6 safeAreaInsets];
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_0 = v2;
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_1 = v3;
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_2 = v4;
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_3 = v5;
}

BOOL CCUIIsPortrait()
{
  return CCUILayoutShouldBePortrait(0);
}

double CCUIPortraitGridLayoutSideMargin()
{
  if (CCUIPortraitGridLayoutSideMargin_onceToken != -1) {
    dispatch_once(&CCUIPortraitGridLayoutSideMargin_onceToken, &__block_literal_global_23);
  }
  return *(double *)&CCUIPortraitGridLayoutSideMargin_margin;
}

uint64_t CCUICompactModuleColumns()
{
  return 4;
}

double CCUICalculateGridGeometryInfo(unint64_t a1, double a2, double a3)
{
  double v3 = round(a2 / ((double)a1 + ((double)a1 + -1.0) * a3));
  UIFloorToScale();
  return v3;
}

double CCUILayoutGutter()
{
  CCUIPortraitMainListGridGeometryInfo();
  return v0;
}

double CCUICompactModuleContinuousCornerRadius()
{
  if (CCUICompactModuleContinuousCornerRadius_onceToken != -1) {
    dispatch_once(&CCUICompactModuleContinuousCornerRadius_onceToken, &__block_literal_global_8);
  }
  return *(double *)&CCUICompactModuleContinuousCornerRadius_radius;
}

void __CCUICompactModuleContinuousCornerRadius_block_invoke()
{
  v12.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v12);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        [v10 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v13.origin.x = CCUIReferenceScreenBounds();
    double v4 = CGRectGetWidth(v13);
    if (v4 >= 1024.0)
    {
      double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUICompactModuleContinuousCornerRadius_radius = 0x4033000000000000;
LABEL_36:

LABEL_37:
        double v9 = v10;
        if (Width < 1024.0) {
          return;
        }
        goto LABEL_38;
      }
    }
    v14.origin.x = CCUIReferenceScreenBounds();
    double v5 = CGRectGetWidth(v14);
    if (v5 >= 834.0)
    {
      double v1 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v1 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUICompactModuleContinuousCornerRadius_radius = 0x4031000000000000;
LABEL_34:

LABEL_35:
        if (v4 < 1024.0) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }
    v15.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v15);
    if (v6 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          [v2 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUICompactModuleContinuousCornerRadius_radius = 0x4031000000000000;
    }
    else
    {
      double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
      double v8 = 17.0;
      if ([v7 userInterfaceIdiom] != 1)
      {
        v16.origin.x = CCUIReferenceScreenBounds();
        double v8 = 21.0;
        if (CGRectGetWidth(v16) < 430.0)
        {
          v17.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v17) < 428.0)
          {
            v18.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v18) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v19.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v19) < 414.0)
              {
                v20.origin.x = CCUIReferenceScreenBounds();
                double v8 = 20.0;
                if (CGRectGetWidth(v20) < 393.0)
                {
                  v21.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v21) < 390.0)
                  {
                    v22.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v22) < 375.0 || (double v8 = 19.0, SBFEffectiveHomeButtonType() != 2))
                    {
                      v23.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v23) < 375.0) {
                        double v8 = 17.0;
                      }
                      else {
                        double v8 = 19.0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUICompactModuleContinuousCornerRadius_radius = *(void *)&v8;

      if (v6 < 834.0)
      {
LABEL_33:
        if (v5 < 834.0) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }

    goto LABEL_33;
  }
  CCUICompactModuleContinuousCornerRadius_radius = 0x4033000000000000;
  double v9 = v10;
LABEL_38:
}

double CCUICompactModuleContinuousCornerRadiusForGridSizeClass(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = a1 - 1;
  if ((unint64_t)(a1 - 1) >= 0xA)
  {
    double v6 = 0.5;
  }
  else
  {
    unsigned int v4 = word_1D8386806[v3];
    unsigned int v5 = word_1D83867E0[v3];
    if (v5 >= v4) {
      unsigned int v5 = v4;
    }
    if (v5 > 1)
    {
      a2 = a3 + a2 * 2.0;
      double v6 = 0.2;
    }
    else
    {
      double v6 = 0.35;
    }
  }
  return a2 * v6;
}

uint64_t CCUINumberOfColumnsForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 8) {
    return 1;
  }
  else {
    return word_1D83867F4[a1 - 2];
  }
}

uint64_t CCUINumberOfRowsForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return 1;
  }
  else {
    return word_1D8386806[a1 - 1];
  }
}

double CCUIExpandedModuleContinuousCornerRadius()
{
  if (CCUIExpandedModuleContinuousCornerRadius_onceToken != -1) {
    dispatch_once(&CCUIExpandedModuleContinuousCornerRadius_onceToken, &__block_literal_global_10);
  }
  return *(double *)&CCUIExpandedModuleContinuousCornerRadius_radius;
}

void __CCUIExpandedModuleContinuousCornerRadius_block_invoke()
{
  v14.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v14);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        [v12 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v15.origin.x = CCUIReferenceScreenBounds();
    double v4 = CGRectGetWidth(v15);
    if (v4 >= 1024.0)
    {
      double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIExpandedModuleContinuousCornerRadius_radius = 0x4043000000000000;
LABEL_37:

LABEL_38:
        id v10 = v12;
        if (Width < 1024.0) {
          return;
        }
        goto LABEL_39;
      }
    }
    v16.origin.x = CCUIReferenceScreenBounds();
    double v5 = CGRectGetWidth(v16);
    if (v5 >= 834.0)
    {
      double v1 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v1 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIExpandedModuleContinuousCornerRadius_radius = 0x4041000000000000;
LABEL_35:

LABEL_36:
        if (v4 < 1024.0) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    v17.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v17);
    if (v6 >= 834.0)
    {
      uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        CCUIExpandedModuleContinuousCornerRadius_radius = 0x4041000000000000;
        goto LABEL_33;
      }
    }
    double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v7 userInterfaceIdiom] == 1)
    {
      uint64_t v8 = 0x4041000000000000;
    }
    else
    {
      v18.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v18) >= 430.0
        || (v19.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v19) >= 428.0)
        || (v20.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v20) >= 414.0)
        && SBFEffectiveHomeButtonType() == 2
        || (v21.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v21) >= 414.0))
      {
        uint64_t v8 = 0x4045000000000000;
      }
      else
      {
        v22.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v22) >= 393.0 || (v23.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v23) >= 390.0))
        {
          uint64_t v8 = 0x4044000000000000;
        }
        else
        {
          v24.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v24) < 375.0 || SBFEffectiveHomeButtonType() != 2)
          {
            v25.origin.x = CCUIReferenceScreenBounds();
            BOOL v11 = CGRectGetWidth(v25) < 375.0;
            double v9 = 34.0;
            if (!v11) {
              double v9 = 38.0;
            }
LABEL_29:
            CCUIExpandedModuleContinuousCornerRadius_radius = *(void *)&v9;

            if (v6 < 834.0)
            {
LABEL_34:
              if (v5 < 834.0) {
                goto LABEL_36;
              }
              goto LABEL_35;
            }
LABEL_33:

            goto LABEL_34;
          }
          uint64_t v8 = 0x4043000000000000;
        }
      }
    }
    double v9 = *(double *)&v8;
    goto LABEL_29;
  }
  CCUIExpandedModuleContinuousCornerRadius_radius = 0x4043000000000000;
  id v10 = v12;
LABEL_39:
}

double CCUISliderExpandedModuleContinuousCornerRadius()
{
  if (CCUISliderExpandedContentModuleWidth_onceToken != -1) {
    dispatch_once(&CCUISliderExpandedContentModuleWidth_onceToken, &__block_literal_global_12);
  }
  return *(double *)&CCUISliderExpandedContentModuleWidth_width * 0.35;
}

void __CCUISliderExpandedContentModuleWidth_block_invoke()
{
  v14.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v14);
  if (Width >= 1024.0)
  {
    double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
LABEL_38:

      goto LABEL_39;
    }
  }
  v15.origin.x = CCUIReferenceScreenBounds();
  double v5 = CGRectGetWidth(v15);
  if (v5 < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v1 = objc_claimAutoreleasedReturnValue(),
        [v1 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v16.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v16);
    if (v6 >= 834.0)
    {
      uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
LABEL_34:

LABEL_35:
        if (v5 < 1024.0) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }
    v17.origin.x = CCUIReferenceScreenBounds();
    double v7 = CGRectGetWidth(v17);
    if (v7 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v8 userInterfaceIdiom] == 1)
      {
        uint64_t v9 = 0x405EC00000000000;
      }
      else
      {
        v18.origin.x = CCUIReferenceScreenBounds();
        uint64_t v9 = 0x4062C00000000000;
        if (CGRectGetWidth(v18) < 430.0)
        {
          v19.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v19) < 428.0)
          {
            v20.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v20) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
            {
              uint64_t v9 = 0x4062400000000000;
            }
            else
            {
              v21.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v21) >= 414.0)
              {
                uint64_t v9 = 0x4060800000000000;
              }
              else
              {
                v22.origin.x = CCUIReferenceScreenBounds();
                uint64_t v9 = 0x4061800000000000;
                if (CGRectGetWidth(v22) < 393.0)
                {
                  v23.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v23) < 390.0)
                  {
                    v24.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v24) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
                    {
                      uint64_t v9 = 0x4060E00000000000;
                    }
                    else
                    {
                      v26.origin.x = CCUIReferenceScreenBounds();
                      uint64_t v9 = qword_1D83867C0[CGRectGetWidth(v26) >= 375.0];
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUISliderExpandedContentModuleWidth_width = v9;

      if (v7 < 834.0)
      {
LABEL_33:
        if (v6 < 834.0) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }

    goto LABEL_33;
  }
  CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
LABEL_36:

LABEL_37:
  if (Width >= 1024.0) {
    goto LABEL_38;
  }
LABEL_39:
  id v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v12 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
  {
  }
  else
  {
    v25.origin.x = CCUIReferenceScreenBounds();
    double v10 = CGRectGetWidth(v25);

    if (v10 < 375.0)
    {
      double v11 = *(double *)&CCUISliderExpandedContentModuleWidth_width;
      if (*(double *)&CCUISliderExpandedContentModuleWidth_width < 135.0) {
        double v11 = 135.0;
      }
      CCUISliderExpandedContentModuleWidth_width = *(void *)&v11;
    }
  }
}

void __CCUISliderExpandedContentModuleHeight_block_invoke()
{
  v14.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v14);
  if (Width >= 1024.0)
  {
    double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
LABEL_32:

      goto LABEL_33;
    }
  }
  v15.origin.x = CCUIReferenceScreenBounds();
  double v5 = CGRectGetWidth(v15);
  if (v5 < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v1 = objc_claimAutoreleasedReturnValue(),
        [v1 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v16.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v16);
    if (v6 >= 834.0)
    {
      uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
LABEL_28:

LABEL_29:
        if (v5 < 1024.0) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    v17.origin.x = CCUIReferenceScreenBounds();
    double v7 = CGRectGetWidth(v17);
    if (v7 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v9 = 0x4075400000000000;
      if ([v8 userInterfaceIdiom] != 1)
      {
        v18.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v18) >= 430.0 || (v19.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v19) >= 428.0))
        {
          uint64_t v9 = 0x4079000000000000;
        }
        else
        {
          v20.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v20) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
          {
            uint64_t v9 = 0x4078600000000000;
          }
          else
          {
            v22.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v22) < 414.0)
            {
              v23.origin.x = CCUIReferenceScreenBounds();
              uint64_t v9 = 0x4077200000000000;
              if (CGRectGetWidth(v23) < 393.0)
              {
                v24.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v24) < 390.0)
                {
                  v25.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v25) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
                  {
                    uint64_t v9 = 0x4076800000000000;
                  }
                  else
                  {
                    v26.origin.x = CCUIReferenceScreenBounds();
                    uint64_t v9 = qword_1D83867D0[CGRectGetWidth(v26) >= 375.0];
                  }
                }
              }
            }
          }
        }
      }
      CCUISliderExpandedContentModuleHeight_height = v9;

      if (v7 < 834.0)
      {
LABEL_27:
        if (v6 < 834.0) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }

    goto LABEL_27;
  }
  CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
LABEL_30:

LABEL_31:
  if (Width >= 1024.0) {
    goto LABEL_32;
  }
LABEL_33:
  id v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v12 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
  {
  }
  else
  {
    v21.origin.x = CCUIReferenceScreenBounds();
    double v10 = CGRectGetWidth(v21);

    if (v10 < 375.0)
    {
      double v11 = *(double *)&CCUISliderExpandedContentModuleHeight_height;
      if (*(double *)&CCUISliderExpandedContentModuleHeight_height < 360.0) {
        double v11 = 360.0;
      }
      CCUISliderExpandedContentModuleHeight_height = *(void *)&v11;
    }
  }
}

double CCUIAlertCompactPresentationTopMarginForOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 2)
  {
    if (CCUIAlertCompactPresentationTopMarginForOrientation_onceToken != -1) {
      dispatch_once(&CCUIAlertCompactPresentationTopMarginForOrientation_onceToken, &__block_literal_global_16);
    }
    double v1 = &CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait;
  }
  else
  {
    if (CCUIAlertCompactPresentationTopMarginForOrientation_onceToken_17 != -1) {
      dispatch_once(&CCUIAlertCompactPresentationTopMarginForOrientation_onceToken_17, &__block_literal_global_19);
    }
    double v1 = &CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape;
  }
  return *(double *)v1;
}

void __CCUIAlertCompactPresentationTopMarginForOrientation_block_invoke()
{
  v12.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v12);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        [v10 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v13.origin.x = CCUIReferenceScreenBounds();
    double v4 = CGRectGetWidth(v13);
    if (v4 >= 1024.0)
    {
      double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
LABEL_34:

LABEL_35:
        uint64_t v9 = v10;
        if (Width < 1024.0) {
          return;
        }
        goto LABEL_36;
      }
    }
    v14.origin.x = CCUIReferenceScreenBounds();
    double v5 = CGRectGetWidth(v14);
    if (v5 >= 834.0)
    {
      double v1 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v1 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
LABEL_32:

LABEL_33:
        if (v4 < 1024.0) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    v15.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v15);
    if (v6 >= 834.0)
    {
      uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
        goto LABEL_30;
      }
    }
    double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    double v8 = 24.0;
    if ([v7 userInterfaceIdiom] != 1)
    {
      v16.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v16) >= 430.0) {
        goto LABEL_25;
      }
      v17.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v17) >= 428.0) {
        goto LABEL_25;
      }
      v18.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v18) >= 414.0 && SBFEffectiveHomeButtonType() == 2) {
        goto LABEL_25;
      }
      v19.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v19) >= 414.0) {
        goto LABEL_26;
      }
      v20.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v20) >= 393.0
        || (v21.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v21) >= 390.0)
        || (v22.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v22) >= 375.0)
        && SBFEffectiveHomeButtonType() == 2)
      {
LABEL_25:
        double v8 = 48.0;
      }
      else
      {
        v23.origin.x = CCUIReferenceScreenBounds();
        CGRectGetWidth(v23);
      }
    }
LABEL_26:
    CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = *(void *)&v8;

    if (v6 < 834.0)
    {
LABEL_31:
      if (v5 < 834.0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }
  CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
  uint64_t v9 = v10;
LABEL_36:
}

void __CCUIAlertCompactPresentationTopMarginForOrientation_block_invoke_2()
{
  v11.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v11);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        [v9 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v12.origin.x = CCUIReferenceScreenBounds();
    double v4 = CGRectGetWidth(v12);
    if (v4 >= 1024.0)
    {
      double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
LABEL_34:

LABEL_35:
        double v8 = v9;
        if (Width < 1024.0) {
          return;
        }
        goto LABEL_36;
      }
    }
    v13.origin.x = CCUIReferenceScreenBounds();
    double v5 = CGRectGetWidth(v13);
    if (v5 >= 834.0)
    {
      double v1 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v1 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
LABEL_32:

LABEL_33:
        if (v4 < 1024.0) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    v14.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v14);
    if (v6 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          [v2 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
    }
    else
    {
      double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v7 userInterfaceIdiom] != 1)
      {
        v15.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v15) < 430.0)
        {
          v16.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v16) < 428.0)
          {
            v17.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v17) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v18.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v18) < 414.0)
              {
                v19.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v19) < 393.0)
                {
                  v20.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v20) < 390.0)
                  {
                    v21.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v21) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v22.origin.x = CCUIReferenceScreenBounds();
                      CGRectGetWidth(v22);
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;

      if (v6 < 834.0)
      {
LABEL_31:
        if (v5 < 834.0) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }

    goto LABEL_31;
  }
  CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
  double v8 = v9;
LABEL_36:
}

double CCUIAlertCompactPresentationMargin()
{
  if (CCUIAlertCompactPresentationMargin_onceToken != -1) {
    dispatch_once(&CCUIAlertCompactPresentationMargin_onceToken, &__block_literal_global_21);
  }
  return *(double *)&CCUIAlertCompactPresentationMargin_defaultMargin;
}

void __CCUIAlertCompactPresentationMargin_block_invoke()
{
  v11.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v11);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        [v9 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v12.origin.x = CCUIReferenceScreenBounds();
    double v4 = CGRectGetWidth(v12);
    if (v4 >= 1024.0)
    {
      double v0 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationMargin_defaultMargin = 0x4038000000000000;
LABEL_34:

LABEL_35:
        double v8 = v9;
        if (Width < 1024.0) {
          return;
        }
        goto LABEL_36;
      }
    }
    v13.origin.x = CCUIReferenceScreenBounds();
    double v5 = CGRectGetWidth(v13);
    if (v5 >= 834.0)
    {
      double v1 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v1 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationMargin_defaultMargin = 0x4038000000000000;
LABEL_32:

LABEL_33:
        if (v4 < 1024.0) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
    }
    v14.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v14);
    if (v6 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          [v2 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIAlertCompactPresentationMargin_defaultMargin = 0x4038000000000000;
    }
    else
    {
      double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v7 userInterfaceIdiom] != 1)
      {
        v15.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v15) < 430.0)
        {
          v16.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v16) < 428.0)
          {
            v17.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v17) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v18.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v18) < 414.0)
              {
                v19.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v19) < 393.0)
                {
                  v20.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v20) < 390.0)
                  {
                    v21.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v21) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v22.origin.x = CCUIReferenceScreenBounds();
                      CGRectGetWidth(v22);
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUIAlertCompactPresentationMargin_defaultMargin = 0x4038000000000000;

      if (v6 < 834.0)
      {
LABEL_31:
        if (v5 < 834.0) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }

    goto LABEL_31;
  }
  CCUIAlertCompactPresentationMargin_defaultMargin = 0x4038000000000000;
  double v8 = v9;
LABEL_36:
}

uint64_t CCUICompactModuleRows()
{
  return 8;
}

double CCUISliderPreviewRenderingModeValue()
{
  return 0.5;
}

__CFString *NSStringFromCCUIContentRenderingMode(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"Preview";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %lu>", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"Live";
  }
  return v2;
}

double _CCUIRoundButtonSize()
{
  if (_CCUIRoundButtonSize_onceToken != -1) {
    dispatch_once(&_CCUIRoundButtonSize_onceToken, &__block_literal_global_0);
  }
  return *(double *)&_CCUIRoundButtonSize_size;
}

void sub_1D8358674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v67 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1D83597D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8359B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CCUIGridSizeClassMaskAll()
{
  return 2015;
}

__CFString *NSStringFromCCUIGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return @"CCUIGridSizeClassSmall";
  }
  else {
    return off_1E6AD4680[a1 - 1];
  }
}

void CCUIEnumerateGridSizeClassesWithBlock(void (**a1)(id, uint64_t))
{
  uint64_t v1 = a1 + 2;
  uint64_t v2 = (void (*)(void))a1[2];
  uint64_t v3 = a1;
  v2();
  (*v1)(v3, 1);
  (*v1)(v3, 2);
  (*v1)(v3, 3);
  (*v1)(v3, 4);
  (*v1)(v3, 5);
  (*v1)(v3, 6);
  (*v1)(v3, 7);
  (*v1)(v3, 8);
  (*v1)(v3, 9);
  (*v1)(v3, 10);
}

uint64_t CCUIGridSizeClassMaskForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return 1;
  }
  else {
    return qword_1D8386870[a1 - 1];
  }
}

uint64_t CCUIAdjustGridSizeClassForAccessibility(uint64_t result, int a2)
{
  if (a2)
  {
    if (result == 2)
    {
      return 3;
    }
    else if (result == 4)
    {
      return 5;
    }
  }
  else if (result == 3)
  {
    return 2;
  }
  else if (result == 5)
  {
    return 4;
  }
  return result;
}

uint64_t CCUIDefaultSupportedGridSizeClassesForChronoControls()
{
  return 21;
}

void sub_1D8364628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D8364B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D8365578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8369BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D836A32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

uint64_t NSStringFromCCUIGridGeometryInfo(double a1, double a2)
{
  return [NSString stringWithFormat:@"(unitDimension: %0.3f, unitSpacing: %0.3f)", *(void *)&a1, *(void *)&a2];
}

BOOL CCUIGridGeometryInfoEqualToInfo(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

void CCUIRegisterControlCenterLogging()
{
  if (CCUIRegisterControlCenterLogging_onceToken != -1) {
    dispatch_once(&CCUIRegisterControlCenterLogging_onceToken, &__block_literal_global_2);
  }
}

uint64_t __CCUIRegisterControlCenterLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ControlCenter", "AnimationRunner");
  uint64_t v1 = (void *)CCUILogAnimationRunner;
  CCUILogAnimationRunner = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.ControlCenter", "ModuleInstance");
  uint64_t v3 = (void *)CCUILogModuleInstance;
  CCUILogModuleInstance = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.ControlCenter", "UserInterface");
  double v5 = (void *)CCUILogUserInterface;
  CCUILogUserInterface = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.ControlCenter", "IconLookup");
  double v7 = (void *)CCUILogIconLookup;
  CCUILogIconLookup = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.ControlCenter", "XcodeSupport");
  uint64_t v9 = CCUILogXcodeSupport;
  CCUILogXcodeSupport = (uint64_t)v8;
  return MEMORY[0x1F41817F8](v8, v9);
}

__CFString *NSStringFromCCUIBaseSliderViewBehaviorIdentifier(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %lu>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6AD4890[a1];
  }
  return v1;
}

void sub_1D836E760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __swiftcall CCUIControlTemplateView.init(frame:)(CCUIControlTemplateView *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

id CCUIControlTemplateView.init(frame:)(double a1, double a2, double a3, double a4)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView_backgroundView] = 0;
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView_customGlyphView] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance] = 0;
  uint64_t v9 = &v4[OBJC_IVAR___CCUIControlTemplateView_title];
  *uint64_t v9 = 0;
  v9[1] = 0;
  id v10 = &v4[OBJC_IVAR___CCUIControlTemplateView_subtitle];
  *id v10 = 0;
  v10[1] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView__isRedacted] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView__isResizing] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView__isExpanded] = 0;
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass] = 0;
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories] = 0;
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders] = 0;
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView____lazy_storage___animatingLabels] = 0;
  *(void *)&v4[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction] = 0;
  *(_OWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels] = xmmword_1D8386910;
  *(_OWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels] = xmmword_1D8386910;
  v4[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] = 0;
  v17.receiver = v4;
  v17.super_class = (Class)CCUIControlTemplateView;
  id v11 = objc_msgSendSuper2(&v17, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v11, sel_addTarget_action_forControlEvents_, v11, sel_primaryActionTriggered, 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B368);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1D8386920;
  uint64_t v13 = sub_1D83820C8();
  uint64_t v14 = MEMORY[0x1E4FB1138];
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v14;
  id v15 = v11;
  MEMORY[0x1D94854D0](v12, sel_didUpdatePreferredContentSizeCategory);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void __swiftcall CCUIControlTemplateView.init(coder:)(CCUIControlTemplateView_optional *__return_ptr retstr, NSCoder coder)
{
}

void sub_1D837111C(void *a1)
{
  uint64_t v2 = OBJC_IVAR___CCUIControlTemplateView_backgroundView;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_backgroundView];
  if (!a1)
  {
    if (!v3) {
      return;
    }
    goto LABEL_12;
  }
  if (v3) {
    BOOL v4 = a1 == v3;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    id v5 = a1;
    id v6 = (char *)objc_msgSend(v5, sel_superview);
    if (v6)
    {
      double v7 = v6;

      if (v7 == v1) {
        objc_msgSend(v5, sel_removeFromSuperview);
      }
    }

    uint64_t v3 = *(void **)&v1[v2];
    if (v3)
    {
LABEL_12:
      id v8 = v3;
      objc_msgSend(v1, sel_bounds);
      objc_msgSend(v8, sel_setFrame_);
      objc_msgSend(v1, sel_continuousCornerRadius);
      objc_msgSend(v8, sel__setContinuousCornerRadius_);
      objc_msgSend(v1, sel_insertSubview_atIndex_, v8, 0);
    }
  }
}

void sub_1D837126C(char *a1, uint64_t a2, void *a3, void *a4, void (*a5)(void *))
{
  double v7 = *(void **)&a1[*a4];
  *(void *)&a1[*a4] = a3;
  id v9 = a3;
  id v8 = a1;
  a5(v7);
}

id sub_1D83712E8(id result)
{
  uint64_t v2 = v1;
  id v3 = *(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_customGlyphView];
  if (!result)
  {
    if (!v3) {
      return result;
    }
LABEL_9:
    id v6 = objc_allocWithZone((Class)_s22ButtonGlyphWrapperViewCMa());
    id v5 = sub_1D8378D8C(v3);
    goto LABEL_10;
  }
  if (v3) {
    BOOL v4 = result == v3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return result;
  }
  if (v3) {
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:
  objc_msgSend(v2, sel_setGlyphView_, v5);

  id v7 = objc_msgSend(v2, sel_glyphView);
  if (v7)
  {
    id v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B378);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1D8386920;
    *(void *)(v9 + 56) = swift_getObjectType();
    *(void *)(v9 + 32) = v8;
    id v10 = v8;
    id v11 = (void *)sub_1D8382138();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setAutomationElements_, v11);
  }
  return objc_msgSend(v2, sel_setNeedsLayout);
}

id sub_1D83714A8(id result)
{
  if (v1[OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance] != (result & 1))
  {
    uint64_t v2 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    if (v2 != (void *)1)
    {
      id v3 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
      id v4 = v3;
      id v5 = v2;
      id v6 = v4;
      if (v3)
      {
        id v7 = v6;
        id v8 = objc_msgSend(v1, sel_subtitle);
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = sub_1D83820F8();
          uint64_t v12 = v11;
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v12 = 0;
        }
        sub_1D8371688(v10, v12);
        uint64_t v14 = v13;
        swift_bridgeObjectRelease();
        objc_msgSend(v7, sel_setAttributedText_, v14);
      }
      sub_1D837BDE4(v2, v3);
    }
    id v15 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    if (v15 != (void *)1)
    {
      CGRect v16 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
      id v17 = v16;
      id v18 = v15;
      id v19 = v17;
      if (v16)
      {
        CGRect v20 = v19;
        id v21 = objc_msgSend(v1, sel_subtitle);
        if (v21)
        {
          CGRect v22 = v21;
          uint64_t v23 = sub_1D83820F8();
          uint64_t v25 = v24;
        }
        else
        {
          uint64_t v23 = 0;
          uint64_t v25 = 0;
        }
        sub_1D8371688(v23, v25);
        CGRect v27 = v26;
        swift_bridgeObjectRelease();
        objc_msgSend(v20, sel_setAttributedText_, v27);
      }
      sub_1D837BDE4(v15, v16);
    }
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void sub_1D8371688(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    swift_bridgeObjectRetain();
    id v4 = (void *)sub_1D83820E8();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v3, sel_initWithString_, v4);

    if (objc_msgSend(v2, sel_showsMenuAffordance))
    {
      id v6 = objc_msgSend(self, sel_configurationWithScale_, 1);
      id v7 = (void *)sub_1D83820E8();
      id v8 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v7, v6);

      if (v8)
      {
        id v9 = objc_msgSend(self, sel_textAttachmentWithImage_, v8);
        id v10 = objc_msgSend(self, sel_attributedStringWithAttachment_, v9);

        id v11 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
        uint64_t v12 = (void *)sub_1D83820E8();
        id v13 = objc_msgSend(v11, sel_initWithString_, v12);

        objc_msgSend(v5, sel_appendAttributedString_, v13);
        objc_msgSend(v5, sel_appendAttributedString_, v10);
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_1D837189C(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)&v2[OBJC_IVAR___CCUIControlTemplateView_title + 8];
  if (a2)
  {
    if (v3)
    {
      if (*(void *)&v2[OBJC_IVAR___CCUIControlTemplateView_title] == result && v3 == a2) {
        return result;
      }
      uint64_t result = sub_1D83822D8();
      if (result) {
        return result;
      }
    }
  }
  else if (!v3)
  {
    return result;
  }
  sub_1D83720A4((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D8377C04, sub_1D8377B6C);
  id v5 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v5 != (void *)1)
  {
    id v6 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    id v7 = v5;
    id v8 = v6;
    id v9 = v7;
    if (v5)
    {
      id v10 = v9;
      id v11 = objc_msgSend(v2, sel_title);
      if (v11)
      {
        sub_1D83820F8();

        id v11 = (id)sub_1D83820E8();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v10, sel_setText_, v11);
    }
    sub_1D837BDE4(v5, v6);
  }
  uint64_t v12 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v12 != (void *)1)
  {
    id v13 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
    id v14 = v12;
    id v15 = v13;
    id v16 = v14;
    if (v12)
    {
      id v17 = v16;
      id v18 = objc_msgSend(v2, sel_title);
      if (v18)
      {
        sub_1D83820F8();

        id v18 = (id)sub_1D83820E8();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v17, sel_setText_, v18);
    }
    sub_1D837BDE4(v12, v13);
  }
  if (objc_msgSend(v2, sel_isResizing)) {
    sub_1D8371AE0();
  }
  sub_1D8371BC0(0);
  return (uint64_t)objc_msgSend(v2, sel_setNeedsLayout);
}

void sub_1D8371AE0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
  if (v1 != (void *)1)
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8);
    id v3 = v1;
    id v4 = v2;
    id v5 = v3;
    if (v1)
    {
      id v6 = v5;
      sub_1D8378804(1, v5);
    }
    sub_1D837BDE4(v1, v2);
  }
  id v7 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  if (v7 != (void *)1)
  {
    id v8 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8);
    id v9 = v7;
    id v10 = v8;
    id v11 = v9;
    if (v7)
    {
      uint64_t v12 = v11;
      sub_1D8378804(0, v11);
    }
    sub_1D837BDE4(v7, v8);
  }
}

id sub_1D8371BC0(id result)
{
  int v2 = v1[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility];
  v1[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] = (_BYTE)result;
  if (v2 != (result & 1))
  {
    uint64_t v3 = sub_1D83781CC();
    id v4 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    if (v4 != (void *)1)
    {
      id v5 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
      sub_1D837A574(*(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels], v5);
      id v6 = v4;
      objc_msgSend(v6, sel_setNumberOfLines_, v3);

      sub_1D837BDE4(v4, v5);
    }
    id v7 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    if (v7 != (void *)1)
    {
      id v8 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
      sub_1D837A574(*(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels], v8);
      id v9 = v7;
      objc_msgSend(v9, sel_setNumberOfLines_, v3);

      sub_1D837BDE4(v7, v8);
    }
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

uint64_t sub_1D8371D1C(char *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v8 = sub_1D83820F8();
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  id v10 = (uint64_t *)&a1[*a4];
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  *id v10 = v8;
  v10[1] = v9;
  id v13 = a1;
  a5(v11, v12);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1D8371DA4(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)&v2[OBJC_IVAR___CCUIControlTemplateView_subtitle + 8];
  if (a2)
  {
    if (v3)
    {
      if (*(void *)&v2[OBJC_IVAR___CCUIControlTemplateView_subtitle] == result && v3 == a2) {
        return result;
      }
      uint64_t result = sub_1D83822D8();
      if (result) {
        return result;
      }
    }
  }
  else if (!v3)
  {
    return result;
  }
  sub_1D83720A4((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D8377DCC, sub_1D8377D44);
  id v5 = &v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  id v6 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v6 != (void *)1)
  {
    id v7 = (void *)*((void *)v5 + 1);
    id v8 = v7;
    id v9 = v6;
    id v10 = v8;
    if (v7)
    {
      uint64_t v11 = v10;
      id v12 = objc_msgSend(v2, sel_subtitle);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = sub_1D83820F8();
        uint64_t v16 = v15;
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v16 = 0;
      }
      sub_1D8371688(v14, v16);
      id v18 = v17;
      swift_bridgeObjectRelease();
      objc_msgSend(v11, sel_setAttributedText_, v18);
    }
    sub_1D837BDE4(v6, v7);
  }
  id v19 = &v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  CGRect v20 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v20 != (void *)1)
  {
    id v21 = (void *)*((void *)v19 + 1);
    id v22 = v21;
    id v23 = v20;
    id v24 = v22;
    if (v21)
    {
      uint64_t v25 = v24;
      id v26 = objc_msgSend(v2, sel_subtitle);
      if (v26)
      {
        CGRect v27 = v26;
        uint64_t v28 = sub_1D83820F8();
        uint64_t v30 = v29;
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v30 = 0;
      }
      sub_1D8371688(v28, v30);
      CGRect v32 = v31;
      swift_bridgeObjectRelease();
      objc_msgSend(v25, sel_setAttributedText_, v32);
    }
    sub_1D837BDE4(v20, v21);
  }
  if (objc_msgSend(v2, sel_isResizing)) {
    sub_1D83723CC();
  }
  sub_1D8371BC0(0);
  uint64_t v33 = sub_1D83781CC();
  id v34 = *(id *)v5;
  if (*(void *)v5 != 1)
  {
    CGRect v35 = (void *)*((void *)v5 + 1);
    sub_1D837A574(*(id *)v5, v35);
    id v36 = v34;
    objc_msgSend(v36, sel_setNumberOfLines_, v33);

    sub_1D837BDE4(v34, v35);
  }
  id v37 = *(id *)v19;
  if (*(void *)v19 != 1)
  {
    CGRect v38 = (void *)*((void *)v19 + 1);
    sub_1D837A574(*(id *)v19, v38);
    id v39 = v37;
    objc_msgSend(v39, sel_setNumberOfLines_, v33);

    sub_1D837BDE4(v37, v38);
  }
  objc_msgSend(v2, sel_setNeedsLayout);
  return (uint64_t)objc_msgSend(v2, sel_setNeedsLayout);
}

uint64_t sub_1D83720A4(SEL *a1, void (*a2)(uint64_t *, uint64_t), void (*a3)(uint64_t *))
{
  id v7 = v3;
  uint64_t v8 = sub_1D8382038();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [v3 *a1];
  if (!v12) {
    goto LABEL_7;
  }
  id v13 = v12;
  uint64_t v14 = sub_1D83820F8();
  uint64_t v16 = v15;

  v30[0] = v14;
  v30[1] = v16;
  sub_1D8382028();
  sub_1D837BD90();
  uint64_t v17 = sub_1D83821D8();
  unint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0) {
    uint64_t v20 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v20)
  {
LABEL_7:
    a3(&OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
    return ((uint64_t (*)(uint64_t *))a3)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  }
  if (objc_msgSend(v7, sel_isResizing)) {
    goto LABEL_6;
  }
  id v22 = objc_msgSend(v7, sel_gridSizeClass);
  unsigned int v23 = CCUINumberOfRowsForGridSizeClass((uint64_t)v22);
  unsigned int v24 = CCUINumberOfColumnsForGridSizeClass((uint64_t)v22);
  unsigned int v25 = v24;
  if (v23 >= 2)
  {
    if ((objc_msgSend(v7, sel_supportsAccessibilityContentSizeCategories) & 1) == 0) {
      goto LABEL_15;
    }
    id v26 = objc_msgSend(v7, sel_traitCollection);
    id v27 = objc_msgSend(v26, sel_preferredContentSizeCategory);

    LOBYTE(v26) = sub_1D8382178();
    if ((v26 & 1) == 0 || v25 < 2) {
      goto LABEL_15;
    }
  }
  else if (v24 <= 1)
  {
LABEL_15:
    a3(&OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
    goto LABEL_16;
  }
LABEL_6:
  a2(&OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels, 1);
LABEL_16:
  if ((objc_msgSend(v7, sel_isResizing) & 1) == 0)
  {
    if (objc_msgSend(v7, sel_supportsAccessibilityContentSizeCategories))
    {
      id v28 = objc_msgSend(v7, sel_traitCollection);
      id v29 = objc_msgSend(v28, sel_preferredContentSizeCategory);

      LOBYTE(v28) = sub_1D8382178();
      if (v28) {
        return ((uint64_t (*)(uint64_t *))a3)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
      }
    }
    if (CCUINumberOfRowsForGridSizeClass((uint64_t)objc_msgSend(v7, sel_gridSizeClass)) < 2) {
      return ((uint64_t (*)(void))a3)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
    }
  }
  return ((uint64_t (*)(uint64_t *, void))a2)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels, 0);
}

void sub_1D83723CC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
  if (v1 != (void *)1)
  {
    int v2 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8);
    id v3 = v2;
    id v4 = v1;
    id v5 = v3;
    if (v2)
    {
      id v6 = v5;
      sub_1D8378804(1, v5);
    }
    sub_1D837BDE4(v1, v2);
  }
  id v7 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  if (v7 != (void *)1)
  {
    uint64_t v8 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8);
    id v9 = v8;
    id v10 = v7;
    id v11 = v9;
    if (v8)
    {
      id v12 = v11;
      sub_1D8378804(0, v11);
    }
    sub_1D837BDE4(v7, v8);
  }
}

id sub_1D83725B0(id result)
{
  int v2 = v1[OBJC_IVAR___CCUIControlTemplateView__isResizing];
  v1[OBJC_IVAR___CCUIControlTemplateView__isResizing] = (_BYTE)result;
  if (v2 != (result & 1))
  {
    id v3 = sub_1D8376CB8();
    id v4 = objc_msgSend(v3, sel_count);

    unsigned int v5 = objc_msgSend(v1, sel_isResizing);
    if ((uint64_t)v4 > 0) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    objc_msgSend(v1, sel_setClipsToBounds_, v6);
    sub_1D83720A4((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D8377C04, sub_1D8377B6C);
    sub_1D83720A4((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D8377DCC, sub_1D8377D44);
    if (objc_msgSend(v1, sel_isResizing)) {
      _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0();
    }
    sub_1D8371BC0(0);
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0()
{
  uint64_t v1 = v0 + OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels;
  int v2 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
  if (v2 != (void *)1)
  {
    id v3 = *(void **)(v1 + 8);
    id v4 = v2;
    id v5 = v3;
    id v6 = v4;
    if (v2)
    {
      id v7 = v6;
      sub_1D8378804(1, v6);
    }
    sub_1D837BDE4(v2, v3);
  }
  uint64_t v8 = v0 + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels;
  id v9 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  if (v9 != (void *)1)
  {
    id v10 = *(void **)(v8 + 8);
    id v11 = v9;
    id v12 = v10;
    id v13 = v11;
    if (v9)
    {
      uint64_t v14 = v13;
      sub_1D8378804(0, v13);
    }
    sub_1D837BDE4(v9, v10);
  }
  uint64_t v15 = *(void **)v1;
  if (*(void *)v1 != 1)
  {
    uint64_t v16 = *(void **)(v1 + 8);
    id v17 = v16;
    id v18 = v15;
    id v19 = v17;
    if (v16)
    {
      uint64_t v20 = v19;
      sub_1D8378804(1, v19);
    }
    sub_1D837BDE4(v15, v16);
  }
  id v21 = *(void **)v8;
  if (*(void *)v8 != 1)
  {
    id v22 = *(void **)(v8 + 8);
    id v23 = v22;
    id v24 = v21;
    id v25 = v23;
    if (v22)
    {
      id v26 = v25;
      sub_1D8378804(0, v25);
    }
    sub_1D837BDE4(v21, v22);
  }
}

id sub_1D8372954(id result)
{
  id v2 = *(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass];
  *(void *)&v1[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass] = result;
  if (v2 != result)
  {
    sub_1D83720A4((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D8377C04, sub_1D8377B6C);
    sub_1D83720A4((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D8377DCC, sub_1D8377D44);
    if (objc_msgSend(v1, sel_isResizing)) {
      _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0();
    }
    sub_1D8371BC0(0);
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void sub_1D8372AAC()
{
  id v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v0, sel_continuousCornerRadius);
  objc_msgSend(v1, sel_setCornerRadius_);

  objc_msgSend(v0, sel_continuousCornerRadius);
  objc_msgSend(v0, sel__setContinuousCornerRadius_);
  id v2 = objc_msgSend(v0, sel_backgroundView);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v0, sel_continuousCornerRadius);
    objc_msgSend(v3, sel__setContinuousCornerRadius_);
  }
}

id sub_1D8372C34()
{
  id v1 = &v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  id v2 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v2 != (void *)1)
  {
    id v3 = (void *)*((void *)v1 + 1);
    id v4 = v2;
    id v5 = v3;
    id v6 = v4;
    if (v2)
    {
      id v7 = v6;
      id v8 = sub_1D8378338(1, 1);
      objc_msgSend(v7, sel_setFont_, v8);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (id v9 = objc_msgSend(v0, sel_traitCollection),
            id v10 = objc_msgSend(v9, sel_preferredContentSizeCategory),
            v9,
            LOBYTE(v9) = sub_1D8382178(),
            v10,
            (v9 & 1) != 0))
      {
        objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v7, sel_setMinimumScaleFactor_, 0.7);
      }
    }
    sub_1D837BDE4(v2, v3);
  }
  id v11 = &v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  id v12 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v12 != (void *)1)
  {
    id v13 = (void *)*((void *)v11 + 1);
    id v14 = v12;
    id v15 = v13;
    id v16 = v14;
    if (v12)
    {
      id v17 = v16;
      id v18 = sub_1D8378338(1, 0);
      objc_msgSend(v17, sel_setFont_, v18);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (id v19 = objc_msgSend(v0, sel_traitCollection),
            id v20 = objc_msgSend(v19, sel_preferredContentSizeCategory),
            v19,
            LOBYTE(v19) = sub_1D8382178(),
            v20,
            (v19 & 1) != 0))
      {
        objc_msgSend(v17, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v17, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v17, sel_setMinimumScaleFactor_, 0.7);
      }
    }
    sub_1D837BDE4(v12, v13);
  }
  id v21 = *(void **)v1;
  if (*(void *)v1 != 1)
  {
    id v22 = (void *)*((void *)v1 + 1);
    id v23 = v22;
    id v24 = v21;
    id v25 = v23;
    if (v22)
    {
      id v26 = v25;
      id v27 = sub_1D8378338(0, 1);
      objc_msgSend(v26, sel_setFont_, v27);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (id v28 = objc_msgSend(v0, sel_traitCollection),
            id v29 = objc_msgSend(v28, sel_preferredContentSizeCategory),
            v28,
            LOBYTE(v28) = sub_1D8382178(),
            v29,
            (v28 & 1) != 0))
      {
        objc_msgSend(v26, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v26, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v26, sel_setMinimumScaleFactor_, 0.7);
      }
    }
    sub_1D837BDE4(v21, v22);
  }
  uint64_t v30 = *(void **)v11;
  if (*(void *)v11 != 1)
  {
    CGRect v31 = (void *)*((void *)v11 + 1);
    id v32 = v31;
    id v33 = v30;
    id v34 = v32;
    if (v31)
    {
      CGRect v35 = v34;
      id v36 = sub_1D8378338(0, 0);
      objc_msgSend(v35, sel_setFont_, v36);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (id v37 = objc_msgSend(v0, sel_traitCollection),
            id v38 = objc_msgSend(v37, sel_preferredContentSizeCategory),
            v37,
            LOBYTE(v37) = sub_1D8382178(),
            v38,
            (v37 & 1) != 0))
      {
        objc_msgSend(v35, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v35, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v35, sel_setMinimumScaleFactor_, 0.7);
      }
    }
    sub_1D837BDE4(v30, v31);
  }
  return objc_msgSend(v0, sel_setNeedsLayout);
}

void sub_1D83730BC(void *a1, char a2)
{
  id v3 = v2;
  id v6 = objc_msgSend(v3, sel_title);
  char v131 = a2;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_1D83820F8();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(a1, sel_title);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = sub_1D83820F8();
    uint64_t v15 = v14;

    if (v10)
    {
      if (v15)
      {
        if (v8 == v13 && v10 == v15)
        {
          swift_bridgeObjectRelease();
          char v17 = 1;
        }
        else
        {
          char v17 = sub_1D83822D8();
          swift_bridgeObjectRelease();
        }
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    if (v15)
    {
      char v17 = 0;
      goto LABEL_18;
    }
LABEL_16:
    char v17 = 1;
    goto LABEL_19;
  }
  if (!v10) {
    goto LABEL_16;
  }
LABEL_13:
  char v17 = 0;
LABEL_18:
  swift_bridgeObjectRelease();
LABEL_19:
  id v18 = objc_msgSend(v3, sel_subtitle);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = sub_1D83820F8();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  id v23 = objc_msgSend(a1, sel_subtitle);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = sub_1D83820F8();
    uint64_t v27 = v26;

    if (v22)
    {
      if (v27)
      {
        if (v20 == v25 && v22 == v27)
        {
          swift_bridgeObjectRelease();
          char v28 = 1;
        }
        else
        {
          char v28 = sub_1D83822D8();
          swift_bridgeObjectRelease();
        }
        goto LABEL_34;
      }
      goto LABEL_29;
    }
    if (v27)
    {
      char v28 = 0;
      goto LABEL_34;
    }
  }
  else if (v22)
  {
LABEL_29:
    char v28 = 0;
LABEL_34:
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  char v28 = 1;
LABEL_35:
  unsigned int v29 = objc_msgSend(v3, sel_isEnabled);
  unsigned int v30 = objc_msgSend(a1, sel_isEnabled);
  unsigned int v31 = objc_msgSend(v3, sel_isRedacted);
  unsigned int v32 = objc_msgSend(a1, sel_isRedacted);
  unsigned int v33 = objc_msgSend(v3, sel_isSelected);
  unsigned int v34 = objc_msgSend(a1, sel_isSelected);
  if ((v17 & v28 & 1) != 0
    && ((v29 ^ v30) & 1) == 0
    && ((v31 ^ v32) & 1) == 0
    && v33 == v34)
  {
    return;
  }
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v3;
  *(void *)(v35 + 24) = a1;
  if ((v131 & 1) == 0)
  {
    swift_unknownObjectRetain();
    id v38 = v3;
    goto LABEL_46;
  }
  id v36 = self;
  swift_unknownObjectRetain();
  id v37 = v3;
  if ((objc_msgSend(v36, sel_areAnimationsEnabled) & 1) == 0)
  {
LABEL_46:
    id v39 = self;
    v40 = (void *)swift_allocObject();
    v40[2] = v3;
    v40[3] = a1;
    v40[4] = sub_1D837BFF4;
    v40[5] = v35;
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = sub_1D837C044;
    *(void *)(v41 + 24) = v40;
    v137 = sub_1D837C060;
    v138 = (void *)v41;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v134 = 1107296256;
    v135 = sub_1D8376700;
    v136 = &block_descriptor_61;
    v42 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    id v43 = v3;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v39, sel_performWithoutAnimation_, v42);
    swift_release();
    _Block_release(v42);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return;
    }
    __break(1u);
    goto LABEL_99;
  }
  if (v17 & v28)
  {
    objc_msgSend(v37, sel_setEnabled_, objc_msgSend(a1, sel_isEnabled));
    objc_msgSend(v37, sel_setRedacted_, objc_msgSend(a1, sel_isRedacted));
    objc_msgSend(v37, sel_setSelected_, objc_msgSend(a1, sel_isSelected));
    swift_release();
    return;
  }
  id v45 = objc_msgSend(v37, sel_gridSizeClass);
  unsigned int v46 = CCUINumberOfRowsForGridSizeClass((uint64_t)v45);
  unsigned int v47 = CCUINumberOfColumnsForGridSizeClass((uint64_t)v45);
  unsigned int v48 = v47;
  if (v46 < 2)
  {
    if (v47 <= 1) {
      goto LABEL_57;
    }
LABEL_54:
    v51 = &v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    v52 = *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    v53 = *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    if (v17)
    {
      v54 = &selRef_setContentOffset_animated_;
      if (v52 == (void *)1)
      {
        v55 = 0;
        goto LABEL_70;
      }
      sub_1D837A574(*(id *)&v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels], *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8]);
      id v64 = v52;
      v55 = v52;
    }
    else
    {
      sub_1D837A574(*(id *)&v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels], *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8]);
      v55 = 0;
      v54 = &selRef_setContentOffset_animated_;
    }
    if ((v28 & (v52 != (void *)1)) == 1)
    {
      id v65 = v53;
      v66 = v53;
LABEL_71:
      uint64_t v67 = *(void **)v51;
      v68 = (void *)*((void *)v51 + 1);
      *(void *)v51 = v55;
      *((void *)v51 + 1) = v66;
      sub_1D837BDE4(v67, v68);
      v63 = &OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels;
      goto LABEL_72;
    }
LABEL_70:
    v66 = 0;
    goto LABEL_71;
  }
  if (objc_msgSend(v37, sel_supportsAccessibilityContentSizeCategories))
  {
    id v49 = objc_msgSend(v37, sel_traitCollection);
    id v50 = objc_msgSend(v49, sel_preferredContentSizeCategory);

    LOBYTE(v49) = sub_1D8382178();
    if ((v49 & 1) != 0 && v48 >= 2) {
      goto LABEL_54;
    }
  }
LABEL_57:
  v56 = &v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  v52 = *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  v53 = *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
  if (v17)
  {
    v54 = &selRef_setContentOffset_animated_;
    if (v52 == (void *)1)
    {
      v57 = 0;
LABEL_65:
      v60 = 0;
      goto LABEL_66;
    }
    sub_1D837A574(*(id *)&v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels], *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8]);
    id v58 = v52;
    v57 = v52;
  }
  else
  {
    sub_1D837A574(*(id *)&v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels], *(void **)&v37[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8]);
    v57 = 0;
    v54 = &selRef_setContentOffset_animated_;
  }
  if ((v28 & (v52 != (void *)1)) != 1) {
    goto LABEL_65;
  }
  id v59 = v53;
  v60 = v53;
LABEL_66:
  v61 = *(void **)v56;
  v62 = (void *)*((void *)v56 + 1);
  *(void *)v56 = v57;
  *((void *)v56 + 1) = v60;
  sub_1D837BDE4(v61, v62);
  v63 = &OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels;
LABEL_72:
  objc_msgSend(v37, sel_setEnabled_, objc_msgSend(a1, sel_isEnabled));
  objc_msgSend(v37, sel_setRedacted_, objc_msgSend(a1, sel_isRedacted));
  objc_msgSend(v37, sel_setSelected_, objc_msgSend(a1, sel_isSelected));
  id v69 = [a1 v54[153]];
  objc_msgSend(v37, sel_setTitle_, v69);

  id v70 = objc_msgSend(a1, sel_subtitle);
  objc_msgSend(v37, sel_setSubtitle_, v70);

  v71 = &v37[*v63];
  id v73 = *(id *)v71;
  v72 = (void *)*((void *)v71 + 1);
  sub_1D837A574(*(id *)v71, v72);
  if (v52 != (void *)1)
  {
    if (v52) {
      goto LABEL_84;
    }
    id v74 = v53;
    if (v53)
    {
      sub_1D837BDE4(0, v53);
      goto LABEL_84;
    }
  }
  sub_1D837BDE4(v52, v53);
  if (v73 != (id)1)
  {
    id v75 = v73;
    if (v73)
    {
    }
    else if (!v72)
    {
      swift_release();
      sub_1D837BDE4(0, 0);
      goto LABEL_75;
    }
LABEL_84:
    id v130 = v36;
    sub_1D837A574(v52, v53);
    v76 = sub_1D8376728(v52, v53, v73, v72);
    v78 = v77;
    sub_1D837BDE4(v52, v53);
    sub_1D837A574(v52, v53);
    v129 = v72;
    v79 = sub_1D8376728(v73, v72, v52, v53);
    v81 = v80;
    sub_1D837BDE4(v52, v53);
    v82 = v52;
    uint64_t v83 = swift_allocObject();
    *(void *)(v83 + 16) = v76;
    *(void *)(v83 + 24) = v78;
    uint64_t v84 = swift_allocObject();
    *(void *)(v84 + 16) = v79;
    *(void *)(v84 + 24) = v81;
    uint64_t v132 = v84;
    id v85 = v81;
    id v120 = v76;
    v122 = v78;
    id v119 = v78;
    id v125 = v79;
    v126 = v85;
    v127 = v82;
    v128 = v53;
    if (v82 == (void *)1)
    {
      uint64_t v86 = 0;
      BOOL v87 = 1;
      uint64_t v88 = 0;
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      uint64_t v91 = 0;
      uint64_t v92 = 0;
      uint64_t v93 = 0;
      char v94 = 1;
    }
    else
    {
      sub_1D837A574(v82, v53);

      BOOL v87 = v82 == 0;
      uint64_t v91 = 0;
      uint64_t v90 = 0;
      uint64_t v89 = 0;
      uint64_t v88 = 0;
      uint64_t v86 = 0;
      if (v82)
      {
        objc_msgSend(v82, sel_frame);
        uint64_t v90 = v95;
        uint64_t v89 = v96;
        uint64_t v88 = v97;
        uint64_t v86 = v98;
      }
      if (v53)
      {
        objc_msgSend(v53, sel_frame);
        uint64_t v91 = v99;
        uint64_t v92 = v100;
        uint64_t v93 = v101;
        uint64_t v103 = v102;
        char v94 = 0;
        goto LABEL_92;
      }
      char v94 = 1;
      uint64_t v92 = 0;
      uint64_t v93 = 0;
    }
    uint64_t v103 = 0;
LABEL_92:
    uint64_t v104 = swift_allocObject();
    *(void *)(v104 + 16) = v37;
    *(void *)(v104 + 24) = v90;
    *(void *)(v104 + 32) = v89;
    *(void *)(v104 + 40) = v88;
    *(void *)(v104 + 48) = v86;
    *(unsigned char *)(v104 + 56) = v87;
    *(void *)(v104 + 64) = v91;
    *(void *)(v104 + 72) = v92;
    *(void *)(v104 + 80) = v93;
    *(void *)(v104 + 88) = v103;
    char v118 = v94;
    *(unsigned char *)(v104 + 96) = v94;
    *(void *)(v104 + 104) = v73;
    *(void *)(v104 + 112) = v129;
    *(void *)(v104 + 120) = 0x3F847AE147AE147BLL;
    *(void *)(v104 + 128) = sub_1D837C0C8;
    *(void *)(v104 + 136) = v83;
    *(void *)(v104 + 144) = sub_1D837C72C;
    *(void *)(v104 + 152) = v132;
    uint64_t v105 = swift_allocObject();
    *(void *)(v105 + 16) = sub_1D837C144;
    *(void *)(v105 + 24) = v104;
    v137 = sub_1D837C6B0;
    v138 = (void *)v105;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v134 = 1107296256;
    v135 = sub_1D8376700;
    v136 = &block_descriptor_77;
    v106 = _Block_copy(&aBlock);
    v107 = v37;
    sub_1D837A574(v73, v129);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v130, sel_performWithoutAnimation_, v106);
    _Block_release(v106);
    LOBYTE(v106) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v106 & 1) == 0)
    {
      id v108 = sub_1D8376CB8();
      id v109 = objc_msgSend(v108, sel_count);

      unsigned int v110 = objc_msgSend(v107, sel_isResizing);
      if ((uint64_t)v109 > 0) {
        uint64_t v111 = 1;
      }
      else {
        uint64_t v111 = v110;
      }
      objc_msgSend(v107, sel_setClipsToBounds_, v111);
      id v117 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA5F08]), sel_init);
      objc_msgSend(v117, sel_setBehaviorType_, 1);
      objc_msgSend(v117, sel_setDampingRatio_, 1.0);
      objc_msgSend(v117, sel_setResponse_, 0.51302);
      uint64_t v112 = swift_allocObject();
      *(void *)(v112 + 16) = v107;
      *(void *)(v112 + 24) = sub_1D837C0C8;
      *(void *)(v112 + 32) = v83;
      *(void *)(v112 + 40) = sub_1D837C72C;
      *(void *)(v112 + 48) = v132;
      *(void *)(v112 + 56) = v90;
      *(void *)(v112 + 64) = v89;
      *(void *)(v112 + 72) = v88;
      *(void *)(v112 + 80) = v86;
      *(unsigned char *)(v112 + 88) = v87;
      *(void *)(v112 + 96) = v91;
      *(void *)(v112 + 104) = v92;
      *(void *)(v112 + 112) = v93;
      *(void *)(v112 + 120) = v103;
      *(unsigned char *)(v112 + 128) = v118;
      *(void *)(v112 + 136) = 0x3F847AE147AE147BLL;
      *(void *)(v112 + 144) = v76;
      *(void *)(v112 + 152) = v122;
      *(void *)(v112 + 160) = v73;
      *(void *)(v112 + 168) = v129;
      v137 = sub_1D837C224;
      v138 = (void *)v112;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v134 = 1107296256;
      v135 = sub_1D8373F94;
      v136 = &block_descriptor_83;
      v123 = _Block_copy(&aBlock);
      v113 = v107;
      sub_1D837A574(v73, v129);
      id v124 = v119;
      swift_retain();
      swift_retain();
      id v121 = v120;
      swift_release();
      v114 = (void *)swift_allocObject();
      v114[2] = sub_1D837C0C8;
      v114[3] = v83;
      v114[4] = v113;
      v114[5] = sub_1D837C72C;
      v114[6] = v132;
      v137 = sub_1D837C2D4;
      v138 = v114;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v134 = 1107296256;
      v135 = sub_1D8377658;
      v136 = &block_descriptor_89;
      v115 = _Block_copy(&aBlock);
      v116 = v113;
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v130, sel_sb_animateWithSettings_mode_animations_completion_, v117, 3, v123, v115);
      swift_release();
      _Block_release(v115);
      _Block_release(v123);

      swift_release();
      swift_release();

      sub_1D837BDE4(v73, v129);
      sub_1D837BDE4(v127, v128);
      swift_release();
      return;
    }
LABEL_99:
    __break(1u);
    return;
  }
  swift_release();
LABEL_75:
  sub_1D837BDE4(v52, v53);
}

uint64_t sub_1D8373F94(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1D8374058()
{
  id v1 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction];
  if (v1)
  {
    id v8 = v1;
    id v2 = objc_msgSend(v0, sel_contextMenuDelegate);
    if (v2
      && (id v3 = objc_msgSend(v2, sel_contextMenu), swift_unknownObjectRelease(), v3))
    {
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = v3;
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = sub_1D837BF2C;
      *(void *)(v5 + 24) = v4;
      aBlock[4] = sub_1D837BF44;
      aBlock[5] = v5;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1D8374240;
      aBlock[3] = &block_descriptor_43;
      id v6 = _Block_copy(aBlock);
      id v7 = v3;
      swift_retain();
      swift_release();
      objc_msgSend(v8, sel_updateVisibleMenuWithBlock_, v6);

      _Block_release(v6);
      LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if (v7) {
        __break(1u);
      }
    }
    else
    {
    }
  }
}

id sub_1D8374240(uint64_t a1, void *a2)
{
  id v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)v2();

  return v4;
}

id CCUIControlTemplateView.contentMetrics.getter()
{
  v2.super_class = (Class)CCUIControlTemplateView;
  id v0 = objc_msgSendSuper2(&v2, sel_contentMetrics);
  return v0;
}

void CCUIControlTemplateView.contentMetrics.setter(void *a1)
{
  objc_super v2 = v1;
  v10.receiver = v1;
  v10.super_class = (Class)CCUIControlTemplateView;
  id v4 = objc_msgSendSuper2(&v10, sel_contentMetrics);
  v9.receiver = v1;
  v9.super_class = (Class)CCUIControlTemplateView;
  objc_msgSendSuper2(&v9, sel_setContentMetrics_, a1);
  id v5 = objc_msgSend(v1, sel_contentMetrics);
  id v6 = v5;
  if (v4)
  {
    if (v5)
    {
      type metadata accessor for CCUIModuleContentMetrics();
      id v7 = v4;
      char v8 = sub_1D83821A8();

      if (v8) {
        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
  if (v5)
  {

LABEL_7:
    sub_1D8372C34();
    objc_msgSend(v2, sel_setNeedsLayout);
    id v7 = v4;
LABEL_8:
  }
}

__C::CGRect __swiftcall CCUIControlTemplateView.glyphContentFrame()()
{
  objc_msgSend(v0, sel_bounds);
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  unsigned int v9 = objc_msgSend(v0, sel__shouldReverseLayoutDirection);
  id v10 = objc_msgSend(v0, sel_contentMetrics);
  if (v10)
  {
    id v11 = v10;
    objc_msgSend(v10, sel_metricsScaleFactor);
    id v12 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v12, sel_displayScale);

    UIRoundToScale();
    CGFloat v14 = v13;
  }
  else
  {
    CGFloat v14 = 14.0;
  }
  id v15 = objc_msgSend(v0, sel_contentMetrics);
  if (v15)
  {
    id v16 = v15;
    objc_msgSend(v15, sel_gridGeometryInfo);
    double v18 = v17;
  }
  else
  {
    double v18 = CCUIItemEdgeSize();
  }
  v64.origin.CGFloat x = v2;
  v64.origin.CGFloat y = v4;
  v64.size.CGFloat width = v6;
  v64.size.double height = v8;
  double Height = CGRectGetHeight(v64);
  if (v18 >= Height) {
    double v18 = Height;
  }
  CGFloat v20 = 0.0;
  if (v9)
  {
    v65.origin.CGFloat x = v2;
    v65.origin.CGFloat y = v4;
    v65.size.CGFloat width = v6;
    v65.size.double height = v8;
    CGFloat v20 = CGRectGetMaxX(v65) - v18;
  }
  uint64_t v21 = 0;
  double v22 = v18;
  double v23 = v18;
  CGRect v66 = CGRectInset(*(CGRect *)&v20, v14, v14);
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat width = v66.size.width;
  v66.origin.CGFloat x = v2;
  CGFloat v27 = v66.size.height;
  v66.origin.CGFloat y = v4;
  CGFloat v28 = v66.origin.x;
  v66.size.CGFloat width = v6;
  CGFloat v29 = v66.origin.y;
  v66.size.double height = v8;
  CGFloat v30 = v66.size.width;
  CGFloat v62 = v66.size.height;
  CGRect v71 = CGRectInset(v66, v14, v14);
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  v67.size.CGFloat width = width;
  v67.size.double height = v27;
  CGRect v68 = CGRectIntersection(v67, v71);
  double v31 = v68.origin.x;
  CGFloat v32 = v68.origin.y;
  CGFloat v33 = v68.size.width;
  CGFloat v34 = v68.size.height;
  if (v9)
  {
    double MaxX = CGRectGetMaxX(v68);
    v69.origin.CGFloat x = v31;
    v69.origin.CGFloat y = v32;
    v69.size.CGFloat width = v33;
    v69.size.double height = v34;
    double v31 = MaxX - CGRectGetWidth(v69);
  }
  id v36 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v36, sel_displayScale);
  uint64_t v61 = v37;

  CGFloat v38 = v28;
  if (objc_msgSend(v0, sel_isExpanded))
  {
    CGFloat v39 = v29;
    uint64_t v60 = v61;
    CGFloat v40 = v30;
    CGFloat v41 = v62;
    if (CCUINumberOfColumnsForGridSizeClass((uint64_t)objc_msgSend(v0, sel_gridSizeClass)) > 1) {
      UIRectCenteredYInRectScale();
    }
    else {
      UIRectCenteredIntegralRectScale();
    }
    double v31 = v42;
    CGFloat v32 = v43;
    CGFloat v33 = v44;
    CGFloat v34 = v45;
  }
  else
  {
    CGFloat v39 = v29;
    CGFloat v40 = v30;
    CGFloat v41 = v62;
  }
  if (!objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories, v60)) {
    goto LABEL_28;
  }
  id v46 = objc_msgSend(v0, sel_traitCollection);
  id v47 = objc_msgSend(v46, sel_preferredContentSizeCategory);

  LOBYTE(v46) = sub_1D8382178();
  if ((v46 & 1) == 0) {
    goto LABEL_28;
  }
  if (CCUINumberOfRowsForGridSizeClass((uint64_t)objc_msgSend(v0, sel_gridSizeClass)) < 2) {
    goto LABEL_28;
  }
  if (objc_msgSend(v0, sel_isResizing)) {
    goto LABEL_28;
  }
  if (objc_msgSend(v0, sel_isExpanded)) {
    goto LABEL_28;
  }
  unsigned int v48 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if ((unint64_t)v48 < 2) {
    goto LABEL_28;
  }
  id v49 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
  id v50 = v48;
  sub_1D837A574(v48, v49);
  id v51 = objc_msgSend(v50, sel_font, sub_1D83749D0(v48, v49, 0, &v63, v38, v39, v40, v41, v31, v32, v33, v34));
  if (!v51)
  {
    __break(1u);
    goto LABEL_30;
  }
  v56 = v51;
  objc_msgSend(v51, sel_ascender);

  id v57 = objc_msgSend(v50, sel_font);
  if (!v57)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v58 = v57;
  objc_msgSend(v57, sel_capHeight);

  UIRoundToScale();
  CGFloat v32 = v59;

LABEL_28:
  double v52 = v31;
  double v53 = v32;
  double v54 = v33;
  double v55 = v34;
LABEL_31:
  result.size.double height = v55;
  result.size.CGFloat width = v54;
  result.origin.CGFloat y = v53;
  result.origin.CGFloat x = v52;
  return result;
}

double sub_1D83749D0@<D0>(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, double *a4@<X8>, CGFloat a5@<D0>, CGFloat a6@<D1>, CGFloat a7@<D2>, CGFloat a8@<D3>, CGFloat a9@<D4>, CGFloat a10@<D5>, CGFloat a11@<D6>, CGFloat a12@<D7>)
{
  unsigned int v25 = objc_msgSend(v12, sel__shouldReverseLayoutDirection);
  id v26 = objc_msgSend(v12, sel_traitCollection);
  objc_msgSend(v26, sel_displayScale);

  CGFloat v77 = a9;
  CGFloat v78 = a10;
  CGFloat rect = a11;
  CGFloat v73 = a12;
  double v27 = sub_1D8378514(v25, a3, a5, a6, a7, a8, a9, a10, a11, a12);
  CGFloat v29 = v28;
  double v31 = v30;
  double v33 = v32;
  CGFloat v34 = 0.0;
  CGFloat Width = 0.0;
  double Height = 0.0;
  double v74 = 0.0;
  if (a2)
  {
    id v37 = a2;
    objc_msgSend(v37, sel_sizeThatFits_, v31, v33);
    double v74 = v38;
    double v40 = v39;
    v80.origin.CGFloat x = v27;
    v80.origin.CGFloat y = v29;
    v80.size.CGFloat width = v31;
    v80.size.double height = v33;
    CGFloat Width = CGRectGetWidth(v80);
    v81.origin.CGFloat x = v27;
    v81.origin.CGFloat y = v29;
    v81.size.CGFloat width = v31;
    v81.size.double height = v33;
    double Height = CGRectGetHeight(v81);

    if (Height >= v40) {
      double Height = v40;
    }
  }
  double v41 = 0.0;
  double v76 = Height;
  if (a1)
  {
    id v42 = a1;
    v82.origin.CGFloat x = v27;
    v82.origin.CGFloat y = v29;
    v82.size.CGFloat width = v31;
    v82.size.double height = v33;
    double v43 = CGRectGetWidth(v82);
    v83.origin.CGFloat x = v27;
    v83.origin.CGFloat y = v29;
    v83.size.CGFloat width = v31;
    v83.size.double height = v33;
    double v44 = CGRectGetHeight(v83) - Height;
    objc_msgSend(v42, sel_sizeThatFits_, v43, v44);
    double v41 = v45;
    if (v44 < v45)
    {
      if (objc_msgSend(v12, sel_supportsAccessibilityContentSizeCategories))
      {
        id v46 = objc_msgSend(v12, sel_traitCollection);
        id v47 = objc_msgSend(v46, sel_preferredContentSizeCategory);

        LOBYTE(v46) = sub_1D8382178();
        double v41 = v44;
        if (v46)
        {
          v84.origin.CGFloat x = v27;
          v84.origin.CGFloat y = v29;
          v84.size.CGFloat width = v31;
          v84.size.double height = v33;
          CGFloat v48 = CGRectGetWidth(v84) - v74;
          v85.origin.CGFloat x = v27;
          v85.origin.CGFloat y = v29;
          v85.size.CGFloat width = v31;
          v85.size.double height = v33;
          objc_msgSend(v42, sel_sizeThatFits_, v48, CGRectGetHeight(v85));
          v86.origin.CGFloat x = v27;
          v86.origin.CGFloat y = v29;
          v86.size.CGFloat width = v31;
          v86.size.double height = v33;
          CGRectGetHeight(v86);

          v87.origin.CGFloat x = v27;
          v87.origin.CGFloat y = v29;
          v87.size.CGFloat width = v31;
          v87.size.double height = v33;
          CGRectGetMinX(v87);
          v88.origin.CGFloat x = v27;
          v88.origin.CGFloat y = v29;
          v88.size.CGFloat width = v31;
          v88.size.double height = v33;
          CGRectGetMinY(v88);
          UIRectCenteredYInRectScale();
          double v53 = v49;
          double v54 = v50;
          CGFloat v34 = v51;
          double v41 = v52;
          if (v25)
          {
            v89.origin.CGFloat x = v27;
            v89.origin.CGFloat y = v29;
            v89.size.CGFloat width = v31;
            v89.size.double height = v33;
            CGRectGetMinX(v89);
          }
          else
          {
            CGRectGetMaxX(*(CGRect *)&v49);
          }
          v100.origin.CGFloat x = v27;
          v100.origin.CGFloat y = v29;
          v100.size.CGFloat width = v31;
          v100.size.double height = v33;
          CGRectGetMinY(v100);
          UIRectCenteredYInRectScale();
          CGFloat MinX = v69;
          double v67 = v70;
          CGFloat v75 = v71;
          double v76 = v72;
          goto LABEL_21;
        }
      }
      else
      {
        double v41 = v44;
      }
    }
    v90.origin.CGFloat x = v27;
    v90.origin.CGFloat y = v29;
    v90.size.CGFloat width = v31;
    v90.size.double height = v33;
    CGFloat v34 = CGRectGetWidth(v90);
  }
  CGFloat v75 = Width;
  double v55 = Height + v41;
  if (a3)
  {
    v91.origin.CGFloat x = v27;
    v91.origin.CGFloat y = v29;
    v91.size.CGFloat width = v31;
    v91.size.double height = v33;
    double MaxY = CGRectGetMaxY(v91);
    v92.origin.CGFloat x = v27;
    v92.origin.CGFloat y = v29;
    v92.size.CGFloat width = v31;
    v92.size.double height = v55;
    double v54 = MaxY - CGRectGetHeight(v92);
    sub_1D83777F4();
    CCUIEdgeInsetsFromDirectionalEdgeInsets();
    double v58 = v57;
    v93.origin.CGFloat x = v77;
    v93.origin.CGFloat y = v78;
    v93.size.CGFloat width = rect;
    v93.size.double height = v73;
    if (v54 <= CGRectGetMaxY(v93) + v58)
    {
      v94.origin.CGFloat x = v77;
      v94.origin.CGFloat y = v78;
      v94.size.CGFloat width = rect;
      v94.size.double height = v73;
      double v54 = v58 + CGRectGetMaxY(v94);
      double v55 = v41;
    }
    if (v25)
    {
      v95.origin.CGFloat x = v77;
      v95.origin.CGFloat y = v78;
      v95.size.CGFloat width = rect;
      v95.size.double height = v73;
      double MaxX = CGRectGetMaxX(v95);
      v96.origin.CGFloat x = v27;
      v96.origin.CGFloat y = v54;
      v96.size.CGFloat width = v31;
      v96.size.double height = v55;
      double v27 = MaxX - CGRectGetWidth(v96);
    }
  }
  else
  {
    UIRectCenteredYInRectScale();
    double v54 = v62;
    if (v25)
    {
      double v63 = v61;
      sub_1D83776B8();
      CCUIEdgeInsetsFromDirectionalEdgeInsets();
      double v65 = v64;
      v97.origin.CGFloat x = v77;
      v97.origin.CGFloat y = v78;
      v97.size.CGFloat width = rect;
      v97.size.double height = v73;
      double v27 = CGRectGetMinX(v97) - v65 - v63;
    }
    else
    {
      double v27 = v60;
    }
  }
  v98.origin.CGFloat x = v27;
  v98.origin.CGFloat y = v54;
  v98.size.CGFloat width = v34;
  v98.size.double height = v41;
  CGFloat MinX = CGRectGetMinX(v98);
  v99.origin.CGFloat x = v27;
  v99.origin.CGFloat y = v54;
  v99.size.CGFloat width = v34;
  v99.size.double height = v41;
  double v67 = CGRectGetMaxY(v99);
  double v53 = v27;
LABEL_21:
  *a4 = v53;
  a4[1] = v54;
  a4[2] = v34;
  a4[3] = v41;
  a4[4] = MinX;
  a4[5] = v67;
  double result = v76;
  a4[6] = v75;
  a4[7] = v76;
  return result;
}

Swift::Void __swiftcall CCUIControlTemplateView.selectionDidChange()()
{
  id v1 = objc_msgSend(v0, sel_visualStylingProviderForCategory_, 1);
  if (v1)
  {
    CGFloat v2 = v1;
    id v3 = v1;
    sub_1D8374FFC((uint64_t)v3, 1, v2);
  }
}

uint64_t sub_1D8374FFC(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 == 1)
  {
    double v45 = (void *)result;
    unsigned int v5 = objc_msgSend(v3, sel_isSelected);
    char v6 = v5;
    if (v5) {
      uint64_t v7 = 0xD000000000000014;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v5) {
      uint64_t v8 = 0x80000001D83880E0;
    }
    else {
      uint64_t v8 = 0;
    }
    unsigned int v9 = self;
    unsigned int v10 = objc_msgSend(v9, sel__isInAnimationBlockWithAnimationsEnabled);
    char v11 = v10;
    double v12 = 0.0;
    if (v10)
    {
      objc_msgSend(v9, sel__currentAnimationDuration);
      double v12 = v13;
    }
    CGFloat v14 = &v3[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    id v15 = *(void **)&v3[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    if (v15 != (void *)1)
    {
      id v16 = (void *)*((void *)v14 + 1);
      id v17 = v15;
      id v18 = v16;
      id v19 = v17;
      if (v15)
      {
        CGFloat v20 = v19;
        sub_1D837B108(v19, v11, v3, v7, v8, v6, v45, a3, v12);
      }
      sub_1D837BDE4(v15, v16);
    }
    double v44 = a3;
    uint64_t v21 = &v3[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    double v22 = *(void **)&v3[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    if (v22 != (void *)1)
    {
      double v23 = (void *)*((void *)v21 + 1);
      id v24 = v22;
      id v25 = v23;
      id v26 = v24;
      if (v22)
      {
        double v27 = v26;
        sub_1D837B108(v26, v11, v3, v7, v8, v6, v45, v44, v12);
      }
      sub_1D837BDE4(v22, v23);
    }
    sub_1D837BE28(v7, v8, v6);
    unsigned int v28 = objc_msgSend(v3, sel_isSelected);
    char v29 = v28;
    if (v28) {
      uint64_t v30 = 0xD000000000000016;
    }
    else {
      uint64_t v30 = 1;
    }
    if (v28) {
      uint64_t v31 = 0x80000001D83880C0;
    }
    else {
      uint64_t v31 = 0;
    }
    double v32 = *(void **)v14;
    if (*(void *)v14 != 1)
    {
      double v33 = (void *)*((void *)v14 + 1);
      id v34 = v33;
      id v35 = v32;
      id v36 = v34;
      if (v33)
      {
        id v37 = v36;
        sub_1D837A6B8(v33, v30, v31, v29, v45, v44);
      }
      sub_1D837BDE4(v32, v33);
    }
    double v38 = *(void **)v21;
    if (*(void *)v21 != 1)
    {
      double v39 = (void *)*((void *)v21 + 1);
      id v40 = v39;
      id v41 = v38;
      id v42 = v40;
      if (v39)
      {
        double v43 = v42;
        sub_1D837A6B8(v39, v30, v31, v29, v45, v44);
      }
      sub_1D837BDE4(v38, v39);
    }
    return sub_1D837BE28(v30, v31, v29);
  }
  return result;
}

Swift::Void __swiftcall CCUIControlTemplateView.layoutSubviews()()
{
  v67.super_class = (Class)CCUIControlTemplateView;
  objc_msgSendSuper2(&v67, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = objc_msgSend(v0, sel_backgroundView);
  objc_msgSend(v9, sel_setFrame_, v2, v4, v6, v8);

  id v10 = objc_msgSend(v0, sel_contentMetrics);
  char v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, sel_gridGeometryInfo);
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = CCUIItemEdgeSize();
    double v15 = CCUILayoutGutter();
  }
  objc_msgSend(v0, sel_glyphContentFrame);
  CGFloat v57 = v17;
  CGFloat v58 = v16;
  CGFloat v55 = v19;
  CGFloat v56 = v18;
  CGFloat v20 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v20 != (void *)1)
  {
    double v53 = v15;
    double v54 = v13;
    uint64_t v21 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    id v22 = v21;
    id v23 = v20;
    if ((objc_msgSend(v0, sel_isResizing) & 1) != 0
      || (v24 = v6, double Height = v8, v26 = v2, v27 = v4, objc_msgSend(v0, sel_isExpanded)))
    {
      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (id v28 = objc_msgSend(v0, sel_traitCollection),
            id v29 = objc_msgSend(v28, sel_preferredContentSizeCategory),
            v28,
            LOBYTE(v28) = sub_1D8382178(),
            v29,
            (v28 & 1) != 0))
      {
        uint64_t v30 = 3;
      }
      else
      {
        uint64_t v30 = 2;
      }
      unsigned int v31 = CCUINumberOfRowsForGridSizeClass(v30);
      unsigned int v32 = CCUINumberOfColumnsForGridSizeClass(v30);
      double v24 = v54 * (double)v32 + v53 * ((double)v32 + -1.0);
      if (objc_msgSend(v0, sel_isExpanded))
      {
        v68.origin.CGFloat x = v2;
        v68.origin.CGFloat y = v4;
        v68.size.CGFloat width = v6;
        v68.size.double height = v8;
        double Height = CGRectGetHeight(v68);
      }
      else
      {
        double Height = v54 * (double)v31 + v53 * ((double)v31 + -1.0);
      }
      CGFloat v26 = 0.0;
      CGFloat v27 = 0.0;
    }
    if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories))
    {
      id v33 = objc_msgSend(v0, sel_traitCollection);
      id v34 = objc_msgSend(v33, sel_preferredContentSizeCategory);

      LOBYTE(v33) = sub_1D8382178();
      if ((v33 & 1) != 0
        && (v0[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] & 1) == 0)
      {
        sub_1D837B410(v20, v21, v26, v27, v24, Height, v58, v57, v56, v55);
      }
    }
    sub_1D83749D0(v20, v21, 0, &v59, v26, v27, v24, Height, v58, v57, v56, v55);
    double v35 = v63;
    double v36 = v64;
    double v37 = v65;
    double v38 = v66;
    if (v20) {
      objc_msgSend(v23, sel_setFrame_, v59, v60, v61, v62);
    }
    if (v21)
    {
      id v39 = v22;
      objc_msgSend(v39, sel_setFrame_, v35, v36, v37, v38);
    }
    double v15 = v53;
    double v13 = v54;
  }
  id v40 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v40 != (void *)1)
  {
    id v41 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
    id v42 = v41;
    id v43 = v40;
    if ((objc_msgSend(v0, sel_isResizing) & 1) != 0 || objc_msgSend(v0, sel_isExpanded))
    {
      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (id v44 = objc_msgSend(v0, sel_traitCollection),
            id v45 = objc_msgSend(v44, sel_preferredContentSizeCategory),
            v44,
            LOBYTE(v44) = sub_1D8382178(),
            v45,
            (v44 & 1) != 0))
      {
        uint64_t v46 = 5;
      }
      else
      {
        uint64_t v46 = 4;
      }
      unsigned int v47 = CCUINumberOfColumnsForGridSizeClass(v46);
      double v6 = v13 * (double)v47 + v15 * ((double)v47 + -1.0);
      double v2 = 0.0;
      double v4 = 0.0;
    }
    sub_1D83749D0(v40, v41, 1, &v59, v2, v4, v6, v8, v58, v57, v56, v55);
    double v48 = v63;
    double v49 = v64;
    double v50 = v65;
    double v51 = v66;
    if (v40) {
      objc_msgSend(v43, sel_setFrame_, v59, v60, v61, v62);
    }
    if (v41)
    {
      id v52 = v42;
      objc_msgSend(v52, sel_setFrame_, v48, v49, v50, v51);
    }
  }
  if ((objc_msgSend(v0, sel_isResizing) & 1) == 0) {
    _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0();
  }
}

Swift::Void __swiftcall CCUIControlTemplateView.didMoveToWindow()()
{
  v4.super_class = (Class)CCUIControlTemplateView;
  objc_msgSendSuper2(&v4, sel_didMoveToWindow);
  if (objc_msgSend(v0, sel__isInAWindow))
  {
    v3.receiver = v0;
    v3.super_class = (Class)CCUIControlTemplateView;
    id v1 = objc_msgSendSuper2(&v3, sel_visualStylingProviderForCategory_, 1);
    if (v1)
    {
      double v2 = v1;
      objc_msgSend(v0, sel_setVisualStylingProvider_forCategory_, v1, 1);
    }
  }
}

id CCUIControlTemplateView.visualStylingProvider(for:)(uint64_t a1)
{
  double v2 = v1;
  unint64_t v4 = sub_1D8375C0C();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1D8379748(a1), (v6 & 1) != 0))
  {
    id v7 = *(id *)(*(void *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v9.receiver = v2;
    v9.super_class = (Class)CCUIControlTemplateView;
    return objc_msgSendSuper2(&v9, sel_visualStylingProviderForCategory_, a1);
  }
  return v7;
}

unint64_t sub_1D8375C0C()
{
  uint64_t v1 = OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders;
  if (*(void *)(v0 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders))
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders);
  }
  else
  {
    unint64_t v2 = sub_1D8381A3C(MEMORY[0x1E4FBC860]);
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void sub_1D8375DB8(void *a1, uint64_t a2)
{
  if (a2 != 1) {
    return;
  }
  uint64_t v3 = v2;
  unint64_t v5 = sub_1D8375C0C();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_1D8379748(1), (v7 & 1) != 0))
  {
    double v8 = *(void **)(*(void *)(v5 + 56) + 8 * v6);
    id v9 = v8;
  }
  else
  {
    double v8 = 0;
  }
  swift_bridgeObjectRelease();
  if (!a1)
  {
    if (!v8) {
      return;
    }
    goto LABEL_11;
  }
  if (!v8
    || (sub_1D837C460(0, &qword_1EA88B348),
        id v14 = v8,
        id v10 = a1,
        char v11 = sub_1D83821A8(),
        v10,
        v14,
        double v12 = v14,
        (v11 & 1) == 0))
  {
LABEL_11:
    id v13 = a1;
    unint64_t v15 = sub_1D8375C0C();
    sub_1D8375F18((uint64_t)a1, 1);
    *(void *)(v3 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders) = v15;
    swift_bridgeObjectRelease();
    if (!a1)
    {

      __break(1u);
      return;
    }
    sub_1D8374FFC((uint64_t)v13, 1, v8);
    double v12 = v8;
  }
}

unint64_t sub_1D8375F18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_1D8379F7C(a1, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
  }
  else
  {
    unint64_t result = sub_1D8379748(a2);
    if ((v8 & 1) == 0) {
      return result;
    }
    unint64_t v9 = result;
    int v10 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v2;
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!v10)
    {
      sub_1D837A0B8();
      uint64_t v11 = v14;
    }
    double v12 = *(void **)(*(void *)(v11 + 56) + 8 * v9);
    sub_1D8379DC0(v9, v11);
    *uint64_t v3 = v11;
  }
  return swift_bridgeObjectRelease();
}

void (*sub_1D837606C(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2)
{
  unint64_t result = (void (*)(uint64_t, uint64_t))sub_1D837BE50(a2, (uint64_t)&v6);
  if (v7)
  {
    sub_1D837BEB8(&v6, &v8);
    sub_1D837C460(0, &qword_1EA88B350);
    swift_dynamicCast();
    objc_msgSend(v5, sel_alpha);
    uint64_t v4 = v3;

    *(void *)(swift_allocObject() + 16) = v4;
    return sub_1D837BED8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1D8376140(double a1, uint64_t a2, uint64_t a3)
{
  sub_1D837BE50(a3, (uint64_t)&v5);
  if (v6)
  {
    sub_1D837BEB8(&v5, &v7);
    sub_1D837C460(0, &qword_1EA88B350);
    swift_dynamicCast();
    objc_msgSend(v4, sel_setAlpha_, a1);
  }
  else
  {
    __break(1u);
  }
}

id sub_1D83761E8(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = *(uint64_t (**)(void *, long long *))(a1 + 32);
  if (a3)
  {
    *((void *)&v13 + 1) = swift_getObjectType();
    *(void *)&long long v12 = a3;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  long long v7 = (void *)v5(a2, &v12);
  uint64_t v9 = v8;

  swift_release();
  sub_1D837C354((uint64_t)&v12, &qword_1EA88B388);
  if (v7)
  {
    v11[4] = v7;
    v11[5] = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 1107296256;
    v11[2] = sub_1D8376308;
    v11[3] = &block_descriptor_34;
    long long v7 = _Block_copy(v11);
    swift_release();
  }
  return v7;
}

uint64_t sub_1D8376308(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = *(void (**)(void *, long long *))(a1 + 32);
  if (a3)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a3;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(a2, &v8);

  swift_release();
  return sub_1D837C354((uint64_t)&v8, &qword_1EA88B388);
}

void sub_1D83763AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  if (!a7)
  {
    id v14 = a2;
    if ((a5 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = a2;
    id v16 = a6;
    id v12 = (id)sub_1D83820E8();
    id v22 = sub_1D837606C;
    uint64_t v23 = 0;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 1107296256;
    CGFloat v20 = sub_1D83761E8;
    uint64_t v21 = &block_descriptor_110;
    double v17 = _Block_copy(&v18);
    swift_release();
    objc_msgSend(v16, sel__automaticallyUpdateView_withStyleNamed_andObserverBlock_, v15, v12, v17);

    _Block_release(v17);
    goto LABEL_6;
  }
  objc_msgSend(a7, sel_stopAutomaticallyUpdatingView_, a2);
  if (a5) {
    goto LABEL_5;
  }
LABEL_3:
  id v22 = sub_1D837606C;
  uint64_t v23 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 1107296256;
  CGFloat v20 = sub_1D83761E8;
  uint64_t v21 = &block_descriptor_113;
  uint64_t v11 = _Block_copy(&v18);
  id v12 = a2;
  id v13 = a6;
  swift_release();
  objc_msgSend(v13, sel_automaticallyUpdateView_withStyle_andObserverBlock_, v12, a3, v11);

  _Block_release(v11);
LABEL_6:
}

id sub_1D8376590(void *a1, id a2)
{
  objc_msgSend(a1, sel_setEnabled_, objc_msgSend(a2, sel_isEnabled));
  objc_msgSend(a1, sel_setRedacted_, objc_msgSend(a2, sel_isRedacted));
  id v4 = objc_msgSend(a2, sel_isSelected);
  return objc_msgSend(a1, sel_setSelected_, v4);
}

uint64_t sub_1D837662C(void *a1, id a2, uint64_t (*a3)(void))
{
  id v6 = objc_msgSend(a2, sel_title);
  objc_msgSend(a1, sel_setTitle_, v6);

  id v7 = objc_msgSend(a2, sel_subtitle);
  objc_msgSend(a1, sel_setSubtitle_, v7);

  return a3();
}

uint64_t sub_1D83766D8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1D8376700(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void *sub_1D8376728(void *a1, void *a2, id a3, void *a4)
{
  if (a1 == (void *)1) {
    return 0;
  }
  id v4 = a1;
  id v8 = a1;
  if (v4)
  {
    if (a3 == (id)1)
    {
      if (!a2) {
        return v4;
      }
      goto LABEL_14;
    }
    if (a3 && v8 == a3)
    {

      id v4 = 0;
    }
  }
  if (a2 && (a3 == (id)1 || !a4 || a2 != a4)) {
LABEL_14:
  }
    id v9 = a2;
  return v4;
}

void sub_1D83767C8(void (*a1)(void), uint64_t a2, void *a3, void *a4)
{
  if (a3)
  {
    id v6 = a3;
    a1();
  }
  if (a4)
  {
    id v7 = a4;
    a1();
  }
}

uint64_t sub_1D8376854(void *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void), uint64_t a6, uint64_t (*a7)(void))
{
  double v11 = *(double *)a2;
  CGFloat v31 = *(double *)(a2 + 16);
  CGFloat v32 = *(double *)(a2 + 8);
  int v12 = *(unsigned __int8 *)(a2 + 32);
  CGFloat v26 = *(double *)(a2 + 48);
  CGFloat v27 = *(double *)(a2 + 40);
  CGFloat v28 = *(double *)(a2 + 56);
  CGFloat v29 = *(double *)(a2 + 64);
  CGFloat v30 = *(double *)(a2 + 24);
  char v13 = *(unsigned char *)(a2 + 72);
  objc_msgSend(a1, sel_layoutIfNeeded);
  if (!a3)
  {
LABEL_5:
    CGFloat v25 = v11;
    if (a4)
    {
      objc_msgSend(a4, sel_frame);
      CGRectGetMinY(v34);
    }
    int v15 = BSFloatApproximatelyEqualToFloat();
    id v14 = a3;
    if (a3)
    {
      if (v12)
      {
        if ((v13 & 1) == 0)
        {
          CGFloat v19 = v26;
          CGFloat v18 = v27;
          CGFloat v20 = v28;
          CGFloat v21 = v29;
          id v22 = v14;
          v38.origin.CGFloat x = v27;
          v38.origin.CGFloat y = v26;
          v38.size.CGFloat width = v28;
          v38.size.double height = v29;
          CGRectGetMinY(v38);
          objc_msgSend(v22, sel_frame);
          CGRectGetHeight(v39);
          objc_msgSend(v22, sel_frame);
          objc_msgSend(v22, sel_setFrame_);

          if (!a4) {
            goto LABEL_20;
          }
          goto LABEL_18;
        }
      }
      else
      {
        id v16 = v14;
        v35.origin.CGFloat x = v25;
        v35.origin.CGFloat y = v32;
        v35.size.CGFloat width = v31;
        v35.size.double height = v30;
        CGRectGetMaxY(v35);
        objc_msgSend(v16, sel_frame);
        CGRectGetHeight(v36);
        objc_msgSend(v16, sel_frame);
        objc_msgSend(v16, sel_setFrame_);
      }
    }
    if (!a4) {
      goto LABEL_20;
    }
    if (v13)
    {
      if ((v12 | v15 ^ 1)) {
        goto LABEL_20;
      }
      id v17 = a4;
      v37.origin.CGFloat x = v25;
      v37.origin.CGFloat y = v32;
      v37.size.CGFloat width = v31;
      v37.size.double height = v30;
      CGRectGetMaxY(v37);
LABEL_19:
      objc_msgSend(v17, sel_frame);
      objc_msgSend(v17, sel_setFrame_);

      goto LABEL_20;
    }
    CGFloat v19 = v26;
    CGFloat v18 = v27;
    CGFloat v20 = v28;
    CGFloat v21 = v29;
LABEL_18:
    id v17 = a4;
    v40.origin.CGFloat x = v18;
    v40.origin.CGFloat y = v19;
    v40.size.CGFloat width = v20;
    v40.size.double height = v21;
    CGRectGetMinY(v40);
    goto LABEL_19;
  }
  if (a3 != (void *)1)
  {
    objc_msgSend(a3, sel_frame);
    CGRectGetMaxY(v33);
    goto LABEL_5;
  }
  id v14 = (id)BSFloatApproximatelyEqualToFloat();
LABEL_20:
  MEMORY[0x1F4188790](v14);
  uint64_t v23 = a5(sub_1D837C344);
  MEMORY[0x1F4188790](v23);
  return a7(sub_1D837C34C);
}

void sub_1D8376BA8(void *a1)
{
  id v2 = sub_1D8376CB8();
  objc_msgSend(v2, sel_addObject_, a1);

  if ((sub_1D8376D2C() & 1) == 0)
  {
    sub_1D837A9D4(a1);
    id v3 = objc_msgSend(a1, sel_layer);
    id v4 = (void *)sub_1D8382058();
    if (qword_1EA88BA68 != -1) {
      swift_once();
    }
    id v5 = (id)sub_1D83820E8();
    objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);
  }
}

id sub_1D8376CB8()
{
  uint64_t v1 = OBJC_IVAR___CCUIControlTemplateView____lazy_storage___animatingLabels;
  id v2 = *(void **)(v0 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___animatingLabels);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___animatingLabels);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28BD0]), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_1D8376D2C()
{
  id v1 = objc_msgSend(v0, sel_layer);
  id v2 = objc_msgSend(v1, sel_filters);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1D8382148();

  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v5 = v3 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1D837C3B0(v5, (uint64_t)v15);
    sub_1D837C3B0((uint64_t)v15, (uint64_t)v14);
    sub_1D837C460(0, (unint64_t *)&unk_1EA88B2B8);
    if (!swift_dynamicCast()) {
      goto LABEL_5;
    }
    id v6 = objc_msgSend(v13, sel_name);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = sub_1D83820F8();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
    }
    if (qword_1EA88B2F0 == -1)
    {
      if (!v10) {
        goto LABEL_4;
      }
    }
    else
    {
      swift_once();
      if (!v10)
      {
LABEL_4:

LABEL_5:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
        goto LABEL_6;
      }
    }
    if (v8 == qword_1EA88B2D8 && v10 == unk_1EA88B2E0) {
      break;
    }
    char v11 = sub_1D83822D8();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    if (v11) {
      goto LABEL_23;
    }
LABEL_6:
    v5 += 32;
    if (!--v4)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
LABEL_23:
  swift_bridgeObjectRelease_n();
  return 1;
}

void sub_1D8376F5C(void *a1)
{
  id v2 = sub_1D8376CB8();
  objc_msgSend(v2, sel_addObject_, a1);

  sub_1D837A9D4(a1);
  objc_msgSend(a1, sel_setAlpha_, 0.0);
  id v3 = objc_msgSend(a1, sel_layer);
  uint64_t v4 = (void *)sub_1D8382058();
  if (qword_1EA88BA68 != -1) {
    swift_once();
  }
  id v5 = (id)sub_1D83820E8();
  objc_msgSend(v3, sel_setValue_forKeyPath_, v4, v5);
}

void sub_1D8377064(void *a1, void (*a2)(void (*)(void *a1), void), uint64_t a3, void (*a4)(void (*)(void *a1), void), uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10)
{
  id v14 = a10;
  CGFloat v15 = *(double *)a6;
  CGFloat v16 = *(double *)(a6 + 8);
  CGFloat v18 = *(double *)(a6 + 16);
  CGFloat v17 = *(double *)(a6 + 24);
  char v19 = *(unsigned char *)(a6 + 32);
  CGFloat v32 = *(double *)(a6 + 48);
  CGFloat v33 = *(double *)(a6 + 40);
  CGFloat v20 = *(double *)(a6 + 64);
  CGFloat rect = *(double *)(a6 + 56);
  char v21 = *(unsigned char *)(a6 + 72);
  objc_msgSend(a1, sel_setNeedsLayout);
  objc_msgSend(a1, sel_layoutIfNeeded);
  _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0();
  a2(sub_1D837736C, 0);
  a4(sub_1D8377444, 0);
  if ((v19 & 1) == 0)
  {
    v37.origin.CGFloat x = v15;
    v37.origin.CGFloat y = v16;
    v37.size.CGFloat width = v18;
    v37.size.double height = v17;
    CGRectGetMaxY(v37);
  }
  if ((v21 & 1) == 0)
  {
    v38.origin.CGFloat y = v32;
    v38.origin.CGFloat x = v33;
    v38.size.CGFloat width = rect;
    v38.size.double height = v20;
    CGRectGetMinY(v38);
  }
  int v22 = BSFloatApproximatelyEqualToFloat();
  if (a7)
  {
    if (a9 == (void *)1) {
      return;
    }
    id v23 = a7;
    sub_1D837A574(a9, a10);

    if (a9)
    {
      id v24 = v23;
      objc_msgSend(a9, sel_frame);
      CGRectGetMaxY(v39);
      id v25 = a9;
    }
    else
    {
      if (!a10)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v26 = v23;
      id v25 = a10;
      objc_msgSend(v25, sel_frame);
      CGRectGetMinY(v40);
    }
    objc_msgSend(v23, sel_frame);
    CGRectGetHeight(v41);
    objc_msgSend(v23, sel_frame);
    objc_msgSend(v23, sel_setFrame_);

    goto LABEL_12;
  }
LABEL_13:
  if (!a8 || a9 == (void *)1) {
    return;
  }
  sub_1D837A574(a9, a10);
  id v35 = a8;

  if (a10)
  {
    id v27 = v35;
    objc_msgSend(a10, sel_frame);
    CGRectGetMinY(v42);
  }
  else
  {
    if (a9) {
      int v28 = v22;
    }
    else {
      int v28 = 0;
    }
    CGFloat v29 = v35;
    if (v28 != 1) {
      goto LABEL_24;
    }
    id v30 = v35;
    id v14 = a9;
    objc_msgSend(v14, sel_frame);
    CGRectGetMaxY(v43);
  }
  objc_msgSend(v35, sel_frame);
  objc_msgSend(v35, sel_setFrame_);

  CGFloat v29 = v35;
LABEL_24:
}

void sub_1D837736C(void *a1)
{
  objc_msgSend(a1, sel_setAlpha_, 0.0);
  id v2 = objc_msgSend(a1, sel_layer);
  id v3 = (void *)sub_1D8382058();
  if (qword_1EA88BA68 != -1) {
    swift_once();
  }
  id v4 = (id)sub_1D83820E8();
  objc_msgSend(v2, sel_setValue_forKeyPath_, v3, v4);
}

void sub_1D8377444(void *a1)
{
  id v1 = objc_msgSend(a1, sel_layer);
  id v2 = (void *)sub_1D8382058();
  if (qword_1EA88BA68 != -1) {
    swift_once();
  }
  id v3 = (id)sub_1D83820E8();
  objc_msgSend(v1, sel_setValue_forKeyPath_, v2, v3);
}

void sub_1D8377504(uint64_t a1, uint64_t a2, void (*a3)(id (*)(void *a1), unsigned char *), uint64_t a4, void *a5, void (*a6)(void (*)(uint64_t a1), void *))
{
  CGFloat v16 = a5;
  a3(sub_1D837C2E4, v15);
  v14[2] = a5;
  a6(sub_1D837C2EC, v14);
  id v8 = sub_1D8376CB8();
  id v9 = objc_msgSend(v8, sel_count);

  if (!v9)
  {
    _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE21contentStateDidChangeyyF_0();
    id v10 = sub_1D8376CB8();
    id v11 = objc_msgSend(v10, sel_count);

    unsigned int v12 = objc_msgSend(a5, sel_isResizing);
    if ((uint64_t)v11 > 0) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    objc_msgSend(a5, sel_setClipsToBounds_, v13);
  }
}

id sub_1D83775F8(void *a1)
{
  id v2 = sub_1D8376CB8();
  objc_msgSend(v2, sel_removeObject_, a1);

  return objc_msgSend(a1, sel_removeFromSuperview);
}

uint64_t sub_1D8377658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

double sub_1D83776B8()
{
  id v1 = objc_msgSend(v0, sel_contentMetrics);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_metricsScaleFactor);
    id v3 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v3, sel_displayScale);

    UIRoundToScale();
  }
  id v4 = objc_msgSend(v0, sel_contentMetrics);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_metricsScaleFactor);
    id v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_displayScale);

    UIRoundToScale();
  }
  return 2.0;
}

double sub_1D83777F4()
{
  id v1 = objc_msgSend(v0, sel_contentMetrics);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_metricsScaleFactor);
    id v3 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v3, sel_displayScale);

    UIRoundToScale();
  }
  id v4 = objc_msgSend(v0, sel_contentMetrics);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_metricsScaleFactor);
    id v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_displayScale);

    UIRoundToScale();
  }
  id v7 = objc_msgSend(v0, sel_contentMetrics);
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_metricsScaleFactor);
    id v9 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v9, sel_displayScale);

    UIRoundToScale();
  }
  return 4.0;
}

uint64_t sub_1D8377A24()
{
  if (objc_msgSend(v0, sel_contextMenuDelegate))
  {
    if (objc_msgSend((id)swift_unknownObjectRetain(), sel_showsMenuAsPrimaryAction))
    {
      objc_msgSend(v0, sel_bounds);
      double MidX = CGRectGetMidX(v10);
      objc_msgSend(v0, sel_bounds);
      double MidY = CGRectGetMidY(v11);
      id v3 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction];
      if (v3)
      {
        double v4 = MidY;
        id v5 = v3;
        objc_msgSend(v5, sel__presentMenuAtLocation_, MidX, v4);
      }
      return swift_unknownObjectRelease_n();
    }
    swift_unknownObjectRelease();
  }
  id v7 = objc_msgSend(v0, sel_menuModuleDelegate);
  if (v7)
  {
    id v8 = v7;
    if (objc_msgSend(v7, sel_showsMenuModuleAsPrimaryAction)) {
      objc_msgSend(v8, sel_presentMenuModule);
    }
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

void sub_1D8377B6C(void *a1)
{
  uint64_t v2 = v1 + *a1;
  if (*(void *)v2 >= 2uLL)
  {
    objc_msgSend(*(id *)v2, sel_removeFromSuperview);
    id v3 = *(id *)v2;
    double v4 = *(void **)(v2 + 8);
    if (*(void *)v2 == 1 || v4 == 0)
    {
      id v8 = 0;
      uint64_t v7 = 1;
    }
    else
    {
      id v6 = v4;
      uint64_t v7 = 0;
      id v8 = v4;
    }
    *(void *)uint64_t v2 = v7;
    *(void *)(v2 + 8) = v8;
    sub_1D837BDE4(v3, v4);
  }
}

void sub_1D8377C04(void *a1, char a2)
{
  id v5 = objc_msgSend(v2, sel_title);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_1D83820F8();
    uint64_t v9 = v8;

    CGRect v10 = &v2[*a1];
    if (*(void *)v10 >= 2uLL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      id v11 = sub_1D8377F18(v7, v9, 1, a2 & 1);
      swift_bridgeObjectRelease();
      unsigned int v12 = *(void **)v10;
      uint64_t v13 = (void *)*((void *)v10 + 1);
      if (*(void *)v10 == 1)
      {
        id v14 = 0;
      }
      else
      {
        id v15 = v13;
        id v14 = v13;
      }
      *(void *)CGRect v10 = v11;
      *((void *)v10 + 1) = v14;
      id v16 = v11;
      sub_1D837BDE4(v12, v13);
      objc_msgSend(v2, sel_addSubview_, v16);
    }
  }
}

void sub_1D8377D44(void *a1)
{
  uint64_t v2 = v1 + *a1;
  if (*(void *)v2 != 1)
  {
    id v3 = *(void **)(v2 + 8);
    if (v3)
    {
      objc_msgSend(v3, sel_removeFromSuperview);
      double v4 = *(void **)v2;
      if (*(void *)v2 >= 2uLL)
      {
        id v6 = v4;
        uint64_t v5 = (uint64_t)v4;
      }
      else
      {
        uint64_t v5 = 1;
      }
      uint64_t v7 = *(void **)(v2 + 8);
      *(void *)uint64_t v2 = v5;
      *(void *)(v2 + 8) = 0;
      sub_1D837BDE4(v4, v7);
    }
  }
}

void sub_1D8377DCC(void *a1, char a2)
{
  id v5 = objc_msgSend(v2, sel_subtitle);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_1D83820F8();
    uint64_t v9 = v8;

    CGRect v10 = &v2[*a1];
    if (*(void *)v10 == 1 || !*((void *)v10 + 1))
    {
      id v11 = sub_1D8377F18(v7, v9, 0, a2 & 1);
      swift_bridgeObjectRelease();
      unsigned int v12 = *(void **)v10;
      if (*(void *)v10 == 1)
      {
        uint64_t v13 = 0;
      }
      else
      {
        id v14 = v12;
        uint64_t v13 = v12;
      }
      id v15 = (void *)*((void *)v10 + 1);
      *(void *)CGRect v10 = v13;
      *((void *)v10 + 1) = v11;
      id v16 = v11;
      sub_1D837BDE4(v12, v15);
      objc_msgSend(v2, sel_addSubview_, v16);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

id sub_1D8377F18(uint64_t a1, uint64_t a2, char a3, char a4)
{
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if (a3) {
    uint64_t v10 = sub_1D83781CC();
  }
  else {
    uint64_t v10 = 1;
  }
  objc_msgSend(v9, sel_setNumberOfLines_, v10);
  id v11 = sub_1D8378338(a3 & 1, a4 & 1);
  objc_msgSend(v9, sel_setFont_, v11);

  if (objc_msgSend(v4, sel_supportsAccessibilityContentSizeCategories)
    && (id v12 = objc_msgSend(v4, sel_traitCollection),
        id v13 = objc_msgSend(v12, sel_preferredContentSizeCategory),
        v12,
        LOBYTE(v12) = sub_1D8382178(),
        v13,
        (v12 & 1) != 0))
  {
    objc_msgSend(v9, sel_setAdjustsFontSizeToFitWidth_, 0);
  }
  else
  {
    objc_msgSend(v9, sel_setAdjustsFontSizeToFitWidth_, 1);
    objc_msgSend(v9, sel_setMinimumScaleFactor_, 0.7);
  }
  LODWORD(v14) = 1036831949;
  objc_msgSend(v9, sel__setHyphenationFactor_, v14);
  objc_msgSend(v9, sel_setContentMode_, 4);
  unsigned int v15 = objc_msgSend(v4, sel_isSelected);
  unint64_t v16 = 0x80000001D83880E0;
  if (v15) {
    unint64_t v17 = 0xD000000000000014;
  }
  else {
    unint64_t v17 = 0;
  }
  if (v15)
  {
    char v18 = 1;
  }
  else
  {
    unint64_t v16 = 0;
    char v18 = 0;
  }
  unint64_t v19 = 0xD000000000000016;
  if (v15)
  {
    unint64_t v20 = 0x80000001D83880C0;
  }
  else
  {
    unint64_t v19 = 1;
    unint64_t v20 = 0;
  }
  if (a3) {
    uint64_t v21 = v17;
  }
  else {
    uint64_t v21 = v19;
  }
  if (a3) {
    uint64_t v22 = v16;
  }
  else {
    uint64_t v22 = v20;
  }
  if (a3) {
    char v23 = v18;
  }
  else {
    char v23 = v15 != 0;
  }
  id v24 = v9;
  id v25 = objc_msgSend(v4, sel_visualStylingProviderForCategory_, 1);
  sub_1D837A6B8(v9, v21, v22, v23, v25, 0);
  sub_1D837BE28(v21, v22, v23);

  if (a3)
  {
    id v26 = (void *)sub_1D83820E8();
    objc_msgSend(v24, sel_setText_, v26);
  }
  else
  {
    sub_1D8371688(a1, a2);
    id v26 = v27;
    objc_msgSend(v24, sel_setAttributedText_, v27);
  }

  return v24;
}

uint64_t sub_1D83781CC()
{
  uint64_t v1 = sub_1D8382038();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  double v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v0[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility]) {
    return 1;
  }
  id v6 = objc_msgSend(v0, sel_subtitle);
  if (!v6) {
    return 3;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_1D83820F8();
  uint64_t v10 = v9;

  v15[0] = v8;
  v15[1] = v10;
  sub_1D8382028();
  sub_1D837BD90();
  uint64_t v11 = sub_1D83821D8();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0) {
    uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
  }
  if (v14) {
    return 2;
  }
  else {
    return 3;
  }
}

id sub_1D8378338(char a1, char a2)
{
  uint64_t v3 = v2;
  id v5 = sub_1D8378C8C(v2, a2);
  id v6 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, v5);
  uint64_t v7 = (void *)*MEMORY[0x1E4FB2960];
  if (a1) {
    uint64_t v8 = (double *)MEMORY[0x1E4FB09D0];
  }
  else {
    uint64_t v8 = (double *)MEMORY[0x1E4FB09D8];
  }
  double v9 = *v8;
  uint64_t v10 = self;
  uint64_t v11 = *MEMORY[0x1E4FB0928];
  id v12 = v7;
  id result = objc_msgSend(v10, sel__preferredFontDescriptorWithTextStyle_addingSymbolicTraits_design_weight_compatibleWithTraitCollection_, v12, 0x8000, v11, v6, v9);
  if (result)
  {
    uint64_t v14 = result;
    id v15 = objc_msgSend(self, sel_fontWithDescriptor_size_, result, 0.0);
    id v16 = objc_msgSend(v3, sel_contentMetrics);
    if (!v16)
    {
      uint64_t v21 = v5;
      uint64_t v22 = v12;
      goto LABEL_11;
    }
    unint64_t v17 = v16;
    objc_msgSend(v16, sel_metricsScaleFactor);
    double v19 = v18;

    if (v19 >= 1.0)
    {
      uint64_t v21 = v14;
      uint64_t v22 = v6;
      id v6 = v12;
      uint64_t v14 = v5;
      goto LABEL_11;
    }
    id result = objc_msgSend(v15, sel__fontScaledByScaleFactor_, v19);
    if (result)
    {
      id v20 = result;

      uint64_t v21 = v6;
      uint64_t v22 = v12;
      id v6 = v14;
      uint64_t v14 = v15;
      id v15 = v20;
LABEL_11:

      return v15;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

double sub_1D8378514(char a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  if (a2)
  {
    sub_1D83777F4();
    CCUIEdgeInsetsFromDirectionalEdgeInsets();
    double v20 = v19;
    double v57 = v21;
    double v22 = a4;
    if ((objc_msgSend(v10, sel_isResizing) & 1) == 0)
    {
      v61.origin.CGFloat x = a7;
      v61.origin.CGFloat y = a8;
      v61.size.CGFloat width = a9;
      v61.size.double height = a10;
      double v22 = v20 + CGRectGetMaxY(v61);
    }
    v62.origin.CGFloat x = a3;
    v62.origin.CGFloat y = a4;
    v62.size.CGFloat width = a5;
    v62.size.double height = a6;
    double MaxY = CGRectGetMaxY(v62);
    v63.origin.CGFloat x = a3;
    v63.origin.CGFloat y = v22;
    v63.size.CGFloat width = a5;
    v63.size.double height = a6;
    CGFloat v24 = MaxY - CGRectGetMinY(v63);
    double v25 = UIEdgeInsetsInsetRect(a3, a4, a5, a6, v20, v57);
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    double v32 = a3;
    a4 = v22;
    double v33 = a5;
    a6 = v24;
  }
  else
  {
    sub_1D83776B8();
    CCUIEdgeInsetsFromDirectionalEdgeInsets();
    double v35 = v34;
    double v56 = v36;
    double v58 = v37;
    if (a1)
    {
      double v53 = v34;
      if (objc_msgSend(v10, sel_isResizing))
      {
        id v38 = objc_msgSend(v10, sel_contentMetrics);
        if (v38)
        {
          CGRect v39 = v38;
          objc_msgSend(v38, sel_metricsScaleFactor);
          id v40 = objc_msgSend(v10, sel_traitCollection);
          objc_msgSend(v40, sel_displayScale);

          UIRoundToScale();
          double v42 = v41;

          double v43 = v42 + v42;
        }
        else
        {
          double v43 = 28.0;
        }
        v67.origin.CGFloat x = a3;
        v67.origin.CGFloat y = a4;
        v67.size.CGFloat width = a5;
        v67.size.double height = a6;
        double MaxX = CGRectGetMaxX(v67) - a9 - v43 - v58;
        double v32 = a3;
        double v35 = v53;
      }
      else
      {
        v66.origin.CGFloat x = a7;
        v66.origin.CGFloat y = a8;
        v66.size.CGFloat width = a9;
        v66.size.double height = a10;
        double MaxX = CGRectGetMinX(v66) - v58;
        double v32 = a3;
        double v35 = v53;
      }
    }
    else
    {
      v64.origin.CGFloat x = a7;
      v64.origin.CGFloat y = a8;
      v64.size.CGFloat width = a9;
      v64.size.double height = a10;
      double v32 = v35 + CGRectGetMaxX(v64);
      v65.origin.CGFloat x = a3;
      v65.origin.CGFloat y = a4;
      v65.size.CGFloat width = a5;
      v65.size.double height = a6;
      double MaxX = CGRectGetMaxX(v65);
    }
    v68.origin.CGFloat x = v32;
    v68.origin.CGFloat y = a4;
    v68.size.CGFloat width = a5;
    v68.size.double height = a6;
    double v33 = MaxX - CGRectGetMinX(v68);
    double v25 = UIEdgeInsetsInsetRect(a3, a4, a5, a6, v56, v35);
    uint64_t v27 = v45;
    uint64_t v29 = v46;
    uint64_t v31 = v47;
  }
  double v48 = v32;
  CGFloat v49 = a4;
  double v50 = v33;
  CGFloat v51 = a6;
  *(void *)&double result = (unint64_t)CGRectIntersection(*(CGRect *)&v48, *(CGRect *)&v25);
  return result;
}

void sub_1D8378804(char a1, void *a2)
{
  if ((objc_msgSend(v2, sel_isResizing) & 1) != 0
    || (id v5 = sub_1D8376CB8(), v6 = (uint64_t)objc_msgSend(v5, sel_countForObject_, a2), v5, v6 >= 1))
  {
    sub_1D837A9D4(a2);
    if (a1) {
      goto LABEL_4;
    }
  }
  else
  {
    sub_1D837AC04(a2);
    if (a1)
    {
LABEL_4:
      id v7 = objc_msgSend(v2, sel_gridSizeClass);
      unsigned int v8 = CCUINumberOfRowsForGridSizeClass((uint64_t)v7);
      unsigned int v9 = CCUINumberOfColumnsForGridSizeClass((uint64_t)v7);
      unsigned int v10 = v9;
      if (v8 >= 2)
      {
        double v11 = 0.0;
        if ((objc_msgSend(v2, sel_supportsAccessibilityContentSizeCategories) & 1) == 0
          || (id v12 = objc_msgSend(v2, sel_traitCollection),
              id v13 = objc_msgSend(v12, sel_preferredContentSizeCategory),
              v12,
              LOBYTE(v12) = sub_1D8382178(),
              v13,
              (v12 & 1) == 0)
          || v10 < 2)
        {
LABEL_30:
          objc_msgSend(a2, sel_setAlpha_, v11);
          if (!objc_msgSend(v2, sel_isResizing)) {
            return;
          }
          goto LABEL_31;
        }
      }
      else if (v9 <= 1)
      {
        double v11 = 0.0;
        goto LABEL_30;
      }
      if (objc_msgSend(v2, sel_isExpanded))
      {
        double v11 = 0.0;
      }
      else if (objc_msgSend(v2, sel_isEnabled))
      {
        if (objc_msgSend(v2, sel_isRedacted)) {
          double v11 = 0.12;
        }
        else {
          double v11 = 1.0;
        }
      }
      else
      {
        objc_msgSend(v2, sel_disabledContentAlpha);
        double v11 = v18;
      }
      goto LABEL_30;
    }
  }
  if (objc_msgSend(v2, sel_supportsAccessibilityContentSizeCategories)
    && (id v14 = objc_msgSend(v2, sel_traitCollection),
        id v15 = objc_msgSend(v14, sel_preferredContentSizeCategory),
        v14,
        LOBYTE(v14) = sub_1D8382178(),
        v15,
        (v14 & 1) != 0)
    || CCUINumberOfRowsForGridSizeClass((uint64_t)objc_msgSend(v2, sel_gridSizeClass)) < 2
    || (objc_msgSend(v2, sel_isExpanded) & 1) != 0)
  {
    double v17 = 0.0;
  }
  else if (objc_msgSend(v2, sel_isEnabled))
  {
    unsigned int v16 = objc_msgSend(v2, sel_isRedacted);
    double v17 = 0.12;
    if (!v16) {
      double v17 = 1.0;
    }
  }
  else
  {
    objc_msgSend(v2, sel_disabledContentAlpha);
  }
  objc_msgSend(a2, sel_setAlpha_, v17);
  if (objc_msgSend(v2, sel_isResizing))
  {
LABEL_31:
    id v19 = objc_msgSend(a2, sel_layer);
    double v20 = (void *)sub_1D8382058();
    if (qword_1EA88BA68 != -1) {
      swift_once();
    }
    id v21 = (id)sub_1D83820E8();
    objc_msgSend(v19, sel_setValue_forKeyPath_, v20);
  }
}

id sub_1D8378C8C(void *a1, char a2)
{
  id v4 = objc_msgSend(a1, sel_traitCollection);
  id v5 = objc_msgSend(v4, sel_preferredContentSizeCategory);

  if (!objc_msgSend(a1, sel_supportsAccessibilityContentSizeCategories)
    || (id v6 = objc_msgSend(a1, sel_traitCollection),
        id v7 = objc_msgSend(v6, sel_preferredContentSizeCategory),
        v6,
        LOBYTE(v6) = sub_1D8382178(),
        v7,
        (v6 & 1) == 0))
  {
    unsigned int v8 = (id *)MEMORY[0x1E4FB27B8];
    if ((a2 & 1) == 0) {
      unsigned int v8 = (id *)MEMORY[0x1E4FB27B0];
    }
    id v9 = *v8;
    char v10 = sub_1D8382188();
    if (v10) {
      double v11 = v5;
    }
    else {
      double v11 = v9;
    }
    if (v10) {
      id v5 = v9;
    }
  }
  return v5;
}

id sub_1D8378D8C(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView] = a1;
  id v4 = a1;
  objc_msgSend(v4, sel_bounds);
  v13.receiver = v1;
  v13.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v13, sel_initWithFrame_);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B378);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1D8386920;
  *(void *)(v6 + 56) = sub_1D837C460(0, &qword_1EA88B350);
  *(void *)(v6 + 32) = v4;
  id v7 = v5;
  id v8 = v4;
  id v9 = v7;
  char v10 = (void *)sub_1D8382138();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setAutomationElements_, v10);

  id v11 = v9;
  objc_msgSend(v11, sel_addSubview_, v8);

  return v11;
}

id sub_1D8379004()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D8379148()
{
  uint64_t result = sub_1D83820F8();
  qword_1EA88B2D8 = result;
  unk_1EA88B2E0 = v1;
  return result;
}

uint64_t sub_1D8379178()
{
  if (qword_1EA88B2F0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1D8382108();
  swift_bridgeObjectRelease();
  sub_1D8382108();
  sub_1D83820F8();
  sub_1D8382108();
  uint64_t result = swift_bridgeObjectRelease();
  qword_1EA88BA70 = 0x2E737265746C6966;
  unk_1EA88BA78 = 0xE800000000000000;
  return result;
}

id sub_1D8379280(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1D83820E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t sub_1D83792F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_1D83820F8();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  id v8 = (uint64_t *)(a1 + *a4);
  *id v8 = v6;
  v8[1] = v7;
  return swift_bridgeObjectRelease();
}

id sub_1D8379434()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s14ViewPropertiesCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D83794C0()
{
  return sub_1D8382328();
}

uint64_t sub_1D8379508()
{
  return sub_1D8382318();
}

uint64_t sub_1D8379534()
{
  return sub_1D8382328();
}

void *sub_1D8379578@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1D8379588(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_1D837959C(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_1D83795A8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_1D837C460(0, &qword_1EA88BCF0);
  uint64_t v2 = sub_1D8382148();
  swift_retain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_1D8379638(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B378);
      char v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      objc_super v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (void *)MEMORY[0x1E4FBC860];
      objc_super v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1D837A8DC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1D8379748(uint64_t a1)
{
  sub_1D8382308();
  sub_1D8382318();
  uint64_t v2 = sub_1D8382328();
  return sub_1D83797F8(a1, v2);
}

unint64_t sub_1D83797B4(uint64_t a1)
{
  uint64_t v2 = sub_1D8382208();
  return sub_1D8379894(a1, v2);
}

unint64_t sub_1D83797F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1D8379894(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1D837BB74(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1D9485550](v9, a1);
      sub_1D837BBD0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1D837995C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D837997C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1D837997C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B378);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    char v10 = (char *)MEMORY[0x1E4FBC860];
  }
  objc_super v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1D83822C8();
  __break(1u);
  return result;
}

uint64_t sub_1D8379AEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88B360);
  uint64_t result = sub_1D83822A8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    double v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *double v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void **)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        id v30 = v29;
      }
      sub_1D8382308();
      sub_1D8382318();
      uint64_t result = sub_1D8382328();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1D8379DC0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1D83821F8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1D8382308();
        sub_1D8382318();
        uint64_t result = sub_1D8382328();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          unint64_t v11 = (void *)(v10 + 8 * v3);
          uint64_t v12 = (void *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *unint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          unint64_t v14 = (void *)(v13 + 8 * v3);
          unint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *unint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1D8379F7C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1D8379748(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1D837A0B8();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v20 = 8 * v10;
    *(void *)(v16[6] + v20) = a2;
    *(void *)(v16[7] + v20) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return;
    }
    goto LABEL_14;
  }
  sub_1D8379AEC(v13, a3 & 1);
  unint64_t v18 = sub_1D8379748(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for MTVisualStyleCategory(0);
  sub_1D83822F8();
  __break(1u);
}

id sub_1D837A0B8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88B360);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D8382298();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D837A25C(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v5 = *(void **)v3;
  int64_t v6 = *(void *)(*(void *)v3 + 16);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > v5[3] >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    uint64_t v5 = sub_1D8379638(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *(void *)uint64_t v3 = v5;
  }
  uint64_t v14 = (uint64_t)&v5[4 * a1 + 4];
  swift_arrayDestroy();
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v15 = v5[2];
  BOOL v16 = __OFSUB__(v15, a2);
  uint64_t v17 = v15 - a2;
  if (v16) {
    goto LABEL_26;
  }
  if ((v17 & 0x8000000000000000) == 0)
  {
    int64_t v18 = (char *)(v14 + 32);
    unint64_t v19 = (char *)&v5[4 * a2 + 4];
    if ((char *)(v14 + 32) != v19 || v18 >= &v19[32 * v17]) {
      memmove(v18, v19, 32 * v17);
    }
    uint64_t v20 = v5[2];
    BOOL v16 = __OFADD__(v20, v9);
    uint64_t v21 = v20 + v9;
    if (!v16)
    {
      v5[2] = v21;
LABEL_20:
      sub_1D837C3B0(a3, (uint64_t)&v5[4 * a1 + 4]);
      return sub_1D837C354(a3, (uint64_t *)&unk_1EA88BCE0);
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_1D83822C8();
  __break(1u);
  return result;
}

void _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView_backgroundView] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView_customGlyphView] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance] = 0;
  uint64_t v1 = &v0[OBJC_IVAR___CCUIControlTemplateView_title];
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = &v0[OBJC_IVAR___CCUIControlTemplateView_subtitle];
  *uint64_t v2 = 0;
  v2[1] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView__isRedacted] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView__isResizing] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView__isExpanded] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView____lazy_storage___animatingLabels] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction] = 0;
  *(_OWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels] = xmmword_1D8386910;
  *(_OWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels] = xmmword_1D8386910;
  v0[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] = 0;

  sub_1D8382288();
  __break(1u);
}

id sub_1D837A574(id result, void *a2)
{
  if (result != (id)1)
  {
    id v4 = result;
    id v3 = a2;
    return v4;
  }
  return result;
}

void sub_1D837A5B8()
{
  uint64_t v1 = swift_unknownObjectWeakAssign();
  uint64_t v2 = MEMORY[0x1D9486180](v1);
  swift_unknownObjectRelease();
  uint64_t v3 = OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction;
  uint64_t v4 = *(void *)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction];
  if (v2)
  {
    if (!v4)
    {
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1680]), sel_initWithDelegate_, v0);
      int64_t v6 = *(void **)&v0[v3];
      *(void *)&v0[v3] = v5;
      id v7 = v5;

      objc_msgSend(v0, sel_addInteraction_, v7);
    }
  }
  else if (v4)
  {
    objc_msgSend(v0, sel_removeInteraction_);
  }
}

void sub_1D837A6B8(void *a1, uint64_t a2, uint64_t a3, char a4, void *a5, void *a6)
{
  if (a1)
  {
    if (a6)
    {
      objc_msgSend(a6, sel_stopAutomaticallyUpdatingView_, a1);
      if (a5) {
        goto LABEL_4;
      }
    }
    else
    {
      id v12 = a1;
      if (a5)
      {
LABEL_4:
        if (a4)
        {
          id v13 = a1;
          id v14 = a5;
          uint64_t v15 = (void *)sub_1D83820E8();
          BOOL v22 = sub_1D837606C;
          uint64_t v23 = 0;
          uint64_t aBlock = MEMORY[0x1E4F143A8];
          uint64_t v19 = 1107296256;
          uint64_t v20 = sub_1D83761E8;
          uint64_t v21 = &block_descriptor;
          BOOL v16 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v14, sel__automaticallyUpdateView_withStyleNamed_andObserverBlock_, v13, v15, v16);

          _Block_release(v16);
        }
        else
        {
          BOOL v22 = sub_1D837606C;
          uint64_t v23 = 0;
          uint64_t aBlock = MEMORY[0x1E4F143A8];
          uint64_t v19 = 1107296256;
          uint64_t v20 = sub_1D83761E8;
          uint64_t v21 = &block_descriptor_31;
          uint64_t v9 = _Block_copy(&aBlock);
          id v10 = a1;
          id v11 = a5;
          swift_release();
          objc_msgSend(v11, sel_automaticallyUpdateView_withStyle_andObserverBlock_, v10, a2, v9);

          _Block_release(v9);
        }
        return;
      }
    }
  }
}

uint64_t sub_1D837A8DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1D83822C8();
  __break(1u);
  return result;
}

void sub_1D837A9D4(void *a1)
{
  if ((sub_1D8376D2C() & 1) == 0)
  {
    sub_1D83820F8();
    id v2 = objc_allocWithZone(MEMORY[0x1E4F39BC0]);
    uint64_t v3 = (void *)sub_1D83820E8();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v2, sel_initWithType_, v3);

    if (qword_1EA88B2F0 != -1) {
      swift_once();
    }
    unint64_t v5 = (void *)sub_1D83820E8();
    objc_msgSend(v4, sel_setName_, v5);

    unint64_t v6 = (void *)sub_1D8382058();
    objc_msgSend(v4, sel_setValue_forKey_, v6, *MEMORY[0x1E4F3A1D8]);

    id v7 = objc_msgSend(a1, sel_layer);
    id v8 = objc_msgSend(v7, sel_filters);

    if (v8)
    {
      uint64_t v9 = sub_1D8382148();
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4FBC860];
    }
    uint64_t v16 = v9;
    uint64_t v15 = sub_1D837C460(0, (unint64_t *)&unk_1EA88B2B8);
    *(void *)&long long v14 = v4;
    sub_1D837BEB8(&v14, v13);
    id v10 = v4;
    sub_1D837A25C(0, 0, (uint64_t)v13);
    id v11 = objc_msgSend(a1, sel_layer);
    id v12 = (void *)sub_1D8382138();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setFilters_, v12);
  }
}

void sub_1D837AC04(void *a1)
{
  uint64_t v1 = a1;
  id v2 = objc_msgSend(a1, sel_layer);
  id v3 = objc_msgSend(v2, sel_filters);

  if (v3)
  {
    uint64_t v4 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v5 = sub_1D8382148();

    id v3 = (id)MEMORY[0x1E4FBC860];
    id v30 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v6 = *(void *)(v5 + 16);
    if (v6)
    {
      BOOL v25 = v1;
      uint64_t v26 = *(void *)(v5 + 16);
      unint64_t v7 = 0;
      uint64_t v8 = v5 + 32;
      uint64_t v9 = (unint64_t *)&unk_1EA88B2B8;
      unint64_t v10 = 0x1E4F39BC0uLL;
      while (1)
      {
        if (v7 >= *(void *)(v5 + 16))
        {
          __break(1u);
          return;
        }
        sub_1D837C3B0(v8, (uint64_t)v29);
        sub_1D837C3B0((uint64_t)v29, (uint64_t)v28);
        sub_1D837C460(0, v9);
        if (!swift_dynamicCast()) {
          goto LABEL_20;
        }
        uint64_t v11 = v4;
        unint64_t v12 = v10;
        id v13 = v9;
        id v14 = objc_msgSend(v27, sel_name);
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = sub_1D83820F8();
          uint64_t v18 = v17;
        }
        else
        {
          uint64_t v16 = 0;
          uint64_t v18 = 0;
        }
        if (qword_1EA88B2F0 == -1)
        {
          if (!v18) {
            goto LABEL_19;
          }
        }
        else
        {
          swift_once();
          if (!v18)
          {
LABEL_19:

            uint64_t v9 = v13;
            unint64_t v10 = v12;
            uint64_t v4 = v11;
            uint64_t v6 = v26;
LABEL_20:
            sub_1D837BEB8(v29, v28);
            uint64_t v20 = v30;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_1D837995C(0, v20[2] + 1, 1);
              uint64_t v20 = v30;
            }
            unint64_t v22 = v20[2];
            unint64_t v21 = v20[3];
            if (v22 >= v21 >> 1)
            {
              sub_1D837995C(v21 > 1, v22 + 1, 1);
              uint64_t v20 = v30;
            }
            v20[2] = v22 + 1;
            sub_1D837BEB8(v28, &v20[4 * v22 + 4]);
            goto LABEL_6;
          }
        }
        if (v16 == qword_1EA88B2D8 && v18 == unk_1EA88B2E0)
        {
          swift_bridgeObjectRelease();

          uint64_t v9 = v13;
          unint64_t v10 = v12;
          uint64_t v4 = v11;
          uint64_t v6 = v26;
        }
        else
        {
          char v19 = sub_1D83822D8();
          swift_bridgeObjectRelease();

          uint64_t v9 = v13;
          unint64_t v10 = v12;
          uint64_t v4 = v11;
          uint64_t v6 = v26;
          if ((v19 & 1) == 0) {
            goto LABEL_20;
          }
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
LABEL_6:
        ++v7;
        v8 += 32;
        if (v6 == v7)
        {
          id v3 = v30;
          uint64_t v1 = v25;
          break;
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  id v23 = objc_msgSend(v1, sel_layer, v25);
  if (v3)
  {
    unint64_t v24 = (void *)sub_1D8382138();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v24 = 0;
  }
  objc_msgSend(v23, sel_setFilters_, v24);
}

void sub_1D837AF3C(char a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (char *)objc_allocWithZone((Class)_s14ViewPropertiesCMa());
  id v7 = a2;
  id v8 = sub_1D837BC24(v7, v6);

  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v8);
  objc_msgSend(v8, sel_copy);
  sub_1D83821E8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88BCD0);
  swift_dynamicCast();
  uint64_t v9 = aBlock[6];
  unint64_t v10 = self;
  id v11 = objc_msgSend(v7, sel_window);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v7;
  *(void *)(v12 + 24) = v9;
  *(unsigned char *)(v12 + 32) = a1;
  aBlock[4] = sub_1D837BF74;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D8373F94;
  aBlock[3] = &block_descriptor_49;
  id v13 = _Block_copy(aBlock);
  id v14 = v7;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v10, sel_performWithoutAnimationWhileHiddenInWindow_actions_, v11, v13);
  _Block_release(v13);

  swift_unknownObjectRelease();
}

void sub_1D837B108(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5, char a6, void *a7, void *a8, double a9)
{
  if (a2)
  {
    uint64_t v17 = self;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a1;
    *(void *)(v18 + 32) = a4;
    *(void *)(v18 + 40) = a5;
    char v19 = a6 & 1;
    *(unsigned char *)(v18 + 48) = v19;
    *(void *)(v18 + 56) = a7;
    *(void *)(v18 + 64) = a8;
    double v37 = sub_1D837C54C;
    uint64_t v38 = v18;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 1107296256;
    double v35 = sub_1D8373F94;
    double v36 = &block_descriptor_107;
    uint64_t v20 = _Block_copy(&v33);
    id v21 = a3;
    id v22 = a1;
    sub_1D837C560(a4, a5, v19);
    id v23 = a8;
    id v24 = a7;
    swift_release();
    objc_msgSend(v17, sel_transitionWithView_duration_options_animations_completion_, v22, 5242880, v20, 0, a9);
    _Block_release(v20);
    return;
  }
  if (a8)
  {
    objc_msgSend(a8, sel_stopAutomaticallyUpdatingView_, a1);
    if (a6)
    {
LABEL_5:
      id v25 = a1;
      id v26 = a7;
      id v27 = (void *)sub_1D83820E8();
      double v37 = sub_1D837606C;
      uint64_t v38 = 0;
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 1107296256;
      double v35 = sub_1D83761E8;
      double v36 = &block_descriptor_98;
      uint64_t v28 = _Block_copy(&v33);
      swift_release();
      objc_msgSend(v26, sel__automaticallyUpdateView_withStyleNamed_andObserverBlock_, v25, v27, v28);

      _Block_release(v28);
      return;
    }
  }
  else
  {
    id v29 = a1;
    if (a6) {
      goto LABEL_5;
    }
  }
  double v37 = sub_1D837606C;
  uint64_t v38 = 0;
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 1107296256;
  double v35 = sub_1D83761E8;
  double v36 = &block_descriptor_101;
  id v30 = _Block_copy(&v33);
  id v31 = a1;
  id v32 = a7;
  swift_release();
  objc_msgSend(v32, sel_automaticallyUpdateView_withStyle_andObserverBlock_, v31, a4, v30);

  _Block_release(v30);
}

void sub_1D837B410(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  if (a1)
  {
    id v21 = a1;
    id v22 = objc_msgSend(v21, sel_font);
    if (v22)
    {
      id v45 = v22;
      double v23 = sub_1D8378514((char)objc_msgSend(v10, sel__shouldReverseLayoutDirection), 0, a3, a4, a5, a6, a7, a8, a9, a10);
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      objc_msgSend(v45, sel_lineHeight);
      double v31 = v30 + v30;
      objc_msgSend(v45, sel_leading);
      double v33 = v31 + v32;
      if (a2)
      {
        id v34 = a2;
        id v35 = objc_msgSend(v34, sel_font);
        if (v35)
        {
          double v36 = v35;
          objc_msgSend(v35, sel_lineHeight);
          double v38 = v37;

          double v33 = v33 + v38;
        }
        else
        {
        }
      }
      v47.origin.CGFloat x = v23;
      v47.origin.CGFloat y = v25;
      v47.size.CGFloat width = v27;
      v47.size.double height = v29;
      if (CGRectGetHeight(v47) < v33) {
        sub_1D8371BC0((id)1);
      }
    }
    else
    {
      if (qword_1EA88BA88 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_1D83820A8();
      __swift_project_value_buffer(v39, (uint64_t)qword_1EA88C478);
      id v45 = v21;
      id v40 = sub_1D8382088();
      os_log_type_t v41 = sub_1D8382168();
      if (os_log_type_enabled(v40, v41))
      {
        double v42 = (uint8_t *)swift_slowAlloc();
        double v43 = (void *)swift_slowAlloc();
        *(_DWORD *)double v42 = 138412290;
        id v44 = v45;
        sub_1D83821C8();
        *double v43 = a1;

        _os_log_impl(&dword_1D834A000, v40, v41, "Unexpectedly missing font on title label: %@", v42, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88BCF8);
        swift_arrayDestroy();
        MEMORY[0x1D9486110](v43, -1, -1);
        MEMORY[0x1D9486110](v42, -1, -1);

        return;
      }
    }
  }
}

id _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0()
{
  id v1 = objc_msgSend(v0, sel_contextMenuDelegate);
  if (!v1) {
    return 0;
  }
  id v2 = objc_msgSend(v1, sel_contextMenu);
  if (v2)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = self;
    v8[4] = sub_1D837C438;
    v8[5] = v3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 1107296256;
    v8[2] = sub_1D83795A8;
    v8[3] = &block_descriptor_95;
    uint64_t v5 = _Block_copy(v8);
    id v6 = v2;
    swift_retain();
    swift_release();
    id v2 = objc_msgSend(v4, sel_configurationWithIdentifier_previewProvider_actionProvider_, 0, 0, v5);
    swift_release();
    _Block_release(v5);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
  return v2;
}

id _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedL0CSgSo09UIContexthI0C_So0rH13ConfigurationCSo9NSCopying_ptF_0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1B28]), sel_init);
  id v2 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v2);

  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_continuousCornerRadius);
  objc_msgSend(v0, sel_continuousCornerRadius);
  uint64_t v3 = (void *)CGPathCreateWithContinuousRoundedRect();
  if (!v3)
  {
    objc_msgSend(v0, sel_bounds);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    objc_msgSend(v0, sel_continuousCornerRadius);
    CGFloat v13 = v12;
    objc_msgSend(v0, sel_continuousCornerRadius);
    CGFloat v15 = v14;
    v21.origin.CGFloat x = v5;
    v21.origin.CGFloat y = v7;
    v21.size.CGFloat width = v9;
    v21.size.double height = v11;
    uint64_t v3 = CGPathCreateWithRoundedRect(v21, v13, v15, 0);
  }
  id v16 = objc_msgSend(self, sel_bezierPathWithCGPath_, v3);
  objc_msgSend(v1, sel_setVisiblePath_, v16);
  id v17 = objc_allocWithZone(MEMORY[0x1E4FB1D48]);
  id v18 = v0;
  id v19 = objc_msgSend(v17, sel_initWithView_parameters_, v18, v1);

  return v19;
}

uint64_t _s22ButtonGlyphWrapperViewCMa()
{
  return self;
}

uint64_t type metadata accessor for CCUIControlTemplateView(uint64_t a1)
{
  return sub_1D837C460(a1, &qword_1EA88BC18);
}

uint64_t _s14ViewPropertiesCMa()
{
  return self;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1D837BB18(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D837BB38(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CCUIGridGeometryInfo(uint64_t a1)
{
}

uint64_t sub_1D837BB74(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1D837BBD0(uint64_t a1)
{
  return a1;
}

id sub_1D837BC24(void *a1, char *a2)
{
  char v3 = (uint64_t *)&a2[OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_title];
  *char v3 = 0;
  v3[1] = 0;
  double v4 = (uint64_t *)&a2[OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_subtitle];
  *double v4 = 0;
  v4[1] = 0;
  CGFloat v5 = a2;
  id v6 = objc_msgSend(a1, sel_title);
  if (v6)
  {
    CGFloat v7 = v6;
    uint64_t v8 = sub_1D83820F8();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  *char v3 = v8;
  v3[1] = v10;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(a1, sel_subtitle);
  if (v11)
  {
    double v12 = v11;
    uint64_t v13 = sub_1D83820F8();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  *double v4 = v13;
  v4[1] = v15;
  swift_bridgeObjectRelease();
  unsigned __int8 v16 = objc_msgSend(a1, sel_isEnabled);
  v5[OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isEnabled] = v16;
  unsigned __int8 v17 = objc_msgSend(a1, sel_isRedacted);
  v5[OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isRedacted] = v17;
  unsigned __int8 v18 = objc_msgSend(a1, sel_isSelected);
  v5[OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isSelected] = v18;

  v20.receiver = v5;
  v20.super_class = (Class)_s14ViewPropertiesCMa();
  return objc_msgSendSuper2(&v20, sel_init);
}

unint64_t sub_1D837BD90()
{
  unint64_t result = qword_1EA88B320;
  if (!qword_1EA88B320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA88B320);
  }
  return result;
}

void sub_1D837BDE4(void *a1, void *a2)
{
  if (a1 != (void *)1)
  {
  }
}

uint64_t sub_1D837BE28(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1D837BE50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88B388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1D837BEB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1D837BEC8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1D837BED8(uint64_t a1, uint64_t a2)
{
  sub_1D8376140(*(double *)(v2 + 16), a1, a2);
}

void type metadata accessor for MTVisualStyleCategory(uint64_t a1)
{
}

uint64_t sub_1D837BEF4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1D837BF2C()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_1D837BF34()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D837BF44()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D837BF6C()
{
  return objectdestroy_45Tm(33);
}

void sub_1D837BF74()
{
  sub_1D83730BC(*(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_1D837BFA0()
{
  return objectdestroy_45Tm(32);
}

uint64_t objectdestroy_45Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v1, a1, 7);
}

id sub_1D837BFF4()
{
  return sub_1D8376590(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_1D837BFFC()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D837C044()
{
  return sub_1D837662C(*(void **)(v0 + 16), *(id *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_1D837C050()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D837C060()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D837C088()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1D837C0C8(void (*a1)(void), uint64_t a2)
{
  sub_1D83767C8(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1D837C0E4()
{
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1 != (void *)1)
  {
  }
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 160, 7);
}

uint64_t sub_1D837C144()
{
  long long v1 = *(_OWORD *)(v0 + 40);
  v6[0] = *(_OWORD *)(v0 + 24);
  v6[1] = v1;
  long long v2 = *(_OWORD *)(v0 + 80);
  long long v8 = *(_OWORD *)(v0 + 64);
  char v3 = *(void **)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 96);
  char v7 = *(unsigned char *)(v0 + 56);
  long long v9 = v2;
  char v10 = v4;
  return sub_1D8376854(v3, (uint64_t)v6, *(void **)(v0 + 104), *(void **)(v0 + 112), *(uint64_t (**)(void))(v0 + 128), *(void *)(v0 + 136), *(uint64_t (**)(void))(v0 + 144));
}

uint64_t sub_1D837C1A4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D837C1B4()
{
  swift_release();
  swift_release();

  long long v1 = *(void **)(v0 + 160);
  if (v1 != (void *)1)
  {
  }
  return MEMORY[0x1F4186498](v0, 176, 7);
}

void sub_1D837C224()
{
  long long v1 = *(_OWORD *)(v0 + 72);
  v9[0] = *(_OWORD *)(v0 + 56);
  v9[1] = v1;
  long long v2 = *(_OWORD *)(v0 + 112);
  long long v11 = *(_OWORD *)(v0 + 96);
  char v3 = *(void **)(v0 + 16);
  char v4 = *(void (**)(void (*)(void *), void))(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  id v6 = *(void (**)(void (*)(void *), void))(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 48);
  char v8 = *(unsigned char *)(v0 + 128);
  char v10 = *(unsigned char *)(v0 + 88);
  long long v12 = v2;
  char v13 = v8;
  sub_1D8377064(v3, v4, v5, v6, v7, (uint64_t)v9, *(void **)(v0 + 144), *(void **)(v0 + 152), *(void **)(v0 + 160), *(void **)(v0 + 168));
}

uint64_t sub_1D837C28C()
{
  swift_release();

  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1D837C2D4(uint64_t a1, uint64_t a2)
{
  sub_1D8377504(a1, a2, *(void (**)(id (*)(void *), unsigned char *))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(void (**)(void (*)(uint64_t), void *))(v2 + 40));
}

id sub_1D837C2E4(void *a1)
{
  return sub_1D83775F8(a1);
}

void sub_1D837C2EC(uint64_t a1)
{
  id v2 = sub_1D8376CB8();
  objc_msgSend(v2, sel_removeObject_, a1);
}

void sub_1D837C344(void *a1)
{
}

void sub_1D837C34C(void *a1)
{
}

uint64_t sub_1D837C354(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D837C3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D837C410(uint64_t a1)
{
  return a1;
}

void *sub_1D837C438()
{
  long long v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t sub_1D837C460(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1D837C4F0()
{
  sub_1D837BE28(*(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 72, 7);
}

void sub_1D837C54C()
{
  sub_1D83763AC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64));
}

uint64_t sub_1D837C560(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1D837C570(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D837C5B0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D837C5D0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

unint64_t sub_1D837C614()
{
  unint64_t result = qword_1EA88B330;
  if (!qword_1EA88B330)
  {
    type metadata accessor for MTVisualStyleCategory(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA88B330);
  }
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for MTVisualStyle(uint64_t a1)
{
}

uint64_t sub_1D837C738()
{
  uint64_t v0 = sub_1D83820A8();
  __swift_allocate_value_buffer(v0, qword_1EA88B2F8);
  uint64_t result = __swift_project_value_buffer(v0, (uint64_t)qword_1EA88B2F8);
  if (CCUILogUserInterface)
  {
    id v2 = (id)CCUILogUserInterface;
    return sub_1D83820B8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.userInterface.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EA88B310 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1D83820A8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EA88B2F8);
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

const char *sub_1D837C848()
{
  uint64_t v0 = sub_1D83820A8();
  __swift_allocate_value_buffer(v0, qword_1EA88C478);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA88C478);
  uint64_t result = "com.apple.ControlCenter";
  if ("com.apple.ControlCenter")
  {
    sub_1D8382118();
    return (const char *)sub_1D8382098();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t CCUIGridGeometryInfo.description.getter(double a1, double a2)
{
  id v2 = (id)NSStringFromCCUIGridGeometryInfo(a1, a2);
  uint64_t v3 = sub_1D83820F8();

  return v3;
}

uint64_t sub_1D837C980()
{
  id v1 = (id)NSStringFromCCUIGridGeometryInfo(*v0, v0[1]);
  uint64_t v2 = sub_1D83820F8();

  return v2;
}

BOOL static CCUIGridGeometryInfo.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return CCUIGridGeometryInfoEqualToInfo(a1, a2, a3, a4);
}

BOOL sub_1D837C9E8(double *a1, double *a2)
{
  return CCUIGridGeometryInfoEqualToInfo(*a1, a1[1], *a2, a2[1]);
}

id sub_1D837CAEC(double a1, double a2)
{
  BSFloatRoundForScale();
  double v5 = v4;
  id v6 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 6, 2, v4);
  id v7 = objc_msgSend(self, sel_systemFontOfSize_weight_, v5, *MEMORY[0x1E4FB09E0]);
  id v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSymbolConfiguration_symbolFont_symbolScaleFactor_metricsScaleFactor_gridGeometryInfo_, v6, v7, v5 / 25.0, a1 / 68.0, a1, a2);

  return v8;
}

id CCUIModuleContentMetrics.description.getter()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4F718]), sel_initWithObject_, v0);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(v0, sel_symbolConfiguration);
    double v4 = (void *)sub_1D83820E8();

    id v5 = objc_msgSend(v0, sel_symbolFont);
    id v6 = (void *)sub_1D83820E8();

    objc_msgSend(v0, sel_symbolScaleFactor);
    double v8 = v7;
    long long v9 = (void *)sub_1D83820E8();

    objc_msgSend(v0, sel_metricsScaleFactor);
    double v11 = v10;
    long long v12 = (void *)sub_1D83820E8();

    objc_msgSend(v0, sel_gridGeometryInfo);
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    type metadata accessor for CCUIGridGeometryInfo(0);
    uint64_t v15 = sub_1D83822E8();
    unsigned __int8 v16 = (void *)sub_1D83820E8();

    swift_unknownObjectRelease();
    id result = objc_msgSend(v2, sel_build);
    if (result)
    {
      unsigned __int8 v17 = result;
      uint64_t v18 = sub_1D83820F8();

      return (id)v18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void __swiftcall CCUIModuleContentMetrics.init()(CCUIModuleContentMetrics *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CCUIModuleContentMetrics.init()()
{
}

unint64_t type metadata accessor for CCUIModuleContentMetrics()
{
  unint64_t result = qword_1EA88BDA8;
  if (!qword_1EA88BDA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA88BDA8);
  }
  return result;
}

void __swiftcall CCUITouchPassThroughView.hitTest(_:with:)(UIView_optional *__return_ptr retstr, CGPoint _, UIEvent_optional with)
{
  Class isa = with.value.super.isa;
  double y = _.y;
  double x = _.x;
  if (objc_msgSend(v3, sel_isTouchPassThroughDisabled))
  {
    v9.receiver = v3;
    v9.super_class = (Class)CCUITouchPassThroughView;
    id v7 = -[UIView_optional hitTest:withEvent:](&v9, sel_hitTest_withEvent_, isa, x, y);
  }
  else
  {
    v10.receiver = v3;
    v10.super_class = (Class)CCUITouchPassThroughView;
    id v8 = -[UIView_optional hitTest:withEvent:](&v10, sel_hitTest_withEvent_, isa, x, y);
    if (v8)
    {
      if (v8 == v3) {
    }
      }
  }
}

void __swiftcall CCUITouchPassThroughView.init(frame:)(CCUITouchPassThroughView *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

id CCUITouchPassThroughView.init(frame:)()
{
  *(unsigned char *)(v0 + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v2.super_class = (Class)CCUITouchPassThroughView;
  return objc_msgSendSuper2(&v2, sel_initWithFrame_);
}

void __swiftcall CCUITouchPassThroughView.init(coder:)(CCUITouchPassThroughView_optional *__return_ptr retstr, NSCoder coder)
{
}

id CCUITouchPassThroughView.init(coder:)(void *a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v5.super_class = (Class)CCUITouchPassThroughView;
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

unint64_t type metadata accessor for CCUITouchPassThroughView()
{
  unint64_t result = qword_1EA88BDB8;
  if (!qword_1EA88BDB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA88BDB8);
  }
  return result;
}

uint64_t sub_1D837D4A8(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_contentModuleContext] = 0;
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_gridSizeClass] = 0;
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus] = 0;
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius] = 0;
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_contentMetrics] = 0;
  v3[OBJC_IVAR___CCUIControlHostViewController__isResizing] = 0;
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_identity] = a1;
  *(void *)&v3[OBJC_IVAR___CCUIControlHostViewController_type] = a2;
  id v7 = objc_allocWithZone(MEMORY[0x1E4F58C90]);
  id v8 = a1;
  objc_super v9 = v3;
  objc_super v10 = (void *)sub_1D83820E8();
  double v11 = (void *)sub_1D83820E8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a3, v10, v11);

  id v13 = objc_msgSend(self, sel_instanceOfType_instanceIdentity_, a2, v12);
  uint64_t v14 = OBJC_IVAR___CCUIControlHostViewController_controlInstance;
  *(void *)&v9[OBJC_IVAR___CCUIControlHostViewController_controlInstance] = v13;
  aBlock[4] = sub_1D837D734;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D837D78C;
  aBlock[3] = &block_descriptor_0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v13, sel_modifyConfiguration_, v15);
  _Block_release(v15);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    id v17 = *(id *)&v9[v14];
    objc_msgSend(v17, sel_activate);

    v19.receiver = v9;
    v19.super_class = (Class)CCUIControlHostViewController;
    id v18 = objc_msgSendSuper2(&v19, sel_initWithNibName_bundle_, 0, 0);

    return (uint64_t)v18;
  }
  return result;
}

id sub_1D837D734(void *a1)
{
  objc_msgSend(a1, sel_setCanAppearInSecureEnvironment_, 1);
  return objc_msgSend(a1, sel_setLaunchOrigin_, @"CCUIAppLaunchOriginControlCenter");
}

void sub_1D837D78C(uint64_t a1, void *a2)
{
  objc_super v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void __swiftcall CCUIControlHostViewController.init(coder:)(CCUIControlHostViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

Swift::Void __swiftcall CCUIControlHostViewController.loadView()()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)CCUIControlHostView), sel_initWithFrame_instance_, *(void *)&v0[OBJC_IVAR___CCUIControlHostViewController_controlInstance], 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setDelegate_, v0);
  objc_msgSend(v1, sel_setGridSizeClass_, objc_msgSend(v0, sel_gridSizeClass));
  id v2 = objc_msgSend(v0, sel_contentMetrics);
  objc_msgSend(v1, sel_setContentMetrics_, v2);

  objc_msgSend(v1, sel_setResizing_, objc_msgSend(v0, sel_isResizing));
  objc_msgSend(v0, sel_setView_, v1);
  if (!objc_msgSend(v0, sel_isViewLoaded))
  {
    objc_super v5 = v1;
    goto LABEL_6;
  }
  id v6 = objc_msgSend(v0, sel_viewIfLoaded);
  if (!v6)
  {
LABEL_10:
    __break(1u);
    return;
  }
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (!v3)
  {

    goto LABEL_10;
  }
  double v4 = (void *)v3;
  objc_msgSend(v0, sel_compactContinuousCornerRadius);
  objc_msgSend(v4, sel_setContinuousCornerRadius_);

  objc_super v5 = v6;
LABEL_6:
}

Swift::Bool __swiftcall CCUIControlHostViewController._canShowWhileLocked()()
{
  return 1;
}

double CCUIControlHostViewController.preferredExpandedContentHeight.getter()
{
  return 0.0;
}

uint64_t CCUIControlHostViewController.gridSizeClass.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CCUIControlHostViewController_gridSizeClass;
  swift_beginAccess();
  return *(void *)v1;
}

void CCUIControlHostViewController.gridSizeClass.setter(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___CCUIControlHostViewController_gridSizeClass];
  swift_beginAccess();
  *(void *)uint64_t v3 = a1;
  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    id v4 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v4)
    {
      objc_super v5 = v4;
      self;
      id v6 = (void *)swift_dynamicCastObjCClass();
      if (v6)
      {
        objc_msgSend(v6, sel_setGridSizeClass_, *(void *)v3);

        return;
      }
    }
    __break(1u);
  }
}

uint64_t CCUIControlHostViewController.userVisibilityStatus.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus;
  swift_beginAccess();
  return *(void *)v1;
}

id CCUIControlHostViewController.userVisibilityStatus.setter(uint64_t a1)
{
  BOOL v3 = a1 == 2;
  id v4 = (void *)(v1 + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus);
  swift_beginAccess();
  *id v4 = a1;
  if (a1 == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * v3;
  }
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___CCUIControlHostViewController_controlInstance), sel_setVisibility_, v5);
}

double CCUIControlHostViewController.compactContinuousCornerRadius.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

void CCUIControlHostViewController.compactContinuousCornerRadius.setter(double a1)
{
  BOOL v3 = (double *)&v1[OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius];
  swift_beginAccess();
  double v4 = *v3;
  *BOOL v3 = a1;
  if (v4 != a1 && (objc_msgSend(v1, sel_isViewLoaded) & 1) != 0)
  {
    id v5 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v5)
    {
      id v6 = v5;
      self;
      uint64_t v7 = swift_dynamicCastObjCClass();
      if (v7)
      {
        id v8 = (void *)v7;
        objc_msgSend(v1, sel_compactContinuousCornerRadius);
        objc_msgSend(v8, sel_setContinuousCornerRadius_);

        return;
      }
    }
    __break(1u);
  }
}

void *CCUIControlHostViewController.contentMetrics.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___CCUIControlHostViewController_contentMetrics);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void CCUIControlHostViewController.contentMetrics.setter(void *a1)
{
  sub_1D837E8EC(a1);
}

uint64_t CCUIControlHostViewController.isResizing.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CCUIControlHostViewController__isResizing);
}

void CCUIControlHostViewController.isResizing.setter(char a1)
{
  v1[OBJC_IVAR___CCUIControlHostViewController__isResizing] = a1;
  if (!objc_msgSend(v1, sel_isViewLoaded)) {
    return;
  }
  id v3 = objc_msgSend(v1, sel_viewIfLoaded);
  if (!v3)
  {
LABEL_9:
    __break(1u);
    return;
  }
  self;
  id v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2)
  {

    goto LABEL_9;
  }
  objc_msgSend(v2, sel_setResizing_, objc_msgSend(v1, sel_isResizing));
}

uint64_t CCUIControlHostViewController.providesOwnPlatter.getter()
{
  return 1;
}

BOOL CCUIControlHostViewController.shouldPerformClickInteraction.getter()
{
  id v1 = objc_msgSend(v0, sel_viewIfLoaded);
  if (v1)
  {
    id v2 = v1;
    self;
    id v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3) {
  }
    }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(v3, sel_contextMenu);

  if (v4) {
  return v4 == 0;
  }
}

Swift::Bool __swiftcall CCUIControlHostViewController.shouldBeginTransitionToExpandedContentModule()()
{
  return 0;
}

Swift::Bool __swiftcall CCUIControlHostViewController.controlHostViewShouldPerformPrimaryAction(_:)(CCUIControlHostView *a1)
{
  id v2 = objc_msgSend(v1, sel_delegate);
  if (!v2) {
    return 1;
  }
  unsigned __int8 v3 = objc_msgSend(v2, sel_controlHostViewControllerShouldPerformPrimaryAction_, v1);
  swift_unknownObjectRelease();
  return v3;
}

Swift::Void __swiftcall CCUIControlHostViewController.controlHostView(_:enqueue:)(CCUIControlHostView *_, CCUIStatusUpdate enqueue)
{
  Class isa = enqueue.super.isa;
  id v4 = objc_msgSend(v2, sel_contentModuleContext, enqueue._message, enqueue._type);
  objc_msgSend(v4, sel_enqueueStatusUpdate_, isa);
}

Swift::Bool __swiftcall CCUIControlHostViewController.isDevicePasscodeLocked(_:)(CCUIControlHostView *a1)
{
  id v2 = objc_msgSend(v1, sel_contentModuleContext);
  if (!v2) {
    return 0;
  }
  unsigned __int8 v3 = v2;
  unsigned __int8 v4 = objc_msgSend(v2, sel_isDevicePasscodeLocked);

  return v4;
}

void __swiftcall CCUIControlHostViewController.init(nibName:bundle:)(CCUIControlHostViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    unsigned __int8 v4 = (void *)sub_1D83820E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void CCUIControlHostViewController.init(nibName:bundle:)()
{
}

void _sSo29CCUIControlHostViewControllerC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___CCUIControlHostViewController_contentModuleContext] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlHostViewController_gridSizeClass] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius] = 0;
  *(void *)&v0[OBJC_IVAR___CCUIControlHostViewController_contentMetrics] = 0;
  v0[OBJC_IVAR___CCUIControlHostViewController__isResizing] = 0;

  sub_1D8382288();
  __break(1u);
}

void sub_1D837E8EC(void *a1)
{
  unsigned __int8 v3 = (id *)&v1[OBJC_IVAR___CCUIControlHostViewController_contentMetrics];
  swift_beginAccess();
  id v4 = *v3;
  *unsigned __int8 v3 = a1;
  id v5 = a1;

  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    id v6 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v6)
    {
      uint64_t v7 = v6;
      self;
      uint64_t v8 = swift_dynamicCastObjCClass();
      if (v8)
      {
        objc_super v9 = (void *)v8;
        id v10 = *v3;
        objc_msgSend(v9, sel_setContentMetrics_, v10);

        return;
      }
    }
    __break(1u);
  }
}

char *keypath_get_selector_gridSizeClass()
{
  return sel_gridSizeClass;
}

id sub_1D837E9DC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_gridSizeClass);
  *a2 = result;
  return result;
}

id sub_1D837EA10(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGridSizeClass_, *a1);
}

char *keypath_get_selector_userVisibilityStatus()
{
  return sel_userVisibilityStatus;
}

id sub_1D837EA30@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_userVisibilityStatus);
  *a2 = result;
  return result;
}

id sub_1D837EA64(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserVisibilityStatus_, *a1);
}

char *keypath_get_selector_compactContinuousCornerRadius()
{
  return sel_compactContinuousCornerRadius;
}

id sub_1D837EA84@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_compactContinuousCornerRadius);
  *a2 = v4;
  return result;
}

id sub_1D837EAB8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCompactContinuousCornerRadius_, *a1);
}

char *keypath_get_selector_contentMetrics()
{
  return sel_contentMetrics;
}

id sub_1D837EAD8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_contentMetrics);
  *a2 = result;
  return result;
}

id sub_1D837EB14(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContentMetrics_, *a1);
}

char *keypath_get_selector_isResizing()
{
  return sel_isResizing;
}

id sub_1D837EB34@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isResizing);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1D837EB68(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResizing_, *a1);
}

unint64_t type metadata accessor for CCUIControlHostViewController()
{
  unint64_t result = qword_1EA88BE78;
  if (!qword_1EA88BE78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA88BE78);
  }
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t CHSControlSize.init(gridSizeClass:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1D8386B38[a1 - 1];
  }
}

uint64_t CCUIGridSizeClass.init(controlSize:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1D8386B58[a1 - 1];
  }
}

unint64_t static String.controlCenterHostIdentifier.getter()
{
  return 0xD000000000000017;
}

id sub_1D837EC38()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EA88C490 = (uint64_t)result;
  return result;
}

uint64_t sub_1D837EC90()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

const char *CCUIFeature.domain.getter()
{
  return "ControlCenter";
}

const char *CCUIFeature.feature.getter(uint64_t a1)
{
  if (!a1) {
    return "InactiveMicModeSelection";
  }
  if (a1 == 1) {
    return "PrivacyAttributionInSwiftUI";
  }
  id result = (const char *)sub_1D8382288();
  __break(1u);
  return result;
}

uint64_t CCUIFeature.isEnabled.getter(uint64_t a1)
{
  type metadata accessor for Feature(0);
  v4[3] = v2;
  v4[4] = sub_1D834D160();
  v4[0] = a1;
  LOBYTE(a1) = sub_1D8382068();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return a1 & 1;
}

uint64_t static Features.isFeatureEnabled(_:)(uint64_t a1)
{
  type metadata accessor for Feature(0);
  v4[3] = v2;
  v4[4] = sub_1D834D160();
  v4[0] = a1;
  LOBYTE(a1) = sub_1D8382068();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return a1 & 1;
}

id Features.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id Features.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Features();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for Features()
{
  return self;
}

id Features.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Features();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1D837EF08(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned __int8 v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88BFF8);
  uint64_t v2 = sub_1D83822B8();
  unsigned __int8 v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1D8381C7C(v6, (uint64_t)v15);
    unint64_t result = sub_1D83797B4((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1D837BEB8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1D837F038(void *a1, double a2, double a3, double a4, double a5)
{
  swift_unknownObjectWeakInit();
  long long v11 = (uint64_t *)&v5[OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason];
  *long long v11 = sub_1D83820F8();
  v11[1] = v12;
  *(void *)&v5[OBJC_IVAR___CCUIControlHostView_applicationContext] = 0;
  v5[OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel] = 0;
  *(void *)&v5[OBJC_IVAR___CCUIControlHostView_controlInstance] = a1;
  BOOL v13 = v5;
  id v14 = a1;
  BSRectWithSize();
  id v19 = objc_msgSend(objc_allocWithZone((Class)CCUIControlTemplateView), sel_initWithFrame_, v15, v16, v17, v18);
  *(void *)&v13[OBJC_IVAR___CCUIControlHostView_templateView] = v19;
  id v20 = v19;
  objc_msgSend(v20, sel_setSupportsAccessibilityContentSizeCategories_, 1);

  v47.receiver = v13;
  v47.super_class = (Class)CCUIControlHostView;
  CGRect v21 = (char *)objc_msgSendSuper2(&v47, sel_initWithFrame_, a2, a3, a4, a5);
  uint64_t v22 = OBJC_IVAR___CCUIControlHostView_templateView;
  double v23 = *(void **)&v21[OBJC_IVAR___CCUIControlHostView_templateView];
  double v24 = self;
  CGFloat v25 = v21;
  id v26 = v23;
  id v27 = objc_msgSend(v24, sel_controlCenterModuleBackgroundMaterial);
  objc_msgSend(v26, sel_setBackgroundView_, v27);

  id v28 = objc_msgSend(v14, sel_iconView);
  objc_msgSend(v28, sel_bs_setHitTestingDisabled_, 1);
  CGFloat v29 = *(void **)&v21[v22];
  objc_msgSend(v29, sel_setGlyphView_, v28);
  objc_msgSend(v14, sel_registerObserver_, v25);
  objc_msgSend(v29, sel_setDelegate_, v25);
  objc_msgSend(v25, sel_addSubview_, v29);
  _sSo19CCUIControlHostViewC18ControlCenterUIKitE015controlInstanceC14ModelDidChangeyySo012CHUISControlH0CF_0();
  if (objc_msgSend(v14, sel_contentType) != (id)1)
  {
    uint64_t v30 = sub_1D837F70C();
    if (v31)
    {
      uint64_t v32 = v30;
      uint64_t v33 = v31;
      self;
      uint64_t v34 = swift_dynamicCastObjCClass();
      sub_1D837F70C();
      if (v35)
      {
        char v36 = sub_1D8382128();
        swift_bridgeObjectRelease();
        if (v34)
        {
          if ((v36 & 1) != 0 && (sub_1D8381550() & 1) == 0)
          {
            objc_msgSend(*(id *)&v21[v22], sel_setContextMenuDelegate_, v25);
            id v37 = objc_allocWithZone((Class)CCUIControlContainerApplicationContext);
            swift_bridgeObjectRetain();
            double v38 = (void *)sub_1D83820E8();
            swift_bridgeObjectRelease();
            id v39 = objc_msgSend(v37, sel_initWithApplicationBundleIdentifier_, v38);

            id v40 = *(void **)&v25[OBJC_IVAR___CCUIControlHostView_applicationContext];
            *(void *)&v25[OBJC_IVAR___CCUIControlHostView_applicationContext] = v39;
          }
        }
      }
      if (sub_1D837F850())
      {
        os_log_type_t v41 = *(void **)&v21[v22];
        sub_1D837C460(0, &qword_1EA88B358);
        uint64_t v42 = swift_allocObject();
        swift_unknownObjectWeakInit();
        double v43 = (void *)swift_allocObject();
        v43[2] = v42;
        v43[3] = v32;
        v43[4] = v33;
        id v44 = v41;
        id v45 = (void *)sub_1D83821B8();
        objc_msgSend(v44, sel_addAction_forControlEvents_, v45, 1, 0, 0, 0, sub_1D8381C70, v43);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }

  return v25;
}

uint64_t _sSo19CCUIControlHostViewC18ControlCenterUIKitE015controlInstanceC14ModelDidChangeyySo012CHUISControlH0CF_0()
{
  id v1 = v0;
  uint64_t v2 = OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel;
  int v3 = v0[OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel];
  id v4 = objc_msgSend(v0, sel_controlInstance);
  id v5 = sub_1D838086C();
  uint64_t v6 = *(void **)&v1[OBJC_IVAR___CCUIControlHostView_templateView];
  id v7 = objc_msgSend(v4, sel_contentType);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  *(void *)(v8 + 24) = v4;
  *(void *)(v8 + 32) = v5;
  *(unsigned char *)(v8 + 40) = v7 == (id)1;
  if (v3 == 1)
  {
    swift_unknownObjectRetain();
    id v9 = v4;
    sub_1D83808E8(v6, v9, v5, v7 == (id)1);

    long long v10 = 0;
    if (!v5)
    {
LABEL_4:
      v1[v2] = v5 != 0;
      swift_release();
      return sub_1D8381D6C((uint64_t)v10);
    }
LABEL_3:
    swift_unknownObjectRelease();
    goto LABEL_4;
  }
  id v16 = self;
  uint64_t v12 = swift_allocObject();
  long long v10 = sub_1D8381D2C;
  *(void *)(v12 + 16) = sub_1D8381D2C;
  *(void *)(v12 + 24) = v8;
  aBlock[4] = sub_1D8381D4C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D8376700;
  aBlock[3] = &block_descriptor_1;
  BOOL v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v14 = v4;
  id v15 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_performWithoutAnimation_, v13);

  _Block_release(v13);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v14 & 1) == 0)
  {
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D837F70C()
{
  id v1 = objc_msgSend(v0, sel_controlInstance);
  id v2 = objc_msgSend(v1, sel_instanceIdentity);

  id v3 = objc_msgSend(v2, sel_control);
  id v4 = (char *)objc_msgSend(v3, sel_extensionIdentity);

  id v5 = &v4[*MEMORY[0x1E4F58B78]];
  swift_beginAccess();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B2C8);
  uint64_t v7 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6)) {
    uint64_t v7 = sub_1D8382078();
  }
  swift_endAccess();

  return v7;
}

uint64_t sub_1D837F850()
{
  id v1 = objc_msgSend(v0, sel_controlInstance);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1D837F70C();
  if (!v4) {
    return 0;
  }
  if (v3 == 0xD000000000000010 && v4 == 0x80000001D8388DC0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_1D83822D8();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  id v7 = objc_msgSend(v0, sel_controlInstance);
  id v8 = objc_msgSend(v7, sel_instanceIdentity);

  id v9 = objc_msgSend(v8, sel_control);
  id v10 = objc_msgSend(v9, sel_kind);

  uint64_t v11 = sub_1D83820F8();
  uint64_t v13 = v12;

  if (v11 == 0xD000000000000020 && v13 == 0x80000001D8388DE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v14 = sub_1D83822D8();
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
}

void sub_1D837FA14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1D9486180](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_1D837FA84();
  }
}

void sub_1D837FA84()
{
  id v1 = objc_msgSend(v0, sel_cameraCapturePrewarmReason);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_1D83820F8();
    uint64_t v5 = v4;

    CCUISignpostImpulse(CCUILogUserInterface);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88BFF0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D8386BF0;
    sub_1D83820F8();
    uint64_t v7 = MEMORY[0x1E4FBB1A0];
    sub_1D8382228();
    *(void *)(inited + 96) = v7;
    *(void *)(inited + 72) = v3;
    *(void *)(inited + 80) = v5;
    sub_1D83820F8();
    sub_1D8382228();
    uint64_t v8 = mach_absolute_time();
    uint64_t v9 = MEMORY[0x1E4FBC538];
    *(void *)(inited + 168) = MEMORY[0x1E4FBC538];
    *(void *)(inited + 144) = v8;
    sub_1D83820F8();
    sub_1D8382228();
    uint64_t v10 = mach_continuous_time();
    *(void *)(inited + 240) = v9;
    *(void *)(inited + 216) = v10;
    sub_1D837EF08(inited);
    uint64_t v11 = (void *)sub_1D83820E8();
    uint64_t v12 = (void *)sub_1D83820D8();
    swift_bridgeObjectRelease();
    AVCapturePrewarmWithOptions();
  }
}

void __swiftcall CCUIControlHostView.init(coder:)(CCUIControlHostView_optional *__return_ptr retstr, NSCoder coder)
{
}

Swift::Void __swiftcall CCUIControlHostView.layoutSubviews()()
{
  v2.super_class = (Class)CCUIControlHostView;
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR___CCUIControlHostView_templateView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

Swift::Bool __swiftcall CCUIControlHostView.performPrimaryAction(for:)(CCUIControlTemplateView *a1)
{
  id v2 = objc_msgSend(v1, sel_delegate);
  if (!v2
    || (unsigned int v3 = objc_msgSend(v2, sel_controlHostViewShouldPerformPrimaryAction_, v1),
        swift_unknownObjectRelease(),
        v3))
  {
    sub_1D838008C();
  }
  return 0;
}

void sub_1D838008C()
{
  if (sub_1D837F850())
  {
    id v1 = objc_msgSend(v0, sel_cameraCapturePrewarmReason);
    if (v1)
    {

      CCUISignpostImpulse(CCUILogUserInterface);
    }
  }
  id v2 = objc_msgSend(v0, sel_controlInstance);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  v7[4] = sub_1D8381DBC;
  v7[5] = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1D83814E4;
  v7[3] = &block_descriptor_20;
  char v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v2, sel_performControlActionWithCompletion_, v6);
  _Block_release(v6);
}

uint64_t CCUIControlHostView.showsMenuAsPrimaryAction.getter()
{
  return 0;
}

uint64_t CCUIControlHostView.menuDisplayName.getter()
{
  return 0;
}

Swift::OpaquePointer_optional __swiftcall CCUIControlHostView.contextMenuItems()()
{
  id v1 = objc_msgSend(v0, sel_controlInstance);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();

  if (v2)
  {
    uint64_t v4 = sub_1D837F70C();
    if (v3)
    {
      if (v4 == 0xD000000000000014 && v3 == 0x80000001D8388B00)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v5 = sub_1D83822D8();
        swift_bridgeObjectRelease();
        if ((v5 & 1) == 0) {
          goto LABEL_13;
        }
      }
      id v6 = objc_msgSend(v0, sel_controlInstance);
      id v7 = objc_msgSend(v6, sel_instanceIdentity);

      id v8 = objc_msgSend(v7, sel_control);
      id v9 = objc_msgSend(v8, sel_kind);

      uint64_t v10 = sub_1D83820F8();
      uint64_t v12 = v11;

      if (v10 == 0xD00000000000002DLL && v12 == 0x80000001D8388B20)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v13 = sub_1D83822D8();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0) {
          goto LABEL_13;
        }
      }
      id v14 = objc_msgSend(v0, sel_delegate);
      if (v14)
      {
        unsigned __int8 v15 = objc_msgSend(v14, sel_isDevicePasscodeLocked_, v0);
        swift_unknownObjectRelease();
        if (v15) {
          goto LABEL_16;
        }
      }
    }
  }
LABEL_13:
  id v16 = *(void **)&v0[OBJC_IVAR___CCUIControlHostView_applicationContext];
  if (!v16 || (id v17 = objc_msgSend(v16, sel_applicationShortcuts)) == 0)
  {
LABEL_16:
    uint64_t v19 = 0;
    goto LABEL_17;
  }
  double v18 = v17;
  sub_1D837C460(0, &qword_1EA88BE90);
  uint64_t v19 = sub_1D8382148();

LABEL_17:
  id v20 = (void *)v19;
  result.is_nil = v3;
  result.value._rawValue = v20;
  return result;
}

id CCUIControlHostView.contextMenu.getter()
{
  id v1 = objc_msgSend(v0, sel_controlInstance);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();

  if (!v2) {
    goto LABEL_14;
  }
  uint64_t v3 = sub_1D837F70C();
  if (!v4) {
    goto LABEL_14;
  }
  if (v3 == 0xD000000000000014 && v4 == 0x80000001D8388B00)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_1D83822D8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
  }
  id v6 = objc_msgSend(v0, sel_controlInstance);
  id v7 = objc_msgSend(v6, sel_instanceIdentity);

  id v8 = objc_msgSend(v7, sel_control);
  id v9 = objc_msgSend(v8, sel_kind);

  uint64_t v10 = sub_1D83820F8();
  uint64_t v12 = v11;

  if (v10 == 0xD00000000000002DLL && v12 == 0x80000001D8388B20)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_1D83822D8();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      goto LABEL_14;
    }
  }
  id v14 = objc_msgSend(v0, sel_delegate);
  if (v14)
  {
    unsigned __int8 v15 = objc_msgSend(v14, sel_isDevicePasscodeLocked_, v0);
    swift_unknownObjectRelease();
    if (v15) {
      return 0;
    }
  }
LABEL_14:
  id result = *(id *)&v0[OBJC_IVAR___CCUIControlHostView_applicationContext];
  if (result) {
    return objc_msgSend(result, sel_contextMenuForApplicationShortcuts);
  }
  return result;
}

id sub_1D838086C()
{
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_viewModel);
  }
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_viewModel);
  }
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result) {
    return objc_msgSend(result, sel_viewModel);
  }
  return result;
}

void sub_1D83808E8(void *a1, void *a2, void *a3, char a4)
{
  sub_1D8380B1C();
  if (v8)
  {
    id v9 = (void *)sub_1D83820E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  objc_msgSend(a1, sel_setTitle_, v9);

  if (a3)
  {
    sub_1D8380D44();
    if (v10)
    {
      uint64_t v11 = (void *)sub_1D83820E8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = 0;
    }
    objc_msgSend(a1, sel_setSubtitle_, v11);

    objc_msgSend(a1, sel_setRedacted_, objc_msgSend(a3, sel_isRedacted));
    objc_msgSend(a1, sel_setEnabled_, a4 & 1 | ((objc_msgSend(a3, sel_isDisabled) & 1) == 0));
    unsigned __int8 v12 = sub_1D8380F1C();
  }
  else
  {
    objc_msgSend(a1, sel_setSubtitle_, 0);
    objc_msgSend(a1, sel_setRedacted_, 0);
    objc_msgSend(a1, sel_setEnabled_, 1);
    unsigned __int8 v12 = 0;
  }
  objc_msgSend(a1, sel_setSelected_, v12 & 1);
  id v13 = sub_1D838086C();
  if (!v13
    || (id v14 = objc_msgSend(v13, sel_accessibilityIdentifier),
        swift_unknownObjectRelease(),
        !v14))
  {
    id v15 = objc_msgSend(a2, sel_control);
    id v14 = objc_msgSend(v15, sel_kind);
  }
  sub_1D83820F8();

  id v16 = (id)sub_1D83820E8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setAccessibilityIdentifier_, v16);
}

uint64_t sub_1D8380B1C()
{
  id v1 = sub_1D838086C();
  if (v1 && (id v2 = objc_msgSend(v1, sel_title), swift_unknownObjectRelease(), v2)
    || (id v3 = objc_msgSend(v0, sel_descriptor)) != 0
    && (uint64_t v4 = v3, v2 = objc_msgSend(v3, sel_displayName), v4, v2))
  {
    uint64_t v5 = sub_1D83820F8();
  }
  else
  {
    id v6 = objc_msgSend(v0, sel_control);
    id v7 = (char *)objc_msgSend(v6, sel_extensionIdentity);

    uint64_t v8 = &v7[*MEMORY[0x1E4F58B78]];
    swift_beginAccess();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88B2C8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
    {
      swift_endAccess();

      return 0;
    }
    else
    {
      uint64_t v5 = sub_1D8382078();
      uint64_t v11 = v10;
      swift_endAccess();

      sub_1D837C460(0, (unint64_t *)&unk_1EA88C070);
      swift_bridgeObjectRetain();
      id v12 = sub_1D8381954(v5, v11, 1);
      id v13 = v12;
      if (v12)
      {
        id v14 = objc_msgSend(v12, sel_localizedName);
        uint64_t v5 = sub_1D83820F8();
        swift_bridgeObjectRelease();
      }
    }
  }
  return v5;
}

uint64_t sub_1D8380D44()
{
  id v1 = objc_msgSend(v0, sel_subtitle);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = sub_1D83820F8();
  }
  else
  {
    self;
    uint64_t v5 = swift_dynamicCastObjCClass();
    if (!v5) {
      return 0;
    }
    id v6 = (void *)v5;
    swift_unknownObjectRetain();
    unsigned int v7 = objc_msgSend(v6, sel_state);
    uint64_t v8 = &selRef_onOption;
    if (!v7) {
      uint64_t v8 = &selRef_offOption;
    }
    id v9 = [v6 *v8];
    id v10 = objc_msgSend(v9, sel_value);
    if (v10)
    {
      id v2 = v10;
      uint64_t v3 = sub_1D83820F8();
      swift_unknownObjectRelease();
    }
    else
    {
      if (qword_1EA88BA90 != -1) {
        swift_once();
      }
      uint64_t v11 = (void *)qword_1EA88C490;
      id v12 = (void *)sub_1D83820E8();
      id v2 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, 0);

      uint64_t v3 = sub_1D83820F8();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
  }

  return v3;
}

id sub_1D8380F1C()
{
  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (result)
  {
    id v1 = &selRef_isAnimating;
  }
  else
  {
    self;
    id result = (id)swift_dynamicCastObjCClass();
    if (!result) {
      return result;
    }
    id v1 = &selRef_state;
  }
  return [result *v1];
}

void sub_1D8380F84(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 + 16;
  if (a1)
  {
    id v5 = a1;
    if (qword_1EA88BA88 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1D83820A8();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EA88C478);
    id v7 = a1;
    id v8 = a1;
    swift_retain();
    oslog = sub_1D8382088();
    os_log_type_t v9 = sub_1D8382168();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412546;
      swift_beginAccess();
      uint64_t v12 = MEMORY[0x1D9486180](v3);
      sub_1D83821C8();
      *uint64_t v11 = v12;
      swift_release();
      *(_WORD *)(v10 + 12) = 2112;
      id v22 = a1;
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      sub_1D83821C8();
      v11[1] = v24;

      _os_log_impl(&dword_1D834A000, oslog, v9, "Failed to perform control %@ action with error: %@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88BCF8);
      swift_arrayDestroy();
      MEMORY[0x1D9486110](v11, -1, -1);
      MEMORY[0x1D9486110](v10, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    uint64_t v13 = a3 + 16;
    swift_beginAccess();
    id v14 = (void *)MEMORY[0x1D9486180](v13);
    if (!v14) {
      return;
    }
    id v15 = v14;
    id v16 = objc_msgSend(v14, sel_delegate);
    if (v16)
    {
      id v17 = v16;
      swift_beginAccess();
      uint64_t v18 = MEMORY[0x1D9486180](v3);
      if (v18)
      {
        uint64_t v19 = (void *)v18;
        id v20 = sub_1D838086C();

        if (v20)
        {
          id v21 = sub_1D83812F8();
          swift_unknownObjectRelease();
          if (v21)
          {
            objc_msgSend(v17, sel_controlHostView_enqueue_, v15, v21);

            swift_unknownObjectRelease();
            return;
          }
        }
      }
      swift_unknownObjectRelease();
    }
  }
}

id sub_1D83812F8()
{
  self;
  uint64_t v0 = swift_dynamicCastObjCClass();
  if (v0)
  {
    id v1 = (void *)v0;
    swift_unknownObjectRetain();
    id v2 = objc_msgSend(v1, sel_status);
    if (v2)
    {
      uint64_t v3 = v2;
      sub_1D83820F8();

      uint64_t v4 = (void *)sub_1D83820E8();
      swift_bridgeObjectRelease();
      id v5 = objc_msgSend(self, sel_statusUpdateWithMessage_type_, v4, 0);
      swift_unknownObjectRelease();

      return v5;
    }
    swift_unknownObjectRelease();
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6) {
    return 0;
  }
  id v7 = (void *)v6;
  swift_unknownObjectRetain();
  unsigned int v8 = objc_msgSend(v7, sel_state);
  os_log_type_t v9 = &selRef_onOption;
  if (!v8) {
    os_log_type_t v9 = &selRef_offOption;
  }
  id v10 = [v7 *v9];
  id v11 = objc_msgSend(v10, sel_status);
  if (!v11)
  {
    swift_unknownObjectRelease();

    return 0;
  }
  uint64_t v12 = v11;
  sub_1D83820F8();

  if (v8) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  id v14 = (void *)sub_1D83820E8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_statusUpdateWithMessage_type_, v14, v13);
  swift_unknownObjectRelease();

  return v5;
}

void sub_1D83814E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1D8381550()
{
  id v1 = objc_msgSend(v0, sel_controlInstance);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1D837F70C();
  if (!v4) {
    return 0;
  }
  if (v3 == 0xD000000000000012 && v4 == 0x80000001D8388D70)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_1D83822D8();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v6 & 1) == 0) {
      return result;
    }
  }
  id v7 = objc_msgSend(v0, sel_controlInstance);
  id v8 = objc_msgSend(v7, sel_instanceIdentity);

  id v9 = objc_msgSend(v8, sel_control);
  id v10 = objc_msgSend(v9, sel_kind);

  uint64_t v11 = sub_1D83820F8();
  uint64_t v13 = v12;

  if (v11 == 0xD000000000000029 && v13 == 0x80000001D8388D90)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v14 = sub_1D83822D8();
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
}

void __swiftcall CCUIControlHostView.init(frame:)(CCUIControlHostView *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

void CCUIControlHostView.init(frame:)()
{
}

Swift::Void __swiftcall CHUISControlIconView.applyGlyphContentMetrics(_:)(CCUIModuleContentMetrics_optional *a1)
{
  if (a1) {
    id v2 = [(CCUIModuleContentMetrics_optional *)a1 symbolFont];
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;
  objc_msgSend(v1, sel_setFont_);
}

void sub_1D83818CC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  if (a3) {
    id v5 = objc_msgSend(a3, sel_symbolFont);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  objc_msgSend(v4, sel_setFont_);
}

id sub_1D8381954(uint64_t a1, uint64_t a2, char a3)
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = (void *)sub_1D83820E8();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    id v6 = v9[0];
  }
  else
  {
    id v7 = v9[0];
    sub_1D8382048();

    swift_willThrow();
  }
  return v5;
}

unint64_t sub_1D8381A3C(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA88B360);
  id v3 = (void *)sub_1D83822B8();
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  unint64_t result = sub_1D8379748(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v17 = v5;
    return (unint64_t)v3;
  }
  id v8 = (void **)(a1 + 7);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v4;
    *(void *)(v3[7] + v9) = v5;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v4 = (uint64_t)*(v8 - 1);
    char v14 = *v8;
    id v15 = v5;
    unint64_t result = sub_1D8379748(v4);
    id v8 = v13;
    id v5 = v14;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

void _sSo19CCUIControlHostViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = (uint64_t *)&v0[OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason];
  *uint64_t v1 = sub_1D83820F8();
  v1[1] = v2;
  *(void *)&v0[OBJC_IVAR___CCUIControlHostView_applicationContext] = 0;
  v0[OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel] = 0;

  sub_1D8382288();
  __break(1u);
}

uint64_t type metadata accessor for CCUIControlHostView(uint64_t a1)
{
  return sub_1D837C460(a1, (unint64_t *)&unk_1EA88BFE0);
}

uint64_t sub_1D8381BF8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D8381C30()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1D8381C70(uint64_t a1)
{
  sub_1D837FA14(a1, *(void *)(v1 + 16));
}

uint64_t sub_1D8381C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA88C000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D8381CE4()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 41, 7);
}

void sub_1D8381D2C()
{
  sub_1D83808E8(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_1D8381D3C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D8381D4C()
{
  return sub_1D83766D8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1D8381D6C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1D8381D7C()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1D8381DBC(void *a1)
{
  sub_1D8380F84(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1D8382028()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1D8382038()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1D8382048()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D8382058()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1D8382068()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1D8382078()
{
  return MEMORY[0x1F41113E8]();
}

uint64_t sub_1D8382088()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D8382098()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1D83820A8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D83820B8()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1D83820C8()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1D83820D8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D83820E8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D83820F8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D8382108()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D8382118()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1D8382128()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1D8382138()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D8382148()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D8382158()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1D8382168()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D8382178()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1D8382188()
{
  return MEMORY[0x1F4166698]();
}

uint64_t sub_1D8382198()
{
  return MEMORY[0x1F41667D8]();
}

uint64_t sub_1D83821A8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D83821B8()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1D83821C8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D83821D8()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1D83821E8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D83821F8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D8382208()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D8382218()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D8382228()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D8382238()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D8382248()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D8382258()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D8382268()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D8382278()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D8382288()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D8382298()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D83822A8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D83822B8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D83822C8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D83822D8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D83822E8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1D83822F8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D8382308()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D8382318()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D8382328()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AVCapturePrewarmWithOptions()
{
  return MEMORY[0x1F40D0E78]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F410C310]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1F40DB090]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1F415BB80]();
}

uint64_t SBSRequestPasscodeUnlockAlertUI()
{
  return MEMORY[0x1F415C400]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1F4166C08]();
}

uint64_t UIPointIntegral()
{
  return MEMORY[0x1F4166DE8]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4166DF8]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1F4166E00]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4166E08]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectContainsPointInYAxis()
{
  return MEMORY[0x1F4166E60]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4166EE8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle()
{
  return MEMORY[0x1F412C698]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}