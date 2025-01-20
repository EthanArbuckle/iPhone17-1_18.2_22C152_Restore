@interface CKRichActionFooterChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)transcriptText;
@end

@implementation CKRichActionFooterChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (char)transcriptOrientation
{
  v2 = [(CKChatItem *)self IMChatItem];
  int v3 = [v2 isFromMe];

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (UIEdgeInsets)contentInsets
{
  double v2 = -12.0;
  double v3 = 0.0;
  double v4 = 12.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)transcriptText
{
  int v3 = [(CKRichActionFooterChatItem *)self transcriptOrientation];
  double v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = v4;
  if (v3) {
    [v4 rightStatusTranscriptTextAttributes];
  }
  else {
  v6 = [v4 leftStatusTranscriptTextAttributes];
  }

  v7 = [(CKChatItem *)self IMChatItem];
  v8 = [v7 handle];
  v9 = [v8 brand];
  v10 = [v9 name];
  v11 = [(CKChatItem *)self IMChatItem];
  v12 = [v11 handle];
  v13 = v12;
  if (v10)
  {
    v14 = [v12 brand];
    v15 = [v14 name];
  }
  else
  {
    v15 = [v12 displayID];
  }

  id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
  v17 = NSString;
  v18 = CKFrameworkBundle();
  v19 = [v18 localizedStringForKey:@"SELECTED_ACTIONS_FOOTER_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v20 = objc_msgSend(v17, "stringWithFormat:", v19, v15);

  v21 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v22 = [v21 userInterfaceLayoutDirection];

  if (v22 == 1) {
    v23 = @"\u200F";
  }
  else {
    v23 = @"\u200E";
  }
  v24 = [(__CFString *)v23 stringByAppendingString:v20];

  v25 = (void *)[v16 initWithString:v24 attributes:v6];

  return v25;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = v8;
  if (a4)
  {
    [v8 transcriptBoldTextAlignmentInsets];
    a4->top = v10;
    a4->left = v11;
    a4->bottom = v12;
    a4->right = v13;
  }
  v14 = [(objc_class *)[(CKRichActionFooterChatItem *)self cellClass] createStampLabelView];
  v15 = [(CKRichActionFooterChatItem *)self transcriptText];
  [v14 setAttributedText:v15];

  objc_msgSend(v14, "sizeThatFits:", width, height);
  double v17 = v16;

  double v18 = 0.0;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

@end