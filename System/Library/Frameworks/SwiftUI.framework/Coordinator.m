@interface Coordinator
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator)init;
- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator)init;
- (_TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator)init;
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator)init;
- (_TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator)init;
- (_TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)editingBegan:(id)a3;
- (void)editingDidBegin:(id)a3;
- (void)editingDidEnd:(id)a3;
- (void)editingEnded:(id)a3;
- (void)menuActionTriggered:(id)a3;
- (void)pageDidChange:(id)a3;
- (void)primaryActionTriggered:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)textDidChange:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)valueChanged:(id)a3;
@end

@implementation Coordinator

- (void)dealloc
{
  v2 = self;
  Coordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->configuration[OBJC_IVAR____TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator_configuration
                                     + 56];
  uint64_t v3 = self->configuration[OBJC_IVAR____TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator_configuration + 64];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  outlined consume of Environment<Color?>.Content(v2, v3);
}

- (void)primaryActionTriggered:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator_action);
  if (v3)
  {
    MEMORY[0x1F4188790](self);
    id v6 = v5;
    v7 = self;
    outlined copy of AppIntentExecutor?(v3);
    static Update.dispatchImmediately<A>(_:)();
    outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(v3);
  }
}

- (void)menuActionTriggered:(id)a3
{
  id v4 = a3;
  id v6 = self;
  id v5 = Coordinator.makeMenu()();
  objc_msgSend(v4, sel_setMenu_, v5);

  Coordinator.setupNotifications(_:)();
}

- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator)init
{
  result = (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F711Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)valueChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Coordinator.valueChanged(_:)(v4);
}

- (void)editingBegan:(id)a3
{
  id v4 = a3;
  id v5 = self;
  static Update.dispatchImmediately<A>(_:)();
}

- (void)editingEnded:(id)a3
{
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator_isUpdating) = 0;
  id v4 = a3;
  id v5 = self;
  static Update.dispatchImmediately<A>(_:)();
}

- (_TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator)init
{
  result = (_TtC7SwiftUIP33_F1E9485F33A623EEFA647AA5EC4AE09411Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator_lastIDs))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)MEMORY[0x18C115780](0xD00000000000001CLL, 0x800000018832DE90);
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v14 = objc_msgSend(v10, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v12, isa);

  Coordinator.configureCell(_:at:)(v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  specialized Coordinator.collectionView(_:targetContentOffsetForProposedContentOffset:)(v5);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  objc_msgSend(a3, sel_bounds);
  double v11 = v10;
  double v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Coordinator.scrollViewDidScroll(_:)(v4);
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator)init
{
  CGSize result = (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF011Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pageDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_msgSend(v4, sel_interactionState);
  static Update.dispatchImmediately<A>(_:)();
}

- (_TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator)init
{
  CGSize result = (_TtC7SwiftUIP33_59ABB005D29F0E32A3A965407533FE0D11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)textDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Coordinator.textDidChange(_:)(v4);
}

- (void)editingDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  static Update.dispatchImmediately<A>(_:)();
}

- (void)editingDidEnd:(id)a3
{
  id v4 = a3;
  id v5 = self;
  static Update.dispatchImmediately<A>(_:)();
}

- (_TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator)init
{
  CGSize result = (_TtC7SwiftUIP33_87E15EBB5C00F49DEF8C638A73559D9211Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Coordinator.textFieldDidChangeSelection(_:)((uint64_t)v4);
}

- (_TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator)init
{
  CGSize result = (_TtC7SwiftUIP33_8AA246B2E0E916EFA5AD706DCC8A0FE811Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end