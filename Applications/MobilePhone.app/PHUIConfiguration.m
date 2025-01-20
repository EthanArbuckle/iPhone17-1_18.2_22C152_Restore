@interface PHUIConfiguration
+ (BOOL)canAutoRotateInCallUIForFaceTime;
+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio;
+ (BOOL)canRotateInCallUIOverlayForFaceTime;
+ (BOOL)preferShorterStrings;
+ (BOOL)requiresSmallScreenConfig;
+ (BOOL)shouldUseExplicitLayoutDimensions;
+ (BOOL)shouldUseFullScreenPeoplePicker;
+ (BOOL)shouldUseSOSTightSpacing;
+ (double)ambientAudioRoutesButtonSize;
+ (double)ambientAudioRoutesInset;
+ (double)ambientAudioRoutesSymbolInset;
+ (double)ambientHorizontalPadding;
+ (double)ambientInCallControlSize;
+ (double)ambientInCallControlSpacing;
+ (double)ambientVerticalPadding;
+ (double)dialerLCDFontSize;
+ (double)dialerLCDLabelFontSize;
+ (double)distanceBetweenEndButtonAndKeyPadLastRow;
+ (double)inCallControlButtonSizeRatio;
+ (double)inCallControlButtonVerticalSpacingRatio;
+ (double)inComingCallAndInCallControlsBottomPaddingRatio;
+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio;
+ (double)pipPartialHomeOffset;
+ (double)pipRadius;
+ (double)pipWallInset;
+ (double)pipWidth;
+ (double)yOffsetForDialerLCDView;
+ (double)yOffsetForDialerLCDViewForDxDevices;
+ (double)yOffsetForParticipantsView;
+ (double)yOffsetForSmartDialerLCDView;
+ (double)yParticipantsViewAdjustmentForKeypad;
+ (unint64_t)ambientHorizontalSizeClass;
+ (unint64_t)ambientVerticalSizeClass;
+ (unint64_t)contentViewSizeForFaceTime;
+ (unint64_t)handsetDialerSize;
+ (unint64_t)handsetDialerSpacing;
+ (unint64_t)inCallBottomBarAssetSize;
+ (unint64_t)inCallBottomBarLowerOffset;
+ (unint64_t)inCallBottomBarMaxTitleSize;
+ (unint64_t)inCallBottomBarSpacing;
+ (unint64_t)inCallControlAlignment;
+ (unint64_t)inCallControlSize;
+ (unint64_t)inCallControlSpacing;
+ (unint64_t)inCallFaceTimeOverlayUISize;
+ (unint64_t)inCallSlideToAnswerSize;
+ (unint64_t)pipStatusBarPadding;
+ (unint64_t)screenSize;
+ (unint64_t)tableViewCellVerticalSpacing;
+ (unint64_t)voicemailLayoutSpacing;
@end

@implementation PHUIConfiguration

+ (unint64_t)screenSize
{
  if (screenSize_onceToken != -1) {
    dispatch_once(&screenSize_onceToken, &__block_literal_global_8);
  }
  return screenSize_screenSize;
}

