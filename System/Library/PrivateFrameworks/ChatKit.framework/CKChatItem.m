@interface CKChatItem
+ (double)resultingMaxWidthWithBalloonMaxWidth:(double)a3 fullMaxWidth:(double)a4 transcriptTraitCollection:(id)a5;
+ (id)chatItemWithIMChatItem:(id)a3 balloonMaxWidth:(double)a4;
+ (id)chatItemWithIMChatItem:(id)a3 balloonMaxWidth:(double)a4 fullMaxWidth:(double)a5 transcriptTraitCollection:(id)a6 overlayLayout:(BOOL)a7;
+ (id)chatItemWithNotification:(id)a3 balloonMaxWidth:(double)a4 fullMaxWidth:(double)a5;
+ (void)unloadSizesOfChatItems:(id)a3;
- (BOOL)_associatedChatItemIsReaction:(id)a3;
- (BOOL)_textContainsIMTextEffect;
- (BOOL)canAttachStickers;
- (BOOL)canBeSelectedInEditMode;
- (BOOL)canCopy;
- (BOOL)canDelete;
- (BOOL)canEditMessageText;
- (BOOL)canExport;
- (BOOL)canForward;
- (BOOL)canInlineReply;
- (BOOL)canPerformQuickAction;
- (BOOL)canRetract;
- (BOOL)canSave;
- (BOOL)canSendAsTextMessage;
- (BOOL)canSendAsTextMessageOverSatellite;
- (BOOL)canSendTapbacks;
- (BOOL)displayDuringSend;
- (BOOL)hasTail;
- (BOOL)invalidateContiguousTypeOverride;
- (BOOL)isAudioMessage;
- (BOOL)isCommSafetySensitive;
- (BOOL)isCommSafetySensitiveNotViewable;
- (BOOL)isCommSafetySensitiveViewable;
- (BOOL)isEditedMessageHistory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isHighlighted;
- (BOOL)isSizeLoaded;
- (BOOL)isSticker;
- (BOOL)itemIsFromMe;
- (BOOL)itemIsReply;
- (BOOL)itemIsReplyContextPreview;
- (BOOL)itemIsReplyCount;
- (BOOL)itemIsReplyFromMe;
- (BOOL)itemIsSameThreadAsOtherItem:(id)a3;
- (BOOL)itemIsThreadOriginator;
- (BOOL)previousPhotoActionItemIsOccluded:(unint64_t)a3 allDatasourceItems:(id)a4;
- (BOOL)previousReplyCount:(unint64_t)a3 allDatasourceItems:(id)a4 isOccludedForAssociatedSize:(CGSize)a5 outMaxY:(double *)a6;
- (BOOL)previousStatusItemStatusOrientation:(id)a3 isOccludedByCurrentItem:(id)a4;
- (BOOL)stickersSnapToPoint;
- (BOOL)supportsCommunicationSafety;
- (BOOL)supportsInlineReplyTransition;
- (BOOL)useContiguousTypeOverride;
- (BOOL)wantsDrawerLayout;
- (BOOL)wantsMoreMenu;
- (BOOL)wantsOverlayLayout;
- (BOOL)wasDetonated;
- (BOOL)zOrder;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CGSize)size;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (CKChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKChatItem)initWithNotification:(id)a3 maxWidth:(double)a4;
- (CKChatItemTranscriptInsertionHandler)insertionHandler;
- (CKMessagePartHighlightChatItem)messageHighlightChatItem;
- (CNContact)contact;
- (Class)cellClass;
- (Class)customLayoutGroupProviderClass;
- (IMFileTransfer)commSafetyFileTransfer;
- (IMHandle)sender;
- (IMTranscriptChatItem)IMChatItem;
- (NSArray)visibleAssociatedMessageChatItems;
- (NSArray)visibleAssociatedStickerChatItems;
- (NSArray)visibleRepositionEnabledStickers;
- (NSAttributedString)transcriptDrawerText;
- (NSAttributedString)transcriptText;
- (NSString)cellIdentifier;
- (NSString)commSafetyMessageGUID;
- (NSString)commSafetyTransferGUID;
- (NSString)description;
- (NSString)layoutGroupIdentifier;
- (NSString)transcriptIdentifier;
- (NSURL)commSafetyTransferLocalURL;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)stickerReactionInsets;
- (UIEdgeInsets)textAlignmentInsets;
- (UITraitCollection)transcriptTraitCollection;
- (UNNotification)notification;
- (char)transcriptOrientation;
- (double)_additionalBottomPaddingForChatItem:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 prevChatItem:(id)a6 layoutEnvironment:(id)a7 sizeOverride:(CGSize)a8;
- (double)_additionalTopPaddingForChatItem:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 prevChatItem:(id)a6 layoutEnvironment:(id)a7 sizeOverride:(CGSize)a8;
- (double)maxWidth;
- (id)layoutItemSpacingForReplyContextPreviewWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6;
- (id)layoutItemSpacingForReplyItemWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)layoutItemSpacingForReplyThreadOriginatorWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)layoutItemWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5;
- (id)loadTranscriptDrawerText;
- (id)loadTranscriptText;
- (id)syndicationBehaviorString;
- (int64_t)chatItemReplyLineContiguousTypeForChatStyle:(unsigned __int8)a3;
- (int64_t)syndicationBehavior;
- (int64_t)syndicationType;
- (unint64_t)layoutType;
- (unsigned)attachmentContiguousType;
- (unsigned)contiguousType;
- (unsigned)contiguousTypeOverride;
- (void)_setSizeForTesting:(CGSize)a3;
- (void)setContiguousTypeOverride:(unsigned __int8)a3;
- (void)setIMChatItem:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setNotification:(id)a3;
- (void)setSizeLoaded:(BOOL)a3;
- (void)setTranscriptDrawerText:(id)a3;
- (void)setTranscriptIdentifier:(id)a3;
- (void)setTranscriptText:(id)a3;
- (void)setTranscriptTraitCollection:(id)a3;
- (void)setUseContiguousTypeOverride:(BOOL)a3;
- (void)setWantsOverlayLayout:(BOOL)a3;
- (void)unloadSize;
- (void)unloadTranscriptText;
- (void)updateWithBalloonMaxWidth:(double)a3 fullMaxWidth:(double)a4 transcriptTraitCollection:(id)a5;
@end

