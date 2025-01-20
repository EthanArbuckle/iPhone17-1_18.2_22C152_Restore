@interface CKTranscriptReportSpamCell
+ (NSAttributedString)internalPhishingWarning;
+ (id)internalPhishingWarningLabel;
- (BOOL)showReportSMSSpam;
- (CGSize)layoutSizeForWidth:(double)a3 applyLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTranscriptReportSpamCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedButtonText;
- (UIButton)reportSpamButton;
- (UILabel)internalPhishingWarningLabel;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)prepareForReuse;
- (void)setAttributedButtonText:(id)a3;
- (void)setReportSpamButton:(id)a3;
- (void)setShowReportSMSSpam:(BOOL)a3;
@end

@implementation CKTranscriptReportSpamCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptReportSpamCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:]();
    }

    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F6C158];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    v17 = [NSString stringWithFormat:@"Calling into configureForChatItem: with an unexpected type: %@", objc_opt_class()];
    v27[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v19 = [v15 errorWithDomain:v16 code:0 userInfo:v18];

    v20 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v20 forceAutoBugCaptureWithSubType:@"WrongChatItemForCKTranscriptCell" errorPayload:v19 type:@"CKTranscriptReportSpamCell" context:0];
  }
  if (!CKIsRunningInMacCatalyst())
  {
    v25.receiver = self;
    v25.super_class = (Class)CKTranscriptReportSpamCell;
    [(CKTranscriptStampCell *)&v25 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
    v21 = [v12 transcriptText];
    [(CKTranscriptLabelCell *)self setAttributedText:v21];

    if (CKIsRunningInMessagesNotificationExtension()
      || ([MEMORY[0x1E4F6BC48] sharedInstance],
          v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 isSatelliteConnectionActive],
          v22,
          v23))
    {
      v24 = [(CKTranscriptReportSpamCell *)self reportSpamButton];
      [v24 setHidden:1];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_10:
        if (objc_opt_respondsToSelector()) {
          -[CKTranscriptReportSpamCell setShowReportSMSSpam:](self, "setShowReportSMSSpam:", [v12 showReportSMSSpam]);
        }
        goto LABEL_12;
      }
      v24 = [v12 transcriptButtonText];
      [(CKTranscriptReportSpamCell *)self setAttributedButtonText:v24];
    }

    goto LABEL_10;
  }
LABEL_12:
}

- (CKTranscriptReportSpamCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptReportSpamCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (!CKIsRunningInMacCatalyst())
    {
      v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
      v5 = +[CKUIBehavior sharedBehaviors];
      v6 = [v5 transcriptLabelAccessoryButtonConfiguration];
      [v4 setConfiguration:v6];

      v7 = [(CKEditableCollectionViewCell *)v3 contentView];
      [v7 addSubview:v4];

      [(CKTranscriptReportSpamCell *)v3 setReportSpamButton:v4];
    }
    if (IMShouldHandleInternalPhishingAttempts())
    {
      uint64_t v8 = [(id)objc_opt_class() internalPhishingWarningLabel];
      internalPhishingWarningLabel = v3->_internalPhishingWarningLabel;
      v3->_internalPhishingWarningLabel = (UILabel *)v8;

      v10 = [(CKEditableCollectionViewCell *)v3 contentView];
      [v10 addSubview:v3->_internalPhishingWarningLabel];
    }
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CKTranscriptReportSpamCell layoutSizeForWidth:applyLayout:](self, "layoutSizeForWidth:applyLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviewsForAlignmentContents
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptReportSpamCell;
  [(CKTranscriptStampCell *)&v4 layoutSubviewsForAlignmentContents];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  [(CKTranscriptReportSpamCell *)self layoutSizeForWidth:1 applyLayout:v3];
}

