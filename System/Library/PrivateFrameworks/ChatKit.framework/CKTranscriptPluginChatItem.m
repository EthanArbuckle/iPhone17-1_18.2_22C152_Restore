@interface CKTranscriptPluginChatItem
- (BOOL)canCopy;
- (BOOL)canForward;
- (BOOL)canInlineReply;
- (BOOL)canPerformQuickAction;
- (BOOL)isAppearing;
- (BOOL)isBusiness;
- (BOOL)isHandwriting;
- (BOOL)isPlayed;
- (BOOL)isSaved;
- (BOOL)shouldAllowExtraTallHeightForBundleID:(id)a3;
- (BOOL)shouldSnapshot;
- (BOOL)wantsBalloonGradient;
- (BOOL)wantsOutline;
- (BOOL)wantsPendingMessageStyle;
- (BOOL)wantsTranscriptGroupMonograms;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKChatBotActionButton)cachedChatBotActionButton;
- (CKTranscriptPluginChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (Class)balloonViewClass;
- (Class)cellClass;
- (IMTranscriptPluginChatItem)imTranscriptPluginChatItem;
- (NSArray)recipients;
- (NSString)bundleIdentifier;
- (NSString)conversationID;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)pluginInsets;
- (UIEdgeInsets)textAlignmentInsets;
- (char)transcriptOrientation;
- (id)balloonControllerForContext:(id)a3;
- (id)cellIdentifier;
- (id)compositionWithContext:(id)a3;
- (id)contact;
- (id)contentViewControllerForContext:(id)a3;
- (id)dragItemProvider;
- (id)extensibleViewControllerForContext:(id)a3;
- (id)extensibleViewForContext:(id)a3;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptDrawerText;
- (id)message;
- (id)pluginDisplayContainerForContext:(id)a3;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)sender;
- (id)snapshotGUIDForPluginPayload:(id)a3;
- (unint64_t)layoutType;
- (void)_cacheConversationID:(id)a3 recipients:(id)a4 isBusiness:(BOOL)a5;
- (void)_configureBalloonController:(id)a3 conversationID:(id)a4 recipients:(id)a5 isBusiness:(BOOL)a6;
- (void)configureWithConversationID:(id)a3 recipients:(id)a4 isBusiness:(BOOL)a5 context:(id)a6;
- (void)performHostAppResumeWithContext:(id)a3;
- (void)releaseBalloonControllerIfNeededForContext:(id)a3;
- (void)relinquishBalloonControllerForContext:(id)a3;
- (void)setCachedChatBotActionButton:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setImTranscriptPluginChatItem:(id)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setIsBusiness:(BOOL)a3;
- (void)setRecipients:(id)a3;
@end

@implementation CKTranscriptPluginChatItem

- (unint64_t)layoutType
{
  if ([(CKChatItem *)self itemIsReply]) {
    return 12;
  }
  else {
    return 1;
  }
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if ([(CKTranscriptPluginChatItem *)self isAppearing])
  {
    if (a4 >= 1 && ([v14 objectAtIndex:a4 - 1], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = (void *)v16;
      v18 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v16 topSpacing:0.0 bottomSpacing:0.0];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CKTranscriptPluginChatItem;
    v18 = -[CKChatItem layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](&v20, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v13, a4, v14, v15, width, height);
  }

  return v18;
}

- (id)compositionWithContext:(id)a3
{
  v3 = [(CKTranscriptPluginChatItem *)self pluginDisplayContainerForContext:a3];
  v4 = +[CKComposition compositionWithPluginDisplayContainer:v3 subject:0];

  return v4;
}

- (CKTranscriptPluginChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptPluginChatItem;
  v7 = [(CKMessagePartChatItem *)&v11 initWithIMChatItem:v6 maxWidth:a4];
  v8 = v7;
  if (v7)
  {
    [(CKTranscriptPluginChatItem *)v7 setImTranscriptPluginChatItem:v6];
    v9 = [v6 type];
    v8->_isHandwriting = [v9 isEqualToString:*MEMORY[0x1E4F6CBD8]];
  }
  return v8;
}

- (id)extensibleViewForContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CKTranscriptPluginChatItem *)self balloonControllerForContext:v4];
    id v6 = [v5 pluginContentView];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get plugin view", v9, 2u);
      }
    }
    id v6 = 0;
  }

  return v6;
}

