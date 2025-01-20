@interface TransactionInternal
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC15ProximityReader19TransactionInternal)init;
- (_TtC15ProximityReader19TransactionInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TransactionInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  TransactionInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader19TransactionInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader19TransactionInternal *)TransactionInternal.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  TransactionInternal.description.getter();

  v3 = (void *)sub_228915C40();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC15ProximityReader19TransactionInternal)init
{
  result = (_TtC15ProximityReader19TransactionInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15ProximityReader19TransactionInternal_transactionDescriptionEncoded);
  unint64_t v4 = *(void *)&self->id[OBJC_IVAR____TtC15ProximityReader19TransactionInternal_transactionDescriptionEncoded];

  sub_22880BB6C(v3, v4);
}

@end