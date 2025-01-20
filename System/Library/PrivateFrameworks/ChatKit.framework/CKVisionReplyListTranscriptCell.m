@interface CKVisionReplyListTranscriptCell
- (CKVisionReplyListTranscriptCell)initWithFrame:(CGRect)a3;
- (CKVisionReplyListTranscriptCellDelegate)delegate;
- (NSArray)replies;
- (UIView)listView;
- (_TtC7ChatKit33QuickReplyButtonListConfiguration)configuration;
- (void)layoutSubviewsForAlignmentContents;
- (void)replyListButtonDidSelectReply:(id)a3 sourceView:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setListView:(id)a3;
- (void)setReplies:(id)a3;
@end

@implementation CKVisionReplyListTranscriptCell

- (CKVisionReplyListTranscriptCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKVisionReplyListTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(_TtC7ChatKit33QuickReplyButtonListConfiguration);
  configuration = v3->_configuration;
  v3->_configuration = v4;

  return v3;
}

- (void)setReplies:(id)a3
{
  p_replies = &self->_replies;
  id v19 = a3;
  if (![v19 isEqual:*p_replies]
    || (([(UIView *)self->_listView bounds],
         double v7 = v6,
         double v9 = v8,
         [(CKEditableCollectionViewCell *)self contentAlignmentRect],
         v7 == v11)
      ? (BOOL v12 = v9 == v10)
      : (BOOL v12 = 0),
        !v12))
  {
    objc_storeStrong((id *)&self->_replies, a3);
    [(UIView *)self->_listView removeFromSuperview];
    listView = self->_listView;
    self->_listView = 0;

    v14 = *p_replies;
    if (v14)
    {
      v15 = [(CKVisionReplyListTranscriptCell *)self configuration];
      v16 = +[QuickReplyButtonListHelper makeListView:v14 delegate:self configurationObject:v15];
      v17 = self->_listView;
      self->_listView = v16;

      v18 = [(CKEditableCollectionViewCell *)self contentView];
      [v18 addSubview:self->_listView];

      [(CKEditableCollectionViewCell *)self contentAlignmentRect];
      -[UIView setFrame:](self->_listView, "setFrame:");
    }
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  v12.receiver = self;
  v12.super_class = (Class)CKVisionReplyListTranscriptCell;
  [(CKEditableCollectionViewCell *)&v12 layoutSubviewsForAlignmentContents];
  if (CKIsRunningInMessagesNotificationExtension())
  {
    v3 = [(CKEditableCollectionViewCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v5 + 0.0, v7 + 0.0, v9 + -8.0, v11);
  }
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  -[UIView setFrame:](self->_listView, "setFrame:");
}

- (void)replyListButtonDidSelectReply:(id)a3 sourceView:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained replyListCell:self didSelectReply:v8 sourceView:v7];
}

- (NSArray)replies
{
  return self->_replies;
}

- (CKVisionReplyListTranscriptCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKVisionReplyListTranscriptCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC7ChatKit33QuickReplyButtonListConfiguration)configuration
{
  return self->_configuration;
}

- (UIView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_replies, 0);
}

@end