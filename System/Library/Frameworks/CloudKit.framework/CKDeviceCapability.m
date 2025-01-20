@interface CKDeviceCapability
+ (BOOL)isCapabilitySet:(id)a3 equalTo:(id)a4;
+ (BOOL)isCapabilitySet:(id)a3 subsetOf:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)fromSqliteRepresentation:(id)a3;
+ (id)fromSqliteRepresentations:(id)a3;
+ (id)pruneAndSort:(id)a3;
+ (id)sqliteRepresentations:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKDeviceCapability)init;
- (CKDeviceCapability)initWithCoder:(id)a3;
- (CKDeviceCapability)initWithLevel:(int)a3 name:(id)a4 value:(id)a5;
- (NSString)description;
- (NSString)name;
- (NSString)value;
- (id)sqliteRepresentation;
- (int)level;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDeviceCapability

- (CKDeviceCapability)init
{
  return (CKDeviceCapability *)sub_18AF56548();
}

- (CKDeviceCapability)initWithLevel:(int)a3 name:(id)a4 value:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  CKDeviceCapability.init(level:name:value:)();
  return result;
}

- (NSString)name
{
  return (NSString *)sub_18AF5A360(self, (uint64_t)a2, CKDeviceCapability.name.getter);
}

- (NSString)value
{
  return (NSString *)sub_18AF5A360(self, (uint64_t)a2, CKDeviceCapability.value.getter);
}

- (int)level
{
  return CKDeviceCapability.level.getter();
}

- (id)sqliteRepresentation
{
  return sub_18AF5A360(self, (uint64_t)a2, (uint64_t (*)(void))CKDeviceCapability.sqliteRepresentation());
}

+ (id)fromSqliteRepresentation:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = (void *)static CKDeviceCapability.fromSqliteRepresentation(_:)();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)sqliteRepresentations:(id)a3
{
  type metadata accessor for CKDeviceCapability((uint64_t)a1);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static CKDeviceCapability.sqliteRepresentations(_:)();
  swift_bridgeObjectRelease();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

+ (id)fromSqliteRepresentations:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static CKDeviceCapability.fromSqliteRepresentations(_:)(v3);
  uint64_t v4 = swift_bridgeObjectRelease();
  type metadata accessor for CKDeviceCapability(v4);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

+ (BOOL)isCapabilitySet:(id)a3 equalTo:(id)a4
{
  return sub_18AF57E78((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))static CKDeviceCapability.isCapabilitySet(_:equalTo:));
}

+ (BOOL)isCapabilitySet:(id)a3 subsetOf:(id)a4
{
  return sub_18AF57E78((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))static CKDeviceCapability.isCapabilitySet(_:subsetOf:));
}

+ (id)pruneAndSort:(id)a3
{
  type metadata accessor for CKDeviceCapability((uint64_t)a1);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static CKDeviceCapability.pruneAndSort(_:)(v3, v4, v5, v6, v7, v8, v9, v10);
  swift_bridgeObjectRelease();
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CKDeviceCapability.encode(with:)((NSCoder)v4);
}

- (CKDeviceCapability)initWithCoder:(id)a3
{
  return (CKDeviceCapability *)CKDeviceCapability.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF59CC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKDeviceCapability.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF5A360(self, (uint64_t)a2, CKDeviceCapability.description.getter);
}

- (void).cxx_destruct
{
}

@end