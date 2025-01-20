@interface CKAttachmentBalloonView
+ (id)_linkViewThumbnailFromMediaObject:(id)a3;
+ (id)linkMetadataFromMediaObject:(id)a3;
- (BOOL)_isFromMe;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)shouldProvideDragPreview;
- (CGRect)uncroppedSourceFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAttachmentBalloonView)initWithFrame:(CGRect)a3;
- (CKBalloonImageView)pluginInsetMask;
- (CKMediaObject)mediaObject;
- (LPLinkView)attachmentView;
- (NSString)description;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)pluginInsets;
- (UIView)uncroppedSourceView;
- (id)attachmentBalloonViewPreview;
- (id)overlayColor;
- (id)overlayImage;
- (void)_setProgressWithMediaObject:(id)a3;
- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)richIconDidChange:(id)a3;
- (void)setAttachmentView:(id)a3;
- (void)setMediaObject:(id)a3;
- (void)setOverrideBackgroundColor:(id)a3;
- (void)setPluginInsetMask:(id)a3;
- (void)transferUpdated:(id)a3;
@end

@implementation CKAttachmentBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentBalloonView;
  id v8 = a3;
  [(CKImageBalloonView *)&v9 configureForMediaObject:v8 previewWidth:v5 orientation:a4];
  -[CKAttachmentBalloonView setMediaObject:](self, "setMediaObject:", v8, v9.receiver, v9.super_class);
}

- (void)configureForComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentBalloonView;
  id v4 = a3;
  [(CKImageBalloonView *)&v8 configureForComposition:v4];
  -[CKBalloonView setColor:](self, "setColor:", 0xFFFFFFFFLL, v8.receiver, v8.super_class);
  uint64_t v5 = [v4 mediaObjects];

  v6 = [v5 lastObject];
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 previewMaxWidth];
  -[CKAttachmentBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);
}

