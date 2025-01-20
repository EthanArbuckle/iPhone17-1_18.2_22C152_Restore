@interface CKBalloonChatItem
- (BOOL)canBeSelectedInEditMode;
- (BOOL)displayDuringSend;
- (BOOL)failed;
- (BOOL)isBlackholed;
- (BOOL)isFromMe;
- (BOOL)isMultilineText;
- (BOOL)needsAdjustedTextAlignmentInsets;
- (BOOL)needsPreservedAspectRatio;
- (BOOL)shouldCacheSize;
- (BOOL)wantsDrawerLayout;
- (CGSize)balloonSizeAtMaxWidth;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (Class)balloonViewClass;
- (Class)cellClass;
- (NSDate)time;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)textAlignmentInsetsAtMaxWidth;
- (UIEdgeInsets)transcriptTextAlignmentInsets;
- (char)balloonOrientation;
- (char)balloonShape;
- (char)tailShape;
- (char)transcriptOrientation;
- (id)cellIdentifier;
- (id)contact;
- (id)description;
- (id)loadTranscriptDrawerText;
- (id)sender;
- (unint64_t)balloonCorners;
- (unint64_t)layoutType;
- (void)setBalloonSizeAtMaxWidth:(CGSize)a3;
- (void)setTextAlignmentInsetsAtMaxWidth:(UIEdgeInsets)a3;
- (void)unloadSize;
@end

@implementation CKBalloonChatItem

- (BOOL)needsPreservedAspectRatio
{
  v2 = [(CKBalloonChatItem *)self balloonViewClass];
  uint64_t v3 = objc_opt_class();

  return [(objc_class *)v2 isSubclassOfClass:v3];
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v8 = +[CKChatItemSizeCache sharedInstance];
  long long v54 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  long long v55 = *MEMORY[0x1E4F437F8];
  long long v57 = *MEMORY[0x1E4F437F8];
  long long v58 = v54;
  long long v56 = *MEMORY[0x1E4F1DB30];
  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [(CKBalloonChatItem *)self balloonViewClass];
  if (v10 == (objc_class *)objc_opt_class())
  {
    BOOL v12 = 1;
  }
  else
  {
    v11 = [(CKBalloonChatItem *)self balloonViewClass];
    BOOL v12 = v11 == (objc_class *)objc_opt_class();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(CKBalloonChatItem *)self balloonViewClass] ? (BOOL v13 = v12) : (BOOL v13 = 0), v13))
  {
    [v9 previewBalloonMaxWidthForBalloonMaxWidth:width];
    double width = v14;
  }
  if (-[CKBalloonChatItem failed](self, "failed") && [v9 shouldAdjustWidthForSendFailure])
  {
    +[CKTranscriptMessageCell failureButtonWidthPlusSpacing];
    double width = width - v15;
  }
  if ([(CKBalloonChatItem *)self shouldCacheSize]
    && objc_msgSend(v8, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v56, &v57, width, height))
  {
    if (a4)
    {
      long long v16 = v58;
      *(_OWORD *)&a4->top = v57;
      *(_OWORD *)&a4->bottom = v16;
    }
    double v18 = *((double *)&v56 + 1);
    double v17 = *(double *)&v56;
    goto LABEL_71;
  }
  v19 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [(CKChatItem *)self IMChatItem];
  }
  else
  {
    v20 = 0;
  }

  int v21 = [v20 chatInScrutinyMode];
  if (v21)
  {
    v22 = [v20 guid];
    v23 = IMAssociatedMessageDecodeGUID();

    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v60 = v23;
        _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Attempting to size %@", buf, 0xCu);
      }
    }
    [MEMORY[0x1E4F6BC28] storeGUIDInAttemptingListInScrutinyMode:v23];
    if (!v20) {
      goto LABEL_42;
    }
  }
  else
  {
    v23 = 0;
    if (!v20) {
      goto LABEL_42;
    }
  }
  v25 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v25 isInternalInstall])
  {
    int v26 = IMGetCachedDomainBoolForKey();

    if (!v26) {
      goto LABEL_42;
    }
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [v20 guid];
        int v29 = [v20 isCorrupt];
        v30 = @"NO";
        if (v29) {
          v30 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        id v60 = v28;
        __int16 v61 = 2112;
        v62 = v30;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "DEBUG: message %@ isCorrupt %@", buf, 0x16u);
      }
    }
    if ([v20 isCorrupt])
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_42;
      }
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "We are corrupt already, not crashing", buf, 2u);
      }
    }
    else
    {
      v51 = [v20 text];
      v25 = [v51 string];

      if ([v25 isEqualToString:@"internal_poison_hang"])
      {
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v52, OS_LOG_TYPE_INFO, "INTERNAL POISON PILL TEST DETECTED - Spinning", buf, 2u);
          }
        }
        while (1)
          sleep(1u);
      }
      if ([v25 isEqualToString:@"internal_poison_crash"])
      {
        if (IMOSLoggingEnabled())
        {
          v53 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v53, OS_LOG_TYPE_INFO, "INTERNAL POISON PILL TEST DETECTED - Crashing", buf, 2u);
          }
        }
        abort();
      }
    }
  }

