@interface CKUIThemeNano
- (UIColor)filledGrayBalloonColor;
- (double)transcriptTypingIndicatorOpacity;
- (id)attachmentBalloonSubtitleTextColor;
- (id)attachmentBalloonTitleTextColor;
- (id)background_balloonColors;
- (id)blue_balloonColors;
- (id)blue_sendButtonColor;
- (id)browserBackgroundColor;
- (id)conversationListDateColor;
- (id)conversationListGroupCountColor;
- (id)conversationListSenderColor;
- (id)conversationListSummaryColor;
- (id)gray_balloonColors;
- (id)gray_unfilledBalloonColor;
- (id)messageAcknowledgmentBalloonBorderColor;
- (id)messageAcknowledgmentBalloonColorForStyle:(int64_t)a3;
- (id)messageAcknowledgmentGrayColor;
- (id)messageAcknowledgmentRedColor;
- (id)messageAcknowledgmentWhiteColor;
- (id)messagesControllerBackgroundColor;
- (id)notificationSubtitleColor;
- (id)progressBarTrackTintColor;
- (id)replyLineColor;
- (id)reply_gray_balloonColors;
- (id)reply_gray_balloonTextColor;
- (id)reply_gray_balloonTextLinkColor;
- (id)reply_gray_unfilledBalloonColor;
- (id)transcriptBackgroundColor;
- (id)transcriptBigEmojiColor;
- (id)transcriptBreadcrumpTextColor;
- (id)transcriptDeemphasizedTextColor;
- (id)transcriptNavBarTextColor;
- (id)transcriptNicknameTextColor;
- (id)transcriptReplyCountColor;
- (id)transcriptTextColor;
- (id)transcriptTypingIndicatorBubbleColor;
- (id)transcriptTypingIndicatorDotColor;
@end

@implementation CKUIThemeNano

- (id)messagesControllerBackgroundColor
{
  if (messagesControllerBackgroundColor_once_1772 != -1) {
    dispatch_once(&messagesControllerBackgroundColor_once_1772, &__block_literal_global_1774);
  }
  v2 = (void *)messagesControllerBackgroundColor_sBehavior_1771;

  return v2;
}

void __50__CKUIThemeNano_messagesControllerBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] blackColor];
  v1 = (void *)messagesControllerBackgroundColor_sBehavior_1771;
  messagesControllerBackgroundColor_sBehavior_1771 = v0;
}

- (id)notificationSubtitleColor
{
  if (notificationSubtitleColor_once_1776 != -1) {
    dispatch_once(&notificationSubtitleColor_once_1776, &__block_literal_global_1778);
  }
  v2 = (void *)notificationSubtitleColor_sBehavior_1775;

  return v2;
}

void __42__CKUIThemeNano_notificationSubtitleColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:1.0];
  v1 = (void *)notificationSubtitleColor_sBehavior_1775;
  notificationSubtitleColor_sBehavior_1775 = v0;
}

- (id)conversationListSenderColor
{
  if (conversationListSenderColor_once_1780 != -1) {
    dispatch_once(&conversationListSenderColor_once_1780, &__block_literal_global_1782);
  }
  v2 = (void *)conversationListSenderColor_sBehavior_1779;

  return v2;
}

void __44__CKUIThemeNano_conversationListSenderColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  v1 = (void *)conversationListSenderColor_sBehavior_1779;
  conversationListSenderColor_sBehavior_1779 = v0;
}

- (id)conversationListSummaryColor
{
  if (conversationListSummaryColor_once != -1) {
    dispatch_once(&conversationListSummaryColor_once, &__block_literal_global_1785);
  }
  v2 = (void *)conversationListSummaryColor_sBehavior_1783;

  return v2;
}

void __45__CKUIThemeNano_conversationListSummaryColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.560784314 green:0.560784314 blue:0.560784314 alpha:1.0];
  v1 = (void *)conversationListSummaryColor_sBehavior_1783;
  conversationListSummaryColor_sBehavior_1783 = v0;
}

