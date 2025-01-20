@interface CKBlockContactChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (NSAttributedString)transcriptButtonText;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
- (void)setTranscriptButtonText:(id)a3;
@end

@implementation CKBlockContactChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width = a3.width;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 smallTranscriptSpace];
  double v31 = v8;
  [v7 transcriptBoldTextAlignmentInsets];
  double v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  double v17 = width - (v11 + v15);
  v18 = [(CKBlockContactChatItem *)self loadTranscriptText];
  objc_msgSend(v18, "boundingRectWithSize:options:context:", 1, 0, v17, 1.79769313e308);
  double v20 = v19;

  v21 = +[CKTranscriptBlockContactCell blockContactButton];
  v22 = [(CKBlockContactChatItem *)self transcriptButtonText];
  [v21 setAttributedTitle:v22 forState:0];

  v23 = [v21 titleLabel];
  objc_msgSend(v23, "sizeThatFits:", v17, 1.79769313e308);
  double v25 = v24;

  [v7 transcriptButtonContentEdgeInsets];
  if (a4)
  {
    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  double v28 = fmax(v31 - (v14 + v10), 0.0) + v20 + v25 + v26 + v27;

  double v29 = width;
  double v30 = v28;
  result.height = v30;
  result.double width = v29;
  return result;
}

- (id)loadTranscriptText
{
  v2 = IMSharedUtilitiesFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"GET_HELP_STATUS" value:&stru_1EDE4CA38 table:@"CommSafetyLocalizable"];

  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 transcriptEmphasizedFontAttributes];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3 attributes:v5];

  return v6;
}

- (NSAttributedString)transcriptButtonText
{
  v3 = IMSharedUtilitiesFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"GET_HELP_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"CommSafetyLocalizable"];

  transcriptButtonText = self->_transcriptButtonText;
  if (!transcriptButtonText)
  {
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 centerTranscriptButtonTextAttributes];

    double v8 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v7];
    double v9 = self->_transcriptButtonText;
    self->_transcriptButtonText = v8;

    transcriptButtonText = self->_transcriptButtonText;
  }
  double v10 = transcriptButtonText;

  return v10;
}

- (void)setTranscriptButtonText:(id)a3
{
}

- (void).cxx_destruct
{
}

- (unint64_t)layoutType
{
  return 21;
}

@end