@implementation CKChatItem

- (BOOL)isEqual:(id)a3
{
  v4 = (CKChatItem *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(v4)) {
      char v6 = IMTranscriptChatItemEqual();
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)syndicationBehaviorString
{
  if ([(CKChatItem *)self syndicationBehavior]) {
    return @"IMChatItemSyndicationBehaviorEnabled";
  }
  else {
    return @"IMChatItemSyndicationBehaviorNone";
  }
}

- (NSString)description
{
  v18 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)CKChatItem;
  v16 = [(CKChatItem *)&v19 description];
  v15 = [(CKChatItem *)self IMChatItem];
  v17 = [(CKChatItem *)self IMChatItem];
  unsigned int v14 = [v17 contiguousType];
  v3 = [(CKChatItem *)self IMChatItem];
  unsigned int v4 = [v3 attachmentContiguousType];
  double maxWidth = self->_maxWidth;
  char v6 = NSStringFromCGSize(self->_size);
  v7 = NSStringFromUIEdgeInsets(self->_textAlignmentInsets);
  int v8 = [(CKChatItem *)self transcriptOrientation];
  if ([(CKChatItem *)self isHighlighted]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = [(CKChatItem *)self syndicationBehaviorString];
  if ([(CKChatItem *)self wasDetonated]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = [v18 stringWithFormat:@"[%@ [IMChatItem: %@], contiguousType:%d, attachmentContiguousType:%d, maxWidth:%f, size:%@, textAlignmentInsets:%@, transcriptOrientation: %d, isHighlighted: %@, syndicationBehavior: %@, wasDetonated: %@]", v16, v15, v14, v4, *(void *)&maxWidth, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (NSString)layoutGroupIdentifier
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 layoutGroupIdentifier];

  return (NSString *)v3;
}

- (unsigned)contiguousType
{
  if ([(CKChatItem *)self useContiguousTypeOverride])
  {
    return [(CKChatItem *)self contiguousTypeOverride];
  }
  else
  {
    unsigned int v4 = [(CKChatItem *)self IMChatItem];
    unsigned __int8 v5 = [v4 contiguousType];

    return v5;
  }
}

- (unsigned)attachmentContiguousType
{
  if ([(CKChatItem *)self useContiguousTypeOverride])
  {
    return [(CKChatItem *)self contiguousTypeOverride];
  }
  else
  {
    unsigned int v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 supportsContiguousAttachments];

    if (v5)
    {
      char v6 = [(CKChatItem *)self IMChatItem];
      unsigned __int8 v7 = [v6 attachmentContiguousType];

      return v7;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)hasTail
{
  int v2 = [(CKChatItem *)self contiguousType];
  return !v2 || v2 == 3;
}

- (NSAttributedString)transcriptText
{
  transcriptText = self->_transcriptText;
  if (!transcriptText)
  {
    unsigned int v4 = [(CKChatItem *)self loadTranscriptText];
    int v5 = (NSAttributedString *)[v4 copy];
    char v6 = self->_transcriptText;
    self->_transcriptText = v5;

    transcriptText = self->_transcriptText;
  }

  return transcriptText;
}

- (void)unloadTranscriptText
{
  transcriptText = self->_transcriptText;
  self->_transcriptText = 0;

  transcriptDrawerText = self->_transcriptDrawerText;
  self->_transcriptDrawerText = 0;
}

- (CGSize)size
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_sizeLoaded)
  {
    double width = self->_size.width;
    double height = self->_size.height;
  }
  else
  {
    double maxWidth = self->_maxWidth;
    if (maxWidth == 0.0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v6 = [MEMORY[0x1E4F42D90] mainScreen];
        [v6 bounds];
        double v8 = v7;
        double v10 = v9;

        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Transcript sizing race condition. Please file a bug on Messages.", (uint8_t *)&v14, 2u);
          }
        }
        double maxWidth = fmin(v8, v10);
        if (IMOSLoggingEnabled())
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = [MEMORY[0x1E4F29060] callStackSymbols];
            int v14 = 138412290;
            v15 = v13;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v14, 0xCu);
          }
        }
      }
    }
    self->_sizeLoaded = 1;
    -[CKChatItem loadSizeThatFits:textAlignmentInsets:](self, "loadSizeThatFits:textAlignmentInsets:", &self->_textAlignmentInsets, maxWidth, 1.79769313e308);
    self->_size.double width = width;
    self->_size.double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)textAlignmentInsets
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_sizeLoaded)
  {
    v3 = (void *)MEMORY[0x192FBB780]();
    double maxWidth = self->_maxWidth;
    if (maxWidth == 0.0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v5 = [MEMORY[0x1E4F42D90] mainScreen];
        [v5 bounds];
        double v7 = v6;
        double v9 = v8;

        if (IMOSLoggingEnabled())
        {
          double v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Transcript sizing race condition. Please file a bug on Messages.", (uint8_t *)&v19, 2u);
          }
        }
        double maxWidth = fmin(v7, v9);
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = [MEMORY[0x1E4F29060] callStackSymbols];
            int v19 = 138412290;
            v20 = v12;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v19, 0xCu);
          }
        }
      }
    }
    self->_sizeLoaded = 1;
    -[CKChatItem loadSizeThatFits:textAlignmentInsets:](self, "loadSizeThatFits:textAlignmentInsets:", &self->_textAlignmentInsets, maxWidth, 1.79769313e308);
    self->_size.double width = v13;
    self->_size.double height = v14;
  }
  double top = self->_textAlignmentInsets.top;
  double left = self->_textAlignmentInsets.left;
  double bottom = self->_textAlignmentInsets.bottom;
  double right = self->_textAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

+ (void)unloadSizesOfChatItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned int v4 = +[CKChatItemSizeCache sharedInstance];
  [v4 invalidateCachedSizeForChatItems:v3 reason:@"chatitem_unloadsizes"];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "unloadSize", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)unloadSize
{
  self->_sizeLoaded = 0;
}

