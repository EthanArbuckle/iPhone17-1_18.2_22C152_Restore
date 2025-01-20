@interface CKPinnedConversationSummaryBubbleActivityItem
- (BOOL)activityItemAppearsWithAnimation;
- (BOOL)activityItemDisappearsWithAnimation;
- (CKPinnedConversationSummaryBubbleActivityItem)initWithMessage:(id)a3 chat:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6;
- (CKPinnedConversationSummaryBubbleActivityItem)initWithSummaryText:(id)a3;
- (IMChat)chat;
- (IMMessage)message;
- (NSAttributedString)summaryText;
- (NSString)activityItemIdentifier;
- (NSString)attachedContactItemIdentifier;
- (double)activityItemContentScale;
- (id)activityItemView;
- (id)summaryAttributedStringForContentScale:(int64_t)a3 userInterfaceStyle:(int64_t)a4;
- (id)summaryLabelFontForContentScale:(int64_t)a3;
- (id)summaryLabelTextColorForUserInterfaceStyle:(int64_t)a3;
@end

@implementation CKPinnedConversationSummaryBubbleActivityItem

- (CKPinnedConversationSummaryBubbleActivityItem)initWithMessage:(id)a3 chat:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKPinnedConversationSummaryBubbleActivityItem;
  v14 = [(CKPinnedConversationSummaryBubbleActivityItem *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_chat, a4);
    v15->_activityItemContentScale = a5;
    uint64_t v16 = [v13 copy];
    attachedContactItemIdentifier = v15->_attachedContactItemIdentifier;
    v15->_attachedContactItemIdentifier = (NSString *)v16;
  }
  return v15;
}

- (CKPinnedConversationSummaryBubbleActivityItem)initWithSummaryText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationSummaryBubbleActivityItem;
  v6 = [(CKPinnedConversationSummaryBubbleActivityItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_summaryText, a3);
  }

  return v7;
}

- (NSString)activityItemIdentifier
{
  return (NSString *)[(IMMessage *)self->_message guid];
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 1;
}

- (id)activityItemView
{
  v2 = [[CKPinnedConversationSummaryBubble alloc] initWithSummaryBubbleActivityItem:self];

  return v2;
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

- (id)summaryLabelFontForContentScale:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = (id)*MEMORY[0x1E4F438C8];
    v4 = +[CKUIBehavior sharedBehaviors];
    [v4 conversationListPinnedConversationPreviewFontSizeOverrideLarge];
    goto LABEL_5;
  }
  if (!a3)
  {
    id v3 = (id)*MEMORY[0x1E4F43890];
    v4 = +[CKUIBehavior sharedBehaviors];
    [v4 conversationListPinnedConversationPreviewFontSizeOverrideStandard];
LABEL_5:
    double v6 = v5;

    goto LABEL_7;
  }
  id v3 = 0;
  double v6 = 0.0;
LABEL_7:
  v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v3 addingSymbolicTraits:0x8000 options:1];
  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:v6];

  return v8;
}

- (id)summaryLabelTextColorForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2)
    {
      double v6 = 0;
      goto LABEL_7;
    }
    id v3 = (void *)MEMORY[0x1E4F428B8];
    double v4 = 0.9;
    double v5 = 1.0;
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F428B8];
    double v4 = 0.8;
    double v5 = 0.0;
  }
  double v6 = [v3 colorWithWhite:v5 alpha:v4];
LABEL_7:

  return v6;
}

- (id)summaryAttributedStringForContentScale:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  v7 = [(CKPinnedConversationSummaryBubbleActivityItem *)self message];
  v8 = [(CKPinnedConversationSummaryBubbleActivityItem *)self chat];
  objc_msgSend(v7, "__ck_previewTextWithChat:", v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = [(CKPinnedConversationSummaryBubbleActivityItem *)self summaryText];

  if (v10)
  {
    id v11 = [(CKPinnedConversationSummaryBubbleActivityItem *)self summaryText];

    id v9 = v11;
    id v12 = v9;
  }
  else
  {
    id v13 = [(CKPinnedConversationSummaryBubbleActivityItem *)self summaryLabelFontForContentScale:a3];
    v14 = [(CKPinnedConversationSummaryBubbleActivityItem *)self summaryLabelTextColorForUserInterfaceStyle:a4];
    v15 = objc_alloc_init(CKPreviewTextDisplayContext);
    [(CKPreviewTextDisplayContext *)v15 setBaseTextFont:v13];
    [(CKPreviewTextDisplayContext *)v15 setBaseTextColor:v14];
    uint64_t v16 = (void *)MEMORY[0x1E4FB08E0];
    v17 = [v13 fontDescriptor];
    v18 = [v17 fontDescriptorWithSymbolicTraits:2];
    objc_super v19 = [v16 fontWithDescriptor:v18 size:0.0];
    [(CKPreviewTextDisplayContext *)v15 setMentionsFont:v19];

    v20 = +[CKUIBehavior sharedBehaviors];
    v21 = [v20 theme];
    v22 = [v21 meMentionTextColor];
    [(CKPreviewTextDisplayContext *)v15 setMentionsColor:v22];

    id v12 = CKPreviewTextForDisplay(v9, v15);
  }

  return v12;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (IMChat)chat
{
  return self->_chat;
}

- (NSAttributedString)summaryText
{
  return self->_summaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end