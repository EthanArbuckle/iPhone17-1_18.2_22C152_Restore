@interface CKMomentShareStatusChatItem
- (BOOL)wantsDrawerLayout;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKMomentShareStatusChatItem

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 senderTranscriptInsets];
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
  v2 = [(CKMomentShareStatusChatItem *)self _statusChatItem];
  int v3 = [v2 isFromMe];

  if (v3) {
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

- (BOOL)wantsDrawerLayout
{
  v5.receiver = self;
  v5.super_class = (Class)CKMomentShareStatusChatItem;
  if ([(CKChatItem *)&v5 wantsDrawerLayout])
  {
    v2 = +[CKUIBehavior sharedBehaviors];
    int v3 = [v2 timestampsPushBalloons] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)loadTranscriptText
{
  v57[3] = *MEMORY[0x1E4F143B8];
  int v3 = CKFrameworkBundle();
  double v4 = [v3 localizedStringForKey:@"ATTRIBUTION_TEXT_PHOTOS_EXTENSION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  v52 = [(CKMomentShareStatusChatItem *)self _statusChatItem];
  objc_super v5 = [v52 activityTitle];
  unint64_t v6 = 0x1E4F42000uLL;
  v51 = v4;
  if (v5) {
    goto LABEL_11;
  }
  id v7 = [v52 expirationDate];
  double v8 = v7;
  if (_TitleForExpirationDate_predicate != -1)
  {
    dispatch_once(&_TitleForExpirationDate_predicate, &__block_literal_global_187);
    if (v8) {
      goto LABEL_4;
    }
LABEL_9:
    objc_super v5 = 0;
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_9;
  }
LABEL_4:
  double v9 = [(id)_TitleForExpirationDate_dateFormatter stringFromDate:v8];
  double v10 = NSString;
  double v11 = CKFrameworkBundle();
  [v11 localizedStringForKey:@"MOMENT_SHARE_EXPIRATION_DATE_PREFIX_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v13 = double v12 = v4;
  double v14 = objc_msgSend(v10, "stringWithFormat:", v13, v9);

  double v4 = v12;
  v15 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v16 = [v15 userInterfaceLayoutDirection];

  if (v16 == 1) {
    v17 = @"\u200F";
  }
  else {
    v17 = @"\u200E";
  }
  objc_super v5 = [(__CFString *)v17 stringByAppendingString:v14];

  unint64_t v6 = 0x1E4F42000;
LABEL_10:

  if (!v5)
  {
    id v53 = v4;
    goto LABEL_15;
  }
LABEL_11:
  v18 = NSString;
  v19 = CKFrameworkBundle();
  v20 = [v19 localizedStringForKey:@"MOMENT_SHARE_STATUS_TITLE_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v21 = objc_msgSend(v18, "stringWithFormat:", v20, v4, v5);

  v22 = [*(id *)(v6 + 1848) sharedApplication];
  uint64_t v23 = [v22 userInterfaceLayoutDirection];

  if (v23 == 1) {
    v24 = @"\u200F";
  }
  else {
    v24 = @"\u200E";
  }
  id v53 = [(__CFString *)v24 stringByAppendingString:v21];

LABEL_15:
  v25 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v26 = (void *)[v25 mutableCopy];

  objc_msgSend(v26, "setAlignment:", 2 * (-[CKMomentShareStatusChatItem transcriptOrientation](self, "transcriptOrientation") != 0));
  [v26 setLineBreakMode:2];
  uint64_t v27 = *MEMORY[0x1E4FB06F8];
  v56[0] = *MEMORY[0x1E4FB06F8];
  v28 = +[CKUIBehavior sharedBehaviors];
  v29 = [v28 transcriptRegularFont];
  v57[0] = v29;
  uint64_t v30 = *MEMORY[0x1E4FB0700];
  v56[1] = *MEMORY[0x1E4FB0700];
  v31 = +[CKUIBehavior sharedBehaviors];
  v32 = [v31 theme];
  v33 = [v32 transcriptTextColor];
  uint64_t v34 = *MEMORY[0x1E4FB0738];
  v56[2] = *MEMORY[0x1E4FB0738];
  v57[1] = v33;
  v57[2] = v26;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];

  v36 = v53;
  v50 = (void *)v35;
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v53 attributes:v35];
  v38 = [v37 string];
  v39 = v51;
  uint64_t v40 = [v38 rangeOfString:v51];
  uint64_t v49 = v41;

  if (v40 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v54[0] = v27;
    v42 = +[CKUIBehavior sharedBehaviors];
    v43 = [v42 transcriptMessageStatusFont];
    v55[0] = v43;
    v54[1] = v30;
    v44 = +[CKUIBehavior sharedBehaviors];
    v45 = [v44 theme];
    v46 = [v45 transcriptTextColor];
    v54[2] = v34;
    v55[1] = v46;
    v55[2] = v26;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];

    v36 = v53;
    objc_msgSend(v37, "setAttributes:range:", v47, v40, v49);

    v39 = v51;
  }

  return v37;
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
  double v13 = [(CKChatItem *)self transcriptText];
  double v14 = [(CKChatItem *)self transcriptTraitCollection];
  [v14 displayScale];
  +[CKTranscriptMomentShareLabelCell sizeThatFits:attributedText:displayScale:](CKTranscriptMomentShareLabelCell, "sizeThatFits:attributedText:displayScale:", v13, width, height, v15);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (unint64_t)layoutType
{
  return 5;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    double v14 = 0;
  }
  else
  {
    double v14 = [v12 objectAtIndex:a4 - 1];
  }
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 smallTranscriptSpace];
  double v17 = v16;

  unint64_t v18 = [v14 layoutType];
  if (v18 <= 0x12 && ((1 << v18) & 0x60002) != 0)
  {
    if ([v14 hasTail])
    {
      double v19 = +[CKUIBehavior sharedBehaviors];
      [v19 balloonMaskTailSizeForTailShape:1];
      double v17 = v17 + v20;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    double v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (id)objc_opt_class();
      *(_DWORD *)v26 = 138543618;
      *(void *)&v26[4] = v22;
      *(_WORD *)&v26[12] = 2114;
      *(void *)&v26[14] = objc_opt_class();
      id v23 = *(id *)&v26[14];
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %{public}@ shouldn't follow %{public}@", v26, 0x16u);
    }
  }
  v24 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v17, 0.0, *(_OWORD *)v26, *(void *)&v26[16], v27);

  return v24;
}

@end