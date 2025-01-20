@interface TapbackPickerCollectionViewCell
- (BOOL)isSelected;
- (CGPoint)center;
- (CGRect)tapbackContentContainerRect;
- (_TtC7ChatKit31TapbackPickerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7ChatKit31TapbackPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCenter:(CGPoint)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TapbackPickerCollectionViewCell

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  return [(TapbackPickerCollectionViewCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  id v4 = v5.receiver;
  [(TapbackPickerCollectionViewCell *)&v5 setSelected:v3];
  objc_msgSend(v4, sel_setNeedsLayout, v5.receiver, v5.super_class);
}

- (_TtC7ChatKit31TapbackPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit31TapbackPickerCollectionViewCell *)TapbackPickerCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F6BA534();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_18F7B6A10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6A00();
  v8 = self;
  sub_18F6BA70C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7ChatKit31TapbackPickerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F6BD230();
}

- (CGPoint)center
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  [(TapbackPickerCollectionViewCell *)&v4 center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  uint64_t v5 = (char *)v8.receiver;
  -[TapbackPickerCollectionViewCell setCenter:](&v8, sel_setCenter_, x, y);
  uint64_t v6 = &v5[OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackPickerCellDelegate];
  swift_beginAccess();
  v7 = (void *)MEMORY[0x192FBC390](v6);
  if (v7)
  {
    objc_msgSend(v7, sel_tapbackPickerCellCenterPointDidChange_, v5);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)prepareForReuse
{
  double v2 = self;
  sub_18F6BBED8();
}

- (CGRect)tapbackContentContainerRect
{
  [(TapbackPickerCollectionViewCell *)self bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackBlurContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_selectionPlatter));
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackPickerCellDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_gradientView));
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_gradientReferenceView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewTopConstraint));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewBottomConstraint);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  uint64_t v9 = (void *)_s7ChatKit31TapbackPickerCollectionViewCellC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0lI0C_So0L6RegionCtF_0();

  return v9;
}

@end