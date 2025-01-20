@interface CCUIPortraitStatusBarBaselineToTopOffsetHeight
@end

@implementation CCUIPortraitStatusBarBaselineToTopOffsetHeight

void ___CCUIPortraitStatusBarBaselineToTopOffsetHeight_block_invoke()
{
  CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v16);
  if (Width >= 1024.0)
  {
    v0 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_40:

      goto LABEL_41;
    }
  }
  CCUIReferenceScreenBounds();
  double v5 = CGRectGetWidth(v17);
  if (v5 < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        v1 = objc_claimAutoreleasedReturnValue(),
        [v1 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v18);
    if (v6 >= 834.0)
    {
      v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_36:

LABEL_37:
        if (v5 < 1024.0) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }
    CCUIReferenceScreenBounds();
    double v7 = CGRectGetWidth(v19);
    if (v7 >= 834.0)
    {
      v3 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v3 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_34:

LABEL_35:
        if (v6 < 834.0) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
    }
    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v8 userInterfaceIdiom] == 1)
    {
      uint64_t v9 = 0x4052000000000000;
    }
    else
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v20) < 430.0)
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v21) >= 428.0)
        {
          double v10 = 125.0;
          goto LABEL_33;
        }
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v22) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
        {
          double v10 = 122.0;
          goto LABEL_33;
        }
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v23) >= 414.0)
        {
          uint64_t v9 = 0x4055000000000000;
          goto LABEL_32;
        }
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v24) < 393.0)
        {
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v25) < 390.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v26) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
            {
              double v10 = 97.0;
            }
            else
            {
              CCUIReferenceScreenBounds();
              BOOL v15 = CGRectGetWidth(v29) < 375.0;
              double v10 = 27.0;
              if (!v15) {
                double v10 = 16.0;
              }
            }
LABEL_33:
            _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = *(void *)&v10;

            if (v7 < 834.0) {
              goto LABEL_35;
            }
            goto LABEL_34;
          }
        }
      }
      uint64_t v9 = 0x4059000000000000;
    }
LABEL_32:
    double v10 = *(double *)&v9;
    goto LABEL_33;
  }
  _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_38:

LABEL_39:
  if (Width >= 1024.0) {
    goto LABEL_40;
  }
LABEL_41:
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v11 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
  {
  }
  else
  {
    CCUIReferenceScreenBounds();
    double v12 = CGRectGetWidth(v27);

    if (v12 < 375.0)
    {
      double v13 = *(double *)&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_height;
      if (*(double *)&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_height < 97.0) {
        double v13 = 97.0;
      }
      _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = *(void *)&v13;
    }
  }
  CCUIReferenceScreenBounds();
  if (CGRectGetWidth(v28) <= 375.0)
  {
    CCUIScreenSafeAreaInsets();
    if (v14 >= 50.0) {
      _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4059C00000000000;
    }
  }
}

@end