- (UIEdgeInsets)contentInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (char)transcriptOrientation
{
  return 0;
}

- (Class)cellClass
{
  return 0;
}

- (NSString)cellIdentifier
{
  double v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (IMHandle)sender
{
  return 0;
}

- (CNContact)contact
{
  return 0;
}

- (BOOL)displayDuringSend
{
  return 0;
}

- (NSAttributedString)transcriptDrawerText
{
  transcriptDrawerText = self->_transcriptDrawerText;
  if (!transcriptDrawerText)
  {
    double v4 = [(CKChatItem *)self loadTranscriptDrawerText];
    double v5 = (NSAttributedString *)[v4 copy];
    uint64_t v6 = self->_transcriptDrawerText;
    self->_transcriptDrawerText = v5;

    transcriptDrawerText = self->_transcriptDrawerText;
  }

  return transcriptDrawerText;
}

- (BOOL)wantsDrawerLayout
{
  return [(CKChatItem *)self transcriptOrientation] == 0;
}

- (BOOL)wantsMoreMenu
{
  double v3 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(CKChatItem *)self IMChatItem];
    unint64_t v6 = [v5 scheduleState];
    unsigned int v7 = (v6 < 6) & (0x39u >> v6);
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)canBeSelectedInEditMode
{
  return 0;
}

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)canDelete
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 canDelete];

  return v3;
}

- (BOOL)canRetract
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 canRetract];

  return v3;
}

- (BOOL)canEditMessageText
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 canEditMessageText];

  return v3;
}

- (BOOL)isEditedMessageHistory
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isEditedMessageHistory];

  return v3;
}

- (BOOL)canForward
{
  return 0;
}

- (BOOL)canExport
{
  return 0;
}

- (BOOL)canSave
{
  return 0;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

- (BOOL)canInlineReply
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (BOOL)stickersSnapToPoint
{
  return 0;
}

- (UIEdgeInsets)stickerReactionInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)canPerformQuickAction
{
  return 0;
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (BOOL)isFromMe
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isFromMe];

  return v3;
}

- (BOOL)supportsInlineReplyTransition
{
  return 1;
}

- (BOOL)supportsCommunicationSafety
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 supportsCommunicationSafety];

  return v3;
}

- (NSString)commSafetyTransferGUID
{
  return 0;
}

- (NSURL)commSafetyTransferLocalURL
{
  double v2 = [(CKChatItem *)self commSafetyFileTransfer];
  char v3 = [v2 localURL];

  return (NSURL *)v3;
}

- (NSString)commSafetyMessageGUID
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 guid];

  return (NSString *)v3;
}

- (IMFileTransfer)commSafetyFileTransfer
{
  if ([(CKChatItem *)self supportsCommunicationSafety]
    && ([(CKChatItem *)self commSafetyTransferGUID],
        char v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        v4))
  {
    double v5 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    unint64_t v6 = [(CKChatItem *)self commSafetyTransferGUID];
    unsigned int v7 = [v5 transferForGUID:v6];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return (IMFileTransfer *)v7;
}

- (BOOL)isCommSafetySensitiveViewable
{
  if (![(CKChatItem *)self supportsCommunicationSafety]) {
    return 0;
  }
  char v3 = [(CKChatItem *)self commSafetyFileTransfer];
  BOOL v4 = [v3 commSafetySensitive] == 2;

  return v4;
}

- (BOOL)isCommSafetySensitiveNotViewable
{
  if (![(CKChatItem *)self supportsCommunicationSafety]) {
    return 0;
  }
  char v3 = [(CKChatItem *)self commSafetyFileTransfer];
  BOOL v4 = [v3 commSafetySensitive] == 1;

  return v4;
}

- (BOOL)isCommSafetySensitive
{
  BOOL v3 = [(CKChatItem *)self supportsCommunicationSafety];
  if (v3)
  {
    if ([(CKChatItem *)self isCommSafetySensitiveViewable])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(CKChatItem *)self isCommSafetySensitiveNotViewable];
    }
  }
  return v3;
}

- (BOOL)isAudioMessage
{
  return 0;
}

+ (double)resultingMaxWidthWithBalloonMaxWidth:(double)a3 fullMaxWidth:(double)a4 transcriptTraitCollection:(id)a5
{
  return a4;
}

- (void)updateWithBalloonMaxWidth:(double)a3 fullMaxWidth:(double)a4 transcriptTraitCollection:(id)a5
{
  id v8 = a5;
  [(id)objc_opt_class() resultingMaxWidthWithBalloonMaxWidth:v8 fullMaxWidth:a3 transcriptTraitCollection:a4];
  double v10 = v9;

  [(CKChatItem *)self setMaxWidth:v10];
}

- (void)setContiguousTypeOverride:(unsigned __int8)a3
{
  self->_contiguousTypeOverride = a3;
  [(CKChatItem *)self setUseContiguousTypeOverride:1];
}

- (BOOL)invalidateContiguousTypeOverride
{
  BOOL v3 = [(CKChatItem *)self useContiguousTypeOverride];
  [(CKChatItem *)self setUseContiguousTypeOverride:0];
  BOOL v4 = [(CKChatItem *)self IMChatItem];
  self->_contiguousTypeOverride = [v4 contiguousType];

  return v3;
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_double maxWidth = a3;
    [(CKChatItem *)self unloadSize];
  }
}

- (CKChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKChatItem;
  id v8 = [(CKChatItem *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imChatItem, a3);
    v9->_double maxWidth = a4;
  }

  return v9;
}

- (CKChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKChatItem;
  id v8 = [(CKChatItem *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notification, a3);
    v9->_double maxWidth = a4;
  }

  return v9;
}

- (id)loadTranscriptText
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  if (a4)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->double top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->double bottom = v4;
  }
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *retstr = *(CKBalloonDescriptor_t *)CKBalloonDescriptorZero;
  return self;
}

- (void)_setSizeForTesting:(CGSize)a3
{
  self->_size = a3;
  self->_sizeLoaded = 1;
}

- (int64_t)syndicationBehavior
{
  double v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 syndicationBehavior];

  return v3;
}

