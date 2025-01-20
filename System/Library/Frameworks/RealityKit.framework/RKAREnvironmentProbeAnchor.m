@interface RKAREnvironmentProbeAnchor
- (_TtC10RealityKit26RKAREnvironmentProbeAnchor)initWithAnchor:(id)a3;
- (_TtC10RealityKit26RKAREnvironmentProbeAnchor)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithIdentifier:(uint64_t)a3 transform:name:hiddenFromPublicDelegate:;
- (void)initWithIdentifier:transform:;
- (void)initWithIdentifier:transform:extent:;
- (void)initWithIdentifier:transform:name:;
- (void)initWithName:transform:;
- (void)initWithName:transform:extent:;
- (void)initWithTransform:;
- (void)initWithTransform:extent:;
@end

@implementation RKAREnvironmentProbeAnchor

- (_TtC10RealityKit26RKAREnvironmentProbeAnchor)initWithAnchor:(id)a3
{
  return (_TtC10RealityKit26RKAREnvironmentProbeAnchor *)RKAREnvironmentProbeAnchor.init(anchor:)(a3);
}

- (_TtC10RealityKit26RKAREnvironmentProbeAnchor)initWithCoder:(id)a3
{
  return (_TtC10RealityKit26RKAREnvironmentProbeAnchor *)RKAREnvironmentProbeAnchor.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  RKAREnvironmentProbeAnchor.encode(with:)((NSCoder)v4);
}

- (void)initWithTransform:extent:
{
}

- (void)initWithName:transform:extent:
{
}

- (void)initWithTransform:
{
}

- (void)initWithName:transform:
{
}

- (void)initWithIdentifier:transform:
{
  uint64_t v0 = type metadata accessor for UUID();
  MEMORY[0x1F4188790](v0 - 8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:transform:name:
{
  uint64_t v0 = type metadata accessor for UUID();
  MEMORY[0x1F4188790](v0 - 8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:(uint64_t)a3 transform:name:hiddenFromPublicDelegate:
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v9 = 0;
    v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = 1;
  }
  (*v8)(v6, v9, 1, v7);
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:transform:extent:
{
  uint64_t v0 = type metadata accessor for UUID();
  MEMORY[0x1F4188790](v0 - 8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void).cxx_destruct
{
}

@end