- (CGSize)layoutSizeForWidth:(double)a3 applyLayout:(BOOL)a4
{
  v6 = +[CKUIBehavior sharedBehaviors];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v8 = v7;
  double v10 = v9;
  v11 = (double *)MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [v6 phishingWarningEdgeInsets];
  double v74 = v16;
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  double v70 = v8;
  if (internalPhishingWarningLabel)
  {
    double v18 = v14;
    double v19 = v15;
    v20 = [(UILabel *)internalPhishingWarningLabel attributedText];
    objc_msgSend(v20, "boundingRectWithSize:options:context:", 1, 0, a3 - (v18 + v19), 1.79769313e308);
    double v22 = v21;
    double v24 = v23;

    double v25 = v8 + floor((v10 - v22) * 0.5);
    CGFloat v26 = 0.0;
  }
  else
  {
    double v25 = *v11;
    CGFloat v26 = v11[1];
    double v24 = v12;
    double v22 = v13;
  }
  v27 = [(CKTranscriptLabelCell *)self label];
  uint64_t v28 = [(CKTranscriptLabelCell *)self label];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(CKTranscriptLabelCell *)self label];
    v31 = [v30 attributedText];

    if (v31)
    {
      v32 = [(CKTranscriptLabelCell *)self label];
      v33 = [v32 attributedText];
      objc_msgSend(v33, "boundingRectWithSize:options:context:", 1, 0, a3, 1.79769313e308);
      double v13 = v34;
      double v12 = v35;
    }
  }
  v78.origin.x = v25;
  v78.origin.y = v26;
  v78.size.width = v22;
  v78.size.height = v24;
  double MaxY = CGRectGetMaxY(v78);
  double v37 = 0.0;
  if (v24 > 0.0) {
    double v37 = v74;
  }
  double v73 = v25;
  double v75 = v26;
  double v38 = v37 + MaxY;
  double v39 = v12;
  double v40 = v13;
  double v69 = v24;
  double r2 = v22;
  double v41 = v70 + floor((v10 - v13) * 0.5);
  [v27 setNumberOfLines:0];
  v42 = [(CKTranscriptReportSpamCell *)self reportSpamButton];
  objc_msgSend(v42, "sizeThatFits:", a3, 1.79769313e308);
  double v44 = v43;
  double v68 = v45;
  double v46 = v70 + floor((v10 - v43) * 0.5);
  v79.origin.x = v41;
  v79.origin.y = v38;
  v79.size.width = v13;
  v79.size.height = v39;
  double v47 = CGRectGetMaxY(v79);
  v48 = [v42 configuration];
  v49 = [v48 background];
  [v49 cornerRadius];
  double v51 = v47 + v50 * 0.5;

  if (a4)
  {
    CGFloat v52 = v69;
    -[UILabel setFrame:](self->_internalPhishingWarningLabel, "setFrame:", v73, v75, r2, v69);
    objc_msgSend(v27, "setFrame:", v41, v38, v40, v39);
    double v71 = v41;
    double v53 = v38;
    double v54 = v40;
    double v55 = v68;
    objc_msgSend(v42, "setFrame:", v46, v51, v44, v68);
    objc_msgSend(v42, "__ck_ensureMinimumTouchInsets");
    double v56 = v46;
    double v57 = v39;
    double v58 = v53;
    double v41 = v71;
  }
  else
  {
    double v56 = v46;
    double v57 = v39;
    double v58 = v38;
    double v54 = v13;
    double v55 = v68;
    CGFloat v52 = v69;
  }
  double v59 = v41;
  double v60 = v54;
  double v61 = v51;
  double v62 = v44;
  double v63 = v55;
  CGRect v80 = CGRectUnion(*(CGRect *)(&v58 - 1), *(CGRect *)&v56);
  v82.origin.x = v73;
  v82.origin.y = v75;
  v82.size.width = r2;
  v82.size.height = v52;
  CGRect v81 = CGRectUnion(v80, v82);
  double v64 = 0.0;
  if (44.0 - v55 > 0.0) {
    double v64 = (44.0 - v55) * 0.5;
  }
  CGFloat v65 = v81.size.height + v64;

  double v66 = a3;
  double v67 = v65;
  result.height = v67;
  result.width = v66;
  return result;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptReportSpamCell;
  [(CKTranscriptStampCell *)&v7 addFilter:v4];
  v5 = [(CKTranscriptReportSpamCell *)self reportSpamButton];
  [v4 contentAlpha];
  objc_msgSend(v5, "setAlpha:");
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  if (internalPhishingWarningLabel)
  {
    [v4 contentAlpha];
    -[UILabel setAlpha:](internalPhishingWarningLabel, "setAlpha:");
  }
}