void __31__PHUIConfiguration_screenSize__block_invoke(id a1)
{
  v1 = +[CADisplay mainDisplay];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  if (v3 >= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  int v7 = (int)v6;
  uint64_t v8 = MGGetProductType();
  if (v7 == 1136) {
    goto LABEL_5;
  }
  if (v8 <= 2795618602)
  {
    if (v8 > 851437780)
    {
      if (v8 <= 2688879998)
      {
        if (v8 != 851437781)
        {
          if (v8 != 1169082144) {
            goto LABEL_23;
          }
          goto LABEL_42;
        }
LABEL_32:
        BOOL v11 = v7 == 2556;
        goto LABEL_45;
      }
      if (v8 != 2688879999)
      {
        if (v8 != 2793418701) {
          goto LABEL_23;
        }
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v8 == 133314240) {
      goto LABEL_32;
    }
    if (v8 != 330877086)
    {
      uint64_t v10 = 574536383;
LABEL_22:
      if (v8 != v10) {
        goto LABEL_23;
      }
LABEL_33:
      BOOL v12 = v7 == 2796;
      goto LABEL_34;
    }
    BOOL v12 = v7 == 2868;
LABEL_34:
    uint64_t v9 = 14;
    if (!v12) {
      uint64_t v9 = 15;
    }
    goto LABEL_47;
  }
  if (v8 <= 3001488777)
  {
    if (v8 == 2795618603)
    {
      BOOL v11 = v7 == 2622;
LABEL_45:
      uint64_t v9 = 9;
      if (v11) {
        uint64_t v9 = 12;
      }
      goto LABEL_47;
    }
    if (v8 == 2940697645) {
      goto LABEL_32;
    }
    uint64_t v10 = 2941181571;
    goto LABEL_22;
  }
  if (v8 <= 3885279869)
  {
    if (v8 == 3001488778)
    {
LABEL_42:
      BOOL v11 = v7 == 2532;
      goto LABEL_45;
    }
    uint64_t v10 = 3825599860;
    goto LABEL_22;
  }
  if (v8 == 4201643249)
  {
    BOOL v12 = v7 == 2778;
    goto LABEL_34;
  }
  if (v8 == 3885279870)
  {
    uint64_t v9 = 9;
    if (v7 == 2436) {
      uint64_t v9 = 10;
    }
    goto LABEL_47;
  }
LABEL_23:
  if (v7 > 2271)
  {
    if (v7 > 2531)
    {
      if (v7 > 2731)
      {
        if (v7 == 2732 || v7 == 2752)
        {
          uint64_t v9 = 7;
          goto LABEL_47;
        }
        if (v7 == 2778)
        {
          uint64_t v9 = 14;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v7 == 2532)
      {
        uint64_t v9 = 12;
        goto LABEL_47;
      }
      if (v7 != 2688) {
        goto LABEL_48;
      }
LABEL_74:
      uint64_t v9 = 5;
      goto LABEL_47;
    }
    if (v7 > 2387)
    {
      if (v7 != 2388)
      {
        if (v7 != 2436) {
          goto LABEL_48;
        }
        goto LABEL_77;
      }
    }
    else
    {
      if (v7 == 2272)
      {
LABEL_5:
        uint64_t v9 = 0;
LABEL_47:
        screenSize_screenSize = v9;
        goto LABEL_48;
      }
      if (v7 != 2360) {
        goto LABEL_48;
      }
    }
    uint64_t v9 = 8;
    goto LABEL_47;
  }
  uint64_t v9 = 2;
  if (v7 > 2000)
  {
    if (v7 > 2078)
    {
      switch(v7)
      {
        case 2079:
          uint64_t v9 = 9;
          break;
        case 2208:
          uint64_t v9 = 6;
          break;
        case 2224:
          uint64_t v9 = 3;
          break;
        default:
          goto LABEL_48;
      }
      goto LABEL_47;
    }
    if (v7 != 2001)
    {
      if (v7 == 2048) {
        goto LABEL_47;
      }
      goto LABEL_48;
    }
LABEL_79:
    uint64_t v9 = 1;
    goto LABEL_47;
  }
  if (v7 > 1623)
  {
    if (v7 != 1624)
    {
      if (v7 != 1792) {
        goto LABEL_48;
      }
      goto LABEL_74;
    }
LABEL_77:
    uint64_t v9 = 4;
    goto LABEL_47;
  }
  if (v7 == 1024) {
    goto LABEL_47;
  }
  if (v7 == 1334) {
    goto LABEL_79;
  }
LABEL_48:
  v13 = PHDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    uint64_t v15 = screenSize_screenSize;
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Determined screen size to be %ld for screenHeight: %d", (uint8_t *)&v14, 0x12u);
  }
}

+ (unint64_t)inCallControlAlignment
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__PHUIConfiguration_inCallControlAlignment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallControlAlignment_onceToken != -1) {
    dispatch_once(&inCallControlAlignment_onceToken, block);
  }
  return inCallControlAlignment_alignment;
}

char *__43__PHUIConfiguration_inCallControlAlignment__block_invoke(uint64_t a1)
{
  result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 0xE) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = qword_100203D10[(void)(result - 1)];
  }
  inCallControlAlignment_alignment = v2;
  return result;
}

+ (unint64_t)inCallControlSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__PHUIConfiguration_inCallControlSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallControlSpacing_onceToken != -1) {
    dispatch_once(&inCallControlSpacing_onceToken, block);
  }
  return inCallControlSpacing_spacing;
}

