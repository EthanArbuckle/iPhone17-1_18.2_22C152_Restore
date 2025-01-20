@interface AddressSelectionItemManager
- (_TtC6HomeUI27AddressSelectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
@end

@implementation AddressSelectionItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE54EE08();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC6HomeUI27AddressSelectionItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  result = (_TtC6HomeUI27AddressSelectionItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end