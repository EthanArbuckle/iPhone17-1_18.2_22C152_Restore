@interface StyleSupport
+ (CGSize)appDefaultSize;
+ (CGSize)appMaxSize;
+ (CGSize)appMinSize;
+ (CGSize)compactAppDefaultSize;
+ (CGSize)compactAppMaxSize;
+ (CGSize)compactAppMinSize;
+ (CGSize)effectCellImageSize;
+ (CGSize)quickLookSceneDefaultSize;
+ (double)badgeViewCornerSize;
+ (double)badgeViewShadowRadius;
+ (double)badgeViewSimpleShadowRadius;
+ (double)composeChatControllerAdditionalBlurViewHeight;
+ (double)composeChatControllerInitialViewWidth;
+ (double)contactImageViewImagePadding;
+ (double)contactImageViewTextFontSize;
+ (double)contactImageViewYOffset;
+ (double)effectButtonCornerRadius;
+ (double)effectCellCornerRadius;
+ (double)effectCellEdgePadding;
+ (double)effectCellMinimumHeight;
+ (double)effectCellSpacing;
+ (double)effectCellTopPadding;
+ (double)effectCellWidth;
+ (double)quickReplyButtonHorizontalPadding;
+ (double)quickReplyButtonLabelPaddingLeading;
+ (double)quickReplyButtonLabelPaddingTrailing;
+ (double)quickReplyButtonListAXPaddingLeading;
+ (double)quickReplyButtonListAXPaddingTrailing;
+ (double)quickReplyButtonListSpacing;
+ (double)quickReplyButtonMinHeight;
+ (double)replyListPadding;
+ (double)scrollOffsetZ;
+ (double)sideMountBlurRadius;
+ (double)sideMountContentDismissedScale;
+ (double)sideMountPresentationSpacing;
+ (double)sideMountSlideZOffset;
+ (double)sideMountWidth;
+ (double)sideMountWidthDismissedScale;
+ (double)tapbackBannerCenterThreshold;
+ (double)tapbackStartingScaleX;
+ (double)tapbackStartingScaleY;
+ (double)textViewOffset;
+ (double)trailingAccessoryContainerViewWidth;
+ (double)transcriptTitleViewAvatarButtonDiameter;
+ (double)transcriptTitleViewHeight;
+ (double)transcriptTitleViewKTBadgeDiameter;
+ (double)transcriptTitleViewKTBadgePadding;
+ (double)vfxLiftBalloonViewDuration;
+ (double)vfxLiftBalloonViewHeight;
+ (double)votingViewAdditionalTopInset;
+ (double)votingViewAvatarDiameter;
+ (double)votingViewAvatarToTextSpacing;
+ (double)votingViewAvatarViewGlyphFrameHeight;
+ (double)votingViewAvatarViewGlyphFrameWidth;
+ (double)votingViewAvatarViewLabelHeight;
+ (double)votingViewBlurWidth;
+ (double)votingViewCellWidth;
+ (double)votingViewCloseButtonLeftPadding;
+ (double)votingViewExpandedTallyHeight;
+ (double)votingViewExpandedTallyWidth;
+ (double)votingViewHorizontalPadding;
+ (double)votingViewItemSpacing;
+ (double)votingViewPlatterCornerRadius;
+ (double)votingViewTallyLabelSpacing;
+ (double)windowChromePadding;
+ (double)windowPadding;
+ (int64_t)maxNumberOfSuggestions;
+ (int64_t)quickReplyButtonListAXPaddingBottom;
- (_TtC7ChatKit12StyleSupport)init;
@end

@implementation StyleSupport

+ (double)windowChromePadding
{
  return 24.0;
}

+ (double)windowPadding
{
  return 12.0;
}

+ (CGSize)appMinSize
{
  double v2 = 760.0;
  double v3 = 540.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)appMaxSize
{
  double v2 = 900.0;
  double v3 = 1080.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)appDefaultSize
{
  double v2 = 760.0;
  double v3 = 720.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)compactAppMinSize
{
  double v2 = 440.0;
  double v3 = 540.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)compactAppMaxSize
{
  double v2 = 900.0;
  double v3 = 1080.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)compactAppDefaultSize
{
  double v2 = 440.0;
  double v3 = 720.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)quickLookSceneDefaultSize
{
  double v2 = 392.0;
  double v3 = 720.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)trailingAccessoryContainerViewWidth
{
  return 440.0;
}

+ (double)replyListPadding
{
  return 20.0;
}

+ (double)vfxLiftBalloonViewHeight
{
  return 27.0;
}

+ (double)vfxLiftBalloonViewDuration
{
  return 1.5;
}

