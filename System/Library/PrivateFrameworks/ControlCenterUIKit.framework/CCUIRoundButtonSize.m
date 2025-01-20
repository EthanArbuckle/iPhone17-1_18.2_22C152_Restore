@interface CCUIRoundButtonSize
@end

@implementation CCUIRoundButtonSize

void ___CCUIRoundButtonSize_block_invoke()
{
  v14.origin.x = CCUIReferenceScreenBounds();
  if (CGRectGetWidth(v14) < 375.0)
  {
    _CCUIRoundButtonSize_size = 0x4047000000000000;
    return;
  }
  v15.origin.x = CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v15);
  if (Width < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        [v12 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() == 2)
  {
    v16.origin.x = CCUIReferenceScreenBounds();
    double v4 = CGRectGetWidth(v16);
    if (v4 >= 1024.0)
    {
      v0 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v0 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        _CCUIRoundButtonSize_size = 0x404B000000000000;
LABEL_39:

LABEL_40:
        v10 = v12;
        if (Width < 1024.0) {
          return;
        }
        goto LABEL_41;
      }
    }
    v17.origin.x = CCUIReferenceScreenBounds();
    double v5 = CGRectGetWidth(v17);
    if (v5 >= 834.0)
    {
      v1 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v1 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        _CCUIRoundButtonSize_size = 0x404A000000000000;
LABEL_37:

LABEL_38:
        if (v4 < 1024.0) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
    }
    v18.origin.x = CCUIReferenceScreenBounds();
    double v6 = CGRectGetWidth(v18);
    if (v6 >= 834.0)
    {
      v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v2 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        _CCUIRoundButtonSize_size = 0x404A000000000000;
        goto LABEL_35;
      }
    }
    v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v7 userInterfaceIdiom] == 1)
    {
      uint64_t v8 = 0x404A000000000000;
    }
    else
    {
      v19.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v19) >= 430.0
        || (v20.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v20) >= 428.0)
        || (v21.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v21) >= 414.0)
        && SBFEffectiveHomeButtonType() == 2
        || (v22.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v22) >= 414.0))
      {
        uint64_t v8 = 0x404E000000000000;
      }
      else
      {
        v23.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v23) >= 393.0 || (v24.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v24) >= 390.0))
        {
          uint64_t v8 = 0x404C000000000000;
        }
        else
        {
          v25.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v25) < 375.0 || SBFEffectiveHomeButtonType() != 2)
          {
            v26.origin.x = CCUIReferenceScreenBounds();
            BOOL v11 = CGRectGetWidth(v26) < 375.0;
            double v9 = 52.0;
            if (!v11) {
              double v9 = 54.0;
            }
LABEL_31:
            _CCUIRoundButtonSize_size = *(void *)&v9;

            if (v6 < 834.0)
            {
LABEL_36:
              if (v5 < 834.0) {
                goto LABEL_38;
              }
              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
          uint64_t v8 = 0x404B000000000000;
        }
      }
    }
    double v9 = *(double *)&v8;
    goto LABEL_31;
  }
  _CCUIRoundButtonSize_size = 0x404B000000000000;
  v10 = v12;
LABEL_41:
}

@end