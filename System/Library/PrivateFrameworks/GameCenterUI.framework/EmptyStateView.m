@interface EmptyStateView
+ (_TtC12GameCenterUI14EmptyStateView)addAdditionalFriendsEmptyStateView;
+ (_TtC12GameCenterUI14EmptyStateView)addFriendsEmptyStateView;
+ (_TtC12GameCenterUI14EmptyStateView)addFriendsEmptyStateViewTVOS;
+ (_TtC12GameCenterUI14EmptyStateView)addFriendsWithButtonEmptyStateView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI14EmptyStateView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI14EmptyStateView)initWithFrame:(CGRect)a3;
- (id)buttonActionBlock;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
- (void)setButtonActionBlock:(id)a3;
@end

@implementation EmptyStateView

+ (_TtC12GameCenterUI14EmptyStateView)addFriendsEmptyStateView
{
  swift_getObjCClassMetadata();
  id v2 = static EmptyStateView.addFriendsEmptyStateView.getter();

  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

+ (_TtC12GameCenterUI14EmptyStateView)addFriendsWithButtonEmptyStateView
{
  swift_getObjCClassMetadata();
  id v2 = static EmptyStateView.addFriendsWithButtonEmptyStateView.getter();

  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

+ (_TtC12GameCenterUI14EmptyStateView)addFriendsEmptyStateViewTVOS
{
  swift_getObjCClassMetadata();
  id v2 = static EmptyStateView.addFriendsEmptyStateViewTVOS.getter();

  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

+ (_TtC12GameCenterUI14EmptyStateView)addAdditionalFriendsEmptyStateView
{
  swift_getObjCClassMetadata();
  id v2 = static EmptyStateView.addAdditionalFriendsEmptyStateView.getter();

  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

- (_TtC12GameCenterUI14EmptyStateView)initWithFrame:(CGRect)a3
{
  sub_1AF739BCC();
  return result;
}

- (_TtC12GameCenterUI14EmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF73A7D4();
}

- (id)buttonActionBlock
{
  uint64_t v2 = EmptyStateView.buttonActionBlock.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_96;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setButtonActionBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF73CB30;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  EmptyStateView.buttonActionBlock.setter((uint64_t)v4, v5);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1AF73C830();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  EmptyStateView.layoutSubviews()();
}

- (void)didTapButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1AF73B444();

  sub_1AF3A4630((uint64_t)v6, (uint64_t *)&unk_1E9AC4590);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  CGSize v6 = EmptyStateView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_secondaryLabel));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView____lazy_storage___focusGuide));
  sub_1AF3AED4C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_imageType));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_buttonActionBlock);

  sub_1AF368930(v3);
}

@end