- (id)extensibleViewControllerForContext:(id)a3
{
  v3 = [(CKTranscriptPluginChatItem *)self balloonControllerForContext:a3];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 pluginContentViewController];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)contentViewControllerForContext:(id)a3
{
  v3 = [(CKTranscriptPluginChatItem *)self balloonControllerForContext:a3];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 contentViewController];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)balloonControllerForContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
    id v6 = [(CKTranscriptPluginChatItem *)self imTranscriptPluginChatItem];
    v7 = [v5 balloonControllerForIMChatItem:v6 contextIdentifier:v4];

    if (v7)
    {
      v8 = [(CKTranscriptPluginChatItem *)self conversationID];
      v9 = [(CKTranscriptPluginChatItem *)self recipients];
      [(CKTranscriptPluginChatItem *)self _configureBalloonController:v7 conversationID:v8 recipients:v9 isBusiness:[(CKTranscriptPluginChatItem *)self isBusiness]];

      id v10 = v7;
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Failed to get balloon plugin controller from balloon plugin manager", v14, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get plugin controller!", buf, 2u);
      }
    }
    v7 = 0;
  }

  return v7;
}

- (void)configureWithConversationID:(id)a3 recipients:(id)a4 isBusiness:(BOOL)a5 context:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [(CKTranscriptPluginChatItem *)self _cacheConversationID:v12 recipients:v11 isBusiness:v6];
  id v13 = [(CKTranscriptPluginChatItem *)self balloonControllerForContext:v10];

  [(CKTranscriptPluginChatItem *)self _configureBalloonController:v13 conversationID:v12 recipients:v11 isBusiness:v6];
}

- (void)_configureBalloonController:(id)a3 conversationID:(id)a4 recipients:(id)a5 isBusiness:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v6)
  {
    id v12 = [(CKChatItem *)self IMChatItem];
    int v13 = [v12 isAllowlistedRichLinkSender];

    if (v13)
    {
      if (objc_opt_respondsToSelector()) {
        [v14 setAllowsOpeningSensitiveURLs:1];
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v14 configureWithConversationID:v10 recipients:v11];
  }
}

- (void)_cacheConversationID:(id)a3 recipients:(id)a4 isBusiness:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(CKTranscriptPluginChatItem *)self setConversationID:a3];
  [(CKTranscriptPluginChatItem *)self setRecipients:v8];

  [(CKTranscriptPluginChatItem *)self setIsBusiness:v5];
}

- (NSString)bundleIdentifier
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 dataSource];
  id v4 = [v3 pluginPayload];

  BOOL v5 = [v4 pluginBundleID];

  return (NSString *)v5;
}

- (BOOL)canPerformQuickAction
{
  v3 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(CKChatItem *)self IMChatItem];
    BOOL v6 = [v5 messageItem];

    v7 = [v6 swyBundleID];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F6EA28] sharedManager];
      int v9 = [v8 showPinningStatusTextForBundleID:v7];

      unsigned int v10 = v9 & ~[(CKChatItem *)self isHighlighted];
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)canCopy
{
  v3 = [(CKChatItem *)self IMChatItem];
  id v4 = [v3 type];
  char v5 = [v4 containsString:*MEMORY[0x1E4F6CBE8]];

  if (v5) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptPluginChatItem;
  return [(CKMessagePartChatItem *)&v7 canCopy];
}

- (BOOL)canForward
{
  v3 = [(CKChatItem *)self IMChatItem];
  id v4 = [v3 type];
  char v5 = [v4 containsString:*MEMORY[0x1E4F6CBE8]];

  if (v5) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptPluginChatItem;
  return [(CKMessagePartChatItem *)&v7 canForward];
}

- (BOOL)canInlineReply
{
  v3 = [(CKChatItem *)self IMChatItem];
  if ([v3 canReply])
  {
    if ([(CKMessagePartChatItem *)self isReply])
    {
      char v4 = 1;
    }
    else
    {
      char v5 = [(CKChatItem *)self IMChatItem];
      BOOL v6 = [v5 type];
      char v4 = [v6 containsString:*MEMORY[0x1E4F6CC10]];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)message
{
  v2 = [(CKChatItem *)self IMChatItem];
  v3 = [v2 message];

  return v3;
}

- (id)pluginDisplayContainerForContext:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get plugin container", buf, 2u);
      }
      goto LABEL_24;
    }
