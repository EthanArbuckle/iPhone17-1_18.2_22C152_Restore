@interface CKAttachmentMessagePartChatItem
- (BOOL)canCopy;
- (BOOL)canExport;
- (BOOL)canForward;
- (BOOL)canInlineReply;
- (BOOL)canPerformQuickAction;
- (BOOL)shouldCacheSize;
- (BOOL)stickersSnapToPoint;
- (CGSize)_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:(CGSize)a3;
- (CGSize)_transcoderGeneratedSizeFittingSize:(CGSize)a3 sizeExists:(BOOL *)a4;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKMediaObject)mediaObject;
- (Class)balloonViewClass;
- (Class)cellClass;
- (NSString)transferGUID;
- (NSURL)momentShareURL;
- (id)compositionWithContext:(id)a3;
- (id)description;
- (id)dragItemProvider;
- (id)fileURLForAttachment;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)transcriptTraitCollection;
- (unint64_t)balloonCorners;
- (void)setMediaObject:(id)a3;
- (void)setTranscriptTraitCollection:(id)a3;
@end

@implementation CKAttachmentMessagePartChatItem

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CKAttachmentMessagePartChatItem;
  v4 = [(CKMessagePartChatItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"[%@ attachmentContiguousType:%d]", v4, -[CKChatItem attachmentContiguousType](self, "attachmentContiguousType")];

  return v5;
}

- (CKAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKAttachmentMessagePartChatItem;
  objc_super v7 = [(CKMessagePartChatItem *)&v18 initWithIMChatItem:v6 maxWidth:a4];
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      v8 = NSStringFromSelector(sel_chatContext);
      v9 = [v6 valueForKey:v8];
    }
    else
    {
      v9 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v10 = NSStringFromSelector(sel_message);
      v11 = [v6 valueForKey:v10];
    }
    else
    {
      v11 = 0;
    }
    v12 = +[CKMediaObjectManager sharedInstance];
    v13 = [(CKAttachmentMessagePartChatItem *)v7 transferGUID];
    v14 = [v12 mediaObjectWithTransferGUID:v13 imMessage:v11 chatContext:v9];

    if (objc_opt_respondsToSelector())
    {
      v15 = NSStringFromSelector(sel_time);
      v16 = [v6 valueForKey:v15];

      if (v16)
      {
        [v14 setTime:v16];
      }
    }
    [(CKAttachmentMessagePartChatItem *)v7 setMediaObject:v14];
  }
  return v7;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v8 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v9, "previewBalloonSizeThatFits:", width, height);
LABEL_3:
    double v12 = v10;
    double v13 = v11;

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = CKDeletedMomentShareBalloonView;
LABEL_8:
    -[__objc2_class sizeThatFits:](v14, "sizeThatFits:", width, height);
