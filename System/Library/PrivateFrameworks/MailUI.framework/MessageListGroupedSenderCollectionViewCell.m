@interface MessageListGroupedSenderCollectionViewCell
- (EFCancelable)messageListItemFetchTimeoutCancelable;
- (EMCollectionItemID)itemID;
- (EMMessageListItem)messageListItem;
- (_TtC6MailUI42MessageListGroupedSenderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC6MailUI42MessageListGroupedSenderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)messageListItemFuture;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)applyIndicatorPreviewChangeAction:(id)a3;
- (void)prepareForReuse;
- (void)setItemID:(id)a3;
- (void)setMessageListItem:(id)a3;
- (void)setMessageListItemFetchTimeoutCancelable:(id)a3;
- (void)setMessageListItemFuture:(id)a3;
- (void)updateWithMessageListItem:(id)a3 avatarResult:(id)a4 maximumPreviewLines:(int64_t)a5 hideAvatar:(BOOL)a6 displayName:(id)a7;
@end

@implementation MessageListGroupedSenderCollectionViewCell

- (EMCollectionItemID)itemID
{
  v2 = self;
  id v5 = (id)MessageListGroupedSenderCollectionViewCell.itemID.getter();

  return (EMCollectionItemID *)v5;
}

- (void)setItemID:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  MessageListGroupedSenderCollectionViewCell.itemID.setter((uint64_t)a3);
}

- (EMMessageListItem)messageListItem
{
  v2 = self;
  id v5 = (id)MessageListGroupedSenderCollectionViewCell.messageListItem.getter();

  return (EMMessageListItem *)v5;
}

- (void)setMessageListItem:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  MessageListGroupedSenderCollectionViewCell.messageListItem.setter((uint64_t)a3);
}

- (id)messageListItemFuture
{
  v2 = self;
  id v5 = MessageListGroupedSenderCollectionViewCell.messageListItemFuture.getter();

  return v5;
}

- (void)setMessageListItemFuture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MessageListGroupedSenderCollectionViewCell.messageListItemFuture.setter(a3);
}

- (EFCancelable)messageListItemFetchTimeoutCancelable
{
  v2 = self;
  id Timeout = (id)MessageListGroupedSenderCollectionViewCell.messageListItemFetchTimeoutCancelable.getter();

  return (EFCancelable *)Timeout;
}

- (void)setMessageListItemFetchTimeoutCancelable:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  MessageListGroupedSenderCollectionViewCell.messageListItemFetchTimeoutCancelable.setter((uint64_t)a3);
}

- (void)prepareForReuse
{
  v2 = self;
  MessageListGroupedSenderCollectionViewCell.prepareForReuse()();
}

- (void)updateWithMessageListItem:(id)a3 avatarResult:(id)a4 maximumPreviewLines:(int64_t)a5 hideAvatar:(BOOL)a6 displayName:(id)a7
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a7;
  v10 = self;
  char v14 = sub_1DDEECF58();
  uint64_t v11 = sub_1DDEEEB78();
  MessageListGroupedSenderCollectionViewCell.update(messageListItem:avatarResult:maximumPreviewLines:hideAvatar:displayName:)(a3, a4, a5, v14 & 1, v11, v12);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  v13 = self;
  id v12 = a3;
  uint64_t v11 = sub_1DDEED488();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v6 - v7;
  id v4 = (id)MEMORY[0x1F4188790](v12);
  id v5 = self;
  sub_1DDEED468();
  MessageListGroupedSenderCollectionViewCell.updateConfiguration(using:)(v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
}

- (void)applyIndicatorPreviewChangeAction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MessageListGroupedSenderCollectionViewCell.applyIndicatorPreviewChangeAction(_:)(a3);
}

- (_TtC6MailUI42MessageListGroupedSenderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI42MessageListGroupedSenderCollectionViewCell *)MessageListGroupedSenderCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI42MessageListGroupedSenderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI42MessageListGroupedSenderCollectionViewCell *)MessageListGroupedSenderCollectionViewCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListGroupedSenderCollectionViewCell_messageListItemFuture));
  sub_1DDD5C558();
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI42MessageListGroupedSenderCollectionViewCell_avatarResult));
  sub_1DDD31BC0();
}

@end