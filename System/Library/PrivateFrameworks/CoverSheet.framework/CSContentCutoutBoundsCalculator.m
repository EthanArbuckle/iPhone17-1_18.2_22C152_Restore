@interface CSContentCutoutBoundsCalculator
+ (CGRect)_contentCutoutBoundsForPortrait:(BOOL)a3 forModal:(BOOL)a4;
+ (CGRect)_normalizedContentCutoutForScreenBounds:(CGRect)a3 contentBoundingRect:(CGRect)a4;
+ (CGRect)_screenBoundsForPortrait:(BOOL)a3;
+ (CGRect)contentCutoutBoundsForInterfaceOrientation:(int64_t)a3;
+ (CGRect)contentCutoutBoundsForOrientation:(int64_t)a3;
+ (CGRect)modalContentCutoutBoundsForInterfaceOrientation:(int64_t)a3;
+ (CGRect)modalContentCutoutBoundsForOrientation:(int64_t)a3;
+ (CGRect)modalNormalizedContentCutoutBoundsForOrientation:(int64_t)a3;
+ (CGRect)normalizedContentCutoutBoundsForOrientation:(int64_t)a3;
@end

@implementation CSContentCutoutBoundsCalculator

+ (CGRect)contentCutoutBoundsForInterfaceOrientation:(int64_t)a3
{
  [a1 _contentCutoutBoundsForPortrait:(unint64_t)(a3 - 1) < 2 forModal:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)contentCutoutBoundsForOrientation:(int64_t)a3
{
  [a1 _contentCutoutBoundsForPortrait:(unint64_t)(a3 - 1) < 2 forModal:0];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)normalizedContentCutoutBoundsForOrientation:(int64_t)a3
{
  BOOL v4 = (unint64_t)(a3 - 1) < 2;
  [a1 contentCutoutBoundsForOrientation:v4];
  [a1 _screenBoundsForPortrait:v4];

  objc_msgSend(a1, "_normalizedContentCutoutForScreenBounds:contentBoundingRect:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)modalContentCutoutBoundsForInterfaceOrientation:(int64_t)a3
{
  [a1 _contentCutoutBoundsForPortrait:(unint64_t)(a3 - 1) < 2 forModal:1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)modalContentCutoutBoundsForOrientation:(int64_t)a3
{
  [a1 _contentCutoutBoundsForPortrait:(unint64_t)(a3 - 1) < 2 forModal:1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)modalNormalizedContentCutoutBoundsForOrientation:(int64_t)a3
{
  BOOL v4 = (unint64_t)(a3 - 1) < 2;
  [a1 modalContentCutoutBoundsForOrientation:v4];
  [a1 _screenBoundsForPortrait:v4];

  objc_msgSend(a1, "_normalizedContentCutoutForScreenBounds:contentBoundingRect:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_contentCutoutBoundsForPortrait:(BOOL)a3 forModal:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_msgSend(a1, "_screenBoundsForPortrait:");
  double x = v285.origin.x;
  double y = v285.origin.y;
  double width = v285.size.width;
  double height = v285.size.height;
  double v10 = CGRectGetWidth(v285);
  v286.origin.double x = x;
  v286.origin.double y = y;
  v286.size.double width = width;
  v286.size.double height = height;
  double v11 = CGRectGetHeight(v286);
  v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v5)
  {
    objc_msgSend(MEMORY[0x1E4FA5EE0], "suggestedFrameForDateTimeViewInScreenCoordinates:centeredX:", 1, x, y, width, height);
    double v15 = CGRectGetMaxY(v287) + 0.0;
    if ([MEMORY[0x1E4FA5F40] showAlternateDate])
    {
      [MEMORY[0x1E4FA5F48] subtitleLabelToLunarDateLabelBaselineDifferenceY];
      double v15 = v15 + v16;
    }
    if (!+[CSQuickActionsViewController deviceSupportsButtons])
    {
      double v23 = 0.0;
      if (v4)
      {
        v24 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v25 = [v24 userInterfaceIdiom];

        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          +[CSModalView _bottomBaselineOffsetForPortrait:v5];
          double v23 = v26 + 0.0;
        }
      }
      goto LABEL_430;
    }
    int v17 = __sb__runningInSpringBoard();
    if (v17)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v284 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      v255 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v255 userInterfaceIdiom] != 1)
      {
        uint64_t v284 = 0x100000000;
        goto LABEL_23;
      }
    }
    HIDWORD(v284) = v17 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v27 = __sb__runningInSpringBoard();
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v246 = [MEMORY[0x1E4F42D90] mainScreen];
        [v246 _referenceBounds];
      }
      BSSizeRoundForScale();
      LODWORD(v284) = v27 ^ 1;
      if (v45 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v44 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        uint64_t v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v259 = 0;
        uint64_t v261 = 0;
        uint64_t v263 = 0;
        uint64_t v265 = 0;
        uint64_t v267 = 0;
        uint64_t v272 = 0;
        int v271 = 0;
        int v275 = 0;
        int v279 = 0;
        int v269 = 0;
        int v277 = 0;
        memset(v281, 0, sizeof(v281));
        uint64_t v282 = 0;
        memset(v283, 0, sizeof(v283));
        v41 = &qword_1D8505CC8;
        goto LABEL_77;
      }
    }
    else
    {
      LODWORD(v284) = 0;
    }
LABEL_23:
    int v28 = __sb__runningInSpringBoard();
    if (v28)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v283[0]) = 0;
        HIDWORD(v283[1]) = 0;
        goto LABEL_32;
      }
    }
    else
    {
      v254 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v254 userInterfaceIdiom] != 1)
      {
        LODWORD(v283[0]) = 0;
        HIDWORD(v283[1]) = 1;
        goto LABEL_32;
      }
    }
    HIDWORD(v283[1]) = v28 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v27 = __sb__runningInSpringBoard();
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v257 = [MEMORY[0x1E4F42D90] mainScreen];
        [v257 _referenceBounds];
      }
      BSSizeRoundForScale();
      LODWORD(v283[0]) = v27 ^ 1;
      if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        uint64_t v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v259 = 0;
        uint64_t v261 = 0;
        uint64_t v263 = 0;
        uint64_t v265 = 0;
        uint64_t v267 = 0;
        uint64_t v272 = 0;
        int v271 = 0;
        int v275 = 0;
        int v279 = 0;
        int v269 = 0;
        int v277 = 0;
        memset(v281, 0, sizeof(v281));
        uint64_t v282 = 0;
        *(void *)((char *)v283 + 4) = 0;
        *(void *)((char *)v283 + 12) = 0;
        *(void *)((char *)&v283[1] + 4) = 0;
        v41 = &qword_1D8505CF0;
        goto LABEL_77;
      }
    }
    else
    {
      LODWORD(v283[0]) = 0;
    }
LABEL_32:
    int v29 = __sb__runningInSpringBoard();
    if (v29)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)((char *)&v283[1] + 4) = 0;
        goto LABEL_41;
      }
    }
    else
    {
      v253 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v253 userInterfaceIdiom] != 1)
      {
        *(void *)((char *)&v283[1] + 4) = 0x100000000;
        goto LABEL_41;
      }
    }
    DWORD2(v283[1]) = v29 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v27 = __sb__runningInSpringBoard();
      if (v27)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v245 = [MEMORY[0x1E4F42D90] mainScreen];
        [v245 _referenceBounds];
      }
      DWORD1(v283[1]) = v27 ^ 1;
      BSSizeRoundForScale();
      if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        uint64_t v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        int v38 = 0;
        int v39 = 0;
        int v40 = 0;
        int v259 = 0;
        uint64_t v261 = 0;
        uint64_t v263 = 0;
        uint64_t v265 = 0;
        uint64_t v267 = 0;
        uint64_t v272 = 0;
        int v271 = 0;
        int v275 = 0;
        int v279 = 0;
        int v269 = 0;
        int v277 = 0;
        memset(v281, 0, sizeof(v281));
        uint64_t v282 = 0;
        *(void *)((char *)v283 + 4) = 0;
        *(void *)((char *)v283 + 12) = 0;
        v41 = &qword_1D8505CE0;
        goto LABEL_77;
      }
    }
    else
    {
      DWORD1(v283[1]) = 0;
    }
LABEL_41:
    int v30 = __sb__runningInSpringBoard();
    if (v30)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)((char *)v283 + 12) = 0;
        goto LABEL_50;
      }
    }
    else
    {
      v252 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v252 userInterfaceIdiom] != 1)
      {
        *(void *)((char *)v283 + 12) = 0x100000000;
        goto LABEL_50;
      }
    }
    LODWORD(v283[1]) = v30 ^ 1;
    uint64_t v27 = __sb__runningInSpringBoard();
    if (v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v249 = [MEMORY[0x1E4F42D90] mainScreen];
      [v249 _referenceBounds];
    }
    HIDWORD(v283[0]) = v27 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      uint64_t v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v259 = 0;
      uint64_t v261 = 0;
      uint64_t v263 = 0;
      uint64_t v265 = 0;
      uint64_t v267 = 0;
      uint64_t v272 = 0;
      int v271 = 0;
      int v275 = 0;
      int v279 = 0;
      int v269 = 0;
      int v277 = 0;
      memset(v281, 0, sizeof(v281));
      uint64_t v282 = 0;
      *(void *)((char *)v283 + 4) = 0;
      v41 = &qword_1D8505CE8;
      goto LABEL_77;
    }
LABEL_50:
    int v32 = __sb__runningInSpringBoard();
    if (v32)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)((char *)v283 + 4) = 0;
        goto LABEL_60;
      }
    }
    else
    {
      v251 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v251 userInterfaceIdiom] != 1)
      {
        *(void *)((char *)v283 + 4) = 0x100000000;
        goto LABEL_60;
      }
    }
    DWORD2(v283[0]) = v32 ^ 1;
    uint64_t v27 = __sb__runningInSpringBoard();
    if (v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v247 = [MEMORY[0x1E4F42D90] mainScreen];
      [v247 _referenceBounds];
    }
    DWORD1(v283[0]) = v27 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      uint64_t v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v259 = 0;
      uint64_t v261 = 0;
      uint64_t v263 = 0;
      uint64_t v265 = 0;
      uint64_t v267 = 0;
      uint64_t v272 = 0;
      int v271 = 0;
      int v275 = 0;
      int v279 = 0;
      int v269 = 0;
      int v277 = 0;
      memset(v281, 0, sizeof(v281));
      uint64_t v282 = 0;
      v41 = &qword_1D8505CD8;
      goto LABEL_77;
    }
LABEL_60:
    int v43 = __sb__runningInSpringBoard();
    if (v43)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v282 = 0;
        goto LABEL_255;
      }
    }
    else
    {
      v250 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v250 userInterfaceIdiom] != 1)
      {
        uint64_t v282 = 0x100000000;
        goto LABEL_255;
      }
    }
    HIDWORD(v282) = v43 ^ 1;
    uint64_t v27 = __sb__runningInSpringBoard();
    if (v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v244 = [MEMORY[0x1E4F42D90] mainScreen];
      [v244 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v282) = v27 ^ 1;
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      uint64_t v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      int v38 = 0;
      int v39 = 0;
      int v40 = 0;
      int v259 = 0;
      uint64_t v261 = 0;
      uint64_t v263 = 0;
      uint64_t v265 = 0;
      uint64_t v267 = 0;
      uint64_t v272 = 0;
      int v271 = 0;
      int v275 = 0;
      int v279 = 0;
      int v269 = 0;
      int v277 = 0;
      memset(v281, 0, sizeof(v281));
      v41 = &qword_1D8505CD0;
      goto LABEL_77;
    }
LABEL_255:
    uint64_t v27 = __sb__runningInSpringBoard();
    if (v27)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_257;
      }
    }
    else
    {
      v248 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v248 userInterfaceIdiom] != 1)
      {
LABEL_257:
        *(_DWORD *)&v281[64] = v27 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_261:
          *(void *)&v281[44] = 0;
          goto LABEL_467;
        }
        int v66 = __sb__runningInSpringBoard();
        if (v66)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_261;
          }
        }
        else
        {
          v242 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v242 userInterfaceIdiom])
          {
            *(_DWORD *)&v281[44] = 0;
            *(_DWORD *)&v281[48] = 1;
            goto LABEL_467;
          }
        }
        *(_DWORD *)&v281[48] = v66 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v235 = [MEMORY[0x1E4F42D90] mainScreen];
            [v235 _referenceBounds];
          }
          *(_DWORD *)&v281[44] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v100 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            uint64_t v265 = 0;
            uint64_t v267 = 0;
            uint64_t v272 = 0;
            int v271 = 0;
            int v275 = 0;
            int v279 = 0;
            int v269 = 0;
            int v277 = 0;
            memset(v281, 0, 44);
            *(void *)&v281[52] = 0;
            *(_DWORD *)&v281[60] = 0;
            v41 = &qword_1D8505CA0;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[44] = 0;
        }
LABEL_467:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[40] = 0;
            *(_DWORD *)&v281[60] = 0;
            goto LABEL_477;
          }
        }
        else
        {
          v243 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v243 userInterfaceIdiom])
          {
            *(_DWORD *)&v281[40] = 0;
            *(_DWORD *)&v281[60] = 1;
            goto LABEL_477;
          }
        }
        *(_DWORD *)&v281[60] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v238 = [MEMORY[0x1E4F42D90] mainScreen];
            [v238 _referenceBounds];
          }
          *(_DWORD *)&v281[40] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v98 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_481;
          }
        }
        else
        {
          *(_DWORD *)&v281[40] = 0;
        }
LABEL_477:
        if (_SBF_Private_IsD94Like())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          uint64_t v263 = 0;
          uint64_t v265 = 0;
          uint64_t v267 = 0;
          uint64_t v272 = 0;
          int v271 = 0;
          int v275 = 0;
          int v279 = 0;
          int v269 = 0;
          int v277 = 0;
          memset(v281, 0, 40);
          *(void *)&v281[52] = 0;
          v41 = &qword_1D8505CA8;
          goto LABEL_77;
        }
LABEL_481:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_485:
          *(void *)&v281[32] = 0;
          goto LABEL_495;
        }
        int v99 = __sb__runningInSpringBoard();
        if (v99)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_485;
          }
        }
        else
        {
          v239 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v239 userInterfaceIdiom])
          {
            *(void *)&v281[32] = 0x100000000;
            goto LABEL_495;
          }
        }
        *(_DWORD *)&v281[36] = v99 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v230 = [MEMORY[0x1E4F42D90] mainScreen];
            [v230 _referenceBounds];
          }
          *(_DWORD *)&v281[32] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v108 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            uint64_t v265 = 0;
            uint64_t v267 = 0;
            uint64_t v272 = 0;
            int v271 = 0;
            int v275 = 0;
            int v279 = 0;
            int v269 = 0;
            int v277 = 0;
            memset(v281, 0, 32);
            *(void *)&v281[52] = 0;
            v41 = &qword_1D8505CB0;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[32] = 0;
        }
