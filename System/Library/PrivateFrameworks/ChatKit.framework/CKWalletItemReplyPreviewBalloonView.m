@interface CKWalletItemReplyPreviewBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKMediaObject)mediaObject;
- (CKWalletItemReplyPreviewBalloonView)initWithFrame:(CGRect)a3;
- (LPLinkView)linkView;
- (id)description;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)setLinkView:(id)a3;
- (void)setMediaObject:(id)a3;
@end

@implementation CKWalletItemReplyPreviewBalloonView

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  v3 = [(CKColoredBalloonView *)&v6 description];
  v4 = [v2 stringWithFormat:@"[CKWalletItemReplyPreviewBalloonView %@]", v3];

  return v4;
}

- (CKWalletItemReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKBalloonView *)v3 doubleTapGestureRecognizer];
    [v5 setEnabled:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v4 layoutSubviews];
  v3 = [(CKWalletItemReplyPreviewBalloonView *)self linkView];
  [(CKWalletItemReplyPreviewBalloonView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  -[CKBalloonView sizeThatFits:textAlignmentInsets:](&v18, sel_sizeThatFits_textAlignmentInsets_, a4);
  objc_super v7 = [(CKWalletItemReplyPreviewBalloonView *)self linkView];
  objc_msgSend(v7, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;

  if (width < v9 || height < v11)
  {
    double v13 = width / v9;
    double v14 = 0.0;
    if (v9 == 0.0) {
      double v13 = 0.0;
    }
    if (v11 != 0.0) {
      double v14 = height / v11;
    }
    double v15 = fmin(v13, v14);
    double v9 = ceil(v9 * v15);
    double v11 = ceil(v11 * v15);
  }
  double v16 = v9;
  double v17 = v11;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)prepareForDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v3 prepareForDisplay];
  [(CKWalletItemReplyPreviewBalloonView *)self insertSubview:self->_linkView atIndex:0];
}

- (void)setMediaObject:(id)a3
{
  v5 = (CKMediaObject *)a3;
  if (self->_mediaObject != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_mediaObject, a3);
    if ([(LPLinkView *)self->_linkView isDescendantOfView:self]) {
      [(LPLinkView *)self->_linkView removeFromSuperview];
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5 = v21;
    if (isKindOfClass & 1) != 0 || (objc_opt_class(), char v7 = objc_opt_isKindOfClass(), v5 = v21, (v7))
    {
      uint64_t v8 = [(CKMediaObject *)v5 presentationPropertiesForReplyPreview];
      v5 = v21;
      if (v8)
      {
        double v9 = (void *)v8;
        double v10 = (LPLinkView *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithPresentationProperties:v8 URL:0];
        [(LPLinkView *)v10 _setPreferredSizeClass:6];
        [(LPLinkView *)v10 _setApplyCornerRadius:0];
        [(LPLinkView *)v10 _setDisableTapGesture:1];
        double v11 = +[CKUIBehavior sharedBehaviors];
        objc_msgSend(v11, "thumbnailContentAlignmentInsetsForOrientation:", -[CKBalloonView orientation](self, "orientation"));
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;

        -[LPLinkView setContentInset:](v10, "setContentInset:", v13, v15, v17, v19);
        linkView = self->_linkView;
        self->_linkView = v10;

        [(CKBalloonView *)self setNeedsPrepareForDisplay];
        v5 = v21;
      }
    }
  }
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKWalletItemReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v7 configureForMessagePart:v4];
  if (v4) {
    [v4 balloonDescriptor];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  [(CKColoredBalloonView *)self setBalloonDescriptor:v6];
  v5 = [v4 mediaObject];
  [(CKWalletItemReplyPreviewBalloonView *)self setMediaObject:v5];
}

@end