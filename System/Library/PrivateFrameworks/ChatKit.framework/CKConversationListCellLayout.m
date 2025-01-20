@interface CKConversationListCellLayout
- (BOOL)invalid;
- (BOOL)isValidForContentViewWidth:(double)a3 widthForDeterminingAvatarVisibility:(double)a4 showingEditControl:(BOOL)a5;
- (BOOL)shouldShowAvatarView;
- (BOOL)shouldShowChevron;
- (BOOL)showingEditControl;
- (CGRect)avatarFrame;
- (CGRect)chevronFrame;
- (CGRect)dateFrame;
- (CGRect)indicatorContainerFrame;
- (CGRect)senderFrame;
- (CGRect)summaryFrameIfAccessoryIndicatorHidden;
- (CGRect)summaryFrameIfAccessoryIndicatorVisible;
- (CGRect)unreadFrame;
- (CKConversationListCellLayout)init;
- (double)cellHeight;
- (double)cellHeightForDisplayScale:(double)a3;
- (double)contentViewWidth;
- (double)lastUsedDisplayScale;
- (double)summaryLabelCapFrameYOrigin;
- (double)tableViewWidth;
- (double)trailingLayoutMarginSize;
- (double)widthForDeterminingAvatarVisibility;
- (void)invalidate;
- (void)markAsValidForContentViewWidth:(double)a3 widthForDeterminingAvatarVisibility:(double)a4 showingEditControl:(BOOL)a5;
- (void)setAvatarFrame:(CGRect)a3;
- (void)setCellHeight:(double)a3;
- (void)setChevronFrame:(CGRect)a3;
- (void)setContentViewWidth:(double)a3;
- (void)setDateFrame:(CGRect)a3;
- (void)setIndicatorContainerFrame:(CGRect)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setLastUsedDisplayScale:(double)a3;
- (void)setSenderFrame:(CGRect)a3;
- (void)setShouldShowAvatarView:(BOOL)a3;
- (void)setShouldShowChevron:(BOOL)a3;
- (void)setShowingEditControl:(BOOL)a3;
- (void)setSummaryFrameIfAccessoryIndicatorHidden:(CGRect)a3;
- (void)setSummaryFrameIfAccessoryIndicatorVisible:(CGRect)a3;
- (void)setSummaryLabelCapFrameYOrigin:(double)a3;
- (void)setTableViewWidth:(double)a3;
- (void)setTrailingLayoutMarginSize:(double)a3;
- (void)setUnreadFrame:(CGRect)a3;
- (void)setWidthForDeterminingAvatarVisibility:(double)a3;
@end

@implementation CKConversationListCellLayout

- (BOOL)shouldShowChevron
{
  return self->_shouldShowChevron;
}

- (CGRect)unreadFrame
{
  double x = self->_unreadFrame.origin.x;
  double y = self->_unreadFrame.origin.y;
  double width = self->_unreadFrame.size.width;
  double height = self->_unreadFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)summaryLabelCapFrameYOrigin
{
  return self->_summaryLabelCapFrameYOrigin;
}

- (CGRect)summaryFrameIfAccessoryIndicatorHidden
{
  double x = self->_summaryFrameIfAccessoryIndicatorHidden.origin.x;
  double y = self->_summaryFrameIfAccessoryIndicatorHidden.origin.y;
  double width = self->_summaryFrameIfAccessoryIndicatorHidden.size.width;
  double height = self->_summaryFrameIfAccessoryIndicatorHidden.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)shouldShowAvatarView
{
  return self->_shouldShowAvatarView;
}

- (CGRect)senderFrame
{
  double x = self->_senderFrame.origin.x;
  double y = self->_senderFrame.origin.y;
  double width = self->_senderFrame.size.width;
  double height = self->_senderFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isValidForContentViewWidth:(double)a3 widthForDeterminingAvatarVisibility:(double)a4 showingEditControl:(BOOL)a5
{
  if (self->_invalid)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = CKFloatApproximatelyEqualToFloatWithTolerance(self->_contentViewWidth, a3, 0.00000999999975);
    if (v5)
    {
      BOOL v5 = CKFloatApproximatelyEqualToFloatWithTolerance(self->_widthForDeterminingAvatarVisibility, a4, 0.00000999999975);
      if (v5) {
        LOBYTE(v5) = [(CKConversationListCellLayout *)self showingEditControl] ^ a5 ^ 1;
      }
    }
  }
  return v5;
}

- (CGRect)indicatorContainerFrame
{
  double x = self->_indicatorContainerFrame.origin.x;
  double y = self->_indicatorContainerFrame.origin.y;
  double width = self->_indicatorContainerFrame.size.width;
  double height = self->_indicatorContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)dateFrame
{
  double x = self->_dateFrame.origin.x;
  double y = self->_dateFrame.origin.y;
  double width = self->_dateFrame.size.width;
  double height = self->_dateFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)chevronFrame
{
  double x = self->_chevronFrame.origin.x;
  double y = self->_chevronFrame.origin.y;
  double width = self->_chevronFrame.size.width;
  double height = self->_chevronFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)avatarFrame
{
  double x = self->_avatarFrame.origin.x;
  double y = self->_avatarFrame.origin.y;
  double width = self->_avatarFrame.size.width;
  double height = self->_avatarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)showingEditControl
{
  return self->_showingEditControl;
}

