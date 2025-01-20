@interface CKSimSwitchedChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (id)loadTranscriptText;
@end

@implementation CKSimSwitchedChatItem

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [(CKChatItem *)self transcriptText];
  objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
  double v11 = v10;

  [v8 smallTranscriptSpace];
  double v13 = v12;
  [v8 transcriptBoldTextAlignmentInsets];
  if (a4)
  {
    a4->top = v14;
    a4->left = v15;
    a4->bottom = v16;
    a4->right = v17;
  }
  double v18 = v11 - v14 + v13 + v11 - v16;

  double v19 = 0.0;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptEmphasizedFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptRegularFontAttributes];

  v7 = [(CKChatItem *)self IMChatItem];
  v8 = [v7 sender];
  v9 = [v8 _stripFZIDPrefix];

  id v10 = objc_alloc(MEMORY[0x1E4F28E48]);
  double v11 = NSString;
  double v12 = CKFrameworkBundle();
  double v13 = [v12 localizedStringForKey:@"NUMBER_CHANGED" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v14 = objc_msgSend(v11, "stringWithFormat:", v13, v9);

  CGFloat v15 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v16 = [v15 userInterfaceLayoutDirection];

  if (v16 == 1) {
    CGFloat v17 = @"\u200F";
  }
  else {
    CGFloat v17 = @"\u200E";
  }
  double v18 = [(__CFString *)v17 stringByAppendingString:v14];

  double v19 = (void *)[v10 initWithString:v18 attributes:v6];
  if (v9)
  {
    double v20 = [v19 string];
    uint64_t v21 = [v20 rangeOfString:v9];
    uint64_t v23 = v22;

    if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v19, "setAttributes:range:", v4, v21, v23);
    }
  }

  return v19;
}

@end