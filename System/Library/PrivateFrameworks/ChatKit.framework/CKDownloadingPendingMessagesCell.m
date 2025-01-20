@interface CKDownloadingPendingMessagesCell
- (CKDownloadingPendingMessagesCell)initWithFrame:(CGRect)a3;
- (CKDownloadingPendingMessagesView)pendingMessagesContentView;
- (NSAttributedString)pendingMessageCountAttributedText;
- (unint64_t)totalSatelliteMessageCount;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)setPendingMessageCountAttributedText:(id)a3;
- (void)setPendingMessagesContentView:(id)a3;
- (void)setTotalSatelliteMessageCount:(unint64_t)a3;
@end

@implementation CKDownloadingPendingMessagesCell

- (CKDownloadingPendingMessagesCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKDownloadingPendingMessagesCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CKDownloadingPendingMessagesView);
    v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v5 addSubview:v4];

    [(CKDownloadingPendingMessagesCell *)v3 setPendingMessagesContentView:v4];
  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  v12.receiver = self;
  v12.super_class = (Class)CKDownloadingPendingMessagesCell;
  [(CKEditableCollectionViewCell *)&v12 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKDownloadingPendingMessagesCell *)self pendingMessagesContentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setPendingMessageCountAttributedText:(id)a3
{
  double v5 = (NSAttributedString *)a3;
  p_pendingMessageCountAttributedText = &self->_pendingMessageCountAttributedText;
  if (self->_pendingMessageCountAttributedText != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_pendingMessageCountAttributedText, a3);
    double v7 = [(CKDownloadingPendingMessagesCell *)self pendingMessagesContentView];
    [v7 updateMessageCountWith:*p_pendingMessageCountAttributedText];

    double v5 = v8;
  }
}

- (NSAttributedString)pendingMessageCountAttributedText
{
  return self->_pendingMessageCountAttributedText;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

- (CKDownloadingPendingMessagesView)pendingMessagesContentView
{
  return self->_pendingMessagesContentView;
}

- (void)setPendingMessagesContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessagesContentView, 0);

  objc_storeStrong((id *)&self->_pendingMessageCountAttributedText, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDownloadingPendingMessagesCell;
  [(CKTranscriptCell *)&v26 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = [v12 IMChatItem];
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if (v9)
  {
    v14 = [v12 IMChatItem];
    uint64_t v15 = [v14 pendingIncomingSatelliteMessageCount];
    -[CKDownloadingPendingMessagesCell setTotalSatelliteMessageCount:](self, "setTotalSatelliteMessageCount:", [v14 totalSatelliteMessageCount]);
    unint64_t v16 = [(CKDownloadingPendingMessagesCell *)self totalSatelliteMessageCount] - v15 + 1;
    v17 = NSString;
    v18 = CKFrameworkBundle();
    v19 = [v18 localizedStringForKey:@"NUMBER_OF_REMAINING_PENDING_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
    v20 = objc_msgSend(v17, "localizedStringWithFormat:", v19, v16, -[CKDownloadingPendingMessagesCell totalSatelliteMessageCount](self, "totalSatelliteMessageCount"));

    v21 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v22 = [v21 userInterfaceLayoutDirection];

    if (v22 == 1) {
      v23 = @"\u200F";
    }
    else {
      v23 = @"\u200E";
    }
    v24 = [(__CFString *)v23 stringByAppendingString:v20];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v24];
    [(CKDownloadingPendingMessagesCell *)self setPendingMessageCountAttributedText:v25];
  }
}

@end