unint64_t __41__PHUIConfiguration_inCallControlSpacing__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xE) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_100203D88[result];
  }
  inCallControlSpacing_spacing = v2;
  return result;
}

+ (unint64_t)inCallBottomBarSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__PHUIConfiguration_inCallBottomBarSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallBottomBarSpacing_onceToken != -1) {
    dispatch_once(&inCallBottomBarSpacing_onceToken, block);
  }
  return inCallBottomBarSpacing_spacing;
}

unint64_t __43__PHUIConfiguration_inCallBottomBarSpacing__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xF) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_100203E00[result];
  }
  inCallBottomBarSpacing_spacing = v2;
  return result;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __47__PHUIConfiguration_inCallBottomBarLowerOffset__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallBottomBarLowerOffset_onceToken != -1) {
    dispatch_once(&inCallBottomBarLowerOffset_onceToken, block);
  }
  return inCallBottomBarLowerOffset_spacing;
}

char *__47__PHUIConfiguration_inCallBottomBarLowerOffset__block_invoke(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 7) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_100203E80[(void)(result - 1)];
  }
  inCallBottomBarLowerOffset_spacing = v2;
  return result;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__PHUIConfiguration_inCallBottomBarMaxTitleSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallBottomBarMaxTitleSize_onceToken != -1) {
    dispatch_once(&inCallBottomBarMaxTitleSize_onceToken, block);
  }
  if (inCallBottomBarMaxTitleSize_size) {
    return 1;
  }
  else {
    return 2;
  }
}

id __48__PHUIConfiguration_inCallBottomBarMaxTitleSize__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  inCallBottomBarMaxTitleSize_size = result == 0;
  return result;
}

+ (unint64_t)inCallControlSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__PHUIConfiguration_inCallControlSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallControlSize_onceToken != -1) {
    dispatch_once(&inCallControlSize_onceToken, block);
  }
  return inCallControlSize_size;
}

char *__38__PHUIConfiguration_inCallControlSize__block_invoke(uint64_t a1)
{
  id result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 5) > 9) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = qword_100203EC0[(void)(result - 5)];
  }
  inCallControlSize_size = v2;
  return result;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__PHUIConfiguration_inCallSlideToAnswerSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallSlideToAnswerSize_onceToken != -1) {
    dispatch_once(&inCallSlideToAnswerSize_onceToken, block);
  }
  if (inCallSlideToAnswerSize_size) {
    return 3;
  }
  else {
    return 2;
  }
}

unint64_t __44__PHUIConfiguration_inCallSlideToAnswerSize__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  inCallSlideToAnswerSize_size = (result < 0xF) & (0x5060u >> result);
  return result;
}

+ (unint64_t)inCallBottomBarAssetSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__PHUIConfiguration_inCallBottomBarAssetSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallBottomBarAssetSize_onceToken != -1) {
    dispatch_once(&inCallBottomBarAssetSize_onceToken, block);
  }
  if (inCallBottomBarAssetSize_size) {
    return 3;
  }
  else {
    return 2;
  }
}

unint64_t __45__PHUIConfiguration_inCallBottomBarAssetSize__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  inCallBottomBarAssetSize_size = (result < 0xF) & (0x5060u >> result);
  return result;
}

+ (double)ambientInCallControlSize
{
  unint64_t v2 = +[PHUIConfiguration screenSize] - 10;
  if (v2 < 6) {
    return dbl_100203F10[v2];
  }
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6) {
    return 104.0;
  }
  unint64_t v4 = +[PHUIConfiguration inCallBottomBarSpacing];
  double result = 90.0;
  if (v4 == 3) {
    return 104.0;
  }
  return result;
}

+ (unint64_t)ambientVerticalSizeClass
{
  unint64_t v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v4;
  }
  return (int)v7 > 375;
}

+ (unint64_t)ambientHorizontalSizeClass
{
  unint64_t v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  return (int)v7 > 667;
}

+ (double)ambientVerticalPadding
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 37.0;
  if (v2 == 1) {
    return 44.0;
  }
  return result;
}

+ (double)ambientHorizontalPadding
{
  unint64_t v2 = +[PHUIConfiguration ambientHorizontalSizeClass];
  double result = 40.0;
  if (v2 == 1) {
    return 6.0;
  }
  return result;
}

+ (double)ambientInCallControlSpacing
{
  return 24.0;
}

