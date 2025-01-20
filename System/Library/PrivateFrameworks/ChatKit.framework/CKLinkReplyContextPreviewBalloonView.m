@interface CKLinkReplyContextPreviewBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (LPLinkView)linkView;
- (void)_linkViewMetadataDidBecomeComplete:(id)a3;
- (void)layoutSubviews;
- (void)linkViewNeedsResize:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setLinkView:(id)a3;
@end

@implementation CKLinkReplyContextPreviewBalloonView

- (void)setLinkView:(id)a3
{
  v5 = (LPLinkView *)a3;
  linkView = self->_linkView;
  if (linkView != v5)
  {
    v7 = v5;
    if (linkView)
    {
      [(LPLinkView *)linkView removeFromSuperview];
      v5 = v7;
    }
    if (v5)
    {
      [(LPLinkView *)v7 setDelegate:self];
      [(LPLinkView *)v7 _setDisableTapGesture:1];
      [(LPLinkView *)v7 _setApplyCornerRadius:0];
      [(CKLinkReplyContextPreviewBalloonView *)self insertSubview:v7 atIndex:0];
    }
    objc_storeStrong((id *)&self->_linkView, a3);
    v5 = v7;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  linkView = self->_linkView;
  if (linkView)
  {
    [(LPLinkView *)linkView sizeThatFits:a4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(47);
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_DEBUG, "Calling sizeThatFits when LPLinkView has not been configured yet.", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    v12.receiver = self;
    v12.super_class = (Class)CKLinkReplyContextPreviewBalloonView;
    -[CKBalloonView sizeThatFits:textAlignmentInsets:](&v12, sel_sizeThatFits_textAlignmentInsets_, a4, width, height);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKLinkReplyContextPreviewBalloonView;
  [(CKColoredBalloonView *)&v5 prepareForReuse];
  linkView = self->_linkView;
  if (linkView)
  {
    [(LPLinkView *)linkView removeFromSuperview];
    v4 = self->_linkView;
    self->_linkView = 0;
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CKLinkReplyContextPreviewBalloonView;
  [(CKColoredBalloonView *)&v12 layoutSubviews];
  [(CKLinkReplyContextPreviewBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKLinkReplyContextPreviewBalloonView *)self linkView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)prepareForDisplay
{
  v14.receiver = self;
  v14.super_class = (Class)CKLinkReplyContextPreviewBalloonView;
  [(CKColoredBalloonView *)&v14 prepareForDisplay];
  BOOL v3 = [(CKBalloonView *)self orientation] == 1;
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 pluginBalloonInsetsForMessageFromMe:v3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CKLinkReplyContextPreviewBalloonView *)self linkView];
  objc_msgSend(v13, "setContentInset:", v6, v8, v10, v12);

  [(CKLinkReplyContextPreviewBalloonView *)self sendSubviewToBack:self->_linkView];
  [(LPLinkView *)self->_linkView setNeedsLayout];
}

- (void)linkViewNeedsResize:(id)a3
{
  if (self->_linkView == a3)
  {
    [a3 setNeedsLayout];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  if (self->_linkView == a3)
  {
    [a3 setNeedsLayout];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void).cxx_destruct
{
}

@end