LABEL_9:
    double v12 = v15;
    double v13 = v16;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = CKUnavailableMomentShareBalloonView;
    goto LABEL_8;
  }
  v19 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v20 = [v19 transfer];
  int v21 = [v20 isSticker];

  if (v21)
  {
    if (a4)
    {
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
      *(_OWORD *)&a4->bottom = v22;
    }
    v23 = +[CKChatItemSizeCache sharedInstance];
    v24 = (double *)MEMORY[0x1E4F1DB30];
    *(_OWORD *)buf = *MEMORY[0x1E4F1DB30];
    if (objc_msgSend(v23, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, buf, 0, width, height))
    {
      -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", buf[0], buf[1]);
      double v12 = v25;
      double v13 = v26;
    }
    else
    {
      char v113 = 0;
      -[CKAttachmentMessagePartChatItem _transcoderGeneratedSizeFittingSize:sizeExists:](self, "_transcoderGeneratedSizeFittingSize:sizeExists:", &v113, width, height);
      double v46 = v45;
      double v47 = *v24;
      double v109 = v24[1];
      if (v113)
      {
        double v48 = v44;
        double v49 = 0.0;
      }
      else
      {
        v50 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
        v51 = +[CKUIBehavior sharedBehaviors];
        [v51 previewMaxWidth];
        v52 = objc_msgSend(v50, "previewForWidth:orientation:", 0);

        if (v52)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v54 = v52;
          v55 = v54;
          if (isKindOfClass)
          {
            v56 = [v54 image];
            [v56 size];
            double v46 = v57;
            double v48 = v58;

            v59 = [v55 image];

            [v59 scale];
            double v49 = v60;
          }
          else
          {
            [v54 size];
            double v46 = v72;
            double v48 = v73;
            [v55 scale];
            double v49 = v74;
            v59 = v55;
          }
        }
        else
        {
          double v49 = 0.0;
          double v48 = v109;
          double v46 = v47;
        }
      }
      v75 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
      v76 = [v75 transfer];
      v77 = [v76 stickerUserInfo];

      if (v77)
      {
        v78 = [v77 objectForKey:*MEMORY[0x1E4F6E380]];
        v79 = v78;
        if (v78)
        {
          [v78 floatValue];
          double v81 = v80;
        }
        else
        {
          double v81 = 1.0;
        }
      }
      else
      {
        double v81 = 1.0;
      }
      v82 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
      objc_opt_class();
      char v83 = objc_opt_isKindOfClass();

      if (v83)
      {
        v84 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
        double v85 = width;
        if ([v84 isSticker])
        {
          v86 = [v84 sticker];
          v87 = [v86 externalURI];
          uint64_t v88 = [v87 hasPrefix:@"sticker:///emoji/"];

          v89 = +[CKUIBehavior sharedBehaviors];
          v90 = [(CKAttachmentMessagePartChatItem *)self transcriptTraitCollection];
          [v90 displayScale];
          objc_msgSend(v89, "stickerInlinePreviewMaxWidthForImageSize:isEmoji:displayScale:", v88, v46, v48, v91);
          double v93 = v92;

          double v85 = fmin(width, v93);
        }
      }
      else
      {
        double v85 = width;
      }
      v94 = +[CKUIBehavior sharedBehaviors];
      [v94 stickerScreenScale];
      objc_msgSend(v94, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v46, v48, v49, v81, v95, v85);
      double v98 = v96;
      double v99 = v97;
      if (v96 != v47 || v97 != v110) {
        objc_msgSend(v23, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v96, v97, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), width, height);
      }
      -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", v98, v99);
      double v12 = v100;
      double v13 = v101;
    }
    goto LABEL_10;
  }
  v27 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v28 = objc_opt_class();
  if ([v28 isEqual:objc_opt_class()])
  {
    BOOL v29 = [(CKMessagePartChatItem *)self isReplyContextPreview];

    if (!v29)
    {
      v9 = +[CKUIBehavior sharedBehaviors];
      v30 = +[CKUIBehavior sharedBehaviors];
      [v30 mapPreviewMaxWidth];
      double v32 = v31;

      if (v32 >= width) {
        double v33 = width;
      }
      else {
        double v33 = v32;
      }
      [v9 mapThumbnailFillSizeForWidth:v33];
      goto LABEL_3;
    }
  }
  else
  {
  }
  v34 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  if (([v34 generatePreviewOutOfProcess] & 1) == 0)
  {

    goto LABEL_30;
  }
  v35 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  int v36 = [(id)objc_opt_class() shouldUseTranscoderGeneratedPreviewSize];

  if (!v36) {
    goto LABEL_30;
  }
  char v113 = 0;
  -[CKAttachmentMessagePartChatItem _transcoderGeneratedSizeFittingSize:sizeExists:](self, "_transcoderGeneratedSizeFittingSize:sizeExists:", &v113, width, height);
  if (v113)
  {
    double v39 = v37;
    double v40 = v38;
    v41 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
    v42 = +[CKUIBehavior sharedBehaviors];
    [v42 previewMaxWidth];
    objc_msgSend(v41, "prewarmPreviewForWidth:orientation:", -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"), v43);

    -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", v39, v40);
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled())
  {
    v61 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = [(CKAttachmentMessagePartChatItem *)self transferGUID];
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v62;
      _os_log_impl(&dword_18EF18000, v61, OS_LOG_TYPE_INFO, "Did not find transcoder generated size for item w/ transferGUID = %@, generating preview", (uint8_t *)buf, 0xCu);
    }
  }
  v63 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v64 = +[CKUIBehavior sharedBehaviors];
  [v64 previewMaxWidth];
  v66 = objc_msgSend(v63, "previewForWidth:orientation:", -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"), v65);

  if (!v66)
  {
LABEL_30:
    v111.receiver = self;
    v111.super_class = (Class)CKAttachmentMessagePartChatItem;
    -[CKBalloonChatItem loadSizeThatFits:textAlignmentInsets:](&v111, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v67 = [v66 image];
    [v67 size];
    double v69 = v68;
    double v71 = v70;
  }
  else
  {
    [v66 size];
    double v69 = v102;
    double v71 = v103;
  }
  if (!+[CKApplicationState isResizing])
  {
    v112.receiver = self;
    v112.super_class = (Class)CKAttachmentMessagePartChatItem;
    -[CKBalloonChatItem loadSizeThatFits:textAlignmentInsets:](&v112, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
  }
  -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", v69, v71);
  double v12 = v104;
  double v13 = v105;
  if (width < v104 || height < v105)
  {
    double v106 = width / v104;
    double v107 = 0.0;
    if (v12 == 0.0) {
      double v106 = 0.0;
    }
    if (v13 != 0.0) {
      double v107 = height / v13;
    }
    double v108 = fmin(v106, v107);
    double v12 = ceil(v12 * v108);
    double v13 = ceil(v13 * v108);
  }

LABEL_10:
  double v17 = v12;
  double v18 = v13;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [MEMORY[0x1E4F6E6D0] sharedManager];
  if ([v6 isFeatureEnabled])
  {
    BOOL v7 = [(CKChatItem *)self isCommSafetySensitiveNotViewable];

    if (v7)
    {
      v8 = [MEMORY[0x1E4F6E6D0] sharedManager];
      uint64_t v9 = [v8 enablementGroup];

      double v10 = +[CKUIBehavior sharedBehaviors];
      double v11 = v10;
      if (v9 == 2) {
        [v10 obscuredBalloonMinimumSizeForAdult];
      }
      else {
        [v10 obscuredBalloonMinimumSizeForChild];
      }
      double v14 = v12;
      double v15 = v13;

      double width = fmax(width, v14);
      double height = fmax(height, v15);
    }
  }
  else
  {
  }
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (Class)cellClass
{
  v3 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = objc_opt_class();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKAttachmentMessagePartChatItem;
    v5 = [(CKBalloonChatItem *)&v7 cellClass];
  }

  return (Class)v5;
}

- (CGSize)_transcoderGeneratedSizeFittingSize:(CGSize)a3 sizeExists:(BOOL *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  v8 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  uint64_t v9 = [v8 transfer];
  if ([v9 isSticker]) {
    IMClientPreviewStickerConstraints();
  }
  else {
    IMClientPreviewConstraints();
  }

  double v10 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v21[0] = v23;
  v21[1] = v24;
  uint64_t v22 = v25;
  [v10 transcoderGeneratedSizeForConstraints:v21];
  double v12 = v11;
  double v14 = v13;

  if (v12 == *MEMORY[0x1E4F1DB30] && v14 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = 1;
    }
    if (width < v12 || height < v14)
    {
      double v16 = width / v12;
      double v17 = 0.0;
      if (v12 == 0.0) {
        double v16 = 0.0;
      }
      if (v14 != 0.0) {
        double v17 = height / v14;
      }
      double v18 = fmin(v16, v17);
      double v12 = ceil(v12 * v18);
      double v14 = ceil(v14 * v18);
    }
  }
  double v19 = v12;
  double v20 = v14;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (BOOL)canCopy
{
  v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v4 = [v3 transfer];
  char v5 = [v4 isSticker];

  if (v5) {
    return 0;
  }
  objc_super v7 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v8 = [v7 transfer];
  char v9 = [v8 isFileDataReady];

  return v9;
}

- (BOOL)canInlineReply
{
  v2 = self;
  uint64_t v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v4 = [(id)v3 transfer];

  LODWORD(v3) = !+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:v4];
  v6.receiver = v2;
  v6.super_class = (Class)CKAttachmentMessagePartChatItem;
  LODWORD(v2) = [(CKMessagePartChatItem *)&v6 canInlineReply] & v3;

  return (char)v2;
}

- (BOOL)canForward
{
  uint64_t v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v4 = [v3 transfer];

  if (+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForCKFileTransfer:", v4)|| (-[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject"), v5 = objc_claimAutoreleasedReturnValue(), [v5 transfer], v6 = objc_claimAutoreleasedReturnValue(), char v7 = objc_msgSend(v6, "isSticker"), v6, v5, (v7 & 1) != 0))
  {
    char v8 = 0;
  }
  else
  {
    char v9 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
    double v10 = [v9 transfer];
    char v8 = [v10 isFileDataReady];
  }
  return v8;
}