LABEL_495:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[28] = 0;
            *(_DWORD *)&v281[56] = 0;
            goto LABEL_505;
          }
        }
        else
        {
          v241 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v241 userInterfaceIdiom])
          {
            *(_DWORD *)&v281[28] = 0;
            *(_DWORD *)&v281[56] = 1;
            goto LABEL_505;
          }
        }
        *(_DWORD *)&v281[56] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v234 = [MEMORY[0x1E4F42D90] mainScreen];
            [v234 _referenceBounds];
          }
          *(_DWORD *)&v281[28] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v101 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_509;
          }
        }
        else
        {
          *(_DWORD *)&v281[28] = 0;
        }
LABEL_505:
        if (_SBF_Private_IsD64Like())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          uint64_t v263 = 0;
          uint64_t v265 = 0;
          uint64_t v267 = 0;
          uint64_t v272 = 0;
          int v271 = 0;
          int v275 = 0;
          int v279 = 0;
          int v269 = 0;
          int v277 = 0;
          memset(v281, 0, 28);
          *(_DWORD *)&v281[52] = 0;
          v41 = &qword_1D8505CB8;
          goto LABEL_77;
        }
LABEL_509:
        int v102 = __sb__runningInSpringBoard();
        if (v102)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[24] = 0;
            *(_DWORD *)&v281[52] = 0;
            goto LABEL_519;
          }
        }
        else
        {
          v240 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v240 userInterfaceIdiom])
          {
            *(_DWORD *)&v281[24] = 0;
            *(_DWORD *)&v281[52] = 1;
            goto LABEL_519;
          }
        }
        *(_DWORD *)&v281[52] = v102 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v231 = [MEMORY[0x1E4F42D90] mainScreen];
            [v231 _referenceBounds];
          }
          BSSizeRoundForScale();
          *(_DWORD *)&v281[24] = v27 ^ 1;
          if (v107 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            uint64_t v265 = 0;
            uint64_t v267 = 0;
            uint64_t v272 = 0;
            int v271 = 0;
            int v275 = 0;
            int v279 = 0;
            int v269 = 0;
            int v277 = 0;
            memset(v281, 0, 24);
            v41 = &qword_1D8505C90;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[24] = 0;
        }
LABEL_519:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v281[4] = 0;
            *(_DWORD *)&v281[20] = 0;
            goto LABEL_579;
          }
        }
        else
        {
          v237 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v237 userInterfaceIdiom])
          {
            *(_DWORD *)&v281[4] = 0;
            *(_DWORD *)&v281[20] = 1;
            goto LABEL_579;
          }
        }
        *(_DWORD *)&v281[20] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v229 = [MEMORY[0x1E4F42D90] mainScreen];
            [v229 _referenceBounds];
          }
          *(_DWORD *)&v281[4] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v111 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_595;
          }
        }
        else
        {
          *(_DWORD *)&v281[4] = 0;
        }
LABEL_579:
        if (_SBF_Private_IsD54())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          uint64_t v263 = 0;
          uint64_t v265 = 0;
          uint64_t v267 = 0;
          uint64_t v272 = 0;
          int v271 = 0;
          int v275 = 0;
          int v279 = 0;
          int v269 = 0;
          int v277 = 0;
          *(_DWORD *)v281 = 0;
          *(void *)&v281[8] = 0;
          *(_DWORD *)&v281[16] = 0;
          v41 = &qword_1D8505C98;
          goto LABEL_77;
        }
LABEL_595:
        int v112 = __sb__runningInSpringBoard();
        if (v112)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)&v281[12] = 0;
            goto LABEL_605;
          }
        }
        else
        {
          v236 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v236 userInterfaceIdiom])
          {
            *(void *)&v281[12] = 0x100000000;
            goto LABEL_605;
          }
        }
        *(_DWORD *)&v281[16] = v112 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v226 = [MEMORY[0x1E4F42D90] mainScreen];
            [v226 _referenceBounds];
          }
          *(_DWORD *)&v281[12] = v27 ^ 1;
          BSSizeRoundForScale();
          if (v121 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            uint64_t v265 = 0;
            uint64_t v267 = 0;
            uint64_t v272 = 0;
            int v271 = 0;
            int v275 = 0;
            int v279 = 0;
            int v269 = 0;
            int v277 = 0;
            *(_DWORD *)v281 = 0;
            *(_DWORD *)&v281[8] = 0;
            v41 = &qword_1D8505C60;
            goto LABEL_77;
          }
        }
        else
        {
          *(_DWORD *)&v281[12] = 0;
        }
LABEL_605:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v281 = 0;
            *(_DWORD *)&v281[8] = 0;
            goto LABEL_683;
          }
        }
        else
        {
          v233 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v233 userInterfaceIdiom])
          {
            *(_DWORD *)v281 = 0;
            *(_DWORD *)&v281[8] = 1;
            goto LABEL_683;
          }
        }
        *(_DWORD *)&v281[8] = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v225 = [MEMORY[0x1E4F42D90] mainScreen];
            [v225 _referenceBounds];
          }
          *(_DWORD *)v281 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_716;
          }
        }
        else
        {
          *(_DWORD *)v281 = 0;
        }
LABEL_683:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          uint64_t v263 = 0;
          uint64_t v265 = 0;
          uint64_t v267 = 0;
          uint64_t v272 = 0;
          int v271 = 0;
          int v275 = 0;
          int v279 = 0;
          int v269 = 0;
          int v277 = 0;
          v41 = &qword_1D8505C68;
          goto LABEL_77;
        }
LABEL_716:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_720:
          int v269 = 0;
          int v277 = 0;
          goto LABEL_777;
        }
        int v125 = __sb__runningInSpringBoard();
        if (v125)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_720;
          }
        }
        else
        {
          v228 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v228 userInterfaceIdiom])
          {
            int v269 = 0;
            int v277 = 1;
            goto LABEL_777;
          }
        }
        int v277 = v125 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v219 = [MEMORY[0x1E4F42D90] mainScreen];
            [v219 _referenceBounds];
          }
          BSSizeRoundForScale();
          int v269 = v27 ^ 1;
          if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            uint64_t v265 = 0;
            uint64_t v267 = 0;
            uint64_t v272 = 0;
            int v271 = 0;
            int v275 = 0;
            int v279 = 0;
            v41 = &qword_1D8505C50;
            goto LABEL_77;
          }
        }
        else
        {
          int v269 = 0;
        }
LABEL_777:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v275 = 0;
            int v279 = 0;
            goto LABEL_787;
          }
        }
        else
        {
          v232 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v232 userInterfaceIdiom])
          {
            int v275 = 0;
            int v279 = 1;
            goto LABEL_787;
          }
        }
        int v279 = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v222 = [MEMORY[0x1E4F42D90] mainScreen];
            [v222 _referenceBounds];
          }
          int v275 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v132 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_791;
          }
        }
        else
        {
          int v275 = 0;
        }
LABEL_787:
        if (_SBF_Private_IsD93Like())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          uint64_t v263 = 0;
          uint64_t v265 = 0;
          uint64_t v267 = 0;
          uint64_t v272 = 0;
          int v271 = 0;
          v41 = &qword_1D8505C58;
          goto LABEL_77;
        }
LABEL_791:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_795:
          HIDWORD(v267) = 0;
          int v271 = 0;
          goto LABEL_831;
        }
        int v133 = __sb__runningInSpringBoard();
        if (v133)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_795;
          }
        }
        else
        {
          v223 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v223 userInterfaceIdiom])
          {
            HIDWORD(v267) = 0;
            int v271 = 1;
            goto LABEL_831;
          }
        }
        int v271 = v133 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v215 = [MEMORY[0x1E4F42D90] mainScreen];
            [v215 _referenceBounds];
          }
          HIDWORD(v267) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v148 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            uint64_t v265 = 0;
            LODWORD(v267) = 0;
            uint64_t v272 = 0;
            v41 = &qword_1D8505C80;
            goto LABEL_77;
          }
        }
        else
        {
          HIDWORD(v267) = 0;
        }
LABEL_831:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v272 = 0;
            goto LABEL_841;
          }
        }
        else
        {
          v227 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v227 userInterfaceIdiom])
          {
            uint64_t v272 = 0x100000000;
            goto LABEL_841;
          }
        }
        HIDWORD(v272) = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v218 = [MEMORY[0x1E4F42D90] mainScreen];
            [v218 _referenceBounds];
          }
          LODWORD(v272) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v141 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_845;
          }
        }
        else
        {
          LODWORD(v272) = 0;
        }
LABEL_841:
        if (_SBF_Private_IsD63Like())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          uint64_t v263 = 0;
          uint64_t v265 = 0;
          LODWORD(v267) = 0;
          v41 = &qword_1D8505C88;
          goto LABEL_77;
        }
LABEL_845:
        int v142 = __sb__runningInSpringBoard();
        if (v142)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v265) = 0;
            LODWORD(v267) = 0;
            goto LABEL_855;
          }
        }
        else
        {
          v224 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v224 userInterfaceIdiom])
          {
            LODWORD(v265) = 0;
            LODWORD(v267) = 1;
            goto LABEL_855;
          }
        }
        LODWORD(v267) = v142 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v216 = [MEMORY[0x1E4F42D90] mainScreen];
            [v216 _referenceBounds];
          }
          BSSizeRoundForScale();
          LODWORD(v265) = v27 ^ 1;
          if (v147 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            uint64_t v261 = 0;
            uint64_t v263 = 0;
            HIDWORD(v265) = 0;
            v41 = &qword_1D8505C70;
            goto LABEL_77;
          }
        }
        else
        {
          LODWORD(v265) = 0;
        }
LABEL_855:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v263) = 0;
            HIDWORD(v265) = 0;
            goto LABEL_915;
          }
        }
        else
        {
          v221 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v221 userInterfaceIdiom])
          {
            HIDWORD(v263) = 0;
            HIDWORD(v265) = 1;
            goto LABEL_915;
          }
        }
        HIDWORD(v265) = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v214 = [MEMORY[0x1E4F42D90] mainScreen];
            [v214 _referenceBounds];
          }
          HIDWORD(v263) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v151 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_931;
          }
        }
        else
        {
          HIDWORD(v263) = 0;
        }
LABEL_915:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          int v259 = 0;
          uint64_t v261 = 0;
          LODWORD(v263) = 0;
          v41 = &qword_1D8505C78;
          goto LABEL_77;
        }
LABEL_931:
        int v152 = __sb__runningInSpringBoard();
        if (v152)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v261) = 0;
            LODWORD(v263) = 0;
            goto LABEL_941;
          }
        }
        else
        {
          v220 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v220 userInterfaceIdiom])
          {
            HIDWORD(v261) = 0;
            LODWORD(v263) = 1;
            goto LABEL_941;
          }
        }
        LODWORD(v263) = v152 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v213 = [MEMORY[0x1E4F42D90] mainScreen];
            [v213 _referenceBounds];
          }
          HIDWORD(v261) = v27 ^ 1;
          BSSizeRoundForScale();
          if (v159 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            int v259 = 0;
            LODWORD(v261) = 0;
            v41 = &qword_1D8505C40;
            goto LABEL_77;
          }
        }
        else
        {
          HIDWORD(v261) = 0;
        }
LABEL_941:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v259 = 0;
            LODWORD(v261) = 0;
            goto LABEL_1031;
          }
        }
        else
        {
          v217 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v217 userInterfaceIdiom])
          {
            int v259 = 0;
            LODWORD(v261) = 1;
            goto LABEL_1031;
          }
        }
        LODWORD(v261) = v27 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v212 = [MEMORY[0x1E4F42D90] mainScreen];
            [v212 _referenceBounds];
          }
          int v259 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v166 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1066;
          }
        }
        else
        {
          int v259 = 0;
        }
LABEL_1031:
        if (_SBF_Private_IsD53())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          v41 = &qword_1D8505C48;
          goto LABEL_77;
        }
LABEL_1066:
        if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          v41 = &qword_1D8505C20;
          goto LABEL_77;
        }
        if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          v41 = &qword_1D8505C28;
          goto LABEL_77;
        }
        if (_SBF_Private_IsD52OrSimilarDevice())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          v41 = &qword_1D8505C10;
          goto LABEL_77;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
        {
          uint64_t v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          int v39 = 0;
          int v40 = 0;
          v41 = &qword_1D8505C18;
          goto LABEL_77;
        }
        int v168 = __sb__runningInSpringBoard();
        if (v168)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v39 = 0;
            int v40 = 0;
            goto LABEL_1166;
          }
        }
        else
        {
          v211 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v211 userInterfaceIdiom])
          {
            int v39 = 0;
            int v40 = 1;
            goto LABEL_1166;
          }
        }
        int v40 = v168 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v206 = [MEMORY[0x1E4F42D90] mainScreen];
            [v206 _referenceBounds];
          }
          int v39 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v183 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v37 = 0;
            int v38 = 0;
            v41 = &qword_1D8505C30;
            goto LABEL_77;
          }
        }
        else
        {
          int v39 = 0;
        }
LABEL_1166:
        int v180 = __sb__runningInSpringBoard();
        if (v180)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v37 = 0;
            int v38 = 0;
            goto LABEL_1176;
          }
        }
        else
        {
          v210 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v210 userInterfaceIdiom])
          {
            int v37 = 0;
            int v38 = 1;
            goto LABEL_1176;
          }
        }
        int v38 = v180 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v27 = __sb__runningInSpringBoard();
          if (v27)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v205 = [MEMORY[0x1E4F42D90] mainScreen];
            [v205 _referenceBounds];
          }
          int v37 = v27 ^ 1;
          BSSizeRoundForScale();
          if (v184 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            uint64_t v33 = 0;
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            v41 = &qword_1D8505C38;
            goto LABEL_77;
          }
        }
        else
        {
          int v37 = 0;
        }