- (CKAttachmentBalloonView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CKAttachmentBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
    v6 = objc_opt_new();
    [v6 _setDisableAnimations:1];
    [v6 _setUsesDeferredLayout:0];
    [v6 _setApplyCornerRadius:0];
    [v6 _setDisableTapGesture:1];
    [v6 _setAllowsTapToLoad:0];
    [v6 setDelegate:v5];

    [v6 setUserInteractionEnabled:0];
    [v6 setOpaque:0];
    id v7 = v5[101];
    v5[101] = v6;

    objc_super v8 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v8, "pluginBalloonInsetsForMessageFromMe:", objc_msgSend(v5, "_isFromMe"));
    objc_msgSend(v5[101], "setContentInset:");

    [v5 setBalloonStyle:0];
    [v5 addSubview:v5[101]];
    objc_super v9 = [CKBalloonImageView alloc];
    [v5 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v5 pluginInsets];
    v22 = -[CKBalloonImageView initWithFrame:](v9, "initWithFrame:", v11 + v21, v13 + v18, v15 - (v21 + v19), v17 - (v18 + v20));
    [v5 setPluginInsetMask:v22];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[LPLinkView sizeThatFits:](self->_attachmentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  if (a4)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->bottom = v5;
  }
  -[LPLinkView sizeThatFits:](self->_attachmentView, "sizeThatFits:", a3.width, a3.height);
  double v7 = v6;
  double v9 = v8;
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
    double v7 = v7 + 0.0;
    double v9 = v9 + v10;
  }
  double v11 = v7;
  double v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CKAttachmentBalloonView;
  [(CKImageBalloonView *)&v27 layoutSubviews];
  BOOL v3 = [(CKBalloonView *)self hasSuggestedActionsMenu];
  [(CKAttachmentBalloonView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  if (v3)
  {
    [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
    double v10 = v7 + 0.0;
    double v12 = v9 - v11;
    [(CKAttachmentBalloonView *)self bounds];
    double v14 = v13;
    [(CKAttachmentBalloonView *)self bounds];
  }
  else
  {
    double v16 = v4;
    double v17 = v5;
    [(CKAttachmentBalloonView *)self pluginInsets];
    double v19 = v18;
    double v14 = v16 + v18;
    double v15 = v17 + v20;
    double v10 = v7 - (v19 + v21);
    double v12 = v9 - (v20 + v22);
  }
  -[LPLinkView setFrame:](self->_attachmentView, "setFrame:", v14, v15, v10, v12);
  v23 = [(CKAttachmentBalloonView *)self pluginInsetMask];
  [(LPLinkView *)self->_attachmentView frame];
  objc_msgSend(v23, "setFrame:");

  BOOL v24 = [(CKImageBalloonView *)self isScheduled];
  attachmentView = self->_attachmentView;
  if (v24)
  {
    [(LPLinkView *)attachmentView setAlpha:0.5];
    v26 = [(CKAttachmentBalloonView *)self pluginInsetMask];
    [(CKAttachmentBalloonView *)self insertSubview:v26 above:self->_attachmentView];
  }
  else
  {
    [(LPLinkView *)attachmentView setAlpha:1.0];
    v26 = [(CKAttachmentBalloonView *)self pluginInsetMask];
    [v26 removeFromSuperview];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3 = [(CKBalloonView *)self orientation];
  double v4 = +[CKUIBehavior sharedBehaviors];
  [(CKBalloonView *)self balloonDescriptor];
  [v4 attachmentBalloonAlignmentRectInsetsWithTailShape:v17];
  double v8 = v7;
  double v10 = v9;
  if (v3) {
    double v11 = v5;
  }
  else {
    double v11 = v6;
  }
  if (v3) {
    double v12 = v6;
  }
  else {
    double v12 = v5;
  }

  double v13 = v8;
  double v14 = v11;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (NSString)description
{
  v2 = NSString;
  mediaObject = self->_mediaObject;
  v7.receiver = self;
  v7.super_class = (Class)CKAttachmentBalloonView;
  double v4 = [(CKImageBalloonView *)&v7 description];
  double v5 = [v2 stringWithFormat:@"[CKAttachmentBalloonView mediaObject:%@ %@]", mediaObject, v4];

  return (NSString *)v5;
}

- (void)prepareForDisplay
{
  v18.receiver = self;
  v18.super_class = (Class)CKAttachmentBalloonView;
  [(CKImageBalloonView *)&v18 prepareForDisplay];
  [(LPLinkView *)self->_attachmentView setHidden:0];
  BOOL v3 = [(CKBalloonView *)self orientation] == 1;
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 pluginBalloonInsetsForMessageFromMe:v3];
  -[LPLinkView setContentInset:](self->_attachmentView, "setContentInset:");

  double v5 = +[CKUIBehavior sharedBehaviors];
  -[CKBalloonView setColor:](self, "setColor:", [v5 attachmentBalloonFillColor]);

  double v6 = [(CKAttachmentBalloonView *)self attachmentView];
  objc_super v7 = [v6 _dominantBackgroundColor];

  double v8 = [(CKAttachmentBalloonView *)self attachmentView];
  if (v7) {
    [v8 _dominantBackgroundColor];
  }
  else {
  double v9 = +[CKMessagesCarouselView resolvedBackgroundColorFor:v8];
  }
  [(CKAttachmentBalloonView *)self setBackgroundColor:v9];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  [(CKBalloonView *)self balloonDescriptor];
  BYTE2(v13) = 0;
  WORD4(v17) = 1;
  double v10 = [(CKAttachmentBalloonView *)self pluginInsetMask];
  v12[2] = v15;
  v12[3] = v16;
  v12[4] = v17;
  v12[0] = v13;
  v12[1] = v14;
  double v11 = CKResizableBalloonPunchout(v12);
  [v10 setImage:v11];
}

- (UIEdgeInsets)pluginInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if ([(CKImageBalloonView *)self isScheduled])
  {
    double v6 = +[CKUIBehavior sharedBehaviors];
    [v6 linkPreviewSendLaterInsets];
  }
  double v7 = v2;
  double v8 = v3;
  double v9 = v4;
  double v10 = v5;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKAttachmentBalloonView;
  [(CKImageBalloonView *)&v3 prepareForReuse];
  [(LPLinkView *)self->_attachmentView setHidden:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v4 = objc_msgSend(a4, "view", a3);
  uint64_t v5 = objc_opt_class();
  LOBYTE(v5) = v5 != objc_opt_class();

  return v5;
}

- (CGRect)uncroppedSourceFrame
{
  double v2 = [(CKAttachmentBalloonView *)self uncroppedSourceView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIView)uncroppedSourceView
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_attachmentView)
  {
    double v10 = self;
    goto LABEL_29;
  }
  NSClassFromString(&cfstr_Lpflippedview.isa);
  double v3 = _CKFirstSubviewOfType(self->_attachmentView);
  double v4 = v3;
  if (v3)
  {
    double v5 = _CKFirstSubviewOfType(v3);
    if (!v5)
    {
      double v10 = self;
LABEL_27:

      goto LABEL_28;
    }
    NSClassFromString(&cfstr_Lpcaptionbarvi.isa);
    double v6 = _CKFirstSubviewOfType(v5);
    if (v6)
    {
      NSClassFromString(&cfstr_Lpimageview.isa);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v7 = [v6 subviews];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v25 = v6;
        v26 = v4;
        double v10 = 0;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v7);
            }
            double v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              double v14 = _CKFirstSubviewOfType(v13);
              long long v15 = v14;
              if (v14)
              {
                if (v10)
                {
                  [(CKAttachmentBalloonView *)v10 frame];
                  double v17 = v16;
                  [(CKAttachmentBalloonView *)v10 frame];
                  double v19 = v17 * v18;
                  [v15 frame];
                  double v21 = v20;
                  [v15 frame];
                  if (v21 * v22 > v19)
                  {
                    v23 = v15;

                    double v10 = v23;
                  }
                }
                else
                {
                  double v10 = v14;
                }
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v9);

        double v4 = v26;
        double v6 = v25;
        if (v10) {
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    double v10 = self;
LABEL_26:

    goto LABEL_27;
  }
  double v10 = self;
LABEL_28:

LABEL_29:

  return (UIView *)v10;
}

- (void)setMediaObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v5 = (CKMediaObject *)a3;
  if (self->_mediaObject == v5) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&self->_mediaObject, a3);
  [(LPLinkView *)self->_attachmentView resetDownloadState];
  double v6 = [(id)objc_opt_class() linkMetadataFromMediaObject:self->_mediaObject];
  [(LPLinkView *)self->_attachmentView setMetadata:v6];

  double v7 = [(CKMediaObject *)v5 transfer];
  if ([v7 isDownloadable]) {
    goto LABEL_5;
  }
  BOOL v8 = +[CKApplicationState isResizing];

  if (!v8)
  {
    attachmentView = self->_attachmentView;
    double v7 = [(CKMediaObject *)v5 transfer];
    -[LPLinkView _setBytesLoaded:](attachmentView, "_setBytesLoaded:", [v7 totalBytes]);
LABEL_5:
  }
  [(CKBalloonView *)self setNeedsPrepareForDisplay];
  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self name:@"CKFileTransferUpdatedNotification" object:0];
  if (v5)
  {
    uint64_t v11 = [(CKMediaObject *)v5 transfer];
    if (([v11 isDownloadable] & 1) != 0 || objc_msgSend(v11, "isDownloading"))
    {
      if (IMOSLoggingEnabled())
      {
        double v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          double v14 = self;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Media object not available, listen for updated notifications on %@", (uint8_t *)&v13, 0xCu);
        }
      }
      [v10 addObserver:self selector:sel_transferUpdated_ name:@"CKFileTransferUpdatedNotification" object:v11];
    }
    [v10 addObserver:self selector:sel_richIconDidChange_ name:@"CKRichIconDidChangeNotification" object:v5];
  }