+ (double)ambientAudioRoutesInset
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 16.0;
  if (v2 == 1) {
    return 26.0;
  }
  return result;
}

+ (double)ambientAudioRoutesButtonSize
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 40.0;
  if (v2 == 1) {
    return 54.0;
  }
  return result;
}

+ (double)ambientAudioRoutesSymbolInset
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 6.0;
  if (v2 == 1) {
    return 3.0;
  }
  return result;
}

+ (unint64_t)handsetDialerSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__PHUIConfiguration_handsetDialerSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (handsetDialerSpacing_onceToken != -1) {
    dispatch_once(&handsetDialerSpacing_onceToken, block);
  }
  return handsetDialerSpacing_spacing;
}

unint64_t __41__PHUIConfiguration_handsetDialerSpacing__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 0xE) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_100203F40[result];
  }
  handsetDialerSpacing_spacing = v2;
  return result;
}

+ (unint64_t)handsetDialerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__PHUIConfiguration_handsetDialerSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (handsetDialerSize_onceToken != -1) {
    dispatch_once(&handsetDialerSize_onceToken, block);
  }
  return handsetDialerSize_size;
}

char *__38__PHUIConfiguration_handsetDialerSize__block_invoke(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  if ((unint64_t)(result - 1) > 0xE) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = qword_100203FB8[(void)(result - 1)];
  }
  handsetDialerSize_size = v2;
  return result;
}

+ (double)yOffsetForDialerLCDView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__PHUIConfiguration_yOffsetForDialerLCDView__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (yOffsetForDialerLCDView_onceToken != -1) {
    dispatch_once(&yOffsetForDialerLCDView_onceToken, block);
  }
  return *(double *)&yOffsetForDialerLCDView_yOffset;
}

unint64_t __44__PHUIConfiguration_yOffsetForDialerLCDView__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldUseExplicitLayoutDimensions])
  {
    unint64_t result = (unint64_t)[*(id *)(a1 + 32) yOffsetForDialerLCDViewForDxDevices];
  }
  else
  {
    unint64_t result = +[PHUIConfiguration screenSize];
    if (result > 7) {
      uint64_t v3 = 0x4061000000000000;
    }
    else {
      uint64_t v3 = qword_100204030[result];
    }
  }
  yOffsetForDialerLCDView_yOffset = v3;
  return result;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  double result = 0.0;
  if (v2 - 10 <= 5) {
    return dbl_100204070[v2 - 10];
  }
  return result;
}

+ (double)yOffsetForParticipantsView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __47__PHUIConfiguration_yOffsetForParticipantsView__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (yOffsetForParticipantsView_onceToken != -1) {
    dispatch_once(&yOffsetForParticipantsView_onceToken, block);
  }
  return *(double *)&yOffsetForParticipantsView_yOffset;
}

double __47__PHUIConfiguration_yOffsetForParticipantsView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) yOffsetForDialerLCDView];
  double v3 = v2;
  [*(id *)(a1 + 32) yParticipantsViewAdjustmentForKeypad];
  double result = v3 + v4;
  yOffsetForParticipantsView_yOffset = *(void *)&result;
  return result;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (yParticipantsViewAdjustmentForKeypad_onceToken != -1) {
    dispatch_once(&yParticipantsViewAdjustmentForKeypad_onceToken, &__block_literal_global_44);
  }
  return *(double *)&yParticipantsViewAdjustmentForKeypad_yOffset;
}

void __57__PHUIConfiguration_yParticipantsViewAdjustmentForKeypad__block_invoke(id a1)
{
  if (!+[PHUIConfiguration screenSize]) {
    yParticipantsViewAdjustmentForKeypad_yOffset = 0x4046800000000000;
  }
}

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  double v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  double v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (BOOL)canRotateInCallUIOverlayForFaceTime
{
  return 0;
}

+ (unint64_t)contentViewSizeForFaceTime
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __47__PHUIConfiguration_contentViewSizeForFaceTime__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contentViewSizeForFaceTime_onceToken != -1) {
    dispatch_once(&contentViewSizeForFaceTime_onceToken, block);
  }
  return contentViewSizeForFaceTime_size;
}

id __47__PHUIConfiguration_contentViewSizeForFaceTime__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  uint64_t v2 = 1;
  if (result == (id)7) {
    uint64_t v2 = 2;
  }
  if (result == (id)6) {
    uint64_t v2 = 0;
  }
  contentViewSizeForFaceTime_size = v2;
  return result;
}

