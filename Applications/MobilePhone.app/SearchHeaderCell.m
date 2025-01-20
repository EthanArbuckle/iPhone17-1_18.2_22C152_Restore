@interface SearchHeaderCell
- (_TtC11MobilePhone16SearchHeaderCell)initWithCoder:(id)a3;
- (_TtC11MobilePhone16SearchHeaderCell)initWithReuseIdentifier:(id)a3;
- (void)didSelectSeeAllButton;
- (void)handleContentSizeCategoryDidChange:(id)a3;
@end

@implementation SearchHeaderCell

- (_TtC11MobilePhone16SearchHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SearchHeaderCell.init(coder:)();
}

- (void)didSelectSeeAllButton
{
  id v3 = (void (**)(uint64_t))((char *)self + OBJC_IVAR____TtC11MobilePhone16SearchHeaderCell_seeAllTapHandler);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = self;
    uint64_t v6 = outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)v4);
    v4(v6);
    outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v4);
  }
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  SearchHeaderCell.updateConstraintsForAccessibility()();

  outlined destroy of Locale?((uint64_t)v7, &demangling cache variable for type metadata for Notification?);
}

- (_TtC11MobilePhone16SearchHeaderCell)initWithReuseIdentifier:(id)a3
{
  result = (_TtC11MobilePhone16SearchHeaderCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone16SearchHeaderCell_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone16SearchHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone16SearchHeaderCell_seeAllButton));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11MobilePhone16SearchHeaderCell_seeAllTapHandler);

  outlined consume of (@escaping @callee_guaranteed () -> ())?(v3);
}

@end