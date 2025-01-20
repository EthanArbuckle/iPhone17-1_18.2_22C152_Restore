@interface CKTapbackPileViewModel
+ (int64_t)maxDisplayCount;
- (BOOL)leftLayoutDirection;
- (BOOL)showBottomPeekPlatter;
- (BOOL)useTailOffset;
- (CKAggregateAcknowledgmentChatItem)aggregateAcknowledgmentChatItem;
- (CKTapbackPileViewModel)init;
- (CKTapbackPileViewModel)initWithAggregateAcknowledgmentChatItem:(id)a3;
- (IMTapback)sentTapback;
- (NSArray)tapbackChatItems;
- (int64_t)totalDisplayCount;
- (void)setLeftLayoutDirection:(BOOL)a3;
- (void)setShowBottomPeekPlatter:(BOOL)a3;
- (void)setTotalDisplayCount:(int64_t)a3;
- (void)setUseTailOffset:(BOOL)a3;
@end

@implementation CKTapbackPileViewModel

- (int64_t)totalDisplayCount
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTapbackPileViewModel_totalDisplayCount);
  swift_beginAccess();
  return *v2;
}

- (void)setTotalDisplayCount:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKTapbackPileViewModel_totalDisplayCount);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)leftLayoutDirection
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_leftLayoutDirection;
  swift_beginAccess();
  return *v2;
}

- (void)setLeftLayoutDirection:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_leftLayoutDirection;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)useTailOffset
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_useTailOffset;
  swift_beginAccess();
  return *v2;
}

- (void)setUseTailOffset:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_useTailOffset;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)showBottomPeekPlatter
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_showBottomPeekPlatter;
  swift_beginAccess();
  return *v2;
}

- (void)setShowBottomPeekPlatter:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPileViewModel_showBottomPeekPlatter;
  swift_beginAccess();
  BOOL *v4 = a3;
}

+ (int64_t)maxDisplayCount
{
  return 3;
}

- (NSArray)tapbackChatItems
{
  sub_18F554E8C();
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (CKAggregateAcknowledgmentChatItem)aggregateAcknowledgmentChatItem
{
  return (CKAggregateAcknowledgmentChatItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___CKTapbackPileViewModel_aggregateAcknowledgmentChatItem));
}

- (IMTapback)sentTapback
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackPileViewModel_aggregateAcknowledgmentChatItem);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_sentTapbackChatItem);
  id v5 = objc_msgSend(v4, sel_tapback);

  return (IMTapback *)v5;
}

- (CKTapbackPileViewModel)initWithAggregateAcknowledgmentChatItem:(id)a3
{
  id v3 = a3;
  id v4 = (CKTapbackPileViewModel *)sub_18F5548E4(v3);

  return v4;
}

- (CKTapbackPileViewModel)init
{
  result = (CKTapbackPileViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackPileViewModel_aggregateAcknowledgmentChatItem);
}

@end