- (CKConversationListCellLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKConversationListCellLayout;
  v2 = [(CKConversationListCellLayout *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_invalid = 1;
    v4 = +[CKUIBehavior sharedBehaviors];
    v3->_shouldShowChevron = [v4 showsConversationListCellChevronImage];
  }
  return v3;
}

- (void)setUnreadFrame:(CGRect)a3
{
  self->_unreadFrame = a3;
}

- (void)setTrailingLayoutMarginSize:(double)a3
{
  self->_trailingLayoutMarginSize = a3;
}

- (void)setSummaryLabelCapFrameYOrigin:(double)a3
{
  self->_summaryLabelCapFrameYOrigin = a3;
}

- (void)setSummaryFrameIfAccessoryIndicatorVisible:(CGRect)a3
{
  self->_summaryFrameIfAccessoryIndicatorVisible = a3;
}

- (void)setSummaryFrameIfAccessoryIndicatorHidden:(CGRect)a3
{
  self->_summaryFrameIfAccessoryIndicatorHidden = a3;
}

- (void)setShouldShowAvatarView:(BOOL)a3
{
  self->_shouldShowAvatarView = a3;
}

- (void)setSenderFrame:(CGRect)a3
{
  self->_senderFrame = a3;
}

- (void)setIndicatorContainerFrame:(CGRect)a3
{
  self->_indicatorContainerFrame = a3;
}

- (void)setDateFrame:(CGRect)a3
{
  self->_dateFrame = a3;
}

- (void)setChevronFrame:(CGRect)a3
{
  self->_chevronFrame = a3;
}

- (void)setAvatarFrame:(CGRect)a3
{
  self->_avatarFrame = a3;
}

- (void)markAsValidForContentViewWidth:(double)a3 widthForDeterminingAvatarVisibility:(double)a4 showingEditControl:(BOOL)a5
{
  self->_invalid = 0;
  self->_contentViewWidth = a3;
  self->_widthForDeterminingAvatarVisibilitdouble y = a4;
  self->_showingEditControl = a5;
}

- (double)cellHeightForDisplayScale:(double)a3
{
  if (self->_cellHeight == 0.0
    || ([(CKConversationListCellLayout *)self lastUsedDisplayScale], v5 != a3))
  {
    +[CKConversationListCell cellHeightForDisplayScale:a3];
    self->_cellHeight = v6;
    [(CKConversationListCellLayout *)self setLastUsedDisplayScale:a3];
  }
  return self->_cellHeight;
}

- (double)lastUsedDisplayScale
{
  return self->_lastUsedDisplayScale;
}

- (void)setLastUsedDisplayScale:(double)a3
{
  self->_lastUsedDisplayScale = a3;
}

- (double)tableViewWidth
{
  return self->_tableViewWidth;
}

- (void)setTableViewWidth:(double)a3
{
  self->_tableViewWidth = a3;
}

- (void)setShouldShowChevron:(BOOL)a3
{
  self->_shouldShowChevron = a3;
}

- (void)invalidate
{
  self->_shouldShowAvatarView = 0;
  self->_contentViewWidth = 0.0;
  self->_widthForDeterminingAvatarVisibilitdouble y = 0.0;
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_summaryFrameIfAccessoryIndicatorVisible.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_summaryFrameIfAccessoryIndicatorVisible.size = v3;
  self->_summaryFrameIfAccessoryIndicatorHidden.origin = v2;
  self->_summaryFrameIfAccessoryIndicatorHidden.size = v3;
  self->_dateFrame.size = v3;
  self->_dateFrame.origin = v2;
  self->_senderFrame.size = v3;
  self->_senderFrame.origin = v2;
  self->_chevronFrame.size = v3;
  self->_chevronFrame.origin = v2;
  self->_unreadFrame.origin = v2;
  self->_unreadFrame.size = v3;
  self->_avatarFrame.origin = v2;
  self->_avatarFrame.size = v3;
  self->_tableViewWidth = 0.0;
  self->_summaryLabelCapFrameYOrigin = 0.0;
  self->_lastUsedDisplayScale = 0.0;
  self->_cellHeight = 0.0;
  self->_invalid = 1;
}

- (void)setShowingEditControl:(BOOL)a3
{
  self->_showingEditControl = a3;
}

- (CGRect)summaryFrameIfAccessoryIndicatorVisible
{
  double x = self->_summaryFrameIfAccessoryIndicatorVisible.origin.x;
  double y = self->_summaryFrameIfAccessoryIndicatorVisible.origin.y;
  double width = self->_summaryFrameIfAccessoryIndicatorVisible.size.width;
  double height = self->_summaryFrameIfAccessoryIndicatorVisible.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)trailingLayoutMarginSize
{
  return self->_trailingLayoutMarginSize;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (double)contentViewWidth
{
  return self->_contentViewWidth;
}

- (void)setContentViewWidth:(double)a3
{
  self->_contentViewWidth = a3;
}

- (double)widthForDeterminingAvatarVisibility
{
  return self->_widthForDeterminingAvatarVisibility;
}

- (void)setWidthForDeterminingAvatarVisibility:(double)a3
{
  self->_widthForDeterminingAvatarVisibilitdouble y = a3;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

@end