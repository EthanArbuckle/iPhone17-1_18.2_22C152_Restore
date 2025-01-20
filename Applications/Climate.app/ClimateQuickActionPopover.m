@interface ClimateQuickActionPopover
- (_TtC7Climate25ClimateQuickActionPopover)initWithCoder:(id)a3;
- (_TtC7Climate25ClimateQuickActionPopover)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDeepLinkButton:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
@end

@implementation ClimateQuickActionPopover

- (_TtC7Climate25ClimateQuickActionPopover)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100026264();
}

- (void)didTapDeepLinkButton:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    v6 = self;
    sub_100063D48();

    swift_unknownObjectRelease();
  }
}

- (_TtC7Climate25ClimateQuickActionPopover)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Climate25ClimateQuickActionPopover *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_sourceView));
  sub_10000D204((uint64_t)self + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_climateZone, (uint64_t (*)(void))type metadata accessor for ClimateZone);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_contentView));
  sub_100026DD0((uint64_t)self + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate25ClimateQuickActionPopover_popoverTapView);
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    sub_100064020(v10, 0);

    swift_unknownObjectRelease();
  }
}

@end