- (BOOL)isHighlighted
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (int64_t)syndicationType
{
  double v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 syndicationType];

  return v3;
}

- (BOOL)wasDetonated
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 wasDetonated];

  return v3;
}

- (CKChatItemTranscriptInsertionHandler)insertionHandler
{
  return 0;
}

- (BOOL)_textContainsIMTextEffect
{
  return 0;
}

- (IMTranscriptChatItem)IMChatItem
{
  return self->_imChatItem;
}

- (void)setIMChatItem:(id)a3
{
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (void)setTranscriptText:(id)a3
{
}

- (BOOL)zOrder
{
  return self->_zOrder;
}

- (UITraitCollection)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (void)setTranscriptTraitCollection:(id)a3
{
}

- (Class)customLayoutGroupProviderClass
{
  return self->_customLayoutGroupProviderClass;
}

- (void)setTranscriptDrawerText:(id)a3
{
}

- (BOOL)wantsOverlayLayout
{
  return self->_wantsOverlayLayout;
}

- (void)setWantsOverlayLayout:(BOOL)a3
{
  self->_wantsOverlayLayout = a3;
}

- (BOOL)canSendAsTextMessageOverSatellite
{
  return self->_canSendAsTextMessageOverSatellite;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (unsigned)contiguousTypeOverride
{
  return self->_contiguousTypeOverride;
}

- (BOOL)isSizeLoaded
{
  return self->_sizeLoaded;
}

- (void)setSizeLoaded:(BOOL)a3
{
  self->_sizeLoaded = a3;
}

- (BOOL)useContiguousTypeOverride
{
  return self->_useContiguousTypeOverride;
}

- (void)setUseContiguousTypeOverride:(BOOL)a3
{
  self->_useContiguousTypeOverride = a3;
}

- (NSString)transcriptIdentifier
{
  return self->_transcriptIdentifier;
}

- (void)setTranscriptIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptIdentifier, 0);
  objc_storeStrong((id *)&self->_transcriptDrawerText, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
  objc_storeStrong((id *)&self->_transcriptText, 0);
  objc_storeStrong((id *)&self->_notification, 0);

  objc_storeStrong((id *)&self->_imChatItem, 0);
}

+ (id)chatItemWithIMChatItem:(id)a3 balloonMaxWidth:(double)a4
{
  id v5 = a3;
  double v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "__ck_chatItemClass")), "initWithIMChatItem:maxWidth:", v5, a4);

  return v6;
}

+ (id)chatItemWithIMChatItem:(id)a3 balloonMaxWidth:(double)a4 fullMaxWidth:(double)a5 transcriptTraitCollection:(id)a6 overlayLayout:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a3;
  long long v13 = objc_msgSend(v12, "__ck_chatItemClass");
  [v13 resultingMaxWidthWithBalloonMaxWidth:v11 fullMaxWidth:a4 transcriptTraitCollection:a5];
  uint64_t v15 = (void *)[objc_alloc((Class)v13) initWithIMChatItem:v12 maxWidth:v14];

  [v15 setTranscriptTraitCollection:v11];
  [v15 setWantsOverlayLayout:v7];

  return v15;
}

+ (id)chatItemWithNotification:(id)a3 balloonMaxWidth:(double)a4 fullMaxWidth:(double)a5
{
  id v6 = a3;
  BOOL v7 = [(CKChatItem *)[CKTextMessagePartChatItem alloc] initWithNotification:v6 maxWidth:a4];

  return v7;
}

- (unint64_t)layoutType
{
  return 0;
}