LABEL_25:
    v22 = 0;
    goto LABEL_30;
  }
  char v5 = [(CKChatItem *)self IMChatItem];
  BOOL v6 = [v5 dataSource];
  objc_super v7 = [v6 pluginPayload];

  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Unable to get plugin payload from data source!", buf, 2u);
      }
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  id v8 = [v7 cleansedCopy];

  int v9 = [(CKTranscriptPluginChatItem *)self snapshotGUIDForPluginPayload:v8];
  if (v9
    && (+[CKSnapshotUtilities snapshotForGUID:v9],
        (unsigned int v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v12 = [(CKTranscriptPluginChatItem *)self extensibleViewForContext:v4];
    int v13 = v12;
    if (!v12
      || ([v12 bounds], v15 == *MEMORY[0x1E4F1DB30]) && v14 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          if (v13) {
            v17 = @"NO";
          }
          else {
            v17 = @"YES";
          }
          [v13 bounds];
          v53.double width = v18;
          v53.double height = v19;
          objc_super v20 = NSStringFromCGSize(v53);
          *(_DWORD *)buf = 138412546;
          v48 = v17;
          __int16 v49 = 2112;
          v50 = v20;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Error with pluginView, was nil %@, size %@", buf, 0x16u);
        }
      }

      v21 = 0;
      goto LABEL_28;
    }
    [v13 bounds];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    v27 = [MEMORY[0x1E4F42D90] mainScreen];
    [v27 scale];
    CGFloat v29 = v28;
    v54.double width = v24;
    v54.double height = v26;
    UIGraphicsBeginImageContextWithOptions(v54, 0, v29);

    [v13 bounds];
    objc_msgSend(v13, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
    unsigned int v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    if (!v10)
    {
      v21 = 0;
      goto LABEL_29;
    }
  }
  v30 = [(CKChatItem *)self transcriptTraitCollection];
  uint64_t v31 = [v30 userInterfaceStyle];
  v32 = [(CKChatItem *)self transcriptTraitCollection];
  LODWORD(v40) = 0x1000000;
  long long v42 = CKColorZero;
  *((void *)&v40 + 1) = -1;
  char v41 = -2;
  long long v43 = *(_OWORD *)&qword_18F81CEF8;
  uint64_t v44 = v31;
  uint64_t v45 = CKBackgroundLevelForTraitCollection(v32);
  int v46 = 0;
  int v9 = CKResizableBalloonMask(&v40);

  [v10 size];
  UIGraphicsBeginImageContextWithOptions(v55, 0, 0.0);
  [v10 size];
  double v34 = v33;
  [v10 size];
  objc_msgSend(v9, "drawInRect:", 0.0, 0.0, v34, v35);
  [v10 size];
  double v37 = v36;
  [v10 size];
  objc_msgSend(v10, "drawInRect:blendMode:alpha:", 18, 0.0, 0.0, v37, v38, 1.0);
  v21 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
LABEL_28:

LABEL_29:
  v22 = +[CKPluginDisplayContainer pluginDisplayContainerWithPluginPayload:v8 composeImage:v21];

LABEL_30:

  return v22;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(CKChatItem *)self transcriptIdentifier];
  int v9 = [(CKTranscriptPluginChatItem *)self pluginDisplayContainerForContext:v8];

  unsigned int v10 = objc_msgSend(v9, "rtfDocumentItemsWithFormatString:selectedTextRange:", v7, location, length);

  return v10;
}

- (id)sender
{
  v2 = [(CKTranscriptPluginChatItem *)self message];
  v3 = [v2 sender];

  return v3;
}

- (id)contact
{
  v2 = [(CKTranscriptPluginChatItem *)self sender];
  v3 = [[CKEntity alloc] initWithIMHandle:v2];
  id v4 = [(CKEntity *)v3 cnContact];

  return v4;
}

- (id)cellIdentifier
{
  v2 = [(CKTranscriptPluginChatItem *)self balloonViewClass];

  return NSStringFromClass(v2);
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)balloonViewClass
{
  if (![(CKTranscriptPluginChatItem *)self isHandwriting]) {
    [(CKTranscriptPluginChatItem *)self shouldSnapshot];
  }
  v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)shouldSnapshot
{
  v3 = [(CKChatItem *)self IMChatItem];
  id v4 = [v3 dataSource];
  char v5 = [v4 pluginPayload];

  BOOL v6 = [(CKTranscriptPluginChatItem *)self imTranscriptPluginChatItem];
  id v7 = [v6 dataSource];
  char v8 = [v7 supportsDynamicSize];

  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    unsigned int v10 = [(CKTranscriptPluginChatItem *)self snapshotGUIDForPluginPayload:v5];
    BOOL v9 = +[CKSnapshotUtilities snapshotExistsForGUID:v10];
  }
  return v9;
}

