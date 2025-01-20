@interface PHUIConfiguration
+ (BOOL)canAutoRotateInCallUIForFaceTime;
+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio;
+ (BOOL)canRotateInCallUIOverlayForFaceTime;
+ (BOOL)participantsViewShouldCompressLabels;
+ (BOOL)preferShorterStrings;
+ (BOOL)requiresSmallScreenConfig;
+ (BOOL)shouldUseExplicitLayoutDimensions;
+ (BOOL)shouldUseFullScreenPeoplePicker;
+ (BOOL)shouldUseSOSTightSpacing;
+ (BOOL)usesMiddleCenteringView;
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
+ (double)intrinsicWidthForParticipantsView;
+ (double)pipPartialHomeOffset;
+ (double)pipRadius;
+ (double)pipWallInset;
+ (double)pipWidth;
+ (double)yOffsetForDialerLCDView;
+ (double)yOffsetForDialerLCDViewForDxDevices;
+ (double)yOffsetForParticipantsView;
+ (double)yOffsetForSmartDialerLCDView;
+ (double)yOffsetMultiplierForParticipantsView;
+ (double)yParticipantsViewAdjustmentForKeypad;
+ (id)multipleCallParticipantLabelFont;
+ (id)multipleCallParticipantLabelFontMiniWindow;
+ (id)multipleCallStatusLabelFont;
+ (id)multipleCallStatusLabelFontMiniWindow;
+ (id)singleCallFontWithSize:(unint64_t)a3;
+ (id)singleCallLargeStatusLabelFont;
+ (id)singleCallParticipantLabelAmbientFont;
+ (id)singleCallParticipantLabelBannerFontForText:(id)a3 availableWidth:(double)a4;
+ (id)singleCallParticipantLabelBannerMaximumFont;
+ (id)singleCallParticipantLabelBannerMinimumFont;
+ (id)singleCallParticipantLabelFontForBannerWithPointSize:(double)a3;
+ (id)singleCallParticipantLabelFontForCallDisplayStyle:(int64_t)a3;
+ (id)singleCallParticipantLabelFullscreenFont;
+ (id)singleCallParticipantLabelMiniWindowFont;
+ (id)singleCallSmallStatusLabelFont;
+ (id)singleCallSmallerStatusLabelFont;
+ (id)singleCallStatusLabelFont;
+ (id)singleCallStatusLabelFontForCallDisplayStyle:(int64_t)a3;
+ (id)statusLabelFontColorForCallDisplayStyle:(int64_t)a3;
+ (int64_t)yOffsetLayoutAttributeForParticipantsView;
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
+ (unint64_t)inCallParticipantsSpacing;
+ (unint64_t)inCallSlideToAnswerSize;
+ (unint64_t)pipStatusBarPadding;
+ (unint64_t)screenSize;
+ (unint64_t)tableViewCellVerticalSpacing;
+ (unint64_t)voicemailLayoutSpacing;
+ (unint64_t)yTopMarginSpacingForMultiParticipantsView;
@end

@implementation PHUIConfiguration

+ (double)yOffsetMultiplierForParticipantsView
{
  if (qword_100325CA0 != -1) {
    dispatch_once(&qword_100325CA0, &stru_1002CD5A8);
  }
  return *(double *)&qword_10031E210;
}

+ (unint64_t)yTopMarginSpacingForMultiParticipantsView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B39C;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325CB0 != -1) {
    dispatch_once(&qword_100325CB0, block);
  }
  return qword_100325CA8;
}

+ (int64_t)yOffsetLayoutAttributeForParticipantsView
{
  if (qword_100325CC0 != -1) {
    dispatch_once(&qword_100325CC0, &stru_1002CD5E8);
  }
  if (byte_100325CB8) {
    return 4;
  }
  else {
    return 3;
  }
}

+ (double)intrinsicWidthForParticipantsView
{
  if (qword_100325CD0 != -1) {
    dispatch_once(&qword_100325CD0, &stru_1002CD608);
  }
  return *(double *)&qword_100325CC8;
}