LABEL_1176:
        int v181 = __sb__runningInSpringBoard();
        if (v181)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v33 = 0;
            int v36 = 0;
            goto LABEL_1186;
          }
        }
        else
        {
          v209 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v209 userInterfaceIdiom])
          {
            uint64_t v33 = 0;
            int v36 = 1;
            goto LABEL_1186;
          }
        }
        int v36 = v181 ^ 1;
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          v207 = [MEMORY[0x1E4F42D90] mainScreen];
          [v207 _referenceBounds];
        }
        uint64_t v33 = v27 ^ 1;
        BSSizeRoundForScale();
        if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
        {
          int v34 = 0;
          int v35 = 0;
          v41 = &qword_1D8505C08;
          goto LABEL_77;
        }
LABEL_1186:
        uint64_t v27 = __sb__runningInSpringBoard();
        if (v27)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v34 = 0;
            int v35 = 0;
            goto LABEL_1203;
          }
        }
        else
        {
          v208 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v208 userInterfaceIdiom])
          {
            int v35 = 0;
            int v34 = 1;
            goto LABEL_1203;
          }
        }
        int v34 = v27 ^ 1;
        int v185 = __sb__runningInSpringBoard();
        if (v185)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v27 = [MEMORY[0x1E4F42D90] mainScreen];
          [(id)v27 _referenceBounds];
        }
        int v35 = v185 ^ 1;
        BSSizeRoundForScale();
        if (v186 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
        {
          v41 = &qword_1D8505C00;
LABEL_77:
          double v48 = *(double *)v41;
          if (v35) {

          }
          if (v34) {
          v49 = (void *)0x1E4F42000;
          }
          if (v33)
          {

            if (!v36) {
              goto LABEL_83;
            }
          }
          else if (!v36)
          {
LABEL_83:
            if (!v37) {
              goto LABEL_85;
            }
            goto LABEL_84;
          }

          if (!v37)
          {
LABEL_85:
            if (v38)
            {

              if (!v39) {
                goto LABEL_87;
              }
            }
            else if (!v39)
            {
LABEL_87:
              if (!v40) {
                goto LABEL_89;
              }
              goto LABEL_88;
            }

            if (!v40)
            {
LABEL_89:
              if (v259) {

              }
              if (v261) {
              if (HIDWORD(v261))
              }

              if (v263) {
              if (HIDWORD(v263))
              }

              if (HIDWORD(v265)) {
              if (v265)
              }

              if (v267) {
              if (v272)
              }

              if (HIDWORD(v272)) {
              if (HIDWORD(v267))
              }

              if (v271) {
              if (v275)
              }

              if (v279) {
              if (v269)
              }

              if (v277) {
              if (*(_DWORD *)v281)
              }

              if (*(_DWORD *)&v281[8]) {
              if (*(_DWORD *)&v281[12])
              }

              if (*(_DWORD *)&v281[16]) {
              if (*(_DWORD *)&v281[4])
              }

              if (*(_DWORD *)&v281[20]) {
              if (*(_DWORD *)&v281[24])
              }

              if (*(_DWORD *)&v281[52]) {
              if (*(_DWORD *)&v281[28])
              }

              if (*(_DWORD *)&v281[56]) {
              if (*(_DWORD *)&v281[32])
              }

              if (*(_DWORD *)&v281[36]) {
              if (*(_DWORD *)&v281[40])
              }

              if (*(_DWORD *)&v281[60]) {
              if (*(_DWORD *)&v281[44])
              }

              if (*(_DWORD *)&v281[48]) {
              if (*(_DWORD *)&v281[64])
              }

              if (v282) {
              if (HIDWORD(v282))
              }

              if (DWORD1(v283[0])) {
              if (DWORD2(v283[0]))
              }

              if (HIDWORD(v283[0])) {
              if (LODWORD(v283[1]))
              }

              if (DWORD1(v283[1])) {
              if (DWORD2(v283[1]))
              }

              if (LODWORD(v283[0])) {
              if (HIDWORD(v283[1]))
              }

              if (v284) {
              if (HIDWORD(v284))
              }

              double v50 = v48 + 0.0;
              int v51 = __sb__runningInSpringBoard();
              int v52 = v51;
              if (v5)
              {
                v53 = &CSQuickActionButtonInsetY;
                if (v51)
                {
                  if (SBFEffectiveDeviceClass() != 2)
                  {
                    uint64_t v284 = 0;
LABEL_202:
                    int v56 = __sb__runningInSpringBoard();
                    if (v56)
                    {
                      if (SBFEffectiveDeviceClass() != 2)
                      {
                        LODWORD(v282) = 0;
                        *(_DWORD *)&v281[60] = 0;
LABEL_220:
                        int v60 = __sb__runningInSpringBoard();
                        if (v60)
                        {
                          if (SBFEffectiveDeviceClass() != 2)
                          {
                            *((void *)&v283[1] + 1) = 0;
LABEL_238:
                            int v63 = __sb__runningInSpringBoard();
                            if (v63)
                            {
                              if (SBFEffectiveDeviceClass() != 2)
                              {
                                *(void *)&v283[1] = 0;
LABEL_268:
                                int v68 = __sb__runningInSpringBoard();
                                if (v68)
                                {
                                  if (SBFEffectiveDeviceClass() != 2)
                                  {
                                    *((void *)&v283[0] + 1) = 0;
LABEL_287:
                                    int v79 = __sb__runningInSpringBoard();
                                    if (v79)
                                    {
                                      if (SBFEffectiveDeviceClass() != 2)
                                      {
                                        *(void *)&v283[0] = 0;
LABEL_435:
                                        uint64_t v61 = __sb__runningInSpringBoard();
                                        if (v61)
                                        {
                                          if (SBFEffectiveDeviceClass() == 2) {
                                            goto LABEL_456;
                                          }
LABEL_439:
                                          HIDWORD(v282) = v61 ^ 1;
                                          if (!_SBF_Private_IsD94Like())
                                          {
LABEL_443:
                                            *(void *)&v281[52] = 0;
                                            goto LABEL_529;
                                          }
                                          int v95 = __sb__runningInSpringBoard();
                                          if (v95)
                                          {
                                            if (SBFEffectiveDeviceClass()
                                              && SBFEffectiveDeviceClass() != 1)
                                            {
                                              goto LABEL_443;
                                            }
                                          }
                                          else
                                          {
                                            v240 = [MEMORY[0x1E4F42948] currentDevice];
                                            if ([v240 userInterfaceIdiom])
                                            {
                                              *(_DWORD *)&v281[52] = 0;
                                              *(_DWORD *)&v281[56] = 1;
                                              goto LABEL_529;
                                            }
                                          }
                                          *(_DWORD *)&v281[56] = v95 ^ 1;
                                          if (SBFEffectiveHomeButtonType() == 2)
                                          {
                                            uint64_t v61 = __sb__runningInSpringBoard();
                                            if (v61)
                                            {
                                              __sb__mainScreenReferenceBounds();
                                            }
                                            else
                                            {
                                              v233 = [MEMORY[0x1E4F42D90] mainScreen];
                                              [v233 _referenceBounds];
                                            }
                                            *(_DWORD *)&v281[52] = v61 ^ 1;
                                            BSSizeRoundForScale();
                                            if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
                                            {
LABEL_592:
                                              *(_DWORD *)&v281[64] = 0;
                                              memset(v281, 0, 52);
                                              int v276 = 0;
                                              int v274 = 0;
                                              int v280 = 0;
                                              int v278 = 0;
                                              uint64_t v268 = 0;
                                              uint64_t v270 = 0;
                                              int v273 = 0;
                                              uint64_t v264 = 0;
                                              uint64_t v266 = 0;
                                              uint64_t v262 = 0;
                                              int v260 = 0;
                                              int v258 = 0;
                                              int v256 = 0;
                                              int v71 = 0;
                                              int v72 = 0;
                                              int v73 = 0;
                                              int v74 = 0;
                                              int v75 = 0;
                                              int v76 = 0;
                                              v77 = v53 + 21;
                                              goto LABEL_323;
                                            }
                                          }
                                          else
                                          {
                                            *(_DWORD *)&v281[52] = 0;
                                          }
LABEL_529:
                                          uint64_t v61 = __sb__runningInSpringBoard();
                                          if (v61)
                                          {
                                            if (SBFEffectiveDeviceClass()
                                              && SBFEffectiveDeviceClass() != 1)
                                            {
                                              *(_DWORD *)&v281[64] = 0;
                                              *(_DWORD *)&v281[48] = 0;
                                              goto LABEL_539;
                                            }
                                          }
                                          else
                                          {
                                            v241 = [MEMORY[0x1E4F42948] currentDevice];
                                            if ([v241 userInterfaceIdiom])
                                            {
                                              *(_DWORD *)&v281[48] = 0;
                                              *(_DWORD *)&v281[64] = 1;
LABEL_539:
                                              if ((_SBF_Private_IsD94Like() & 1) == 0) {
                                                goto LABEL_543;
                                              }
LABEL_565:
                                              memset(v281, 0, 48);
                                              int v276 = 0;
                                              int v274 = 0;
                                              int v280 = 0;
                                              int v278 = 0;
                                              uint64_t v268 = 0;
                                              uint64_t v270 = 0;
                                              int v273 = 0;
                                              uint64_t v264 = 0;
                                              uint64_t v266 = 0;
                                              uint64_t v262 = 0;
                                              int v260 = 0;
                                              int v258 = 0;
                                              int v256 = 0;
                                              int v71 = 0;
                                              int v72 = 0;
                                              int v73 = 0;
                                              int v74 = 0;
                                              int v75 = 0;
                                              int v76 = 0;
                                              v77 = v53 + 22;
                                              goto LABEL_323;
                                            }
                                          }
                                          *(_DWORD *)&v281[64] = v61 ^ 1;
                                          if (SBFEffectiveHomeButtonType() == 2)
                                          {
                                            uint64_t v61 = __sb__runningInSpringBoard();
                                            if (v61)
                                            {
                                              __sb__mainScreenReferenceBounds();
                                            }
                                            else
                                            {
                                              v236 = [MEMORY[0x1E4F42D90] mainScreen];
                                              [v236 _referenceBounds];
                                            }
                                            *(_DWORD *)&v281[48] = v61 ^ 1;
                                            BSSizeRoundForScale();
                                            if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
                                            {
LABEL_543:
                                              if (!_SBF_Private_IsD64Like())
                                              {
LABEL_547:
                                                *(void *)&v281[40] = 0;
                                                goto LABEL_615;
                                              }
                                              int v104 = __sb__runningInSpringBoard();
                                              if (v104)
                                              {
                                                if (SBFEffectiveDeviceClass()
                                                  && SBFEffectiveDeviceClass() != 1)
                                                {
                                                  goto LABEL_547;
                                                }
                                              }
                                              else
                                              {
                                                v237 = [MEMORY[0x1E4F42948] currentDevice];
                                                if ([v237 userInterfaceIdiom])
                                                {
                                                  *(_DWORD *)&v281[40] = 0;
                                                  *(_DWORD *)&v281[44] = 1;
                                                  goto LABEL_615;
                                                }
                                              }
                                              *(_DWORD *)&v281[44] = v104 ^ 1;
                                              if (SBFEffectiveHomeButtonType() == 2)
                                              {
                                                uint64_t v61 = __sb__runningInSpringBoard();
                                                if (v61)
                                                {
                                                  __sb__mainScreenReferenceBounds();
                                                }
                                                else
                                                {
                                                  v228 = [MEMORY[0x1E4F42D90] mainScreen];
                                                  [v228 _referenceBounds];
                                                }
                                                *(_DWORD *)&v281[40] = v61 ^ 1;
                                                BSSizeRoundForScale();
                                                if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
                                                {
LABEL_713:
                                                  memset(v281, 0, 40);
                                                  int v276 = 0;
                                                  int v274 = 0;
                                                  int v280 = 0;
                                                  int v278 = 0;
                                                  uint64_t v268 = 0;
                                                  uint64_t v270 = 0;
                                                  int v273 = 0;
                                                  uint64_t v264 = 0;
                                                  uint64_t v266 = 0;
                                                  uint64_t v262 = 0;
                                                  int v260 = 0;
                                                  int v258 = 0;
                                                  int v256 = 0;
                                                  int v71 = 0;
                                                  int v72 = 0;
                                                  int v73 = 0;
                                                  int v74 = 0;
                                                  int v75 = 0;
                                                  int v76 = 0;
                                                  v77 = v53 + 23;
                                                  goto LABEL_323;
                                                }
                                              }
                                              else
                                              {
                                                *(_DWORD *)&v281[40] = 0;
                                              }
LABEL_615:
                                              uint64_t v61 = __sb__runningInSpringBoard();
                                              if (v61)
                                              {
                                                if (SBFEffectiveDeviceClass()
                                                  && SBFEffectiveDeviceClass() != 1)
                                                {
                                                  *(_DWORD *)&v281[36] = 0;
                                                  *(_DWORD *)&v281[28] = 0;
                                                  goto LABEL_625;
                                                }
                                              }
                                              else
                                              {
                                                v239 = [MEMORY[0x1E4F42948] currentDevice];
                                                if ([v239 userInterfaceIdiom])
                                                {
                                                  *(_DWORD *)&v281[28] = 0;
                                                  *(_DWORD *)&v281[36] = 1;
LABEL_625:
                                                  if ((_SBF_Private_IsD64Like() & 1) == 0) {
                                                    goto LABEL_629;
                                                  }
LABEL_660:
                                                  *(_DWORD *)&v281[32] = 0;
                                                  memset(v281, 0, 28);
                                                  int v276 = 0;
                                                  int v274 = 0;
                                                  int v280 = 0;
                                                  int v278 = 0;
                                                  uint64_t v268 = 0;
                                                  uint64_t v270 = 0;
                                                  int v273 = 0;
                                                  uint64_t v264 = 0;
                                                  uint64_t v266 = 0;
                                                  uint64_t v262 = 0;
                                                  int v260 = 0;
                                                  int v258 = 0;
                                                  int v256 = 0;
                                                  int v71 = 0;
                                                  int v72 = 0;
                                                  int v73 = 0;
                                                  int v74 = 0;
                                                  int v75 = 0;
                                                  int v76 = 0;
                                                  v77 = v53 + 24;
                                                  goto LABEL_323;
                                                }
                                              }
                                              *(_DWORD *)&v281[36] = v61 ^ 1;
                                              if (SBFEffectiveHomeButtonType() == 2)
                                              {
                                                uint64_t v61 = __sb__runningInSpringBoard();
                                                if (v61)
                                                {
                                                  __sb__mainScreenReferenceBounds();
                                                }
                                                else
                                                {
                                                  v232 = [MEMORY[0x1E4F42D90] mainScreen];
                                                  [v232 _referenceBounds];
                                                }
                                                *(_DWORD *)&v281[28] = v61 ^ 1;
                                                BSSizeRoundForScale();
                                                if (v113 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
                                                {
LABEL_629:
                                                  int v114 = __sb__runningInSpringBoard();
                                                  if (v114)
                                                  {
                                                    if (SBFEffectiveDeviceClass()
                                                      && SBFEffectiveDeviceClass() != 1)
                                                    {
                                                      *(_DWORD *)&v281[32] = 0;
                                                      *(_DWORD *)&v281[24] = 0;
                                                      goto LABEL_639;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v238 = [MEMORY[0x1E4F42948] currentDevice];
                                                    if ([v238 userInterfaceIdiom])
                                                    {
                                                      *(_DWORD *)&v281[24] = 0;
                                                      *(_DWORD *)&v281[32] = 1;
                                                      goto LABEL_639;
                                                    }
                                                  }
                                                  *(_DWORD *)&v281[32] = v114 ^ 1;
                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                  {
                                                    int v115 = __sb__runningInSpringBoard();
                                                    if (v115)
                                                    {
                                                      __sb__mainScreenReferenceBounds();
                                                    }
                                                    else
                                                    {
                                                      v229 = [MEMORY[0x1E4F42D90] mainScreen];
                                                      [v229 _referenceBounds];
                                                    }
                                                    uint64_t v61 = v115 ^ 1u;
                                                    BSSizeRoundForScale();
                                                    *(_DWORD *)&v281[24] = v61;
                                                    if (v119 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
                                                    {
LABEL_703:
                                                      memset(v281, 0, 24);
                                                      int v276 = 0;
                                                      int v274 = 0;
                                                      int v280 = 0;
                                                      int v278 = 0;
                                                      uint64_t v268 = 0;
                                                      uint64_t v270 = 0;
                                                      int v273 = 0;
                                                      uint64_t v264 = 0;
                                                      uint64_t v266 = 0;
                                                      uint64_t v262 = 0;
                                                      int v260 = 0;
                                                      int v258 = 0;
                                                      int v256 = 0;
                                                      int v71 = 0;
                                                      int v72 = 0;
                                                      int v73 = 0;
                                                      int v74 = 0;
                                                      int v75 = 0;
                                                      int v76 = 0;
                                                      v77 = v53 + 19;
                                                      goto LABEL_323;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    *(_DWORD *)&v281[24] = 0;
                                                  }
LABEL_639:
                                                  uint64_t v61 = __sb__runningInSpringBoard();
                                                  if (v61)
                                                  {
                                                    if (SBFEffectiveDeviceClass()
                                                      && SBFEffectiveDeviceClass() != 1)
                                                    {
                                                      *(_DWORD *)&v281[12] = 0;
                                                      *(_DWORD *)v281 = 0;
                                                      goto LABEL_690;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v235 = [MEMORY[0x1E4F42948] currentDevice];
                                                    if ([v235 userInterfaceIdiom])
                                                    {
                                                      *(_DWORD *)v281 = 0;
                                                      *(_DWORD *)&v281[12] = 1;
LABEL_690:
                                                      if ((_SBF_Private_IsD54() & 1) == 0) {
                                                        goto LABEL_725;
                                                      }
LABEL_697:
                                                      *(void *)&v281[16] = 0;
                                                      *(void *)&v281[4] = 0;
                                                      int v276 = 0;
                                                      int v274 = 0;
                                                      int v280 = 0;
                                                      int v278 = 0;
                                                      uint64_t v268 = 0;
                                                      uint64_t v270 = 0;
                                                      int v273 = 0;
                                                      uint64_t v264 = 0;
                                                      uint64_t v266 = 0;
                                                      uint64_t v262 = 0;
                                                      int v260 = 0;
                                                      int v258 = 0;
                                                      int v256 = 0;
                                                      int v71 = 0;
                                                      int v72 = 0;
                                                      int v73 = 0;
                                                      int v74 = 0;
                                                      int v75 = 0;
                                                      int v76 = 0;
                                                      v77 = v53 + 20;
                                                      goto LABEL_323;
                                                    }
                                                  }
                                                  *(_DWORD *)&v281[12] = v61 ^ 1;
                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                  {
                                                    uint64_t v61 = __sb__runningInSpringBoard();
                                                    if (v61)
                                                    {
                                                      __sb__mainScreenReferenceBounds();
                                                    }
                                                    else
                                                    {
                                                      v227 = [MEMORY[0x1E4F42D90] mainScreen];
                                                      [v227 _referenceBounds];
                                                    }
                                                    *(_DWORD *)v281 = v61 ^ 1;
                                                    BSSizeRoundForScale();
                                                    if (v126 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
                                                    {
LABEL_725:
                                                      int v127 = __sb__runningInSpringBoard();
                                                      if (v127)
                                                      {
                                                        if (SBFEffectiveDeviceClass()
                                                          && SBFEffectiveDeviceClass() != 1)
                                                        {
                                                          *(void *)&v281[16] = 0;
                                                          goto LABEL_743;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v234 = [MEMORY[0x1E4F42948] currentDevice];
                                                        if ([v234 userInterfaceIdiom])
                                                        {
                                                          *(_DWORD *)&v281[16] = 0;
                                                          *(_DWORD *)&v281[20] = 1;
                                                          goto LABEL_743;
                                                        }
                                                      }
                                                      *(_DWORD *)&v281[20] = v127 ^ 1;
                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                      {
                                                        int v130 = __sb__runningInSpringBoard();
                                                        if (v130)
                                                        {
                                                          __sb__mainScreenReferenceBounds();
                                                        }
                                                        else
                                                        {
                                                          v224 = [MEMORY[0x1E4F42D90] mainScreen];
                                                          [v224 _referenceBounds];
                                                        }
                                                        uint64_t v61 = v130 ^ 1u;
                                                        BSSizeRoundForScale();
                                                        *(_DWORD *)&v281[16] = v61;
                                                        if (v134 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)
                                                          && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
                                                        {
LABEL_805:
                                                          *(void *)&v281[4] = 0;
                                                          int v276 = 0;
                                                          int v274 = 0;
                                                          int v280 = 0;
                                                          int v278 = 0;
                                                          uint64_t v268 = 0;
                                                          uint64_t v270 = 0;
                                                          int v273 = 0;
                                                          uint64_t v264 = 0;
                                                          uint64_t v266 = 0;
                                                          uint64_t v262 = 0;
                                                          int v260 = 0;
                                                          int v258 = 0;
                                                          int v256 = 0;
                                                          int v71 = 0;
                                                          int v72 = 0;
                                                          int v73 = 0;
                                                          int v74 = 0;
                                                          int v75 = 0;
                                                          int v76 = 0;
                                                          v77 = v53 + 13;
                                                          goto LABEL_323;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        *(_DWORD *)&v281[16] = 0;
                                                      }
LABEL_743:
                                                      uint64_t v61 = __sb__runningInSpringBoard();
                                                      if (v61)
                                                      {
                                                        if (SBFEffectiveDeviceClass()
                                                          && SBFEffectiveDeviceClass() != 1)
                                                        {
                                                          *(void *)&v281[4] = 0;
LABEL_763:
                                                          if (!_SBF_Private_IsD33OrSimilarDevice()
                                                            || (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) == 0)
                                                          {
                                                            goto LABEL_808;
                                                          }
LABEL_772:
                                                          int v276 = 0;
                                                          int v274 = 0;
                                                          int v280 = 0;
                                                          int v278 = 0;
                                                          uint64_t v268 = 0;
                                                          uint64_t v270 = 0;
                                                          int v273 = 0;
                                                          uint64_t v264 = 0;
                                                          uint64_t v266 = 0;
                                                          uint64_t v262 = 0;
                                                          int v260 = 0;
                                                          int v258 = 0;
                                                          int v256 = 0;
                                                          int v71 = 0;
                                                          int v72 = 0;
                                                          int v73 = 0;
                                                          int v74 = 0;
                                                          int v75 = 0;
                                                          int v76 = 0;
                                                          v77 = v53 + 14;
                                                          goto LABEL_323;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v231 = [MEMORY[0x1E4F42948] currentDevice];
                                                        if ([v231 userInterfaceIdiom])
                                                        {
                                                          *(_DWORD *)&v281[4] = 0;
                                                          *(_DWORD *)&v281[8] = 1;
                                                          goto LABEL_763;
                                                        }
                                                      }
                                                      *(_DWORD *)&v281[8] = v61 ^ 1;
                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                      {
                                                        uint64_t v61 = __sb__runningInSpringBoard();
                                                        if (v61)
                                                        {
                                                          __sb__mainScreenReferenceBounds();
                                                        }
                                                        else
                                                        {
                                                          v223 = [MEMORY[0x1E4F42D90] mainScreen];
                                                          [v223 _referenceBounds];
                                                        }
                                                        *(_DWORD *)&v281[4] = v61 ^ 1;
                                                        BSSizeRoundForScale();
                                                        if (v136 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
                                                        {
LABEL_808:
                                                          if (!_SBF_Private_IsD93Like())
                                                          {
LABEL_812:
                                                            int v276 = 0;
                                                            int v274 = 0;
                                                            goto LABEL_865;
                                                          }
                                                          int v137 = __sb__runningInSpringBoard();
                                                          if (v137)
                                                          {
                                                            if (SBFEffectiveDeviceClass()
                                                              && SBFEffectiveDeviceClass() != 1)
                                                            {
                                                              goto LABEL_812;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v226 = [MEMORY[0x1E4F42948] currentDevice];
                                                            if ([v226 userInterfaceIdiom])
                                                            {
                                                              int v274 = 0;
                                                              int v276 = 1;
                                                              goto LABEL_865;
                                                            }
                                                          }
                                                          int v276 = v137 ^ 1;
                                                          if (SBFEffectiveHomeButtonType() == 2)
                                                          {
                                                            uint64_t v61 = __sb__runningInSpringBoard();
                                                            if (v61)
                                                            {
                                                              __sb__mainScreenReferenceBounds();
                                                            }
                                                            else
                                                            {
                                                              v217 = [MEMORY[0x1E4F42D90] mainScreen];
                                                              [v217 _referenceBounds];
                                                            }
                                                            int v274 = v61 ^ 1;
                                                            BSSizeRoundForScale();
                                                            if (v149 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
                                                            {
LABEL_928:
                                                              int v280 = 0;
                                                              int v278 = 0;
                                                              uint64_t v268 = 0;
                                                              uint64_t v270 = 0;
                                                              int v273 = 0;
                                                              uint64_t v264 = 0;
                                                              uint64_t v266 = 0;
                                                              uint64_t v262 = 0;
                                                              int v260 = 0;
                                                              int v258 = 0;
                                                              int v256 = 0;
                                                              int v71 = 0;
                                                              int v72 = 0;
                                                              int v73 = 0;
                                                              int v74 = 0;
                                                              int v75 = 0;
                                                              int v76 = 0;
                                                              v77 = v53 + 11;
                                                              goto LABEL_323;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v274 = 0;
                                                          }
LABEL_865:
                                                          uint64_t v61 = __sb__runningInSpringBoard();
                                                          if (v61)
                                                          {
                                                            if (SBFEffectiveDeviceClass()
                                                              && SBFEffectiveDeviceClass() != 1)
                                                            {
                                                              int v280 = 0;
                                                              int v278 = 0;
                                                              goto LABEL_875;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v230 = [MEMORY[0x1E4F42948] currentDevice];
                                                            if ([v230 userInterfaceIdiom])
                                                            {
                                                              int v278 = 0;
                                                              int v280 = 1;
LABEL_875:
                                                              if ((_SBF_Private_IsD93Like() & 1) == 0) {
                                                                goto LABEL_879;
                                                              }
LABEL_901:
                                                              uint64_t v268 = 0;
                                                              uint64_t v270 = 0;
                                                              int v273 = 0;
                                                              uint64_t v264 = 0;
                                                              uint64_t v266 = 0;
                                                              uint64_t v262 = 0;
                                                              int v260 = 0;
                                                              int v258 = 0;
                                                              int v256 = 0;
                                                              int v71 = 0;
                                                              int v72 = 0;
                                                              int v73 = 0;
                                                              int v74 = 0;
                                                              int v75 = 0;
                                                              int v76 = 0;
                                                              v77 = v53 + 12;
                                                              goto LABEL_323;
                                                            }
                                                          }
                                                          int v280 = v61 ^ 1;
                                                          if (SBFEffectiveHomeButtonType() == 2)
                                                          {
                                                            uint64_t v61 = __sb__runningInSpringBoard();
                                                            if (v61)
                                                            {
                                                              __sb__mainScreenReferenceBounds();
                                                            }
                                                            else
                                                            {
                                                              v220 = [MEMORY[0x1E4F42D90] mainScreen];
                                                              [v220 _referenceBounds];
                                                            }
                                                            int v278 = v61 ^ 1;
                                                            BSSizeRoundForScale();
                                                            if (v143 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
                                                            {
LABEL_879:
                                                              if (!_SBF_Private_IsD63Like())
                                                              {
LABEL_883:
                                                                uint64_t v270 = 0;
                                                                goto LABEL_951;
                                                              }
                                                              int v144 = __sb__runningInSpringBoard();
                                                              if (v144)
                                                              {
                                                                if (SBFEffectiveDeviceClass()
                                                                  && SBFEffectiveDeviceClass() != 1)
                                                                {
                                                                  goto LABEL_883;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v221 = [MEMORY[0x1E4F42948] currentDevice];
                                                                if ([v221 userInterfaceIdiom])
                                                                {
                                                                  uint64_t v270 = 0x100000000;
                                                                  goto LABEL_951;
                                                                }
                                                              }
                                                              HIDWORD(v270) = v144 ^ 1;
                                                              if (SBFEffectiveHomeButtonType() == 2)
                                                              {
                                                                uint64_t v61 = __sb__runningInSpringBoard();
                                                                if (v61)
                                                                {
                                                                  __sb__mainScreenReferenceBounds();
                                                                }
                                                                else
                                                                {
                                                                  v213 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                  [v213 _referenceBounds];
                                                                }
                                                                LODWORD(v270) = v61 ^ 1;
                                                                BSSizeRoundForScale();
                                                                if (v160 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
                                                                {
LABEL_1047:
                                                                  int v273 = 0;
                                                                  uint64_t v266 = 0;
                                                                  uint64_t v268 = 0;
                                                                  uint64_t v262 = 0;
                                                                  uint64_t v264 = 0;
                                                                  int v260 = 0;
                                                                  int v258 = 0;
                                                                  int v256 = 0;
                                                                  int v71 = 0;
                                                                  int v72 = 0;
                                                                  int v73 = 0;
                                                                  int v74 = 0;
                                                                  int v75 = 0;
                                                                  int v76 = 0;
                                                                  v77 = v53 + 17;
                                                                  goto LABEL_323;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                LODWORD(v270) = 0;
                                                              }
LABEL_951:
                                                              uint64_t v61 = __sb__runningInSpringBoard();
                                                              if (v61)
                                                              {
                                                                if (SBFEffectiveDeviceClass()
                                                                  && SBFEffectiveDeviceClass() != 1)
                                                                {
                                                                  int v273 = 0;
                                                                  HIDWORD(v268) = 0;
                                                                  goto LABEL_961;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v225 = [MEMORY[0x1E4F42948] currentDevice];
                                                                if ([v225 userInterfaceIdiom])
                                                                {
                                                                  HIDWORD(v268) = 0;
                                                                  int v273 = 1;
LABEL_961:
                                                                  if ((_SBF_Private_IsD63Like() & 1) == 0) {
                                                                    goto LABEL_965;
                                                                  }
LABEL_996:
                                                                  LODWORD(v268) = 0;
                                                                  uint64_t v264 = 0;
                                                                  uint64_t v266 = 0;
                                                                  uint64_t v262 = 0;
                                                                  int v260 = 0;
                                                                  int v258 = 0;
                                                                  int v256 = 0;
                                                                  int v71 = 0;
                                                                  int v72 = 0;
                                                                  int v73 = 0;
                                                                  int v74 = 0;
                                                                  int v75 = 0;
                                                                  int v76 = 0;
                                                                  v77 = v53 + 18;
                                                                  goto LABEL_323;
                                                                }
                                                              }
                                                              int v273 = v61 ^ 1;
                                                              if (SBFEffectiveHomeButtonType() == 2)
                                                              {
                                                                uint64_t v61 = __sb__runningInSpringBoard();
                                                                if (v61)
                                                                {
                                                                  __sb__mainScreenReferenceBounds();
                                                                }
                                                                else
                                                                {
                                                                  v216 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                  [v216 _referenceBounds];
                                                                }
                                                                HIDWORD(v268) = v61 ^ 1;
                                                                BSSizeRoundForScale();
                                                                if (v153 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
                                                                {
LABEL_965:
                                                                  int v154 = __sb__runningInSpringBoard();
                                                                  if (v154)
                                                                  {
                                                                    if (SBFEffectiveDeviceClass()
                                                                      && SBFEffectiveDeviceClass() != 1)
                                                                    {
                                                                      LODWORD(v268) = 0;
                                                                      LODWORD(v264) = 0;
                                                                      goto LABEL_975;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v222 = [MEMORY[0x1E4F42948] currentDevice];
                                                                    if ([v222 userInterfaceIdiom])
                                                                    {
                                                                      LODWORD(v264) = 0;
                                                                      LODWORD(v268) = 1;
                                                                      goto LABEL_975;
                                                                    }
                                                                  }
                                                                  LODWORD(v268) = v154 ^ 1;
                                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                                  {
                                                                    uint64_t v61 = __sb__runningInSpringBoard();
                                                                    if (v61)
                                                                    {
                                                                      __sb__mainScreenReferenceBounds();
                                                                    }
                                                                    else
                                                                    {
                                                                      v214 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                      [v214 _referenceBounds];
                                                                    }
                                                                    LODWORD(v264) = v61 ^ 1;
                                                                    BSSizeRoundForScale();
                                                                    if (v157 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
                                                                    {
LABEL_1038:
                                                                      uint64_t v266 = 0;
                                                                      HIDWORD(v264) = 0;
                                                                      uint64_t v262 = 0;
                                                                      int v260 = 0;
                                                                      int v258 = 0;
                                                                      int v256 = 0;
                                                                      int v71 = 0;
                                                                      int v72 = 0;
                                                                      int v73 = 0;
                                                                      int v74 = 0;
                                                                      int v75 = 0;
                                                                      int v76 = 0;
                                                                      v77 = v53 + 15;
                                                                      goto LABEL_323;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    LODWORD(v264) = 0;
                                                                  }
LABEL_975:
                                                                  uint64_t v61 = __sb__runningInSpringBoard();
                                                                  if (v61)
                                                                  {
                                                                    if (SBFEffectiveDeviceClass()
                                                                      && SBFEffectiveDeviceClass() != 1)
                                                                    {
                                                                      uint64_t v266 = 0;
                                                                      goto LABEL_1019;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v219 = [MEMORY[0x1E4F42948] currentDevice];
                                                                    if ([v219 userInterfaceIdiom])
                                                                    {
                                                                      uint64_t v266 = 0x100000000;
LABEL_1019:
                                                                      if ((_SBF_Private_IsD33OrSimilarDevice() & 1) == 0) {
                                                                        goto LABEL_1050;
                                                                      }
LABEL_1026:
                                                                      HIDWORD(v264) = 0;
                                                                      uint64_t v262 = 0;
                                                                      int v260 = 0;
                                                                      int v258 = 0;
                                                                      int v256 = 0;
                                                                      int v71 = 0;
                                                                      int v72 = 0;
                                                                      int v73 = 0;
                                                                      int v74 = 0;
                                                                      int v75 = 0;
                                                                      int v76 = 0;
                                                                      v77 = v53 + 16;
                                                                      goto LABEL_323;
                                                                    }
                                                                  }
                                                                  HIDWORD(v266) = v61 ^ 1;
                                                                  if (SBFEffectiveHomeButtonType() == 2)
                                                                  {
                                                                    uint64_t v61 = __sb__runningInSpringBoard();
                                                                    if (v61)
                                                                    {
                                                                      __sb__mainScreenReferenceBounds();
                                                                    }
                                                                    else
                                                                    {
                                                                      v212 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                      [v212 _referenceBounds];
                                                                    }
                                                                    LODWORD(v266) = v61 ^ 1;
                                                                    BSSizeRoundForScale();
                                                                    if (v162 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
                                                                    {
LABEL_1050:
                                                                      int v163 = __sb__runningInSpringBoard();
                                                                      if (v163)
                                                                      {
                                                                        if (SBFEffectiveDeviceClass()
                                                                          && SBFEffectiveDeviceClass() != 1)
                                                                        {
                                                                          HIDWORD(v264) = 0;
                                                                          HIDWORD(v262) = 0;
                                                                          goto LABEL_1080;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v218 = [MEMORY[0x1E4F42948] currentDevice];
                                                                        if ([v218 userInterfaceIdiom])
                                                                        {
                                                                          HIDWORD(v262) = 0;
                                                                          HIDWORD(v264) = 1;
                                                                          goto LABEL_1080;
                                                                        }
                                                                      }
                                                                      HIDWORD(v264) = v163 ^ 1;
                                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                                      {
                                                                        uint64_t v61 = __sb__runningInSpringBoard();
                                                                        if (v61)
                                                                        {
                                                                          __sb__mainScreenReferenceBounds();
                                                                        }
                                                                        else
                                                                        {
                                                                          v211 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                          [v211 _referenceBounds];
                                                                        }
                                                                        HIDWORD(v262) = v61 ^ 1;
                                                                        BSSizeRoundForScale();
                                                                        if (v169 >= *(double *)(MEMORY[0x1E4FA6E50]
                                                                                               + 104))
                                                                        {
                                                                          LODWORD(v262) = 0;
                                                                          int v260 = 0;
                                                                          int v258 = 0;
                                                                          int v256 = 0;
                                                                          int v71 = 0;
                                                                          int v72 = 0;
                                                                          int v73 = 0;
                                                                          int v74 = 0;
                                                                          int v75 = 0;
                                                                          int v76 = 0;
                                                                          v170 = &CSQuickActionButtonInsetY;
LABEL_1119:
                                                                          v77 = v170 + 9;
                                                                          goto LABEL_323;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        HIDWORD(v262) = 0;
                                                                      }
LABEL_1080:
                                                                      uint64_t v61 = __sb__runningInSpringBoard();
                                                                      if (v61)
                                                                      {
                                                                        if (SBFEffectiveDeviceClass()
                                                                          && SBFEffectiveDeviceClass() != 1)
                                                                        {
                                                                          LODWORD(v262) = 0;
                                                                          int v260 = 0;
                                                                          goto LABEL_1100;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v215 = [MEMORY[0x1E4F42948] currentDevice];
                                                                        if ([v215 userInterfaceIdiom])
                                                                        {
                                                                          int v260 = 0;
                                                                          LODWORD(v262) = 1;
                                                                          goto LABEL_1100;
                                                                        }
                                                                      }
                                                                      LODWORD(v262) = v61 ^ 1;
                                                                      if (SBFEffectiveHomeButtonType() == 2)
                                                                      {
                                                                        uint64_t v61 = __sb__runningInSpringBoard();
                                                                        if (v61)
                                                                        {
                                                                          __sb__mainScreenReferenceBounds();
                                                                        }
                                                                        else
                                                                        {
                                                                          v210 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                          [v210 _referenceBounds];
                                                                        }
                                                                        int v260 = v61 ^ 1;
                                                                        BSSizeRoundForScale();
                                                                        if (v172 >= *(double *)(MEMORY[0x1E4FA6E50]
                                                                                               + 104))
                                                                        {
LABEL_1122:
                                                                          if (_SBF_Private_IsD16()
                                                                            && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
                                                                          {
                                                                            int v258 = 0;
                                                                            int v256 = 0;
                                                                            int v71 = 0;
                                                                            int v72 = 0;
                                                                            int v73 = 0;
                                                                            int v74 = 0;
                                                                            int v75 = 0;
                                                                            int v76 = 0;
                                                                            v173 = &CSQuickActionButtonInsetY;
LABEL_1137:
                                                                            v77 = v173 + 5;
                                                                            goto LABEL_323;
                                                                          }
                                                                          if (_SBF_Private_IsD52ZoomedOrSimilarDevice()
                                                                            && (_SBF_Private_IsD16() & 1) != 0)
                                                                          {
                                                                            int v258 = 0;
                                                                            int v256 = 0;
                                                                            int v71 = 0;
                                                                            int v72 = 0;
                                                                            int v73 = 0;
                                                                            int v74 = 0;
                                                                            int v75 = 0;
                                                                            int v76 = 0;
                                                                            v174 = &CSQuickActionButtonInsetY;
LABEL_1141:
                                                                            v77 = v174 + 6;
                                                                            goto LABEL_323;
                                                                          }
                                                                          if (_SBF_Private_IsD52OrSimilarDevice())
                                                                          {
                                                                            int v258 = 0;
                                                                            int v256 = 0;
                                                                            int v71 = 0;
                                                                            int v72 = 0;
                                                                            int v73 = 0;
                                                                            int v74 = 0;
                                                                            int v75 = 0;
                                                                            int v76 = 0;
                                                                            v175 = &CSQuickActionButtonInsetY;
LABEL_1144:
                                                                            v77 = v175 + 3;
                                                                            goto LABEL_323;
                                                                          }
                                                                          if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
                                                                          {
                                                                            int v258 = 0;
                                                                            int v256 = 0;
                                                                            int v71 = 0;
                                                                            int v72 = 0;
                                                                            int v73 = 0;
                                                                            int v74 = 0;
                                                                            int v75 = 0;
                                                                            int v76 = 0;
                                                                            v176 = &CSQuickActionButtonInsetY;
LABEL_1147:
                                                                            v77 = v176 + 4;
                                                                            goto LABEL_323;
                                                                          }
                                                                          int v178 = __sb__runningInSpringBoard();
                                                                          if (v178)
                                                                          {
                                                                            if (SBFEffectiveDeviceClass()
                                                                              && SBFEffectiveDeviceClass() != 1)
                                                                            {
                                                                              int v258 = 0;
                                                                              int v256 = 0;
LABEL_1209:
                                                                              int v187 = __sb__runningInSpringBoard();
                                                                              if (v187)
                                                                              {
                                                                                if (SBFEffectiveDeviceClass()
                                                                                  && SBFEffectiveDeviceClass() != 1)
                                                                                {
                                                                                  int v71 = 0;
                                                                                  int v72 = 0;
LABEL_1229:
                                                                                  int v189 = __sb__runningInSpringBoard();
                                                                                  if (v189)
                                                                                  {
                                                                                    if (SBFEffectiveDeviceClass()
                                                                                      && SBFEffectiveDeviceClass() != 1)
                                                                                    {
                                                                                      int v73 = 0;
                                                                                      int v74 = 0;
LABEL_1249:
                                                                                      uint64_t v61 = __sb__runningInSpringBoard();
                                                                                      if (v61)
                                                                                      {
                                                                                        if (SBFEffectiveDeviceClass()
                                                                                          && SBFEffectiveDeviceClass() != 1)
                                                                                        {
                                                                                          int v75 = 0;
                                                                                          int v76 = 0;
LABEL_1286:
                                                                                          v77 = &CSQuickActionButtonInsetY;
                                                                                          goto LABEL_323;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v53 = [MEMORY[0x1E4F42948] currentDevice];
                                                                                        if ([v53 userInterfaceIdiom])
                                                                                        {
                                                                                          int v76 = 0;
                                                                                          int v75 = 1;
                                                                                          goto LABEL_1286;
                                                                                        }
                                                                                      }
                                                                                      int v75 = v61 ^ 1;
                                                                                      int v200 = __sb__runningInSpringBoard();
                                                                                      if (v200)
                                                                                      {
                                                                                        __sb__mainScreenReferenceBounds();
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        uint64_t v61 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                                        [(id)v61 _referenceBounds];
                                                                                      }
                                                                                      int v76 = v200 ^ 1;
                                                                                      BSSizeRoundForScale();
                                                                                      if (v201 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
                                                                                        goto LABEL_1286;
                                                                                      }
                                                                                      v202 = &CSQuickActionButtonInsetY;
                                                                                      goto LABEL_1294;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v49 = [MEMORY[0x1E4F42948] currentDevice];
                                                                                    if ([v49 userInterfaceIdiom])
                                                                                    {
                                                                                      int v74 = 0;
                                                                                      int v73 = 1;
                                                                                      goto LABEL_1249;
                                                                                    }
                                                                                  }
                                                                                  int v73 = v189 ^ 1;
                                                                                  uint64_t v61 = __sb__runningInSpringBoard();
                                                                                  if (v61)
                                                                                  {
                                                                                    __sb__mainScreenReferenceBounds();
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    uint64_t v33 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                                    [(id)v33 _referenceBounds];
                                                                                  }
                                                                                  int v74 = v61 ^ 1;
                                                                                  BSSizeRoundForScale();
                                                                                  if (v191 < *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
                                                                                    goto LABEL_1249;
                                                                                  }
                                                                                  int v75 = 0;
                                                                                  int v76 = 0;
                                                                                  v192 = &CSQuickActionButtonInsetY;
LABEL_1267:
                                                                                  v77 = v192 + 2;
                                                                                  goto LABEL_323;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v208 = [MEMORY[0x1E4F42948] currentDevice];
                                                                                if ([v208 userInterfaceIdiom])
                                                                                {
                                                                                  int v72 = 0;
                                                                                  int v71 = 1;
                                                                                  goto LABEL_1229;
                                                                                }
                                                                              }
                                                                              int v71 = v187 ^ 1;
                                                                              if (SBFEffectiveHomeButtonType() != 2)
                                                                              {
                                                                                int v72 = 0;
                                                                                goto LABEL_1229;
                                                                              }
                                                                              uint64_t v61 = __sb__runningInSpringBoard();
                                                                              if (v61)
                                                                              {
                                                                                __sb__mainScreenReferenceBounds();
                                                                              }
                                                                              else
                                                                              {
                                                                                v206 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                                [v206 _referenceBounds];
                                                                              }
                                                                              int v72 = v61 ^ 1;
                                                                              BSSizeRoundForScale();
                                                                              if (v197 < *(double *)(MEMORY[0x1E4FA6E50] + 72)) {
                                                                                goto LABEL_1229;
                                                                              }
                                                                              int v73 = 0;
                                                                              int v74 = 0;
                                                                              int v75 = 0;
                                                                              int v76 = 0;
                                                                              v198 = &CSQuickActionButtonInsetY;
LABEL_1281:
                                                                              v77 = v198 + 8;
                                                                              goto LABEL_323;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v209 = [MEMORY[0x1E4F42948] currentDevice];
                                                                            if ([v209 userInterfaceIdiom])
                                                                            {
                                                                              int v256 = 0;
                                                                              int v258 = 1;
                                                                              goto LABEL_1209;
                                                                            }
                                                                          }
                                                                          int v258 = v178 ^ 1;
                                                                          if (SBFEffectiveHomeButtonType() != 2)
                                                                          {
                                                                            int v256 = 0;
                                                                            goto LABEL_1209;
                                                                          }
                                                                          uint64_t v61 = __sb__runningInSpringBoard();
                                                                          if (v61)
                                                                          {
                                                                            __sb__mainScreenReferenceBounds();
                                                                          }
                                                                          else
                                                                          {
                                                                            v207 = [MEMORY[0x1E4F42D90] mainScreen];
                                                                            [v207 _referenceBounds];
                                                                          }
                                                                          int v256 = v61 ^ 1;
                                                                          BSSizeRoundForScale();
                                                                          if (v194 < *(double *)(MEMORY[0x1E4FA6E50]
                                                                                                + 88))
                                                                            goto LABEL_1209;
                                                                          int v71 = 0;
                                                                          int v72 = 0;
                                                                          int v73 = 0;
                                                                          int v74 = 0;
                                                                          int v75 = 0;
                                                                          int v76 = 0;
                                                                          v195 = &CSQuickActionButtonInsetY;
LABEL_1274:
                                                                          v77 = v195 + 7;
                                                                          goto LABEL_323;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v260 = 0;
                                                                      }
LABEL_1100:
                                                                      if (_SBF_Private_IsD53())
                                                                      {
                                                                        int v258 = 0;
                                                                        int v256 = 0;
                                                                        int v71 = 0;
                                                                        int v72 = 0;
                                                                        int v73 = 0;
                                                                        int v74 = 0;
                                                                        int v75 = 0;
                                                                        int v76 = 0;
                                                                        v167 = &CSQuickActionButtonInsetY;
LABEL_1108:
                                                                        v77 = v167 + 10;
                                                                        goto LABEL_323;
                                                                      }
                                                                      goto LABEL_1122;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    LODWORD(v266) = 0;
                                                                  }
                                                                  goto LABEL_1019;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                HIDWORD(v268) = 0;
                                                              }
                                                              goto LABEL_961;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v278 = 0;
                                                          }
                                                          goto LABEL_875;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        *(_DWORD *)&v281[4] = 0;
                                                      }
                                                      goto LABEL_763;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    *(_DWORD *)v281 = 0;
                                                  }
                                                  goto LABEL_690;
                                                }
                                              }
                                              else
                                              {
                                                *(_DWORD *)&v281[28] = 0;
                                              }
                                              goto LABEL_625;
                                            }
                                          }
                                          else
                                          {
                                            *(_DWORD *)&v281[48] = 0;
                                          }
                                          goto LABEL_539;
                                        }
                                        v247 = [MEMORY[0x1E4F42948] currentDevice];
                                        if ([v247 userInterfaceIdiom] != 1) {
                                          goto LABEL_439;
                                        }
LABEL_456:
                                        *(_DWORD *)&v281[64] = 0;
                                        memset(v281, 0, 60);
                                        int v276 = 0;
                                        int v274 = 0;
                                        int v280 = 0;
                                        int v278 = 0;
                                        uint64_t v268 = 0;
                                        uint64_t v270 = 0;
                                        int v273 = 0;
                                        uint64_t v264 = 0;
                                        uint64_t v266 = 0;
                                        uint64_t v262 = 0;
                                        int v260 = 0;
                                        int v258 = 0;
                                        int v256 = 0;
                                        int v71 = 0;
                                        int v72 = 0;
                                        int v73 = 0;
                                        int v74 = 0;
                                        int v75 = 0;
                                        int v76 = 0;
                                        v77 = v53 + 25;
                                        HIDWORD(v282) = v61 ^ 1;
                                        goto LABEL_323;
                                      }
                                    }
                                    else
                                    {
                                      v249 = [MEMORY[0x1E4F42948] currentDevice];
                                      if ([v249 userInterfaceIdiom] != 1)
                                      {
                                        *(void *)&v283[0] = 0x100000000;
                                        goto LABEL_435;
                                      }
                                    }
                                    DWORD1(v283[0]) = v79 ^ 1;
                                    uint64_t v61 = __sb__runningInSpringBoard();
                                    if (v61)
                                    {
                                      __sb__mainScreenReferenceBounds();
                                    }
                                    else
                                    {
                                      v242 = [MEMORY[0x1E4F42D90] mainScreen];
                                      [v242 _referenceBounds];
                                    }
                                    LODWORD(v283[0]) = v61 ^ 1;
                                    BSSizeRoundForScale();
                                    if (v94 < *(double *)(MEMORY[0x1E4FA6E50] + 232)) {
                                      goto LABEL_435;
                                    }
LABEL_454:
                                    HIDWORD(v282) = 0;
                                    *(_DWORD *)&v281[64] = 0;
                                    memset(v281, 0, 60);
                                    int v276 = 0;
                                    int v274 = 0;
                                    int v280 = 0;
                                    int v278 = 0;
                                    uint64_t v268 = 0;
                                    uint64_t v270 = 0;
                                    int v273 = 0;
                                    uint64_t v264 = 0;
                                    uint64_t v266 = 0;
                                    uint64_t v262 = 0;
                                    int v260 = 0;
                                    int v258 = 0;
                                    int v256 = 0;
                                    int v71 = 0;
                                    int v72 = 0;
                                    int v73 = 0;
                                    int v74 = 0;
                                    int v75 = 0;
                                    int v76 = 0;
                                    v77 = v53 + 27;
                                    goto LABEL_323;
                                  }
                                }
                                else
                                {
                                  v250 = [MEMORY[0x1E4F42948] currentDevice];
                                  if ([v250 userInterfaceIdiom] != 1)
                                  {
                                    *((void *)&v283[0] + 1) = 0x100000000;
                                    goto LABEL_287;
                                  }
                                }
                                HIDWORD(v283[0]) = v68 ^ 1;
                                uint64_t v61 = __sb__runningInSpringBoard();
                                if (v61)
                                {
                                  __sb__mainScreenReferenceBounds();
                                }
                                else
                                {
                                  v246 = [MEMORY[0x1E4F42D90] mainScreen];
                                  [v246 _referenceBounds];
                                }
                                DWORD2(v283[0]) = v61 ^ 1;
                                BSSizeRoundForScale();
                                if (v78 < *(double *)(MEMORY[0x1E4FA6E50] + 248)) {
                                  goto LABEL_287;
                                }
LABEL_299:
                                *(void *)&v283[0] = 0;
                                HIDWORD(v282) = 0;
                                *(_DWORD *)&v281[64] = 0;
                                memset(v281, 0, 60);
                                int v276 = 0;
                                int v274 = 0;
                                int v280 = 0;
                                int v278 = 0;
                                uint64_t v268 = 0;
                                uint64_t v270 = 0;
                                int v273 = 0;
                                uint64_t v264 = 0;
                                uint64_t v266 = 0;
                                uint64_t v262 = 0;
                                int v260 = 0;
                                int v258 = 0;
                                int v256 = 0;
                                int v71 = 0;
                                int v72 = 0;
                                int v73 = 0;
                                int v74 = 0;
                                int v75 = 0;
                                int v76 = 0;
                                v77 = v53 + 28;
                                goto LABEL_323;
                              }
                            }
                            else
                            {
                              v251 = [MEMORY[0x1E4F42948] currentDevice];
                              if ([v251 userInterfaceIdiom] != 1)
                              {
                                *(void *)&v283[1] = 0x100000000;
                                goto LABEL_268;
                              }
                            }
                            DWORD1(v283[1]) = v63 ^ 1;
                            uint64_t v61 = __sb__runningInSpringBoard();
                            if (v61)
                            {
                              __sb__mainScreenReferenceBounds();
                            }
                            else
                            {
                              v248 = [MEMORY[0x1E4F42D90] mainScreen];
                              [v248 _referenceBounds];
                            }
                            LODWORD(v283[1]) = v61 ^ 1;
                            BSSizeRoundForScale();
                            if (v67 < *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
                              goto LABEL_268;
                            }
LABEL_280:
                            v283[0] = 0uLL;
                            HIDWORD(v282) = 0;
                            *(_DWORD *)&v281[64] = 0;
                            memset(v281, 0, 60);
                            int v276 = 0;
                            int v274 = 0;
                            int v280 = 0;
                            int v278 = 0;
                            uint64_t v268 = 0;
                            uint64_t v270 = 0;
                            int v273 = 0;
                            uint64_t v264 = 0;
                            uint64_t v266 = 0;
                            uint64_t v262 = 0;
                            int v260 = 0;
                            int v258 = 0;
                            int v256 = 0;
                            int v71 = 0;
                            int v72 = 0;
                            int v73 = 0;
                            int v74 = 0;
                            int v75 = 0;
                            int v76 = 0;
                            v77 = v53 + 30;
                            goto LABEL_323;
                          }
                        }
                        else
                        {
                          v252 = [MEMORY[0x1E4F42948] currentDevice];
                          if ([v252 userInterfaceIdiom] != 1)
                          {
                            *((void *)&v283[1] + 1) = 0x100000000;
                            goto LABEL_238;
                          }
                        }
                        HIDWORD(v283[1]) = v60 ^ 1;
                        if (SBFEffectiveHomeButtonType() != 2)
                        {
                          DWORD2(v283[1]) = 0;
                          goto LABEL_238;
                        }
                        uint64_t v61 = __sb__runningInSpringBoard();
                        if (v61)
                        {
                          __sb__mainScreenReferenceBounds();
                        }
                        else
                        {
                          v243 = [MEMORY[0x1E4F42D90] mainScreen];
                          [v243 _referenceBounds];
                        }
                        DWORD2(v283[1]) = v61 ^ 1;
                        BSSizeRoundForScale();
                        if (v88 < *(double *)(MEMORY[0x1E4FA6E50] + 360)) {
                          goto LABEL_238;
                        }
LABEL_322:
                        memset(v283, 0, 24);
                        HIDWORD(v282) = 0;
                        *(_DWORD *)&v281[64] = 0;
                        memset(v281, 0, 60);
                        int v276 = 0;
                        int v274 = 0;
                        int v280 = 0;
                        int v278 = 0;
                        uint64_t v268 = 0;
                        uint64_t v270 = 0;
                        int v273 = 0;
                        uint64_t v264 = 0;
                        uint64_t v266 = 0;
                        uint64_t v262 = 0;
                        int v260 = 0;
                        int v258 = 0;
                        int v256 = 0;
                        int v71 = 0;
                        int v72 = 0;
                        int v73 = 0;
                        int v74 = 0;
                        int v75 = 0;
                        int v76 = 0;
                        v77 = v53 + 29;
                        goto LABEL_323;
                      }
                    }
                    else
                    {
                      v253 = [MEMORY[0x1E4F42948] currentDevice];
                      if ([v253 userInterfaceIdiom] != 1)
                      {
                        *(_DWORD *)&v281[60] = 0;
                        LODWORD(v282) = 1;
                        goto LABEL_220;
                      }
                    }
                    LODWORD(v282) = v56 ^ 1;
                    if (SBFEffectiveHomeButtonType() != 2)
                    {
                      *(_DWORD *)&v281[60] = 0;
                      goto LABEL_220;
                    }
                    int v57 = __sb__runningInSpringBoard();
                    if (v57)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      v244 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v244 _referenceBounds];
                    }
                    uint64_t v61 = v57 ^ 1u;
                    BSSizeRoundForScale();
                    *(_DWORD *)&v281[60] = v61;
                    if (v86 < *(double *)(MEMORY[0x1E4FA6E50] + 424)) {
                      goto LABEL_220;
                    }
LABEL_316:
                    memset(v283, 0, sizeof(v283));
                    HIDWORD(v282) = 0;
                    *(_DWORD *)&v281[64] = 0;
                    memset(v281, 0, 60);
                    int v276 = 0;
                    int v274 = 0;
                    int v280 = 0;
                    int v278 = 0;
                    uint64_t v268 = 0;
                    uint64_t v270 = 0;
                    int v273 = 0;
                    uint64_t v264 = 0;
                    uint64_t v266 = 0;
                    uint64_t v262 = 0;
                    int v260 = 0;
                    int v258 = 0;
                    int v256 = 0;
                    int v71 = 0;
                    int v72 = 0;
                    int v73 = 0;
                    int v74 = 0;
                    int v75 = 0;
                    int v76 = 0;
                    v77 = v53 + 31;
                    goto LABEL_323;
                  }
                }
                else
                {
                  v254 = [MEMORY[0x1E4F42948] currentDevice];
                  if ([v254 userInterfaceIdiom] != 1)
                  {
                    uint64_t v284 = 0x100000000;
                    goto LABEL_202;
                  }
                }
                HIDWORD(v284) = v52 ^ 1;
                if (SBFEffectiveHomeButtonType() != 2)
                {
                  LODWORD(v284) = 0;
                  goto LABEL_202;
                }
                int v54 = __sb__runningInSpringBoard();
                if (v54)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v245 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v245 _referenceBounds];
                }
                uint64_t v61 = v54 ^ 1u;
                BSSizeRoundForScale();
                LODWORD(v284) = v61;
                if (v83 != *(double *)(MEMORY[0x1E4FA6E50] + 272) || v82 != *(double *)(MEMORY[0x1E4FA6E50] + 280)) {
                  goto LABEL_202;
                }
LABEL_310:
                uint64_t v282 = 0;
                memset(v283, 0, sizeof(v283));
                memset(v281, 0, sizeof(v281));
                int v276 = 0;
                int v274 = 0;
                int v280 = 0;
                int v278 = 0;
                uint64_t v268 = 0;
                uint64_t v270 = 0;
                int v273 = 0;
                uint64_t v264 = 0;
                uint64_t v266 = 0;
                uint64_t v262 = 0;
                int v260 = 0;
                int v258 = 0;
                int v256 = 0;
                int v71 = 0;
                int v72 = 0;
                int v73 = 0;
                int v74 = 0;
                int v75 = 0;
                int v76 = 0;
                v77 = v53 + 26;
                goto LABEL_323;
              }
              v53 = &CSQuickActionButtonInsetX;
              if (v51)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  uint64_t v284 = 0;
                  goto LABEL_211;
                }
              }
              else
              {
                v254 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v254 userInterfaceIdiom] != 1)
                {
                  uint64_t v284 = 0x100000000;
                  goto LABEL_211;
                }
              }
              HIDWORD(v284) = v52 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                int v55 = __sb__runningInSpringBoard();
                if (v55)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v245 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v245 _referenceBounds];
                }
                uint64_t v61 = v55 ^ 1u;
                BSSizeRoundForScale();
                LODWORD(v284) = v61;
                if (v85 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v84 == *(double *)(MEMORY[0x1E4FA6E50] + 280)) {
                  goto LABEL_310;
                }
              }
              else
              {
                LODWORD(v284) = 0;
              }
LABEL_211:
              int v58 = __sb__runningInSpringBoard();
              if (v58)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  LODWORD(v282) = 0;
                  *(_DWORD *)&v281[60] = 0;
                  goto LABEL_229;
                }
              }
              else
              {
                v253 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v253 userInterfaceIdiom] != 1)
                {
                  *(_DWORD *)&v281[60] = 0;
                  LODWORD(v282) = 1;
                  goto LABEL_229;
                }
              }
              LODWORD(v282) = v58 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                int v59 = __sb__runningInSpringBoard();
                if (v59)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v244 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v244 _referenceBounds];
                }
                uint64_t v61 = v59 ^ 1u;
                BSSizeRoundForScale();
                *(_DWORD *)&v281[60] = v61;
                if (v87 >= *(double *)(MEMORY[0x1E4FA6E50] + 424)) {
                  goto LABEL_316;
                }
              }
              else
              {
                *(_DWORD *)&v281[60] = 0;
              }
LABEL_229:
              int v62 = __sb__runningInSpringBoard();
              if (v62)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *((void *)&v283[1] + 1) = 0;
                  goto LABEL_246;
                }
              }
              else
              {
                v252 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v252 userInterfaceIdiom] != 1)
                {
                  *((void *)&v283[1] + 1) = 0x100000000;
                  goto LABEL_246;
                }
              }
              HIDWORD(v283[1]) = v62 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v243 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v243 _referenceBounds];
                }
                DWORD2(v283[1]) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v89 >= *(double *)(MEMORY[0x1E4FA6E50] + 360)) {
                  goto LABEL_322;
                }
              }
              else
              {
                DWORD2(v283[1]) = 0;
              }
LABEL_246:
              int v64 = __sb__runningInSpringBoard();
              if (v64)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *(void *)&v283[1] = 0;
                  goto LABEL_277;
                }
              }
              else
              {
                v251 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v251 userInterfaceIdiom] != 1)
                {
                  *(void *)&v283[1] = 0x100000000;
                  goto LABEL_277;
                }
              }
              DWORD1(v283[1]) = v64 ^ 1;
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v248 = [MEMORY[0x1E4F42D90] mainScreen];
                [v248 _referenceBounds];
              }
              LODWORD(v283[1]) = v61 ^ 1;
              BSSizeRoundForScale();
              if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
                goto LABEL_280;
              }
LABEL_277:
              int v70 = __sb__runningInSpringBoard();
              if (v70)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *((void *)&v283[0] + 1) = 0;
                  goto LABEL_296;
                }
              }
              else
              {
                v250 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v250 userInterfaceIdiom] != 1)
                {
                  *((void *)&v283[0] + 1) = 0x100000000;
                  goto LABEL_296;
                }
              }
              HIDWORD(v283[0]) = v70 ^ 1;
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v246 = [MEMORY[0x1E4F42D90] mainScreen];
                [v246 _referenceBounds];
              }
              DWORD2(v283[0]) = v61 ^ 1;
              BSSizeRoundForScale();
              if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 248)) {
                goto LABEL_299;
              }
LABEL_296:
              int v81 = __sb__runningInSpringBoard();
              if (v81)
              {
                if (SBFEffectiveDeviceClass() != 2)
                {
                  *(void *)&v283[0] = 0;
                  goto LABEL_447;
                }
              }
              else
              {
                v249 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v249 userInterfaceIdiom] != 1)
                {
                  *(void *)&v283[0] = 0x100000000;
                  goto LABEL_447;
                }
              }
              DWORD1(v283[0]) = v81 ^ 1;
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v242 = [MEMORY[0x1E4F42D90] mainScreen];
                [v242 _referenceBounds];
              }
              LODWORD(v283[0]) = v61 ^ 1;
              BSSizeRoundForScale();
              if (v96 >= *(double *)(MEMORY[0x1E4FA6E50] + 232)) {
                goto LABEL_454;
              }
LABEL_447:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() == 2) {
                  goto LABEL_456;
                }
              }
              else
              {
                v247 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v247 userInterfaceIdiom] == 1) {
                  goto LABEL_456;
                }
              }
              HIDWORD(v282) = v61 ^ 1;
              if (!_SBF_Private_IsD94Like()) {
                goto LABEL_453;
              }
              int v97 = __sb__runningInSpringBoard();
              if (v97)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