- (UIEdgeInsets)textAlignmentInsets
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

- (id)snapshotGUIDForPluginPayload:(id)a3
{
  id v3 = a3;
  double v4 = [v3 messageGUID];
  double v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
  BOOL v6 = [v3 pluginBundleID];

  id v7 = [v5 balloonPluginForBundleID:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    int v9 = [v8 isEnabled];
    if (CKShouldShowSURF())
    {
      if (v9)
      {
LABEL_10:
        id v11 = @"-enabled";
        goto LABEL_11;
      }
    }
    else
    {
      unsigned int v10 = [v8 identifier];
      if (![v10 hasSuffix:*MEMORY[0x1E4F6CC30]])
      {
        id v12 = [v8 identifier];
        char v13 = [v12 hasSuffix:*MEMORY[0x1E4F6CC38]];

        id v11 = @"-disabled";
        if (v13 & 1) != 0 || ((v9 ^ 1)) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    id v11 = @"-disabled";
LABEL_11:
    uint64_t v14 = [v4 stringByAppendingString:v11];

    double v4 = (void *)v14;
  }

  return v4;
}

- (char)transcriptOrientation
{
  double v2 = [(CKChatItem *)self IMChatItem];
  int v3 = [v2 isFromMe];

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)wantsPendingMessageStyle
{
  int v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4)
  {
    double v5 = [(CKMessagePartChatItem *)self messageItem];
    char v6 = [v5 isPendingSatelliteSend];

    if (v6) {
      return 1;
    }
  }
  id v8 = [(CKMessagePartChatItem *)self messageItem];
  uint64_t v9 = [v8 scheduleType];

  if (v9 != 2) {
    return 0;
  }
  unsigned int v10 = [(CKMessagePartChatItem *)self messageItem];
  unint64_t v11 = [v10 scheduleState];

  if (v11 <= 5) {
    return (0x36u >> v11) & 1;
  }
  else {
    return 0;
  }
}

- (UIEdgeInsets)pluginInsets
{
  if ([(CKTranscriptPluginChatItem *)self wantsPendingMessageStyle])
  {
    double v2 = +[CKUIBehavior sharedBehaviors];
    [v2 linkPreviewSendLaterInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F437F8];
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
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

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->bottom = v7;
  }
  double v8 = [(CKChatItem *)self IMChatItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [(CKChatItem *)self IMChatItem];
  }
  else
  {
    double v9 = 0;
  }

  int v10 = [v9 chatInScrutinyMode];
  if (v10)
  {
    double v11 = [v9 guid];
    double v12 = [v9 guid];
    double v13 = objc_msgSend(v11, "substringWithRange:", 3, objc_msgSend(v12, "length") - 3);

    [MEMORY[0x1E4F6BC28] storeGUIDInAttemptingListInScrutinyMode:v13];
    if (IMOSLoggingEnabled())
    {
      double v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Plugin: Storing attempt guid %@", buf, 0xCu);
      }
    }
  }
  else
  {
    double v13 = 0;
  }
  double v15 = [MEMORY[0x1E4F6C360] sharedInstance];
  if (![v15 isInternalInstall]
    || !IMGetCachedDomainBoolForKey())
  {
    goto LABEL_25;
  }

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = [v9 isCorrupt];
        CGFloat v18 = @"NO";
        if (v17) {
          CGFloat v18 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "DEBUG: Plugin:  message %@ isCorrupt %@", buf, 0x16u);
      }
    }
    int v19 = [v9 isCorrupt];
    int v20 = IMOSLoggingEnabled();
    if (!v19)
    {
      if (v20)
      {
        uint64_t v51 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v51, OS_LOG_TYPE_INFO, "Plugin: INTERNAL POISON PILL PLUGIN TEST DETECTED - Crashing", buf, 2u);
        }
      }
      abort();
    }
    if (v20)
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Plugin: We are corrupt already, not crashing", buf, 2u);
      }
