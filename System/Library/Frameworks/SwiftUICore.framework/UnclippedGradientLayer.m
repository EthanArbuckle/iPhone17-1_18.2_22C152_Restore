@interface UnclippedGradientLayer
- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer)init;
- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer)initWithCoder:(id)a3;
- (void)layoutSublayers;
@end

@implementation UnclippedGradientLayer

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer)init
{
  return (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer *)UnclippedGradientLayer.init()();
}

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSublayers
{
  v2 = self;
  id v3 = [(UnclippedGradientLayer *)v2 sublayers];
  if (!v3) {
    goto LABEL_10;
  }
  v4 = v3;
  type metadata accessor for CAPresentationModifier(0, (unint64_t *)&lazy cache variable for type metadata for CALayer);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x24C523D60](0, v5);
    goto LABEL_5;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  id v6 = *(id *)(v5 + 32);
LABEL_5:
  id v7 = v6;
  swift_bridgeObjectRelease();
  [(UnclippedGradientLayer *)v2 bounds];
  objc_msgSend(v7, sel_setFrame_);
}

@end