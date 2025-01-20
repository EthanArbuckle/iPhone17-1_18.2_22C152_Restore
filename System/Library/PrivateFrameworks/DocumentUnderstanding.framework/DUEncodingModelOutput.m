@interface DUEncodingModelOutput
- (BOOL)isEqual:(id)a3;
- (_TtC21DocumentUnderstanding21DUEncodingModelOutput)init;
- (_TtC21DocumentUnderstanding21DUEncodingModelOutput)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DUEncodingModelOutput

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUEncodingModelOutput.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23697B5DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = DUEncodingModelOutput.isEqual(_:)((uint64_t)v8);

  sub_2367BAA28((uint64_t)v8, (uint64_t *)&unk_26AD8BC30);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUEncodingModelOutput.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding21DUEncodingModelOutput)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding21DUEncodingModelOutput *)DUEncodingModelOutput.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding21DUEncodingModelOutput)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end