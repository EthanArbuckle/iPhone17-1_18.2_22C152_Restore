@interface MUIPriorityMessageListContainerCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MUIPriorityMessageListContainerCell)initWithCoder:(id)a3;
- (MUIPriorityMessageListContainerCell)initWithFrame:(CGRect)a3;
- (void)parentViewController:(id)a3 viewWillAppearWithTransitionCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)showBelowLineMessages:(BOOL)a3;
- (void)updateHighlightsSupplementaryViewContainerInsets:(NSDirectionalEdgeInsets)a3;
- (void)updateHighlightsSupplementaryViewMessages:(id)a3 mailboxes:(id)a4;
- (void)updateHighlightsSupplementaryViewMessages:(id)a3 mailboxes:(id)a4 cellLayoutValues:(id)a5 containerInsets:(NSDirectionalEdgeInsets)a6 contactStore:(id)a7 delegate:(id)a8;
@end

@implementation MUIPriorityMessageListContainerCell

- (MUIPriorityMessageListContainerCell)initWithFrame:(CGRect)a3
{
  return (MUIPriorityMessageListContainerCell *)PriorityMessageListContainerCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUIPriorityMessageListContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  PriorityMessageListContainerCell.init(coder:)();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  CGSize v6 = PriorityMessageListContainerCell.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)(a3, a4, a5);

  double width = v6.width;
  double height = v6.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  PriorityMessageListContainerCell.prepareForReuse()();
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___MUIPriorityMessageListContainerCell_contentSizeObserver));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___MUIPriorityMessageListContainerCell____lazy_storage___priorityMessageListViewController));
}

- (void)showBelowLineMessages:(BOOL)a3
{
  id v3 = self;
  char v4 = sub_1DDEECF58();
  PriorityMessageListContainerCell.show(belowLineMessages:)(v4 & 1);
}

- (void)updateHighlightsSupplementaryViewContainerInsets:(NSDirectionalEdgeInsets)a3
{
  id v3 = self;
  PriorityMessageListContainerCell.updateContainerInsets(_:)(a3);
}

- (void)updateHighlightsSupplementaryViewMessages:(id)a3 mailboxes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  type metadata accessor for MUIHighlightedMessage();
  uint64_t _ = sub_1DDEEEDA8();
  sub_1DDD79318();
  uint64_t v8 = sub_1DDEEEDA8();
  PriorityMessageListContainerCell.update(_:mailboxes:)((Swift::OpaquePointer)_, (Swift::OpaquePointer)v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateHighlightsSupplementaryViewMessages:(id)a3 mailboxes:(id)a4 cellLayoutValues:(id)a5 containerInsets:(NSDirectionalEdgeInsets)a6 contactStore:(id)a7 delegate:(id)a8
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  swift_unknownObjectRetain();
  v13 = self;
  type metadata accessor for MUIHighlightedMessage();
  uint64_t v17 = sub_1DDEEEDA8();
  sub_1DDD79318();
  uint64_t v15 = sub_1DDEEEDA8();
  PriorityMessageListContainerCell.update(_:mailboxes:cellLayoutValues:containerInsets:contactStore:delegate:)(v17, v15, a5, a7, (uint64_t)a8, a6.top, a6.leading, a6.bottom, a6.trailing);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)parentViewController:(id)a3 viewWillAppearWithTransitionCoordinator:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  PriorityMessageListContainerCell.parentViewController(_:viewWillAppearWith:)((uint64_t)a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

@end