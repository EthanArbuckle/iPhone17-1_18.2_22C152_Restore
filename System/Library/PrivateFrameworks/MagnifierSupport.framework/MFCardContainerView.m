@interface MFCardContainerView
- (void)layoutSubviews;
- (void)updateAppearanceForReduceTransparency:(id)a3;
@end

@implementation MFCardContainerView

- (void)updateAppearanceForReduceTransparency:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF12EA0);
  MEMORY[0x270FA5388](v5 - 8, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_235947498();
    uint64_t v12 = sub_2359474C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2359474C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_2358FE54C();

  sub_2358FEA20((uint64_t)v11);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2358FE738();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_card));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_draggableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_backgroundBlur));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_internalDraggableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_shadowView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_backdropView);
}

@end