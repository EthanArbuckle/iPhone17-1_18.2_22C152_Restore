@interface PHUIConfiguration
+ (BOOL)canAutoRotateInCallUIForFaceTime;
+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio;
+ (BOOL)canRotateInCallUIOverlayForFaceTime;
+ (BOOL)preferShorterStrings;
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
  if (qword_11520 != -1) {
    dispatch_once(&qword_11520, &stru_C448);
  }
  return qword_11518;
}

+ (unint64_t)inCallControlAlignment
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5CDC;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11528 != -1) {
    dispatch_once(&qword_11528, block);
  }
  return qword_114E0;
}

+ (unint64_t)inCallControlSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5DB0;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11538 != -1) {
    dispatch_once(&qword_11538, block);
  }
  return qword_11530;
}

+ (unint64_t)inCallBottomBarSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E80;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11548 != -1) {
    dispatch_once(&qword_11548, block);
  }
  return qword_11540;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5F50;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11558 != -1) {
    dispatch_once(&qword_11558, block);
  }
  return qword_11550;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6030;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11568 != -1) {
    dispatch_once(&qword_11568, block);
  }
  if (byte_11560) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (unint64_t)inCallControlSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_60EC;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11570 != -1) {
    dispatch_once(&qword_11570, block);
  }
  return qword_114E8;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_61CC;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11580 != -1) {
    dispatch_once(&qword_11580, block);
  }
  if (byte_11578) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (unint64_t)inCallBottomBarAssetSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_62A0;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11590 != -1) {
    dispatch_once(&qword_11590, block);
  }
  if (byte_11588) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (double)ambientInCallControlSize
{
  unint64_t v2 = +[PHUIConfiguration screenSize] - 10;
  if (v2 < 6) {
    return dbl_9620[v2];
  }
  if ((char *)+[PHUIConfiguration inCallBottomBarSpacing] == (char *)&dword_4 + 2) {
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
  block[2] = sub_65AC;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115A0 != -1) {
    dispatch_once(&qword_115A0, block);
  }
  return qword_11598;
}

+ (unint64_t)handsetDialerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_667C;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115A8 != -1) {
    dispatch_once(&qword_115A8, block);
  }
  return qword_114F0;
}

+ (double)yOffsetForDialerLCDView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6750;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115B8 != -1) {
    dispatch_once(&qword_115B8, block);
  }
  return *(double *)&qword_115B0;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  double result = 0.0;
  if (v2 - 10 <= 5) {
    return dbl_9780[v2 - 10];
  }
  return result;
}

+ (double)yOffsetForParticipantsView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6888;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115C8 != -1) {
    dispatch_once(&qword_115C8, block);
  }
  return *(double *)&qword_115C0;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (qword_115D8 != -1) {
    dispatch_once(&qword_115D8, &stru_C488);
  }
  return *(double *)&qword_115D0;
}

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  unint64_t v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (char *)&dword_0 + 1;

  return v3;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  unint64_t v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (char *)&dword_0 + 1;

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
  block[2] = sub_6A68;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115E8 != -1) {
    dispatch_once(&qword_115E8, block);
  }
  return qword_115E0;
}

+ (double)pipWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6B30;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115F0 != -1) {
    dispatch_once(&qword_115F0, block);
  }
  return *(double *)&qword_114F8;
}

+ (double)pipWallInset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6C04;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_115F8 != -1) {
    dispatch_once(&qword_115F8, block);
  }
  return *(double *)&qword_11500;
}

+ (double)pipPartialHomeOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6CD4;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11608 != -1) {
    dispatch_once(&qword_11608, block);
  }
  return *(double *)&qword_11600;
}

+ (double)pipRadius
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6D9C;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11618 != -1) {
    dispatch_once(&qword_11618, block);
  }
  return *(double *)&qword_11610;
}

+ (unint64_t)pipStatusBarPadding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E64;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11620 != -1) {
    dispatch_once(&qword_11620, block);
  }
  return (unint64_t)*(double *)&qword_11508;
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
  block[2] = sub_6F70;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11630 != -1) {
    dispatch_once(&qword_11630, block);
  }
  if (byte_11628) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (unint64_t)tableViewCellVerticalSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7044;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11640 != -1) {
    dispatch_once(&qword_11640, block);
  }
  if (byte_11638) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (unint64_t)voicemailLayoutSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_710C;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11650 != -1) {
    dispatch_once(&qword_11650, block);
  }
  if (byte_11648) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (BOOL)preferShorterStrings
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_71C8;
  block[3] = &unk_C468;
  block[4] = a1;
  if (qword_11660 != -1) {
    dispatch_once(&qword_11660, block);
  }
  return byte_11658;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  return (char *)+[PHUIConfiguration screenSize] - 10 < (unsigned char *)&dword_4 + 2;
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (qword_11670 != -1) {
    dispatch_once(&qword_11670, &stru_C4A8);
  }
  return byte_11668;
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_93F0[[a1 screenSize] == (char *)&dword_0 + 1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_9400[[a1 screenSize] == (char *)&dword_0 + 1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_9410[[a1 screenSize] == (char *)&dword_0 + 1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  if ([a1 screenSize] == (char *)&dword_0 + 1) {
    return 0.02998;
  }
  BOOL v3 = objc_opt_class();

  [v3 inCallControlButtonVerticalSpacingRatio];
  return result;
}

+ (double)inCallControlButtonSizeRatio
{
  return 0.1976;
}

@end