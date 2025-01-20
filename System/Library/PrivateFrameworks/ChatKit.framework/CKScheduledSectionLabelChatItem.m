@interface CKScheduledSectionLabelChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKScheduledSectionLabelChatItem

- (unint64_t)layoutType
{
  return 26;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(CKScheduledSectionLabelChatItem *)self loadTranscriptText];
  objc_msgSend(v6, "boundingRectWithSize:options:context:", 1, 0, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)loadTranscriptText
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 transcriptEmphasizedFontAttributes];

  v4 = CKFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"SEND_LATER_TRANSCRIPT" value:&stru_1EDE4CA38 table:@"ChatKit"];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v3];

  return v6;
}

@end