- (id)layoutItemWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [(CKChatItem *)self size];
  CGFloat v10 = v9;
  double v12 = v11;
  [(CKChatItem *)self contentInsets];
  double v14 = v13;
  double v16 = v15;
  [v7 marginInsets];
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v7 messageEditingContext];
  v22 = v21;
  double v23 = v12 + v14 + v18 + v16 + v20;
  if (v21)
  {
    v24 = [v21 editedMessageGuid];
    v25 = [(CKChatItem *)self IMChatItem];
    v26 = [v25 guid];

    if ([v26 isEqualToString:v24])
    {
      [v22 editedMessageHeight];
      double v23 = v27;
    }
  }
  if (CKPixelWidth_once_9 != -1) {
    dispatch_once(&CKPixelWidth_once_9, &__block_literal_global_119);
  }
  if (v23 < *(double *)&CKPixelWidth_sPixel_9)
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v41.double width = v10;
        v41.double height = v23;
        v29 = NSStringFromCGSize(v41);
        int v33 = 136315650;
        v34 = "-[CKChatItem(Layout) layoutItemWithEnvironment:datasourceItemIndex:allDatasourceItems:]";
        __int16 v35 = 2112;
        v36 = v29;
        __int16 v37 = 2112;
        v38 = self;
        _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s chatItem has invalid height < _1PX, has %@: %@", (uint8_t *)&v33, 0x20u);
      }
    }
    if (CKPixelWidth_once_9 != -1) {
      dispatch_once(&CKPixelWidth_once_9, &__block_literal_global_119);
    }
    double v23 = *(double *)&CKPixelWidth_sPixel_9;
  }
  v30 = +[CKChatItemLayoutUtilities dynamicWidthLayoutSizeWithHeight:v23];
  v31 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v30];

  return v31;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (a4 < 1)
  {
    double v16 = 0;
  }
  else
  {
    double v16 = [v14 objectAtIndex:a4 - 1];
  }
  if ([(CKChatItem *)self layoutType] == 12)
  {
    uint64_t v17 = -[CKChatItem layoutItemSpacingForReplyItemWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](self, "layoutItemSpacingForReplyItemWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:", v13, a4, v14, v15, width, height);
LABEL_34:
    double v27 = (void *)v17;
    goto LABEL_35;
  }
  if ([(CKChatItem *)self layoutType] == 13)
  {
    uint64_t v17 = [(CKChatItem *)self layoutItemSpacingForReplyContextPreviewWithEnvironment:v13 datasourceItemIndex:a4 allDatasourceItems:v14 supplementryItems:v15];
    goto LABEL_34;
  }
  if ([(CKChatItem *)self layoutType] == 14)
  {
    uint64_t v17 = -[CKChatItem layoutItemSpacingForReplyThreadOriginatorWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](self, "layoutItemSpacingForReplyThreadOriginatorWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:", v13, a4, v14, v15, width, height);
    goto LABEL_34;
  }
  if ([(CKChatItem *)self layoutType] == 1 || [(CKChatItem *)self layoutType] == 17)
  {
    double v18 = 0.0;
    switch([v16 layoutType])
    {
      case 1:
      case 14:
        double v19 = +[CKUIBehavior sharedBehaviors];
        objc_msgSend(v19, "balloonBalloonTranscriptSpace:", objc_msgSend(v16, "contiguousType"));
        goto LABEL_32;
      case 2:
      case 3:
      case 7:
      case 10:
      case 11:
      case 17:
        double v19 = +[CKUIBehavior sharedBehaviors];
        [v19 mediumTranscriptSpace];
        goto LABEL_32;
      case 4:
      case 5:
      case 15:
        BOOL v28 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:a4 - 1 allDatasourceItems:v14];
        double v19 = +[CKUIBehavior sharedBehaviors];
        if (!v28) {
          goto LABEL_31;
        }
        goto LABEL_28;
      case 6:
      case 18:
        double v19 = +[CKUIBehavior sharedBehaviors];
LABEL_31:
        [v19 smallTranscriptSpace];
        goto LABEL_32;
      case 12:
        double v19 = +[CKUIBehavior sharedBehaviors];
LABEL_28:
        [v19 extraLargeTranscriptSpace];
LABEL_32:
        double v18 = v20;

        break;
      case 16:
        break;
      default:
        if (v16 && IMOSLoggingEnabled())
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v39 = (id)objc_opt_class();
            __int16 v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
            id v38 = (id)objc_opt_class();
            v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "layoutType"));
            *(_DWORD *)buf = 138413058;
            id v41 = v39;
            __int16 v42 = 2112;
            v43 = v37;
            __int16 v44 = 2112;
            id v45 = v38;
            __int16 v46 = 2112;
            v47 = v30;
            _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ (%@) shouldn't follow %@ (%@)", buf, 0x2Au);
          }
        }
        v31 = +[CKUIBehavior sharedBehaviors];
        [v31 smallTranscriptSpace];
        double v18 = v32;

        break;
    }
    -[CKChatItem _additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    double v34 = v33;
    -[CKChatItem _additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    uint64_t v17 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v16 topSpacing:v18 + v34 bottomSpacing:v35];
    goto LABEL_34;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = (id)objc_opt_class();
      id v22 = v41;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Returning default spacing for %@, should be implemented in subclass!!", buf, 0xCu);
    }
  }
  double v23 = +[CKUIBehavior sharedBehaviors];
  [v23 smallTranscriptSpace];
  double v25 = v24;

  v26 = [MEMORY[0x1E4F42640] fixedSpacing:v25];
  double v27 = [MEMORY[0x1E4F42610] spacingForLeading:0 top:v26 trailing:0 bottom:v26];

LABEL_35:

  return v27;
}

- (double)_additionalTopPaddingForChatItem:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 prevChatItem:(id)a6 layoutEnvironment:(id)a7 sizeOverride:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v87 = a5;
  id v14 = a6;
  double v15 = 0.0;
  if ([(CKChatItem *)self layoutType] != 18
    && ([(CKChatItem *)self layoutType] != 17
     || [(CKChatItem *)self transcriptOrientation]))
  {
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [v13 size];
      double width = v17;
      double height = v18;
    }
    double v19 = +[CKUIBehavior sharedBehaviors];
    [v19 balloonBalloonTranscriptSpace:0];
    double v92 = v20;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 visibleAssociatedMessageChatItemsIncludingTapbacks];
    }
    else {
      [v13 visibleAssociatedMessageChatItems];
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v93 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
    if (v93)
    {
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v101;
      CGFloat v84 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CGFloat v85 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v94 = height;
      uint64_t v86 = *(void *)v101;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v101 != v22) {
            objc_enumerationMutation(obj);
          }
          double v24 = *(void **)(*((void *)&v100 + 1) + 8 * v23);
          uint64_t v99 = 0;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v96 = 0u;
          if (v24 && ([v24 geometryDescriptor], (void)v96 == 10))
          {
            uint64_t v91 = v21;
            double v25 = +[CKUIBehavior sharedBehaviors];
            [v25 messageAcknowledgmentTranscriptBalloonRelativePosition];
            double v27 = v26;
            double v29 = v28;

            [v24 size];
            double v31 = v30;
            uint64_t v95 = 0;
            [v14 size];
            double v33 = v32;
            uint64_t v90 = [v14 layoutType];
            if (v90 == 6)
            {
              double v34 = +[CKUIBehavior sharedBehaviors];
              [v34 balloonTranscriptInsets];
              double v33 = v33 + fabs(v35);
            }
            double v36 = width - (v31 - v27);
            int v37 = [v14 transcriptOrientation];
            int v38 = [v13 transcriptOrientation];
            [v24 size];
            BOOL v39 = -[CKChatItem previousReplyCount:allDatasourceItems:isOccludedForAssociatedSize:outMaxY:](self, "previousReplyCount:allDatasourceItems:isOccludedForAssociatedSize:outMaxY:", a4, v87, &v95);
            BOOL v40 = [(CKChatItem *)self previousPhotoActionItemIsOccluded:a4 allDatasourceItems:v87];
            BOOL v41 = -[CKChatItem previousStatusItemStatusOrientation:isOccludedByCurrentItem:](self, "previousStatusItemStatusOrientation:isOccludedByCurrentItem:", v14);
            if (v33 > v36
              || (v14 ? (BOOL v42 = v37 == v38) : (BOOL v42 = 0), !v42 ? (v43 = 1) : (v43 = v39), (v43 | (v40 || v41)) == 1))
            {
              double height = v94;
              if (v40)
              {
                __int16 v44 = +[CKUIBehavior sharedBehaviors];
                [v44 smallTranscriptSpace];
                double v15 = v45 + v45;
              }
              else
              {
                [v24 size];
                if (v15 < v29 + v73) {
                  double v15 = v29 + v73;
                }
              }
            }
            else
            {
              double height = v94;
            }
            uint64_t v21 = v91;
            uint64_t v22 = v86;
            BOOL v74 = +[CKChatItemLayoutUtilities layoutTypeIsMessageBalloonForChatItem:v14];
            if (v90 != 6 && a4 >= 2 && !v74)
            {
              v75 = [v87 objectAtIndexedSubscript:a4 - 2];
              int v76 = [v14 transcriptOrientation];
              int v77 = [v75 transcriptOrientation];
              [v75 size];
              if (v76 == v77 && v78 > v36)
              {
                v79 = +[CKUIBehavior sharedBehaviors];
                [v79 mediumTranscriptSpace];
                double v81 = v80;

                if (v15 < v81) {
                  double v15 = v81;
                }
              }

              uint64_t v22 = v86;
            }
          }
          else
          {
            if ([(CKChatItem *)self _associatedChatItemIsReaction:v24])
            {
              __int16 v46 = +[CKUIBehavior sharedBehaviors];
              [v46 stickerReactionTranscriptPaddingPercentage];
              double v48 = v47;

              uint64_t v49 = [v13 itemIsFromMe];
              [v13 stickerReactionInsets];
              +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v21, v49, 0.0, 0.0, width, height, v50, v51, v52, v53);
              CGFloat v55 = v54;
              CGFloat v57 = v56;
              v58 = +[CKUIBehavior sharedBehaviors];
              [v58 stickerReactionSize];
              double v60 = v59;
              double v62 = v61;

              v106.origin.CGFloat x = v55;
              double height = v94;
              v106.origin.y = v57;
              v106.size.double height = v84;
              v106.size.double width = v85;
              CGRect v107 = CGRectInset(v106, -(v60 * v48), -(v62 * v48));
              CGFloat x = v107.origin.x;
              CGFloat v64 = v107.size.width;
              CGFloat v65 = v107.size.height;
              ++v21;
            }
            else
            {
              objc_msgSend(v24, "frameRelativeToParentFrame:", 0.0, 0.0, width, height);
              CGFloat x = v66;
              CGFloat v64 = v67;
              CGFloat v65 = v68;
            }
            CGFloat v69 = v92 + v107.origin.y;
            v108.origin.CGFloat x = 0.0;
            v108.origin.y = 0.0;
            v108.size.double width = width;
            v108.size.double height = height;
            double MinY = CGRectGetMinY(v108);
            v109.origin.CGFloat x = x;
            v109.origin.y = v69;
            v109.size.double width = v64;
            v109.size.double height = v65;
            double v71 = MinY - CGRectGetMinY(v109);
            double height = v94;
            double v72 = v71 - v92;
            if (v15 < v72) {
              double v15 = v72;
            }
          }
          ++v23;
        }
        while (v93 != v23);
        uint64_t v82 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
        uint64_t v93 = v82;
      }
      while (v82);
    }
  }
  return v15;
}