LABEL_453:
                  *(void *)&v281[52] = 0;
                  goto LABEL_554;
                }
              }
              else
              {
                v240 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v240 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[52] = 0;
                  *(_DWORD *)&v281[56] = 1;
                  goto LABEL_554;
                }
              }
              *(_DWORD *)&v281[56] = v97 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v233 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v233 _referenceBounds];
                }
                *(_DWORD *)&v281[52] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v110 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
                  goto LABEL_592;
                }
              }
              else
              {
                *(_DWORD *)&v281[52] = 0;
              }
LABEL_554:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[64] = 0;
                  *(_DWORD *)&v281[48] = 0;
                  goto LABEL_564;
                }
              }
              else
              {
                v241 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v241 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[48] = 0;
                  *(_DWORD *)&v281[64] = 1;
                  goto LABEL_564;
                }
              }
              *(_DWORD *)&v281[64] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v236 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v236 _referenceBounds];
                }
                *(_DWORD *)&v281[48] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v105 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
                  goto LABEL_568;
                }
              }
              else
              {
                *(_DWORD *)&v281[48] = 0;
              }
LABEL_564:
              if (_SBF_Private_IsD94Like()) {
                goto LABEL_565;
              }
LABEL_568:
              if (!_SBF_Private_IsD64Like())
              {
LABEL_572:
                *(void *)&v281[40] = 0;
                goto LABEL_649;
              }
              int v106 = __sb__runningInSpringBoard();
              if (v106)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                  goto LABEL_572;
                }
              }
              else
              {
                v237 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v237 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[40] = 0;
                  *(_DWORD *)&v281[44] = 1;
                  goto LABEL_649;
                }
              }
              *(_DWORD *)&v281[44] = v106 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v228 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v228 _referenceBounds];
                }
                *(_DWORD *)&v281[40] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v123 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
                  goto LABEL_713;
                }
              }
              else
              {
                *(_DWORD *)&v281[40] = 0;
              }