+ (double)pipWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __29__PHUIConfiguration_pipWidth__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipWidth_onceToken != -1) {
    dispatch_once(&pipWidth_onceToken, block);
  }
  return *(double *)&pipWidth_width;
}

unint64_t __29__PHUIConfiguration_pipWidth__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  if (result > 8) {
    uint64_t v2 = 0x4055900000000000;
  }
  else {
    uint64_t v2 = qword_1002040A0[result];
  }
  pipWidth_width = v2;
  return result;
}

+ (double)pipWallInset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__PHUIConfiguration_pipWallInset__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipWallInset_onceToken != -1) {
    dispatch_once(&pipWallInset_onceToken, block);
  }
  return *(double *)&pipWallInset_inset;
}

char *__33__PHUIConfiguration_pipWallInset__block_invoke(uint64_t a1)
{
  unint64_t result = (char *)[*(id *)(a1 + 32) screenSize];
  double v2 = 13.0;
  if ((unint64_t)(result - 4) <= 0xA) {
    double v2 = dbl_1002040E8[(void)(result - 4)];
  }
  pipWallInset_inset = *(void *)&v2;
  return result;
}

+ (double)pipPartialHomeOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__PHUIConfiguration_pipPartialHomeOffset__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipPartialHomeOffset_onceToken != -1) {
    dispatch_once(&pipPartialHomeOffset_onceToken, block);
  }
  return *(double *)&pipPartialHomeOffset_offset;
}

id __41__PHUIConfiguration_pipPartialHomeOffset__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  BOOL v2 = result == (id)9 || result == (id)4;
  double v3 = 0.0;
  if (v2) {
    double v3 = 2.5;
  }
  pipPartialHomeOffset_offset = *(void *)&v3;
  return result;
}

+ (double)pipRadius
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __30__PHUIConfiguration_pipRadius__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipRadius_onceToken != -1) {
    dispatch_once(&pipRadius_onceToken, block);
  }
  return *(double *)&pipRadius_radius;
}

id __30__PHUIConfiguration_pipRadius__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  double v2 = 4.0;
  if (result == (id)4) {
    double v2 = 17.0;
  }
  pipRadius_radius = *(void *)&v2;
  return result;
}

+ (unint64_t)pipStatusBarPadding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__PHUIConfiguration_pipStatusBarPadding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipStatusBarPadding_onceToken != -1) {
    dispatch_once(&pipStatusBarPadding_onceToken, block);
  }
  return (unint64_t)*(double *)&pipStatusBarPadding_padding;
}

char *__40__PHUIConfiguration_pipStatusBarPadding__block_invoke(uint64_t a1)
{
  id result = (char *)[*(id *)(a1 + 32) screenSize];
  double v2 = 1.0;
  if ((unint64_t)(result - 1) <= 0xE) {
    double v2 = dbl_100204140[(void)(result - 1)];
  }
  pipStatusBarPadding_padding = *(void *)&v2;
  return result;
}

+ (BOOL)shouldUseFullScreenPeoplePicker
{
  unint64_t v2 = (unint64_t)[a1 screenSize];
  return (v2 > 8) | (0x73u >> v2) & 1;
}

+ (unint64_t)inCallFaceTimeOverlayUISize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__PHUIConfiguration_inCallFaceTimeOverlayUISize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallFaceTimeOverlayUISize_onceToken != -1) {
    dispatch_once(&inCallFaceTimeOverlayUISize_onceToken, block);
  }
  if (inCallFaceTimeOverlayUISize_size) {
    return 3;
  }
  else {
    return 2;
  }
}

unint64_t __48__PHUIConfiguration_inCallFaceTimeOverlayUISize__block_invoke(uint64_t a1)
{
  unint64_t result = (unint64_t)[*(id *)(a1 + 32) screenSize];
  inCallFaceTimeOverlayUISize_size = (result < 9) & (0x18Cu >> result);
  return result;
}

+ (unint64_t)tableViewCellVerticalSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__PHUIConfiguration_tableViewCellVerticalSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tableViewCellVerticalSpacing_onceToken != -1) {
    dispatch_once(&tableViewCellVerticalSpacing_onceToken, block);
  }
  if (tableViewCellVerticalSpacing_spacing) {
    return 2;
  }
  else {
    return 1;
  }
}

