@interface DUDocumentAttribute
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC21DocumentUnderstanding19DUDocumentAttribute)init;
- (_TtC21DocumentUnderstanding19DUDocumentAttribute)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DUDocumentAttribute

+ (BOOL)supportsSecureCoding
{
  return static DUDocumentAttribute.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUDocumentAttribute.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUDocumentAttribute.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding19DUDocumentAttribute)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding19DUDocumentAttribute *)DUDocumentAttribute.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding19DUDocumentAttribute)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end