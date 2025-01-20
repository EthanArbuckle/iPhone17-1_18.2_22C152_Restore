@interface SendMenuCollectionViewCell
- (CGPoint)center;
- (CGRect)accessibilityFrame;
- (_TtC7ChatKit26SendMenuCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7ChatKit26SendMenuCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCenter:(CGPoint)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SendMenuCollectionViewCell

- (_TtC7ChatKit26SendMenuCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit26SendMenuCollectionViewCell *)SendMenuCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendMenuCollectionViewCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(SendMenuCollectionViewCell *)&v6 traitCollectionDidChange:v4];
  sub_18F5EEDD4();
  sub_18F5F0C78();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_18F5EFCD0((uint64_t)a4, x, y);

  return v10;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_18F7B6A10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6A00();
  id v8 = self;
  sub_18F5EFF34((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CGRect)accessibilityFrame
{
  v2 = self;
  sub_18F5EFB28();
  -[SendMenuCollectionViewCell convertRect:toView:](v2, sel_convertRect_toView_, 0);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (_TtC7ChatKit26SendMenuCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F5F3D68();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F5F1314();
}

- (CGPoint)center
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SendMenuCollectionViewCell();
  [(SendMenuCollectionViewCell *)&v4 center];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SendMenuCollectionViewCell();
  double v5 = (char *)v9.receiver;
  -[SendMenuCollectionViewCell setCenter:](&v9, sel_setCenter_, x, y);
  double v6 = &v5[OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuCellDelegate];
  swift_beginAccess();
  if (MEMORY[0x192FBC390](v6))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 8))(v5, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)prepareForReuse
{
  double v2 = self;
  sub_18F5F3110();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_titleBlurContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconBlurContainerView));
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuCellDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToEdgeHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToLabelHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageForLightMode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuCustomIconLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageForDarkMode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageCompositingFilterForLightMode));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageCompositingFilterForDarkMode);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  objc_super v9 = (void *)_s7ChatKit26SendMenuCollectionViewCellC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0lI0C_So0L6RegionCtF_0();

  return v9;
}

@end