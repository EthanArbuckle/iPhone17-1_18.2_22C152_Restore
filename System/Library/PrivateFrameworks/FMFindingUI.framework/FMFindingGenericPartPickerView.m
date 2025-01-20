@interface FMFindingGenericPartPickerView
- (_TtC11FMFindingUI30FMFindingGenericPartPickerView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI30FMFindingGenericPartPickerView)initWithFrame:(CGRect)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
@end

@implementation FMFindingGenericPartPickerView

- (_TtC11FMFindingUI30FMFindingGenericPartPickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D2BBA80();
}

- (_TtC11FMFindingUI30FMFindingGenericPartPickerView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI30FMFindingGenericPartPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_effectBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_containerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_iconView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_style);
  v4 = *(_UITraitChangeRegistry **)((char *)&self->super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_style);
  objc_release(*(id *)((char *)&self->super.super._layerRetained
                     + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_style));

  swift_bridgeObjectRelease();
  sub_24D2BBFB4((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI30FMFindingGenericPartPickerView_value, &qword_269860AA8);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_24D2BBC84();

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = sub_24D2BBDD8();

  return v7;
}

@end