LABEL_25:
    }
  }
  else
  {
    double v9 = 0;
  }
  v21 = [(CKTranscriptPluginChatItem *)self imTranscriptPluginChatItem];
  v22 = [v21 dataSource];

  if ([v22 supportsDynamicSize]) {
    int v23 = 0;
  }
  else {
    int v23 = [v22 parentChatHasAllUnknownRecipients] ^ 1;
  }
  CGFloat v24 = +[CKChatItemSizeCache sharedInstance];
  double v25 = (double *)MEMORY[0x1E4F1DB30];
  long long v52 = *MEMORY[0x1E4F1DB30];
  long long v59 = *MEMORY[0x1E4F1DB30];
  if ((v23 & objc_msgSend(v24, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v59, 0, width, height)) == 1)
  {
    if (v13) {
      int v26 = v10;
    }
    else {
      int v26 = 0;
    }
    if (v26 == 1)
    {
      [MEMORY[0x1E4F6BC28] removeGUIDInAttemptingListInScrutinyMode:v13];
      if (IMOSLoggingEnabled())
      {
        v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v13;
          _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Plugin: Marked %@ as safe", buf, 0xCu);
        }
      }
    }
    double v29 = *((double *)&v59 + 1);
    double v28 = *(double *)&v59;
  }
  else
  {
    [(CKChatItem *)self maxWidth];
    uint64_t v31 = v30;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3010000000;
    v63 = "";
    long long v64 = v52;
    if (v22)
    {
      v32 = objc_opt_class();
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke;
      v55[3] = &unk_1E562CDA0;
      v55[4] = self;
      uint64_t v58 = v31;
      id v56 = v22;
      v57 = buf;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke_2;
      v53[3] = &unk_1E562CDC8;
      id v54 = v56;
      CKEnforceAveragePerformanceOfBlock(20, v32, v55, v53, 2.0);
    }
    double v33 = [(CKMessagePartChatItem *)self suggestedActionsList];
    if (v33)
    {
      BOOL v34 = *(double *)(*(void *)&buf[8] + 40) == v25[1] && *(double *)(*(void *)&buf[8] + 32) == *v25;

      if (!v34)
      {
        double v35 = [(CKTranscriptPluginChatItem *)self cachedChatBotActionButton];
        BOOL v36 = v35 == 0;

        if (v36)
        {
          double v37 = [CKChatBotActionButton alloc];
          double v38 = [(CKMessagePartChatItem *)self suggestedActionsList];
          v39 = [(CKChatBotActionButton *)v37 initWithActions:v38 delegate:self backgroundStyle:1 showTitle:1];
          [(CKTranscriptPluginChatItem *)self setCachedChatBotActionButton:v39];
        }
        long long v40 = [(CKTranscriptPluginChatItem *)self cachedChatBotActionButton];
        objc_msgSend(v40, "setBounds:", 0.0, 0.0, width, height);

        char v41 = +[CKUIBehavior sharedBehaviors];
        long long v42 = [(CKTranscriptPluginChatItem *)self cachedChatBotActionButton];
        [v41 suggestedActionsMenuAdditionalHeightWithChatBotActionButton:v42];
        double v44 = v43;

        uint64_t v45 = *(void *)&buf[8];
        double v46 = v44 + *(double *)(*(void *)&buf[8] + 40);
        *(double *)(*(void *)&buf[8] + 32) = *(double *)(*(void *)&buf[8] + 32) + 0.0;
        *(double *)(v45 + 40) = v46;
      }
    }
    if (v23 && (*(double *)(*(void *)&buf[8] + 32) != *v25 || *(double *)(*(void *)&buf[8] + 40) != v25[1])) {
      objc_msgSend(v24, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self);
    }
    if (v13) {
      int v47 = v10;
    }
    else {
      int v47 = 0;
    }
    if (v47 == 1)
    {
      [MEMORY[0x1E4F6BC28] removeGUIDInAttemptingListInScrutinyMode:v13];
      if (IMOSLoggingEnabled())
      {
        v48 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v60 = 138412290;
          v61 = v13;
          _os_log_impl(&dword_18EF18000, v48, OS_LOG_TYPE_INFO, "Plugin: Marked %@ as safe", v60, 0xCu);
        }
      }
    }
    double v28 = *(double *)(*(void *)&buf[8] + 32);
    double v29 = *(double *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }

  double v49 = v28;
  double v50 = v29;
  result.double height = v50;
  result.double width = v49;
  return result;
}