LABEL_16:
}

- (void)_setProgressWithMediaObject:(id)a3
{
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v9 transfer];
    uint64_t v5 = [v4 totalBytes];

    double v6 = [v9 transfer];
    int v7 = [v6 isDownloading];

    if (v7)
    {
      BOOL v8 = [v9 transfer];
      uint64_t v5 = [v8 currentBytes];
    }
    [(LPLinkView *)self->_attachmentView _setBytesLoaded:v5];
  }
}

- (void)transferUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  double v6 = [(CKMediaObject *)self->_mediaObject transfer];
  int v7 = [v6 guid];
  BOOL v8 = [v5 guid];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      double v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Transfer updated, marking needing display.", v11, 2u);
      }
    }
    [(CKAttachmentBalloonView *)self _setProgressWithMediaObject:self->_mediaObject];
  }
}

- (void)richIconDidChange:(id)a3
{
  id v9 = a3;
  uint64_t v5 = [v9 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v8 = [v9 name];
    [v7 handleFailureInMethod:a2, self, @"CKAttachmentBalloonView.m", 366, @"Received notification %@ but the object had an unexpected type or was nil. Expected: CKMediaObject. Got: %@", v8, v5 object file lineNumber description];
  }
  if (self->_mediaObject == v5)
  {
    double v6 = [(id)objc_opt_class() linkMetadataFromMediaObject:self->_mediaObject];
    [(LPLinkView *)self->_attachmentView setMetadata:v6];
  }
}