- (double)_additionalBottomPaddingForChatItem:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 prevChatItem:(id)a6 layoutEnvironment:(id)a7 sizeOverride:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v13 = [v12 isExpressiveTextEnabled];

  if (!v13)
  {
    [v11 size];
    double width = v17;
    [v11 size];
    goto LABEL_9;
  }
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v11 size];
    double width = v16;
LABEL_9:
    double height = v15;
  }
  double v18 = +[CKUIBehavior sharedBehaviors];
  [v18 balloonBalloonTranscriptSpace:0];
  double v20 = v19;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v21 = [v11 visibleAssociatedMessageChatItems];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v56;
    double v26 = 0.0;
    CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v53 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(v21);
        }
        double v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (v28) {
          [v28 geometryDescriptor];
        }
        if ([(CKChatItem *)self _associatedChatItemIsReaction:v28])
        {
          double v29 = +[CKUIBehavior sharedBehaviors];
          [v29 stickerReactionTranscriptPaddingPercentage];
          double v54 = v30;

          uint64_t v31 = [v11 itemIsFromMe];
          [v11 stickerReactionInsets];
          +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v24, v31, 0.0, 0.0, width, height, v32, v33, v34, v35);
          CGFloat v37 = v36;
          double v38 = height;
          double v39 = width;
          double v40 = v20;
          CGFloat v42 = v41;
          int v43 = +[CKUIBehavior sharedBehaviors];
          [v43 stickerReactionSize];
          double v45 = v44;
          double v47 = v46;

          v61.size.double width = v53;
          v61.origin.CGFloat x = v37;
          v61.origin.y = v42;
          double v20 = v40;
          double width = v39;
          double height = v38;
          v61.size.double height = rect;
          CGRect v62 = CGRectInset(v61, -(v45 * v54), -(v47 * v54));
          ++v24;
        }
        else
        {
          objc_msgSend(v28, "frameRelativeToParentFrame:", 0.0, 0.0, width, height);
        }
        double v48 = v20 + v62.origin.y;
        double MaxY = CGRectGetMaxY(v62);
        v63.origin.CGFloat x = 0.0;
        v63.origin.y = 0.0;
        v63.size.double width = width;
        v63.size.double height = height;
        double v50 = MaxY - CGRectGetMaxY(v63);
        if (v26 < v50) {
          double v26 = v50;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v23);
  }
  else
  {
    double v26 = 0.0;
  }

  return v26;
}

