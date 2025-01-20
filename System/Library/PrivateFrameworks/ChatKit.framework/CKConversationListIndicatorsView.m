@interface CKConversationListIndicatorsView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)tintColor;
- (_TtC7ChatKit32CKConversationListIndicatorsView)initWithCoder:(id)a3;
- (_TtC7ChatKit32CKConversationListIndicatorsView)initWithFrame:(CGRect)a3;
- (double)verticalOffsetForCenteringVisibleIndicators;
- (double)widthForVisibleIndicators;
- (double)xOriginForCenteringWithTrailingSlot;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setOrientation:(int64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation CKConversationListIndicatorsView

- (double)xOriginForCenteringWithTrailingSlot
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorImageViews);
  swift_beginAccess();
  if (*v3 >> 62)
  {
    v8 = self;
    sub_18F7B6CA0();
    uint64_t v4 = sub_18F7BA5F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v5 = self;
  }
  if (qword_1E922B8E8 != -1) {
    swift_once();
  }
  double v6 = *(double *)&xmmword_1E922BB28;

  return ((double)v4 + -0.5) * v6;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18EF29014();
}

- (void)setOrientation:(int64_t)a3
{
  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_orientation);
  swift_beginAccess();
  int64_t v6 = *v5;
  int64_t *v5 = a3;
  if (v6 != a3)
  {
    v7 = self;
    [(CKConversationListIndicatorsView *)v7 setNeedsLayout];
    [(CKConversationListIndicatorsView *)v7 layoutIfNeeded];
  }
}

- (double)verticalOffsetForCenteringVisibleIndicators
{
  v2 = self;
  sub_18EF322B8();
  double v4 = v3;

  return v4;
}

- (double)widthForVisibleIndicators
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorConfiguration))
    uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorConfiguration);
  else {
    uint64_t v2 = MEMORY[0x1E4FBC860];
  }
  uint64_t v3 = *(void *)(v2 + 16);
  double v4 = self;
  sub_18F7B6CA0();
  swift_bridgeObjectRelease();
  if (qword_1E922B8E8 != -1) {
    swift_once();
  }
  double v5 = *(double *)&xmmword_1E922BB28;

  return v5 * (double)v3;
}

- (_TtC7ChatKit32CKConversationListIndicatorsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorConfiguration) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_orientation) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorImageViews) = (Class)MEMORY[0x1E4FBC860];
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CKConversationListIndicatorsView();
  v7 = -[CKConversationListIndicatorsView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  id v8 = [(CKConversationListIndicatorsView *)v7 layer];
  objc_msgSend(v8, sel_setMasksToBounds_, 0);

  sub_18EF444C4();
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = self;
  sub_18EF44F34();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (int64_t)orientation
{
  uint64_t v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_orientation);
  swift_beginAccess();
  return *v2;
}

- (_TtC7ChatKit32CKConversationListIndicatorsView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit32CKConversationListIndicatorsView *)sub_18F6E302C(a3);
}

- (CGSize)intrinsicContentSize
{
  -[CKConversationListIndicatorsView sizeThatFits:](self, sel_sizeThatFits_, 0.0, 0.0);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CKConversationListIndicatorsView();
  double v2 = [(CKConversationListIndicatorsView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_18F6E359C((uint64_t)a3);
}

- (void)prepareForReuse
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorConfiguration);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicatorConfiguration) = 0;
  sub_18F7B6CA0();
  objc_super v4 = self;
  sub_18EF32DB8(v3, 0);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end