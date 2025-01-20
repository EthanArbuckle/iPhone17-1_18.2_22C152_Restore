@interface CKLinkBalloonView
- (BOOL)isIrisAsset;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (LPLinkView)linkView;
- (void)_linkViewMetadataDidBecomeComplete:(id)a3;
- (void)layoutSubviews;
- (void)linkViewNeedsResize:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setLinkView:(id)a3;
@end

@implementation CKLinkBalloonView

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
      [(CKLinkBalloonView *)self insertSubview:v7 atIndex:0];
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
    -[LPLinkView sizeThatFits:](linkView, "sizeThatFits:", a4, a3.width, a3.height);
    double v9 = v8;
    double v11 = v10;
    if ([(CKBalloonView *)self hasSuggestedActionsMenu])
    {
      [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
      double v9 = v9 + v9;
      double v11 = v11 + v12;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(47);
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_DEBUG, "Calling sizeThatFits when LPLinkView has not been configured yet.", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    v19.receiver = self;
    v19.super_class = (Class)CKLinkBalloonView;
    -[CKImageBalloonView sizeThatFits:textAlignmentInsets:](&v19, sel_sizeThatFits_textAlignmentInsets_, a4, width, height);
    double v9 = v15;
    double v11 = v16;
  }
  double v17 = v9;
  double v18 = v11;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKLinkBalloonView;
  [(CKImageBalloonView *)&v5 prepareForReuse];
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
  v4.receiver = self;
  v4.super_class = (Class)CKLinkBalloonView;
  [(CKImageBalloonView *)&v4 layoutSubviews];
  linkView = self->_linkView;
  if (linkView)
  {
    [(CKLinkBalloonView *)self bounds];
    -[LPLinkView setFrame:](linkView, "setFrame:");
  }
}

- (void)prepareForDisplay
{
  v14.receiver = self;
  v14.super_class = (Class)CKLinkBalloonView;
  [(CKImageBalloonView *)&v14 prepareForDisplay];
  BOOL v3 = [(CKBalloonView *)self orientation] == 1;
  objc_super v4 = +[CKUIBehavior sharedBehaviors];
  [v4 pluginBalloonInsetsForMessageFromMe:v3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CKLinkBalloonView *)self linkView];
  objc_msgSend(v13, "setContentInset:", v6, v8, v10, v12);

  [(CKLinkBalloonView *)self sendSubviewToBack:self->_linkView];
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

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void).cxx_destruct
{
}

@end