id __49__PHUIConfiguration_tableViewCellVerticalSpacing__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  tableViewCellVerticalSpacing_spacing = result == (id)7;
  return result;
}

+ (unint64_t)voicemailLayoutSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__PHUIConfiguration_voicemailLayoutSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailLayoutSpacing_onceToken != -1) {
    dispatch_once(&voicemailLayoutSpacing_onceToken, block);
  }
  if (voicemailLayoutSpacing_size) {
    return 3;
  }
  else {
    return 2;
  }
}

id __43__PHUIConfiguration_voicemailLayoutSpacing__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  voicemailLayoutSpacing_size = result == (id)6;
  return result;
}

+ (BOOL)preferShorterStrings
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__PHUIConfiguration_preferShorterStrings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preferShorterStrings_onceToken != -1) {
    dispatch_once(&preferShorterStrings_onceToken, block);
  }
  return preferShorterStrings_preferShortStrings;
}

id __41__PHUIConfiguration_preferShorterStrings__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) screenSize];
  preferShorterStrings_preferShortStrings = result == 0;
  return result;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  return (v2 < 0x10) & (0xFE13u >> v2);
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (shouldUseSOSTightSpacing_onceToken != -1) {
    dispatch_once(&shouldUseSOSTightSpacing_onceToken, &__block_literal_global_47);
  }
  return shouldUseSOSTightSpacing_isSEDevice;
}

void __45__PHUIConfiguration_shouldUseSOSTightSpacing__block_invoke(id a1)
{
  unint64_t v1 = +[PHUIConfiguration inCallControlSpacing];
  if (v1 <= 6) {
    shouldUseSOSTightSpacing_isSEDevice = (7u >> v1) & 1;
  }
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_100203CE0[[a1 screenSize] == (id)1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_100203CF0[[a1 screenSize] == (id)1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_100203D00[[a1 screenSize] == (id)1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  if ([a1 screenSize] == (id)1) {
    return 0.02998;
  }
  double v3 = objc_opt_class();

  [v3 inCallControlButtonVerticalSpacingRatio];
  return result;
}

+ (double)inCallControlButtonSizeRatio
{
  return 0.1976;
}

+ (double)dialerLCDFontSize
{
  if (dialerLCDFontSize_onceToken != -1) {
    dispatch_once(&dialerLCDFontSize_onceToken, &__block_literal_global_21);
  }
  return *(double *)&dialerLCDFontSize_fontSize;
}

void __50__PHUIConfiguration_DialerView__dialerLCDFontSize__block_invoke(id a1)
{
  unint64_t v1 = +[PHUIConfiguration screenSize];
  double v2 = dbl_100204370[v1 == 1];
  if (v1 == 6) {
    double v2 = 43.2999992;
  }
  dialerLCDFontSize_fontSize = *(void *)&v2;
}

+ (double)dialerLCDLabelFontSize
{
  if (dialerLCDLabelFontSize_onceToken != -1) {
    dispatch_once(&dialerLCDLabelFontSize_onceToken, &__block_literal_global_42_1);
  }
  return *(double *)&dialerLCDLabelFontSize_fontSize;
}

void __55__PHUIConfiguration_DialerView__dialerLCDLabelFontSize__block_invoke(id a1)
{
  unint64_t v1 = +[PHUIConfiguration screenSize];
  BOOL v2 = v1 == 6 || v1 == 9;
  double v3 = 18.0;
  if (v2) {
    double v3 = 15.0;
  }
  dialerLCDLabelFontSize_fontSize = *(void *)&v3;
}

+ (double)yOffsetForSmartDialerLCDView
{
  id v2 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v3 = [v2 smartDialerEnabled];

  double result = 0.0;
  if (v3)
  {
    uint64_t v5 = +[PHUIConfiguration screenSize];
    double result = -25.0;
    if (v5 > 8)
    {
      if (v5 != 9 && v5 != 13) {
        return 43.0;
      }
    }
    else
    {
      if (v5)
      {
        if (v5 == 1) {
          return result;
        }
        return 43.0;
      }
      return 5.0;
    }
  }
  return result;
}

+ (BOOL)requiresSmallScreenConfig
{
  id v2 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v2 smartDialerEnabled]) {
    BOOL v3 = +[PHUIConfiguration handsetDialerSpacing] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end