- (id)conversationListDateColor
{
  if (conversationListDateColor_once != -1) {
    dispatch_once(&conversationListDateColor_once, &__block_literal_global_1788);
  }
  v2 = (void *)conversationListDateColor_sBehavior_1786;

  return v2;
}

void __42__CKUIThemeNano_conversationListDateColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.560784314 green:0.560784314 blue:0.560784314 alpha:1.0];
  v1 = (void *)conversationListDateColor_sBehavior_1786;
  conversationListDateColor_sBehavior_1786 = v0;
}

- (id)conversationListGroupCountColor
{
  if (conversationListGroupCountColor_once_1790 != -1) {
    dispatch_once(&conversationListGroupCountColor_once_1790, &__block_literal_global_1792);
  }
  v2 = (void *)conversationListGroupCountColor_sBehavior_1789;

  return v2;
}

void __48__CKUIThemeNano_conversationListGroupCountColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.560784314 green:0.560784314 blue:0.560784314 alpha:1.0];
  v1 = (void *)conversationListGroupCountColor_sBehavior_1789;
  conversationListGroupCountColor_sBehavior_1789 = v0;
}

- (id)progressBarTrackTintColor
{
  if (progressBarTrackTintColor_once_1794 != -1) {
    dispatch_once(&progressBarTrackTintColor_once_1794, &__block_literal_global_1796);
  }
  v2 = (void *)progressBarTrackTintColor_sBehavior_1793;

  return v2;
}

void __42__CKUIThemeNano_progressBarTrackTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.121568627 green:0.121568627 blue:0.121568627 alpha:1.0];
  v1 = (void *)progressBarTrackTintColor_sBehavior_1793;
  progressBarTrackTintColor_sBehavior_1793 = v0;
}

- (id)transcriptNavBarTextColor
{
  if (transcriptNavBarTextColor_once != -1) {
    dispatch_once(&transcriptNavBarTextColor_once, &__block_literal_global_1798);
  }
  v2 = (void *)transcriptNavBarTextColor_sBehavior;

  return v2;
}

void __42__CKUIThemeNano_transcriptNavBarTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] blackColor];
  v1 = (void *)transcriptNavBarTextColor_sBehavior;
  transcriptNavBarTextColor_sBehavior = v0;
}

- (id)blue_sendButtonColor
{
  if (blue_sendButtonColor_once != -1) {
    dispatch_once(&blue_sendButtonColor_once, &__block_literal_global_1801);
  }
  v2 = (void *)blue_sendButtonColor_sBehavior_1799;

  return v2;
}

void __37__CKUIThemeNano_blue_sendButtonColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoDefaultBlueColor"];
  v1 = (void *)blue_sendButtonColor_sBehavior_1799;
  blue_sendButtonColor_sBehavior_1799 = v0;
}

- (id)transcriptBackgroundColor
{
  if (transcriptBackgroundColor_once != -1) {
    dispatch_once(&transcriptBackgroundColor_once, &__block_literal_global_1806);
  }
  v2 = (void *)transcriptBackgroundColor_sBehavior;

  return v2;
}

void __42__CKUIThemeNano_transcriptBackgroundColor__block_invoke()
{
  if (CKIsRunningInCarousel()) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  uint64_t v0 = [MEMORY[0x1E4F428B8] blackColor];
  }
  v1 = (void *)transcriptBackgroundColor_sBehavior;
  transcriptBackgroundColor_sBehavior = v0;
}

- (id)transcriptTextColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CKUIThemeNano_transcriptTextColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (transcriptTextColor_once != -1) {
    dispatch_once(&transcriptTextColor_once, block);
  }
  return (id)transcriptTextColor_sBehavior;
}

void __36__CKUIThemeNano_transcriptTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) statusTextColor];
  v2 = (void *)transcriptTextColor_sBehavior;
  transcriptTextColor_sBehavior = v1;
}

- (id)transcriptBreadcrumpTextColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CKUIThemeNano_transcriptBreadcrumpTextColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (transcriptBreadcrumpTextColor_once_1808 != -1) {
    dispatch_once(&transcriptBreadcrumpTextColor_once_1808, block);
  }
  return (id)transcriptBreadcrumpTextColor_sBehavior_1807;
}

void __46__CKUIThemeNano_transcriptBreadcrumpTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) statusTextColor];
  v2 = (void *)transcriptBreadcrumpTextColor_sBehavior_1807;
  transcriptBreadcrumpTextColor_sBehavior_1807 = v1;
}

- (id)transcriptNicknameTextColor
{
  if (transcriptNicknameTextColor_once_1810 != -1) {
    dispatch_once(&transcriptNicknameTextColor_once_1810, &__block_literal_global_1812);
  }
  v2 = (void *)transcriptNicknameTextColor_sBehavior_1809;

  return v2;
}

void __44__CKUIThemeNano_transcriptNicknameTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoDefaultBlueColor"];
  uint64_t v1 = (void *)transcriptNicknameTextColor_sBehavior_1809;
  transcriptNicknameTextColor_sBehavior_1809 = v0;
}

- (id)transcriptBigEmojiColor
{
  if (transcriptBigEmojiColor_once_1814 != -1) {
    dispatch_once(&transcriptBigEmojiColor_once_1814, &__block_literal_global_1816);
  }
  v2 = (void *)transcriptBigEmojiColor_sBehavior_1813;

  return v2;
}

void __40__CKUIThemeNano_transcriptBigEmojiColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v1 = (void *)transcriptBigEmojiColor_sBehavior_1813;
  transcriptBigEmojiColor_sBehavior_1813 = v0;
}

- (id)transcriptDeemphasizedTextColor
{
  int v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)transcriptDeemphasizedTextColor_sBehavior_1818;
  if (transcriptDeemphasizedTextColor_sBehavior_1818) {
    BOOL v5 = transcriptDeemphasizedTextColor_sIsIncreaseContrastEnabled_transcriptDeemphasizedTextColor_1817 == v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    uint64_t v6 = [(CKUITheme *)self grayTextColor];
    v7 = (void *)transcriptDeemphasizedTextColor_sBehavior_1818;
    transcriptDeemphasizedTextColor_sBehavior_1818 = v6;

    transcriptDeemphasizedTextColor_sIsIncreaseContrastEnabled_transcriptDeemphasizedTextColor_1817 = v3;
    v4 = (void *)transcriptDeemphasizedTextColor_sBehavior_1818;
  }

  return v4;
}

- (id)gray_balloonColors
{
  if (gray_balloonColors_once_1820 != -1) {
    dispatch_once(&gray_balloonColors_once_1820, &__block_literal_global_1822);
  }
  v2 = (void *)gray_balloonColors_sBehavior_1819;

  return v2;
}

void __35__CKUIThemeNano_gray_balloonColors__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayBalloonColor"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  v2 = (void *)gray_balloonColors_sBehavior_1819;
  gray_balloonColors_sBehavior_1819 = v1;
}

- (id)blue_balloonColors
{
  if (blue_balloonColors_once_1827 != -1) {
    dispatch_once(&blue_balloonColors_once_1827, &__block_literal_global_1829);
  }
  v2 = (void *)blue_balloonColors_sBehavior_1826;

  return v2;
}

void __35__CKUIThemeNano_blue_balloonColors__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.125490196 green:0.580392157 blue:0.941176471 alpha:1.0];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  v2 = (void *)blue_balloonColors_sBehavior_1826;
  blue_balloonColors_sBehavior_1826 = v1;
}

- (id)gray_unfilledBalloonColor
{
  if (gray_unfilledBalloonColor_once_1831 != -1) {
    dispatch_once(&gray_unfilledBalloonColor_once_1831, &__block_literal_global_1833);
  }
  v2 = (void *)gray_unfilledBalloonColor_sBehavior_1830;

  return v2;
}

