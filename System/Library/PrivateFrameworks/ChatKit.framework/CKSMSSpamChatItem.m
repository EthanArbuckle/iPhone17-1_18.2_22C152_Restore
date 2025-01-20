@interface CKSMSSpamChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (id)getTranscriptTextForExtensionName:(id)a3;
- (id)loadTranscriptText;
@end

@implementation CKSMSSpamChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [(CKSMSSpamChatItem *)self loadTranscriptText];
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

  v5 = [(CKChatItem *)self IMChatItem];
  v6 = [v5 extensionName];

  v7 = [(CKSMSSpamChatItem *)self getTranscriptTextForExtensionName:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v4];

  return v8;
}

- (id)getTranscriptTextForExtensionName:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = NSString;
    v6 = CKFrameworkBundle();
    v7 = [v6 localizedStringForKey:@"FILTERED_BY_APP_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);

    v9 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    if (v10 == 1) {
      double v11 = @"\u200F";
    }
    else {
      double v11 = @"\u200E";
    }
    double v12 = [(__CFString *)v11 stringByAppendingString:v8];
  }
  else
  {
    double v12 = &stru_1EDE4CA38;
  }

  return v12;
}

@end