uint64_t __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke(uint64_t a1)
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 extensionBalloonMaximumHeight];
  double v4 = v3;

  double v5 = *(void **)(a1 + 32);
  double v6 = [*(id *)(a1 + 40) bundleID];
  LODWORD(v5) = [v5 shouldAllowExtraTallHeightForBundleID:v6];

  if (v5)
  {
    long long v7 = +[CKUIBehavior sharedBehaviors];
    [v7 extraTallExtensionBalloonMaximumHeight];
    double v4 = v8;
  }
  double v9 = *(double *)(a1 + 56);
  [*(id *)(a1 + 32) pluginInsets];
  objc_msgSend(*(id *)(a1 + 40), "sizeThatFits:", v9 - (v10 + v11), v4 - (v12 + v13));
  double v15 = v14;
  double v17 = v16;
  uint64_t result = [*(id *)(a1 + 32) pluginInsets];
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  *(double *)(v23 + 32) = v15 + v19 + v20;
  *(double *)(v23 + 40) = v17 + v21 + v22;
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  double v25 = *(double *)(v24 + 32);
  if (v25 >= *(double *)(a1 + 56)) {
    double v25 = *(double *)(a1 + 56);
  }
  *(double *)(v24 + 32) = v25;
  return result;
}

void __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke_2(float a1)
{
  uint64_t v2 = objc_opt_class();
  NSLog(&cfstr_DataSourceTook.isa, v2, a1, 20);
}

- (BOOL)shouldAllowExtraTallHeightForBundleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F6CAE8];
  id v3 = a3;
  double v4 = IMBalloonExtensionIDWithSuffix();
  double v11 = v4;
  double v5 = IMBalloonExtensionIDWithSuffix();
  double v12 = v5;
  double v6 = IMBalloonExtensionIDWithSuffix();
  double v13 = v6;
  long long v7 = IMBalloonExtensionIDWithSuffix();
  double v14 = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:5];

  LOBYTE(v4) = objc_msgSend(v8, "containsObject:", v3, v10, v11, v12, v13);
  return (char)v4;
}

- (id)loadTranscriptDrawerText
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 timestampDateFormatter];

  double v5 = [(CKMessagePartChatItem *)self time];
  double v6 = [v4 stringFromDate:v5];

  long long v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 drawerTranscriptTextAttributes];

  if (v6)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v8];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(CKMessagePartChatItem *)self time];
        double v12 = [(CKChatItem *)self IMChatItem];
        double v13 = [v12 guid];
        int v15 = 138412546;
        id v16 = v11;
        __int16 v17 = 2112;
        CGFloat v18 = v13;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "loadTranscriptDrawerText: nil timestamp for time: %@, IMChatItem guid: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    double v9 = 0;
  }

  return v9;
}

- (UIEdgeInsets)contentInsets
{
  if ([(CKTranscriptPluginChatItem *)self isHandwriting])
  {
    double v3 = *MEMORY[0x1E4F437F8];
    double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKTranscriptPluginChatItem;
    [(CKBalloonChatItem *)&v7 contentInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)dragItemProvider
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKChatItem *)self IMChatItem];
  double v4 = [v3 dataSource];

  if (v4)
  {
    double v5 = [v4 pluginPayload];
    double v6 = v5;
    if (v5)
    {
      objc_super v7 = [v5 pluginBundleID];
      int v8 = [v7 isEqualToString:*MEMORY[0x1E4F6CC10]];

      double v9 = [v6 pluginBundleID];
      LODWORD(v7) = [v9 isEqualToString:*MEMORY[0x1E4F6CBA0]];

      uint64_t v10 = [v6 pluginBundleID];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6CBD8]];

      if (((v8 | v7) & 1) != 0 || v11)
      {
        double v12 = [(CKChatItem *)self transcriptIdentifier];
        double v13 = [(CKTranscriptPluginChatItem *)self pluginDisplayContainerForContext:v12];

        if (!v13 && IMOSLoggingEnabled())
        {
          double v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = [(CKChatItem *)self transcriptIdentifier];
            int v21 = 138412546;
            double v22 = (const char *)v4;
            __int16 v23 = 2112;
            uint64_t v24 = v15;
            _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Got nil displayContainer for datasource %@ identifier %@", (uint8_t *)&v21, 0x16u);
          }
        }
        id v16 = [v13 pasteboardItemProvider];
        if (IMOSLoggingEnabled())
        {
          __int16 v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v21 = 136315650;
            double v22 = "-[CKTranscriptPluginChatItem dragItemProvider]";
            __int16 v23 = 2112;
            uint64_t v24 = v16;
            __int16 v25 = 2112;
            int v26 = v4;
            _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "%s generated itemProvider %@ for %@", (uint8_t *)&v21, 0x20u);
          }
        }
        if (v16) {
          goto LABEL_29;
        }
      }
      if (IMOSLoggingEnabled())
      {
        CGFloat v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412290;
          double v22 = (const char *)v4;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Got nil item provider from %@", (uint8_t *)&v21, 0xCu);
        }
