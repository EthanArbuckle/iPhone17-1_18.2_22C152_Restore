@interface FBKAddAttachmentsCell
+ (BOOL)supportsMenu;
- (CGRect)frame;
- (NSString)itemIdentifier;
- (UIMenu)menu;
- (_TtC12FeedbackCore21FBKAddAttachmentsCell)initWithCoder:(id)a3;
- (_TtC12FeedbackCore21FBKAddAttachmentsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)horizontalFrameInset;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalFrameInset:(double)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setMenu:(id)a3;
@end

@implementation FBKAddAttachmentsCell

+ (BOOL)supportsMenu
{
  return 0;
}

- (NSString)itemIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4 = sub_22A4B3458();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_itemIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UIMenu)menu
{
  result = *(UIMenu **)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button);
  if (result)
  {
    id v3 = [(UIMenu *)result menu];
    return (UIMenu *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setMenu:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button);
  if (v3) {
    objc_msgSend(v3, sel_setMenu_, a3);
  }
  else {
    __break(1u);
  }
}

- (double)horizontalFrameInset
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalFrameInset:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKAddAttachmentsCell();
  [(FBKAddAttachmentsCell *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset);
  swift_beginAccess();
  double v9 = x + *v8;
  double v10 = width - (*v8 + *v8);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKAddAttachmentsCell();
  -[FBKAddAttachmentsCell setFrame:](&v11, sel_setFrame_, v9, y, v10, height);
}

- (_TtC12FeedbackCore21FBKAddAttachmentsCell)initWithCoder:(id)a3
{
  double v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_itemIdentifier);
  *double v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_horizontalFrameInset) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKAddAttachmentsCell();
  return [(FBKAddAttachmentsCell *)&v6 initWithCoder:a3];
}

- (_TtC12FeedbackCore21FBKAddAttachmentsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_22A4B3458();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC12FeedbackCore21FBKAddAttachmentsCell *)sub_22A476E2C(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore21FBKAddAttachmentsCell_button);
}

@end