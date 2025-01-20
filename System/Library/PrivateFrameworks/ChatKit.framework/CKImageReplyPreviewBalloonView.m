@interface CKImageReplyPreviewBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKImageReplyPreviewBalloonView)initWithFrame:(CGRect)a3;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
@end

@implementation CKImageReplyPreviewBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKImageReplyPreviewBalloonView;
  [(CKImageBalloonView *)&v9 configureForMessagePart:v4];
  if (v4) {
    [v4 balloonDescriptor];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [(CKBalloonView *)self setBalloonDescriptor:v8];
  v5 = [v4 mediaObject];
  v6 = +[CKUIBehavior sharedBehaviors];
  [v6 previewMaxWidth];
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, [v4 balloonOrientation], v7);
}

- (CKImageReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKImageReplyPreviewBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v5 = [(CKBalloonView *)v3 doubleTapGestureRecognizer];
    [v5 setEnabled:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKImageReplyPreviewBalloonView;
  [(CKImageBalloonView *)&v5 layoutSubviews];
  v3 = [(CKImageBalloonView *)self irisBadgeView];
  [v3 setHidden:1];

  id v4 = +[CKUIBehavior sharedBehaviors];
  [v4 replyPreviewBalloonAlpha];
  -[CKImageReplyPreviewBalloonView setAlpha:](self, "setAlpha:");
}

- (void)prepareForDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)CKImageReplyPreviewBalloonView;
  [(CKImageBalloonView *)&v4 prepareForDisplay];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 replyPreviewBalloonAlpha];
  -[CKImageReplyPreviewBalloonView setAlpha:](self, "setAlpha:");
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  v20.receiver = self;
  v20.super_class = (Class)CKImageReplyPreviewBalloonView;
  -[CKImageBalloonView sizeThatFits:textAlignmentInsets:](&v20, sel_sizeThatFits_textAlignmentInsets_, a4, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 textBalloonMinHeight];
  double v10 = v9;

  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 replyPreviewBalloonMinWidth];
  double v13 = v12;

  if (v13 < v5 || v10 < v7)
  {
    double v15 = v13 / v5;
    double v16 = 0.0;
    if (v5 == 0.0) {
      double v15 = 0.0;
    }
    if (v7 != 0.0) {
      double v16 = v10 / v7;
    }
    double v17 = fmax(v15, v16);
    double v13 = ceil(v5 * v17);
    double v10 = ceil(v7 * v17);
  }
  double v18 = v13;
  double v19 = v10;
  result.height = v19;
  result.width = v18;
  return result;
}

@end