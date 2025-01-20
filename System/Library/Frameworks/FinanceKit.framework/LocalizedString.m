@interface LocalizedString
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC10FinanceKit15LocalizedString)init;
- (_TtC10FinanceKit15LocalizedString)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LocalizedString

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_243959140();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = LocalizedString.isEqual(_:)((uint64_t)v8);

  sub_2433C0974((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = LocalizedString.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10FinanceKit15LocalizedString)initWithCoder:(id)a3
{
  return (_TtC10FinanceKit15LocalizedString *)LocalizedString.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  LocalizedString.encode(with:)((NSCoder)v4);
}

- (_TtC10FinanceKit15LocalizedString)init
{
  result = (_TtC10FinanceKit15LocalizedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end