- (BOOL)_associatedChatItemIsReaction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isReaction];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)layoutItemSpacingForReplyItemWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if ([(CKChatItem *)self layoutType] == 12)
  {
    if (a4 < 1)
    {
      double v16 = 0;
    }
    else
    {
      double v16 = [v14 objectAtIndex:a4 - 1];
    }
    if (![v16 itemIsReplyCount])
    {
      switch([v16 layoutType])
      {
        case 1:
        case 12:
          double v20 = +[CKUIBehavior sharedBehaviors];
          goto LABEL_19;
        case 2:
        case 3:
        case 7:
          double v20 = +[CKUIBehavior sharedBehaviors];
          goto LABEL_21;
        case 4:
        case 5:
        case 6:
          goto LABEL_17;
        case 13:
        case 14:
          BOOL v32 = [(CKChatItem *)self itemIsFromMe];
          int v33 = [v16 itemIsFromMe];
          double v34 = +[CKUIBehavior sharedBehaviors];
          double v20 = v34;
          if ((v32 ^ v33)) {
LABEL_21:
          }
            [v20 mediumTranscriptSpace];
          else {
            [v34 selfReplyTranscriptSpace];
          }
          goto LABEL_22;
        default:
          if (IMOSLoggingEnabled())
          {
            double v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              double v45 = (char *)(id)objc_opt_class();
              int v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
              id v44 = (id)objc_opt_class();
              double v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "layoutType"));
              *(_DWORD *)buf = 138413058;
              double v47 = v45;
              __int16 v48 = 2112;
              unint64_t v49 = (unint64_t)v43;
              __int16 v50 = 2112;
              id v51 = v44;
              __int16 v52 = 2112;
              CGFloat v53 = v40;
              _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Reply Item Spacing: %@ (%@) shouldn't follow %@ (%@)", buf, 0x2Au);
            }
          }
          double v41 = +[CKUIBehavior sharedBehaviors];
          [v41 smallTranscriptSpace];
          double v30 = v42;

          goto LABEL_24;
      }
    }
    int v19 = [(CKChatItem *)self itemIsFromMe];
    if (v19 == [v16 itemIsFromMe])
    {
      BOOL v21 = +[CKChatItemLayoutUtilities needsAdditionalBracketPaddingForChatItem:self prevChatItem:v16];
      uint64_t v22 = +[CKUIBehavior sharedBehaviors];
      double v20 = v22;
      if (v21)
      {
        [v22 replyLineBracketRadius];
        double v24 = v23;
        uint64_t v25 = +[CKUIBehavior sharedBehaviors];
        [v25 replyLineViewVerticalPadding];
        double v27 = v26;
        double v28 = +[CKUIBehavior sharedBehaviors];
        [v28 textBalloonMinHeight];
        double v30 = v24 + v27 * 2.0 + v29 * -0.5;

        goto LABEL_23;
      }
LABEL_19:
      objc_msgSend(v20, "balloonBalloonTranscriptSpace:", objc_msgSend(v16, "contiguousType"));
    }
    else
    {
LABEL_17:
      double v20 = +[CKUIBehavior sharedBehaviors];
      [v20 smallTranscriptSpace];
    }
LABEL_22:
    double v30 = v31;
LABEL_23:

LABEL_24:
    -[CKChatItem _additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    double v36 = v35;
    -[CKChatItem _additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    double v18 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v16 topSpacing:v30 + v36 bottomSpacing:v37];

    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    double v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      double v47 = "-[CKChatItem(Layout) layoutItemSpacingForReplyItemWithEnvironment:datasourceItemIndex:allDatasourceItems:sup"
            "plementryItems:sizeOverride:]";
      __int16 v48 = 2048;
      unint64_t v49 = [(CKChatItem *)self layoutType];
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s asked to generate spacing for non-reply type %lu", buf, 0x16u);
    }
  }
  double v18 = 0;
LABEL_25:

  return v18;
}

- (id)layoutItemSpacingForReplyContextPreviewWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(CKChatItem *)self layoutType] == 13)
  {
    if (a4 < 1)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [v11 objectAtIndex:a4 - 1];
    }
    unint64_t v16 = [v13 layoutType];
    if (v16 <= 0xF)
    {
      if (((1 << v16) & 0x903A) != 0)
      {
        double v17 = +[CKUIBehavior sharedBehaviors];
        [v17 extraLargeTranscriptSpace];
LABEL_17:
        double v19 = v18;

LABEL_18:
        id v15 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v13 topSpacing:v19 bottomSpacing:0.0];

        goto LABEL_19;
      }
      if (((1 << v16) & 0x84) != 0)
      {
        double v17 = +[CKUIBehavior sharedBehaviors];
        [v17 mediumTranscriptSpace];
        goto LABEL_17;
      }
      if (v16 == 6)
      {
        double v17 = +[CKUIBehavior sharedBehaviors];
        [v17 smallTranscriptSpace];
        goto LABEL_17;
      }
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = (char *)(id)objc_opt_class();
        double v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
        id v24 = (id)objc_opt_class();
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "layoutType"));
        int v28 = 138413058;
        double v29 = v22;
        __int16 v30 = 2112;
        unint64_t v31 = (unint64_t)v23;
        __int16 v32 = 2112;
        id v33 = v24;
        __int16 v34 = 2112;
        double v35 = v25;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Reply Context Preview Spacing: %@ (%@) shouldn't follow %@ (%@)", (uint8_t *)&v28, 0x2Au);
      }
    }
    double v26 = +[CKUIBehavior sharedBehaviors];
    [v26 smallTranscriptSpace];
    double v19 = v27;

    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v28 = 136315394;
      double v29 = "-[CKChatItem(Layout) layoutItemSpacingForReplyContextPreviewWithEnvironment:datasourceItemIndex:allDatasourc"
            "eItems:supplementryItems:]";
      __int16 v30 = 2048;
      unint64_t v31 = [(CKChatItem *)self layoutType];
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s asked to generate spacing for non-reply context preview type %lu", (uint8_t *)&v28, 0x16u);
    }
  }
  id v15 = 0;
LABEL_19:

  return v15;
}

