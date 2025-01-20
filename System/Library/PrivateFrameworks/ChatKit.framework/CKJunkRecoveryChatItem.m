@interface CKJunkRecoveryChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (NSDate)earliestMessageDate;
- (id)loadTranscriptText;
- (void)setEarliestMessageDate:(id)a3;
@end

@implementation CKJunkRecoveryChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptBoldTextAlignmentInsets];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  +[CKJunkRecoveryTranscriptCell heightForChatItem:fittingSize:](CKJunkRecoveryTranscriptCell, "heightForChatItem:fittingSize:", self, width, height);
  double v18 = v17;
  double v19 = width;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (id)loadTranscriptText
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"JUNK_CONVERSATION_WILL_BE_DELETED_IN_DAYS" value:&stru_1EDE4CA38 table:@"ChatKit"];

  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 transcriptEmphasizedFontAttributes];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v3 attributes:v5];

  return v6;
}

- (NSDate)earliestMessageDate
{
  return self->_earliestMessageDate;
}

- (void)setEarliestMessageDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end