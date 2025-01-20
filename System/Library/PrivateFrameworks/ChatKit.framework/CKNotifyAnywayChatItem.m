@interface CKNotifyAnywayChatItem
- (BOOL)displayDuringSend;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKNotifyAnywayChatItem

- (unint64_t)layoutType
{
  return 11;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = [v12 objectAtIndex:a4 - 1];
  }
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 smallTranscriptSpace];
  double v17 = v16;

  if (v14)
  {
    if ([v14 layoutType] == 10) {
      goto LABEL_10;
    }
    v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CKNotifyAnywayChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:]((uint64_t)v14, v18);
    }
  }
  else
  {
    v18 = +[CKUIBehavior sharedBehaviors];
    [v18 topTranscriptSpace];
    double v17 = v19;
  }

LABEL_10:
  v20 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v17 bottomSpacing:0.0];

  return v20;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"NOTIFY_ANYWAY_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v3 attributes:0];
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptNotifyAnywayFontAttributes];

  objc_msgSend(v4, "addAttributes:range:", v6, 0, objc_msgSend(v4, "length"));

  return v4;
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

- (BOOL)displayDuringSend
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = v8;
  if (a4)
  {
    [v8 transcriptBoldTextAlignmentInsets];
    a4->top = v10;
    a4->left = v11;
    a4->bottom = v12;
    a4->right = v13;
  }
  double v14 = +[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton];
  v15 = [(CKChatItem *)self transcriptText];
  [v14 setAttributedTitle:v15 forState:0];
  objc_msgSend(v14, "sizeThatFits:", width, height);
  double v17 = v16;

  double v18 = 0.0;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

@end