- (BOOL)canExport
{
  v2 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  char v3 = [v2 canExport];

  return v3;
}

- (BOOL)canPerformQuickAction
{
  char v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  if ([v3 canPerformQuickAction]) {
    BOOL v4 = ![(CKChatItem *)self itemIsReplyContextPreview];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)stickersSnapToPoint
{
  v2 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 0;
  }
  else
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

- (void)setTranscriptTraitCollection:(id)a3
{
  id v6 = a3;
  if ((-[UITraitCollection isEqual:](self->_transcriptTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transcriptTraitCollection, a3);
    char v5 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
    [v5 setTranscriptTraitCollection:v6];
  }
}

- (Class)balloonViewClass
{
  char v3 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = objc_opt_class();
  }
  else
  {
    id v6 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
    char v7 = +[CKUIBehavior sharedBehaviors];
    [v7 previewMaxWidth];
    BOOL v4 = objc_msgSend(v6, "balloonViewClassForWidth:orientation:", -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"), v8);
  }

  return (Class)v4;
}

- (unint64_t)balloonCorners
{
  return -1;
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (id)fileURLForAttachment
{
  v2 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  char v3 = [v2 fileURL];

  return v3;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  double v8 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  char v9 = objc_msgSend(v8, "rtfDocumentItemsWithFormatString:selectedTextRange:", v7, location, length);

  return v9;
}

- (id)dragItemProvider
{
  dragItemProvider = self->_dragItemProvider;
  if (!dragItemProvider)
  {
    BOOL v4 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
    char v5 = [v4 pasteboardItemProvider];
    id v6 = self->_dragItemProvider;
    self->_dragItemProvider = v5;

    dragItemProvider = self->_dragItemProvider;
  }

  return dragItemProvider;
}

- (NSString)transferGUID
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 transferGUID];

  return (NSString *)v3;
}

- (NSURL)momentShareURL
{
  momentShareURL = self->_momentShareURL;
  if (!momentShareURL)
  {
    BOOL v4 = [(CKMessagePartChatItem *)self message];
    IMCoreMomentShareURLForMessage();
    char v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_momentShareURL;
    self->_momentShareURL = v5;

    momentShareURL = self->_momentShareURL;
  }

  return momentShareURL;
}

- (id)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);

  objc_storeStrong((id *)&self->_dragItemProvider, 0);
}

- (id)compositionWithContext:(id)a3
{
  char v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  BOOL v4 = +[CKComposition compositionWithMediaObject:v3 subject:0];

  return v4;
}

@end