void __42__CKUIThemeNano_gray_unfilledBalloonColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.301960784 green:0.311764706 blue:0.331372549 alpha:1.0];
  uint64_t v1 = (void *)gray_unfilledBalloonColor_sBehavior_1830;
  gray_unfilledBalloonColor_sBehavior_1830 = v0;
}

- (id)background_balloonColors
{
  if (background_balloonColors_once_1835 != -1) {
    dispatch_once(&background_balloonColors_once_1835, &__block_literal_global_1837);
  }
  v2 = (void *)background_balloonColors_sBehavior_1834;

  return v2;
}

void __41__CKUIThemeNano_background_balloonColors__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayBalloonColor"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  v2 = (void *)background_balloonColors_sBehavior_1834;
  background_balloonColors_sBehavior_1834 = v1;
}

- (id)reply_gray_balloonColors
{
  if (reply_gray_balloonColors_once_1839 != -1) {
    dispatch_once(&reply_gray_balloonColors_once_1839, &__block_literal_global_1841);
  }
  v2 = (void *)reply_gray_balloonColors_sBehavior_1838;

  return v2;
}

void __41__CKUIThemeNano_reply_gray_balloonColors__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayBalloonColor"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  v2 = (void *)reply_gray_balloonColors_sBehavior_1838;
  reply_gray_balloonColors_sBehavior_1838 = v1;
}

- (id)reply_gray_unfilledBalloonColor
{
  if (reply_gray_unfilledBalloonColor_once_1843 != -1) {
    dispatch_once(&reply_gray_unfilledBalloonColor_once_1843, &__block_literal_global_1845);
  }
  v2 = (void *)reply_gray_unfilledBalloonColor_sBehavior_1842;

  return v2;
}

void __48__CKUIThemeNano_reply_gray_unfilledBalloonColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayUnfilledBalloonColor"];
  uint64_t v1 = (void *)reply_gray_unfilledBalloonColor_sBehavior_1842;
  reply_gray_unfilledBalloonColor_sBehavior_1842 = v0;
}

- (id)replyLineColor
{
  if (replyLineColor_once_1850 != -1) {
    dispatch_once(&replyLineColor_once_1850, &__block_literal_global_1852);
  }
  v2 = (void *)replyLineColor_sBehavior_1849;

  return v2;
}

void __31__CKUIThemeNano_replyLineColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyLineColor"];
  uint64_t v1 = (void *)replyLineColor_sBehavior_1849;
  replyLineColor_sBehavior_1849 = v0;
}

- (id)transcriptReplyCountColor
{
  if (transcriptReplyCountColor_once != -1) {
    dispatch_once(&transcriptReplyCountColor_once, &__block_literal_global_1857);
  }
  v2 = (void *)transcriptReplyCountColor_sBehavior;

  return v2;
}

void __42__CKUIThemeNano_transcriptReplyCountColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoDefaultBlueColor"];
  uint64_t v1 = (void *)transcriptReplyCountColor_sBehavior;
  transcriptReplyCountColor_sBehavior = v0;
}

- (id)reply_gray_balloonTextColor
{
  if (reply_gray_balloonTextColor_once_1859 != -1) {
    dispatch_once(&reply_gray_balloonTextColor_once_1859, &__block_literal_global_1861);
  }
  v2 = (void *)reply_gray_balloonTextColor_sBehavior_1858;

  return v2;
}

void __44__CKUIThemeNano_reply_gray_balloonTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayTextColor"];
  uint64_t v1 = (void *)reply_gray_balloonTextColor_sBehavior_1858;
  reply_gray_balloonTextColor_sBehavior_1858 = v0;
}

