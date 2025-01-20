@interface DUDebugInfo
- (NSString)debugString;
- (_TtC21DocumentUnderstanding11DUDebugInfo)init;
- (_TtC21DocumentUnderstanding11DUDebugInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugString:(id)a3;
@end

@implementation DUDebugInfo

- (NSString)debugString
{
  DUDebugInfo.debugString.getter();
  v2 = (void *)sub_23697AF3C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setDebugString:(id)a3
{
  uint64_t v4 = sub_23697AF6C();
  uint64_t v6 = v5;
  v7 = self;
  DUDebugInfo.debugString.setter(v4, v6);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUDebugInfo.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  uint64_t v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUDebugInfo.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)DUDebugInfo.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)init
{
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)DUDebugInfo.init()();
}

- (void).cxx_destruct
{
}

@end