LABEL_27:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      CGFloat v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Plugin chat item datasource payload is nil", (uint8_t *)&v21, 2u);
      }
      goto LABEL_27;
    }
    id v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Plugin Chat item data source is nil!", (uint8_t *)&v21, 2u);
    }
  }
  id v16 = 0;
LABEL_30:

  return v16;
}

- (BOOL)wantsBalloonGradient
{
  return 0;
}

- (BOOL)isPlayed
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isPlayed];

  return v3;
}

- (BOOL)isSaved
{
  uint64_t v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isSaved];

  return v3;
}

- (void)relinquishBalloonControllerForContext:(id)a3
{
  id v12 = a3;
  double v4 = [MEMORY[0x1E4F6BC18] sharedInstance];
  double v5 = [(CKChatItem *)self IMChatItem];
  double v6 = [v5 type];
  objc_super v7 = [v4 balloonPluginForBundleID:v6];

  int v8 = [(CKChatItem *)self IMChatItem];
  double v9 = [v8 dataSource];
  uint64_t v10 = [v9 messageGUID];
  int v11 = [v7 existingBalloonControllerWithMessageGUID:v10 contextIdentifier:v12];

  if (v11)
  {
    if ([v7 supportsControllerReuse])
    {
      [v4 pluginChatItem:v5 didRelinquishReusableController:v11 contextIdentifier:v12];
    }
    else if (CKIsRunningInMessagesTranscriptExtension())
    {
      [v4 pluginChatItem:v5 didRelenquishNonResuableController:v11 contextIdentifier:v12];
    }
  }
}

- (void)releaseBalloonControllerIfNeededForContext:(id)a3
{
  id v12 = a3;
  double v4 = [MEMORY[0x1E4F6BC18] sharedInstance];
  double v5 = [(CKChatItem *)self IMChatItem];
  double v6 = [v5 type];
  objc_super v7 = [v4 balloonPluginForBundleID:v6];

  int v8 = [(CKChatItem *)self IMChatItem];
  double v9 = [v8 dataSource];
  uint64_t v10 = [v9 messageGUID];
  int v11 = [v7 existingBalloonControllerWithMessageGUID:v10 contextIdentifier:v12];

  if (v11 && ([v7 supportsControllerReuse] & 1) == 0) {
    [v4 pluginChatItem:v5 didRelenquishNonResuableController:v11 contextIdentifier:v12];
  }
}

- (void)performHostAppResumeWithContext:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F6BC18];
  id v5 = a3;
  id v13 = [v4 sharedInstance];
  double v6 = [(CKChatItem *)self IMChatItem];
  objc_super v7 = [v6 type];
  int v8 = [v13 balloonPluginForBundleID:v7];

  double v9 = [(CKChatItem *)self IMChatItem];
  uint64_t v10 = [v9 dataSource];
  int v11 = [v10 messageGUID];
  id v12 = [v8 existingBalloonControllerWithMessageGUID:v11 contextIdentifier:v5];

  if (objc_opt_respondsToSelector()) {
    [v12 performHostAppResume];
  }
}

- (BOOL)wantsTranscriptGroupMonograms
{
  return self->_wantsTranscriptGroupMonograms;
}

- (BOOL)wantsOutline
{
  return self->_wantsOutline;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (IMTranscriptPluginChatItem)imTranscriptPluginChatItem
{
  return self->_imTranscriptPluginChatItem;
}

- (void)setImTranscriptPluginChatItem:(id)a3
{
}

- (BOOL)isHandwriting
{
  return self->_isHandwriting;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (CKChatBotActionButton)cachedChatBotActionButton
{
  return self->_cachedChatBotActionButton;
}

- (void)setCachedChatBotActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedChatBotActionButton, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);

  objc_storeStrong((id *)&self->_imTranscriptPluginChatItem, 0);
}

@end