LABEL_42:
  v31 = CKBalloonViewForClass([(CKBalloonChatItem *)self balloonViewClass]);
  [(CKBalloonChatItem *)self configureBalloonView:v31];
  objc_msgSend(v31, "setCanUseOpaqueMask:", objc_msgSend(v9, "transcriptCanUseOpaqueMask"));
  [v31 prepareForDisplayIfNeeded];
  [v31 frame];
  objc_msgSend(v31, "setFrame:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_isMultilineText
      || ([(CKBalloonChatItem *)self balloonSizeAtMaxWidth], v32 <= 0.0)
      || ([(CKBalloonChatItem *)self balloonSizeAtMaxWidth], v33 <= 0.0)
      || ([(CKBalloonChatItem *)self balloonSizeAtMaxWidth], v34 >= width))
    {
      buf[0] = 0;
      objc_msgSend(v31, "sizeThatFits:textAlignmentInsets:isSingleLine:", a4, buf, width, height);
      double v17 = v43;
      double v18 = v44;
      int v45 = buf[0];
      self->_isMultilineText = buf[0] ^ 1;
      if (v45)
      {
        -[CKBalloonChatItem setBalloonSizeAtMaxWidth:](self, "setBalloonSizeAtMaxWidth:", v43, v44);
        -[CKBalloonChatItem setTextAlignmentInsetsAtMaxWidth:](self, "setTextAlignmentInsetsAtMaxWidth:", a4->top, a4->left, a4->bottom, a4->right);
      }
      goto LABEL_55;
    }
    [(CKBalloonChatItem *)self textAlignmentInsetsAtMaxWidth];
    a4->top = v35;
    a4->left = v36;
    a4->bottom = v37;
    a4->right = v38;
    [(CKBalloonChatItem *)self balloonSizeAtMaxWidth];
  }
  else
  {
    v41 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v42 = [v41 isTextKit2Enabled];

    if ((v42 & 1) == 0 && !+[CKApplicationState isResizing]) {
      [v31 layoutIfNeeded];
    }
    objc_msgSend(v31, "sizeThatFits:textAlignmentInsets:", a4, width, height);
  }
  double v17 = v39;
  double v18 = v40;
LABEL_55:
  if ([(CKBalloonChatItem *)self shouldCacheSize]
    && (v17 != *MEMORY[0x1E4F1DB30] || v18 != *(double *)(MEMORY[0x1E4F1DB30] + 8)))
  {
    if (a4)
    {
      long long v46 = *(_OWORD *)&a4->bottom;
      long long v57 = *(_OWORD *)&a4->top;
      long long v58 = v46;
    }
    else
    {
      long long v57 = v55;
      long long v58 = v54;
    }
    objc_msgSend(v8, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v17, v18, v57, v58, width, height);
  }
  CKBalloonViewReuse(v31);
  if (v23) {
    int v47 = v21;
  }
  else {
    int v47 = 0;
  }
  if (v47 == 1)
  {
    [MEMORY[0x1E4F6BC28] removeGUIDInAttemptingListInScrutinyMode:v23];
    if (IMOSLoggingEnabled())
    {
      v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v60 = v23;
        _os_log_impl(&dword_18EF18000, v48, OS_LOG_TYPE_INFO, "Marked %@ as safe", buf, 0xCu);
      }
    }
  }

LABEL_71:
  double v49 = v17;
  double v50 = v18;
  result.double height = v50;
  result.double width = v49;
  return result;
}

