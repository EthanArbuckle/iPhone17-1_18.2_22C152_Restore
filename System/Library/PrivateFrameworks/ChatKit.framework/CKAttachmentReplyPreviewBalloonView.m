@interface CKAttachmentReplyPreviewBalloonView
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAttachmentReplyPreviewBalloonView)initWithFrame:(CGRect)a3;
- (CKMediaObject)mediaObject;
- (UIEdgeInsets)alignmentRectInsets;
- (UILabel)titleLabel;
- (id)attachmentTitleForMediaObject:(id)a3;
- (id)description;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMessagePart:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setMediaObject:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKAttachmentReplyPreviewBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  id v8 = a3;
  [(CKBalloonView *)&v9 configureForMediaObject:v8 previewWidth:v5 orientation:a4];
  -[CKAttachmentReplyPreviewBalloonView setMediaObject:](self, "setMediaObject:", v8, v9.receiver, v9.super_class);
}

- (void)configureForComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  id v4 = a3;
  [(CKColoredBalloonView *)&v8 configureForComposition:v4];
  -[CKColoredBalloonView setColor:](self, "setColor:", 8, v8.receiver, v8.super_class);
  uint64_t v5 = [v4 mediaObjects];

  v6 = [v5 lastObject];
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 previewMaxWidth];
  -[CKAttachmentReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CKAttachmentReplyPreviewBalloonView *)self mediaObject];
  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  uint64_t v5 = [(CKColoredBalloonView *)&v8 description];
  v6 = [v3 stringWithFormat:@"[CKAttachmentReplyPreviewBalloonView mediaObject:%@ %@]", v4, v5];

  return v6;
}

- (CKAttachmentReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 replyBalloonTextFont];
    [v5 setFont:v7];

    [v5 setNumberOfLines:1];
    [v5 setLineBreakMode:4];
    [(CKAttachmentReplyPreviewBalloonView *)v3 setTitleLabel:v5];
    [(CKAttachmentReplyPreviewBalloonView *)v3 addSubview:v5];
    objc_super v8 = [(CKBalloonView *)v3 doubleTapGestureRecognizer];
    [v8 setEnabled:0];
  }
  return v3;
}

- (void)prepareForDisplay
{
  v6.receiver = self;
  v6.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v6 prepareForDisplay];
  v3 = [(CKAttachmentReplyPreviewBalloonView *)self titleLabel];
  id v4 = [(CKAttachmentReplyPreviewBalloonView *)self mediaObject];
  uint64_t v5 = [(CKAttachmentReplyPreviewBalloonView *)self attachmentTitleForMediaObject:v4];
  [v3 setAttributedText:v5];

  [(CKAttachmentReplyPreviewBalloonView *)self bounds];
  -[CKAttachmentReplyPreviewBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  objc_msgSend(v3, "setFrame:");
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v2 = [(CKBalloonView *)self orientation];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 attachmentReplyPreviewBalloonAlignmentRectInsets];
  double v7 = v6;
  double v9 = v8;
  if (v2) {
    double v10 = v4;
  }
  else {
    double v10 = v5;
  }
  if (v2) {
    double v11 = v5;
  }
  else {
    double v11 = v4;
  }

  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 textAlignmentRectInsetsScaleFactor];
  double v14 = v7 * v13;
  double v15 = v10 * v13;
  double v16 = v9 * v13;
  double v17 = v11 * v13;

  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v4 prepareForReuse];
  [(CKAttachmentReplyPreviewBalloonView *)self setMediaObject:0];
  v3 = [(CKAttachmentReplyPreviewBalloonView *)self titleLabel];
  [v3 setText:0];
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v33.receiver = self;
  v33.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  -[CKBalloonView sizeThatFits:textAlignmentInsets:](&v33, sel_sizeThatFits_textAlignmentInsets_);
  double v9 = v8;
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", width, height);
  double v11 = v10;
  double v13 = v12;
  double v14 = [(CKAttachmentReplyPreviewBalloonView *)self titleLabel];
  objc_msgSend(v14, "sizeThatFits:", v11, v13);
  double v16 = v15;
  double v18 = v17;

  [(CKAttachmentReplyPreviewBalloonView *)self alignmentRectInsets];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  if (a4)
  {
    [(CKAttachmentReplyPreviewBalloonView *)self alignmentRectInsets];
    a4->top = v27;
    a4->left = v28;
    a4->bottom = v29;
    a4->right = v30;
  }
  double v31 = fmax(v18 + v20 + v24, v9);
  double v32 = fmin(v16 + v22 + v26, width);
  result.double height = v31;
  result.double width = v32;
  return result;
}

- (void)setMediaObject:(id)a3
{
  double v5 = (CKMediaObject *)a3;
  if (self->_mediaObject != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_mediaObject, a3);
    double v5 = v6;
  }
}

- (id)attachmentTitleForMediaObject:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    double v14 = 0;
    goto LABEL_16;
  }
  double v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v5 theme];
  double v7 = objc_msgSend(v6, "balloonTextColorForColorType:", -[CKBalloonView color](self, "color"));

  int v8 = [v4 mediaType];
  if (v8 == 4)
  {
    double v15 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v15 replyPreviewContactIconName];

    double v11 = [MEMORY[0x1E4F42A80] systemImageNamed:v10];
    uint64_t v16 = [v11 imageWithTintColor:v7];
LABEL_8:
    double v13 = (void *)v16;
    goto LABEL_9;
  }
  if (v8 != 5)
  {
    double v17 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v17 replyPreviewDocumentIconName];

    double v11 = [MEMORY[0x1E4F42A80] systemImageNamed:v10];
    uint64_t v16 = [v11 imageWithTintColor:v7];
    goto LABEL_8;
  }
  double v9 = +[CKUIBehavior sharedBehaviors];
  double v10 = [v9 replyPreviewLocationIconName];

  double v11 = [MEMORY[0x1E4F42A80] systemImageNamed:v10];
  double v12 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKMapAnnotationMarkerColor"];
  double v13 = [v11 imageWithTintColor:v12];

LABEL_9:
  double v18 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v13];
  double v19 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v18];
  double v14 = (void *)[v19 mutableCopy];

  double v20 = [v4 title];

  if (v20)
  {
    double v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v14 appendAttributedString:v21];

    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v23 = [v4 title];
    double v24 = (void *)[v22 initWithString:v23];
    [v14 appendAttributedString:v24];
  }
  else if (IMOSLoggingEnabled())
  {
    double v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v28 = 136315138;
      CGFloat v29 = "-[CKAttachmentReplyPreviewBalloonView attachmentTitleForMediaObject:]";
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "CKAttachmentReplyPreviewBalloonView %s Media object missing title!", (uint8_t *)&v28, 0xCu);
    }
  }
  uint64_t v26 = [v14 length];
  objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v7, 0, v26);

LABEL_16:

  return v14;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  [(CKColoredBalloonView *)&v9 configureForMessagePart:v4];
  if (v4) {
    [v4 balloonDescriptor];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [(CKColoredBalloonView *)self setBalloonDescriptor:v8];
  double v5 = [v4 mediaObject];
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 previewMaxWidth];
  -[CKAttachmentReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, [v4 balloonOrientation], v7);
}

@end