+ (unint64_t)inCallParticipantsSpacing
{
  if (qword_100325CE0 != -1) {
    dispatch_once(&qword_100325CE0, &stru_1002CD628);
  }
  if (byte_100325CD8) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)singleCallParticipantLabelFontForCallDisplayStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      a1 = +[PHUIConfiguration singleCallParticipantLabelBannerMaximumFont];
      goto LABEL_9;
    case 1:
      a1 = +[PHUIConfiguration singleCallParticipantLabelMiniWindowFont];
      goto LABEL_9;
    case 2:
    case 4:
      a1 = +[PHUIConfiguration singleCallParticipantLabelFullscreenFont];
      goto LABEL_9;
    case 3:
      a1 = +[PHUIConfiguration singleCallParticipantLabelAmbientFont];
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

+ (id)singleCallParticipantLabelFullscreenFont
{
  v2 = +[CNKFeatures sharedInstance];
  unsigned int v3 = [v2 isHeroImageEnabled];

  if (v3) {
    +[UIFont phPreferredBoldFontForTextStyle:UIFontTextStyleLargeTitle];
  }
  else {
  uint64_t v4 = +[UIFont phPreferredFontForTextStyle:UIFontTextStyleLargeTitle];
  }

  return v4;
}

+ (id)singleCallParticipantLabelAmbientFont
{
  v2 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:UIFontTextStyleLargeTitle addingSymbolicTraits:2];
  unsigned int v3 = +[UIFont fontWithDescriptor:v2 size:85.0];

  return v3;
}

+ (id)singleCallParticipantLabelBannerFontForText:(id)a3 availableWidth:(double)a4
{
  id v5 = a3;
  v6 = v5;
  if (!v5 || ((id v7 = [v5 length], a4 != 0.0) ? (v8 = v7 == 0) : (v8 = 1), v8))
  {
    v9 = +[PHUIConfiguration singleCallParticipantLabelBannerMaximumFont];
  }
  else
  {
    v10 = +[PHUIConfiguration singleCallParticipantLabelBannerMaximumFont];
    [v10 pointSize];
    double v12 = v11;

    v13 = +[PHUIConfiguration singleCallParticipantLabelBannerMinimumFont];
    [v13 pointSize];
    double v15 = v14;

    v16 = 0;
    if (v12 <= v15)
    {
LABEL_11:
      id v21 = +[PHUIConfiguration singleCallParticipantLabelBannerMinimumFont];
    }
    else
    {
      while (1)
      {
        v17 = v16;
        v16 = +[PHUIConfiguration singleCallParticipantLabelFontForBannerWithPointSize:v12];

        NSAttributedStringKey v23 = NSFontAttributeName;
        v24 = v16;
        v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v6 sizeWithAttributes:v18];
        double v20 = v19;

        if (v20 <= a4) {
          break;
        }
        double v12 = v12 + -0.5;
        if (v12 <= v15) {
          goto LABEL_11;
        }
      }
      id v21 = v16;
      v16 = v21;
    }
    v9 = v21;
  }

  return v9;
}

+ (id)singleCallParticipantLabelMiniWindowFont
{
  return +[UIFont phPreferredFontForTextStyle:UIFontTextStyleTitle2];
}

+ (id)singleCallParticipantLabelBannerMaximumFont
{
  v2 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:UIFontTextStyleTitle2];
  [v2 pointSize];
  unsigned int v3 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");

  return v3;
}

+ (id)singleCallParticipantLabelBannerMinimumFont
{
  return +[UIFont phPreferredFontForTextStyle:UIFontTextStyleHeadline];
}

+ (id)singleCallParticipantLabelFontForBannerWithPointSize:(double)a3
{
  return +[UIFont systemFontOfSize:a3 weight:UIFontWeightSemibold];
}

+ (id)statusLabelFontColorForCallDisplayStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
  {
    a1 = +[UIColor secondaryLabelColor];
  }
  return a1;
}

+ (id)multipleCallParticipantLabelFont
{
  if (qword_100325CF0 != -1) {
    dispatch_once(&qword_100325CF0, &stru_1002CD648);
  }
  v2 = (void *)qword_100325CE8;

  return v2;
}

+ (id)multipleCallParticipantLabelFontMiniWindow
{
  if (qword_100325D00 != -1) {
    dispatch_once(&qword_100325D00, &stru_1002CD668);
  }
  v2 = (void *)qword_100325CF8;

  return v2;
}

