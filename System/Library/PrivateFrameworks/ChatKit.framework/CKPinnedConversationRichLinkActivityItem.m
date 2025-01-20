@interface CKPinnedConversationRichLinkActivityItem
- (BOOL)activityItemAppearsWithAnimation;
- (BOOL)activityItemDisappearsWithAnimation;
- (CKPinnedConversationRichLinkActivityItem)initWithLinkView:(id)a3;
- (CKPinnedConversationRichLinkActivityItem)initWithMessage:(id)a3 chatContext:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6;
- (IMChatContext)chatContext;
- (IMMessage)message;
- (LPLinkView)linkView;
- (NSString)activityItemIdentifier;
- (NSString)attachedContactItemIdentifier;
- (double)activityItemContentScale;
- (id)activityItemView;
- (id)linkPreviewContentView;
@end

@implementation CKPinnedConversationRichLinkActivityItem

- (CKPinnedConversationRichLinkActivityItem)initWithMessage:(id)a3 chatContext:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKPinnedConversationRichLinkActivityItem;
  v14 = [(CKPinnedConversationRichLinkActivityItem *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_chatContext, a4);
    v15->_activityItemContentScale = a5;
    uint64_t v16 = [v13 copy];
    attachedContactItemIdentifier = v15->_attachedContactItemIdentifier;
    v15->_attachedContactItemIdentifier = (NSString *)v16;
  }
  return v15;
}

- (CKPinnedConversationRichLinkActivityItem)initWithLinkView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationRichLinkActivityItem;
  v6 = [(CKPinnedConversationRichLinkActivityItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_linkView, a3);
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
  v2 = [[CKPinnedConversationRichLinkBubble alloc] initWithRichLinkActivityItem:self];

  return v2;
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

- (id)linkPreviewContentView
{
  v3 = [(CKPinnedConversationRichLinkActivityItem *)self message];

  if (v3)
  {
    v4 = [(CKPinnedConversationRichLinkActivityItem *)self message];
    id v5 = [(CKPinnedConversationRichLinkActivityItem *)self chatContext];
    v6 = [v4 richLinkDataSourceWithChatContext:v5];

    id v7 = objc_alloc(MEMORY[0x1E4F30A98]);
    v8 = [v6 url];
    objc_super v9 = (void *)[v7 initWithURL:v8];

    v10 = [v6 richLinkMetadata];
    [v9 setMetadata:v10];

    [v9 _setPreferredSizeClass:7];
    [v9 _setApplyCornerRadius:0];
    [v9 _setDisableTapGesture:1];
    [v9 _setDisableAnimations:1];
    [v9 _setForceFlexibleWidth:1];
  }
  else
  {
    objc_super v9 = [(CKPinnedConversationRichLinkActivityItem *)self linkView];

    if (v9)
    {
      objc_super v9 = [(CKPinnedConversationRichLinkActivityItem *)self linkView];
    }
  }

  return v9;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (IMChatContext)chatContext
{
  return self->_chatContext;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_chatContext, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end