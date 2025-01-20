@interface CKTranscriptPluginBreadcrumbChatItem
- (BOOL)_wantsCenteredOrientation;
- (BOOL)_wantsIconImage;
- (BOOL)canBeSelectedInEditMode;
- (CGSize)iconSizePlusHorizontalPadding;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKTranscriptPluginChatItem)previousPluginChatItem;
- (Class)cellClass;
- (UIImage)iconImage;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)_breadcrumbOptionFlags;
- (unint64_t)layoutType;
- (void)setPreviousPluginChatItem:(id)a3;
@end

@implementation CKTranscriptPluginBreadcrumbChatItem

- (char)transcriptOrientation
{
  if ([(CKTranscriptPluginBreadcrumbChatItem *)self _wantsCenteredOrientation]) {
    return 1;
  }
  v4 = [(CKChatItem *)self IMChatItem];
  if ([v4 isFromMe]) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)loadTranscriptText
{
  char v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 breadcrumbTranscriptTextAttributes];

  v5 = [(CKChatItem *)self IMChatItem];
  v6 = [v5 statusText];
  if (v6
    || ([v5 dataSource],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 statusString],
        v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  [(CKTranscriptPluginBreadcrumbChatItem *)self iconSizePlusHorizontalPadding];
  double v9 = v8;
  v25.receiver = self;
  v25.super_class = (Class)CKTranscriptPluginBreadcrumbChatItem;
  -[CKMultilineStampLabelChatItem loadSizeThatFits:textAlignmentInsets:](&v25, sel_loadSizeThatFits_textAlignmentInsets_, a4, width - v8, height);
  double v11 = v10;
  double v13 = v12;
  v14 = [MEMORY[0x1E4F42D90] mainScreen];
  [v14 scale];
  UIRoundToScale();
  double v16 = v15;

  if (a4)
  {
    if (v16 < 0.0) {
      double v16 = 0.0;
    }
    uint64_t v17 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    double v18 = a4->bottom - v16;
    if (v17) {
      double v19 = 0.0;
    }
    else {
      double v19 = v9;
    }
    double v20 = v19 + a4->left;
    if (v17) {
      double v21 = v9;
    }
    else {
      double v21 = 0.0;
    }
    CGFloat v22 = a4->right + v21;
    a4->top = a4->top - v16;
    a4->left = v20;
    a4->bottom = v18;
    a4->right = v22;
  }
  double v23 = v9 + v11;
  double v24 = v13;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (BOOL)canBeSelectedInEditMode
{
  return IMGetDomainBoolForKey();
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (UIImage)iconImage
{
  if ([(CKTranscriptPluginBreadcrumbChatItem *)self _wantsIconImage])
  {
    iconImage = self->_iconImage;
    if (!iconImage)
    {
      v4 = [(CKChatItem *)self IMChatItem];
      v5 = [v4 dataSource];

      v6 = [MEMORY[0x1E4F6BC18] sharedInstance];
      v7 = [v5 bundleID];
      double v8 = [v6 balloonPluginForBundleID:v7];

      objc_msgSend(v8, "__ck_breadcrumbImage");
      double v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      double v10 = self->_iconImage;
      self->_iconImage = v9;

      if (!self->_iconImage)
      {
        double v11 = [v5 pluginPayload];
        double v12 = [v11 payloadDictionary];

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke;
        v17[3] = &unk_1E5625990;
        v17[4] = self;
        objc_msgSend(MEMORY[0x1E4F6BC08], "__ck_appIconFromPayloadDictionary:withCompletionBlock:", v12, v17);
        double v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v14 = self->_iconImage;
        self->_iconImage = v13;
      }
      iconImage = self->_iconImage;
    }
    double v15 = iconImage;
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

void __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke_2;
    v5[3] = &unk_1E5620AF8;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke_2(uint64_t a1)
{
}

- (CGSize)iconSizePlusHorizontalPadding
{
  if ([(CKTranscriptPluginBreadcrumbChatItem *)self _wantsIconImage])
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 transcriptCustomStatusImageDefaultSize];
    double v5 = v4;
    double v7 = v6;

    double v8 = [(CKTranscriptPluginBreadcrumbChatItem *)self iconImage];
    double v9 = v8;
    if (v8)
    {
      [v8 size];
      double v5 = v10;
      double v7 = v11;
    }
    double v12 = +[CKUIBehavior sharedBehaviors];
    [v12 transcriptCustomStatusImagePadding];
    double v14 = v5 + v13;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v15 = v14;
  double v16 = v7;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)_wantsCenteredOrientation
{
  return [(CKTranscriptPluginBreadcrumbChatItem *)self _breadcrumbOptionFlags] & 1;
}

- (BOOL)_wantsIconImage
{
  return ([(CKTranscriptPluginBreadcrumbChatItem *)self _breadcrumbOptionFlags] & 2) == 0;
}

- (unint64_t)_breadcrumbOptionFlags
{
  v2 = [(CKChatItem *)self IMChatItem];
  unint64_t v3 = [v2 optionFlags];

  return v3;
}

- (CKTranscriptPluginChatItem)previousPluginChatItem
{
  return self->_previousPluginChatItem;
}

- (void)setPreviousPluginChatItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPluginChatItem, 0);

  objc_storeStrong((id *)&self->_iconImage, 0);
}

- (unint64_t)layoutType
{
  if ([(CKChatItem *)self itemIsReply]) {
    return 12;
  }
  else {
    return 8;
  }
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v10 = a5;
  id v38 = a6;
  if (a4 < 1)
  {
    double v11 = 0;
  }
  else
  {
    double v11 = [v10 objectAtIndex:a4 - 1];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v13 = +[CKUIBehavior sharedBehaviors];
  [v13 smallTranscriptSpace];
  double v15 = v14;

  double v16 = +[CKUIBehavior sharedBehaviors];
  [v16 mediumTranscriptSpace];
  double v18 = v17;

  double v19 = +[CKUIBehavior sharedBehaviors];
  [v19 largeTranscriptSpace];
  double v21 = v20;

  switch([v11 layoutType])
  {
    case 1:
    case 12:
    case 13:
    case 14:
      if (isKindOfClass)
      {
        CGFloat v22 = [(CKChatItem *)self IMChatItem];
        double v23 = [v22 dataSource];
        double v24 = [v23 messageGUID];
        objc_super v25 = [v11 IMChatItem];
        v26 = [v25 dataSource];
        v27 = [v26 messageGUID];
        int v28 = [v24 isEqualToString:v27];

        if (v28)
        {
          double v21 = v15;
          if ([v11 hasTail])
          {
            v29 = +[CKUIBehavior sharedBehaviors];
            [v29 balloonMaskTailSizeForTailShape:1];
            double v21 = v15 + v30;
            goto LABEL_22;
          }
        }
      }
      break;
    case 2:
    case 3:
    case 7:
    case 10:
    case 11:
    case 23:
    case 24:
      break;
    case 4:
    case 5:
      if ([(CKTranscriptPluginBreadcrumbChatItem *)self transcriptOrientation] != 1) {
        double v21 = v15;
      }
      break;
    case 6:
      double v21 = v18;
      break;
    case 9:
      v29 = +[CKUIBehavior sharedBehaviors];
      objc_msgSend(v29, "balloonBalloonTranscriptSpace:", objc_msgSend(v11, "contiguousType"));
      goto LABEL_21;
    case 17:
      v29 = +[CKUIBehavior sharedBehaviors];
      [v29 mediumTranscriptSpace];
      goto LABEL_21;
    case 18:
      v29 = +[CKUIBehavior sharedBehaviors];
      [v29 smallTranscriptSpace];
LABEL_21:
      double v21 = v34;
LABEL_22:

      break;
    default:
      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          id v32 = (id)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v41 = v32;
          __int16 v42 = 2112;
          id v43 = (id)objc_opt_class();
          id v33 = v43;
          _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", buf, 0x16u);
        }
      }
      double v21 = v15;
      break;
  }
  v35 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v11 topSpacing:v21 bottomSpacing:0.0];

  return v35;
}

@end