+ (id)singleCallSmallerStatusLabelFont
{
  if (qword_100325D10 != -1) {
    dispatch_once(&qword_100325D10, &stru_1002CD688);
  }
  v2 = (void *)qword_100325D08;

  return v2;
}

+ (id)singleCallSmallStatusLabelFont
{
  if (qword_100325D20 != -1) {
    dispatch_once(&qword_100325D20, &stru_1002CD6A8);
  }
  v2 = (void *)qword_100325D18;

  return v2;
}

+ (id)singleCallLargeStatusLabelFont
{
  if (qword_100325D30 != -1) {
    dispatch_once(&qword_100325D30, &stru_1002CD6C8);
  }
  v2 = (void *)qword_100325D28;

  return v2;
}

+ (id)singleCallStatusLabelFontForCallDisplayStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v6 = &UIFontTextStyleSubheadline;
      goto LABEL_5;
    case 1:
      v6 = &UIFontTextStyleBody;
LABEL_5:
      uint64_t v3 = +[UIFont phPreferredFontForTextStyle:*v6];
      break;
    case 2:
    case 4:
      uint64_t v4 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:UIFontTextStyleTitle2];
      id v5 = +[CNKFeatures sharedInstance];
      [v5 isButtonLayoutEnabled];

      [v4 pointSize];
      goto LABEL_7;
    case 3:
      uint64_t v4 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:UIFontTextStyleTitle2];
      [v4 pointSize];
LABEL_7:
      id v7 = +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:");
      uint64_t v3 = [v7 withCaseSensitiveAttribute];

      break;
    default:
      break;
  }

  return v3;
}

+ (id)singleCallStatusLabelFont
{
  if (qword_100325D40 != -1) {
    dispatch_once(&qword_100325D40, &stru_1002CD6E8);
  }
  v2 = (void *)qword_100325D38;

  return v2;
}

+ (id)singleCallFontWithSize:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = +[PHUIConfiguration singleCallSmallerStatusLabelFont];
      break;
    case 1uLL:
      uint64_t v3 = +[PHUIConfiguration singleCallSmallStatusLabelFont];
      break;
    case 3uLL:
      uint64_t v3 = +[PHUIConfiguration singleCallLargeStatusLabelFont];
      break;
    default:
      uint64_t v3 = +[PHUIConfiguration singleCallStatusLabelFont];
      break;
  }

  return v3;
}

+ (id)multipleCallStatusLabelFont
{
  if (qword_100325D50 != -1) {
    dispatch_once(&qword_100325D50, &stru_1002CD708);
  }
  v2 = (void *)qword_100325D48;

  return v2;
}

+ (id)multipleCallStatusLabelFontMiniWindow
{
  if (qword_100325D60 != -1) {
    dispatch_once(&qword_100325D60, &stru_1002CD728);
  }
  v2 = (void *)qword_100325D58;

  return v2;
}

+ (BOOL)participantsViewShouldCompressLabels
{
  return +[PHUIConfiguration screenSize] == 0;
}

+ (BOOL)usesMiddleCenteringView
{
  if (qword_100325D70 != -1) {
    dispatch_once(&qword_100325D70, &stru_1002CD748);
  }
  return byte_100325D68;
}

+ (unint64_t)screenSize
{
  if (qword_100325E88 != -1) {
    dispatch_once(&qword_100325E88, &stru_1002CE368);
  }
  return qword_100325E80;
}

+ (unint64_t)inCallControlAlignment
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049D44;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325E90 != -1) {
    dispatch_once(&qword_100325E90, block);
  }
  return qword_10031EB28;
}

+ (unint64_t)inCallControlSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049E18;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325EA0 != -1) {
    dispatch_once(&qword_100325EA0, block);
  }
  return qword_100325E98;
}