LABEL_649:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[36] = 0;
                  *(_DWORD *)&v281[28] = 0;
                  goto LABEL_659;
                }
              }
              else
              {
                v239 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v239 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[28] = 0;
                  *(_DWORD *)&v281[36] = 1;
                  goto LABEL_659;
                }
              }
              *(_DWORD *)&v281[36] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v232 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v232 _referenceBounds];
                }
                *(_DWORD *)&v281[28] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v116 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
                  goto LABEL_663;
                }
              }
              else
              {
                *(_DWORD *)&v281[28] = 0;
              }
LABEL_659:
              if (_SBF_Private_IsD64Like()) {
                goto LABEL_660;
              }
LABEL_663:
              int v117 = __sb__runningInSpringBoard();
              if (v117)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[32] = 0;
                  *(_DWORD *)&v281[24] = 0;
                  goto LABEL_673;
                }
              }
              else
              {
                v238 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v238 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[24] = 0;
                  *(_DWORD *)&v281[32] = 1;
                  goto LABEL_673;
                }
              }
              *(_DWORD *)&v281[32] = v117 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                int v118 = __sb__runningInSpringBoard();
                if (v118)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v229 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v229 _referenceBounds];
                }
                uint64_t v61 = v118 ^ 1u;
                BSSizeRoundForScale();
                *(_DWORD *)&v281[24] = v61;
                if (v120 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
                  goto LABEL_703;
                }
              }
              else
              {
                *(_DWORD *)&v281[24] = 0;
              }