- (id)layoutItemSpacingForReplyThreadOriginatorWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if ([(CKChatItem *)self layoutType] == 14)
  {
    if (a4 < 1)
    {
      unint64_t v16 = 0;
    }
    else
    {
      unint64_t v16 = [v14 objectAtIndex:a4 - 1];
    }
    switch([v16 layoutType])
    {
      case 1:
      case 12:
        if ([(CKChatItem *)self itemIsSameThreadAsOtherItem:v16])
        {
          BOOL v21 = +[CKChatItemLayoutUtilities nextMessageIsReplyForIndex:a4 allDatasourceItems:v14];
          double v19 = +[CKUIBehavior sharedBehaviors];
          if (!v21) {
            goto LABEL_18;
          }
        }
        else
        {
          double v19 = +[CKUIBehavior sharedBehaviors];
        }
        goto LABEL_20;
      case 2:
      case 3:
      case 7:
        double v19 = +[CKUIBehavior sharedBehaviors];
        [v19 mediumTranscriptSpace];
        goto LABEL_21;
      case 4:
      case 5:
        BOOL v22 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:a4 - 1 allDatasourceItems:v14];
        BOOL v23 = +[CKChatItemLayoutUtilities nextMessageIsReplyForIndex:a4 allDatasourceItems:v14];
        double v19 = +[CKUIBehavior sharedBehaviors];
        if (!v22 && !v23) {
          goto LABEL_18;
        }
LABEL_20:
        [v19 extraLargeTranscriptSpace];
        goto LABEL_21;
      case 6:
      case 15:
        double v19 = +[CKUIBehavior sharedBehaviors];
LABEL_18:
        [v19 smallTranscriptSpace];
LABEL_21:
        double v24 = v20;

        break;
      default:
        if (IMOSLoggingEnabled())
        {
          double v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            double v35 = (char *)(id)objc_opt_class();
            id v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKChatItem layoutType](self, "layoutType"));
            id v34 = (id)objc_opt_class();
            __int16 v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "layoutType"));
            *(_DWORD *)buf = 138413058;
            double v37 = v35;
            __int16 v38 = 2112;
            unint64_t v39 = (unint64_t)v33;
            __int16 v40 = 2112;
            id v41 = v34;
            __int16 v42 = 2112;
            int v43 = v30;
            _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "CKChatItem_Layout: Reply Thread Originator Spacing: %@ (%@) shouldn't follow %@ (%@)", buf, 0x2Au);
          }
        }
        unint64_t v31 = +[CKUIBehavior sharedBehaviors];
        [v31 smallTranscriptSpace];
        double v24 = v32;

        break;
    }
    -[CKChatItem _additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalTopPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    double v26 = v25;
    -[CKChatItem _additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:](self, "_additionalBottomPaddingForChatItem:datasourceItemIndex:allDatasourceItems:prevChatItem:layoutEnvironment:sizeOverride:", self, a4, v14, v16, v13, width, height);
    double v18 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v16 topSpacing:v24 + v26 bottomSpacing:v27];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        double v37 = "-[CKChatItem(Layout) layoutItemSpacingForReplyThreadOriginatorWithEnvironment:datasourceItemIndex:allDatas"
              "ourceItems:supplementryItems:sizeOverride:]";
        __int16 v38 = 2048;
        unint64_t v39 = [(CKChatItem *)self layoutType];
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "CKChatItem_Layout - %s asked to generate spacing for non-thread originator preview type %lu", buf, 0x16u);
      }
    }
    double v18 = 0;
  }

  return v18;
}

- (BOOL)previousReplyCount:(unint64_t)a3 allDatasourceItems:(id)a4 isOccludedForAssociatedSize:(CGSize)a5 outMaxY:(double *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a4;
  BOOL v11 = [(CKChatItem *)self itemIsReply];
  LOBYTE(self) = 0;
  if (v11 && (uint64_t)(a3 - 1) >= 1)
  {
    while (1)
    {
      id v13 = [v10 objectAtIndex:--a3];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if ((uint64_t)a3 <= 1)
      {
        LOBYTE(self) = 0;
        goto LABEL_18;
      }
    }
    id v14 = v13;
    unint64_t v15 = [v14 replyCount];
    [v14 size];
    double v17 = v16;
    [v14 size];
    BOOL v20 = width <= v17 && v15 > 1;
    LODWORD(self) = height <= v18 && v20;
    if (self == 1)
    {
      [v14 size];
      *(void *)a6 = v21;
    }
  }
LABEL_18:

  return (char)self;
}

- (BOOL)previousStatusItemStatusOrientation:(id)a3 isOccludedByCurrentItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    int v8 = [v6 transcriptOrientation];
    int v9 = [v7 transcriptOrientation];
    int v10 = [v7 statusAlignment];

    BOOL v12 = v8 == v9 && v10 != v8;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)previousPhotoActionItemIsOccluded:(unint64_t)a3 allDatasourceItems:(id)a4
{
  char v4 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSticker
{
  return 0;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  return 0;
}

- (CKMessagePartHighlightChatItem)messageHighlightChatItem
{
  return 0;
}

- (BOOL)itemIsReply
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(CKChatItem *)self isReply];
}

- (BOOL)itemIsFromMe
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isFromMe];

  return v3;
}

- (BOOL)itemIsReplyFromMe
{
  int v3 = [(CKChatItem *)self conformsToProtocol:&unk_1EDF65C88];
  if (v3)
  {
    LOBYTE(v3) = [(CKChatItem *)self replyIsFromMe];
  }
  return v3;
}

- (BOOL)itemIsReplyContextPreview
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(CKChatItem *)self isReplyContextPreview];
}

- (BOOL)itemIsThreadOriginator
{
  double v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 itemIsThreadOriginator];

  return v3;
}

- (BOOL)itemIsReplyCount
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)itemIsSameThreadAsOtherItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CKChatItem *)self IMChatItem];
  id v6 = [v5 threadIdentifier];
  id v7 = [v4 IMChatItem];

  int v8 = [v7 threadIdentifier];
  char v9 = [v6 isEqualToString:v8];

  return v9;
}

- (int64_t)chatItemReplyLineContiguousTypeForChatStyle:(unsigned __int8)a3
{
  int v3 = a3;
  int v4 = [(CKChatItem *)self contiguousType];
  int64_t v5 = 1;
  if (v4 == 1) {
    int64_t v5 = v3 == 45;
  }
  if (v4 == 2) {
    return 0;
  }
  else {
    return v5;
  }
}

- (NSArray)visibleAssociatedStickerChatItems
{
  return (NSArray *)sub_18F4E57F8(self, (uint64_t)a2, (void (*)(void))sub_18F4E5620);
}

- (NSArray)visibleRepositionEnabledStickers
{
  return (NSArray *)sub_18F4E57F8(self, (uint64_t)a2, sub_18F4E5874);
}

@end