+ (unint64_t)inCallBottomBarSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049EE8;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325EB0 != -1) {
    dispatch_once(&qword_100325EB0, block);
  }
  return qword_100325EA8;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049FB8;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325EC0 != -1) {
    dispatch_once(&qword_100325EC0, block);
  }
  return qword_100325EB8;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A098;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325ED0 != -1) {
    dispatch_once(&qword_100325ED0, block);
  }
  if (byte_100325EC8) {
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
  block[2] = sub_10004A154;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325ED8 != -1) {
    dispatch_once(&qword_100325ED8, block);
  }
  return qword_10031EB30;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A234;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325EE8 != -1) {
    dispatch_once(&qword_100325EE8, block);
  }
  if (byte_100325EE0) {
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
  block[2] = sub_10004A308;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325EF8 != -1) {
    dispatch_once(&qword_100325EF8, block);
  }
  if (byte_100325EF0) {
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
    return dbl_100284960[v2];
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
  block[2] = sub_10004A614;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F08 != -1) {
    dispatch_once(&qword_100325F08, block);
  }
  return qword_100325F00;
}

+ (unint64_t)handsetDialerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A6E4;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F10 != -1) {
    dispatch_once(&qword_100325F10, block);
  }
  return qword_10031EB38;
}

+ (double)yOffsetForDialerLCDView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A7B8;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F20 != -1) {
    dispatch_once(&qword_100325F20, block);
  }
  return *(double *)&qword_100325F18;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  double result = 0.0;
  if (v2 - 10 <= 5) {
    return dbl_100284AC0[v2 - 10];
  }
  return result;
}

+ (double)yOffsetForParticipantsView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A8F0;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F30 != -1) {
    dispatch_once(&qword_100325F30, block);
  }
  return *(double *)&qword_100325F28;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (qword_100325F40 != -1) {
    dispatch_once(&qword_100325F40, &stru_1002CE388);
  }
  return *(double *)&qword_100325F38;
}

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  unint64_t v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  unint64_t v2 = +[UIDevice currentDevice];
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
  block[2] = sub_10004AAD0;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F50 != -1) {
    dispatch_once(&qword_100325F50, block);
  }
  return qword_100325F48;
}

+ (double)pipWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AB98;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F58 != -1) {
    dispatch_once(&qword_100325F58, block);
  }
  return *(double *)&qword_10031EB40;
}

+ (double)pipWallInset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AC6C;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F60 != -1) {
    dispatch_once(&qword_100325F60, block);
  }
  return *(double *)&qword_10031EB48;
}

+ (double)pipPartialHomeOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AD3C;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F70 != -1) {
    dispatch_once(&qword_100325F70, block);
  }
  return *(double *)&qword_100325F68;
}

+ (double)pipRadius
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AE04;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F80 != -1) {
    dispatch_once(&qword_100325F80, block);
  }
  return *(double *)&qword_100325F78;
}

+ (unint64_t)pipStatusBarPadding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AECC;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F88 != -1) {
    dispatch_once(&qword_100325F88, block);
  }
  return (unint64_t)*(double *)&qword_10031EB50;
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
  block[2] = sub_10004AFD8;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325F98 != -1) {
    dispatch_once(&qword_100325F98, block);
  }
  if (byte_100325F90) {
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
  block[2] = sub_10004B0AC;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325FA8 != -1) {
    dispatch_once(&qword_100325FA8, block);
  }
  if (byte_100325FA0) {
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
  block[2] = sub_10004B174;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325FB8 != -1) {
    dispatch_once(&qword_100325FB8, block);
  }
  if (byte_100325FB0) {
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
  block[2] = sub_10004B230;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100325FC8 != -1) {
    dispatch_once(&qword_100325FC8, block);
  }
  return byte_100325FC0;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  return (char *)+[PHUIConfiguration screenSize] - 10 < (char *)6;
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (qword_100325FD8 != -1) {
    dispatch_once(&qword_100325FD8, &stru_1002CE3A8);
  }
  return byte_100325FD0;
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_100284730[[a1 screenSize] == (id)1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_100284740[[a1 screenSize] == (id)1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_100284750[[a1 screenSize] == (id)1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  if ([a1 screenSize] == (id)1) {
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

+ (double)dialerLCDFontSize
{
  if (qword_1003261F0 != -1) {
    dispatch_once(&qword_1003261F0, &stru_1002CFA30);
  }
  return *(double *)&qword_1003261E8;
}

+ (double)dialerLCDLabelFontSize
{
  if (qword_100326200 != -1) {
    dispatch_once(&qword_100326200, &stru_1002CFA50);
  }
  return *(double *)&qword_1003261F8;
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