LABEL_673:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(_DWORD *)&v281[12] = 0;
                  *(_DWORD *)v281 = 0;
                  goto LABEL_696;
                }
              }
              else
              {
                v235 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v235 userInterfaceIdiom])
                {
                  *(_DWORD *)v281 = 0;
                  *(_DWORD *)&v281[12] = 1;
                  goto LABEL_696;
                }
              }
              *(_DWORD *)&v281[12] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v227 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v227 _referenceBounds];
                }
                *(_DWORD *)v281 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
                  goto LABEL_733;
                }
              }
              else
              {
                *(_DWORD *)v281 = 0;
              }
LABEL_696:
              if (_SBF_Private_IsD54()) {
                goto LABEL_697;
              }
LABEL_733:
              int v129 = __sb__runningInSpringBoard();
              if (v129)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(void *)&v281[16] = 0;
                  goto LABEL_753;
                }
              }
              else
              {
                v234 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v234 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[16] = 0;
                  *(_DWORD *)&v281[20] = 1;
                  goto LABEL_753;
                }
              }
              *(_DWORD *)&v281[20] = v129 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                int v131 = __sb__runningInSpringBoard();
                if (v131)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v224 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v224 _referenceBounds];
                }
                uint64_t v61 = v131 ^ 1u;
                BSSizeRoundForScale();
                *(_DWORD *)&v281[16] = v61;
                if (v135 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0) {
                  goto LABEL_805;
                }
              }
              else
              {
                *(_DWORD *)&v281[16] = 0;
              }