- (unint64_t)layoutType
{
  if ([(CKChatItem *)self itemIsReplyContextPreview]) {
    return 13;
  }
  if ([(CKChatItem *)self itemIsThreadOriginator]) {
    return 14;
  }
  if ([(CKChatItem *)self itemIsReply]) {
    return 12;
  }
  return 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CKBalloonChatItem;
  v4 = [(CKChatItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"[%@ fromMe:%d balloonOrientation:%d]", v4, -[CKBalloonChatItem isFromMe](self, "isFromMe"), -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation")];

  return v5;
}

- (UIEdgeInsets)transcriptTextAlignmentInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 balloonTranscriptInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (char)transcriptOrientation
{
  if ([(CKBalloonChatItem *)self isFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)cellIdentifier
{
  double v3 = NSStringFromClass([(CKBalloonChatItem *)self balloonViewClass]);
  if (![(CKBalloonChatItem *)self isFromMe])
  {
    uint64_t v4 = [v3 stringByAppendingString:@"-left"];

    double v3 = (void *)v4;
  }

  return v3;
}

- (id)contact
{
  entity = self->_entity;
  if (!entity)
  {
    uint64_t v4 = [CKEntity alloc];
    double v5 = [(CKBalloonChatItem *)self sender];
    double v6 = [(CKEntity *)v4 initWithIMHandle:v5];

    double v7 = self->_entity;
    self->_entity = v6;

    entity = self->_entity;
  }

  return [(CKEntity *)entity cnContact];
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (BOOL)canBeSelectedInEditMode
{
  return 1;
}

- (void)unloadSize
{
  v3.receiver = self;
  v3.super_class = (Class)CKBalloonChatItem;
  [(CKChatItem *)&v3 unloadSize];
  self->_balloonSizeAtMaxWidth = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (id)loadTranscriptDrawerText
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  uint64_t v4 = [v3 timestampDateFormatter];

  double v5 = [(CKBalloonChatItem *)self time];
  double v6 = [v4 stringFromDate:v5];

  double v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 drawerTranscriptTextAttributes];

  if (v6)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v8];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(CKBalloonChatItem *)self time];
        double v12 = [(CKChatItem *)self IMChatItem];
        double v13 = [v12 guid];
        int v15 = 138412546;
        id v16 = v11;
        __int16 v17 = 2112;
        double v18 = v13;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "loadTranscriptDrawerText: nil timestamp for time: %@, IMChatItem guid: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    double v9 = 0;
  }

  return v9;
}

- (char)balloonOrientation
{
  return [(CKBalloonChatItem *)self isFromMe];
}

- (unint64_t)balloonCorners
{
  return -1;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)failed
{
  return 0;
}

- (NSDate)time
{
  return 0;
}

- (id)sender
{
  return 0;
}

- (BOOL)shouldCacheSize
{
  return 1;
}

- (BOOL)isBlackholed
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  char v5 = [(CKBalloonChatItem *)self balloonOrientation];
  char v6 = [(CKBalloonChatItem *)self balloonShape];
  if ([(CKChatItem *)self hasTail]) {
    int v7 = [(CKBalloonChatItem *)self tailShape];
  }
  else {
    int v7 = 0;
  }
  unint64_t v8 = [(CKBalloonChatItem *)self balloonCorners];
  id v13 = [(CKChatItem *)self transcriptTraitCollection];
  int64_t v9 = [v13 userInterfaceStyle];
  double v10 = [(CKChatItem *)self transcriptTraitCollection];
  int64_t v11 = CKBackgroundLevelForTraitCollection(v10);
  *(_OWORD *)&retstr->var6.red = CKColorZero;
  retstr->var0 = v6;
  retstr->var1 = v7;
  retstr->var2 = 0;
  retstr->var3 = v5;
  retstr->var4 = v8;
  retstr->var5 = -2;
  *(_OWORD *)&retstr->var6.blue = *(_OWORD *)&qword_18F81CEF8;
  retstr->var7 = v9;
  retstr->var8 = v11;
  retstr->var9 = 0;
  retstr->var10 = v7 != 0;
  *(_WORD *)&retstr->var11 = 0;

  return result;
}

- (char)tailShape
{
  return 1;
}

- (char)balloonShape
{
  return 0;
}

- (BOOL)needsAdjustedTextAlignmentInsets
{
  uint64_t v3 = objc_opt_class();

  return [(CKBalloonChatItem *)self isMemberOfClass:v3];
}

- (BOOL)isMultilineText
{
  return self->_isMultilineText;
}

- (CGSize)balloonSizeAtMaxWidth
{
  double width = self->_balloonSizeAtMaxWidth.width;
  double height = self->_balloonSizeAtMaxWidth.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBalloonSizeAtMaxWidth:(CGSize)a3
{
  self->_balloonSizeAtMaxWidth = a3;
}

- (UIEdgeInsets)textAlignmentInsetsAtMaxWidth
{
  double top = self->_textAlignmentInsetsAtMaxWidth.top;
  double left = self->_textAlignmentInsetsAtMaxWidth.left;
  double bottom = self->_textAlignmentInsetsAtMaxWidth.bottom;
  double right = self->_textAlignmentInsetsAtMaxWidth.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextAlignmentInsetsAtMaxWidth:(UIEdgeInsets)a3
{
  self->_textAlignmentInsetsAtMaxWidth = a3;
}

- (void).cxx_destruct
{
}

@end