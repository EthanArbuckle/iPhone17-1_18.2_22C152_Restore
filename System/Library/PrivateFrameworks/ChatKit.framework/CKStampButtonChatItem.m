@interface CKStampButtonChatItem
- (BOOL)displayDuringSend;
- (BOOL)hasSelectableText;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKStampButtonChatItem)init;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (unint64_t)layoutType;
@end

@implementation CKStampButtonChatItem

- (CKStampButtonChatItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKStampButtonChatItem;
  result = [(CKStampButtonChatItem *)&v3 init];
  if (result) {
    result->_hasSelectableText = 1;
  }
  return result;
}

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 stampTranscriptInsets];
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
  return 1;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptBoldTextAlignmentInsets];
    a4->top = v9;
    a4->left = v10;
    a4->bottom = v11;
    a4->right = v12;
  }
  double v13 = +[CKChatItemSizeCache sharedInstance];
  long long v30 = *MEMORY[0x1E4F1DB30];
  if (objc_msgSend(v13, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v30, 0, width, height))
  {
    double v15 = *((double *)&v30 + 1);
    double v14 = *(double *)&v30;
  }
  else
  {
    [(CKStampButtonChatItem *)self contentInsets];
    double v18 = width - (v16 + v17);
    double v21 = height - (v19 + v20);
    v22 = [(CKChatItem *)self transcriptText];
    objc_msgSend(v22, "boundingRectWithSize:options:context:", 1, 0, v18, v21);
    double v24 = v23;
    double v26 = v25;
    if (CKMainScreenScale_once_65 != -1) {
      dispatch_once(&CKMainScreenScale_once_65, &__block_literal_global_169);
    }
    double v27 = *(double *)&CKMainScreenScale_sMainScreenScale_65;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_65 == 0.0) {
      double v27 = 1.0;
    }
    double v14 = ceil(v24 * v27) / v27;
    double v15 = ceil(v26 * v27) / v27;
    objc_msgSend(v13, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v14, v15, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), width, height);
  }
  double v28 = v14;
  double v29 = v15;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (BOOL)hasSelectableText
{
  return self->_hasSelectableText;
}

- (unint64_t)layoutType
{
  return 3;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  int64_t v14 = a4 - 1;
  if (a4 >= 1
    && ([v12 objectAtIndex:v14], double v15 = objc_claimAutoreleasedReturnValue(), (v16 = v15) != 0))
  {
    unint64_t v17 = [v15 layoutType];
    if (v17 <= 0x18)
    {
      if (((1 << v17) & 0x1864DBE) != 0)
      {
        double v18 = +[CKUIBehavior sharedBehaviors];
        goto LABEL_6;
      }
      if (v17 == 9)
      {
        double v18 = +[CKUIBehavior sharedBehaviors];
        objc_msgSend(v18, "balloonBalloonTranscriptSpace:", objc_msgSend(v16, "contiguousType"));
        goto LABEL_7;
      }
      if (v17 == 12)
      {
        BOOL v25 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:a4 allDatasourceItems:v12];
        double v26 = +[CKUIBehavior sharedBehaviors];
        double v18 = v26;
        if (v25)
        {
          [v26 extraLargeTranscriptSpace];
          goto LABEL_7;
        }
LABEL_6:
        [v18 mediumTranscriptSpace];
LABEL_7:
        double v20 = v19;

        goto LABEL_9;
      }
    }
    if (IMOSLoggingEnabled())
    {
      double v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = (id)objc_opt_class();
        *(_DWORD *)v32 = 138412546;
        *(void *)&v32[4] = v28;
        *(_WORD *)&v32[12] = 2112;
        *(void *)&v32[14] = objc_opt_class();
        id v29 = *(id *)&v32[14];
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v32, 0x16u);
      }
    }
    long long v30 = +[CKUIBehavior sharedBehaviors];
    [v30 smallTranscriptSpace];
    double v20 = v31;
  }
  else
  {
    double v21 = +[CKUIBehavior sharedBehaviors];
    [v21 topTranscriptSpace];
    double v20 = v22;

    double v16 = 0;
  }
LABEL_9:
  double v23 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v16 topSpacing:v20 bottomSpacing:0.0];

  return v23;
}

@end