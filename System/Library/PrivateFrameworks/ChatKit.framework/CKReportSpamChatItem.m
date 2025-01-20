@interface CKReportSpamChatItem
- (BOOL)hasMultipleMessages;
- (BOOL)isBusinessChat;
- (BOOL)isGroupChat;
- (BOOL)showReportSMSSpam;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKTranscriptReportSpamCell)sizingCell;
- (Class)cellClass;
- (NSAttributedString)internalPhishingWarning;
- (NSAttributedString)transcriptButtonText;
- (id)loadTranscriptText;
- (id)transcriptTextForSpam:(BOOL)a3;
- (unint64_t)layoutType;
- (void)setSizingCell:(id)a3;
- (void)setTranscriptButtonText:(id)a3;
@end

@implementation CKReportSpamChatItem

- (unint64_t)layoutType
{
  return 22;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    v8 = objc_alloc_init(CKTranscriptReportSpamCell);
    v9 = self->_sizingCell;
    self->_sizingCell = v8;

    sizingCell = self->_sizingCell;
  }
  [(CKTranscriptReportSpamCell *)sizingCell configureForChatItem:self context:0 animated:0 animationDuration:3 animationCurve:0.0];
  v10 = self->_sizingCell;

  -[CKTranscriptReportSpamCell sizeThatFits:](v10, "sizeThatFits:", width, height);
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)loadTranscriptText
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptEmphasizedFontAttributes];

  if ([(CKReportSpamChatItem *)self isGroupChat])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    v6 = CKFrameworkBundle();
    v7 = v6;
    v8 = @"REPORT_SPAM_GROUP_STATUS";
  }
  else
  {
    BOOL v9 = [(CKReportSpamChatItem *)self isBusinessChat];
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    v6 = CKFrameworkBundle();
    v7 = v6;
    if (v9) {
      v8 = @"REPORT_SPAM_BUSINESS_STATUS";
    }
    else {
      v8 = @"REPORT_SPAM_STATUS";
    }
  }
  v10 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v11 = (void *)[v5 initWithString:v10 attributes:v4];

  return v11;
}

- (id)transcriptTextForSpam:(BOOL)a3
{
  if ([(CKReportSpamChatItem *)self isGroupChat])
  {
    id v5 = CKFrameworkBundle();
    if (!a3)
    {
      v6 = @"REPORT_SPAM_GROUP_STATUS";
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  BOOL v7 = [(CKReportSpamChatItem *)self isBusinessChat];
  id v5 = CKFrameworkBundle();
  if (v7)
  {
    if (!a3)
    {
      v6 = @"REPORT_SPAM_BUSINESS_STATUS";
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (a3)
  {
LABEL_8:
    v6 = @"REPORTED_SPAM_STATUS";
    goto LABEL_10;
  }
  v6 = @"REPORT_SPAM_STATUS";
LABEL_10:
  v8 = [v5 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v8;
}

- (NSAttributedString)transcriptButtonText
{
  transcriptButtonText = self->_transcriptButtonText;
  if (!transcriptButtonText)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    id v5 = [v4 centerTranscriptButtonTextAttributes];

    if ([(CKReportSpamChatItem *)self showReportSMSSpam])
    {
      BOOL v6 = [(CKReportSpamChatItem *)self hasMultipleMessages];
      id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
      v8 = CKFrameworkBundle();
      BOOL v9 = v8;
      if (v6) {
        v10 = @"REPORT_SPAM_SMS_BUTTON_TITLE_ALL";
      }
      else {
        v10 = @"REPORT_SPAM_SMS_BUTTON_TITLE_SINGULAR";
      }
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
      v8 = CKFrameworkBundle();
      BOOL v9 = v8;
      v10 = @"REPORT_SPAM_BUTTON_TITLE";
    }
    double v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v12 = (NSAttributedString *)[v7 initWithString:v11 attributes:v5];
    v13 = self->_transcriptButtonText;
    self->_transcriptButtonText = v12;

    transcriptButtonText = self->_transcriptButtonText;
  }

  return transcriptButtonText;
}

- (NSAttributedString)internalPhishingWarning
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 phishingWarningTextAttributes];

  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v5 = (void *)[v4 initWithString:*MEMORY[0x1E4F6E4B0] attributes:v3];

  return (NSAttributedString *)v5;
}

- (BOOL)isGroupChat
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isGroupMessage];

  return v3;
}

- (BOOL)hasMultipleMessages
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 hasMultipleMessages];

  return v3;
}

- (BOOL)showReportSMSSpam
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 showReportSMSSpam];

  return v3;
}

- (BOOL)isBusinessChat
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isBusinessChat];

  return v3;
}

- (void)setTranscriptButtonText:(id)a3
{
}

- (CKTranscriptReportSpamCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingCell, 0);

  objc_storeStrong((id *)&self->_transcriptButtonText, 0);
}

@end