LABEL_753:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  *(void *)&v281[4] = 0;
                  goto LABEL_770;
                }
              }
              else
              {
                v231 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v231 userInterfaceIdiom])
                {
                  *(_DWORD *)&v281[4] = 0;
                  *(_DWORD *)&v281[8] = 1;
                  goto LABEL_770;
                }
              }
              *(_DWORD *)&v281[8] = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v223 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v223 _referenceBounds];
                }
                *(_DWORD *)&v281[4] = v61 ^ 1;
                BSSizeRoundForScale();
                if (v138 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
                  goto LABEL_817;
                }
              }
              else
              {
                *(_DWORD *)&v281[4] = 0;
              }
LABEL_770:
              if (_SBF_Private_IsD33OrSimilarDevice()
                && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
              {
                goto LABEL_772;
              }
LABEL_817:
              if (!_SBF_Private_IsD93Like())
              {
LABEL_821:
                int v276 = 0;
                int v274 = 0;
                goto LABEL_890;
              }
              int v139 = __sb__runningInSpringBoard();
              if (v139)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                  goto LABEL_821;
                }
              }
              else
              {
                v226 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v226 userInterfaceIdiom])
                {
                  int v274 = 0;
                  int v276 = 1;
                  goto LABEL_890;
                }
              }
              int v276 = v139 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v217 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v217 _referenceBounds];
                }
                int v274 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v150 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
                  goto LABEL_928;
                }
              }
              else
              {
                int v274 = 0;
              }
LABEL_890:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  int v280 = 0;
                  int v278 = 0;
                  goto LABEL_900;
                }
              }
              else
              {
                v230 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v230 userInterfaceIdiom])
                {
                  int v278 = 0;
                  int v280 = 1;
                  goto LABEL_900;
                }
              }
              int v280 = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v220 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v220 _referenceBounds];
                }
                int v278 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
                  goto LABEL_904;
                }
              }
              else
              {
                int v278 = 0;
              }
LABEL_900:
              if (_SBF_Private_IsD93Like()) {
                goto LABEL_901;
              }
LABEL_904:
              if (!_SBF_Private_IsD63Like())
              {
LABEL_908:
                uint64_t v270 = 0;
                goto LABEL_985;
              }
              int v146 = __sb__runningInSpringBoard();
              if (v146)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                  goto LABEL_908;
                }
              }
              else
              {
                v221 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v221 userInterfaceIdiom])
                {
                  uint64_t v270 = 0x100000000;
                  goto LABEL_985;
                }
              }
              HIDWORD(v270) = v146 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v213 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v213 _referenceBounds];
                }
                LODWORD(v270) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v161 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
                  goto LABEL_1047;
                }
              }
              else
              {
                LODWORD(v270) = 0;
              }
