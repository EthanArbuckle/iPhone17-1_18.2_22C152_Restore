@interface CKRequiredFeatureSet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKRequiredFeatureSet)init;
- (CKRequiredFeatureSet)initWithCoder:(id)a3;
- (CKRequiredFeatureSet)initWithZoneFeatures:(id)a3 recordFeatures:(id)a4 fieldFeatures:(id)a5;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (id)fieldFeatures;
- (id)recordFeatures;
- (id)zoneFeatures;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKRequiredFeatureSet

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (CKRequiredFeatureSet)initWithZoneFeatures:(id)a3 recordFeatures:(id)a4 fieldFeatures:(id)a5
{
  type metadata accessor for CKZoneFeature((uint64_t)self);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for CKRecordFeature(v5);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for CKFieldFeature(v6);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (CKRequiredFeatureSet *)CKRequiredFeatureSet.init(zoneFeatures:recordFeatures:fieldFeatures:)(v5, v6, v7);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  CKRequiredFeatureSet.copy(with:)((uint64_t)v3, v6);

  sub_18AF25FCC(v6, (uint64_t)v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18AF40A30((uint64_t)v6);
  return v4;
}

- (CKRequiredFeatureSet)init
{
  return (CKRequiredFeatureSet *)sub_18AF46400();
}

- (id)zoneFeatures
{
  v2 = self;
  id v3 = CKRequiredFeatureSet.zoneFeatures.getter();

  return v3;
}

- (id)recordFeatures
{
  v2 = self;
  id v3 = CKRequiredFeatureSet.recordFeatures.getter();

  return v3;
}

- (id)fieldFeatures
{
  v2 = self;
  id v3 = CKRequiredFeatureSet.fieldFeatures.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CKRequiredFeatureSet.encode(with:)((NSCoder)v4);
}

- (CKRequiredFeatureSet)initWithCoder:(id)a3
{
  return (CKRequiredFeatureSet *)CKRequiredFeatureSet.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF86FC0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKRequiredFeatureSet.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF87060(self, (uint64_t)a2, CKRequiredFeatureSet.description.getter);
}

@end