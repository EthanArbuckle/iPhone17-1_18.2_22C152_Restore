@interface LinkCreationCoordinator
- (BOOL)_customizationAvailableForActivityViewController:(id)a3;
- (_TtC15ConversationKit23LinkCreationCoordinator)init;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)customActionViewControllerForActivityViewController:(id)a3;
- (id)customLocalizedActionTitleForActivityViewController:(id)a3;
@end

@implementation LinkCreationCoordinator

- (_TtC15ConversationKit23LinkCreationCoordinator)init
{
}

- (void).cxx_destruct
{
  outlined destroy of unowned CNKCallDetailsDeferredPresentationManager((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23LinkCreationCoordinator_parentViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit23LinkCreationCoordinator_shareSheetViewController));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit23LinkCreationCoordinator_conversationLink);
  outlined consume of ConversationLink?(v3);
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  return 1;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for _UIActivityItemCustomizationGroup);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (id)customLocalizedActionTitleForActivityViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  Swift::String v6 = LinkCreationCoordinator.customLocalizedActionTitle(for:)((UIActivityViewController *)v5);

  v7 = (void *)MEMORY[0x1C87730B0](v6._countAndFlagsBits, v6._object);
  swift_bridgeObjectRelease();
  return v7;
}

- (id)customActionViewControllerForActivityViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  LinkCreationCoordinator.customActionViewController(for:)(v6, (UIActivityViewController *)v5);
  v8 = v7;

  return v8;
}

@end