- (id)reply_gray_balloonTextLinkColor
{
  if (reply_gray_balloonTextLinkColor_once_1866 != -1) {
    dispatch_once(&reply_gray_balloonTextLinkColor_once_1866, &__block_literal_global_1868);
  }
  v2 = (void *)reply_gray_balloonTextLinkColor_sBehavior_1865;

  return v2;
}

void __48__CKUIThemeNano_reply_gray_balloonTextLinkColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayTextColor"];
  uint64_t v1 = (void *)reply_gray_balloonTextLinkColor_sBehavior_1865;
  reply_gray_balloonTextLinkColor_sBehavior_1865 = v0;
}

- (UIColor)filledGrayBalloonColor
{
  if (filledGrayBalloonColor_once != -1) {
    dispatch_once(&filledGrayBalloonColor_once, &__block_literal_global_1870);
  }
  v2 = (void *)filledGrayBalloonColor_sBehavior;

  return (UIColor *)v2;
}

void __39__CKUIThemeNano_filledGrayBalloonColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKNanoReplyGrayBalloonColorFilled"];
  uint64_t v1 = (void *)filledGrayBalloonColor_sBehavior;
  filledGrayBalloonColor_sBehavior = v0;
}

- (id)transcriptTypingIndicatorBubbleColor
{
  if (transcriptTypingIndicatorBubbleColor_once_1875 != -1) {
    dispatch_once(&transcriptTypingIndicatorBubbleColor_once_1875, &__block_literal_global_1877);
  }
  v2 = (void *)transcriptTypingIndicatorBubbleColor_sBehavior_1874;

  return v2;
}

void __53__CKUIThemeNano_transcriptTypingIndicatorBubbleColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.149019608 green:0.149019608 blue:0.160784314 alpha:1.0];
  uint64_t v1 = (void *)transcriptTypingIndicatorBubbleColor_sBehavior_1874;
  transcriptTypingIndicatorBubbleColor_sBehavior_1874 = v0;
}

- (id)transcriptTypingIndicatorDotColor
{
  if (transcriptTypingIndicatorDotColor_once_1879 != -1) {
    dispatch_once(&transcriptTypingIndicatorDotColor_once_1879, &__block_literal_global_1881);
  }
  v2 = (void *)transcriptTypingIndicatorDotColor_sBehavior_1878;

  return v2;
}

void __50__CKUIThemeNano_transcriptTypingIndicatorDotColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] labelColor];
  uint64_t v1 = (void *)transcriptTypingIndicatorDotColor_sBehavior_1878;
  transcriptTypingIndicatorDotColor_sBehavior_1878 = v0;
}

- (double)transcriptTypingIndicatorOpacity
{
  if (transcriptTypingIndicatorOpacity_once_1883 != -1) {
    dispatch_once(&transcriptTypingIndicatorOpacity_once_1883, &__block_literal_global_1885);
  }
  return *(double *)&transcriptTypingIndicatorOpacity_sBehavior_1882;
}

void __49__CKUIThemeNano_transcriptTypingIndicatorOpacity__block_invoke()
{
  transcriptTypingIndicatorOpacity_sBehavior_1882 = 0x3FF0000000000000;
}

- (id)attachmentBalloonTitleTextColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CKUIThemeNano_attachmentBalloonTitleTextColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (attachmentBalloonTitleTextColor_once != -1) {
    dispatch_once(&attachmentBalloonTitleTextColor_once, block);
  }
  return (id)attachmentBalloonTitleTextColor_sBehavior_1886;
}

void __48__CKUIThemeNano_attachmentBalloonTitleTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) balloonTextColorForColorType:0xFFFFFFFFLL];
  v2 = (void *)attachmentBalloonTitleTextColor_sBehavior_1886;
  attachmentBalloonTitleTextColor_sBehavior_1886 = v1;
}

