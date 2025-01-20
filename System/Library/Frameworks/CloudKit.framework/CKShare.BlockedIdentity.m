@interface CKShare.BlockedIdentity
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtCE8CloudKitCSo7CKShare15BlockedIdentity)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation CKShare.BlockedIdentity

- (_TtCE8CloudKitCSo7CKShare15BlockedIdentity)init
{
}

- (NSString)description
{
  v2 = self;
  unint64_t v3 = CKShare.BlockedIdentity.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x18C128F60](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (id)copyWithZone:(void *)a3
{
  unint64_t v3 = self;
  CKShare.BlockedIdentity.copy(with:)(v6);

  sub_18AF25FCC(v6, v6[3]);
  uint64_t v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18AF40A30((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = CKShare.BlockedIdentity.isEqual(_:)((uint64_t)v8);

  sub_18AF551C4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  id v3 = CKShare.BlockedIdentity.hash.getter();

  return (int64_t)v3;
}

- (void).cxx_destruct
{
}

@end