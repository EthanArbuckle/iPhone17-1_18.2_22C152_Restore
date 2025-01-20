@interface CKBlackholeChatItem
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (char)transcriptOrientation;
- (id)loadTranscriptText;
@end

@implementation CKBlackholeChatItem

- (char)transcriptOrientation
{
  return 1;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E48]);
  v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"HAWKING_WARNING_NON_CELLULAR" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v5 = (void *)[v2 initWithString:v4 attributes:0];

  objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, 0, @" ");
  id v6 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 hawkingWarningIcon];

  [v6 setImage:v8];
  [v6 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 transcriptBoldFont];
  [v10 pointSize];
  double v12 = v11;

  [v8 size];
  double v14 = v13;
  [v8 size];
  double v16 = v12 * (v14 / v15);
  v17 = +[CKUIBehavior sharedBehaviors];
  v18 = [v17 transcriptBoldFont];
  [v18 capHeight];
  double v20 = (v19 - v12) * 0.5;

  objc_msgSend(v6, "setBounds:", 0.0, v20, v16, v12);
  v21 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v6];
  [v5 insertAttributedString:v21 atIndex:0];

  v22 = +[CKUIBehavior sharedBehaviors];
  v23 = [v22 transcriptEmphasizedFontAttributes];

  objc_msgSend(v5, "addAttributes:range:", v23, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptBoldTextAlignmentInsets];
    a4->top = v9;
    a4->left = v10;
    a4->bottom = v11;
    a4->right = v12;
  }
  double v13 = objc_opt_class();
  double v14 = [(CKChatItem *)self transcriptText];
  objc_msgSend(v13, "sizeThatFits:text:", v14, width, height);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  objc_msgSend(a4, "boundingRectWithSize:options:context:", 1, 0, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if (CKMainScreenScale_once_67 != -1) {
    dispatch_once(&CKMainScreenScale_once_67, &__block_literal_global_171);
  }
  double v8 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_67 != 0.0) {
    double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_67;
  }
  double v9 = ceil(v5 * v8) / v8;
  double v10 = ceil(v7 * v8) / v8 + 16.0;
  result.double height = v10;
  result.double width = v9;
  return result;
}

@end