- (void)clearFilters
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptReportSpamCell;
  [(CKTranscriptStampCell *)&v5 clearFilters];
  double v3 = [(CKTranscriptReportSpamCell *)self reportSpamButton];
  [v3 setAlpha:1.0];
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  if (internalPhishingWarningLabel) {
    [(UILabel *)internalPhishingWarningLabel setAlpha:1.0];
  }
}

- (void)setAttributedButtonText:(id)a3
{
  id v6 = a3;
  id v4 = [(CKTranscriptReportSpamCell *)self attributedButtonText];

  if (v4 != v6)
  {
    objc_super v5 = [(CKTranscriptReportSpamCell *)self reportSpamButton];
    [v5 setAttributedTitle:v6 forState:0];

    [(CKTranscriptReportSpamCell *)self setNeedsLayout];
  }
}

- (NSAttributedString)attributedButtonText
{
  v2 = [(CKTranscriptReportSpamCell *)self reportSpamButton];
  double v3 = [v2 attributedTitleForState:0];

  return (NSAttributedString *)v3;
}

+ (id)internalPhishingWarningLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setNumberOfLines:0];
  [v4 setTextAlignment:1];
  objc_super v5 = [a1 internalPhishingWarning];
  [v4 setAttributedText:v5];

  return v4;
}

+ (NSAttributedString)internalPhishingWarning
{
  v2 = +[CKUIBehavior sharedBehaviors];
  id v3 = [v2 phishingWarningTextAttributes];

  id v4 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
  objc_super v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:v4];
  id v6 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v5];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttachment:v6 attributes:v3];
  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v9 = [@" " stringByAppendingString:*MEMORY[0x1E4F6E4B0]];
  double v10 = (void *)[v8 initWithString:v9 attributes:v3];

  [v7 appendAttributedString:v10];

  return (NSAttributedString *)v7;
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptReportSpamCell;
  [(CKTranscriptStampCell *)&v9 prepareForReuse];
  int v3 = IMShouldHandleInternalPhishingAttempts();
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  if (internalPhishingWarningLabel && (v3 & 1) == 0)
  {
    [(UILabel *)self->_internalPhishingWarningLabel removeFromSuperview];
    objc_super v5 = self->_internalPhishingWarningLabel;
    self->_internalPhishingWarningLabel = 0;
LABEL_9:

    [(CKTranscriptReportSpamCell *)self setNeedsLayout];
    return;
  }
  if (internalPhishingWarningLabel) {
    int v6 = 0;
  }
  else {
    int v6 = v3;
  }
  if (v6 == 1)
  {
    objc_super v7 = [(id)objc_opt_class() internalPhishingWarningLabel];
    id v8 = self->_internalPhishingWarningLabel;
    self->_internalPhishingWarningLabel = v7;

    objc_super v5 = [(CKEditableCollectionViewCell *)self contentView];
    [v5 addSubview:self->_internalPhishingWarningLabel];
    goto LABEL_9;
  }
}

- (UIButton)reportSpamButton
{
  return self->_reportSpamButton;
}

- (void)setReportSpamButton:(id)a3
{
}

- (BOOL)showReportSMSSpam
{
  return self->_showReportSMSSpam;
}

- (void)setShowReportSMSSpam:(BOOL)a3
{
  self->_showReportSMSSpam = a3;
}

- (UILabel)internalPhishingWarningLabel
{
  return self->_internalPhishingWarningLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPhishingWarningLabel, 0);

  objc_storeStrong((id *)&self->_reportSpamButton, 0);
}

@end