+ (double)scrollOffsetZ
{
  return -52.0;
}

+ (double)textViewOffset
{
  return 44.0;
}

+ (double)effectCellMinimumHeight
{
  return 157.0;
}

+ (double)effectCellWidth
{
  return 131.0;
}

+ (CGSize)effectCellImageSize
{
  if (qword_1E9237700 != -1) {
    swift_once();
  }
  double v3 = *((double *)&xmmword_1E923A438 + 1);
  double v2 = *(double *)&xmmword_1E923A438;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)effectCellEdgePadding
{
  return 12.0;
}

+ (double)effectCellTopPadding
{
  return 12.0;
}

+ (double)effectCellCornerRadius
{
  return 12.0;
}

+ (double)effectButtonCornerRadius
{
  return 24.0;
}

+ (double)effectCellSpacing
{
  return 12.0;
}

+ (int64_t)maxNumberOfSuggestions
{
  return 12;
}

+ (double)sideMountPresentationSpacing
{
  return 12.0;
}

+ (double)sideMountSlideZOffset
{
  return -20.0;
}

+ (double)sideMountWidthDismissedScale
{
  return 0.66;
}

+ (double)sideMountContentDismissedScale
{
  return 0.95;
}

+ (double)sideMountBlurRadius
{
  return 4.0;
}

+ (double)sideMountWidth
{
  return 440.0;
}

+ (double)transcriptTitleViewHeight
{
  return 87.0;
}

+ (double)transcriptTitleViewAvatarButtonDiameter
{
  return 52.0;
}

+ (double)transcriptTitleViewKTBadgeDiameter
{
  return 16.0;
}

+ (double)transcriptTitleViewKTBadgePadding
{
  return 8.0;
}

+ (double)tapbackStartingScaleX
{
  return 0.3;
}

+ (double)tapbackStartingScaleY
{
  return 0.3;
}

+ (double)tapbackBannerCenterThreshold
{
  return 151.0;
}

+ (double)votingViewCellWidth
{
  return 64.0;
}

+ (double)votingViewHorizontalPadding
{
  return 24.0;
}

+ (double)votingViewAdditionalTopInset
{
  return 4.0;
}

+ (double)votingViewItemSpacing
{
  return 24.0;
}

+ (double)votingViewCloseButtonLeftPadding
{
  return 22.0;
}

+ (double)votingViewPlatterCornerRadius
{
  return 34.0;
}

+ (double)votingViewBlurWidth
{
  return 88.0;
}

+ (double)votingViewExpandedTallyWidth
{
  return 27.0;
}

+ (double)votingViewExpandedTallyHeight
{
  return 27.0;
}

+ (double)votingViewAvatarDiameter
{
  return 44.0;
}

+ (double)votingViewAvatarToTextSpacing
{
  return 4.0;
}

+ (double)votingViewTallyLabelSpacing
{
  return 0.0;
}

+ (double)votingViewAvatarViewLabelHeight
{
  return 18.0;
}

+ (double)votingViewAvatarViewGlyphFrameWidth
{
  return 20.0;
}

+ (double)votingViewAvatarViewGlyphFrameHeight
{
  return 20.0;
}

+ (double)contactImageViewTextFontSize
{
  return 68.0;
}

+ (double)contactImageViewImagePadding
{
  return 4.0;
}

+ (double)contactImageViewYOffset
{
  return 13.0;
}

+ (double)composeChatControllerAdditionalBlurViewHeight
{
  return 16.0;
}

+ (double)composeChatControllerInitialViewWidth
{
  return 440.0;
}

+ (double)quickReplyButtonListSpacing
{
  return 16.0;
}

+ (double)quickReplyButtonListAXPaddingLeading
{
  return -12.0;
}

+ (double)quickReplyButtonListAXPaddingTrailing
{
  return -10.0;
}

+ (int64_t)quickReplyButtonListAXPaddingBottom
{
  return 0;
}

+ (double)quickReplyButtonLabelPaddingLeading
{
  return -4.0;
}

+ (double)quickReplyButtonLabelPaddingTrailing
{
  return -4.0;
}

+ (double)quickReplyButtonHorizontalPadding
{
  return 20.0;
}

+ (double)quickReplyButtonMinHeight
{
  return 44.0;
}

+ (double)badgeViewCornerSize
{
  return 12.0;
}

+ (double)badgeViewShadowRadius
{
  return 6.0;
}

+ (double)badgeViewSimpleShadowRadius
{
  return 1.0;
}

- (_TtC7ChatKit12StyleSupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StyleSupport();
  return [(StyleSupport *)&v3 init];
}

@end