LABEL_985:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  int v273 = 0;
                  HIDWORD(v268) = 0;
                  goto LABEL_995;
                }
              }
              else
              {
                v225 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v225 userInterfaceIdiom])
                {
                  HIDWORD(v268) = 0;
                  int v273 = 1;
                  goto LABEL_995;
                }
              }
              int v273 = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v216 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v216 _referenceBounds];
                }
                HIDWORD(v268) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v155 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
                  goto LABEL_999;
                }
              }
              else
              {
                HIDWORD(v268) = 0;
              }
LABEL_995:
              if (_SBF_Private_IsD63Like()) {
                goto LABEL_996;
              }
LABEL_999:
              int v156 = __sb__runningInSpringBoard();
              if (v156)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  LODWORD(v268) = 0;
                  LODWORD(v264) = 0;
                  goto LABEL_1009;
                }
              }
              else
              {
                v222 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v222 userInterfaceIdiom])
                {
                  LODWORD(v264) = 0;
                  LODWORD(v268) = 1;
                  goto LABEL_1009;
                }
              }
              LODWORD(v268) = v156 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v214 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v214 _referenceBounds];
                }
                LODWORD(v264) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v158 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
                  goto LABEL_1038;
                }
              }
              else
              {
                LODWORD(v264) = 0;
              }
LABEL_1009:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  uint64_t v266 = 0;
                  goto LABEL_1025;
                }
              }
              else
              {
                v219 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v219 userInterfaceIdiom])
                {
                  uint64_t v266 = 0x100000000;
                  goto LABEL_1025;
                }
              }
              HIDWORD(v266) = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v212 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v212 _referenceBounds];
                }
                LODWORD(v266) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v164 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
                  goto LABEL_1058;
                }
              }
              else
              {
                LODWORD(v266) = 0;
              }
LABEL_1025:
              if (_SBF_Private_IsD33OrSimilarDevice()) {
                goto LABEL_1026;
              }
LABEL_1058:
              int v165 = __sb__runningInSpringBoard();
              if (v165)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  HIDWORD(v264) = 0;
                  HIDWORD(v262) = 0;
                  goto LABEL_1090;
                }
              }
              else
              {
                v218 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v218 userInterfaceIdiom])
                {
                  HIDWORD(v262) = 0;
                  HIDWORD(v264) = 1;
                  goto LABEL_1090;
                }
              }
              HIDWORD(v264) = v165 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v211 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v211 _referenceBounds];
                }
                HIDWORD(v262) = v61 ^ 1;
                BSSizeRoundForScale();
                if (v171 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
                {
                  LODWORD(v262) = 0;
                  int v260 = 0;
                  int v258 = 0;
                  int v256 = 0;
                  int v71 = 0;
                  int v72 = 0;
                  int v73 = 0;
                  int v74 = 0;
                  int v75 = 0;
                  int v76 = 0;
                  v170 = &CSQuickActionButtonInsetX;
                  goto LABEL_1119;
                }
              }
              else
              {
                HIDWORD(v262) = 0;
              }
LABEL_1090:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  LODWORD(v262) = 0;
                  int v260 = 0;
                  goto LABEL_1106;
                }
              }
              else
              {
                v215 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v215 userInterfaceIdiom])
                {
                  int v260 = 0;
                  LODWORD(v262) = 1;
                  goto LABEL_1106;
                }
              }
              LODWORD(v262) = v61 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v210 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v210 _referenceBounds];
                }
                int v260 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v177 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
                  goto LABEL_1134;
                }
              }
              else
              {
                int v260 = 0;
              }
LABEL_1106:
              if (_SBF_Private_IsD53())
              {
                int v258 = 0;
                int v256 = 0;
                int v71 = 0;
                int v72 = 0;
                int v73 = 0;
                int v74 = 0;
                int v75 = 0;
                int v76 = 0;
                v167 = &CSQuickActionButtonInsetX;
                goto LABEL_1108;
              }
LABEL_1134:
              if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
              {
                int v258 = 0;
                int v256 = 0;
                int v71 = 0;
                int v72 = 0;
                int v73 = 0;
                int v74 = 0;
                int v75 = 0;
                int v76 = 0;
                v173 = &CSQuickActionButtonInsetX;
                goto LABEL_1137;
              }
              if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
              {
                int v258 = 0;
                int v256 = 0;
                int v71 = 0;
                int v72 = 0;
                int v73 = 0;
                int v74 = 0;
                int v75 = 0;
                int v76 = 0;
                v174 = &CSQuickActionButtonInsetX;
                goto LABEL_1141;
              }
              if (_SBF_Private_IsD52OrSimilarDevice())
              {
                int v258 = 0;
                int v256 = 0;
                int v71 = 0;
                int v72 = 0;
                int v73 = 0;
                int v74 = 0;
                int v75 = 0;
                int v76 = 0;
                v175 = &CSQuickActionButtonInsetX;
                goto LABEL_1144;
              }
              if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
              {
                int v258 = 0;
                int v256 = 0;
                int v71 = 0;
                int v72 = 0;
                int v73 = 0;
                int v74 = 0;
                int v75 = 0;
                int v76 = 0;
                v176 = &CSQuickActionButtonInsetX;
                goto LABEL_1147;
              }
              int v179 = __sb__runningInSpringBoard();
              if (v179)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  int v258 = 0;
                  int v256 = 0;
                  goto LABEL_1219;
                }
              }
              else
              {
                v209 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v209 userInterfaceIdiom])
                {
                  int v256 = 0;
                  int v258 = 1;
                  goto LABEL_1219;
                }
              }
              int v258 = v179 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v207 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v207 _referenceBounds];
                }
                int v256 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v196 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
                {
                  int v71 = 0;
                  int v72 = 0;
                  int v73 = 0;
                  int v74 = 0;
                  int v75 = 0;
                  int v76 = 0;
                  v195 = &CSQuickActionButtonInsetX;
                  goto LABEL_1274;
                }
              }
              else
              {
                int v256 = 0;
              }
LABEL_1219:
              int v188 = __sb__runningInSpringBoard();
              if (v188)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  int v71 = 0;
                  int v72 = 0;
                  goto LABEL_1239;
                }
              }
              else
              {
                v208 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v208 userInterfaceIdiom])
                {
                  int v72 = 0;
                  int v71 = 1;
                  goto LABEL_1239;
                }
              }
              int v71 = v188 ^ 1;
              if (SBFEffectiveHomeButtonType() == 2)
              {
                uint64_t v61 = __sb__runningInSpringBoard();
                if (v61)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v206 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v206 _referenceBounds];
                }
                int v72 = v61 ^ 1;
                BSSizeRoundForScale();
                if (v199 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
                {
                  int v73 = 0;
                  int v74 = 0;
                  int v75 = 0;
                  int v76 = 0;
                  v198 = &CSQuickActionButtonInsetX;
                  goto LABEL_1281;
                }
              }
              else
              {
                int v72 = 0;
              }
LABEL_1239:
              int v190 = __sb__runningInSpringBoard();
              if (v190)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  int v73 = 0;
                  int v74 = 0;
                  goto LABEL_1260;
                }
              }
              else
              {
                v49 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v49 userInterfaceIdiom])
                {
                  int v74 = 0;
                  int v73 = 1;
                  goto LABEL_1260;
                }
              }
              int v73 = v190 ^ 1;
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v33 = [MEMORY[0x1E4F42D90] mainScreen];
                [(id)v33 _referenceBounds];
              }
              int v74 = v61 ^ 1;
              BSSizeRoundForScale();
              if (v193 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
              {
                int v75 = 0;
                int v76 = 0;
                v192 = &CSQuickActionButtonInsetX;
                goto LABEL_1267;
              }
LABEL_1260:
              uint64_t v61 = __sb__runningInSpringBoard();
              if (v61)
              {
                if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                {
                  int v75 = 0;
                  int v76 = 0;
                  goto LABEL_1292;
                }
              }
              else
              {
                v53 = [MEMORY[0x1E4F42948] currentDevice];
                if ([v53 userInterfaceIdiom])
                {
                  int v76 = 0;
                  int v75 = 1;
                  goto LABEL_1292;
                }
              }
              int v75 = v61 ^ 1;
              int v203 = __sb__runningInSpringBoard();
              if (v203)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v61 = [MEMORY[0x1E4F42D90] mainScreen];
                [(id)v61 _referenceBounds];
              }
              int v76 = v203 ^ 1;
              BSSizeRoundForScale();
              if (v204 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
              {
                v202 = &CSQuickActionButtonInsetX;
LABEL_1294:
                v77 = v202 + 1;
LABEL_323:
                double v90 = *(double *)v77;
                if (v76) {

                }
                if (v75) {
                if (v74)
                }
                {

                  if (!v73) {
                    goto LABEL_329;
                  }
                }
                else if (!v73)
                {
LABEL_329:
                  if (v72) {
                    goto LABEL_330;
                  }
                  goto LABEL_334;
                }

                if (v72)
                {
LABEL_330:

                  if (!v71) {
                    goto LABEL_336;
                  }
                  goto LABEL_335;
                }
LABEL_334:
                if (!v71)
                {
LABEL_336:
                  if (v256) {

                  }
                  if (v258) {
                  if (v260)
                  }

                  if (v262) {
                  if (HIDWORD(v262))
                  }

                  if (HIDWORD(v264)) {
                  if (v266)
                  }

                  if (HIDWORD(v266)) {
                  if (v264)
                  }

                  if (v268) {
                  if (HIDWORD(v268))
                  }

                  if (v273) {
                  if (v270)
                  }

                  if (HIDWORD(v270)) {
                  if (v278)
                  }

                  if (v280) {
                  if (v274)
                  }

                  if (v276) {
                  if (*(_DWORD *)&v281[4])
                  }

                  if (*(_DWORD *)&v281[8]) {
                  if (*(_DWORD *)&v281[16])
                  }

                  if (*(_DWORD *)&v281[20]) {
                  if (*(_DWORD *)v281)
                  }

                  if (*(_DWORD *)&v281[12]) {
                  if (*(_DWORD *)&v281[24])
                  }

                  if (*(_DWORD *)&v281[32]) {
                  if (*(_DWORD *)&v281[28])
                  }

                  if (*(_DWORD *)&v281[36]) {
                  if (*(_DWORD *)&v281[40])
                  }

                  if (*(_DWORD *)&v281[44]) {
                  if (*(_DWORD *)&v281[48])
                  }

                  if (*(_DWORD *)&v281[64]) {
                  if (*(_DWORD *)&v281[52])
                  }

                  if (*(_DWORD *)&v281[56]) {
                  if (HIDWORD(v282))
                  }

                  if (LODWORD(v283[0])) {
                  if (DWORD1(v283[0]))
                  }

                  if (DWORD2(v283[0])) {
                  if (HIDWORD(v283[0]))
                  }

                  if (LODWORD(v283[1])) {
                  if (DWORD1(v283[1]))
                  }

                  if (DWORD2(v283[1])) {
                  if (HIDWORD(v283[1]))
                  }

                  if (*(_DWORD *)&v281[60]) {
                  if (v282)
                  }

                  if (v284) {
                  double v23 = v50 + v90;
                  }
                  if (HIDWORD(v284)) {

                  }
LABEL_430:
                  double v11 = v11 - (v15 + v23);
                  double v22 = 0.0;
                  goto LABEL_431;
                }
LABEL_335:

                goto LABEL_336;
              }
LABEL_1292:
              v77 = &CSQuickActionButtonInsetX;
              goto LABEL_323;
            }
LABEL_88:

            goto LABEL_89;
          }
LABEL_84:

          goto LABEL_85;
        }
LABEL_1203:
        v41 = &CSQuickActionButtonDiameter;
        goto LABEL_77;
      }
    }
    uint64_t v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    int v38 = 0;
    int v39 = 0;
    int v40 = 0;
    int v259 = 0;
    uint64_t v261 = 0;
    uint64_t v263 = 0;
    uint64_t v265 = 0;
    uint64_t v267 = 0;
    uint64_t v272 = 0;
    int v271 = 0;
    int v275 = 0;
    int v279 = 0;
    int v269 = 0;
    int v277 = 0;
    memset(v281, 0, 64);
    v41 = &qword_1D8505CC0;
    *(_DWORD *)&v281[64] = v27 ^ 1;
    goto LABEL_77;
  }
  [MEMORY[0x1E4FA7D30] idealSearchPlatterWidth];
  double v19 = v18;
  double v20 = CSMainPageListInsetXLandscapePhoneDeviceSpecific();
  double v21 = v10 - v20 - v19 + v20 * -0.5;
  double v15 = 0.0;
  double v10 = v10 - (v21 + 0.0);
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    double v22 = 0.0;
  }
  else {
    double v22 = v21;
  }
LABEL_431:
  double v91 = v15;
  double v92 = v10;
  double v93 = v11;
  result.size.double height = v93;
  result.size.double width = v92;
  result.origin.double y = v91;
  result.origin.double x = v22;
  return result;
}

+ (CGRect)_screenBoundsForPortrait:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v22.origin.double x = v6;
  v22.origin.double y = v8;
  v22.size.double width = v10;
  v22.size.double height = v12;
  double Height = CGRectGetHeight(v22);
  v23.origin.double x = v6;
  v23.origin.double y = v8;
  v23.size.double width = v10;
  v23.size.double height = v12;
  double Width = CGRectGetWidth(v23);
  if (Height >= Width) {
    double v15 = Height;
  }
  else {
    double v15 = Width;
  }
  v24.origin.double x = v6;
  v24.origin.double y = v8;
  v24.size.double width = v10;
  v24.size.double height = v12;
  double v16 = CGRectGetHeight(v24);
  v25.origin.double x = v6;
  v25.origin.double y = v8;
  v25.size.double width = v10;
  v25.size.double height = v12;
  double v17 = CGRectGetWidth(v25);
  if (v16 < v17) {
    double v17 = v16;
  }
  if (v3) {
    double v18 = v17;
  }
  else {
    double v18 = v15;
  }
  if (v3) {
    double v19 = v15;
  }
  else {
    double v19 = v17;
  }
  double v20 = 0.0;
  double v21 = 0.0;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (CGRect)_normalizedContentCutoutForScreenBounds:(CGRect)a3 contentBoundingRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double v20 = CGRectGetWidth(a3);
  v21.origin.CGFloat x = v11;
  v21.origin.CGFloat y = v10;
  v21.size.CGFloat width = v9;
  v21.size.CGFloat height = v8;
  double v12 = CGRectGetHeight(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v13 = CGRectGetMinX(v22) / v20;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMinY(v23) / v12;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v15 = CGRectGetWidth(v24) / v20;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v16 = CGRectGetHeight(v25) / v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

@end