- (id)attachmentBalloonSubtitleTextColor
{
  if (attachmentBalloonSubtitleTextColor_once_1888 != -1) {
    dispatch_once(&attachmentBalloonSubtitleTextColor_once_1888, &__block_literal_global_1890);
  }
  v2 = (void *)attachmentBalloonSubtitleTextColor_sBehavior_1887;

  return v2;
}

void __51__CKUIThemeNano_attachmentBalloonSubtitleTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  uint64_t v1 = (void *)attachmentBalloonSubtitleTextColor_sBehavior_1887;
  attachmentBalloonSubtitleTextColor_sBehavior_1887 = v0;
}

- (id)messageAcknowledgmentBalloonBorderColor
{
  if (messageAcknowledgmentBalloonBorderColor_once_1892 != -1) {
    dispatch_once(&messageAcknowledgmentBalloonBorderColor_once_1892, &__block_literal_global_1894);
  }
  v2 = (void *)messageAcknowledgmentBalloonBorderColor_sBehavior_1891;

  return v2;
}

void __56__CKUIThemeNano_messageAcknowledgmentBalloonBorderColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v1 = (void *)messageAcknowledgmentBalloonBorderColor_sBehavior_1891;
  messageAcknowledgmentBalloonBorderColor_sBehavior_1891 = v0;
}

- (id)messageAcknowledgmentGrayColor
{
  if (messageAcknowledgmentGrayColor_once_1896 != -1) {
    dispatch_once(&messageAcknowledgmentGrayColor_once_1896, &__block_literal_global_1898);
  }
  v2 = (void *)messageAcknowledgmentGrayColor_sBehavior_1895;

  return v2;
}

void __47__CKUIThemeNano_messageAcknowledgmentGrayColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] systemGrayColor];
  uint64_t v1 = (void *)messageAcknowledgmentGrayColor_sBehavior_1895;
  messageAcknowledgmentGrayColor_sBehavior_1895 = v0;
}

- (id)messageAcknowledgmentRedColor
{
  if (messageAcknowledgmentRedColor_once_1900 != -1) {
    dispatch_once(&messageAcknowledgmentRedColor_once_1900, &__block_literal_global_1902);
  }
  v2 = (void *)messageAcknowledgmentRedColor_sBehavior_1899;

  return v2;
}

void __46__CKUIThemeNano_messageAcknowledgmentRedColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.980392157 green:0.368627451 blue:0.588235294 alpha:1.0];
  uint64_t v1 = (void *)messageAcknowledgmentRedColor_sBehavior_1899;
  messageAcknowledgmentRedColor_sBehavior_1899 = v0;
}

- (id)messageAcknowledgmentWhiteColor
{
  if (messageAcknowledgmentWhiteColor_once_1904 != -1) {
    dispatch_once(&messageAcknowledgmentWhiteColor_once_1904, &__block_literal_global_1906);
  }
  v2 = (void *)messageAcknowledgmentWhiteColor_sBehavior_1903;

  return v2;
}

void __48__CKUIThemeNano_messageAcknowledgmentWhiteColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] whiteColor];
  uint64_t v1 = (void *)messageAcknowledgmentWhiteColor_sBehavior_1903;
  messageAcknowledgmentWhiteColor_sBehavior_1903 = v0;
}

- (id)messageAcknowledgmentBalloonColorForStyle:(int64_t)a3
{
  int v3 = [(CKUITheme *)self balloonColorsForColorType:[(CKUITheme *)self messageAcknowledgmentBalloonColorTypeForStyle:a3]];
  v4 = [v3 lastObject];

  return v4;
}

- (id)browserBackgroundColor
{
  if (browserBackgroundColor_once_1908 != -1) {
    dispatch_once(&browserBackgroundColor_once_1908, &__block_literal_global_1910);
  }
  v2 = (void *)browserBackgroundColor_sBehavior_1907;

  return v2;
}

void __39__CKUIThemeNano_browserBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v1 = (void *)browserBackgroundColor_sBehavior_1907;
  browserBackgroundColor_sBehavior_1907 = v0;
}

@end