- (id)overlayColor
{
  double v2 = [MEMORY[0x1E4F428B8] blackColor];
  double v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

- (id)overlayImage
{
  if (overlayImage_onceToken != -1) {
    dispatch_once(&overlayImage_onceToken, &__block_literal_global_70);
  }
  double v2 = (void *)overlayImage_attachmentOverlayImage;

  return v2;
}

void __39__CKAttachmentBalloonView_overlayImage__block_invoke()
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", 1.0, 1.0);
  uint64_t v1 = [v0 imageWithActions:&__block_literal_global_120_0];
  double v2 = (void *)overlayImage_attachmentOverlayImage;
  overlayImage_attachmentOverlayImage = v1;

  id v5 = [(id)overlayImage_attachmentOverlayImage imageWithRenderingMode:2];
  uint64_t v3 = objc_msgSend(v5, "resizableImageWithCapInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  id v4 = (void *)overlayImage_attachmentOverlayImage;
  overlayImage_attachmentOverlayImage = v3;
}

void __39__CKAttachmentBalloonView_overlayImage__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F428B8];
  id v3 = a2;
  id v4 = [v2 blackColor];
  [v4 setFill];

  id v5 = [v3 format];
  [v5 bounds];
  objc_msgSend(v3, "fillRect:");
}

+ (id)linkMetadataFromMediaObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  double v6 = [v4 filename];
  int v7 = [v4 fileURL];

  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [v4 fileURL];
    double v10 = [v9 path];
    uint64_t v11 = [v8 displayNameAtPath:v10];

    double v6 = (void *)v11;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F30AC8]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F30A28]);
  double v14 = [v4 transfer];
  int v15 = [v14 isThumbnail];

  if (v15)
  {
    double v16 = [v4 transfer];
    double v17 = [v16 originalFilename];
    [v13 setName:v17];

    CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F224F8];
    double v19 = [v13 name];
    PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag(v18, (CFStringRef)[v19 pathExtension], 0);
  }
  else
  {
    [v13 setName:v6];
    PreferredIdentifierForTag = [v4 UTIType];
  }
  [v13 setType:PreferredIdentifierForTag];

  double v21 = [v4 transfer];
  objc_msgSend(v13, "setSize:", objc_msgSend(v21, "totalBytes"));

  double v22 = [a1 _linkViewThumbnailFromMediaObject:v4];
  if (v22)
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v22];
    [v13 setThumbnail:v23];
  }
  [v12 setSpecialization:v13];
  [v5 setSpecialization:v12];

  return v5;
}

+ (id)_linkViewThumbnailFromMediaObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 transfer];
  id v5 = [v4 error];

  if (v5)
  {
    double v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 genericDocumentIcon];

    if (v7) {
      goto LABEL_9;
    }
  }
  else if (([v4 isDownloadable] & 1) == 0 || objc_msgSend(v4, "isThumbnail"))
  {
    int v7 = [v3 richIcon];
    if (v7) {
      goto LABEL_9;
    }
  }
  int v7 = [v3 icon];
  if (!v7)
  {
    BOOL v8 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v8 genericDocumentIcon];
  }
LABEL_9:

  return v7;
}

- (void)setOverrideBackgroundColor:(id)a3
{
  id v5 = a3;
  id v4 = [(CKAttachmentBalloonView *)self attachmentView];
  [v4 _setOverrideBackgroundColor:v5];

  [(CKAttachmentBalloonView *)self setBackgroundColor:v5];
}

- (BOOL)_isFromMe
{
  return [(CKBalloonView *)self orientation] == 1;
}

- (BOOL)shouldProvideDragPreview
{
  return 0;
}

- (id)attachmentBalloonViewPreview
{
  return 0;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (LPLinkView)attachmentView
{
  return self->_attachmentView;
}

- (void)setAttachmentView:(id)a3
{
}

- (CKBalloonImageView)pluginInsetMask
{
  return self->_pluginInsetMask;
}

- (void)setPluginInsetMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginInsetMask, 0);
  objc_storeStrong((id *)&self->_attachmentView, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKAttachmentBalloonView;
  [(CKImageBalloonView *)&v15 configureForMessagePart:v4];
  [v4 strokeColor];
  if (v8 == 0.0 && v5 == 0.0 && v6 == 0.0 && v7 == 0.0)
  {
    id v9 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v9 theme];
    uint64_t v11 = [v10 unfilledBalloonColorForColorType:8];
    [v11 ckColor];
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");
  }
  else
  {
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");
  }
  [(CKBalloonView *)self setColor:8];
  id v12 = [v4 mediaObject];
  id v13 = +[CKUIBehavior sharedBehaviors];
  [v13 previewMaxWidth];
  -[CKAttachmentBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v12, [v4 balloonOrientation], v14);
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
}

@end